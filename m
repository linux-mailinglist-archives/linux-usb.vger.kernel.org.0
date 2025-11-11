Return-Path: <linux-usb+bounces-30404-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D424FC4D165
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 11:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 744E23BB140
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 10:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7B234D90B;
	Tue, 11 Nov 2025 10:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="q4HHA45X"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15EA34D4D6
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 10:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857006; cv=none; b=cLd7+Zcdl3lXqsPZjalHchQu0qvT89PFjubK9zcchLCUe5GKw2YI+X6OUcWe/yBtI4NgWLPPc/stumdVn/aQDS5qmg0A3/TN/jVco44uJpCf74aTbr7bwXabYnsUxuL3O25eB24jqCAwPOTElYB72hLe0/QrtMC/fd5CPJ1qRHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857006; c=relaxed/simple;
	bh=ErpvLu+msmOQH+DLoUzEraHYQEPe7HwAu5dxR8qbtAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rpcggl86yhfzmdRy2i++wUvgDOEJ6CC3BkwpclEJD4xiqVLY+TYZdPRZho+KRbi6FF6Bsxzyq+y3Qx4H+lTS0hNd3OJ8cTHB1RbNT9f7hZlTm0TPfKs4CJX7KGwvJvVQDvRFRBAPpo0Kifz2Dryt2CESF1bJPHGoequYtgv2RfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=q4HHA45X; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4e88cacc5d9so33820211cf.0
        for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 02:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1762857004; x=1763461804; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ErpvLu+msmOQH+DLoUzEraHYQEPe7HwAu5dxR8qbtAo=;
        b=q4HHA45Xx0xTDskll4DjSU6SWhWolRSlpTtA8cDnYPTI/9mbRIiB52rjVByj7Xz8ay
         nFP0//QDDttEQdXDUPTQYuhtZxg4E9Z6etcMAQhjvLkWtzN7d8du6hlQT4fTRYhV57g2
         fSGQ47hY+Biwn3/0+lGUjV8ol/iJevVJFrQy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857004; x=1763461804;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErpvLu+msmOQH+DLoUzEraHYQEPe7HwAu5dxR8qbtAo=;
        b=TLU3cGv3GU2L6QX7aiYsOwBNpITFBnqnUjVrY96KMV3i+aVbNmBc9VQp4RcIFDecUl
         lGlanqAyOY+8ccrhC7AJKM7lIxdcZXEKaCtME3Rh2tJRkX6dHCINQkT7ClOrFRHlPIBE
         IpwlGk8eSLl7VAGYJDHQY0vG04qp7JZLqdKni4VEs+NGBBQc1mWzNw9yctmGVZe2ingD
         tGDYSHwT6oPkNe6K6r0CpTS4e0Eo8MeSFR4ovmI5uUqi4YJ9KpNpXmExJKJ4aQ9qgMIc
         Lmai46pDCuvhTttJ4usmHww85imsecx8yh3AkBEBj/idORdrDDCy8YIDy/cHOHy3RhMT
         sH/A==
X-Forwarded-Encrypted: i=1; AJvYcCWvsfAdWTazT0xKzI2nCH7UYJG5lRFc7zZbk9aIE2xhngpUgRj3pK68UE46FUNsR8pvbNNreRL+ng4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgsbRovQ9O8j4Z/AovJcWwXgIoZEmHH1NQb8M1WJZket4kbL1h
	Yf9Ib5YSPaQYPrLGB77qAmWhATwaOj7dzMIRg2qYhKn0Id8GogfGsaJ1egrDwOrJB69OXi4irFZ
	S+sdCBpUh28wQ/7uKg+7cly8r/0YvShGjVbYop9kuOQ==
X-Gm-Gg: ASbGnctYrV0xZGqCO0I4Z4Zodx9UY+Uv64r+D3y0I9X71xGnJm0CGabmI60BPP+rTKc
	yhc9khf8ituftAEhnSknsP28ok2LLipI/tDRTtvRsp/MYURqooJ8Hox696sj0JZDWrmbr2AFAG1
	RtU0alMxWcdFxbyo8V+iWo+9S6JZJUjMSKXzSqEWpSC4an842wHZmdJkP36+g4V0TlnPXktJ4cj
	ChOFpgRZUtyrylHWYpT8KgFb64FCcLo3zFDmQEgVB+M/GK9vqvx9fa33xCgTzhwLHa3Vw==
X-Google-Smtp-Source: AGHT+IG1vPc79jE1NxMTWUcAkMOFXJ1dO7xwNLHncVzXeQGMi6M4ZcaWG7wZ9Wn4xgn8RqaQcm4UKxcrnMz8XFw/71I=
X-Received: by 2002:ac8:7d8b:0:b0:4ed:b378:145d with SMTP id
 d75a77b69052e-4edb3781c5fmr87056701cf.45.1762857003684; Tue, 11 Nov 2025
 02:30:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111065520.2847791-1-viro@zeniv.linux.org.uk> <20251111065520.2847791-4-viro@zeniv.linux.org.uk>
In-Reply-To: <20251111065520.2847791-4-viro@zeniv.linux.org.uk>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 11 Nov 2025 11:29:52 +0100
X-Gm-Features: AWmQ_bnbS5BGnOdlDcNli2J3_mWe2QdNv2AalQvWZZg8jjhCbQzLKZqYiVdFPQQ
Message-ID: <CAJfpegv5eZK=70GEdbofg8u-CKS7gL6Ur5PD86Ay4h3Z8D986A@mail.gmail.com>
Subject: Re: [PATCH v3 03/50] new helper: simple_remove_by_name()
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, 
	brauner@kernel.org, jack@suse.cz, raven@themaw.net, neil@brown.name, 
	a.hindborg@kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, kees@kernel.org, rostedt@goodmis.org, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, paul@paul-moore.com, 
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Nov 2025 at 07:55, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> simple_recursive_removal(), but instead of victim dentry it takes
> parent + name.
>
> Used to be open-coded in fs/fuse/control.c, but there's no need to expose
> the guts of that thing there and there are other potential users, so
> let's lift it into libfs...
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Acked-by: Miklos Szeredi <mszeredi@redhat.com>

