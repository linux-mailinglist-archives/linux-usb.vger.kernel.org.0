Return-Path: <linux-usb+bounces-1293-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAC17BE8C7
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 19:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FED32817E3
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 17:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA03138DFA;
	Mon,  9 Oct 2023 17:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zpVjJqqk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F53135880
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 17:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ACA5C433C8;
	Mon,  9 Oct 2023 17:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696874320;
	bh=QHk/1cXuOaKOHr5dgDNjM07x1Qv6Chk95JyiSPtJudY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zpVjJqqkD48GKNv5Cov+/E51bMrXAgf/wS9MIfjnwN1eMPEkzscGbPnmupu12vBNM
	 bayR4sDosWeffdiz9s/7XMsVNt4O3aZXRDO0/h9RnM8E4C34tvYrejV2UUHqXfd8ok
	 OAAROeQZnHyCSO0KQbOZ0TW6vbdg4dhDDuBz5SkU=
Date: Mon, 9 Oct 2023 19:58:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: jlmxyz <dev.delaboetie@dolce-energy.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: usb-c port power not reset correctly (can't connect any device
 after a phone was connected)
Message-ID: <2023100920-pushy-polygraph-f4a2@gregkh>
References: <9f99a188-cb45-439c-8006-dc0cd4e1ef3e@dolce-energy.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f99a188-cb45-439c-8006-dc0cd4e1ef3e@dolce-energy.com>

On Mon, Oct 09, 2023 at 12:50:54PM +0200, jlmxyz wrote:
> Hi,
> 
> my hardware :https://wiki.gentoo.org/wiki/Lenovo_Yoga_900
> I use the pre-built gentoo linux kernel,
> Linux jlmyoga900 6.5.5-gentoo-dist #1 SMP PREEMPT_DYNAMIC Sat Sep 23 17:31:47 -00 2023 x86_64 Intel(R) Core(TM) i7-6500U CPU @ 2.50GHz GenuineIntel GNU/Linux
> 
> 
> output of lsusb, phone connected on usb-c port, phone in "share connection virtual network adaptater mode"
> $ lsusb -t
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/6p, 5000M
>     |__ Port 3: Dev 12, If 0, Class=Wireless, Driver=rndis_host, 5000M
>     |__ Port 3: Dev 12, If 1, Class=CDC Data, Driver=rndis_host, 5000M
>     |__ Port 3: Dev 12, If 2, Class=Vendor Specific Class, Driver=, 5000M
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/12p, 480M
>     |__ Port 6: Dev 2, If 0, Class=Video, Driver=uvcvideo, 480M
>     |__ Port 6: Dev 2, If 1, Class=Video, Driver=uvcvideo, 480M
>     |__ Port 7: Dev 4, If 0, Class=Wireless, Driver=btusb, 12M
>     |__ Port 7: Dev 4, If 1, Class=Wireless, Driver=btusb, 12M
> 
> output of lsusb, micro sd card connected on usb-c port using usb-A-usb-c adaptater (works on the phone),
> $ lsusb -t
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/6p, 5000M
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/12p, 480M
>     |__ Port 6: Dev 2, If 0, Class=Video, Driver=uvcvideo, 480M
>     |__ Port 6: Dev 2, If 1, Class=Video, Driver=uvcvideo, 480M
>     |__ Port 7: Dev 4, If 0, Class=Wireless, Driver=btusb, 12M
>     |__ Port 7: Dev 4, If 1, Class=Wireless, Driver=btusb, 12M
> 
> output of lsusb, micro sd card connected on usb-A port,
> $ lsusb -t
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/6p, 5000M
>     |__ Port 2: Dev 13, If 0, Class=Mass Storage, Driver=usb-storage, 5000M
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/12p, 480M
>     |__ Port 6: Dev 2, If 0, Class=Video, Driver=uvcvideo, 480M
>     |__ Port 6: Dev 2, If 1, Class=Video, Driver=uvcvideo, 480M
>     |__ Port 7: Dev 4, If 0, Class=Wireless, Driver=btusb, 12M
>     |__ Port 7: Dev 4, If 1, Class=Wireless, Driver=btusb, 12M
> 
> output of dmesg
> ---- connecting the phone
> [371134.453914] xhci_hcd 0000:00:14.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
> [371162.893880] usb usb2-port3: config error
> [371163.527330] usb 2-3: new SuperSpeed USB device number 11 using xhci_hcd
> [371163.544872] usb 2-3: New USB device found, idVendor=04e8, idProduct=685d, bcdDevice= 4.14
> [371163.544881] usb 2-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [371163.544885] usb 2-3: Product: SM-N975F
> [371163.544888] usb 2-3: Manufacturer: samsung
> [371163.544890] usb 2-3: SerialNumber: RF8M73LKC5E
> [371181.443775] usb 2-3: USB disconnect, device number 11
> [371181.700584] usb 2-3: new SuperSpeed USB device number 12 using xhci_hcd
> [371181.718597] usb 2-3: New USB device found, idVendor=04e8, idProduct=6864, bcdDevice= 4.14
> [371181.718606] usb 2-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [371181.718610] usb 2-3: Product: SM-N975F
> [371181.718613] usb 2-3: Manufacturer: samsung
> [371181.718615] usb 2-3: SerialNumber: RF8M73LKC5E
> [371181.843263] usbcore: registered new interface driver cdc_ether
> [371181.850720] rndis_host 2-3:1.0 usb0: register 'rndis_host' at usb-0000:00:14.0-3, RNDIS device, 02:24:0a:73:0e:02
> [371181.851343] usbcore: registered new interface driver rndis_host
> [371181.905461] rndis_host 2-3:1.0 enp0s20f0u3: renamed from usb0
> [371275.791820] usb 2-3: USB disconnect, device number 12
> [371275.791890] rndis_host 2-3:1.0 enp0s20f0u3: unregister 'rndis_host' usb-0000:00:14.0-3, RNDIS device
> ----- disconnecting the phone connecting the usb masstorage usb-c port
> ----- disconnecting the masstorage usb-c - connecting same device on usb-A port next to it
> [371352.897323] usb 2-2: new SuperSpeed USB device number 13 using xhci_hcd
> [371352.916934] usb 2-2: New USB device found, idVendor=11b0, idProduct=3307, bcdDevice= 0.13
> [371352.916949] usb 2-2: New USB device strings: Mfr=3, Product=4, SerialNumber=2
> [371352.916951] usb 2-2: Product: UHSII uSD Reader
> [371352.916954] usb 2-2: Manufacturer: Kingston
> [371352.916955] usb 2-2: SerialNumber: 202006001890
> [371352.919919] usb-storage 2-2:1.0: USB Mass Storage device detected
> [371352.939695] scsi host3: usb-storage 2-2:1.0
> [371353.951776] scsi 3:0:0:0: Direct-Access     Kingston UHSII uSD Reader 0013 PQ: 0 ANSI: 6
> [371353.952333] sd 3:0:0:0: Attached scsi generic sg1 type 0
> [371354.333610] sd 3:0:0:0: [sdb] 500695040 512-byte logical blocks: (256 GB/239 GiB)
> [371354.334277] sd 3:0:0:0: [sdb] Write Protect is off
> [371354.334282] sd 3:0:0:0: [sdb] Mode Sense: 21 00 00 00
> [371354.334902] sd 3:0:0:0: [sdb] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
> [371354.338703]  sdb: sdb1
> [371354.338841] sd 3:0:0:0: [sdb] Attached SCSI removable disk
> 
> there is no dmesg entry when connecting on the usb-c as if there was no power

I don't understand, it shows the phone connecting above.

> I tried on phone to change the device powering the port, but I always get error, when connecting the phone, even if it is in "charge only" mode, the battery icon don't show any charging information.... looks like the port is always powered by the phone and the first time the device powering the port is choosen in power negociation, the port will after remain in slave-power mode on the laptop....

Are you sure the phone is handling this properly?  Many times it will
refuse to connect to a host at all until you tell it is safe to do so
somehow (like change the USB mode.)

> I will gladely help troubleshooting the issue, having a usb port less over 3 is really problematic

I don't understand this question, sorry.

greg k-h

