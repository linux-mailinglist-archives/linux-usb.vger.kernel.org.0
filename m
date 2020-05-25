Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E93711E0E15
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 14:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390317AbgEYMFl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 May 2020 08:05:41 -0400
Received: from smtp2.math.uni-bielefeld.de ([129.70.45.13]:49938 "EHLO
        smtp2.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390306AbgEYMFk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 May 2020 08:05:40 -0400
X-Greylist: delayed 309 seconds by postgrey-1.27 at vger.kernel.org; Mon, 25 May 2020 08:05:37 EDT
Received: from math.uni-bielefeld.de (kvm01.math.uni-bielefeld.de [129.70.45.15])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by smtp2.math.uni-bielefeld.de (Postfix) with ESMTPSA id CE8B26027C;
        Mon, 25 May 2020 14:00:27 +0200 (CEST)
Date:   Mon, 25 May 2020 14:00:26 +0200
From:   Jean Rene Dawin <jdawin@math.uni-bielefeld.de>
To:     linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: Kernel Oops in cdc_acm
Message-ID: <20200525120026.GA11378@math.uni-bielefeld.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I use a Nokia 515 connected via USB as a UMTS modem for my PC:
CPU0: Intel(R) Core(TM)2 Duo CPU     E8400  @ 3.00GHz (family: 0x6, model: 0x17, stepping: 0xa)

Output of lsusb -v -d for the device is attached.

The battery of the phone is old, and sometimes the phone just turns off.
Up intil recently (before 5.6.10) turning on the phone again would restore the connection.

But roughly since commits 0afccd7601514c4b83d8cc58c740089cc447051d and/or  4e7279cd1d19f48f0af2a10ed020febaa9ac092 the kernel gets an Oops and eventually the system hangs.
The behaviour is reproducible by taking out the battery from the phone during a connection.

Tested wtih 5.6.10, 5.6.14 and 5.7-rc6. The following dmesg output is from 5.7-rc6:


# connect USB cable to phone
[   59.829803] usb 1-2: new high-speed USB device number 2 using ehci-pci
[   59.981396] usb 1-2: New USB device found, idVendor=0421, idProduct=06d3, bcdDevice=10.34
[   59.981399] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[   59.981401] usb 1-2: Product: Nokia 515
[   59.981403] usb 1-2: Manufacturer: Nokia
[   59.981405] usb 1-2: SerialNumber: 357888058069763
[   59.999766] cdc_acm 1-2:1.3: ttyACM1: USB ACM device
[   60.168058] NET: Registered protocol family 35
[   60.220317] usbcore: registered new interface driver cdc_phonet
[   60.613363] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[   60.627472] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   60.639107] platform regulatory.0: Direct firmware load for regulatory.db failed with error -2
[   60.639109] cfg80211: failed to load regulatory.db
[   60.704801] usbcore: registered new interface driver cdc_ether
[   60.733393] usb 1-2: bad CDC descriptors
[   60.733721] usbcore: registered new interface driver rndis_host
[   60.781979] usb 1-2: bad CDC descriptors
[   60.782581] usbcore: registered new interface driver rndis_wlan

# remove USB cable from phone
[   69.543818] usb 1-2: USB disconnect, device number 2

# connect USB cable to phone
[   75.276486] usb 1-2: new high-speed USB device number 3 using ehci-pci
[   75.427623] usb 1-2: New USB device found, idVendor=0421, idProduct=06d3, bcdDevice=10.34
[   75.427626] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[   75.427628] usb 1-2: Product: Nokia 515
[   75.427630] usb 1-2: Manufacturer: Nokia
[   75.427632] usb 1-2: SerialNumber: 357888058069763
[   75.446969] cdc_acm 1-2:1.3: ttyACM1: USB ACM device
[   75.447734] usb 1-2: bad CDC descriptors
[   75.447819] usb 1-2: bad CDC descriptors

# remove battery from phone
[  328.284229] usb 1-2: USB disconnect, device number 3
[  328.308826] cdc_acm 1-2:1.3: failed to set dtr/rts
[  332.757719] usb 1-2: new high-speed USB device number 4 using ehci-pci
[  332.906985] usb 1-2: New USB device found, idVendor=0421, idProduct=067a, bcdDevice= 0.04
[  332.906988] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[  332.906990] usb 1-2: Product: NOKIA USB ROM
[  332.906992] usb 1-2: Manufacturer: NOKIA
[  334.033533] usb 1-2: USB disconnect, device number 4

# ... similar messages for device number 5 until 9

# insert battery into phone
[  346.147723] usb 1-2: new high-speed USB device number 10 using ehci-pci
[  346.297258] usb 1-2: New USB device found, idVendor=0421, idProduct=06d3, bcdDevice=10.34
[  346.297261] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[  346.297263] usb 1-2: Product: Nokia 515
[  346.297265] usb 1-2: Manufacturer: Nokia
[  346.297267] usb 1-2: SerialNumber: 357888058069763
[  346.314973] cdc_acm 1-2:1.3: ttyACM1: USB ACM device
[  346.315577] usb 1-2: bad CDC descriptors
[  346.316096] usb 1-2: bad CDC descriptors

# switch on phone
[  355.209929] BUG: unable to handle page fault for address: 000000003697c000
[  355.209934] #PF: supervisor read access in kernel mode
[  355.209936] #PF: error_code(0x0000) - not-present page
[  355.209938] PGD 0 P4D 0 
[  355.209942] Oops: 0000 [#1] PREEMPT SMP PTI
[  355.209945] CPU: 0 PID: 226 Comm: kworker/0:2 Not tainted 5.7.0-rc6 #1
[  355.209947] Hardware name: Dell Inc. OptiPlex 755                 /0GM819, BIOS A22 06/11/2012
[  355.209956] Workqueue: events acm_softint [cdc_acm]
[  355.209962] RIP: 0010:dev_vprintk_emit+0x57/0x1f8
[  355.209965] Code: 20 00 00 00 48 89 54 24 08 65 48 8b 04 25 28 00 00 00 48 89 84 24 a0 00 00 00 31 c0 f3 ab 48 8b 86 b8 02 00 00 48 85 c0 74 05 <4c> 8b 28 eb 12 48 8b 56 60 31 c9 48 85 d2 0f 84 4e 01 00 00 4c 8b
[  355.209967] RSP: 0018:ffffb38b40767c80 EFLAGS: 00010206
[  355.209970] RAX: 000000003697c000 RBX: ffff9bbcb8e36020 RCX: 0000000000000000
[  355.209972] RDX: ffffffff8b7afa65 RSI: ffff9bbcb8e36060 RDI: ffffb38b40767d20
[  355.209974] RBP: ffffb38b40767db0 R08: ffff9bbcc475b800 R09: ffffb38b40767dc0
[  355.209976] R10: 0000000000000003 R11: 0000000000000018 R12: ffff9bbcb8e367b0
[  355.209978] R13: ffff9bbcb8e36020 R14: ffffb38b40767ca0 R15: ffff9bbcb8e36060
[  355.209980] FS:  0000000000000000(0000) GS:ffff9bbcefe00000(0000) knlGS:0000000000000000
[  355.209983] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  355.209985] CR2: 000000003697c000 CR3: 000000022b002000 CR4: 00000000000406f0
[  355.209987] Call Trace:
[  355.209995]  dev_printk_emit+0x5e/0x75
[  355.210000]  ? __switch_to_asm+0x40/0x70
[  355.210002]  ? __switch_to_asm+0x34/0x70
[  355.210004]  ? __switch_to_asm+0x40/0x70
[  355.210008]  ? tty_port_lower_dtr_rts+0x20/0x20
[  355.210011]  _dev_err+0x7b/0x92
[  355.210017]  acm_submit_read_urb.cold+0x1c/0x25 [cdc_acm]
[  355.210021]  acm_softint+0x65/0xe0 [cdc_acm]
[  355.210026]  process_one_work+0x1da/0x3d0
[  355.210030]  worker_thread+0x4a/0x3d0
[  355.210034]  kthread+0x122/0x160
[  355.210037]  ? process_one_work+0x3d0/0x3d0
[  355.210039]  ? kthread_park+0x90/0x90
[  355.210042]  ret_from_fork+0x35/0x40
[  355.210046] Modules linked in: ppp_deflate bsd_comp ppp_async ppp_generic slhc rndis_wlan rndis_host cdc_ether usbnet cfg80211 cdc_phonet phonet mii rfkill radeon snd_hda_codec_analog snd_hda_codec_generic ledtrig_audio coretemp snd_hda_codec_hdmi kvm_intel snd_hda_intel i2c_algo_bit snd_emu10k1 ttm snd_intel_dspcfg snd_hda_codec drm_kms_helper kvm snd_util_mem snd_ac97_codec snd_hda_core snd_rawmidi snd_seq_device cec ac97_bus snd_hwdep snd_pcm rc_core mousedev input_leds syscopyarea hid_generic ppdev mei_wdt iTCO_wdt sysfillrect iTCO_vendor_support pktcdvd snd_timer dcdbas cdc_acm irqbypass emu10k1_gp gameport e1000e sysimgblt usbhid pcspkr parport_pc evdev snd mei_me mac_hid fb_sys_fops hid soundcore mei parport lpc_ich intel_agp i2c_i801 intel_gtt acpi_cpufreq drm sg agpgart ip_tables x_tables ext4 crc32c_generic crc16 mbcache jbd2 uhci_hcd ata_generic floppy ehci_pci ehci_hcd sr_mod cdrom pata_acpi
[  355.210097] CR2: 000000003697c000
[  355.210101] ---[ end trace fbed6981d1f79e84 ]---
[  355.210104] RIP: 0010:dev_vprintk_emit+0x57/0x1f8
[  355.210107] Code: 20 00 00 00 48 89 54 24 08 65 48 8b 04 25 28 00 00 00 48 89 84 24 a0 00 00 00 31 c0 f3 ab 48 8b 86 b8 02 00 00 48 85 c0 74 05 <4c> 8b 28 eb 12 48 8b 56 60 31 c9 48 85 d2 0f 84 4e 01 00 00 4c 8b
[  355.210109] RSP: 0018:ffffb38b40767c80 EFLAGS: 00010206
[  355.210112] RAX: 000000003697c000 RBX: ffff9bbcb8e36020 RCX: 0000000000000000
[  355.210114] RDX: ffffffff8b7afa65 RSI: ffff9bbcb8e36060 RDI: ffffb38b40767d20
[  355.210116] RBP: ffffb38b40767db0 R08: ffff9bbcc475b800 R09: ffffb38b40767dc0
[  355.210118] R10: 0000000000000003 R11: 0000000000000018 R12: ffff9bbcb8e367b0
[  355.210120] R13: ffff9bbcb8e36020 R14: ffffb38b40767ca0 R15: ffff9bbcb8e36060
[  355.210122] FS:  0000000000000000(0000) GS:ffff9bbcefe00000(0000) knlGS:0000000000000000
[  355.210125] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  355.210127] CR2: 000000003697c000 CR3: 000000022b002000 CR4: 00000000000406f0
[  355.602759] ------------[ cut here ]------------
[  355.602766] WARNING: CPU: 0 PID: 0 at kernel/workqueue.c:1473 __queue_work+0x38a/0x430
[  355.602768] Modules linked in: ppp_deflate bsd_comp ppp_async ppp_generic slhc rndis_wlan rndis_host cdc_ether usbnet cfg80211 cdc_phonet phonet mii rfkill radeon snd_hda_codec_analog snd_hda_codec_generic ledtrig_audio coretemp snd_hda_codec_hdmi kvm_intel snd_hda_intel i2c_algo_bit snd_emu10k1 ttm snd_intel_dspcfg snd_hda_codec drm_kms_helper kvm snd_util_mem snd_ac97_codec snd_hda_core snd_rawmidi snd_seq_device cec ac97_bus snd_hwdep snd_pcm rc_core mousedev input_leds syscopyarea hid_generic ppdev mei_wdt iTCO_wdt sysfillrect iTCO_vendor_support pktcdvd snd_timer dcdbas cdc_acm irqbypass emu10k1_gp gameport e1000e sysimgblt usbhid pcspkr parport_pc evdev snd mei_me mac_hid fb_sys_fops hid soundcore mei parport lpc_ich intel_agp i2c_i801 intel_gtt acpi_cpufreq drm sg agpgart ip_tables x_tables ext4 crc32c_generic crc16 mbcache jbd2 uhci_hcd ata_generic floppy ehci_pci ehci_hcd sr_mod cdrom pata_acpi
[  355.602811] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G      D           5.7.0-rc6 #1
[  355.602814] Hardware name: Dell Inc. OptiPlex 755                 /0GM819, BIOS A22 06/11/2012
[  355.602817] RIP: 0010:__queue_work+0x38a/0x430
[  355.602820] Code: 72 96 75 a9 00 01 1f 00 75 0f 65 48 8b 3c 25 c0 8b 01 00 f6 47 24 20 75 25 0f 0b 48 83 c4 10 5b 5d 41 5c 41 5d 41 5e 41 5f c3 <0f> 0b e9 bd fd ff ff 41 83 cc 02 48 8d 53 60 e9 a2 fd ff ff e8 fd
[  355.602822] RSP: 0018:ffffb38b40003e70 EFLAGS: 00010002
[  355.602825] RAX: ffff9bbcb8e36790 RBX: ffff9bbcefe32700 RCX: 0000000000000000
[  355.602827] RDX: ffff9bbcb8e36798 RSI: 0000000000000000 RDI: 0000000000000001
[  355.602829] RBP: 0000000000000025 R08: ffff9bbcee802238 R09: ffff9bbcee802260
[  355.602831] R10: 0000000000000000 R11: ffffffff8ba4c6b8 R12: ffff9bbceec18e00
[  355.602833] R13: 0000000000000000 R14: 0000000000000140 R15: ffff9bbcb8e36790
[  355.602836] FS:  0000000000000000(0000) GS:ffff9bbcefe00000(0000) knlGS:0000000000000000
[  355.602838] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  355.602840] CR2: 00007fc9ae17f000 CR3: 000000022b800000 CR4: 00000000000406f0
[  355.602842] Call Trace:
[  355.602846]  <IRQ>
[  355.602851]  queue_work_on+0x36/0x40
[  355.602856]  __usb_hcd_giveback_urb+0x6f/0x120
[  355.602859]  usb_giveback_urb_bh+0xa6/0x100
[  355.602864]  tasklet_action_common.isra.0+0x5f/0x130
[  355.602868]  __do_softirq+0x111/0x34d
[  355.602872]  irq_exit+0xac/0xd0
[  355.602875]  do_IRQ+0x89/0x140
[  355.602878]  common_interrupt+0xf/0xf
[  355.602880]  </IRQ>
[  355.602883] RIP: 0010:mwait_idle+0x80/0x200
[  355.602886] Code: 8b 04 25 c0 8b 01 00 0f 01 c8 48 8b 00 a8 08 0f 85 74 01 00 00 e9 07 00 00 00 0f 00 2d 3b e5 43 00 31 c0 48 89 c1 fb 0f 01 c9 <e8> eb 39 ad ff 89 c5 66 66 66 66 90 65 48 8b 04 25 c0 8b 01 00 f0
[  355.602888] RSP: 0018:ffffffff8ba03e80 EFLAGS: 00000246 ORIG_RAX: ffffffffffffffdc
[  355.602891] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
[  355.602893] RDX: 0000000000000000 RSI: 7fffffad34e49283 RDI: ffffffff8b815f90
[  355.602895] RBP: 0000000000000000 R08: 00000066a171aa2e R09: 00000052d20f9e9b
[  355.602897] R10: 0000000000000004 R11: 000000000008d19a R12: ffffffff8ba14840
[  355.602899] R13: 0000000000000000 R14: 0000000000000000 R15: ffffffff8ba14840
[  355.602905]  do_idle+0x204/0x270
[  355.602909]  cpu_startup_entry+0x19/0x20
[  355.602913]  start_kernel+0x85f/0x884
[  355.602918]  secondary_startup_64+0xb6/0xc0
[  355.602923] ---[ end trace fbed6981d1f79e85 ]---
[  362.628141] cdc_acm 1-2:1.3: failed to set dtr/rts
[  372.634805] cdc_acm 1-2:1.4: urb 3 failed submission with -22
[  382.648907] cdc_acm 1-2:1.4: urb 3 failed submission with -22

# ... similar messages every 10 sconds

I tried to use gdb for more info about the messages. But I'm a novice here. If more or different info is needed, I'm happy to provide it.

$ gdb drivers/usb/class/cdc-acm.o 

(gdb) l *acm_softint+0x65
0x2665 is in acm_softint (/tmp/linux-5.7-rc6/drivers/usb/class/cdc-acm.c:587).
582				clear_bit(EVENT_RX_STALL, &acm->flags);
583			}
584		}
585	
586		if (test_and_clear_bit(ACM_ERROR_DELAY, &acm->flags)) {
587			for (i = 0; i < ACM_NR; i++) 
588				if (test_and_clear_bit(i, &acm->urbs_in_error_delay))
589						acm_submit_read_urb(acm, i, GFP_NOIO);
590		}
591	

(gdb) l acm_submit_read_urb.cold
428			return 0;
429	
430		res = usb_submit_urb(acm->read_urbs[index], mem_flags);
431		if (res) {
432			if (res != -EPERM && res != -ENODEV) {
433				dev_err(&acm->data->dev,
434					"urb %d failed submission with %d\n",
435					index, res);
436			} else {
437				dev_vdbg(&acm->data->dev, "intended failure %d\n", res);

(gdb) l *acm_submit_read_urb+0x1c
0x206c is in acm_submit_read_urb (/tmp/linux-5.7-rc6/arch/x86/include/asm/bitops.h:162).
157	}
158	
159	static __always_inline bool
160	arch_test_and_clear_bit(long nr, volatile unsigned long *addr)
161	{
162		return GEN_BINARY_RMWcc(LOCK_PREFIX __ASM_SIZE(btr), *addr, c, "Ir", nr);
163	}
164	
165	/*
166	 * Note: the operation is performed atomically with respect to

Regards,
Jean Rene Dawin

--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=nokia515_lsusb


Bus 001 Device 017: ID 0421:06d3 Nokia Mobile Phones Nokia 515
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            2 Communications
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  idVendor           0x0421 Nokia Mobile Phones
  idProduct          0x06d3 
  bcdDevice           10.34
  iManufacturer           1 Nokia
  iProduct                2 Nokia 515
  iSerial                 3 357888058069763
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0124
    bNumInterfaces          9
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         2 Communications
      bInterfaceSubClass      8 Wireless Handset Control
      bInterfaceProtocol      0 
      iInterface              0 
      CDC Header:
        bcdCDC               1.10
      CDC WHCM:
        bcdVersion           1.00
      CDC Union:
        bMasterInterface        0
        bSlaveInterface         1 2 3 4 5 6 7 8 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         2 Communications
      bInterfaceSubClass    254 
      bInterfaceProtocol      0 
      iInterface              0 
      CDC Header:
        bcdCDC               1.10
      UNRECOGNIZED CDC:  05 24 ab 05 71
      CDC Union:
        bMasterInterface        1
        bSlaveInterface         2 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
      ** UNRECOGNIZED:  04 24 fd 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 Communications
      bInterfaceSubClass      2 Abstract (modem)
      bInterfaceProtocol      1 AT-commands (v.25ter)
      iInterface              0 
      CDC Header:
        bcdCDC               1.10
      CDC ACM:
        bmCapabilities       0x06
          sends break
          line coding and serial state
      CDC Call Management:
        bmCapabilities       0x03
          call management
          use DataInterface
        bDataInterface          4
      CDC Union:
        bMasterInterface        3
        bSlaveInterface         4 
      UNRECOGNIZED CDC:  04 24 fd 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               9
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        4
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
      ** UNRECOGNIZED:  04 24 fd 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        5
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         2 Communications
      bInterfaceSubClass     11 OBEX
      bInterfaceProtocol      0 
      iInterface              0 
      CDC Header:
        bcdCDC               1.10
      CDC OBEX:
        bcdVersion           1.00
      CDC Union:
        bMasterInterface        5
        bSlaveInterface         6 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        6
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        6
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
      ** UNRECOGNIZED:  04 24 fd 01
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        7
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 Communications
      bInterfaceSubClass      2 Abstract (modem)
      bInterfaceProtocol    255 Vendor Specific (MSFT RNDIS?)
      iInterface              0 
      CDC Header:
        bcdCDC               1.10
      CDC ACM:
        bmCapabilities       0x06
          sends break
          line coding and serial state
      CDC Call Management:
        bmCapabilities       0x03
          call management
          use DataInterface
        bDataInterface          8
      CDC Union:
        bMasterInterface        7
        bSlaveInterface         8 
      UNRECOGNIZED CDC:  04 24 fd 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval              11
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        8
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
      ** UNRECOGNIZED:  04 24 fd 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x86  EP 6 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x06  EP 6 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass            2 Communications
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  bNumConfigurations      1
Device Status:     0x0000
  (Bus Powered)

--NzB8fVQJ5HfG6fxh--
