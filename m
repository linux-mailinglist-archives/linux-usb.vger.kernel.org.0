Return-Path: <linux-usb+bounces-24729-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2854AD8B58
	for <lists+linux-usb@lfdr.de>; Fri, 13 Jun 2025 13:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B0831885954
	for <lists+linux-usb@lfdr.de>; Fri, 13 Jun 2025 11:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BACC6275B03;
	Fri, 13 Jun 2025 11:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awFN4Dtc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47470275AF3;
	Fri, 13 Jun 2025 11:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749815730; cv=none; b=MocD/cqoKiZg93mumDeAMlh75WZ27itVCp6q699zr8U6MnoHUrXJaRx+E0SsknwermqL8AJUj8ovCj2pEPG0c937XRRKAf1JbnwnedCZCqGGgvBcOEPsv2BTA3wP0YU952xTNF26jGSzlCJrf7L1I8LeevR3Ir2eLk/OGK39sXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749815730; c=relaxed/simple;
	bh=rDUmv2bR1gX7GTZT1kxvTtzQT29+yRG2+x7FPLdhHLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkYKyVTDZ9nuCOPOj6H7cOdL/+wpA1Qg2SVY/JRoFJPD+0TnvD3b19c+goDXCOxfc/bst05WJgrklCASf/Y7H6QA9w6b3D5duFFUWQW2QG92cE2QLG3BmKWp5UjoetEVu4Daxnk9xIInv3KYolTixaYzai0/WY8FsW7AhbmGj9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awFN4Dtc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d6ade159so17577215e9.1;
        Fri, 13 Jun 2025 04:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749815727; x=1750420527; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xO4lHSnHfpkX9ey6V1hK+cOGeHbT22KfbfOMN9lyAQI=;
        b=awFN4DtcbiEPj9Szsl07POIlmnOpEftVlY4JPSYOh3eNwIwqQkkM7Vh9CC7Sd4YNdh
         +Mdnh0CPORZwUePmnAO8GTJN5Je55EM95WgIuwm5gvk5IYCtavwQdCmiY97t6jPhZDaY
         GH6mAAZL8IchfJ9DptjnVb6VWIMh8pv/yzWq6HEGBvYQZsJVojEmfahelNuJTKOWv6q5
         3OJ/HR1/u2LGLfQHiuWBLDbvAPzaL5ky5I5IZuRE5b00sf6sK53lIe+Bc8wPVm0I5lb6
         tzg0TYvXv8/KX58vEfkuF3tRk9o9taiVFK5fSFAObZXrY9IUpFZJPXLAq0ySdZUOkwKV
         iEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749815727; x=1750420527;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xO4lHSnHfpkX9ey6V1hK+cOGeHbT22KfbfOMN9lyAQI=;
        b=Y1nKbURnwmLiUSnGx751+dZSHwcf6dRA5R/YXkvFws9nWdiRVSERZhC7pPuUODwHKv
         BTleNZ2XQKuQ6mzOJmP/hPW+YI89xDHw7aAf6vxD7FnYfwDg7D0NaO1Ljm07hRh6AqkJ
         08S+Bf/t6ovxsAfYjLnur99vRnxlt/5rRQyvx/B+ZGaRK0imdl1CpkXs0L6G5k/Vb8om
         jE8Jz5TH9cazWpvhp96aBW681nZO0dvukvO+TUoEnmRXLlmcU/9Hj2L2TAuQkyqWCu+z
         GA/ng7MUk3tcTJzLt0AJDfXUcz06h2Iq/ekR/4u3cs62bIrYQ9gB6jPMFdf7shD2wl0d
         iTyw==
X-Forwarded-Encrypted: i=1; AJvYcCWWgKmxxazjDt/C03oj2VUu2+pjoiJ2SWRhv46Mmrn2JgOl3IHfQ6IqBHopxJfz6roqVwr3aDcDj+QN34qWbxg=@vger.kernel.org, AJvYcCWWyLk4bFgvPqOb2y0onEjdf0x+N9ohpMcE+MRGpQimLqAAVNwmP2UieBmELXQYOWHili2B855c0t7O@vger.kernel.org, AJvYcCX+e1YIpgx/1zQqTBMGxMeRjKCwAL1XMmcDMeabDFbELVU9D/nrt31sctnp+sKFlPBJiugQHjUNDxZCPEw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy57QDnlDqwDOEI9zQz4f08PKqbd/F87WAsaoHg23IQto/qqLS/
	BiqXUZvM08hQrIe+el7XRxJe9GZAPSBBD73Lp72ytN2fYpNa5rxwGZEM
X-Gm-Gg: ASbGncsZFao5CqdRxxAqNIMU0yu1m7KiKOpQlMyntQGIVqNryDSq8nQmfuVJvqbCqEi
	kt+x6xC1+MiHtEy10NIP+5QFBXy2VWYeURxdlEVeo7hFXMx5fIgwXTxUc+sAPElvjXbFqpEjvJ+
	ROWJVLD4BUcfW4LwGGiGEzwafMX0Bym33ZHALmO8k3WvOdxWLXNl8Xt8FjiL+srxCOPD3qw2UOA
	3uXhWJpHUvbPSk83Xp+gKq92I0CD0CLWLeyoJDLw6XNnJWL1uT8JZC0JcSn8zqNU2L5qr8mBuY3
	diyeWhI4wDRrWHIEbM5hSGvamftYb4lURKq7Qu+2did+FrRHh0e7euGhmIaWgduGCGVSZA==
X-Google-Smtp-Source: AGHT+IF90CtrNYbBnmdORu8/pLVZKEnKFH8SYtwc5YbhuQ8Be6X/il+Uo2k5UArsErZqC0gE2pksjA==
X-Received: by 2002:a05:600c:3d97:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-45334b07fe9mr26480615e9.33.1749815726197;
        Fri, 13 Jun 2025 04:55:26 -0700 (PDT)
Received: from fedora ([94.73.34.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e22460bsm52636405e9.6.2025.06.13.04.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:55:25 -0700 (PDT)
Date: Fri, 13 Jun 2025 13:55:22 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
	Greg KH <gregkh@linuxfoundation.org>, Jonathan.Cameron@huawei.com,
	airlied@gmail.com, aleksander.lobakin@intel.com,
	andriy.shevchenko@linux.intel.com, bhelgaas@google.com,
	broonie@kernel.org, dakr@kernel.org,
	dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
	lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, louis.chauvet@bootlin.com,
	lukas@wunner.de, lyude@redhat.com,
	maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
	melissa.srw@gmail.com, mripard@kernel.org, quic_zijuhu@quicinc.com,
	rafael@kernel.org, robin.murphy@arm.com,
	rust-for-linux@vger.kernel.org, simona@ffwll.ch
Subject: Re: [PATCH v4 9/9] drm/vkms: convert to use faux_device
Message-ID: <aEwRqrqn4M32ScxN@fedora>
References: <2025022643-scouting-petticoat-492b@gregkh>
 <20250311172054.2903-1-jose.exposito89@gmail.com>
 <2025031218-oxidize-backing-e278@gregkh>
 <Z9LqHcj4n7Dd8A-H@phenom.ffwll.local>
 <Z9MT23hgX2c21xNA@fedora>
 <fa5f9e9c-09f6-4f92-8f6d-4e057f9fc5a9@suse.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa5f9e9c-09f6-4f92-8f6d-4e057f9fc5a9@suse.de>

Hi Thomas,

Thanks for the heads up, this issue fall through the cracks.

On Fri, Jun 13, 2025 at 10:15:05AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 13.03.25 um 18:20 schrieb Jos� Exp�sito:
> > On Thu, Mar 13, 2025 at 03:22:21PM +0100, Simona Vetter wrote:
> > > On Wed, Mar 12, 2025 at 07:22:07AM +0100, Greg KH wrote:
> > > > On Tue, Mar 11, 2025 at 06:20:53PM +0100, Jos� Exp�sito wrote:
> > > > > Hi everyone,
> > > > > 
> > > > > > On Tue, Feb 25, 2025 at 02:51:40PM +0100, Louis Chauvet wrote:
> > > > > > > 
> > > > > > > Le 25/02/2025 � 12:41, Thomas Zimmermann a �crit :
> > > > > > > > Hi
> > > > > > > > 
> > > > > > > > Am 10.02.25 um 15:37 schrieb Louis Chauvet:
> > > > > > > > > On 10/02/25 - 13:30, Greg Kroah-Hartman wrote:
> > > > > > > > > > The vkms driver does not need to create a platform device, as there is
> > > > > > > > > > no real platform resources associated it,  it only did so because it was
> > > > > > > > > > simple to do that in order to get a device to use for resource
> > > > > > > > > > management of drm resources.  Change the driver to use the faux device
> > > > > > > > > > instead as this is NOT a real platform device.
> > > > > > > > > > 
> > > > > > > > > > Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > > > > > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > > > > > > > > Cc: Simona Vetter <simona@ffwll.ch>
> > > > > > > > > > Cc: Melissa Wen <melissa.srw@gmail.com>
> > > > > > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > > > > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > > > > > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > > > > > > Cc: David Airlie <airlied@gmail.com>
> > > > > > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > > > > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > > > > > > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > > > > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > > > > 
> > > > > > > > > Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > > > > > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > > > > > 
> > > > > > > > > Thanks for the modification, it seems to work.
> > > > > > > > Should this patch be merged through DRM trees? drm-misc-next is at
> > > > > > > > v6.14-rc4 and has struct faux_device.
> > > > > > > Hi,
> > > > > > > 
> > > > > > > I was not aware the faux-device was merged, as it is a new feature, I
> > > > > > > expected it to reach drm-misc-next on 6.15-rc1.
> > > > > > I added it to Linus's tree just so that DRM could get these changes into
> > > > > > their tree now :)
> > > > > > 
> > > > > > > I plan to merge [1] today/tomorrow (well tested with platform_device), and
> > > > > > > then I will submit an updated version of this patch (only trivial conflicts,
> > > > > > > but never tested with multiple VKMS devices).
> > > > > > > 
> > > > > > > [1]:https://lore.kernel.org/all/20250218101214.5790-1-jose.exposito89@gmail.com/
> > > > > > Great, thanks!
> > > > > > 
> > > > > > greg k-h
> > > > > Testing this patch again as part of some IGT tests I'm working on,
> > > > > I noticed that, applying this patch on top of the latest drm-misc-next
> > > > > triggers a warning at drivers/gpu/drm/drm_gem.c:571, in
> > > > > drm_gem_get_pages():
> > > > > 
> > > > >  ��� if (WARN_ON(!obj->filp))
> > > > >  ����������� return ERR_PTR(-EINVAL);
> > > > I don't see how the faux bus change would have anything to do with a
> > > > filp as that's not related as far as I can tell.  But I don't know the
> > > > drm layer at all, where does that filp come from?
> > > Yeah that filp is the shmem file that backs gem bo. That's very far away
> > > from anything device/driver related datastrctures. If this is a new
> > > failure due to the aux bux conversion then it would be really surprising.
> > Agreed, I find it surprising, but reverting the patch removes the warning.
> > 
> > It's most likely an issue on my side, but I decided to double check just
> > in case someone else is also seeing this warning.
> 
> Any news on this issue?

I tested again with drm-misc-next. At the moment of writing this, the last
commit is 6bd90e700b42 ("drm/xe: Make dma-fences compliant with the safe
access rules") and I still see a similar warning. The stack trace changed,
but the warning is still present.

I'm going to detail the exact steps I followed. Let's see if someone else is
able to reproduce the issue:

I started by applying the patches from this series that are not already merged:

 - [PATCH v4 4/9] x86/microcode: move away from using a fake platform
 - [PATCH v4 5/9] wifi: cfg80211: move away from using a fake
 - [PATCH v4 8/9] drm/vgem/vgem_drv convert to use faux_device
 - [PATCH v4 9/9] drm/vkms: convert to use faux_device

The last patch has small conflict in vkms_drv.h that I solved like this:

	struct vkms_device {
		struct drm_device drm;
		struct faux_device *faux_dev;
		const struct vkms_config *config;
	};

And in vkms_drv.c:

	static int vkms_create(struct vkms_config *config)
	{
		int ret;
		struct faux_device *fdev;
		struct vkms_device *vkms_device;
		const char *dev_name;

		dev_name = vkms_config_get_device_name(config);
		fdev = faux_device_create(dev_name, NULL, NULL);
		if (!fdev)
			return -ENODEV;

Next, I installed the new kernel in a QEMU virtual machine running Fedora 41.
There is nothing special about my Fedora, it is the regular desktop version.

After a reboot, "sudo modprobe vkms" shows a similar warning in dmesg.
For reference, the warning is at the end of my email.

Am I the only one sawing this warning?

Jose

---

[   69.417850] [drm] Initialized vkms 1.0.0 for vkms on minor 1
[   69.419446] faux_driver vkms: [drm] fb1: vkmsdrmfb frame buffer device
[   69.520944] ------------[ cut here ]------------
[   69.520954] WARNING: CPU: 2 PID: 1015 at drivers/dma-buf/dma-buf.c:1518 dma_buf_vmap+0x212/0x540
[   69.520992] Modules linked in: vkms snd_seq_dummy snd_hrtimer snd_seq snd_seq_device snd_timer snd soundcore nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables rfkill qrtr sunrpc binfmt_misc ppdev pktcdvd parport_pc parport pcspkr i2c_piix4 e1000 i2c_smbus joydev loop nfnetlink vsock_loopback zram vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport vmw_vmci vsock bochs serio_raw ata_generic pata_acpi fuse qemu_fw_cfg
[   69.521082] CPU: 2 UID: 42 PID: 1015 Comm: KMS thread Not tainted 6.16.0-rc1+ #3 PREEMPT(voluntary) 
[   69.521092] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-4.fc42 04/01/2014
[   69.521095] RIP: 0010:dma_buf_vmap+0x212/0x540
[   69.521105] Code: 7c 41 ff 03 0f 85 0a 02 00 00 c9 e9 c8 47 0c 01 80 3c 06 00 0f 85 c4 01 00 00 48 c7 01 00 00 00 00 48 85 d2 0f 85 bd fe ff ff <0f> 0b b8 ea ff ff ff eb af 48 85 f6 0f 85 cf 01 00 00 48 89 4c 24
[   69.521112] RSP: 0018:ffffc90006a5f690 EFLAGS: 00010246
[   69.521125] RAX: dffffc0000000000 RBX: 1ffff92000d4beea RCX: ffff88811467dcc8
[   69.521128] RDX: 0000000000000000 RSI: 1ffff110228cfb99 RDI: ffff88811467dcd0
[   69.521131] RBP: ffffc90006a5f728 R08: 1ffff92000d4bed9 R09: fffff52000d4bef1
[   69.521162] R10: fffff52000d4bef2 R11: ffff8881017f4e28 R12: ffff8881149594f0
[   69.521165] R13: ffff888114959400 R14: 1ffff11023146b29 R15: ffff88811467dcc8
[   69.521168] FS:  00007fbbdd1ff6c0(0000) GS:ffff888417580000(0000) knlGS:0000000000000000
[   69.521172] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   69.521174] CR2: 00007fbbcc0345c8 CR3: 000000011ec5a000 CR4: 00000000000006f0
[   69.521179] Call Trace:
[   69.521182]  <TASK>
[   69.521185]  ? __pfx_dma_buf_vmap+0x10/0x10
[   69.521193]  ? dma_resv_get_singleton+0x9a/0x2a0
[   69.521197]  drm_gem_shmem_vmap_locked+0xc2/0x5f0
[   69.521208]  ? __pfx_drm_gem_shmem_vmap_locked+0x10/0x10
[   69.521212]  ? __pfx_ww_mutex_lock+0x10/0x10
[   69.521225]  ? sched_clock_noinstr+0xd/0x20
[   69.521230]  ? local_clock_noinstr+0x13/0xf0
[   69.521233]  drm_gem_shmem_object_vmap+0xd/0x20
[   69.521237]  drm_gem_vmap_locked+0x70/0xf0
[   69.521247]  drm_gem_vmap+0x4c/0xa0
[   69.521250]  drm_gem_fb_vmap+0xb2/0x3b0
[   69.521255]  vkms_prepare_fb+0x6f/0x90 [vkms]
[   69.521264]  ? drm_atomic_helper_setup_commit+0xb7b/0x1320
[   69.521268]  drm_atomic_helper_prepare_planes+0x19f/0xb90
[   69.521272]  ? __pfx_drm_atomic_helper_commit+0x10/0x10
[   69.521276]  drm_atomic_helper_commit+0x126/0x2d0
[   69.521279]  ? __pfx_drm_atomic_helper_commit+0x10/0x10
[   69.521282]  drm_atomic_commit+0x205/0x2d0
[   69.521290]  ? _raw_spin_lock_irqsave+0x97/0xf0
[   69.521295]  ? __pfx_drm_atomic_commit+0x10/0x10
[   69.521299]  ? __pfx___drm_printfn_info+0x10/0x10
[   69.521313]  ? drm_event_reserve_init+0x1cd/0x260
[   69.521318]  drm_mode_atomic_ioctl+0x1c79/0x2d30
[   69.521323]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[   69.521326]  ? __kasan_check_write+0x18/0x20
[   69.521339]  drm_ioctl_kernel+0x17b/0x2f0
[   69.521343]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[   69.521349]  ? __pfx_drm_ioctl_kernel+0x10/0x10
[   69.521353]  ? __pfx_do_vfs_ioctl+0x10/0x10
[   69.521361]  ? __kasan_check_write+0x18/0x20
[   69.521365]  drm_ioctl+0x51b/0xbd0
[   69.521369]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[   69.521373]  ? __pfx_drm_ioctl+0x10/0x10
[   69.521378]  ? selinux_file_ioctl+0xfc/0x260
[   69.521390]  __x64_sys_ioctl+0x143/0x1d0
[   69.521394]  x64_sys_call+0xf4b/0x1d70
[   69.521404]  do_syscall_64+0x82/0x2a0
[   69.521408]  ? __kasan_check_write+0x18/0x20
[   69.521411]  ? do_user_addr_fault+0x491/0xa60
[   69.521420]  ? irqentry_exit+0x3f/0x50
[   69.521423]  ? exc_page_fault+0x8b/0xe0
[   69.521426]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   69.521430] RIP: 0033:0x7fbc078fd8ed
[   69.521441] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
[   69.521444] RSP: 002b:00007fbbdd1fd9b0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[   69.521449] RAX: ffffffffffffffda RBX: 00007fbbcc02af60 RCX: 00007fbc078fd8ed
[   69.521452] RDX: 00007fbbdd1fda50 RSI: 00000000c03864bc RDI: 0000000000000035
[   69.521455] RBP: 00007fbbdd1fda00 R08: 00000000000000e0 R09: 0000000000000001
[   69.521457] R10: 0000000000000003 R11: 0000000000000246 R12: 00007fbbdd1fda50
[   69.521459] R13: 00000000c03864bc R14: 0000000000000035 R15: 00007fbbcc02acf0
[   69.521464]  </TASK>
[   69.521466] ---[ end trace 0000000000000000 ]---



> Best regards
> Thomas
> 
> > 
> > Jose
> > 
> > > -Sima
> > > 
> > > -- 
> > > Simona Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 

