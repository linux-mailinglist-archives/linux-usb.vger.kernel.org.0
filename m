Return-Path: <linux-usb+bounces-28447-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57465B8ED20
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 04:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 298FB1899E60
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 02:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CD51940A1;
	Mon, 22 Sep 2025 02:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="CTpJpL5j"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767D61624C0
	for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 02:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758509416; cv=none; b=cf7Db+c5j6yTK0++ebYamDJaSoafMM+ap+YzAb4nI6pXjcyORXfUey27+8VJNRSYKR2IM/Eu28aeHhkfC+NX+IZjEnrQxDnPsEVxgUzJTM30K5KZiqZz079zPOj5sWXk0HCBd4mCbubbTfaInnPGLouZGamyo39jZbKZ5vJyp5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758509416; c=relaxed/simple;
	bh=CgwpNFfpqmjkGk0B41xrDKNmYFGtKYebo67dzo02bcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8VCbahBZSy+G0ZhhlW7KONcDWTF9esp3KUCwu+8ySSp1ICiqdqo+U0MrvLq5J7RwS6+1yduD/DcfIPBJ0eB6pQzmSrryRlUil3QbDqLqiYb4QJqPpFKwTQJ7iXKJuzlniC7FzrSZ3tCMvJowGldya43u2lObWbwL2Fvx4B/MyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=CTpJpL5j; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b5526b7c54eso1466286a12.0
        for <linux-usb@vger.kernel.org>; Sun, 21 Sep 2025 19:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1758509414; x=1759114214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7XFLhLN2bC131m5hKpTDzRYLjnq0kauHpj5EizfADo=;
        b=CTpJpL5j2tzYC53T0RbbLbCqLvikZgn3zKC7qkW/Ip6P6F3152csw39wcYtQwZiZ4K
         yzBKo59mT9pcmYDAKvLSdOoiKfx2peRF5uYQk5Qrdv9jpJbds152Uhsrfj1l/emj7U5H
         BXMk2BbfGc4PsSpEjCnsU76dFdZX2rrdMVqnI3zo6lsbeZIrACJGPIcEejU7rXkfEcyx
         TPM9kbslmmrPLRa6sqc3Nt+JP3HrwWICzbjcawgHEtUeBp0g+OgLftjM8HoGfHX2KWAV
         BjxXnLCNkTMhKSZxnZVuO2mm0BP7e7wX0maXRoWpAs/JIdzUx41DgbWokG2Smoks0qkT
         lt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758509414; x=1759114214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7XFLhLN2bC131m5hKpTDzRYLjnq0kauHpj5EizfADo=;
        b=HuUHfEGfL37fPsuNDep9Q+hxjJnT8S23YYsuq1RqdtWuUXx1zIgxvizn8i+MXZGDwh
         fTgqZS6IlouuvGFXdxLDtwles7Y3UVxWnniCd+nBbGjRoewQMPCJm9hftQlemHCFXlDF
         RaebcC6XKs5YZunukA86kYtLUFgb7EctLBbzTgTUDUXbaRGa6D82q8OHlIQcMEcf8Lve
         va764bCO39sOLi/AcB1fXJ9wx790LANSalglbshWj8n/p81GpS3eODTftiHSdPBMJtS0
         8TVw8V0iwdxMsDBfoswMWlsWv1PwswEleIi2NXmks63FInOho2aboUg0gqkbzSqDTMI2
         Ptgw==
X-Forwarded-Encrypted: i=1; AJvYcCU5hro/t9Cz5jWXjgHG/agz0dMnrNE8jyT9oUHGNbFKg5Dgh+sqjr0KjgBcA0k3gCCwwkCbwetIQSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ4P4I5+4lDF14/19D+JESpTZ6pNJ3HMpbUuQX0iopaP9Cr0kr
	bl8TyZ6c5h+dm6mkY+m3thYmOHPd76HbeiBF/ahLK9tWZIb6yejzLhmIz21dUFqZikU7xo/Bve7
	19GRSYdbuQnaQL+St5O9Fh7rhcIGqQi34xcLY38UI
X-Gm-Gg: ASbGncvjEr241lmGbeQve3uAcfg7m03u9HiwsZGcQRsP2P/2AMn3gkZfjtOwNuXd18W
	ErqfhCMk9m8BeaenkIDjzqTyaZo/0/jEM0Hh1YlEooHjsdjY+BSCeqZ2ll+3VtxjfMYCskzB5ea
	PtOZT5uc9KqC9VyesEv4OwQJR4cN8YkAu6q/8R1JykZofhDeDbqMZPkmQodGsJRL/8HrnSTe28s
	rPm0Pk=
X-Google-Smtp-Source: AGHT+IGe+15w8xvp7a+Fw0oSWAsBTAKPDi7raUHSz68Xr1TN17drDWabkB3/4zSQVbDi/BgDo5ph0IOND5WuUlo/leI=
X-Received: by 2002:a17:90b:5109:b0:327:7c8e:8725 with SMTP id
 98e67ed59e1d1-33097fee350mr12554584a91.10.1758509413659; Sun, 21 Sep 2025
 19:50:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250920074156.GK39973@ZenIV> <20250920074759.3564072-1-viro@zeniv.linux.org.uk>
 <20250920074759.3564072-31-viro@zeniv.linux.org.uk> <CAHC9VhTRsQtncKx4bkbkSqVXpZyQLHbvKkcaVO-ss21Fq36r+Q@mail.gmail.com>
 <20250921222619.GO39973@ZenIV>
In-Reply-To: <20250921222619.GO39973@ZenIV>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 21 Sep 2025 22:50:02 -0400
X-Gm-Features: AS18NWA59TWujxe3lwJRQwcdud2e03V7ijpvYuacj-73O3HLhpPDNRlQbZP5_x0
Message-ID: <CAHC9VhTy2j+hkT24hM1J2GH+12wp63DArRo6BGTvTwGX2k4CnA@mail.gmail.com>
Subject: Re: [PATCH 31/39] convert selinuxfs
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, 
	brauner@kernel.org, jack@suse.cz, raven@themaw.net, miklos@szeredi.hu, 
	a.hindborg@kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, kees@kernel.org, rostedt@goodmis.org, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, casey@schaufler-ca.com, 
	linuxppc-dev@lists.ozlabs.org, borntraeger@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 21, 2025 at 6:26=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
> On Sun, Sep 21, 2025 at 04:44:28PM -0400, Paul Moore wrote:
> > On Sat, Sep 20, 2025 at 3:48=E2=80=AFAM Al Viro <viro@zeniv.linux.org.u=
k> wrote:
> > >
> > > Tree has invariant part + two subtrees that get replaced upon each
> > > policy load.  Invariant parts stay for the lifetime of filesystem,
> > > these two subdirs - from policy load to policy load (serialized
> > > on lock_rename(root, ...)).
> > >
> > > All object creations are via d_alloc_name()+d_add() inside selinuxfs,
> > > all removals are via simple_recursive_removal().
> > >
> > > Turn those d_add() into d_make_persistent()+dput() and that's mostly =
it.
> > > Don't bother to store the dentry of /policy_capabilities - it belongs
> > > to invariant part of tree and we only use it to populate that directo=
ry,
> > > so there's no reason to keep it around afterwards.
> >
> > Minor comment on that below, as well as a comment style nitpick, but
> > overall no major concerns from me.
>
> FWIW, how's this for the preparatory part?
>
> commit 17f3b70a28233078dd3dae3cf773b68fcd899950
> Author: Al Viro <viro@zeniv.linux.org.uk>
> Date:   Sun Sep 21 18:09:48 2025 -0400
>
>     selinuxfs: don't stash the dentry of /policy_capabilities
>
>     Don't bother to store the dentry of /policy_capabilities - it belongs
>     to invariant part of tree and we only use it to populate that directo=
ry,
>     so there's no reason to keep it around afterwards.
>
>     Same situation as with /avc, /ss, etc.  There are two directories tha=
t
>     get replaced on policy load - /class and /booleans.  These we need to
>     stash (and update the pointers on policy reload); /policy_capabilitie=
s
>     is not in the same boat.
>
>     Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Looks good to me, ACK below.  For me personally, it's a bit late to
take non-bugfix stuff for the upcoming merge window so I would defer
this for a few weeks, but if you want to take it now that's your call.
Also your call if you would prefer this to go in with the rest of the
patchset you've working on, or if you want me to take it via the
SELinux tree.  Let me know.

Acked-by: Paul Moore <paul@paul-moore.com>

> diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
> index 9aa1d03ab612..482a2cac9640 100644
> --- a/security/selinux/selinuxfs.c
> +++ b/security/selinux/selinuxfs.c
> @@ -75,7 +75,6 @@ struct selinux_fs_info {
>         struct dentry *class_dir;
>         unsigned long last_class_ino;
>         bool policy_opened;
> -       struct dentry *policycap_dir;
>         unsigned long last_ino;
>         struct super_block *sb;
>  };
> @@ -117,7 +116,6 @@ static void selinux_fs_info_free(struct super_block *=
sb)
>
>  #define BOOL_DIR_NAME "booleans"
>  #define CLASS_DIR_NAME "class"
> -#define POLICYCAP_DIR_NAME "policy_capabilities"
>
>  #define TMPBUFLEN      12
>  static ssize_t sel_read_enforce(struct file *filp, char __user *buf,
> @@ -1879,23 +1877,24 @@ static int sel_make_classes(struct selinux_policy=
 *newpolicy,
>         return rc;
>  }
>
> -static int sel_make_policycap(struct selinux_fs_info *fsi)
> +static int sel_make_policycap(struct dentry *dir)
>  {
> +       struct super_block *sb =3D dir->d_sb;
>         unsigned int iter;
>         struct dentry *dentry =3D NULL;
>         struct inode *inode =3D NULL;
>
>         for (iter =3D 0; iter <=3D POLICYDB_CAP_MAX; iter++) {
>                 if (iter < ARRAY_SIZE(selinux_policycap_names))
> -                       dentry =3D d_alloc_name(fsi->policycap_dir,
> +                       dentry =3D d_alloc_name(dir,
>                                               selinux_policycap_names[ite=
r]);
>                 else
> -                       dentry =3D d_alloc_name(fsi->policycap_dir, "unkn=
own");
> +                       dentry =3D d_alloc_name(dir, "unknown");
>
>                 if (dentry =3D=3D NULL)
>                         return -ENOMEM;
>
> -               inode =3D sel_make_inode(fsi->sb, S_IFREG | 0444);
> +               inode =3D sel_make_inode(sb, S_IFREG | 0444);
>                 if (inode =3D=3D NULL) {
>                         dput(dentry);
>                         return -ENOMEM;
> @@ -2079,15 +2078,13 @@ static int sel_fill_super(struct super_block *sb,=
 struct fs_context *fc)
>                 goto err;
>         }
>
> -       fsi->policycap_dir =3D sel_make_dir(sb->s_root, POLICYCAP_DIR_NAM=
E,
> -                                         &fsi->last_ino);
> -       if (IS_ERR(fsi->policycap_dir)) {
> -               ret =3D PTR_ERR(fsi->policycap_dir);
> -               fsi->policycap_dir =3D NULL;
> +       dentry =3D sel_make_dir(sb->s_root, "policy_capabilities", &fsi->=
last_ino);
> +       if (IS_ERR(dentry)) {
> +               ret =3D PTR_ERR(dentry);
>                 goto err;
>         }
>
> -       ret =3D sel_make_policycap(fsi);
> +       ret =3D sel_make_policycap(dentry);
>         if (ret) {
>                 pr_err("SELinux: failed to load policy capabilities\n");
>                 goto err;

--=20
paul-moore.com

