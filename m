Return-Path: <linux-usb+bounces-29813-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3DFC17713
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 00:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60E8D4050D8
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 23:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F96534F47B;
	Tue, 28 Oct 2025 23:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="b5mm2fmB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41D032ABFA
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 23:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761695936; cv=none; b=pM/glYmnmmK5F1+qLLJB91td3gnJosHkieBjmr7wu0htrKQ/Kz57xp93b1PB1RYSpQ5Eej14v24GKWrC1/ehF/Jfa4n0WQLCX3jWiwT9tRLBpD97dLNSH0w2cn3UHDdan+HVNkPxc9mC87Q+tIwf0kuPoT0bji25JRbNndvk5ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761695936; c=relaxed/simple;
	bh=kk8zkzm83REChxkZSsstjBUXBS7wFfE2QPwc7AaZrqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4aiTSK2qzhLZQGaU4pZ3muCWFCIw1GkgQzNr3VqtD0bYk2HILwQwJsmwFDVdyvX695Hi+KXu+2vD1ccWPCq8OJU42JOFjzNulUrRm5Jt9bldKW2xDomZpS0K6QABOpje3WOAKCNDNMoItbRYxREnl0C/RnAs1SJWK1KYvbeP9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=b5mm2fmB; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-63c0c9a408aso10695171a12.3
        for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 16:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1761695933; x=1762300733; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WE4n4TCb18hPsMXmSS/+ET4xqQfmAur/mQUYq6ibGY=;
        b=b5mm2fmB9zTSMmFv4iKcb4cYmBOnPB/Zy4oRNHUHZ2iikAuKggazvFoh6D8vH5ZaA9
         DhmA+LKcnFO/ZrtWv+2TA34YvpTl7erhnFKoSbM2HAtVpRNrZuJyEJhtkWIlZY9GLHks
         +/MXfaI5oLqKh5dze2y6Rt0r5nN8ipVqo9HD3i/WJISxOx+NS6+V0zoCuTSi9yCJkwlh
         lqEpqob3fsMnFyMfsJoSfvvOBZDCMfGFjBNH6d4vTByQp0KRH60bi9LyW2aLznonIwV+
         XUn44AEioKOrWDBMX7EER2Pxhi4Hytd2/q/OVHWxKd1TUG2EPGrQA6fIBm6xvgqMNQor
         I30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761695933; x=1762300733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WE4n4TCb18hPsMXmSS/+ET4xqQfmAur/mQUYq6ibGY=;
        b=M6qgX/1O7xEsyIT6DZWfgnCCZ44IyiVB5+/5WG+4ddAjon1ZlEfDMrtfMINd7NhUgL
         k/Voy6p5h1+Uxzdghfy2x2oOXqDwGtBmKo0bRFeT61zu6b0aNpiT7zCEzd1hseTd1ww/
         L6lEDR0J3ieO/L1qxy4mc/9lTGFsKbhA+K5jj2b/LCic+GCZ6yx0RK0RDKcuTYgk6TZ1
         JxIpTV7YmLcJZYDoj8nJi0kWK0COYcE9T/Ojx6VxH5xf2yOVw3Q4nKz53+dclbY+ZfO0
         USQwqoz29y+4PswsntNeuZNfyzufzMmWW3Lgxi2ToHDYtnYiUHYd+x1+k3dR4anH/uWY
         ldow==
X-Forwarded-Encrypted: i=1; AJvYcCWqPezDL++TX1Ep1nyPBxVmvBlgs/CDMQS9wYmVHNFlR6E+75WV2rqh1cRITqGgLTytduPoLFFMwY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPae3RbMFGx+FZLfICJevcWJSQQ57s2n5Do+xvquhNwXOBFxQm
	2CJvisk1JeZmrnYpYPCxQjyf44QMMKTy2rrWo+BL10heji54ArSvmaRQyyoNaiSvaWzmMttlSo/
	AF3ZQo5RgyBtZ9fQb0JnRzwyQ31oPvl8NdZ1h/Dcz
X-Gm-Gg: ASbGncuz7l2fZCWspmiH/dp4yELwxUQij3AW0wNXdKqe1Qv3vRhA05gXNBrnSJT5PwO
	40MjMcqx3/GWt0NTEKns2ixmiZ1nJwQUiOgxVUFb53GgQNSbVzGq79ZHRgmiXnJWQtzdTdi7YNG
	oMVn5SmpkjCOuTxW9mfZ6k0gOZOPlFTxbgdBUkHvXyYzB+5UWe2IUuYOLUZjfrJP8HY51nosZN4
	C1+R64gxl1V/yZDmFCCqjxspL6kyaFH1dmTsp7pc4OISAyUoVThmDUih3wG
X-Google-Smtp-Source: AGHT+IHvIzFCAVsIe9KLnMzhe7HeHw161tWjaGF8dq9LK8mHTJ5LNBNsg03z1RN2kv4hUoIzYntUB79AzDiL37F2WAo=
X-Received: by 2002:a05:6402:50d0:b0:638:74dc:cf78 with SMTP id
 4fb4d7f45d1cf-64044380bd9mr816143a12.34.1761695932545; Tue, 28 Oct 2025
 16:58:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk> <20251028004614.393374-11-viro@zeniv.linux.org.uk>
In-Reply-To: <20251028004614.393374-11-viro@zeniv.linux.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Oct 2025 19:58:33 -0400
X-Gm-Features: AWmQ_bnbOFuYYw7q6A3vKx1W9tiGVviHbdGsSFCW7Z6eJ8jFBd6mwoz2mbQdJG4
Message-ID: <CAHC9VhR4nO+TanWwz4R-RQijy9h5B2h6HuBDXxBNp0+kAE4Asw@mail.gmail.com>
Subject: Re: [PATCH v2 10/50] configfs, securityfs: kill_litter_super() not needed
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
> These are guaranteed to be empty by the time they are shut down;
> both are single-instance and there is an internal mount maintained
> for as long as there is any contents.
>
> Both have that internal mount pinned by every object in root.
>
> In other words, kill_litter_super() boils down to kill_anon_super()
> for those.
>
> Reviewed-by: Joel Becker <jlbec@evilplan.org>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>  fs/configfs/mount.c | 2 +-
>  security/inode.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Acked-by: Paul Moore <paul@paul-moore> (LSM)

--=20
paul-moore.com

