Return-Path: <linux-usb+bounces-29846-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9C9C1BEB9
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 17:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69E22642BBF
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 15:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E440F307AC6;
	Wed, 29 Oct 2025 15:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvEqgW+H"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C538324B3C
	for <linux-usb@vger.kernel.org>; Wed, 29 Oct 2025 15:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761751193; cv=none; b=nagkm+XbRemjpGkN4d1gCcxWMQngASWt3ik6wuNBXMPNuuh42AX0v73CCGESYMLM88jbKm7LH5owtF9DWSNdGTOh9296BuzdaaYIbumkRv62o6UCxsAuNuUWsB3xCUFtTyMzzXfjSXIKAcWw0MPdagSJlkddytb3n+m1VbbP5QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761751193; c=relaxed/simple;
	bh=XmlYQpf2O8iYK7QwAPdhC5O4544PeopBai3GSa1C/lk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TWJ7p7zqlknrJi7zi4bug2rOaQGVnzsa6IG/kUO7yfrCfDTYrcTDelh00EEv1ZCdfnpEAR2BxwxxMk75ousJa5BGL25iiAAP7Z46D/j8fcV6u3zCtDg1DAW4L2Nb36z+Km6YH/T74RxFaLrg6j1mgnrtdXd/jOsV2Iq1BkN7/fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvEqgW+H; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7a226a0798cso30200b3a.2
        for <linux-usb@vger.kernel.org>; Wed, 29 Oct 2025 08:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761751191; x=1762355991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CdmUiAXh1HKc3m/r9pA/phMrmd+nlM0IzGmsHncGb4=;
        b=GvEqgW+HS2A7ZI89z0PHtK4lK3Y3bC8wfQBttwVKQ5T86Tcmb4THNhMGxsrKSRrhcC
         Rxp5XQIjxU0bQh9r/Gbv4alt7rs0kua+NfHcv4ZBewEOdB43IKstr5hpjuj+WHszDSpC
         rBuOme5aWRguoqv0UzttWxB2FKUPnG9ZYVFBt2mRaSg73diSWUf8u2z4uRu1tqFfCQdC
         jXm0C57x57EUCpFxjs0KZKgcSz/NIXgqruMJg7AzP6CiVC1rMqwEZBUVAIorHpVU/eT3
         svcfdDYl5Ayxc4pOXp0+XpeH/xaGDA05TpWWfCzAAGCCoeow23gUJJU8NNSA15I4ZwHv
         pQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761751191; x=1762355991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1CdmUiAXh1HKc3m/r9pA/phMrmd+nlM0IzGmsHncGb4=;
        b=bwxdzmFvy05mLv727aBxuo4PKA7UFf4ixESf8/ViW3GwSC/+Bj8DQYLT3uIAvbLtLp
         /u9zIDnRpJvtXyWn0cY3s0bmmSynB8xTPEz10gHfJQB95j8Nd3HxiNcPS1ZkVODyMdFZ
         v3HKLh7lbw7yl45ZUR49Yu10vAIuH2rheRVB2KMR3h5nYTx3eSsZRltBm+DEtrzGJ8sE
         GcGMpxOUDbKGtjBOWN9Kyr7oinoy4ZgOyDpuNb5Wup3cbMXcrrgTEDWCn3SUavaU0RK1
         6Zg6aB5ZPtWoveW9TMoIHU5NRLmoJnffQUjOtHxVhQOjBx0oZ3dDGUfUvX/1X6PtLeix
         fu+A==
X-Forwarded-Encrypted: i=1; AJvYcCV1ldvR7CNBAajIXBP6zdm3Ayyjb7S/Y6c4eZS1LzjMOEys2ZawTwZ4nIx8F6ybCZ4KVedn35nNFcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE9DqAbT9A7L7d3xu7FbbqraOotqh5pfzIaLmR8w7wAg1uvbiA
	niWMXr0gryCJ7FM5QrRVMRbLjTSxGF54MuPgpufwUxAPEtEU9zeL28YXH8lpXqgAkWJNyhwNkRM
	5ImJ8WsfM1Zs8dsPhdW6uIw8cmd340BI=
X-Gm-Gg: ASbGnct57NqYhpF+rwEOsPvvi6RnW2+WcfhE/GNUyVJlLrdXilrWQTYPHSE/dhqdd3S
	4kehXG7UR1Viv/4iTOmqkpUMYb5gRjjFkFz7HENwbbbQTJPCDMaW1lI3jywJFqJowbFje1S4pUK
	fqU0T+vBubZDipEMXS2uDpyCqppm7bTbl3C0VWHtCS2hzFHCMJGpNnfDkOnnw/FT9WNve2vUiHi
	LcvO5a8LEoYPeWqGMM/Zi4lHAhqE2d+zjlxfKsOzG48tqog0/IMjIiPA8D/Ph/0ndgOG5U=
X-Google-Smtp-Source: AGHT+IFbcnsAk75YEZiUX3rsU0b/ZmVe83k3NaOxPSYI+q4vlPOeZ92ke++maKcHRCEWJ6+8d/ixoTttE36+ff9pbFg=
X-Received: by 2002:a17:90b:1f8a:b0:33f:eca0:47c6 with SMTP id
 98e67ed59e1d1-3403a2f179cmr3475777a91.30.1761751190939; Wed, 29 Oct 2025
 08:19:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk> <20251028004614.393374-34-viro@zeniv.linux.org.uk>
In-Reply-To: <20251028004614.393374-34-viro@zeniv.linux.org.uk>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Wed, 29 Oct 2025 11:19:39 -0400
X-Gm-Features: AWmQ_bk3QGrfeacG4nKn1A56jExYpoFICsJu3Aq8X6pMLjFJYWj1N_7Lqh37COA
Message-ID: <CAEjxPJ60geP6mJsKW41Pj12tPCf-dGk=ys8vr5fEiO2tVj1Rdg@mail.gmail.com>
Subject: Re: [PATCH v2 33/50] selinuxfs: don't stash the dentry of /policy_capabilities
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, 
	brauner@kernel.org, jack@suse.cz, raven@themaw.net, miklos@szeredi.hu, 
	neil@brown.name, a.hindborg@kernel.org, linux-mm@kvack.org, 
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, kees@kernel.org, 
	rostedt@goodmis.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	paul@paul-moore.com, casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 8:48=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
>
> Don't bother to store the dentry of /policy_capabilities - it belongs
> to invariant part of tree and we only use it to populate that directory,
> so there's no reason to keep it around afterwards.
>
> Same situation as with /avc, /ss, etc.  There are two directories that
> get replaced on policy load - /class and /booleans.  These we need to
> stash (and update the pointers on policy reload); /policy_capabilities
> is not in the same boat.
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Reviewed-by: Stephen Smalley <stephen.smalley.work@gmail.com>
Tested-by: Stephen Smalley <stephen.smalley.work@gmail.com>

> ---
>  security/selinux/selinuxfs.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
> index 232e087bce3e..b39e919c27b1 100644
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
> @@ -1871,23 +1869,24 @@ static int sel_make_classes(struct selinux_policy=
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
> @@ -2071,15 +2070,13 @@ static int sel_fill_super(struct super_block *sb,=
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
> --
> 2.47.3
>
>

