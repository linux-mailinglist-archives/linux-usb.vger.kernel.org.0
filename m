Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 090591E14AF
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 21:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389717AbgEYTQ3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 May 2020 15:16:29 -0400
Received: from smtp2.math.uni-bielefeld.de ([129.70.45.13]:50832 "EHLO
        smtp2.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389460AbgEYTQ2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 May 2020 15:16:28 -0400
Received: from math.uni-bielefeld.de (kvm01.math.uni-bielefeld.de [129.70.45.15])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by smtp2.math.uni-bielefeld.de (Postfix) with ESMTPSA id 5B3536027C;
        Mon, 25 May 2020 21:16:25 +0200 (CEST)
Date:   Mon, 25 May 2020 21:16:24 +0200
From:   Jean Rene Dawin <jdawin@math.uni-bielefeld.de>
To:     linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: Re: Kernel Oops in cdc_acm
Message-ID: <20200525191624.GA28647@math.uni-bielefeld.de>
References: <20200525120026.GA11378@math.uni-bielefeld.de>
 <1590409690.2838.7.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590409690.2838.7.camel@suse.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Oliver Neukum wrote on Mon 25/05/20 14:28:
> 
> Hi,
> 
> it looks to me like I made a mistake in fixing the error handling for
> some devices. Could you test the attached patch?
> 
> 	Regards
> 		Oliver

> From 338fe738603d2612a317c9bec98236eb094ae109 Mon Sep 17 00:00:00 2001
> From: Oliver Neukum <oneukum@suse.com>
> Date: Mon, 25 May 2020 14:21:44 +0200
> Subject: [PATCH] CDC-ACM: heed quirk also in error handling
> 
> If buffers are iterated over in the error case, the lower limits
> for quirky devices must be heeded.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/class/cdc-acm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
> index 7678ae4afd53..be4543569822 100644
> --- a/drivers/usb/class/cdc-acm.c
> +++ b/drivers/usb/class/cdc-acm.c
> @@ -585,7 +585,7 @@ static void acm_softint(struct work_struct *work)
>  	}
>  
>  	if (test_and_clear_bit(ACM_ERROR_DELAY, &acm->flags)) {
> -		for (i = 0; i < ACM_NR; i++) 
> +		for (i = 0; i < acm->rx_buflimit; i++) 
>  			if (test_and_clear_bit(i, &acm->urbs_in_error_delay))
>  					acm_submit_read_urb(acm, i, GFP_NOIO);
>  	}
> -- 
> 2.16.4
> 

Hi,

thanks for the quick reply and the patch.

With the patch it is a different behaviour:

The first time the battery is removed and inserted again, everything is
quite fine. Except that the USB cable has to be plugged out and in for the
connection to be re-established. But that was needed in previous
kernels, too.

But if the battery is removed a second time, and inserted again and the
phone is turned on, it results in the traces below:


[  152.220209] usb 1-2: new high-speed USB device number 3 using ehci-pci
[  152.370626] usb 1-2: New USB device found, idVendor=0421, idProduct=06d3, bcdDevice=10.34
[  152.370629] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[  152.370631] usb 1-2: Product: Nokia 515
[  152.370633] usb 1-2: Manufacturer: Nokia
[  152.370635] usb 1-2: SerialNumber: 357888058069763
[  152.389002] cdc_acm 1-2:1.3: ttyACM1: USB ACM device
[  152.389614] usb 1-2: bad CDC descriptors
[  152.389689] usb 1-2: bad CDC descriptors

# remove battery first time
[  197.530805] usb 1-2: USB disconnect, device number 3
[  197.552601] cdc_acm 1-2:1.3: failed to set dtr/rts
[  197.847038] usb 1-2: new high-speed USB device number 4 using ehci-pci
[  197.996385] usb 1-2: New USB device found, idVendor=0421, idProduct=067a, bcdDevice= 0.04
[  197.996388] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[  197.996390] usb 1-2: Product: NOKIA USB ROM
[  197.996392] usb 1-2: Manufacturer: NOKIA
[  199.122934] usb 1-2: USB disconnect, device number 4

# ... similar for device 5 to 14

# insert battery and turn on phone
[  239.883845] usb 1-2: new high-speed USB device number 15 using ehci-pci
[  240.034011] usb 1-2: New USB device found, idVendor=0421, idProduct=06d3, bcdDevice=10.34
[  240.034014] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[  240.034016] usb 1-2: Product: Nokia 515
[  240.034018] usb 1-2: Manufacturer: Nokia
[  240.034020] usb 1-2: SerialNumber: 357888058069763
[  240.051887] cdc_acm 1-2:1.3: ttyACM1: USB ACM device
[  240.052498] usb 1-2: bad CDC descriptors
[  240.052574] usb 1-2: bad CDC descriptors

# remove USB cable because network doesn't come up automatically
[  416.475847] usb 1-2: USB disconnect, device number 15
[  416.509698] cdc_acm 1-2:1.3: failed to set dtr/rts

# insert USB cable
[  420.801127] usb 1-2: new high-speed USB device number 16 using ehci-pci
[  420.952738] usb 1-2: New USB device found, idVendor=0421, idProduct=06d3, bcdDevice=10.34
[  420.952741] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[  420.952743] usb 1-2: Product: Nokia 515
[  420.952745] usb 1-2: Manufacturer: Nokia
[  420.952747] usb 1-2: SerialNumber: 357888058069763
[  420.971623] cdc_acm 1-2:1.3: ttyACM1: USB ACM device
[  420.972474] usb 1-2: bad CDC descriptors
[  420.972551] usb 1-2: bad CDC descriptors
# Connection ok. Transferring data

# remove battery second time
[  525.734297] usb 1-2: USB disconnect, device number 16
[  525.753834] cdc_acm 1-2:1.3: failed to set dtr/rts
[  526.048151] usb 1-2: new high-speed USB device number 17 using ehci-pci
[  526.197512] usb 1-2: New USB device found, idVendor=0421, idProduct=067a, bcdDevice= 0.04
[  526.197516] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[  526.197518] usb 1-2: Product: NOKIA USB ROM
[  526.197520] usb 1-2: Manufacturer: NOKIA
[  527.324329] usb 1-2: USB disconnect, device number 17

# ... similar for device 18 to 36

# insert battery
[  564.928283] usb 1-2: new high-speed USB device number 37 using ehci-pci
[  565.078132] usb 1-2: New USB device found, idVendor=0421, idProduct=06d3, bcdDevice=10.34
[  565.078135] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[  565.078137] usb 1-2: Product: Nokia 515
[  565.078139] usb 1-2: Manufacturer: Nokia
[  565.078141] usb 1-2: SerialNumber: 357888058069763
[  565.095618] cdc_acm 1-2:1.3: ttyACM1: USB ACM device
[  565.096238] usb 1-2: bad CDC descriptors
[  565.096321] usb 1-2: bad CDC descriptors

# turn on phone
[  572.928634] ------------[ cut here ]------------
[  572.928643] WARNING: CPU: 0 PID: 0 at kernel/workqueue.c:1473 __queue_work+0x38a/0x430
[  572.928644] Modules linked in: ppp_deflate bsd_comp ppp_async ppp_generic slhc rndis_wlan rndis_host cdc_ether usbnet cfg80211 cdc_phonet phonet mii rfkill radeon snd_hda_codec_analog snd_hda_codec_generic coretemp i2c_algo_bit kvm_intel ttm ledtrig_audio snd_hda_codec_hdmi kvm snd_emu10k1 drm_kms_helper snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_util_mem snd_ac97_codec snd_hda_core cec mousedev input_leds rc_core snd_rawmidi snd_seq_device hid_generic ac97_bus iTCO_wdt snd_hwdep syscopyarea sysfillrect snd_pcm ppdev dcdbas mei_wdt iTCO_vendor_support irqbypass e1000e sysimgblt pktcdvd fb_sys_fops cdc_acm snd_timer usbhid parport_pc snd mei_me pcspkr parport emu10k1_gp evdev hid gameport mei i2c_i801 mac_hid intel_agp lpc_ich soundcore intel_gtt acpi_cpufreq drm sg agpgart ip_tables x_tables ext4 crc32c_generic crc16 mbcache jbd2 sr_mod uhci_hcd cdrom ehci_pci ehci_hcd ata_generic floppy pata_acpi
[  572.928695] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.7.0-rc6 #1
[  572.928696] Hardware name: Dell Inc. OptiPlex 755                 /0GM819, BIOS A22 06/11/2012
[  572.928699] RIP: 0010:__queue_work+0x38a/0x430
[  572.928701] Code: 72 b6 49 a9 00 01 1f 00 75 0f 65 48 8b 3c 25 c0 8b 01 00 f6 47 24 20 75 25 0f 0b 48 83 c4 10 5b 5d 41 5c 41 5d 41 5e 41 5f c3 <0f> 0b e9 bd fd ff ff 41 83 cc 02 48 8d 53 60 e9 a2 fd ff ff e8 fd
[  572.928703] RSP: 0018:ffffb99dc0003e70 EFLAGS: 00010002
[  572.928705] RAX: ffffa28a6a1cd790 RBX: ffffa28a6fe32700 RCX: 0000000000000000
[  572.928706] RDX: ffffa28a6a1cd798 RSI: 0000000000000000 RDI: 0000000000000001
[  572.928707] RBP: 0000000000000011 R08: ffffa28a6e802238 R09: ffffa28a6e802260
[  572.928708] R10: 0000000000000000 R11: ffffffffb784c6b8 R12: ffffa28a6ec18e00
[  572.928710] R13: 0000000000000000 R14: 0000000000000140 R15: ffffa28a6a1cd790
[  572.928712] FS:  0000000000000000(0000) GS:ffffa28a6fe00000(0000) knlGS:0000000000000000
[  572.928713] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  572.928715] CR2: 00007f2b4d8a8410 CR3: 0000000227670000 CR4: 00000000000406f0
[  572.928716] Call Trace:
[  572.928719]  <IRQ>
[  572.928725]  queue_work_on+0x36/0x40
[  572.928729]  __usb_hcd_giveback_urb+0x6f/0x120
[  572.928732]  usb_giveback_urb_bh+0xa6/0x100
[  572.928736]  tasklet_action_common.isra.0+0x5f/0x130
[  572.928740]  __do_softirq+0x111/0x34d
[  572.928743]  irq_exit+0xac/0xd0
[  572.928745]  do_IRQ+0x89/0x140
[  572.928748]  common_interrupt+0xf/0xf
[  572.928750]  </IRQ>
[  572.928752] RIP: 0010:mwait_idle+0x80/0x200
[  572.928754] Code: 8b 04 25 c0 8b 01 00 0f 01 c8 48 8b 00 a8 08 0f 85 74 01 00 00 e9 07 00 00 00 0f 00 2d 3b e5 43 00 31 c0 48 89 c1 fb 0f 01 c9 <e8> eb 39 ad ff 89 c5 66 66 66 66 90 65 48 8b 04 25 c0 8b 01 00 f0
[  572.928755] RSP: 0018:ffffffffb7803e80 EFLAGS: 00000246 ORIG_RAX: ffffffffffffffdb
[  572.928757] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
[  572.928758] RDX: 0000000000000000 RSI: 7fffff7a9f630eae RDI: ffffffffb7615f90
[  572.928759] RBP: 0000000000000000 R08: 00000066a171aa2e R09: 000000856102aafb
[  572.928761] R10: 0000000000000301 R11: 000000000000000c R12: ffffffffb7814840
[  572.928762] R13: 0000000000000000 R14: 0000000000000000 R15: ffffffffb7814840
[  572.928768]  do_idle+0x204/0x270
[  572.928772]  cpu_startup_entry+0x19/0x20
[  572.928775]  start_kernel+0x85f/0x884
[  572.928780]  secondary_startup_64+0xb6/0xc0
[  572.928784] ---[ end trace 61951ee4bf36f1be ]---
[  573.888424] usb 1-2: USB disconnect, device number 37

# no more messages

(gdb) l *usb_giveback_urb_bh+0xa6
0xfd6 is in usb_giveback_urb_bh (/tmp/linux-5.7-rc6/drivers/usb/core/hcd.c:1675).
1670	
1671			urb = list_entry(local_list.next, struct urb, urb_list);
1672			list_del_init(&urb->urb_list);
1673			bh->completing_ep = urb->ep;
1674			__usb_hcd_giveback_urb(urb);
1675			bh->completing_ep = NULL;
1676		}
1677	
1678		/* check if there are new URBs to giveback */
1679		spin_lock_irq(&bh->lock);
(gdb) l *__usb_hcd_giveback_urb+0x6f
0xe7f is in __usb_hcd_giveback_urb (/tmp/linux-5.7-rc6/drivers/usb/core/hcd.c:1650).
1645	
1646		/* pass ownership to the completion handler */
1647		urb->status = status;
1648		urb->complete(urb);
1649	
1650		usb_anchor_resume_wakeups(anchor);
1651		atomic_dec(&urb->use_count);
1652		if (unlikely(atomic_read(&urb->reject)))
1653			wake_up(&usb_kill_urb_queue);
1654		usb_put_urb(urb);
(gdb) 

Regards,
Jean Rene
