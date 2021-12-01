Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 081C5464C35
	for <lists+linux-usb@lfdr.de>; Wed,  1 Dec 2021 11:57:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238038AbhLALA6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Dec 2021 06:00:58 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34866 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348970AbhLALAU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Dec 2021 06:00:20 -0500
Received: from [IPv6:2a00:23c6:c31a:b300:ebaf:3237:6d4:4abc] (unknown [IPv6:2a00:23c6:c31a:b300:ebaf:3237:6d4:4abc])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: martyn)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 649C01F4582C;
        Wed,  1 Dec 2021 10:56:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1638356218; bh=Ih4XEBSFrmawdMqurt9cKh1iAmZVVdPtBlcieQ4EF6Q=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=KDTljOxqAycvZOVA5A+uVujeUJQSsL/S9nWy7syLS0oczPmHYNQXIESkKEXKnhQsB
         9URKR7irowT6CAeBb+XfSjf4UtX3RABzrUdwHKrOM5OLB9SwTiMP93E3R4AcuJLTdB
         BbPdn2CAZWyaMY5g8Migh8QU5RoEy8IKGPHzV1cCU192GcZeiYJ1wN/R0T6uKg0FAp
         lMuH+A8RUtRD230/+ZFrPcm2WcP4z8Bt4xf6C12xPe2yE9TwfnUl9OJOjJ/Fc8Hgww
         Ty0q6NSY8zaVBEzLqes06MEOID3FnhLHP5Q5tDxkf80MDuqmD+HNZkFYN4sKVLkozR
         2TyrXIUN1oZ9w==
Message-ID: <4f7b5ddfbd4d51d6d676a8691db0a5d33b7c35d0.camel@collabora.com>
Subject: Re: [PATCH] net: usb: Correct PHY handling of smsc95xx
From:   Martyn Welch <martyn.welch@collabora.com>
To:     Ferry Toth <fntoth@gmail.com>, netdev@vger.kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Steve Glendinning <steve.glendinning@shawell.net>,
        UNGLinuxDriver@microchip.com,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, stable@kernel.org
Date:   Wed, 01 Dec 2021 10:56:55 +0000
In-Reply-To: <43ff7a4b-fce4-6ad1-4cea-67ef42234831@gmail.com>
References: <20211122184445.1159316-1-martyn.welch@collabora.com>
         <5cd6fc87-0f8d-0b9b-42be-8180540a94e7@gmail.com>
         <f8f0eb8f7dd9fdcf0435fd67681ecbb359718e18.camel@collabora.com>
         <6a06e3b7-df08-6ec0-6e74-95c21fa43f38@gmail.com>
         <93d3bb50040dd4519a65187d3412973831d2d797.camel@collabora.com>
         <43ff7a4b-fce4-6ad1-4cea-67ef42234831@gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2021-11-30 at 22:47 +0100, Ferry Toth wrote:
> Op 30-11-2021 om 19:52 schreef Martyn Welch:
> > On Mon, 2021-11-29 at 15:16 +0100, Ferry Toth wrote:
> > > Hi,
> > > Op 29-11-2021 om 13:08 schreef Martyn Welch:
> > >   
> > > > On Sat, 2021-11-27 at 18:48 +0100, Ferry Toth wrote:
> > > >   
> > > > > 
> > > > > The patch introduces a new error on each unplug:
> > > > > 
> > > > > usb 1-1: USB disconnect, device number 2
> > > > > usb 1-1.1: USB disconnect, device number 3
> > > > > smsc95xx 1-1.1:1.0 eth0: unregister 'smsc95xx' usb-xhci-
> > > > > hcd.1.auto-
> > > > > 1.1,
> > > > > smsc95xx USB 2.0 Ethernet
> > > > > smsc95xx 1-1.1:1.0 eth0: Link is Down
> > > > > smsc95xx 1-1.1:1.0 eth0: Failed to read reg index 0x00000114: -
> > > > > 19
> > > > > smsc95xx 1-1.1:1.0 eth0: Error reading MII_ACCESS
> > > > > smsc95xx 1-1.1:1.0 eth0: __smsc95xx_mdio_read: MII is busy
> > > > > smsc95xx 1-1.1:1.0 eth0: Failed to read reg index 0x00000114: -
> > > > > 19
> > > > > smsc95xx 1-1.1:1.0 eth0: Error reading MII_ACCESS
> > > > > smsc95xx 1-1.1:1.0 eth0: __smsc95xx_mdio_read: MII is busy
> > > > > smsc95xx 1-1.1:1.0 eth0: hardware isn't capable of remote
> > > > > wakeup
> > > > > 
> > > > Agh! Somehow missed that. I'm looking into it...
> > >   That would be great!
> > >   
> > 
> > They appear as a result of phy_disconnect() being called in unbind()
> > when the hardware has already been disconnected (which is kinda
> > likely
> > to physically be the case with USB devices...). The PHY is not going
> > to
> > be accessible, but such calls *are* needed for instances where we are
> > unbinding without the device having been physically removed and want
> > to
> > put the device in a suitable state. Failing with -ENODEV (as it
> > currently does) seems to be the right thing to do.
> > 
> > I wonder whether removing some of these error messages might be an
> > option? It appears that some of them are present in other drivers,
> > but
> > I don't know whether such messages get displayed when that hardware
> > is
> > unplugged too or whether I'm missing something that protects against
> > that.
> I just retried 5.10.63 and found it did not yet have the crash that you
> fix here. But it did have the above Error reading MII_ACCESS. So 
> apparently this is more of an older annoyance since smsc95xx v2.00?

That's an interesting observation. Trying the v4.19 stable branch I see
that these errors aren't generated, however it seems that the driver at
that point may not be making any attempt to stop the PHY when the
driver is unbound/disconnected, which explains the lack of errors.

> > > > 
> > > >   
> > > > > Also as reported earlier, (only) on first plug the more
> > > > > worrying
> > > > > but
> > > > > possibly unrelated crash still happens:
> > > > > ------------[ cut here ]------------
> > > > > DMA-API: xhci-hcd xhci-hcd.1.auto: cacheline tracking EEXIST,
> > > > > overlapping mappings aren't supported
> > > > > WARNING: CPU: 0 PID: 23 at kernel/dma/debug.c:570
> > > > > add_dma_entry+0x1d9/0x270
> > > > > Modules linked in: rfcomm iptable_nat bnep usb_f_uac2 u_audio
> > > > > snd_sof_nocodec usb_f_mass_storage usb_f_eem u_ether
> > > > > spi_pxa2xx_platform
> > > > > dw_dmac usb_f_serial u_serial libcomposite intel_mrfld_pwrbtn
> > > > > snd_sof_pci_intel_tng pwm_lpss_pci intel_mrfld_adc pwm_lpss
> > > > > snd_sof_pci
> > > > > snd_sof_intel_ipc snd_sof_intel_atom dw_dmac_pci dw_dmac_core
> > > > > snd_sof
> > > > > snd_sof_xtensa_dsp snd_soc_acpi spi_pxa2xx_pci brcmfmac
> > > > > brcmutil
> > > > > hci_uart leds_gpio btbcm ti_ads7950
> > > > > industrialio_triggered_buffer
> > > > > kfifo_buf tun ledtrig_timer ledtrig_heartbeat mmc_block
> > > > > extcon_intel_mrfld sdhci_pci cqhci sdhci led_class mmc_core
> > > > > intel_soc_pmic_mrfld btrfs libcrc32c xor zstd_compress
> > > > > zlib_deflate
> > > > > raid6_pq
> > > > > CPU: 0 PID: 23 Comm: kworker/0:1 Not tainted 5.15.1-edison-
> > > > > acpi-
> > > > > standard #1
> > > > > Hardware name: Intel Corporation Merrifield/BODEGA BAY, BIOS
> > > > > 542
> > > > > 2015.01.21:18.19.48
> > > > > Workqueue: usb_hub_wq hub_event
> > > > > RIP: 0010:add_dma_entry+0x1d9/0x270
> > > > > Code: ff 0f 84 97 00 00 00 4c 8b 67 50 4d 85 e4 75 03 4c 8b
> > > > > 27 e8
> > > > > 39
> > > > > ff
> > > > > 52 00 48 89 c6 4c 89 e2 48 c7 c7 f0 ab e7 a7 e8 c7 5c b5 00
> > > > > <0f> 0b
> > > > > 48
> > > > > 85 ed 0f 85 a4 b3 b5 00 8b 05 46 38 9f 01 85 c0 0f 85 df
> > > > > RSP: 0000:ffffb047400cfac8 EFLAGS: 00010282
> > > > > RAX: 0000000000000000 RBX: 00000000ffffffff RCX:
> > > > > ffff9e25fe217478
> > > > > RDX: 00000000ffffffd8 RSI: 0000000000000027 RDI:
> > > > > ffff9e25fe217470
> > > > > RBP: ffff9e25c12ff780 R08: ffffffffa83359a8 R09:
> > > > > 0000000000009ffb
> > > > > R10: 00000000ffffe000 R11: 3fffffffffffffff R12:
> > > > > ffff9e25c8a24040
> > > > > R13: 0000000000000001 R14: 0000000000000206 R15:
> > > > > 00000000000f8be4
> > > > > FS:  0000000000000000(0000) GS:ffff9e25fe200000(0000)
> > > > > knlGS:0000000000000000
> > > > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > > CR2: 00007f62c6d586d8 CR3: 0000000002f3c000 CR4:
> > > > > 00000000001006f0
> > > > > Call Trace:
> > > > >    dma_map_page_attrs+0xfb/0x250
> > > > >    ? usb_hcd_link_urb_to_ep+0x14/0xa0
> > > > >    usb_hcd_map_urb_for_dma+0x3b1/0x4e0
> > > > >    usb_hcd_submit_urb+0x93/0xbb0
> > > > >    ? create_prof_cpu_mask+0x20/0x20
> > > > >    ? arch_stack_walk+0x73/0xf0
> > > > >    ? usb_hcd_link_urb_to_ep+0x14/0xa0
> > > > >    ? prepare_transfer+0xff/0x140
> > > > >    usb_start_wait_urb+0x60/0x160
> > > > >    usb_control_msg+0xda/0x140
> > > > >    hub_ext_port_status+0x82/0x100
> > > > >    hub_event+0x1b1/0x1830
> > > > >    ? hub_activate+0x58c/0x860
> > > > >    process_one_work+0x1d4/0x370
> > > > >    worker_thread+0x48/0x3d0
> > > > >    ? rescuer_thread+0x360/0x360
> > > > >    kthread+0x122/0x140
> > > > >    ? set_kthread_struct+0x40/0x40
> > > > >    ret_from_fork+0x22/0x30
> > > > > ---[ end trace da6ffcd9fad23a74 ]---
> > > > > DMA-API: Mapped at:
> > > > >    debug_dma_map_page+0x60/0xf0
> > > > >    dma_map_page_attrs+0xfb/0x250
> > > > >    usb_hcd_map_urb_for_dma+0x3b1/0x4e0
> > > > >    usb_hcd_submit_urb+0x93/0xbb0
> > > > >    usb_start_wait_urb+0x60/0x160
> > > > > usb 1-1.1: new high-speed USB device number 3 using xhci-hcd
> > > > > usb 1-1.1: New USB device found, idVendor=0424,
> > > > > idProduct=ec00,
> > > > > bcdDevice= 2.00
> > > > > usb 1-1.1: New USB device strings: Mfr=1, Product=2,
> > > > > SerialNumber=3
> > > > > usb 1-1.1: Product: LAN9514
> > > > > usb 1-1.1: Manufacturer: SMSC
> > > > > usb 1-1.1: SerialNumber: 00951d0d
> > > > > 
> > > > > 
> > > > I'm not seeing that at all, but I've also been developing and
> > > > testing
> > > > on an ARM based device that has the LAN9500A I'm using built
> > > > into it.
> > > > 
> > > > I have also recently got a LAN9500A devkit which I've tried on
> > > > my
> > > > Ryzen
> > > > laptop and that's not throwing that error either.
> > > > 
> > > > Martyn
> > > Yes I am using the LAN9514 Evaluation board (EVB9514). Plugging
> > > the
> > > board into my desktop with 5.15 Ubuntu PPA kernel I also don't
> > > see this
> > > crash.
> > > OTOH I'm building vanilla kernel so no idea why this happens. It
> > > might
> > > be that I have CONFIG_DMA_API_DEBUG and Ubuntu not.
> > >   
> > 
> > I suspect this is probably unrelated (directly) to the driver then.
> 
> Maybe not related to this driver but possibly an old bug in hub.c
> which 
> only surfaces now due to patch "[PATCH] dma debug: report -EEXIST
> errors 
> in add_dma_entry"? And only shows when CONFIG_DMA_API_DEBUG is set?
> 
> Ferry
> 
> > Martyn
> > 
> > > 
> 

