Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3569ACEE3E
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2019 23:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728980AbfJGVQu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Oct 2019 17:16:50 -0400
Received: from mail-yw1-f41.google.com ([209.85.161.41]:38488 "EHLO
        mail-yw1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728330AbfJGVQu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Oct 2019 17:16:50 -0400
Received: by mail-yw1-f41.google.com with SMTP id s6so5675451ywe.5
        for <linux-usb@vger.kernel.org>; Mon, 07 Oct 2019 14:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=pJJCYczepx50YhdzkYAlO7ejJjx8LAQVIplDayLZ+yg=;
        b=UYZNLJ+XKfbqhPj3fksOsyTTaLQ8+ufodAsYLhEmzg6piSOhPpAK/rwHqWF2j/Q182
         V2tzfBcbo+5UYSGK4uB8aq4Bg4ATh1zQv4bNXMcb+gx3HW8RkidZGa3vRab7WpblunUp
         1Kwmhz5BIGIwlnkR0B2MHNQOxoQGUjTfOx63R/LLwSJ+DiYice7ZW6uu1D2+jMqauXaG
         f/7FGhVUO9/oEcAUz2rZ9IJ3zYZOn8Kqp+5J1NM/IoeCfr5PGbXFGKHDyoSCWaCapW2J
         60U2z6b+s9o17tYuwLCj1hVSnox+8mhjzVDw7q9CXuwMITXUEgUlP9uKK1lpqp2n+BZi
         MrUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=pJJCYczepx50YhdzkYAlO7ejJjx8LAQVIplDayLZ+yg=;
        b=HQeJRfEqswrqZ3TWHPgITsnyenRO9cf3njGRc253NHpBNZVhYiStMqFgigpePxXFCw
         Ij5upwJD5emyiDZSUrDI0/mrpydIqKDQdSy/njxY1bCyFOS786y89IiIOe/6sbeRhWc6
         BZZzUWHxyUJWfe0BoG3DpcakTorkDx/q218eyQmIYTvyyETdYygGkZebDDzLW6gNqPq2
         2b05i/Whjz36Qw95GFCGRgB+KKnvPXZEYSX17LL9nUqHopWMzMY/1aufgAHbRbkLy7Vm
         D6rhoxx5nN/G11i49X0Gos75aEmex802wcpCdu5JqcH8XpVIIWF+VEXfrfG3To65AfSm
         jZwg==
X-Gm-Message-State: APjAAAVyNZRgT8sdLA9DlsaXKr1LPhSKg2zF1CQZDKJWfQRmdVAoTdXX
        BpD7HWf0sBcabCS2lZkVgWdUnT6xfu0=
X-Google-Smtp-Source: APXvYqwhRdlcy05YlM8Msc4tu79FKEkdP9OEZwfYIlda/W0wvsMJsxHXU81GG5Y7nH7Xhu6SMldnCA==
X-Received: by 2002:a0d:dc42:: with SMTP id f63mr22053956ywe.470.1570483008592;
        Mon, 07 Oct 2019 14:16:48 -0700 (PDT)
Received: from [192.168.100.202] (66-211-222-36.static.velocity.net. [66.211.222.36])
        by smtp.gmail.com with ESMTPSA id i134sm4374990ywa.9.2019.10.07.14.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2019 14:16:47 -0700 (PDT)
From:   Adam Bennett <abennett72@gmail.com>
Subject: Possible bug with cdc_ether, triggers NETDEV WATCHDOG
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Message-ID: <3913c851-93f8-3d26-a578-f5a2c8b69aaa@gmail.com>
Date:   Mon, 7 Oct 2019 17:15:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I've been messing around with a Raspberry Pi Zero, in its ethernet 
gadget mode.  This possible bug report is not against the Pi Zero linux 
kernel, but rather the host computer's linux kernel.  I've been able to 
reproduce the same host computer issue with my normal laptop, and an 
embedded board (buildroot-based). Both run a newish version of 4.19.

The bug report is that most of the time I cannot ping through the local 
link, and I get a kernel debug message:  sometimes I can ping the Pi 
Zero with no kernel message, most of the time I can't ping and the 
message comes up, and occasionally I get the message right when I plug 
in the Pi Zero, before I issue the ping command.

Here is the dmesg on my normal laptop (I've included the plug-in 
sequence also):

[11728.029900] usb 1-1: new high-speed USB device number 10 using xhci_hcd
[11728.434200] usb 1-1: device descriptor read/64, error -71
[11728.669543] usb 1-1: New USB device found, idVendor=0525, 
idProduct=a4a2, bcdDevice= 4.19
[11728.669548] usb 1-1: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[11728.669551] usb 1-1: Product: RNDIS/Ethernet Gadget
[11728.669554] usb 1-1: Manufacturer: Linux 4.19.75+ with 20980000.usb
[11728.674528] cdc_ether 1-1:1.0 usb0: register 'cdc_ether' at 
usb-0000:00:14.0-1, CDC Ethernet Device, 22:93:3a:1e:ac:5c
[11730.725278] cdc_ether 1-1:1.0 enp0s20f0u1: renamed from usb0
[11768.174915] ------------[ cut here ]------------
[11768.174921] NETDEV WATCHDOG: enp0s20f0u1 (cdc_ether): transmit queue 
0 timed out
[11768.174950] WARNING: CPU: 3 PID: 0 at dev_watchdog+0x1f1/0x200
[11768.174951] Modules linked in: cdc_ether usbnet mii xt_hl xt_REDIRECT 
iptable_nat nf_nat_ipv4 nf_nat nf_conntrack nf_defrag_ipv6 
nf_defrag_ipv4 ip_tables bpfilter algif_hash algif_skcipher af_alg bnep 
ipv6 crc_ccitt 8021q garp stp mrp snd_hda_codec_hdmi 
snd_hda_codec_realtek snd_hda_codec_generic ipmi_msghandler joydev 
hid_logitech_hidpp hid_logitech_dj btusb btrtl btbcm btintel bluetooth 
ecdh_generic rtsx_pci_ms rtsx_pci_sdmmc mmc_core memstick 
i2c_designware_platform i2c_designware_core ppdev uvcvideo dell_rbtn 
dell_laptop dell_smm_hwmon tpm_crb intel_rapl vboxpci(O) vboxnetadp(O) 
vboxnetflt(O) x86_pkg_temp_thermal intel_powerclamp crct10dif_pclmul 
crc32c_intel ghash_clmulni_intel pcbc aesni_intel aes_x86_64 vboxdrv(O) 
dell_wmi crypto_simd sparse_keymap cryptd glue_helper e1000e input_leds 
dell_smbios
[11768.175030]  iwlmvm serio_raw dcdbas snd_hda_intel wmi_bmof 
dell_wmi_descriptor ptp snd_hda_codec snd_hwdep intel_wmi_thunderbolt 
snd_hda_core iwlwifi pps_core idma64 rtsx_pci nouveau virt_dma ttm i915 
intel_lpss_pci intel_lpss processor_thermal_device intel_soc_dts_iosf 
intel_pch_thermal tpm_tis parport_pc i2c_hid tpm_tis_core pcc_cpufreq 
int3403_thermal parport dell_smo8800 int3400_thermal tpm int3402_thermal 
acpi_thermal_rel int340x_thermal_zone rng_core acpi_pad
[11768.175077] CPU: 3 PID: 0 Comm: swapper/3 Tainted: P O      
4.19.77-gentoo #1
[11768.175079] Hardware name: Dell Inc. Precision 7520/0DFG9Y, BIOS 
1.15.1 05/30/2019
[11768.175086] RIP: 0010:dev_watchdog+0x1f1/0x200
[11768.175089] Code: 48 63 55 e8 eb 99 4c 89 f7 c6 05 bc 40 ad 00 01 e8 
44 6c fd ff 44 89 e9 4c 89 f6 48 c7 c7 f0 30 0a 82 48 89 c2 e8 19 d1 88 
ff <0f> 0b eb c5 66 66 2e 0f 1f 84 00 00 00 00 00 48 c7 47 08 00 00 00
[11768.175092] RSP: 0018:ffff88885f8c3e98 EFLAGS: 00010292
[11768.175096] RAX: 0000000000000044 RBX: ffff88884b307e00 RCX: 
0000000000000006
[11768.175097] RDX: 0000000000000007 RSI: 0000000000000086 RDI: 
ffff88885f8d53f0
[11768.175099] RBP: ffff8886d7fa7438 R08: 0000000000000444 R09: 
0000000000000001
[11768.175101] R10: 0000000000000000 R11: 0000000000000001 R12: 
ffff8886d7fa741c
[11768.175103] R13: 0000000000000000 R14: ffff8886d7fa7000 R15: 
ffff88884b307e80
[11768.175106] FS:  0000000000000000(0000) GS:ffff88885f8c0000(0000) 
knlGS:0000000000000000
[11768.175109] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[11768.175111] CR2: 00007f727ac4e180 CR3: 0000000002209002 CR4: 
00000000001606e0
[11768.175113] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 
0000000000000000
[11768.175115] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 
0000000000000400
[11768.175116] Call Trace:
[11768.175120]  <IRQ>
[11768.175127]  ? qdisc_reset+0xd0/0xd0
[11768.175132]  ? qdisc_reset+0xd0/0xd0
[11768.175140]  call_timer_fn+0xe/0x80
[11768.175146]  run_timer_softirq+0x337/0x390
[11768.175152]  ? tick_sched_timer+0x4b/0x70
[11768.175159]  ? timerqueue_add+0x56/0x90
[11768.175163]  ? __hrtimer_run_queues+0x11a/0x170
[11768.175169]  __do_softirq+0xbc/0x201
[11768.175174]  irq_exit+0xe4/0xf0
[11768.175179]  smp_apic_timer_interrupt+0x4d/0x80
[11768.175184]  apic_timer_interrupt+0xf/0x20
[11768.175187]  </IRQ>
[11768.175194] RIP: 0010:cpuidle_enter_state+0x117/0x1a0
[11768.175196] Code: cf 6c 95 ff 65 8b 3d a8 fc 8d 7e e8 43 6b 95 ff 31 
ff 48 89 c5 e8 29 79 95 ff 45 84 ed 75 64 fb 48 ba cf f7 53 e3 a5 9b c4 
20 <48> 89 e9 48 2b 0c 24 48 89 c8 48 c1 f9 3f 48 f7 ea b8 ff ff ff 7f
[11768.175198] RSP: 0018:ffffc900031fbec0 EFLAGS: 00000246 ORIG_RAX: 
ffffffffffffff13
[11768.175202] RAX: ffff88885f8dfc80 RBX: ffffe8ffffcc48e0 RCX: 
000000000000001f
[11768.175204] RDX: 20c49ba5e353f7cf RSI: 000000002aaaaaaa RDI: 
0000000000000000
[11768.175206] RBP: 00000ab3fde2769f R08: 00000ab3fde2769f R09: 
000000000000036d
[11768.175208] R10: 00000000000007c2 R11: ffff88885f8dede8 R12: 
0000000000000004
[11768.175209] R13: 0000000000000000 R14: 0000000000000004 R15: 
ffffffff822696f8
[11768.175218]  do_idle+0x19b/0x200
[11768.175224]  cpu_startup_entry+0x14/0x20
[11768.175228]  secondary_startup_64+0xa4/0xb0
[11768.175232] ---[ end trace f1609a16bb7643f7 ]---
flutig ~ # uname -a
Linux flutig 4.19.77-gentoo #1 SMP PREEMPT Sat Oct 5 19:55:39 EDT 2019 
x86_64 Intel(R) Xeon(R) CPU E3-1505M v6 @ 3.00GHz GenuineIntel GNU/Linux

And here is the dmesg output from an embedded board (buildroot-based):

[11521.686323] usb 1-3: new high-speed USB device number 3 using xhci_hcd
[11522.083362] usb 1-3: device descriptor read/64, error -71
[11522.318745] usb 1-3: New USB device found, idVendor=0525, 
idProduct=a4a2, bcdDevice= 4.19
[11522.321429] usb 1-3: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[11522.324083] usb 1-3: Product: RNDIS/Ethernet Gadget
[11522.326719] usb 1-3: Manufacturer: Linux 4.19.75+ with 20980000.usb
[11522.335363] cdc_ether 1-3:1.0 usb0: register 'cdc_ether' at 
usb-0000:00:15.0-3, CDC Ethernet Device, 7e:a9:b4:e3:74:27
[11522.337262] usbcore: registered new interface driver cdc_ether
[11522.341516] udevd[297]: Error changing net interface name usb0 to 
enp0s21f0u3: Device or resource busy
[11522.343497] udevd[297]: could not rename interface '4' from 'usb0' to 
'enp0s21f0u3': Device or resource busy
[11522.348600] IPv6: ADDRCONF(NETDEV_UP): usb0: link is not ready
[11549.157189] IPv6: ADDRCONF(NETDEV_CHANGE): usb0: link becomes ready
[11752.340859] ------------[ cut here ]------------
[11752.345529] NETDEV WATCHDOG: usb0 (cdc_ether): transmit queue 0 timed out
[11752.350146] WARNING: CPU: 2 PID: 0 at dev_watchdog+0x22d/0x240
[11752.354801] Modules linked in: cdc_ether usbnet mii iptable_nat 
nf_nat_ipv4 nf_nat snd_hda_codec_hdmi snd_hda_codec_generic intel_rapl 
x86_pkg_temp_thermal aesni_intel aes_x86_64 crypto_simd cryptd 
snd_soc_skl glue_helper snd_soc_core pwm_lpss_pci i915 pwm_lpss 
snd_soc_acpi_intel_match snd_soc_acpi snd_soc_skl_ipc snd_soc_sst_ipc 
snd_soc_sst_dsp snd_hda_ext_core snd_hda_intel snd_hda_codec snd_hwdep 
snd_hda_core tpm_crb tpm_tis tpm_tis_core pinctrl_broxton pinctrl_intel 
pcc_cpufreq
[11752.375223] CPU: 2 PID: 0 Comm: swapper/2 Not tainted 4.19.65-cip8 #2
[11752.380401] Hardware name: Default string Default string/conga-SA5, 
BIOS 5.12 08/08/2017
[11752.385593] RIP: 0010:dev_watchdog+0x22d/0x240
[11752.390730] Code: 4c 24 e0 eb 90 49 8d 7d 00 c6 05 0e bb a3 00 01 e8 
a8 73 fd ff 48 8d 10 8d 0b 49 8d 75 00 48 c7 c7 58 f2 df 81 e8 94 18 a1 
ff <0f> 0b eb c1 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 c7 47
[11752.401442] RSP: 0018:ffff888277b03ea8 EFLAGS: 00010202
[11752.406818] RAX: 000000000000003d RBX: 0000000000000000 RCX: 
0000000000000000
[11752.412137] RDX: 0000000000040400 RSI: 00000000000000f6 RDI: 
0000000000000300
[11752.417404] RBP: ffff88826fab741c R08: 0000000000000000 R09: 
00000000000003e6
[11752.422675] R10: 0000000000000000 R11: ffffc900306fec20 R12: 
ffff88826fab7440
[11752.427967] R13: ffff88826fab7000 R14: 0000000000000001 R15: 
ffff8882734fc080
[11752.433292] FS:  0000000000000000(0000) GS:ffff888277b00000(0000) 
knlGS:0000000000000000
[11752.438716] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[11752.444159] CR2: 00007f946cdb2000 CR3: 000000000200a000 CR4: 
00000000001406e0
[11752.449685] Call Trace:
[11752.455233]  <IRQ>
[11752.460685]  ? qdisc_reset+0xe0/0xe0
[11752.466119]  ? qdisc_reset+0xe0/0xe0
[11752.471500]  call_timer_fn+0x14/0x80
[11752.476809]  run_timer_softirq+0x311/0x340
[11752.482077]  ? tick_sched_do_timer+0x70/0x70
[11752.487398]  ? __hrtimer_run_queues+0xfc/0x1a0
[11752.492748]  ? ktime_get+0x32/0x90
[11752.498117]  __do_softirq+0xc1/0x215
[11752.503466]  irq_exit+0xea/0xf0
[11752.508707]  smp_apic_timer_interrupt+0x4d/0x90
[11752.513949]  apic_timer_interrupt+0xf/0x20
[11752.519163]  </IRQ>
[11752.524350] RIP: 0010:cpuidle_enter_state+0x125/0x1c0
[11752.529486] Code: e8 a0 25 b1 ff 31 ff 48 8d 18 e8 36 33 b1 ff 45 84 
ff 74 12 9c 58 f6 c4 02 0f 85 8e 00 00 00 31 ff e8 df da b4 ff fb 48 89 
d9 <48> b8 ff ff ff ff f3 01 00 00 48 29 e9 ba ff ff ff 7f 48 39 c1 7e
[11752.540107] RSP: 0018:ffffc9000009fed8 EFLAGS: 00000246 ORIG_RAX: 
ffffffffffffff13
[11752.545490] RAX: ffff888277b1f680 RBX: 00000ab04e19813d RCX: 
00000ab04e19813d
[11752.550862] RDX: 00000ab04e19813d RSI: 0000000074f5853d RDI: 
0000000000000000
[11752.556240] RBP: 00000ab04b449422 R08: 0000000000000000 R09: 
000000000001ef40
[11752.561552] R10: 00000bbb84752596 R11: 0000000000000040 R12: 
ffff88826f93f800
[11752.566848] R13: 0000000000000003 R14: 0000000000000003 R15: 
0000000000000000
[11752.572141]  ? cpuidle_enter_state+0x10a/0x1c0
[11752.577398]  do_idle+0x190/0x1e0
[11752.582554]  cpu_startup_entry+0x14/0x20
[11752.587634]  secondary_startup_64+0xa4/0xb0
[11752.592639] ---[ end trace 1d3dfb428e463c32 ]---
# uname -a
Linux vcu 4.19.65-cip8 #2 SMP PREEMPT Wed Oct 2 10:28:19 EDT 2019 x86_64 
GNU/Linux

What other information would be helpful debugging this issue?

Thank you,

Adam

