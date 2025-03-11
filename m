Return-Path: <linux-usb+bounces-21654-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A666FA5CBFF
	for <lists+linux-usb@lfdr.de>; Tue, 11 Mar 2025 18:22:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77A25166DFD
	for <lists+linux-usb@lfdr.de>; Tue, 11 Mar 2025 17:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5DC5263C75;
	Tue, 11 Mar 2025 17:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLnnlJVk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AFB2627FB;
	Tue, 11 Mar 2025 17:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741713661; cv=none; b=NsLIPxgLbKB8k6ZnfKceIpzVIsU/8/oUXIIgegfKsyZpoMQfjkpvPPKc+EWCvBvsTlxxANElTAzd7s4BqC2xqg0uAB9LzfmJL6Pc2w5dz1iMo7kw3C7q0qUM+cS8XvNhU8FN4GnuLSB5UlrEVgoOC31WbhFPxcmmCcuT81rcSUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741713661; c=relaxed/simple;
	bh=i8f9OZrNbABT7hiP0J3NdxjfPGoRNx2fDrRmP/kiFMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SXACyO5IAQ59t+J+ryvT8hH6MZyn4/ubOGUTMZ1igSnFQJ1knWNrt0VaMoiApgTp+qxU2grhNdd/6jv/CkYXuthkXa1ZwGzB3x7L3HQP7UTMCPpT4fhDPOpxmzqca+dy0Ml5TY39fKNnup7RUvYLlAJ/CPhsbtBbJKUc7IfRQ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLnnlJVk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so34950905e9.3;
        Tue, 11 Mar 2025 10:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741713657; x=1742318457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wi3CpMqX4gGMYSHt83KyqnBDYh1ISIFPHvwpiMSy8o=;
        b=LLnnlJVkD4AAzsT3lMTodu6WMzLEBMma9N8YQM83YMIuP3ywbG3ni07yJliFf+Zmzc
         9Z382dLLGqQwRFLyMSE//tJUufbwWvpD1AXcpzIQ/I5Y4YGelUYb6i+K+b9WD9nwNDXt
         V45jwwmnhA8T/eTsrSh76DJTru62mgwL1eEZ19ZV1KsPxkPEw311I38JB+w7OkJhmZBl
         OgKcwjwNfjYtbfzCV7gRVDS9f/kzfbOqEm8DsBxjpxMWf6PhTe3HuA3/ViwWoRy7OU3J
         Q6ESlUpEhTXxmSv095JJPOTcX1QzoKkGHHVLngIUfj+uRb9J48mrZ5jFTBQ0MOc4iS/6
         NOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741713657; x=1742318457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wi3CpMqX4gGMYSHt83KyqnBDYh1ISIFPHvwpiMSy8o=;
        b=iWORaRRGnH4IH04de44KIuopAzvShS89Jqjnq81AuY4agcE0COpAxI2xqRLHETRqcY
         2NGBd7k6g45by3uaTdrCXJ4W/bthT5dcApxGS8wc2+A1qLlrvRhLrePHTRskVawZ8+3H
         tim/gCGKyjSsFfytrnbC/5srYmdTUvWiVIRe6Et6obO/QWxeYt4d+uGCM8iFLNwjwmX9
         TJLaIJIcNaq5VmjF2OJU1lEQqsF5Zn8i0Cei6IdW7L+uR9ovOePsQtLHEVcmMoywbnIt
         XpMUPvqglcXls04b1NSfR+QunnJ5hJ5v3OAUBLEqHEjaHUrPQIERGar2YGlsdcOeviTo
         YMjw==
X-Forwarded-Encrypted: i=1; AJvYcCVdWpxuvIrEToaxGmCjc8xGdAu2Nhn8FG37vzEO2yaczhUl0bt+qigadVipf9HUj/2/q1S8tRZrImHHEIhGn34=@vger.kernel.org, AJvYcCVzipV7ZNNxQvFAwi1ihuLTAtLoHSt06EStswO0uI0nAqFuy7gIeEMiBtge/++0tW+XiJld7dsgxd6Lxgo=@vger.kernel.org, AJvYcCWoaSB8KtQNxACeaVbI4C/R9CCBnjx/bAtiUVwoxAk16/f58EphmPjwu3h4oNNBUhx1+H0ENTVNm32F@vger.kernel.org
X-Gm-Message-State: AOJu0YxB8Deusk1gPBOXQ+Yj9dGhVMdgk6rYLxbz68Ydfe+WZQ6T/Kv9
	m7JAeJqKQj6NkYwcOJlx7hcOWLQz09N/NK+vO8/JU+ldmWWoR0yN
X-Gm-Gg: ASbGncvp/m1rxrRfotfxFq7ILoSVOCJ9gxlS//59q76SBRnJoOu3kJBuOVpFF180J2s
	czsRnczjRvLmxTe+39XjtWZDZ8W2HwjPN7JJ4JOvIJ7Vv56bUk76xeoVk7ATjatjjS/qXYoGt2h
	koCKGcdZ7NrSnfN/I4LKFk9k9TuFFnea2V+UrzXU7WFEvLlIE6HVaeV96emZET17boWhg71xzti
	opB4QCNqnY4oq1+zP53Y0Q9Z6wsFJQA/9D8/gHNG+F9xhkHihtnN8xEe7kasyAdf45zpHFWd/m+
	nuu3OAqY17iKQpP0pgh9+iqkm++Yh6SuA/0ME/znOMD5
X-Google-Smtp-Source: AGHT+IHx0weDcv77AGcvs2tIoT5GTtEwKw7UNINxXotGXV/fBKCzy6UX36iZZcCJ1xDg1cxSCwghPA==
X-Received: by 2002:a05:6000:210a:b0:391:4914:3c4d with SMTP id ffacd0b85a97d-392641bd791mr3429601f8f.19.1741713657190;
        Tue, 11 Mar 2025 10:20:57 -0700 (PDT)
Received: from fedora.. ([94.73.34.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79adsm18484732f8f.7.2025.03.11.10.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 10:20:56 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Jonathan.Cameron@huawei.com,
	airlied@gmail.com,
	aleksander.lobakin@intel.com,
	andriy.shevchenko@linux.intel.com,
	bhelgaas@google.com,
	broonie@kernel.org,
	dakr@kernel.org,
	dri-devel@lists.freedesktop.org,
	hamohammed.sa@gmail.com,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	louis.chauvet@bootlin.com,
	lukas@wunner.de,
	lyude@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mairacanal@riseup.net,
	melissa.srw@gmail.com,
	mripard@kernel.org,
	quic_zijuhu@quicinc.com,
	rafael@kernel.org,
	robin.murphy@arm.com,
	rust-for-linux@vger.kernel.org,
	simona.vetter@ffwll.ch,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v4 9/9] drm/vkms: convert to use faux_device
Date: Tue, 11 Mar 2025 18:20:53 +0100
Message-ID: <20250311172054.2903-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <2025022643-scouting-petticoat-492b@gregkh>
References: <2025022643-scouting-petticoat-492b@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi everyone,

> On Tue, Feb 25, 2025 at 02:51:40PM +0100, Louis Chauvet wrote:
> > 
> > 
> > Le 25/02/2025 à 12:41, Thomas Zimmermann a écrit :
> > > Hi
> > > 
> > > Am 10.02.25 um 15:37 schrieb Louis Chauvet:
> > > > On 10/02/25 - 13:30, Greg Kroah-Hartman wrote:
> > > > > The vkms driver does not need to create a platform device, as there is
> > > > > no real platform resources associated it,  it only did so because it was
> > > > > simple to do that in order to get a device to use for resource
> > > > > management of drm resources.  Change the driver to use the faux device
> > > > > instead as this is NOT a real platform device.
> > > > > 
> > > > > Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > > > Cc: Simona Vetter <simona@ffwll.ch>
> > > > > Cc: Melissa Wen <melissa.srw@gmail.com>
> > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > Cc: David Airlie <airlied@gmail.com>
> > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > 
> > > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > 
> > > > Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > 
> > > > Thanks for the modification, it seems to work.
> > > 
> > > Should this patch be merged through DRM trees? drm-misc-next is at
> > > v6.14-rc4 and has struct faux_device.
> > 
> > Hi,
> > 
> > I was not aware the faux-device was merged, as it is a new feature, I
> > expected it to reach drm-misc-next on 6.15-rc1.
> 
> I added it to Linus's tree just so that DRM could get these changes into
> their tree now :)
> 
> > I plan to merge [1] today/tomorrow (well tested with platform_device), and
> > then I will submit an updated version of this patch (only trivial conflicts,
> > but never tested with multiple VKMS devices).
> > 
> > [1]:https://lore.kernel.org/all/20250218101214.5790-1-jose.exposito89@gmail.com/
> 
> Great, thanks!
> 
> greg k-h

Testing this patch again as part of some IGT tests I'm working on,
I noticed that, applying this patch on top of the latest drm-misc-next
triggers a warning at drivers/gpu/drm/drm_gem.c:571, in
drm_gem_get_pages():

    if (WARN_ON(!obj->filp))
            return ERR_PTR(-EINVAL);

To double check that the cause were not my local changes, I checked
out commit 2d4d775d11d3 ("drm: pl111: fix inconsistent indenting
warning"), which doesn't contain any vkms config changes, applied this
patch and the result is the same.

Louis, do you also see this warning?

For reference, the log is at the end of this email.
Jose

---

[  110.126952] [drm] Initialized vkms 1.0.0 for vkms on minor 1
[  110.129193] faux_driver vkms: [drm] fb1: vkmsdrmfb frame buffer device
[  110.326759] ------------[ cut here ]------------
[  110.326769] WARNING: CPU: 5 PID: 1106 at drivers/gpu/drm/drm_gem.c:571 drm_gem_get_pages+0x5e9/0x780
[  110.326795] Modules linked in: vkms snd_seq_dummy snd_hrtimer snd_seq snd_seq_device snd_timer snd soundcore nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set rfkill nf_tables qrtr sunrpc binfmt_misc ppdev pktcdvd parport_pc e1000 parport i2c_piix4 pcspkr i2c_smbus joydev loop nfnetlink vsock_loopback vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport vmw_vmci zram vsock bochs serio_raw ata_generic pata_acpi fuse qemu_fw_cfg
[  110.326892] CPU: 5 UID: 42 PID: 1106 Comm: KMS thread Not tainted 6.14.0-rc4+ #2
[  110.326898] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-3.fc41 04/01/2014
[  110.326902] RIP: 0010:drm_gem_get_pages+0x5e9/0x780
[  110.326909] Code: 8d bd 78 fe ff ff e8 76 ca 8c fe 48 8d bd 78 fe ff ff e8 ea d9 8a fe e8 75 1a 17 01 e9 4b ff ff ff 48 8d 58 ff e9 6a fe ff ff <0f> 0b 49 c7 c7 ea ff ff ff e9 40 ff ff ff 0f 0b e9 0f fb ff ff 4c
[  110.326914] RSP: 0018:ffffc9000572f550 EFLAGS: 00010246
[  110.326919] RAX: 1ffff11024531402 RBX: ffff88812298a000 RCX: 0000000000000000
[  110.326923] RDX: dffffc0000000000 RSI: ffff8881125d54c8 RDI: ffff88812298a010
[  110.326927] RBP: ffffc9000572f750 R08: 8000000000000063 R09: fffff52000ae5ef0
[  110.326929] R10: ffffc9000572f787 R11: ffff888104638528 R12: 0000000000000000
[  110.326932] R13: ffff88812298a168 R14: ffff88812298a0e8 R15: ffff88812298a190
[  110.326936] FS:  00007f3cf4e536c0(0000) GS:ffff8883af080000(0000) knlGS:0000000000000000
[  110.326940] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  110.326944] CR2: 00007f3cd40337f8 CR3: 00000001394e4000 CR4: 00000000000006f0
[  110.326951] Call Trace:
[  110.326954]  <TASK>
[  110.326957]  ? show_regs.cold+0x19/0x1e
[  110.326965]  ? __warn.cold+0xbd/0x17f
[  110.326970]  ? drm_gem_get_pages+0x5e9/0x780
[  110.326975]  ? report_bug+0x20b/0x2d0
[  110.326982]  ? handle_bug+0x60/0xa0
[  110.326988]  ? exc_invalid_op+0x1c/0x50
[  110.326993]  ? asm_exc_invalid_op+0x1f/0x30
[  110.327000]  ? drm_gem_get_pages+0x5e9/0x780
[  110.327005]  ? kasan_save_stack+0x4d/0x60
[  110.327011]  ? kasan_save_stack+0x3d/0x60
[  110.327016]  ? kasan_save_track+0x1c/0x70
[  110.327020]  ? kasan_save_alloc_info+0x3b/0x50
[  110.327025]  ? __pfx_drm_gem_get_pages+0x10/0x10
[  110.327029]  ? drm_atomic_helper_commit+0x7c/0x290
[  110.327037]  ? dma_resv_get_singleton+0x99/0x2b0
[  110.327043]  drm_gem_shmem_get_pages+0x69/0x1f0
[  110.327048]  drm_gem_shmem_vmap+0x1f8/0x670
[  110.327054]  drm_gem_shmem_object_vmap+0xd/0x20
[  110.327058]  drm_gem_vmap+0x70/0xd0
[  110.327063]  drm_gem_vmap_unlocked+0x4f/0xa0
[  110.327067]  drm_gem_fb_vmap+0xaf/0x3c0
[  110.327073]  vkms_prepare_fb+0x6e/0x80 [vkms]
[  110.327081]  drm_atomic_helper_prepare_planes+0x1a5/0xba0
[  110.327088]  drm_atomic_helper_commit+0x128/0x290
[  110.327092]  ? __pfx_drm_atomic_helper_commit+0x10/0x10
[  110.327097]  drm_atomic_commit+0x203/0x2d0
[  110.327101]  ? _raw_spin_lock_irqsave+0x97/0xf0
[  110.327106]  ? __pfx_drm_atomic_commit+0x10/0x10
[  110.327110]  ? __pfx___drm_printfn_info+0x10/0x10
[  110.327116]  ? drm_event_reserve_init+0x1cd/0x260
[  110.327123]  drm_mode_atomic_ioctl+0x1d2b/0x2d30
[  110.327129]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[  110.327134]  ? __kasan_check_write+0x18/0x20
[  110.327140]  drm_ioctl_kernel+0x177/0x2f0
[  110.327145]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[  110.327149]  ? __pfx_drm_ioctl_kernel+0x10/0x10
[  110.327155]  ? __kasan_check_write+0x18/0x20
[  110.327160]  drm_ioctl+0x557/0xc90
[  110.327165]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[  110.327170]  ? __pfx_drm_ioctl+0x10/0x10
[  110.327176]  ? selinux_file_ioctl+0x106/0x250
[  110.327181]  ? fdget+0x2ca/0x3d0
[  110.327185]  ? selinux_file_ioctl+0x106/0x250
[  110.327191]  __x64_sys_ioctl+0x13c/0x1a0
[  110.327198]  x64_sys_call+0xf3b/0x1d70
[  110.327202]  do_syscall_64+0x82/0x160
[  110.327208]  ? irqentry_exit+0x3f/0x50
[  110.327213]  ? exc_page_fault+0x94/0x110
[  110.327218]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  110.327223] RIP: 0033:0x7f3d100fda6d
[  110.327234] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
[  110.327238] RSP: 002b:00007f3cf4e519b0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[  110.327244] RAX: ffffffffffffffda RBX: 00007f3cd402a440 RCX: 00007f3d100fda6d
[  110.327247] RDX: 00007f3cf4e51a50 RSI: 00000000c03864bc RDI: 0000000000000035
[  110.327250] RBP: 00007f3cf4e51a00 R08: 00000000000000d0 R09: 0000000000000001
[  110.327254] R10: 0000000000000003 R11: 0000000000000246 R12: 00007f3cf4e51a50
[  110.327257] R13: 00000000c03864bc R14: 0000000000000035 R15: 00007f3cd4029f20
[  110.327262]  </TASK>
[  110.327264] ---[ end trace 0000000000000000 ]---

