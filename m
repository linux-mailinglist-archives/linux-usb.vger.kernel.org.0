Return-Path: <linux-usb+bounces-29817-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5734C177C1
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 01:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B76A1C80A28
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 00:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7986E1DEFE8;
	Wed, 29 Oct 2025 00:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="evHEHdUk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECDF1DE4F6
	for <linux-usb@vger.kernel.org>; Wed, 29 Oct 2025 00:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761696644; cv=none; b=L0r016eY5ihYl894kUI95PKkvMFtMS+PWQnU3tsSC8AbAYT/1zAwvwdaEoLtxFloUfaCMh1LawUmvNcqLm37dK2uw9HEi+yZ5v0EBCo29REIN5uaEChYfUBQBsVjm1Q8dePMa9x6HcshNwNou4pYC92XO97Jdsq8YKDIROumikI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761696644; c=relaxed/simple;
	bh=QloRiWksfwupmAUdBgNLV/svbMoFmzJRlSMrdXPaxnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QyT/7SHJV04G2G87wbYgDbF3XaMTR+sPIP6koTuT4WLz6IrU5Dhcg5R5eKs+xHb/4zREL+ncvDGic/WDvzGF+6u49Ng2azr6LX6PE88qaY7PuHyRoQxs1rL2PBzaVKLZ+l2NUrOM12KsRpGpHMsbJPNoJFDh9GX3cDL9x8uVDJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=evHEHdUk; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-33db8fde85cso6786466a91.0
        for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 17:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1761696642; x=1762301442; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAeYT3sIf5J+urxpWRZdGCYWbbcmjWbjfXki2vhXqBo=;
        b=evHEHdUkGc41clD3/HvS6TCsRDFkA9q6MEZ+Ee8ikmU90EW0nwK1uXakOJknKdIEYw
         UPOMfeEvBNhKrHjLjHr7xIYCpdId2KHIvvTrAsza0xQeogPNi8UwwvqaI96FT8ITZ8vQ
         uzFC0R7kneeJXGfF8/cqcxLa3ozJQN2E70B69L9NShTl9bB++pcLxc0q3bhCZ6JHhbk2
         c7LXeRcZcT65SzKjp7o+Ph+jEW+BDN8aORwZ2Q6/pPfvCmUIvEEXu+nEyBOVi1hFu8Rr
         SUBY5Gz0grZxmej8kpSYf3nSsLE60De2XMA1fzyVirRng1clt1tCPFYnLsbjXnIXjkwS
         8jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761696642; x=1762301442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAeYT3sIf5J+urxpWRZdGCYWbbcmjWbjfXki2vhXqBo=;
        b=J8csa+kxYP/9FI/AT+Vw4DKOCVHNArX6+ws+yoSOPZvnzfTCE1pTUc1VKCIxCt4Cqz
         IU9+fuuPaCfpOYF0swkSh8fwz204Rp/Q92QYCq+KuRxMtHHoQ+5ls4Jv+daPDiFdRP3w
         pMIKdN2aUTUEYXcKisnV/tOI1qu8MA5alnkhbuVHCf2BmiPE6IoK3W/SZ58EbCLJO1lo
         0Sy6xNlZEss71RDVE3///nqshT85I6PKZ81F1a+xQrBHQiSj4zeOeXYt4bQwpsbNXFmC
         +Nt/NKiDGvpD24IcML/hkoQD7XV7d6CGOZswwzvDeflbTQwbR42Qx8K6jTeULVJzXx68
         GxIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhr50+P0XfrX17kGgCf829OTFzmSerHRVZO9lOnOm0f8FR+NKUVn7Vd5XPlIJbrUh36skxB0V8L4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxobDARsPxuWYR2X/RfYjz56w8R43mNJGWsd2RtXBfGNv6MQ2qO
	+0WY/S58DTUHK++yM28RTe+3rCRnLIoC7OJzCVUINyAXstzWNPRuvkAXNR8sLxPhKWXJFCpTp+G
	GXY8Bgiz6YaXrGz1isMUsct1eD5PnS7ib+asp1pXO
X-Gm-Gg: ASbGncuH2NPvkv02TDXG1W8kjzBguUncrlcCuRpLIz7d+bILQcviaa3rgA1HgO7B9dt
	CgvOOZnNiBDYFftiSJd0gisFcJ2Fsas54ktZV4fDAuVSi2Mwucw2Oheyls1WzizQYDY3uImh9YF
	r4HXzAdsy5OeEcssTsKHQvCAFvgkuas33fIV3UomX2/lAD6coeyHszCyuHlYSRM/mn6/xbPWA7H
	suLVZVBTXXJYvNjb6cTyvbK5NUMv6FgM/Dah1y41WQzGYGVx8UKDWWUrjIg
X-Google-Smtp-Source: AGHT+IGhjs8q4GiygXwr6DCqhQXMqWhNs5oaPfnq5KAn4id0agHe+xmdqRLWlZPNOFZ/N+dUgAnaM8QQHq+RXzkh3rE=
X-Received: by 2002:a17:90b:4c8c:b0:32e:d600:4fdb with SMTP id
 98e67ed59e1d1-3403a2a1014mr987268a91.18.1761696641654; Tue, 28 Oct 2025
 17:10:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk> <20251028004614.393374-49-viro@zeniv.linux.org.uk>
In-Reply-To: <20251028004614.393374-49-viro@zeniv.linux.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Oct 2025 20:10:29 -0400
X-Gm-Features: AWmQ_bnyVa46lrJnSEC4p7b8a6-fhgKBPo6xvMl8XVNnPJL6uMjYjs2dxSO45Ps
Message-ID: <CAHC9VhRX6kqFbbKuOoKOLLve6c+7TN3=fXHrtXyj=osfNYd+2A@mail.gmail.com>
Subject: Re: [PATCH v2 48/50] convert securityfs
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
> securityfs uses simple_recursive_removal(), but does not bother to mark
> dentries persistent.  This is the only place where it still happens; get
> rid of that irregularity.
>
> * use simple_{start,done}_creating() and d_make_persitent(); kill_litter_=
super()
> use was already gone, since we empty the filesystem instance before it ge=
ts
> shut down.
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>  security/inode.c | 33 ++++++++++++---------------------
>  1 file changed, 12 insertions(+), 21 deletions(-)

Much cleaner now.

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com

