Return-Path: <linux-usb+bounces-16726-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7C89B1249
	for <lists+linux-usb@lfdr.de>; Sat, 26 Oct 2024 00:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1831B1C20F2C
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 22:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480311C174E;
	Fri, 25 Oct 2024 22:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="W6uL3WOB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43559217F2C
	for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 22:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729893811; cv=none; b=SM+i4qIS4XVEvWBiAKD1Uz3MRbF6VfH+fBuEDV+Ja1JJPNqO3KH9IDNNVtciVaIzKiMW7K6YST2nx6ngUeESuyXAnIC4/64MzZJv1eR0+uAJUIODWw5TfGGXiGh1VzgsALebwXca9OysRoP3Tfziz2ucTPbIuJYvC037OYDoW2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729893811; c=relaxed/simple;
	bh=dcsfWPRPNREYhKa5YB7tLOBdoEi0V0BGKC5JUi+VF8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vd6cUBwdgAQL/tqag0D4l3Ff0GJBRNh8HNQVJZfEcjr8bMfDKZ5mNrH8axKR3gLjBjPsdrwPYfpYOUTAdG752pr8UpDzqu41sljTCDWnhpvnd0WHBaKOsXESIQzKgfPCMvEoZahDv3AIhuZm5cz2IZPVEocyg1WOx1WFW8uEiIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=W6uL3WOB; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-460b04e4b1cso15644741cf.2
        for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 15:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1729893808; x=1730498608; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XzbowvOwM7QZGALooLj1nsiJLiaDvgY/KHu5ckvJ5hU=;
        b=W6uL3WOBowmhpf4FcpNASgxoFwQR6KXJx6+tOV6iIFq4FzB67K3+rxR5+z9A+WL8lq
         3fCq81O4Cy+OsiBDalbl9s7FltYkud7sEFp9XYyuvZ/mJv1yfu2Y7SY2pW89NJg0OEzh
         9uId3pt4yvxkyvC+Ty5JPLq8F/H6v5nCgNaq2qf3VpD4pczxOLK/tYRUlotro3b0UAoR
         Pny653MH1QjHUKBpsl829anL2ES2O5QT8oCGMlHgUJPHhyp4xiNVNdfSfXuyUmbnbAOm
         Yku12jNOl+/Sw5trQjrrTbQqI4Krp2dqNtLyzGtkMyV95Do6MoD/CcEHJLJDGR9USSP7
         Hm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729893808; x=1730498608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzbowvOwM7QZGALooLj1nsiJLiaDvgY/KHu5ckvJ5hU=;
        b=wQBTrIveXAgw/ENXg6mldAVMtKDh9nYzSwqZKmTXpJbmuxK/hpdh4K4GQz0Gvh68px
         i9NFcCGOQJiIJGxsU5a0GHOqeEZF9kqj21f/9zuP+bvMzRu0w3eNQ87YZZeKsdW1y0lu
         1sZCvYcpU0se3CzZjvuUI0/3NjzYxt7CtDoy4Cs0Pk1Q60aKHn78iYkMLwCgqgY9LnRc
         OvKW25vzuasGGeYA4LRMCdeYgs/oYt3qVOLf27bcpnTp5SPQKP5MaLq8B7j3LGzok3RZ
         C1mOGP8SR3hhcLGPy0/VSbs49yvVkfRxCBKGZRc1/g50emwRDAkkR3rqHVDbukOautgO
         t1Vw==
X-Gm-Message-State: AOJu0YyGD7jA3lviZ4XLkWZY6BbaddlmMXb67+CwxCKjS0XW8PPYCKqw
	y0DSMvmW9XId9ol+tpmqQhpCDrZCmRUPR4VV+xTG6tZjEE27xC3ZCqwLUZRpqu2tVL6eJa+R/gE
	=
X-Google-Smtp-Source: AGHT+IEv8cHr6b3rHqoXoXflF/CZQW8/rvFsIbaBYgAADABt7NDE4XDTIwa3LJu853dx1OM9oneEQQ==
X-Received: by 2002:a05:622a:190b:b0:458:2479:b599 with SMTP id d75a77b69052e-4613c05dde7mr10562961cf.36.1729893808148;
        Fri, 25 Oct 2024 15:03:28 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::9dc2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-461323a9640sm10179631cf.91.2024.10.25.15.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 15:03:27 -0700 (PDT)
Date: Fri, 25 Oct 2024 18:03:25 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: USB warning on boot
Message-ID: <9b1343ee-2806-464c-a99c-5bae44985cc7@rowland.harvard.edu>
References: <20241025135649.2d08be87@hermes.local>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025135649.2d08be87@hermes.local>

On Fri, Oct 25, 2024 at 01:56:49PM -0700, Stephen Hemminger wrote:
> This is on a new AMD based mini-PC with Debian testing (6.11.4-amd64).
> Looks like a USB driver bug.
> 
> On every boot, this shows up in the log although the system seems to recover ok.

> [    5.644432] usb 2-1.4: new SuperSpeed USB device number 3 using xhci_hcd
> [    5.692417] usb 2-1.4: New USB device found, idVendor=2109, idProduct=0815, bcdDevice= 7.04
> [    5.692420] usb 2-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [    5.692421] usb 2-1.4: Product: USB3.0 Hub             
> [    5.692422] usb 2-1.4: Manufacturer: VIA Labs, Inc.         
> [    5.710711] hub 2-1.4:1.0: USB hub found
> [    5.710890] hub 2-1.4:1.0: 4 ports detected

> [    6.351093] usb 2-1.4: reset SuperSpeed USB device number 3 using xhci_hcd

> [    6.888681] hub 2-1.4:1.0: hub_ext_port_status failed (err = -71)

> [    7.063179] usb 2-1.4: Failed to suspend device, error -71

... bunch of other errors ...

> [   15.585606] ------------[ cut here ]------------
> [   15.585607] URB 00000000ed1c678e submitted while active
> [   15.585620] WARNING: CPU: 17 PID: 569 at drivers/usb/core/urb.c:379 usb_submit_urb+0x648/0x670 [usbcore]
> [   15.585632] Modules linked in: raid6_pq(+) libcrc32c crc32c_generic raid1 raid0 md_mod hid_logitech_hidpp hid_logitech_dj hid_generic usbhid hid amdgpu amdxcp drm_exec gpu_sched drm_buddy i2c_algo_bit drm_suballoc_helper drm_display_helper crct10dif_pclmul cec crc32_pclmul rc_core crc32c_intel drm_ttm_helper ghash_clmulni_intel ttm xhci_pci sha512_ssse3 drm_kms_helper xhci_hcd sha256_ssse3 nvme drm i2c_piix4 usbcore video sha1_ssse3 nvme_core igc crc16 i2c_smbus usb_common wmi button aesni_intel gf128mul crypto_simd cryptd
> [   15.585654] CPU: 17 UID: 0 PID: 569 Comm: kworker/17:1 Not tainted 6.11.4-amd64 #1  Debian 6.11.4-1
> [   15.585657] Hardware name: Micro Computer (HK) Tech Limited AtomMan G Series/DRBAA, BIOS 1.04 08/01/2024
> [   15.585658] Workqueue: events_power_efficient hub_init_func2 [usbcore]
> [   15.585665] RIP: 0010:usb_submit_urb+0x648/0x670 [usbcore]
> [   15.585672] Code: 6e 69 c0 e8 8a d3 29 ef eb d9 b8 fe ff ff ff e9 0f fd ff ff 48 89 fe 48 c7 c7 70 a9 6b c0 c6 05 41 d6 01 00 01 e8 38 49 c4 ee <0f> 0b eb 9f b8 f8 ff ff ff e9 eb fc ff ff 66 2e 0f 1f 84 00 00 00
> [   15.585673] RSP: 0018:ffffa5d101653db8 EFLAGS: 00010282
> [   15.585675] RAX: 0000000000000000 RBX: ffff8de07df5c600 RCX: 0000000000000003
> [   15.585676] RDX: 0000000000000000 RSI: 0000000000000003 RDI: 0000000000000001
> [   15.585677] RBP: 0000000000000000 R08: 0000000000000000 R09: ffffa5d101653c38
> [   15.585678] R10: ffff8de07cfbffa8 R11: 0000000000000003 R12: ffff8dd19ebbd000
> [   15.585678] R13: ffff8dd1a8551000 R14: 0000000000000000 R15: 0000000000000005
> [   15.585679] FS:  0000000000000000(0000) GS:ffff8de07d880000(0000) knlGS:0000000000000000
> [   15.585680] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   15.585681] CR2: 0000564b523a70b0 CR3: 000000094ec22000 CR4: 0000000000750ef0
> [   15.585682] PKRU: 55555554
> [   15.585683] Call Trace:
> [   15.585685]  <TASK>
> [   15.585686]  ? usb_submit_urb+0x648/0x670 [usbcore]
> [   15.585691]  ? __warn.cold+0x8e/0xe8
> [   15.585694]  ? usb_submit_urb+0x648/0x670 [usbcore]
> [   15.585699]  ? report_bug+0xff/0x140
> [   15.585701]  ? console_unlock+0x84/0x130
> [   15.585703]  ? handle_bug+0x3c/0x80
> [   15.585705]  ? exc_invalid_op+0x17/0x70
> [   15.585707]  ? asm_exc_invalid_op+0x1a/0x20
> [   15.585710]  ? usb_submit_urb+0x648/0x670 [usbcore]
> [   15.585715]  ? usb_submit_urb+0x648/0x670 [usbcore]
> [   15.585721]  hub_activate+0x285/0x8a0 [usbcore]
> [   15.585726]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   15.585729]  process_one_work+0x174/0x330
> [   15.585731]  worker_thread+0x252/0x390
> [   15.585733]  ? __pfx_worker_thread+0x10/0x10
> [   15.585735]  kthread+0xcf/0x100
> [   15.585737]  ? __pfx_kthread+0x10/0x10
> [   15.585739]  ret_from_fork+0x31/0x50
> [   15.585741]  ? __pfx_kthread+0x10/0x10
> [   15.585743]  ret_from_fork_asm+0x1a/0x30
> [   15.585746]  </TASK>
> [   15.585747] ---[ end trace 0000000000000000 ]---
> [   15.585748] hub 2-1.4:1.0: activate --> -16
> 
> $ lsusb
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 001 Device 002: ID 2109:2817 VIA Labs, Inc. USB2.0 Hub             
> Bus 001 Device 003: ID 046d:c52b Logitech, Inc. Unifying Receiver
> Bus 001 Device 004: ID 046d:c548 Logitech, Inc. Logi Bolt Receiver
> Bus 001 Device 005: ID 2109:2815 VIA Labs, Inc. USB2.0 Hub             
> Bus 001 Device 006: ID 051d:0002 American Power Conversion Uninterruptible Power Supply
> Bus 001 Device 007: ID 046d:0825 Logitech, Inc. Webcam C270
> Bus 001 Device 008: ID 1532:0531 Razer USA, Ltd Razer Seiren Mini
> Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 002 Device 002: ID 2109:0817 VIA Labs, Inc. USB3.0 Hub             
> Bus 002 Device 022: ID 2109:0815 VIA Labs, Inc. USB3.0 Hub             

Actually this looks like a firmware problem in the 2-1.4 device, the
last VIA Labs hub listed above.  What does "lsusb -v" show for this
device?

Alan Stern

