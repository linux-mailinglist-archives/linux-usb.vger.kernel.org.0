Return-Path: <linux-usb+bounces-29814-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B0629C17737
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 01:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 31BAA34D0A2
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 00:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BA92836F;
	Wed, 29 Oct 2025 00:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="S7z0WXf1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3085A10957
	for <linux-usb@vger.kernel.org>; Wed, 29 Oct 2025 00:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761696173; cv=none; b=jMiPb99DP8wVuo6n8aVju8Xk73jCtRrJiy2mS0gzSdFBTgd6xrSiP6AXD36V6BGMwS8iGUtZDfMoNwjDCQkD09bzfrz3WQgzCyiYrGUF9WVtqytFzA591SYuvCixrXi4L9g+3sUq3FwLtnMXzhuf96ApWWxCr5WlEw24XQ3sV8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761696173; c=relaxed/simple;
	bh=m1Iz4iCevIOErVXwxDtpkzo89S0mMIU4Qz1L+Q2VZzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HyORRbbZidBkAmQQJLlApW4QE7PMIE0Cc02beqtszX96P6ejkBXn2fcJhMVJTy0YnCssLb1DfVmoze1IGCyiAIHsK24UGm3mYcjNoYeb72kSrapn6bGROYORf8+54PBvqtnOEgp8ztyRwXFFUxbpTbZ6AuR1mw7SHmjgcjcVFjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=S7z0WXf1; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-33e0008d3b3so6677553a91.3
        for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 17:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1761696171; x=1762300971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xF6B/bGLrhNZetGrqx7q4mvUW1pHQ5FZufaW6F5zkk4=;
        b=S7z0WXf1paaNc94V/GoD6ihSFN1Fwz04q7/Bri/+2oQeytuQmLCDloKQj8RU8eRhob
         W+JIcgOCBpcWOanj37Y08dd8z7xNqHXU4eAf3a19dxRyCE6rp2OJV8FULItqQFbj7hxe
         p0kN/hysrr7k/QG3QOwjg/WTEL52y8QwFNk7I+KpRoZlzWswY5ZEy5vZ33tGpzOcoNzv
         uW6T/orZamFJhQp3VN1rEvTRZ2wqjFckPNbYzq2F4++bYXGN3fqfDXPSEYwoSW3HiLRC
         fP9mrS/F1haqQvM1s3+wAsCmdDpj3kBfxV+18ift678WTks52jnGoOj5Uvfdx1W2KPOu
         kKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761696171; x=1762300971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xF6B/bGLrhNZetGrqx7q4mvUW1pHQ5FZufaW6F5zkk4=;
        b=bG3wuIJpZhco1XRXf9RtqGu1FKQBRib9dKUSEpMDKgc4vECpth3k5kMUW+p8cknYcW
         2jq80O7w1t+bAbadpPQH8mB65wPXv+dL64qaKlMQXJQodcBQpJIABcsbAoGiIKRJCTJv
         XSjLtl9okI8F1viAlR0grBRs+FAoCzvf4w5X8OI5PNRLvK38mpUi/gi3NyLkQ6zExLbg
         +pfq2Z/Crkh6BQh2MVTD6G98MaLqbcDQkUR9tGy8nFwGZ9YrIEVQTSrtcOFxP/33PSIq
         a0wQaAMDuYX9seezRP8Wq7JDTftQVtJe6jU8THAMOK3lS4xcJlS8wzJTEXwMCPaZ4xrk
         vVlw==
X-Forwarded-Encrypted: i=1; AJvYcCVFY/rx9hTGQgQVvnaDKKeJRvtUjBXqNKvCUWjiiKCaT83YbMryKzrTQSKZXVy+DHOh+PGFABecD6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcIn5VbyKuGVziSKHQmco7Xb24Sbrm1axAdi1OhjIu6sCFWQmG
	7hdPZYyULQFrYhiXG4cWK+zlSJoL75DA1pvUmUeqhUk5b9HhovwnZ0/TNOWTyAXrzx0PYQyDNmD
	CddLvbrbqN3ddBnD+3cGwcvFkPflCih6vczfZXt44
X-Gm-Gg: ASbGncuOuqh8VFRw6Faum8sBDU5G20CMSiwrAa6Lbc8jrfTr/6sSQ3lab8NvnySEf6Q
	ZgtlnMi/2sbgupOd/KIlfy1Br/2ozZf4SFqx7OXXE7utQJCVvr8wAvrhR7FC5+paZ8JqRSh5BtT
	feAQ8iQFduLW3xk6ia5EmqVcejsbC8KrXUuwZAlgAAeQR7DQNy5AHWVHZXuhLXjWy1GkCF+T9l9
	e+6VZfdwcwvnbP0mwQebriI6Loy3QNY2F+5ozKARiHnCfHNB9125OY5+9Q1
X-Google-Smtp-Source: AGHT+IF4NZKo/CMR1Xvo4aqvxCL2dK2Kp/y68pib/yspEfnhKPr97BsNeUO4lrcXad0luDAxu81WWX06Cn/QvKa01OM=
X-Received: by 2002:a17:90b:54c6:b0:33f:ebeb:d7ef with SMTP id
 98e67ed59e1d1-3403a2a420cmr1024634a91.35.1761696171255; Tue, 28 Oct 2025
 17:02:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk> <20251028004614.393374-36-viro@zeniv.linux.org.uk>
In-Reply-To: <20251028004614.393374-36-viro@zeniv.linux.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Oct 2025 20:02:39 -0400
X-Gm-Features: AWmQ_bmmcbrTxQbk2K0S9dnAz964E4djBpHBaC2BLyDDdj2u6ZdL3nJ0xadT9U0
Message-ID: <CAHC9VhRQNmPZ3Sz496WPgQp-OkijiF7GgmHuR+=Kn3qBE6nj6Q@mail.gmail.com>
Subject: Re: [PATCH v2 35/50] convert selinuxfs
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, 
	brauner@kernel.org, jack@suse.cz, raven@themaw.net, miklos@szeredi.hu, 
	neil@brown.name, a.hindborg@kernel.org, linux-mm@kvack.org, 
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, kees@kernel.org, 
	rostedt@goodmis.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 8:46=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
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
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>  security/selinux/selinuxfs.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
> index f088776dbbd3..eae565358db4 100644
> --- a/security/selinux/selinuxfs.c
> +++ b/security/selinux/selinuxfs.c
> @@ -1205,7 +1205,8 @@ static struct dentry *sel_attach(struct dentry *par=
ent, const char *name,
>                 iput(inode);
>                 return ERR_PTR(-ENOMEM);
>         }
> -       d_add(dentry, inode);
> +       d_make_persistent(dentry, inode);
> +       dput(dentry);
>         return dentry;
>  }
>
> @@ -1934,10 +1935,11 @@ static struct dentry *sel_make_swapover_dir(struc=
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
>
>  #define NULL_FILE_NAME "null"
> @@ -2080,7 +2082,7 @@ static int sel_init_fs_context(struct fs_context *f=
c)
>  static void sel_kill_sb(struct super_block *sb)
>  {
>         selinux_fs_info_free(sb);
> -       kill_litter_super(sb);
> +       kill_anon_super(sb);
>  }

I suppose the kill_litter_super()->kill_anon_super() should probably
be pulled out into another patch as it's not really related to the
d_make_persistent() change, but otherwise this looks okay to me
(assuming I followed the DCACHE_PERSISTENT changes correctly).

Acked-by: Paul Moore <paul@paul-moore.com>

--
paul-moore.com

