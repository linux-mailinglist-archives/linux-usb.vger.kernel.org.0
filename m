Return-Path: <linux-usb+bounces-29812-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA07C17698
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 00:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B501618866AD
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 23:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804D330C34A;
	Tue, 28 Oct 2025 23:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="fnHEDd9O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E192DECC2
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 23:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761695479; cv=none; b=u2UHIYsHmgyzsy+6NkBOdBtuy2UpAX0Bfl+gGNeQfh5GCXmMPKzhZkOLcTXiEGgFiB259s546yQhAyBtJ+hXTLnGm10gQW4Qmu/AoGwpI7R3hUojAG15nr3hcV13Maj7j84ItnuAtSdFxOYYRUZeZu6M8N6IKhns6R3qNkMW3AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761695479; c=relaxed/simple;
	bh=zhqXyFTzb2t3B9Dp9QKvidvf264lh5WpAlH4hAvSPD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=orFlILrWFLh6+IhAaB3f8l8znmJfGNAGVtm0AoORrYluGb+sGfVXrtPLFmSA+lJOwBlKp9j8h0eqn4kI4qnGLsvUxUuSYXtuxOGambXW/wX6ojt+KqY095qwVlvvR3gQyNrZBfb12kCHSOrBZGKf6v6g3NOKEFfcppvgtb5wyw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=fnHEDd9O; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-27d3540a43fso70857015ad.3
        for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 16:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1761695475; x=1762300275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ss0xsZDTL1rwOqKY2yzsfuodL2zhm4Ktw8Z3rrAQsGY=;
        b=fnHEDd9OESW8jqv4smyGKFm+OqaP/L6WyQOyxmytcboxuIZmCn2d5OIjDlj4H83pbQ
         DNMSGk++elnzbqoGpEs3Y4W+aSy76QCWVvUzYJjTIm8e+POHZ9DcpC2LRXkQd5qPBP2g
         1g8lrMQBjzgUwgy2Ix8WUuVSVykKqvA0eTONevzKE4wNIUZ2IsQ/s+RvIiMp/pLyzCjO
         BsjYSxL3tJwQQgmoWHbQKIUcILsgzRPb5YTHGsLHMIp9zhbkHiGNfmD4n9T3CG5W3+el
         hvb43Zv8eBUA4zUNpTmOoJIXUE3+5YG9sb87y0t64ycC4jM8AxrEfokDiKCO6q3FDn1C
         hDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761695475; x=1762300275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ss0xsZDTL1rwOqKY2yzsfuodL2zhm4Ktw8Z3rrAQsGY=;
        b=Dn/giDWxpWc6R73EvHeDOvHSf5fXU58+/fZllwpCsE4egSQiirEXFeQMpaRTKiLAIE
         /J1ohbanr1lUxVZv2Om+/Bfuk9gqsylfaOG41G1BNmTTmYzsZMwYyyAIkXQRCjzo8f7M
         4S+dovoP5aHQODbMEXelyjCRPF/+zuDzAL7hTr/84NfpL45boem+yxUWDV2uQfOOEEts
         K1F+K00TQ/Vyl8TT4xoKNCih2j3F88u+J02gMs4zXqSyjk228x3RXvPku17wmz4XASXe
         c6278X/COjCCUJzo/lbofM2yEoQgrSm5djKyYdSHr21EhgrTDlnipeSELekbfqVuyNsz
         EHTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUduz7+zGERfvw4XdUPyEqllrEXA56GbmZXljTyThpQhMwZXDIjUh/AbXuw8vXkv3psVv9Umiwwnvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrM8KNKIHAcvwGBBVA5TCPjyn5gYhAXWMDOP51yCCQDvdukVWl
	QgqAFRGDJvzy1+nxc1hLiE/F4u7jRmCK7mCzuNV3TxW12tEDC8jwj55DSB8lTcu7uRM8sKb24Gp
	PEWT93DVc8782E+hZmBbP4+v7PsKBvk8An8t/vyZi
X-Gm-Gg: ASbGncuX01I2nbqXHsQOtP6Op60XDxZZY8osfG3juFUU5CLQ0juXiSaGXwt29U8K7bO
	a1OoEndcV/P1ntN0zKRs/VnfnfWoyis/EZzbfWjpeGJqjTLdb+GWblNeClX0EsfmzH2zcLz8glj
	P8jDApnFG+hNoxQWAuzra4WWmasxSJ8Topf4/E36GaYdKX4CUginAaNtloqgFCY30jFXtGF0vt4
	L0Lihth5Y+7ZbBI2jNATYR0CKb/nfKafC0WIXTo/ejww8/5//W8AA0BbncQ
X-Google-Smtp-Source: AGHT+IEQNyH4/UIhryBKstXm8OFaWiuLlbUq8UQcH5+4F6rsLQi06Pj91sWwNLFBJTsNKL1LL+PFGKuePdALOMKBWdA=
X-Received: by 2002:a17:903:32c1:b0:267:99bf:6724 with SMTP id
 d9443c01a7336-294deebc1a4mr13124835ad.31.1761695475463; Tue, 28 Oct 2025
 16:51:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk> <20251028004614.393374-35-viro@zeniv.linux.org.uk>
In-Reply-To: <20251028004614.393374-35-viro@zeniv.linux.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Oct 2025 19:51:04 -0400
X-Gm-Features: AWmQ_bn3uluZWrDfxLWehWBukesK9g25bn5Thq9tyHBU2hJYs5NTI3fvunVput8
Message-ID: <CAHC9VhRa011jL86779TBk8FK-pcWinLkSkQ1MoxGyyfJg5SMgA@mail.gmail.com>
Subject: Re: [PATCH v2 34/50] selinuxfs: new helper for attaching files to tree
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
> allocating dentry after the inode has been set up reduces the amount
> of boilerplate - "attach this inode under that name and this parent
> or drop inode in case of failure" simplifies quite a few places.
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>  security/selinux/selinuxfs.c | 160 +++++++++++++++--------------------
>  1 file changed, 66 insertions(+), 94 deletions(-)

Looks fine to me, thanks Al.  If for some reason the rest of the
patchset doesn't go anywhere, let me know and I can take this patch;
it seems like a nice improvement independent of the rest.

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com

