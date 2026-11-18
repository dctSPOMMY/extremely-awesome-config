{ ... }: {

	flake.nixosModules.zapret =

		{ pkgs, ... }: {
			
			environment.systemPackages = with pkgs; [
				zapret2
			];

			systemd.packages = with pkgs; [ zapret2 ];

			environment.etc = {

				"zapret2/yt.conf".text = ''
					...
				'';

				"zapret2/mc.conf".text = ''
					--qnum=200
					--lua-init=@${pkgs.zapret2}/share/zapret2/lua/zapret-antidpi.lua
					--filter-tcp=80 --filter-l7=http --payload=http_req --lua-desync=fakedsplit:pos=1,midsld
					--new
    					--filter-tcp=443 --filter-l7=tls --payload=tls_client_hello --lua-desync=multisplit:pos=2
    					--new
    					--filter-udp=443 --filter-l7=quic --payload=quic_initial --lua-desync=fake:blob=fake_default_quic:repeats=6
				'';

			};

			networking.nftables = {
				enable = true;
				tables.zapret2 = {
					family = "inet";
					content = ''
						chain output {
							type filter hook output priority mangle; policy accept;
							meta l4proto { tcp, udp } th dport { 80, 443 } queue num 200 bypass
						}
					'';
				};
			};

		};

}
