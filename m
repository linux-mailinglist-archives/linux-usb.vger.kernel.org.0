Return-Path: <linux-usb+bounces-17089-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1AE9BC470
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 05:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD0F11C20D8F
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 04:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9570E18FC92;
	Tue,  5 Nov 2024 04:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="gv5IEok3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAC4817
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 04:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730782411; cv=none; b=YI5xl+4WD0/xNg+qoIeki2yjN67AGYb0CzbB93g9iDtQ5zU9YGvCTbb6ywbnOjZvL8nuvBFp0r8lyZVuwyWXL2NmZFlaxtWhO9TCGblLo011//3MTJTv6PS61wa12/vpgC8369RJceZtn1RGA7jlZrciUkfKI65JIP3v5qmjfAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730782411; c=relaxed/simple;
	bh=EWOOD4wpUNgcHEaQFHftfn7CdZaf1rsjhzJ/x2MlUBk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AobsCqkibmJWXCUZhlaG8YIhb8AKYKsCUmgPjAsOAsVzBB3EWol9x0Mv14SZNz4pc+OjTnjjt/5atYEUSyu6dQx+BZvyxED9urMux6t9ziJQ+YyXA10zJ+xNnitD0OnMZ4PumBjxkVr0H1/kRaDOROZVPeGUBHwejql/q87ZINc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b=gv5IEok3; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71e3fce4a60so4000924b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2024 20:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1730782406; x=1731387206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coCLQr85Me0Liw3j/JRhXohXqusYlvakg9TQZ/Q7ZHE=;
        b=gv5IEok3+jAekSA955TONmlG8XoZiyPh9JUl6G7D9HOr3ih7tXIIYhzIyXtj1wNFW1
         S/sgV1rZlIhINlChX+wHz0rQ3vzVvMmz6JFmdrQLDcVnfO/eqb8fOil+gs38WcivEgSC
         nlKumZn4YW7q0YCtds9lcr6lcBUx8aC3vqD8FVMPC/rXSfO54xlaTR2EJhn5LOhgnefg
         VbbVGTDe+hpAHvxVUMEfBojr/tweW53/fuHuFGeWeIU/7M6Fqx16RQUHV1QFEO1p/tDI
         Ti6CDsLmDCU/EUd8+oDYaGU3FTivvSUleqEsl61TQgrClbyHHfZRGaF5HxgIYFVH92LU
         5NOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730782406; x=1731387206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=coCLQr85Me0Liw3j/JRhXohXqusYlvakg9TQZ/Q7ZHE=;
        b=LtnO60Xq0ChWNK1rwYcuazshzYieit6RfeXXjyyfj7ksr2zS4ihG+o+XooE+c69gp/
         evzlZFEKNAXA9ZULrKEvjI1tHuTtAhGBxgnIMR/xoHG8ITRftyJlnMW2d50oaOeGiHlA
         C0yjy9wLwBs7XPG+vxcToao7KU0JFl3OLT6LYDXOivSnEK0bFh3TcYgdlAO85GBKYONQ
         rZXj+9npWXoXLQnklowy11CHkdUPdE3lG1rYKUknVAWJ+7LyjMFfh78l/tImT8jRHgRG
         V3NmoNfIYTUnu2k1IGNn4YSeP13buk+qI9qxokIZpyYbT1wBi9Dn2R6v8MvntkCOAW5M
         MBfQ==
X-Gm-Message-State: AOJu0YxaH4xP8Q2bbWkNjf63pzCLc1BfxZOehTWxj1404pj7P7ibi3NY
	prmy7YjI1ZZedStH1zsN9+VfXyDX+ETS2oxA9x4NbaVHgYqGJeXrvf4eHw8ubMs=
X-Google-Smtp-Source: AGHT+IHK9nARnQtnprsJAGKHzCAJBGA8Jp+xDqCuGrHFrOmcqadLcEKeh2kIcJuDuyoJ16LyRwPTSQ==
X-Received: by 2002:a05:6a00:2282:b0:71e:6ca4:6f60 with SMTP id d2e1a72fcca58-72062f825e3mr51206394b3a.12.1730782405420;
        Mon, 04 Nov 2024 20:53:25 -0800 (PST)
Received: from hermes.local (204-195-96-226.wavecable.com. [204.195.96.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc3152fesm8541817b3a.195.2024.11.04.20.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 20:53:25 -0800 (PST)
Date: Mon, 4 Nov 2024 20:53:23 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
Subject: Re: USB warning on boot
Message-ID: <20241104205323.364bc684@hermes.local>
In-Reply-To: <9d973212-fabe-43b3-bc3b-4a5c0632c230@rowland.harvard.edu>
References: <20241025135649.2d08be87@hermes.local>
	<9b1343ee-2806-464c-a99c-5bae44985cc7@rowland.harvard.edu>
	<20241025152340.35be2607@hermes.local>
	<9d973212-fabe-43b3-bc3b-4a5c0632c230@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 25 Oct 2024 22:23:54 -0400
Alan Stern <stern@rowland.harvard.edu> wrote:

> On Fri, Oct 25, 2024 at 03:23:40PM -0700, Stephen Hemminger wrote:
> > On Fri, 25 Oct 2024 18:03:25 -0400
> > Alan Stern <stern@rowland.harvard.edu> wrote:
> >   
> > > On Fri, Oct 25, 2024 at 01:56:49PM -0700, Stephen Hemminger wrote:  
> > > > This is on a new AMD based mini-PC with Debian testing (6.11.4-amd64).
> > > > Looks like a USB driver bug.
> > > > 
> > > > On every boot, this shows up in the log although the system seems to recover ok.    
> > >   
> > > > [    5.644432] usb 2-1.4: new SuperSpeed USB device number 3 using xhci_hcd
> > > > [    5.692417] usb 2-1.4: New USB device found, idVendor=2109, idProduct=0815, bcdDevice= 7.04
> > > > [    5.692420] usb 2-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > > > [    5.692421] usb 2-1.4: Product: USB3.0 Hub             
> > > > [    5.692422] usb 2-1.4: Manufacturer: VIA Labs, Inc.         
> > > > [    5.710711] hub 2-1.4:1.0: USB hub found
> > > > [    5.710890] hub 2-1.4:1.0: 4 ports detected    
> > >   
> > > > [    6.351093] usb 2-1.4: reset SuperSpeed USB device number 3 using xhci_hcd    
> > >   
> > > > [    6.888681] hub 2-1.4:1.0: hub_ext_port_status failed (err = -71)    
> > >   
> > > > [    7.063179] usb 2-1.4: Failed to suspend device, error -71    
> > > 
> > > ... bunch of other errors ...
> > >   
> > > > [   15.585606] ------------[ cut here ]------------
> > > > [   15.585607] URB 00000000ed1c678e submitted while active
> > > > [   15.585620] WARNING: CPU: 17 PID: 569 at drivers/usb/core/urb.c:379 usb_submit_urb+0x648/0x670 [usbcore]
> > > > [   15.585632] Modules linked in: raid6_pq(+) libcrc32c crc32c_generic raid1 raid0 md_mod hid_logitech_hidpp hid_logitech_dj hid_generic usbhid hid amdgpu amdxcp drm_exec gpu_sched drm_buddy i2c_algo_bit drm_suballoc_helper drm_display_helper crct10dif_pclmul cec crc32_pclmul rc_core crc32c_intel drm_ttm_helper ghash_clmulni_intel ttm xhci_pci sha512_ssse3 drm_kms_helper xhci_hcd sha256_ssse3 nvme drm i2c_piix4 usbcore video sha1_ssse3 nvme_core igc crc16 i2c_smbus usb_common wmi button aesni_intel gf128mul crypto_simd cryptd
> > > > [   15.585654] CPU: 17 UID: 0 PID: 569 Comm: kworker/17:1 Not tainted 6.11.4-amd64 #1  Debian 6.11.4-1
> > > > [   15.585657] Hardware name: Micro Computer (HK) Tech Limited AtomMan G Series/DRBAA, BIOS 1.04 08/01/2024
> > > > [   15.585658] Workqueue: events_power_efficient hub_init_func2 [usbcore]
> > > > [   15.585665] RIP: 0010:usb_submit_urb+0x648/0x670 [usbcore]
> > > > [   15.585672] Code: 6e 69 c0 e8 8a d3 29 ef eb d9 b8 fe ff ff ff e9 0f fd ff ff 48 89 fe 48 c7 c7 70 a9 6b c0 c6 05 41 d6 01 00 01 e8 38 49 c4 ee <0f> 0b eb 9f b8 f8 ff ff ff e9 eb fc ff ff 66 2e 0f 1f 84 00 00 00
> > > > [   15.585673] RSP: 0018:ffffa5d101653db8 EFLAGS: 00010282
> > > > [   15.585675] RAX: 0000000000000000 RBX: ffff8de07df5c600 RCX: 0000000000000003
> > > > [   15.585676] RDX: 0000000000000000 RSI: 0000000000000003 RDI: 0000000000000001
> > > > [   15.585677] RBP: 0000000000000000 R08: 0000000000000000 R09: ffffa5d101653c38
> > > > [   15.585678] R10: ffff8de07cfbffa8 R11: 0000000000000003 R12: ffff8dd19ebbd000
> > > > [   15.585678] R13: ffff8dd1a8551000 R14: 0000000000000000 R15: 0000000000000005
> > > > [   15.585679] FS:  0000000000000000(0000) GS:ffff8de07d880000(0000) knlGS:0000000000000000
> > > > [   15.585680] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > [   15.585681] CR2: 0000564b523a70b0 CR3: 000000094ec22000 CR4: 0000000000750ef0
> > > > [   15.585682] PKRU: 55555554
> > > > [   15.585683] Call Trace:
> > > > [   15.585685]  <TASK>
> > > > [   15.585686]  ? usb_submit_urb+0x648/0x670 [usbcore]
> > > > [   15.585691]  ? __warn.cold+0x8e/0xe8
> > > > [   15.585694]  ? usb_submit_urb+0x648/0x670 [usbcore]
> > > > [   15.585699]  ? report_bug+0xff/0x140
> > > > [   15.585701]  ? console_unlock+0x84/0x130
> > > > [   15.585703]  ? handle_bug+0x3c/0x80
> > > > [   15.585705]  ? exc_invalid_op+0x17/0x70
> > > > [   15.585707]  ? asm_exc_invalid_op+0x1a/0x20
> > > > [   15.585710]  ? usb_submit_urb+0x648/0x670 [usbcore]
> > > > [   15.585715]  ? usb_submit_urb+0x648/0x670 [usbcore]
> > > > [   15.585721]  hub_activate+0x285/0x8a0 [usbcore]
> > > > [   15.585726]  ? srso_alias_return_thunk+0x5/0xfbef5
> > > > [   15.585729]  process_one_work+0x174/0x330
> > > > [   15.585731]  worker_thread+0x252/0x390
> > > > [   15.585733]  ? __pfx_worker_thread+0x10/0x10
> > > > [   15.585735]  kthread+0xcf/0x100
> > > > [   15.585737]  ? __pfx_kthread+0x10/0x10
> > > > [   15.585739]  ret_from_fork+0x31/0x50
> > > > [   15.585741]  ? __pfx_kthread+0x10/0x10
> > > > [   15.585743]  ret_from_fork_asm+0x1a/0x30
> > > > [   15.585746]  </TASK>
> > > > [   15.585747] ---[ end trace 0000000000000000 ]---
> > > > [   15.585748] hub 2-1.4:1.0: activate --> -16
> > > > 
> > > > $ lsusb
> > > > Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> > > > Bus 001 Device 002: ID 2109:2817 VIA Labs, Inc. USB2.0 Hub             
> > > > Bus 001 Device 003: ID 046d:c52b Logitech, Inc. Unifying Receiver
> > > > Bus 001 Device 004: ID 046d:c548 Logitech, Inc. Logi Bolt Receiver
> > > > Bus 001 Device 005: ID 2109:2815 VIA Labs, Inc. USB2.0 Hub             
> > > > Bus 001 Device 006: ID 051d:0002 American Power Conversion Uninterruptible Power Supply
> > > > Bus 001 Device 007: ID 046d:0825 Logitech, Inc. Webcam C270
> > > > Bus 001 Device 008: ID 1532:0531 Razer USA, Ltd Razer Seiren Mini
> > > > Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> > > > Bus 002 Device 002: ID 2109:0817 VIA Labs, Inc. USB3.0 Hub             
> > > > Bus 002 Device 022: ID 2109:0815 VIA Labs, Inc. USB3.0 Hub                 
> > > 
> > > Actually this looks like a firmware problem in the 2-1.4 device, the
> > > last VIA Labs hub listed above.  What does "lsusb -v" show for this
> > > device?
> > > 
> > > Alan Stern  
> > 
> > The BIOS is up to date. Not sure if that matters.  
> 
> It does not, as far as I know.
> 
> > Bus 002 Device 022: ID 2109:0815 VIA Labs, Inc. USB3.0 Hub             
> > Device Descriptor:
> >   bLength                18
> >   bDescriptorType         1
> >   bcdUSB               3.20
> >   bDeviceClass            9 Hub
> >   bDeviceSubClass         0 [unknown]
> >   bDeviceProtocol         3 
> >   bMaxPacketSize0         9
> >   idVendor           0x2109 VIA Labs, Inc.
> >   idProduct          0x0815 USB3.0 Hub             
> >   bcdDevice            7.04
> >   iManufacturer           1 VIA Labs, Inc.         
> >   iProduct                2 USB3.0 Hub             
> >   iSerial                 0 
> >   bNumConfigurations      1
> >   Configuration Descriptor:
> >     bLength                 9
> >     bDescriptorType         2
> >     wTotalLength       0x001f
> >     bNumInterfaces          1
> >     bConfigurationValue     1
> >     iConfiguration          0 
> >     bmAttributes         0xe0
> >       Self Powered
> >       Remote Wakeup
> >     MaxPower                0mA
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        0
> >       bAlternateSetting       0
> >       bNumEndpoints           1
> >       bInterfaceClass         9 Hub
> >       bInterfaceSubClass      0 [unknown]
> >       bInterfaceProtocol      0 Full speed (or root) hub
> >       iInterface              0 
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x81  EP 1 IN
> >         bmAttributes           19
> >           Transfer Type            Interrupt
> >           Synch Type               None
> >           Usage Type               Feedback
> >         wMaxPacketSize     0x0002  1x 2 bytes
> >         bInterval               8
> >         bMaxBurst               0  
> 
> That looks normal.  But the kernel log shows that this device has some
> trouble getting started.  It eventually settles down, but for a while
> there it doesn't work properly.
> 
> Nevertheless, even a malfunctioning device shouldn't provoke the
> kernel into a WARNING like you got.  The underlying reason for it is
> not at all clear, particularly since you didn't enable usbcore dynamic
> debugging -- although that might not provide enough information either.
> 
> One thing you could try doing is simply to replace that hub.
> 
> Alan Stern

Replaced the hub with a similar one which probably has same chip inside,
and the same problem happens. Which kernel cmdline parameter would enable
the debug you want.

