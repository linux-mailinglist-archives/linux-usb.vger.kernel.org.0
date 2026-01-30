Return-Path: <linux-usb+bounces-32919-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Gy6J4sGfGnGKAIAu9opvQ
	(envelope-from <linux-usb+bounces-32919-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 02:16:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24026B61F9
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 02:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A607B302EA8F
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 01:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C77A3009D6;
	Fri, 30 Jan 2026 01:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pYjGURXX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BA032FA20
	for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 01:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769735795; cv=pass; b=BFq47ZeMzRpGPyzCmbGPAuaVsCmtOlxViD4nszO4qxT5DZeOcYJfmihSkt89Jb7/7chbMbDPNU2LuESUHNS/WEwLPnXuZG+dcWfSahwkus4y5cjWgslq9BHrNzkqYQKeKzJY8Jiy0HAXWIfJ0/ZeDc/kVM8qgGjr8cv7SbP0LX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769735795; c=relaxed/simple;
	bh=qynRfaO2IfQHcVC7rjEM4LJol2rxXEFXu0TZsMkojdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pvCQXd6Qbq0NEVnFXyzJg3WRvGL6pIl1tzYaBcr+tV77d4r/JnMcS0wpKe7CEyniaQw22wHMud6ahgKjFvKn04oS0UGWD8Q7tQEoR6LPORaUE7FjUSjpYDKmFjLRr0w4IkaMIbY9cOD8E1JhbWumXxpYw4V176fhpAKLCGpPb30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pYjGURXX; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-658b511573cso2823272a12.0
        for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 17:16:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769735792; cv=none;
        d=google.com; s=arc-20240605;
        b=hBG/4sPcxqtjg3Me6fYd+plrQuG3fBZ9mL33o1emvDUvrppK/Z881jMQ3SxZ/57V9r
         fGNS3gCjQS0X/OKofeHQFte8VV+Q91T3QH79tLsg4JyY7FwgXwa5OfT4A5CReB4nxbFm
         WT4oasVe4ANnPe508GqooJ641nhINNCWpp3/Om2xJRg0LKdIPGGMgV7HRNUYyQJRdsMv
         V+HsvD13bix/zh82tp4xHDve10e4j/0rxKUzuD6LSRAcdTam6JBUDGvS67WyQH9MeZ2f
         Omc4kzG0+SpnVFQcoH6e6fAJdXsHKGJjpUeDivJ/YuqiWB/MSFP1XeQm7Kr7ruLI1dDe
         +TUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TDFRbEmoo50qM27MYVAAAo2rNiUVkc6+HtDETmMWn38=;
        fh=1fGu/LOH1kOGGaGjE2wzMcvgTuea1aSmZYjPLgZvaNU=;
        b=j/26NmgU+4ZTRWD/Jw891CJXFd+u+zCmkDM9hQYnCf9NQlNxpCTLXORNrRt42xGVFo
         rIfADEWU7qaPTCDUUb1bsM8Wof/J8qdta7fUOc35+aX0GNqngO8WH+lceNEoU1Pv5jS+
         8DDy1d0m/OBUxLyI5Q0R/HVjF8vE4UMg9CcbxKZ9Ha5/D9I2tFoB62r4F5xyv+u0e3pv
         pv+TN8sKaZ84nZoepQnSVE5OJv00FAHBfGNBZZfRzFz/fqe7Vx0kSdnLILHtSprh272Y
         3gfkMdHVZqnoU4I5Ha731bEwEWuMgyK/P2h/Xnf/YVhDthGn/m6L1k53gTZvC/Zd8S3Y
         JxlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769735792; x=1770340592; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDFRbEmoo50qM27MYVAAAo2rNiUVkc6+HtDETmMWn38=;
        b=pYjGURXXXWNg9VljE7N1/Vw9/c+4QUweJp3s+9Qaa6HH69PVfHf4yif0cRxLlO8Spe
         1US842gbgzVrpm7MwTahzEAmOGLpHewpba+E5y65XMKgZunW80ZFH1stNzJHNafNUdIN
         R8vVt4gHXS4RPqma8KjuZ/5/6T2W2KZslEjLdzxzdejBCVR32vEnRc7B02/4FbOgTmOz
         nQwGdxbd6eqvUBISetQQSV63nDVxPOHIlWYjTGXcutZOLJTGhRlMLetPBtD+R2EQ0BFZ
         /kM4oEzwgIz+95rwZA+cCfICQ49xW8xu39KbDk0yVLi+ePPkxR5kDSHHrTS44LpW8zSj
         WfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769735792; x=1770340592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TDFRbEmoo50qM27MYVAAAo2rNiUVkc6+HtDETmMWn38=;
        b=Vy+CzRnpvHDgV+4VCgpM2paG46lm8cQjm7gh+KgqUDv5D1B0UpxNg2XR89Wd/zQlAM
         uU14zWAG96CvXXPaXhxRiDxqVvUFmlHq+3Mu33nIONMMq0KqeBkdTrS3WiZSRj5VmBOq
         CidEgb6AuplmR1Xr8FarH/WSrD7lqHsa52iR8Gqse+BSjVNKt4iYI93JlaygfnZWiEG5
         lt5hGBCccWK3h4b9ZDoknvZKbyCOV3hWUpRwAlipLEhXzjY4eJSpOdg9IJPvjN0a4xN4
         WSPW5mpMGfWwTqs2D9avTThUBG10fqg99putpwz9xNVhp+C7zy/vnrzMMU2zGIneBW7m
         iSrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzCyg2Jzf/4FNqpw9YgreaL1L7rOHBCPkyhvYIUoL/OFX93XMP1dDAt1osdsKTCCnYE2XM/RdpKwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN9qv+KJgIEjQacNVvyg2XF9VT1KqAl3krTsvmtExuYN9wc3Cs
	C6CiEH7ruNt5d/njP9UeM6eiXmdmQtcuPNxwDRD1ad5oAn/vh4+qvgYNQos16Y0yiTJRNZrTox/
	jiL9eGs6YlWautQTG5hoWD5/2IkSPSACfxQYnSlF5
X-Gm-Gg: AZuq6aIK4nfXtoXf8bUrKu4S1vv1E+LeclEEcudgjCb6MdrkL3TGh8mdv1sL+c0Ndzo
	VR1kffN9gyt+is7Y+xAIBcw79MGBWpW7Rmk0LI1eNzOFtlBWsK9lQI9S7YzsT2+mqSd5Vmk8kQt
	H6WZKoZCwMdg0ZKeDbl5/10aW+TUuaYrPHQhfXoQTSSI6d/OhNPsGT0qI/1BUQNbcDmbAzcmpDv
	ASAeR6r6qtJSa7O6/QjGmK3BUD/i7sQlutIZeQjpKPCR7sGPxPm77bdEDAy7mYL08uGmZP7WU7y
	7PY7Mzsrzv1QDm88tlPL2INIp2gK3w==
X-Received: by 2002:a17:906:eecb:b0:b88:31f9:1d9a with SMTP id
 a640c23a62f3a-b8dff71fbbcmr62042966b.62.1769735792220; Thu, 29 Jan 2026
 17:16:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118051604.3868588-1-viro@zeniv.linux.org.uk>
 <CAG2KctrjSP+XyBiOB7hGA2DWtdpg3diRHpQLKGsVYxExuTZazA@mail.gmail.com>
 <2026012715-mantra-pope-9431@gregkh> <CAG2Kctoo=xiVdhRZnLaoePuu2cuQXMCdj2q6L-iTnb8K1RMHkw@mail.gmail.com>
 <20260128045954.GS3183987@ZenIV> <CAG2KctqWy-gnB4o6FAv3kv6+P2YwqeWMBu7bmHZ=Acq+4vVZ3g@mail.gmail.com>
 <20260129032335.GT3183987@ZenIV> <20260129225433.GU3183987@ZenIV>
In-Reply-To: <20260129225433.GU3183987@ZenIV>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 29 Jan 2026 17:16:20 -0800
X-Gm-Features: AZwV_Qio50GdQN1165WVg9oPRvbdMSYV2LeALjhPJoJWlsc8zYrp7Hv8KsFMrXk
Message-ID: <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com>
Subject: Re: [PATCH v4 00/54] tree-in-dcache stuff
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org, 
	torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz, 
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, 
	linux-mm@kvack.org, linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org, 
	paul@paul-moore.com, casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org, clm@meta.com, 
	android-kernel-team <android-kernel-team@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32919-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wusamuel@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 24026B61F9
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 2:52=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
rote:

> > Sorry, I hadn't been clear enough: if you do
> > git switch --detach 1544775687f0
> > and build the resulting tree, does the breakage reproduce?  What I want
> > to do is to split e5bf5ee26663 into smaller steps and see which one
> > introduces the breakage, but the starting point would be verify that
> > there's no breakage prior to that.

Ultimately, same conclusion as before: 6.18-rc5 with patches up to
1544775687f0 works, but adding e5bf5ee26663 breaks it.

> > PS: v6.19-rc7 contains fc45aee66223 ("get rid of kill_litter_super()"),
> > and reverting 6ca67378d0e7 ("convert functionfs") would reintroduce
> > the call of that function in ffs_fs_kill_sb(), so the resulting tree
> > won't even build on any configs with functionfs enabledd; are you sure
> > that you'd been testing v6.19-rc7 + reverts of just these 3 commits?

I also could have been more clear- I had to
s/kill_anon_super/kill_litter_super/ as part of the revert of
6ca67378d0e7 to properly build. That felt like an appropriate change,
but if not, adding patches on top of 6.18-rc5 is perfectly fine for
testing this.

> Could you try your reproducer on mainline with the following delta applie=
d?
>
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/func=
tion/f_fs.c
> index 05c6750702b6..6c6d55ba0749 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -646,12 +646,11 @@ static int ffs_ep0_open(struct inode *inode, struct=
 file *file)
>         if (ret < 0)
>                 return ret;
>
> -       ffs_data_opened(ffs);
>         if (ffs->state =3D=3D FFS_CLOSING) {
> -               ffs_data_closed(ffs);
>                 mutex_unlock(&ffs->mutex);
>                 return -EBUSY;
>         }
> +       ffs_data_opened(ffs);
>         mutex_unlock(&ffs->mutex);
>         file->private_data =3D ffs;
>

This didn't work on either build variant (6.18-rc5 and 6.19-rc7).

I'm exploring a few other paths, but not having USB access makes
traditional tools a bit difficult. One thing I'm rechecking and is
worth mentioning is the lockdep below: it's been present for quite
some time now, but I'm not sure if it would have some undesired
interaction with your patch.

[ BUG: Invalid wait context ]
6.18.0-rc5-mainline-maybe-dirty-4k
-----------------------------
irq/360-dwc3/352 is trying to lock:
ffffff800792deb8 (&psy->extensions_sem){.+.+}-{3:3}, at:
__power_supply_set_property+0x40/0x180
other info that might help us debug this:
context-{4:4}
1 lock held by irq/360-dwc3/352:
 #0: ffffff8017bb98f0 (&gi->spinlock){....}-{2:2}, at:
configfs_composite_suspend+0x28/0x68
Call trace:
 show_stack+0x18/0x28 (C)
 __dump_stack+0x28/0x3c
 dump_stack_lvl+0xac/0xf0
 dump_stack+0x18/0x3c
 __lock_acquire+0x794/0x2bec
 lock_acquire+0x148/0x2cc
 down_read+0x3c/0x194
 __power_supply_set_property+0x40/0x180
 power_supply_set_property+0x14/0x20
 dwc3_gadget_vbus_draw+0x8c/0xcc
 usb_gadget_vbus_draw+0x48/0x130
 composite_suspend+0xcc/0xe4
 configfs_composite_suspend+0x44/0x68
 dwc3_thread_interrupt+0x8f8/0xc88
 irq_thread_fn+0x48/0xa8
 irq_thread+0x150/0x31c
 kthread+0x150/0x280
 ret_from_fork+0x10/0x20

