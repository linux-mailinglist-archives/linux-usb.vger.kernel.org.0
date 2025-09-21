Return-Path: <linux-usb+bounces-28422-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43014B8E591
	for <lists+linux-usb@lfdr.de>; Sun, 21 Sep 2025 22:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F329B3B87F3
	for <lists+linux-usb@lfdr.de>; Sun, 21 Sep 2025 20:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A896E296BBC;
	Sun, 21 Sep 2025 20:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="OtBllW88"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E841F4E59
	for <linux-usb@vger.kernel.org>; Sun, 21 Sep 2025 20:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758487483; cv=none; b=fq4OylrmZbp5hHetR21EEjUdan0UJtrGyqRREysU+PDoypqlFQvlj083ZlM1EG3F7e4R3pUuEhxmIN/pXMKt664vNm3BFmE322D8FmGd0OJqa/BPv0haq1+5LwBt+CySDtCT0QQ9qegbYQKFoa6pWCRDBvZ3QwW7ptQrgMH8sYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758487483; c=relaxed/simple;
	bh=Wxk78sm4WTiUf+x56XODeSTjFI7Tre8+DrBZx8G9zJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YrMcaNa21LvbCIN0E1DJUqDQLy+gzhjZ3izNMCFPQwKNCODfyCZ2UIRXjJWUUZanq+mJxC30Rhpy2DJp+rx4gPkP6lDzVUKA6WL0DhT/mXK5SEMQIUJS+d30kNOdLrker5CwwYHb62dxfQ3IcAFL9cCxcukOqnA8pY4hcnMzaU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=OtBllW88; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b55517e74e3so134662a12.2
        for <linux-usb@vger.kernel.org>; Sun, 21 Sep 2025 13:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1758487480; x=1759092280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrp1vYn8+/NUY8DL+Z+wSSTE0867IgQjPinmMLmeavI=;
        b=OtBllW88bWT+5JkhPGe2I4Ealc/+3vv6WTMYI1NmxEUxtus19pQzylFJ/abVB+Q+Im
         Nwy4r6FNVd898GqFEkqfoxFknGjjbzfq6aYvv4059euZdYkPw4P1lM7jdZM8r82Wy83V
         L/qZZ/oAOW8T0N5Prn6DC09yvSQmnBK8RyMqyqompmrD0RKLNyda1NH34aCTcKuDe2Va
         vkxShCUOm9t4hWjLS4PvZIcrQ/w7H4Q8fdaGC38MRU6WML0KUIhGLKTAxKr0zHGfJ3wb
         YTY1Ncf0NdvU+2CKahpOZ1322UKBjUAYB9E05g4WDqIA8gmv4d1pY6iPAMEgohHdNowx
         0IGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758487480; x=1759092280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrp1vYn8+/NUY8DL+Z+wSSTE0867IgQjPinmMLmeavI=;
        b=S45PoPYoy5qBWjRrduwKfd8ZnwX20AADz9g9ZI4j1l3Xf9aZLEBwqR/fbDRnA5ID5I
         MD8m1o5AkXxh2x3UdEBNJkEJ1fq7LYX5AU/iHeaGCth80U7JUkFb/YH4hEIigSJ6Fi9s
         Q/HxLmy0pZuv4EdjxRSqAFlJutPRw+er05iAqv/oWOXk6lpzz4YZ1s22P0bj8h82LuZE
         HyQKJ3CV9ajKf70YW0U8aU28qoxqLi7MS6uDq/wSgF7+PO8mqQSQi0eWxtYUmy+JCd/F
         bvtgL82FF/DvTPjGgDhc3+gk6YHCaNG7Z7JHu5LHyIplHMLrBdaFrkgbPlrxwWyJ81Bd
         X27A==
X-Forwarded-Encrypted: i=1; AJvYcCXC6I7g70WIiVxsHjei1yLK1eQCXSJHP0NVEG5poYr6wtMEssR9pFfQw4cN95KWeMZ2BIxWbIj4E0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYJuM/jj2jo2yGPd/oHulxPLUK7vCkbxErFnwIkEvklWwhECYf
	1xDpTAjIN5REG5VPda61SnS8x60k1d3VPxQPmEV/l22+je95uviCMsCXQPiMZgCP0ME6+qY9RAD
	0JSItEdu5tUnYmn0PFzWaAV8qPgHdc5xUgkTvB3Qa
X-Gm-Gg: ASbGncv5as2Tl+6yWaHRrhVX5F/4sYckq0B8VogU/os/O1bFMFY9Jj8RlD+P7h6o25d
	A6th05Asl9+y1bct0+nit/ddO4y6SLGyaOY2We2d0N858bgoIQ7pNRrWCOOWx1JWduz8bl3iPRG
	Lg9twv8uJE2JwnZyX6uhDchIL6jgWrXL+Llin4goxh9cWWKImAEX/RfcGQ/fJ0I6VuYY2hswRk4
	tqsHNw=
X-Google-Smtp-Source: AGHT+IHAbyCRLo/SSuvdFEQRy5JpOpl0NDRXzF/3drghYuhCInE4K6vDNKt06XHhxx3gZXaSMmGzjnpjA/kIMwyAfV0=
X-Received: by 2002:a17:90b:3c06:b0:32d:17ce:49d5 with SMTP id
 98e67ed59e1d1-33098245d63mr11380894a91.23.1758487480037; Sun, 21 Sep 2025
 13:44:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250920074156.GK39973@ZenIV> <20250920074759.3564072-1-viro@zeniv.linux.org.uk>
 <20250920074759.3564072-31-viro@zeniv.linux.org.uk>
In-Reply-To: <20250920074759.3564072-31-viro@zeniv.linux.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 21 Sep 2025 16:44:28 -0400
X-Gm-Features: AS18NWAIN9lhY1WlDGBZGFYNywlyC9vJx6yZK1w_BS23ADZS6YvZADa5RlquZNs
Message-ID: <CAHC9VhTRsQtncKx4bkbkSqVXpZyQLHbvKkcaVO-ss21Fq36r+Q@mail.gmail.com>
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

On Sat, Sep 20, 2025 at 3:48=E2=80=AFAM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
>
> Tree has invariant part + two subtrees that get replaced upon each
> policy load.  Invariant parts stay for the lifetime of filesystem,
> these two subdirs - from policy load to policy load (serialized
> on lock_rename(root, ...)).
>
> All object creations are via d_alloc_name()+d_add() inside selinuxfs,
> all removals are via simple_recursive_removal().
>
> Turn those d_add() into d_make_persistent()+dput() and that's mostly it.
> Don't bother to store the dentry of /policy_capabilities - it belongs
> to invariant part of tree and we only use it to populate that directory,
> so there's no reason to keep it around afterwards.

Minor comment on that below, as well as a comment style nitpick, but
overall no major concerns from me.

Acked-by: Paul Moore <paul@paul-moore.com>

> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>  security/selinux/selinuxfs.c | 52 +++++++++++++++++++++---------------
>  1 file changed, 30 insertions(+), 22 deletions(-)

...

> diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
> index 9aa1d03ab612..dc1bb49664f2 100644
> --- a/security/selinux/selinuxfs.c
> +++ b/security/selinux/selinuxfs.c
> @@ -1966,10 +1973,11 @@ static struct dentry *sel_make_swapover_dir(struc=
t super_block *sb,
>         /* directory inodes start off with i_nlink =3D=3D 2 (for "." entr=
y) */
>         inc_nlink(inode);
>         inode_lock(sb->s_root->d_inode);
> -       d_add(dentry, inode);
> +       d_make_persistent(dentry, inode);
>         inc_nlink(sb->s_root->d_inode);
>         inode_unlock(sb->s_root->d_inode);
> -       return dentry;
> +       dput(dentry);
> +       return dentry;  // borrowed
>  }

Prefer C style comments on their own line:

  dput(dentry);
  /* borrowed dentry */
  return dentry;

> @@ -2079,15 +2088,14 @@ static int sel_fill_super(struct super_block *sb,=
 struct fs_context *fc)
>                 goto err;
>         }
>
> -       fsi->policycap_dir =3D sel_make_dir(sb->s_root, POLICYCAP_DIR_NAM=
E,
> +       dentry =3D sel_make_dir(sb->s_root, POLICYCAP_DIR_NAME,
>                                           &fsi->last_ino);

I'd probably keep fsi->policycap_dir in this patch simply to limit the
scope of this patch to just the DCACHE_PERSISTENT related changes, but
I'm not going to make a big fuss about that.

> -       if (IS_ERR(fsi->policycap_dir)) {
> -               ret =3D PTR_ERR(fsi->policycap_dir);
> -               fsi->policycap_dir =3D NULL;
> +       if (IS_ERR(dentry)) {
> +               ret =3D PTR_ERR(dentry);
>                 goto err;
>         }
>
> -       ret =3D sel_make_policycap(fsi);
> +       ret =3D sel_make_policycap(fsi, dentry);
>         if (ret) {
>                 pr_err("SELinux: failed to load policy capabilities\n");
>                 goto err;

--=20
paul-moore.com

