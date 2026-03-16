Return-Path: <linux-usb+bounces-34837-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id teJALz+dt2l/TgEAu9opvQ
	(envelope-from <linux-usb+bounces-34837-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 07:03:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11642294EF5
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 07:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CB32300C00C
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 06:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA6C347530;
	Mon, 16 Mar 2026 06:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bcSHVKRg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FE916CD33
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 06:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773641016; cv=pass; b=OsqoawrniGVACE3cuLGZUcI0pHhiFKdRWFljTvOiFU3zuR/jkjZphSMnt5W2PyLnsDucBxKhJyoNItjRrdCSBxJ9Bkf+H+uabailKuHn3ojDXCmQEM7hpTN+VI3ml8ozZOcw56fF0ED1TXUCqzuPoDnKle+rJRVk4ySSeRIO5kQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773641016; c=relaxed/simple;
	bh=JETvAMt3ebxE2AmBuFoJ/El8CDsE9vrC145OHRzCfU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J+JnI2QMlerdlVlnXHUr79duvOTf3IDQOZcLKzmD04qHgZhpKWI7DJF0E4GagQ9/vpowTyhc6SD1fobvKYXgluQd76XH1JQsdpBQluwATLfbG3IbNtsDJZRrcO36/lEVrNOk4OvHQKfVqxE9hPeNW6Te0uwqVp01fIUL7nOHR7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bcSHVKRg; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a10a116145so5469e87.1
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 23:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773641013; cv=none;
        d=google.com; s=arc-20240605;
        b=QmvDymShXNGqvQ9EgH24GWajUg7Lr+2IUBlQcXcoRkmeyWEQvgiS3I5PNZPIz0iyAF
         ufzkzD+fHwSc189czmvnEhWWkwEVIBIvxk8Rz9vwU8KTCh+sxxXfyHfTiaExCtJs88Bm
         GM+Txsc8TFsfileboSs4kUtUn8cc7oqekOtoKbWh31NwvlRy2F2VmcTiqHGVTg4v+CJ2
         A2dUxFGdwkshSrZVZAALQdI/HnFqKPgUSM+cGkjcdAIgqf+LakvDpO6k/99P2KXFu6Eg
         3VQSOYDyOf4qxezxIPXT+Dz3SkcLtXHwosEhZWNbP9OGM89xciwKXNA9bUOgPXOt7QaC
         fvuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hFquOqjvImf7rjWNLJcFuHTHwMGilCIYxNKCW0szI+o=;
        fh=oq2GS57+qB14F9agmgC9GVcRYlUxBwFyWdprt/yWJJ4=;
        b=YZTpXxevzGHLJHu5efi6wE7KHEymJbcUXn0agNa0LXnk/XMqk2jAG7e4BGBOyVKoq8
         Vi36T7PtLDlbnPVjFud6+x2FIgkl6Ei2GCahshMZZl9EAx2r0CiTFXfzFnahmT6Y0pDf
         kU7AgvkPY7C+8VH1p+BSGlhoqH6Jb1XOkAEaKc4r4f3fNn+ZmQTiy/S168j/QM+GKbn8
         te3lnmBxpMw8iKd1PvrmFeb6oFbyBdPRiqwdFUGK52ZnREKU/lzg7G3OzMMRCtJuF842
         IfZ7HQDnZCfVKZ6V+ojJn3AGQQKvJmwEJjI6KJVwtY+woeRQovPwkdjgc9ZmXY4Ft+eW
         JxYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773641013; x=1774245813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFquOqjvImf7rjWNLJcFuHTHwMGilCIYxNKCW0szI+o=;
        b=bcSHVKRgTwzx1KbuFMxsSZjmeTaaetcgZXA0Zuy5GfkD+DIxuhWqF7JuDfSzOWJXuF
         B9FfqsJ9sNL0RlRJaN6ZiaMPvuwLBkttdho3D5WBhRDVoUraVGLh9Ne4VZtIDK6q9Uq1
         4RkcMCjvI1Lz+G4QdhMzGAlmRJ04znqYd6I7BgdMtIsq5IJ53KmCzeAFwLkwFPdQX85I
         2O8t8/BE0RwtrcM7itvUAlrz51WlMWEYoCfau0177VUILaE4d9MnhDQ4RzXKip3DCoJP
         8tWulbnKzQLsdBqWYpDY+xu6r1jyfApj+4KSikcpVf28XGTKuLiipzyzXf6+CBtYwAfw
         YAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773641013; x=1774245813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hFquOqjvImf7rjWNLJcFuHTHwMGilCIYxNKCW0szI+o=;
        b=cxudq2NOOerptQ6h5K6WkKlZNchVuadT72RZyoHirAh8R3fk/VqlCx0VUZhOFrwan5
         4sc8QXrwYhQRV6Fo6M2F0si4ed8JvRqcWN3eFzl+gu6UPaN+r5Uzmna3bR9+JyY9X91F
         zzyzw8MmefjdQLuet3fVVvw9pbZySRsOIRkJzmltOiI+T7W+QJSJztAD0jhh6+KPk4oU
         ZGY+5RiaWNYIWK0inKOcbBx7hYQ/S8aztRJ5bdMwZBzh3XFpJLg7RObmjlkNWV3rkudD
         UU2Z6SI1fhh7WEKu0b7+kVwqefAPuNxAIAjLraO2P7utvV58OSfUm2WXcnFKxkLjMIA5
         38gA==
X-Forwarded-Encrypted: i=1; AJvYcCWKV+VEpwLVwIxfcqHrcTZoECHTLt0HW6jyaO8b/GxWblz5IiAZZG1Jiu3jfCZUlvCrKrT55V06L/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxtGfDrSxKs68+LULUmlyq0aV4u81Kod6MhBJKB5UPNm8U0rRN
	yEyly8Whm3ZhBSlKtfntZGLU21oaTUAdHdY6KkR5fRW3RnXFmUiNNv7zy3xp1SqTQYf09YBOdtr
	dLZfQfRUHxX64cmq2gf1avQblfaTY6uFFStKP6sAVRb+FbY7VV2g3hlSe
X-Gm-Gg: ATEYQzxTvl7aaXtflBmoxDpJmZ56XXSDaot0nQegGC92GaCBLXInFoV4MkMFbQvyiWb
	5eGq0es0cRf2szoXmeJxzLXj0nRd3ulJhfwQ8F48HU+yR20P6a53MGk/89As6JfP7/qWTgYO044
	Ct/aFRv43ahx5gCWGOs0Q4YajsRi7O2h2jh0jdpGloo1lgRmozymXMtzf2b3WNiaAMGV1Ul/x+q
	cCmLHqUnAve1XXBhzcInnkmeA1t51pd4FV6EBhJL9MsbWxF6GH8LVzsfL/Rx2deDuj5UFz6z78e
	OQOAuEMNcDcQcQAsTvlxY05pXmLwaJ4h2/81XQQBxHtB
X-Received: by 2002:a19:c20a:0:b0:5a1:43ca:1ff5 with SMTP id
 2adb3069b0e04-5a168fd53bdmr87713e87.3.1773641012746; Sun, 15 Mar 2026
 23:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-f-ncm-revert-v2-0-ea2afbc7d9b2@google.com>
 <20260309-f-ncm-revert-v2-7-ea2afbc7d9b2@google.com> <10890524-cf83-4a71-b879-93e2b2cc1fcc@packett.cool>
In-Reply-To: <10890524-cf83-4a71-b879-93e2b2cc1fcc@packett.cool>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Mon, 16 Mar 2026 14:03:05 +0800
X-Gm-Features: AaiRm52vh2UciGU0vJqE4AZD_p7WxpCYCNBfIt8mjYKcNk3N-X6E4MxKbRPNtyQ
Message-ID: <CAKzKK0ox=2cTxVJkEZQ39RTbrpyERqhd40Xvjrtfw0D4d5UVhA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] usb: gadget: f_ncm: Fix net_device lifecycle with device_move
To: Val Packett <val@packett.cool>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Heidelberg <david@ixit.cz>, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, Jon Hunter <jonathanh@nvidia.com>, 
	LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34837-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khtsai@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,packett.cool:email]
X-Rspamd-Queue-Id: 11642294EF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Val,

On Sun, Mar 15, 2026 at 1:21=E2=80=AFPM Val Packett <val@packett.cool> wrot=
e:
>
> Hi,
>
> On 3/9/26 9:04 AM, Kuen-Han Tsai wrote:
> > The network device outlived its parent gadget device during
> > disconnection, resulting in dangling sysfs links and null pointer
> > dereference problems.
> >
> > A prior attempt to solve this by removing SET_NETDEV_DEV entirely [1]
> > was reverted due to power management ordering concerns and a NO-CARRIER
> > regression.
> >
> > A subsequent attempt to defer net_device allocation to bind [2] broke
> > 1:1 mapping between function instance and network device, making it
> > impossible for configfs to report the resolved interface name. This
> > results in a regression where the DHCP server fails on pmOS.
> >
> > [..]
>
> I just saw that this was the last commit touching u_ether while
> debugging=E2=80=A6 the DHCP server failing on pmOS. (In the initrd, even)=
.
>
> Specifically, udev calling ethtool_get_drvinfo and eth_get_drvinfo
> dereferencing an unset dev->gadget:

Thanks for the report and testing.

I can reproduce the problem on a Pixel 3 by dropping into the pmOS
debug shell. When pmOS drops into the debug shell, it temporarily
unbinds the gadget to reconfigure the USB functions. Since my recent
patch intentionally reparented the net_device to /sys/devices/virtual
during unbind, dev>gadget became NULL. Meanwhile, the ethtool queries
on the surviving interface, leading to a null pointer dereference.

>
> [    7.528277] [pmOS-rd]:   Setting up USB gadget through configfs
> [    7.539437] configfs-gadget.g1 gadget.0: HOST MAC 2a:a6:63:b7:92:23
> [    7.545914] configfs-gadget.g1 gadget.0: MAC 76:1d:2b:16:aa:25
> [    7.577888] [pmOS-rd]: Trying to start server with parameters: Server
> IP addr: 172.16.42.1:67, client IP addr: 172.16.42.2, interface: usb0
> [    7.591522] [pmOS-rd]: Entering debug shell
> [    7.597590] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000080
> [    7.606670] Mem abort info:
> [    7.609571]   ESR =3D 0x0000000096000004
> [    7.613462]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> [    7.618942]   SET =3D 0, FnV =3D 0
> [    7.622105]   EA =3D 0, S1PTW =3D 0
> [    7.625354]   FSC =3D 0x04: level 0 translation fault
> [    7.630395] Data abort info:
> [    7.630398]   ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
> [    7.630401]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> [    7.630404]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> [    7.630407] user pgtable: 4k pages, 48-bit VAs, pgdp=3D0000000107b1800=
0
> [    7.630411] [0000000000000080] pgd=3D0000000000000000, p4d=3D000000000=
0000000
> [    7.630420] Internal error: Oops: 0000000096000004 [#1]  SMP
> [    7.630425] Modules linked in: typec msm ubwc_config mdt_loader ocmem
> rtc_pm8xxx drm_gpuvm drm_exec i2c_qcom_geni llcc_qcom gpi gpu_sched
> drm_client_lib phy_qcom_snps_femto_v2 drm_display_helper cec
> drm_dp_aux_bus icc_bwmon drm_kms_helper drm backlight ufs_qcom
> phy_qcom_qmp_ufs icc_osm_l3 pmic_glink pdr_interface qcom_pdr_msg
> qmi_helpers
> [    7.630486] CPU: 1 UID: 0 PID: 175 Comm: (udev-worker) Tainted: G
>      W  7.0.0-rc3-next-20260313-00118-gf4f287b6004a-dirty #59 PREEMPT(ful=
l)
> [    7.630493] Tainted: [W]=3DWARN
> [    7.630495] Hardware name: Motorola edge 30 (DT)
> [    7.630499] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS
> BTYPE=3D--)
> [    7.630503] pc : eth_get_drvinfo+0x50/0x90 <..snip..>
> [    7.630595] Call trace:
> [    7.630598]  eth_get_drvinfo+0x50/0x90 (P)
> [    7.630608]  ethtool_get_drvinfo+0x5c/0x1f0
> [    7.630617]  __dev_ethtool+0xaec/0x1fe0
> [    7.630622]  dev_ethtool+0x134/0x2e0
> [    7.630627]  dev_ioctl+0x338/0x560
> [    7.630633]  sock_do_ioctl+0xe0/0x128
> [    7.630642]  sock_ioctl+0x2cc/0x3e0
> [    7.630647]  __arm64_sys_ioctl+0xac/0x108
> [    7.630656]  invoke_syscall.constprop.0+0x48/0x100
> [    7.630664]  el0_svc_common.constprop.0+0x40/0xe8
> [    7.630670]  do_el0_svc+0x24/0x38
> [    7.630676]  el0_svc+0x34/0x180
> [    7.642931] [pmOS-rd]: /usr/bin/buffyboard
> [    7.644473]  el0t_64_sync_handler+0xa0/0xe8
> [    7.644482]  el0t_64_sync+0x17c/0x180
> [    7.644491] Code: 91094021 94134bd9 f9457680 d2800402 (f9404001)
> [    7.644495] ---[ end trace 0000000000000000 ]---
>
> As a "workaround", this works:
>
>
> --- a/drivers/usb/gadget/function/u_ether.c
> +++ b/drivers/usb/gadget/function/u_ether.c
> @@ -113,8 +113,14 @@
>
>       strscpy(p->driver, "g_ether", sizeof(p->driver));
>       strscpy(p->version, UETH__VERSION, sizeof(p->version));
> -    strscpy(p->fw_version, dev->gadget->name, sizeof(p->fw_version));
> -    strscpy(p->bus_info, dev_name(&dev->gadget->dev), sizeof(p->bus_info=
));
> +    if (dev->gadget) {
> +        strscpy(p->fw_version, dev->gadget->name, sizeof(p->fw_version))=
;
> +        strscpy(p->bus_info, dev_name(&dev->gadget->dev),
> sizeof(p->bus_info));
> +    } else {
> +        pr_warn("%s: called with no gadget set\n", __func__);
> +        strscpy(p->fw_version, "N/A", sizeof(p->fw_version));
> +        strscpy(p->bus_info, "platform", sizeof(p->bus_info));
> +    }
>   }
>
>   /* REVISIT can also support:
>
> ..or would that not be a workaround? The lifecycle of gadget being set
> seems kinda decoupled from the lifecycle of the registration (??) And as
> long as it's registered, the dev info can be queried (?)
>
>
> Thanks,
> ~val
>

I believe your suggested fix correctly handles this detached state.
One minor suggestion: looking at ethtool_get_drvinfo() in
net/ethtool/ioctl.c, we can simply skip the strscpy calls entirely
when dev->gadget is NULL. ethtool_get_drvinfo() checks if bus_info or
fw_version are empty strings and handles the fallback natively, so we
don't need to explicitly copy "N/A" or "platform".

I'll send out a standalone fix shortly and will include the
Suggested-by and Reported-by tags for you. Thanks again for catching
this!

Regards,
Kuen-Han

