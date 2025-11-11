Return-Path: <linux-usb+bounces-30402-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC71C4D0CE
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 11:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C90244F64BF
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 10:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD9334AB1C;
	Tue, 11 Nov 2025 10:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Cxh7bLzT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5972FDC20
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 10:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762856575; cv=none; b=O5jWzb3zuxRS0Ty8wE2xiTxaAp7sHV1LYCUWiO3hEw26liuy3fhQdzgxPGJ+qyr4F1jrIUkAd866TI4e+ny4jCpLB9+Chgbrwna/ZcamQab8ej6ClO89l7Q3DswjawSddkHHenwsoO9tSYAlh/v8aAEHfDoPyM/+MjJ1KqN/Tco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762856575; c=relaxed/simple;
	bh=JrxCJS6doR540ni5O4K+fTfT2J1vhfEKtnYrNkU/J6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eYpFhwQ1pBoZb6eZgA1cxrOY3Ldi21V//UcoLn4BKEgB/5iBWbrePl5Si3wZulzFv4Ewf11qa5u5paLog8ftcmL0vaIqR+XevVjhpoKberQ8ZLM9gTzJYXdYNApMYFxKW/YIOdRNVZq03e18Qd8qCeWnnd7R5WrOTuyp2T3cn3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Cxh7bLzT; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4edb2eef810so32516021cf.0
        for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 02:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1762856571; x=1763461371; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gr4TOuugTT1EseGcVB5iZB82tbqvLcivaLR74+txrKo=;
        b=Cxh7bLzTrr9BQePvVGjJ40vDC0NZ2fTThVB7BYFO3Iak6qyEFFlUvplymWg0joF7Q3
         HVvSugfkZBwk1iaxvYjWFo+NLRPZYh1e5zW3LFB3CpoBIX+SjOYunRJ+TM2+q8sIqGZU
         epcQ5oRizTN8F+VsWK6pLYxh6lReG0wjdPWAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762856571; x=1763461371;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr4TOuugTT1EseGcVB5iZB82tbqvLcivaLR74+txrKo=;
        b=J6LGGBJ8oT302op1McC/Vx+WZEEdblkMa8j1rkpJqOBsd7HM3TWo3H8UZFhxInL7L7
         FkDZfYP26mKb7/+7JKHK+WSU1m/NqMBFNl9wtSECWNpeU2eWyJlWqUlZmVl0DFYmHOnK
         vlShEdbQZ/p503L993DcLzn+E/pnbOt8Y1QfzOVOkruPSY84OMep1gj+GoHLrIZpZzKT
         35Rgv1NcFUNkvqBgFL/2HyInD93ErX+tBdru3sLmXV6i0iCzco1wuPXZ3nGDq5iryu6O
         fVYL2UsbH/NJ2Z/k04xvfnFatYSvjG52Z4Sr61kWBZpfryQaBajGj6W0IWTremOJDv/1
         h32Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4DJdQ0shjBXD2RbdfUATILSzkxe4PdA2Gbk9ylbXeRnNTyMq+0+0IoNtgTF4293hrdp7LmvzwyFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEiBuy7+U6bcZ+XKhIMaGuwtCmN1aQuiT1JaK6wlbOkMFY5dMY
	W5qJb0uz3ewhInn3z1eCzrJSeMI42Ryw+0hRYPd8hOMXozF3Beb4v1Gz3guyLvFaD4flSZf1LCB
	BkUc6bHEiwitPF+/EnYs5yNalIaAdfOd6i0QCeKm5ew==
X-Gm-Gg: ASbGnctbIUIdL2WRZCN1faL/6rQHKC4zSSOjVGQT9hLbKpq6ylEE6lLhBEOTUMHBZg4
	/geV50BRIUVarU/4m3vxvED5oKTSj4SZC5rH6Z9mlWw5SpT+LmHBeNwnhFvQaOw/O5TJs6Smxaz
	Kf49zg1TicPnuS6jvPGG4yLVS4FDjfJX9VNmVRpbri7uxaks2yFuFJTgjd25TUNkyiyVUAUyta0
	8ggCk2cUrZyesc64FkTkr7ev3b19WIURpzJM3hh+GnEoUB97MDb40Qbc2g=
X-Google-Smtp-Source: AGHT+IElRIVhqCvDTFpSgFEYkQvi9Gos4SnKPGf8Juir9zGtxxq03gYdBJSCGUUe4Ii0djCwuMFVWPO3CN8YKO0f0p8=
X-Received: by 2002:ac8:57d3:0:b0:4ec:f073:4239 with SMTP id
 d75a77b69052e-4eda4e7cbb2mr148255861cf.6.1762856570888; Tue, 11 Nov 2025
 02:22:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111065520.2847791-1-viro@zeniv.linux.org.uk> <20251111065520.2847791-2-viro@zeniv.linux.org.uk>
In-Reply-To: <20251111065520.2847791-2-viro@zeniv.linux.org.uk>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 11 Nov 2025 11:22:38 +0100
X-Gm-Features: AWmQ_bn6E4e4WTTnqqQ9ptsMdEgyTHjWIJOU4-smQyjZiT3MKecFKgj620d_-Vc
Message-ID: <CAJfpeguqvHUDVzR7N=To8keErrF8Bn9kuojoFtM_58sLY_XXDw@mail.gmail.com>
Subject: Re: [PATCH v3 01/50] fuse_ctl_add_conn(): fix nlink breakage in case
 of early failure
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
> fuse_ctl_remove_conn() used to decrement the link count of root
> manually; that got subsumed by simple_recursive_removal(), but
> in case when subdirectory creation has failed the latter won't
> get called.
>
> Just move the modification of parent's link count into
> fuse_ctl_add_dentry() to keep the things simple.  Allows to
> get rid of the nlink argument as well...
>
> Fixes: fcaac5b42768 "fuse_ctl: use simple_recursive_removal()"
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Acked-by: Miklos Szeredi <mszeredi@redhat.com>

