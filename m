Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF78F15D8A6
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2020 14:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbgBNNkv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Feb 2020 08:40:51 -0500
Received: from mail-qk1-f169.google.com ([209.85.222.169]:37250 "EHLO
        mail-qk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728083AbgBNNkv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Feb 2020 08:40:51 -0500
Received: by mail-qk1-f169.google.com with SMTP id c188so9197527qkg.4
        for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2020 05:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:date:message-id:subject:to;
        bh=51AC91Nhs+ZUAy33jEU8LnyzCLeeyuPv8ZSEzgFOI+4=;
        b=hhHh9whpLefLEHQMiR0WG9owJqSS4XpABDGyDECnDXDUmeOEtCD8DdzaAeNKoe6aY0
         KwrNtnwxCVEQ/35UarzQ6cQPs37O0LaYwj0CBV/1OuvOxjeQvIA57bvPO4veB7rZnecL
         C2t3/u4A3RZp3nyfX7Y1EN4CoMeiebo6IJQkNtCJ4AA54X/O2xgkV3gXWxbnocZCutFg
         9az/XvVMCs3/8ll1W8uHPG8uBeM2KNTcnNhVtTJ7Bwz5jlMoGXKYQlokdlGCLLQMxRT0
         Rem1dPH0mR4g8L7nNMeGwPeWf7KTOjnNcXls4Uvu/vQsO3liVGtDDJlnI0YSLg7ikr83
         WvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:date:message-id:subject:to;
        bh=51AC91Nhs+ZUAy33jEU8LnyzCLeeyuPv8ZSEzgFOI+4=;
        b=DTIQX7XAD51KIL9cSkHk6YVrC9CSzXZBoB7cTX/CFFeUFlprSbCuM0gTciWQCvkasA
         bAmBacard+z48pHB/cURsXtlymeVyV0Yn6kUtehXNgv4dA35V1x7N+Ixyk6KXTpIELBg
         GQweocTMd1cSoWQrol/X9JVvrURSu+31w6I15RJukkw5L1gzqpdLeWFwtClo8GMzLxs9
         MLFaCRacUCFlUxkExP5IykR9A1zIass4hM7OaLN0VOM1DtVAM2OoZwP9phDLYrll6LYU
         vNvZWSoNv1i3Hv92NbH/OUmoAW3qhhbMdJVBrsgRss++FzRgxDoc89OdZtQQHpZJfAjJ
         DtgQ==
X-Gm-Message-State: APjAAAUvP6W+o9eBPsMbleRtiL7jqfnRXyqo6+gT/dfgRkE8vtd3exlm
        buyFqzrOPN0OldHrGMQmHnRNbGQqVpAMoA==
X-Google-Smtp-Source: APXvYqwXfhFBFzExz1NId6kXWAf7NR5O17eTYwWqc5qqSNCjDnqn+iehFojffXrUEZrG0WxlfVbg0Q==
X-Received: by 2002:a37:a8e:: with SMTP id 136mr2594554qkk.173.1581687647958;
        Fri, 14 Feb 2020 05:40:47 -0800 (PST)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id k11sm3235423qti.68.2020.02.14.05.40.46
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2020 05:40:47 -0800 (PST)
From:   Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f171.google.com with SMTP id w25so9216853qki.3
        for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2020 05:40:46 -0800 (PST)
X-Received: by 2002:a05:620a:1037:: with SMTP id a23mr383586qkk.82.1581687646320;
 Fri, 14 Feb 2020 05:40:46 -0800 (PST)
MIME-Version: 1.0
Date:   Fri, 14 Feb 2020 10:40:35 -0300
X-Gmail-Original-Message-ID: <CAP9ODKprPi8N-dU8NaKwneXH-3b0ipSEDpU5mDbGntxuyhGhJw@mail.gmail.com>
Message-ID: <CAP9ODKprPi8N-dU8NaKwneXH-3b0ipSEDpU5mDbGntxuyhGhJw@mail.gmail.com>
Subject: USB DWC2 stops responding when insert/remove cable multiple times
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

 the USB port stops responding. To recover the port we need to reload
the g_serial module.

I have reports of it happening in the field, on the device but, until
recently, it very hard to reproduce. We found that it is very easy to
reproduce when we use the Microsoft Surface Dock, as hub.

Description of the host:

    Operating System: Windows 10 Pro
    Driver: libusb-1.0 1.0.22

Description of the target:

    SoC: Rockchip RV1108G
    Gadget: g_serial
    Linux: 5.4.19

dmesg:

    [    0.000000] Booting Linux on physical CPU 0xf00
    [    0.000000] Linux version 5.4.19 (oe-user@oe-host) (gcc version
8.3.0 (GCC)) #1 SMP Thu Feb 13 20:45:28 UTC 2020
    [    0.000000] CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7),
cr=10c5387d
    [    0.005064] rcu: Hierarchical SRCU implementation.
    [    0.005746] smp: Bringing up secondary CPUs ...
    [    0.005774] smp: Brought up 1 node, 1 CPU
    [    0.005793] SMP: Total of 1 processors activated (48.00 BogoMIPS).
    [    0.005807] CPU: All CPU(s) started in SVC mode.
    [    0.006567] devtmpfs: initialized
    [    0.015073] VFP support v0.3: implementor 41 architecture 2
part 30 variant 7 rev 5
    [    0.015550] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 19112604462750000 ns
    [    0.015598] futex hash table entries: 256 (order: 2, 16384 bytes, linear)
    [    0.015793] pinctrl core: initialized pinctrl subsystem
    [    0.017748] NET: Registered protocol family 16
    [    0.018265] DMA: preallocated 256 KiB pool for atomic coherent
allocations
    [    0.021331] cpuidle: using governor menu
    [    0.021896] Failed to find PMU node
    [    0.022081] hw-breakpoint: found 5 (+1 reserved) breakpoint and
4 watchpoint registers.
    [    0.022101] hw-breakpoint: maximum watchpoint size is 8 bytes.
    [    0.022469] Serial: AMBA PL011 UART driver
    [    0.071825] iommu: Default domain type: Translated
    [    0.073343] usbcore: registered new interface driver usbfs
    [    0.073455] usbcore: registered new interface driver hub
    [    0.073558] usbcore: registered new device driver usb
    [    0.074199] pps_core: LinuxPPS API ver. 1 registered
    [    0.074228] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
Rodolfo Giometti <giometti@linux.it>
    [    0.074281] PTP clock support registered
    [    0.077278] clocksource: Switched to clocksource arch_sys_counter
    [    0.872886] thermal_sys: Registered thermal governor 'step_wise'
    [    0.873716] NET: Registered protocol family 2
    [    0.874688] tcp_listen_portaddr_hash hash table entries: 512
(order: 0, 6144 bytes, linear)
    [    0.874747] TCP established hash table entries: 1024 (order: 0,
4096 bytes, linear)
    [    0.874793] TCP bind hash table entries: 1024 (order: 1, 8192
bytes, linear)
    [    0.874832] TCP: Hash tables configured (established 1024 bind 1024)
    [    0.874997] UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
    [    0.875055] UDP-Lite hash table entries: 256 (order: 1, 8192
bytes, linear)
    [    0.875376] NET: Registered protocol family 1
    [    0.876470] RPC: Registered named UNIX socket transport module.
    [    0.876498] RPC: Registered udp transport module.
    [    0.876513] RPC: Registered tcp transport module.
    [    0.876527] RPC: Registered tcp NFSv4.1 backchannel transport module.
    [    0.877671] hw perfevents: enabled with armv7_cortex_a7 PMU
driver, 5 counters available
    [    0.880681] workingset: timestamp_bits=30 max_order=15 bucket_order=0
    [    0.893227] squashfs: version 4.0 (2009/01/31) Phillip Lougher
    [    0.894966] NFS: Registering the id_resolver key type
    [    0.895040] Key type id_resolver registered
    [    0.895057] Key type id_legacy registered
    [    0.895155] ntfs: driver 2.1.32 [Flags: R/O].
    [    0.896438] Block layer SCSI generic (bsg) driver version 0.4
loaded (major 249)
    [    0.896470] io scheduler mq-deadline registered
    [    0.896487] io scheduler kyber registered
    [    0.904739] dma-pl330 102a0000.pdma: Loaded driver for PL330 DMAC-241330
    [    0.904778] dma-pl330 102a0000.pdma:         DBUFF-128x8bytes
Num_Chans-8 Num_Peri-20 Num_Events-16
    [    1.046331] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
    [    1.051059] printk: console [ttyS2] disabled
    [    1.051192] 10210000.serial: ttyS2 at MMIO 0x10210000 (irq =
22, base_baud = 1500000) is a 16550A
    [    1.100239] printk: console [ttyS2] enabled
    [    1.103015] 10230000.serial: ttyS0 at MMIO 0x10230000 (irq =
23, base_baud = 1500000) is a 16550A
    [    1.105538] STMicroelectronics ASC driver initialized
    [    1.127141] brd: module loaded
    [    1.143433] loop: module loaded
    [    1.146411] libphy: Fixed MDIO Bus: probed
    [    1.149263] rk_gmac-dwmac 30200000.eth: IRQ eth_lpi not found
    [    1.150017] rk_gmac-dwmac 30200000.eth: PTP uses main clock
    [    1.150537] rk_gmac-dwmac 30200000.eth: no reset control found
    [    1.151100] rk_gmac-dwmac 30200000.eth: clock input or output? (output).
    [    1.151712] rk_gmac-dwmac 30200000.eth: Can not read property: tx_delay.
    [    1.152321] rk_gmac-dwmac 30200000.eth: set tx_delay to 0x30
    [    1.152834] rk_gmac-dwmac 30200000.eth: Can not read property: rx_delay.
    [    1.153434] rk_gmac-dwmac 30200000.eth: set rx_delay to 0x10
    [    1.153957] rk_gmac-dwmac 30200000.eth: integrated PHY? (no).
    [    1.154582] rk_gmac-dwmac 30200000.eth: cannot get clock clk_mac_speed
    [    1.160389] rk_gmac-dwmac 30200000.eth: init for RMII
    [    1.161278] rk_gmac-dwmac 30200000.eth: User ID: 0x10, Synopsys ID: 0x35
    [    1.161903] rk_gmac-dwmac 30200000.eth:      DWMAC1000
    [    1.162350] rk_gmac-dwmac 30200000.eth: DMA HW capability
register supported
    [    1.162988] rk_gmac-dwmac 30200000.eth: RX Checksum Offload
Engine supported
    [    1.163621] rk_gmac-dwmac 30200000.eth: COE Type 2
    [    1.164055] rk_gmac-dwmac 30200000.eth: TX Checksum insertion supported
    [    1.164647] rk_gmac-dwmac 30200000.eth: Wake-Up On Lan supported
    [    1.165261] rk_gmac-dwmac 30200000.eth: Normal descriptors
    [    1.165764] rk_gmac-dwmac 30200000.eth: Ring mode enabled
    [    1.166254] rk_gmac-dwmac 30200000.eth: Enable RX Mitigation
via HW Watchdog Timer
    [    1.166952] rk_gmac-dwmac 30200000.eth: device MAC address
1e:39:35:98:a1:87
    [    1.178781] libphy: stmmac: probed
    [    1.179133] Micrel KSZ886X Switch stmmac-0:01: attached PHY
driver [Micrel KSZ886X Switch] (mii_bus:phy_addr=stmmac-0:01,
irq=POLL)
    [    1.180193] Micrel KSZ886X Switch stmmac-0:02: attached PHY
driver [Micrel KSZ886X Switch] (mii_bus:phy_addr=stmmac-0:02,
irq=POLL)
    [    1.181245] Micrel KSZ886X Switch stmmac-0:03: attached PHY
driver [Micrel KSZ886X Switch] (mii_bus:phy_addr=stmmac-0:03,
irq=POLL)
    [    1.184175] PPP generic driver version 2.4.2
    [    1.184975] NET: Registered protocol family 24
    [    1.185589] usbcore: registered new interface driver asix
    [    1.186175] usbcore: registered new interface driver ax88179_178a
    [    1.186796] usbcore: registered new interface driver cdc_ether
    [    1.187547] usbcore: registered new interface driver net1080
    [    1.188148] usbcore: registered new interface driver cdc_subset
    [    1.188748] usbcore: registered new interface driver zaurus
    [    1.189387] usbcore: registered new interface driver cdc_ncm
    [    1.189969] usbcore: registered new interface driver qmi_wwan
    [    1.191575] dwc2 30180000.usb: 30180000.usb supply vusb_d not
found, using dummy regulator
    [    1.192497] dwc2 30180000.usb: 30180000.usb supply vusb_a not
found, using dummy regulator
    [    1.195816] dwc2 30180000.usb: Configuration mismatch. dr_mode
forced to device
    [    1.196585] dwc2 30180000.usb: dwc2_check_params: Invalid
parameter lpm_clock_gating=1
    [    1.197503] dwc2 30180000.usb: EPs: 10, dedicated fifos, 972
entries in SPRAM
    [    1.199459] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
    [    1.489983] mmcblk0rpmb: mmc0:0001 M62704 partition 3 512 KiB,
chardev (244:0)
    [    1.493533]  mmcblk0: p1 p2 p3
    [    1.524856] EXT4-fs (mmcblk0p1): mounted filesystem with
ordered data mode. Opts: (null)
    [    1.525716] VFS: Mounted root (ext4 filesystem) on device 179:1.
    [    1.527211] devtmpfs: mounted
    [    1.530123] Freeing unused kernel memory: 1024K
    [    1.537665] Run /sbin/init as init process
    [    1.597420] usb 1-1: new high-speed USB device number 2 using
ehci-platform
    [    1.649836] usb 1-1: New USB device found, idVendor=05e3,
idProduct=0610, bcdDevice=32.98
    [    1.650591] usb 1-1: New USB device strings: Mfr=0, Product=1,
SerialNumber=0
    [    1.651236] usb 1-1: Product: USB2.0 Hub
    [    1.653862] hub 1-1:1.0: USB hub found
    [    1.654696] hub 1-1:1.0: 4 ports detected
    [    1.977454] usb 1-1.1: new full-speed USB device number 3 using
ehci-platform
    [    2.130837] usb 1-1.1: New USB device found, idVendor=163c,
idProduct=0407, bcdDevice= 0.01
    [    2.131654] usb 1-1.1: New USB device strings: Mfr=1,
Product=2, SerialNumber=0
    [    2.132317] usb 1-1.1: Product: USB Key
    [    2.132673] usb 1-1.1: Manufacturer: Watchdata
    [    2.442526] EXT4-fs: Warning: mounting with data=journal
disables delayed allocation and O_DIRECT support!
    [    2.453496] EXT4-fs (mmcblk0p3): mounted filesystem with
journalled data mode. Opts: data=journal
    [    2.619187] udevd[96]: starting version 3.2.7
    [    2.635211] random: udevd: uninitialized urandom read (16 bytes read)
    [    2.637861] random: udevd: uninitialized urandom read (16 bytes read)
    [    2.638686] random: udevd: uninitialized urandom read (16 bytes read)
    [    2.656198] udevd[96]: specified group 'kvm' unknown
    [    2.693678] udevd[97]: starting eudev-3.2.7
    [    3.022805] rk808-rtc rk808-rtc: registered as rtc0
    [    3.227418] wdtoken: loading out-of-tree module taints kernel.
    [    3.248176] usbcore: registered new interface driver WatchToken(2.6)
    [    5.290161] emlog:emlog_init: version 0.70 running, major is
243, MINOR is 1, max size 900 K.
    [    5.392396] EXT4-fs (mmcblk0p1): re-mounted. Opts: (null)
    [    6.792766] urandom_read: 1 callbacks suppressed
    [    6.792781] random: dd: uninitialized urandom read (512 bytes read)
    [    7.074770] random: dbus-uuidgen: uninitialized urandom read
(12 bytes read)
    [    7.075530] random: dbus-uuidgen: uninitialized urandom read (8
bytes read)
    [   35.146552] random: crng init done
    [   35.146887] random: 2 urandom warning(s) missed due to ratelimiting
    [   35.227827] zram: Added device: zram0
    [   35.257802] zram0: detected capacity change from 0 to 108220416
    [   35.289142] Adding 105680k swap on /dev/zram0.  Priority:100
extents:1 across:105680k SS
    [   44.339044] of_dma_request_slave_channel: dma-names property of
node '/serial@10230000' missing or empty
    [   44.339905] ttyS0 - failed to request DMA
    [   44.679614] rk_gmac-dwmac 30200000.eth eth0: PHY [stmmac-0:01]
driver [Micrel KSZ886X Switch]
    [   44.687858] rk_gmac-dwmac 30200000.eth eth0: No Safety Features
support found
    [   44.688546] rk_gmac-dwmac 30200000.eth eth0: PTP not supported by HW
    [   44.689140] rk_gmac-dwmac 30200000.eth eth0: configuring for
phy/rmii link mode
    [   46.807797] rk_gmac-dwmac 30200000.eth eth0: Link is Up -
100Mbps/Full - flow control rx/tx
    [   59.647746] g_serial gadget: Gadget Serial v2.4
    [   59.648178] g_serial gadget: g_serial ready
    [   59.653920] dwc2 30180000.usb: bound driver g_serial
    [   59.912364] dwc2 30180000.usb: new device is high-speed
    [   59.949981] dwc2 30180000.usb: new address 12
    [   60.034937] g_serial gadget: high-speed config #2: CDC ACM config
    [   65.980382] phy phy-10300000.syscon:usb2-phy@100.0: charger =
USB_CDP_CHARGER
    [   66.313267] dwc2 30180000.usb: new device is high-speed
    [   66.350902] dwc2 30180000.usb: new address 13
    [   66.388065] g_serial gadget: high-speed config #2: CDC ACM config
    [  311.604251] dwc2 30180000.usb: new device is high-speed
    [  311.641798] dwc2 30180000.usb: new address 14
    [  311.745597] g_serial gadget: high-speed config #2: CDC ACM config
    [  312.905102] dwc2 30180000.usb: new device is high-speed
    [  312.944301] dwc2 30180000.usb: new address 15
    [  312.967867] g_serial gadget: high-speed config #2: CDC ACM config
    [  314.828173] dwc2 30180000.usb: new device is high-speed
    [  314.866943] dwc2 30180000.usb: new address 16
    [  314.889550] g_serial gadget: high-speed config #2: CDC ACM config


The "[  314.889550] g_serial gadget: high-speed config #2: CDC ACM
config" message is the last time it is detected. As mentioned, to
restore the port to work, we need to reload the g_serial module.

When we reload it, following exception happens:

    [  923.942418] pc : [<c0850638>]    lr : [<bf045d44>]    psr: a00f0093
    [  923.942979] sp : c6739d48  ip : 00005401  fp : c5938038
    [  923.943445] r10: 00000000  r9 : ffffffed  r8 : c5c88480
    [  923.943914] r7 : c0aef318  r6 : 000000d4  r5 : 00000000  r4 : 00000000
    [  923.944498] r3 : 00000000  r2 : c5ecd400  r1 : c5c88480  r0 : 000000d4
    [  923.945092] Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA
ARM  Segment none
    [  923.945737] Control: 10c5387d  Table: 65cbc06a  DAC: 00000051
    [  923.946256] Process sat (pid: 604, stack limit = 0xa8f463ac)
    [  923.946768] Stack: (0xc6739d48 to 0xc673a000)
    [  923.947168] 9d40:                   c6738000 00000000 c5c88480
c5ecd400 c5c88480 c0d05c88
    [  923.947901] 9d60: 00000000 c5ecd400 00000000 0f200000 c0aef318
c5c88480 ffffffed c04f96e8
    [  923.948634] 9d80: c5ecd400 c05013bc c5ecd400 00000000 00000000
c5c88480 c5ecd400 0f200000
    [  923.949367] 9da0: c0aef318 c6738000 ffffffed c096dc70 c5938038
c04fb5a4 00000902 c0d8ec98
    [  923.950099] 9dc0: c5ecd400 c708b9d0 00000000 c0d05c88 00000000
c096dcf0 c593a140 00000000
    [  923.950832] 9de0: 00000000 c5938038 c5c88480 c5938038 c5c88480
c02b509c c6739ec8 c0d05c88
    [  923.951564] 9e00: c5938038 c5c88480 00000000 c5938038 00000000
c5c88488 c02b4fbc c02ac538
    [  923.952296] 9e20: c6739ec8 00000000 00000902 00000000 00000002
00000000 c5938038 c02bf778
    [  923.953028] 9e40: c6739e68 00000003 00000000 00000006 00000000
000041ed 00000000 00000000
    [  923.953760] 9e60: 00000041 00000047 00000000 00000000 00000000
ffffe000 00000000 c0a744d0
    [  923.954493] 9e80: 00000002 c5938038 c708b9d0 c6f313b8 c6d138c0
00004000 00000000 c0d05c88
    [  923.955225] 9ea0: c6738000 00000012 c6739f70 00000001 fffff000
c0101204 c6738000 00000142
    [  923.955958] 9ec0: b6346874 c02c1930 c708b9d0 c6f313b8 ad6e75ef
00000006 c70dc015 00000000
    [  923.956689] 9ee0: 00000000 c6cba6e8 c5938038 00000101 00000002
00000054 00000000 00000000
    [  923.957421] 9f00: 00000000 c6739f08 c59116f8 c65c3608 00000001
00000000 00000000 00000000
    [  923.958153] 9f20: 00000000 c0d05c88 c0d0626c 00000012 00000020
c593eb00 c70dc000 00000000
    [  923.958885] 9f40: 00000400 00000002 ffffff9c ffffff9c c70dc000
c0d05c88 00000012 ffffff9c
    [  923.959617] 9f60: c70dc000 c02adb5c 0000004e c0101204 00000902
00000000 00000006 00000100
    [  923.960349] 9f80: 00000001 c0d05c88 00000047 003e4ff0 00674450
0000000d 00000142 c0101204
    [  923.961082] 9fa0: c6738000 c0101000 003e4ff0 00674450 ffffff9c
003e4ff0 00000902 00000000
    [  923.961814] 9fc0: 003e4ff0 00674450 0000000d 00000142 b57ff011
00040000 00040000 b6346874
    [  923.962547] 9fe0: 00000002 b6346688 b65478d0 b6f4867c 600f0010
ffffff9c 00000000 00000000
    [  923.963304] [<c0850638>] (_raw_spin_lock_irq) from [<bf045d44>]
(gs_close+0x2c/0x1f0 [u_serial])
    [  923.964117] [<bf045d44>] (gs_close [u_serial]) from
[<c04f96e8>] (tty_release+0xf0/0x49c)
    [  923.964863] [<c04f96e8>] (tty_release) from [<c04fb5a4>]
(tty_open+0x118/0x450)
    [  923.965526] [<c04fb5a4>] (tty_open) from [<c02b509c>]
(chrdev_open+0xe0/0x1b4)
    [  923.966188] [<c02b509c>] (chrdev_open) from [<c02ac538>]
(do_dentry_open+0x114/0x3f4)
    [  923.966897] [<c02ac538>] (do_dentry_open) from [<c02bf778>]
(path_openat+0x2f8/0x1128)
    [  923.967613] [<c02bf778>] (path_openat) from [<c02c1930>]
(do_filp_open+0x74/0xe4)
    [  923.968290] [<c02c1930>] (do_filp_open) from [<c02adb5c>]
(do_sys_open+0x174/0x208)
    [  923.968985] [<c02adb5c>] (do_sys_open) from [<c0101000>]
(ret_fast_syscall+0x0/0x54)
    [  923.969675] Exception stack(0xc6739fa8 to 0xc6739ff0)
    [  923.970136] 9fa0:                   003e4ff0 00674450 ffffff9c
003e4ff0 00000902 00000000
    [  923.970868] 9fc0: 003e4ff0 00674450 0000000d 00000142 b57ff011
00040000 00040000 b6346874
    [  923.971597] 9fe0: 00000002 b6346688 b65478d0 b6f4867c
    [  923.972065] Code: f57ff05b e12fff1e f10c0080 f590f000 (e1903f9f)
    [  923.972618] ---[ end trace 02edbbb9948c159c ]---
    [  938.908716] g_serial gadget: Gadget Serial v2.4
    [  938.909152] g_serial gadget: g_serial ready
    [  938.917148] dwc2 30180000.usb: bound driver g_serial
    [  939.176179] dwc2 30180000.usb: new device is high-speed
    [  939.215459] dwc2 30180000.usb: new address 17
    [  939.422037] g_serial gadget: high-speed config #2: CDC ACM config

So, I am a bit lost how to debug this so I'd like to know what kind of
information might be useful to find the root cause of it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
