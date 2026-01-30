Return-Path: <linux-usb+bounces-32942-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICZ2JXAxfWntQgIAu9opvQ
	(envelope-from <linux-usb+bounces-32942-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 23:32:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0CCBF22D
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 23:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E8A9C300A592
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 22:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879D638A2A5;
	Fri, 30 Jan 2026 22:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xSsduIhT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9EA38A29E
	for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 22:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769812330; cv=pass; b=sjLSJ7IS+8J9ATfPdvLpTBnEGWlq/jf8ddh1aIrxeSyjuHqlK7lRoLA8SRLlUMA3wZM6/fAy/CWOwCtCtI2Nn6C/jwHToYL089OkcLpp0pbzEMi8C3KBpwpbxyXap4zrMcDVdYtnS51Cy4K5s3l8564Nevz8VNKy++PiXVu5ysg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769812330; c=relaxed/simple;
	bh=1L9Z4WjLTMd/nETiB4o0uKotvQN4Rh7dUtNkmBInouo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TC5lYGwERIc4Z4U+oxKDFKWxc5k7ah3jPfSU8dj/0clB1aNbPaDoNXkdArN8wtDmEKPiSt6gt1ybnDMiFuibpXEbLMT+R1xOV5sdPHd9C7o0jS6aWFzzpdSrOLcUFOVWB+UOjHP7XSfjMoY8YdgrmmZ+x72nSHeYNXcW8WN5tSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xSsduIhT; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b885a18f620so393430366b.3
        for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 14:32:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769812326; cv=none;
        d=google.com; s=arc-20240605;
        b=M0KOK9lKgfjm3RKrRu9abGiDiTwJqaAvK3TnOa5GuCYa/o5cQVfy759QCpUMRXptjk
         +2hWHS0EU/i9sXHOXTCqcnmmhGU3+NRbm/JdwKLYmYRq0Raos0MQjaOD0gN/N9gA7LJq
         tQpbNkw5OEU80I4A9ZRabVoj9mccu++w0lmA9EvrR5PGJyOY1sg5ViGvNXxy2qlAAjGe
         e3QA6bxmij4PTniqLilJMu6hKXHL5vTmxx04RpbbBpX1d+FJPJtHYV/Tm3lg6By/h/VK
         NgFP0Yfu2tg3SjLn090mVc4r0cbuep7dfDh13cZ2sTskY3CyYmZ/XzvaCddgJ9cJKo/v
         CHlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V5nbc6oPm8LRFAHxRjfK4s+TrvKdniacoUK6JWeX1CM=;
        fh=zuJkxp27REurbGz89wnyvoozjxbrCBoSWzvGOPl61Bc=;
        b=XBPu9jqsKkevcvkar/9cnKaEAVdQZTygTP6F5a3M4fnOoa37szunHh/1vFFEk8l9++
         j0YJ8e33efRurUzXxViqD7Qy+Uf0AzD3wbTFhQ4fXQQgNxgu9FSOylsCiWzTCeL8HP6z
         jWR4vI+k9lwguaoU+aOuPLSGSK3B2ikfXtDsoa4lWShzccT+vyxWI7UYam/mJbHygXxT
         ZSUIsn6xtSogOyAzLWrst62VH3ZiqTng3IHbbazjFxI8kmtkYtTE5+AGMNfYHZbRTZjp
         82LZg553YlBlDaGXwFLAjkbVXJJfz7A+Ek7a22l1cSJceL5CSOb2mDEag9hgzPqfzBbQ
         olZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769812326; x=1770417126; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5nbc6oPm8LRFAHxRjfK4s+TrvKdniacoUK6JWeX1CM=;
        b=xSsduIhTCrRwZ3JLNdbKh8tE+MdhFL5H9uFQ+5tllsHBric51bEYgyU7uP/nPJVuVm
         PXBuoZbGBGhd9jC11zRL1GU483f7Fvm6uslzLapeb6QBFVPq0QqUEi22Yh4za+kn63ZO
         VYPzScWvoAqGFSaLLyA8MHrbxgl4Go5rekjKE33pKIWosCL170UwdnhFMbcWW6Jy1nHl
         BTUoIyOiMwtb7w1k7xMz4I30jgy1NoIFY4KeyxuPTUlWRVzku48qag4B+Mw5y3wg9X4J
         7qYXltKRhjuTRa93Kg/i5KMrUJXJP9GaY7mIYlek1UyxtuCoSVeghV/7vYzm2MaotHdL
         Ekpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769812326; x=1770417126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V5nbc6oPm8LRFAHxRjfK4s+TrvKdniacoUK6JWeX1CM=;
        b=SYJ8V5AjKYF21Wvxy/C8MA19qGkQ1luNrmzaG9NNTqtg37xXA2jzEJhMSXVJNxuLIL
         nEAvvTMwZiF4Hr1EFxrkdhddtvMg0q83ccU1jmAbBNLlMmhK6pgf1Hz0JuKSyXLEArau
         4sLwJzF4EjAWWQK0C1Ix8ULUdf1jgEh3n6y1TjaC/dkYXwYrFkRWCkjabvfcFR2RfQl/
         vlIFeqcfLOnUL0vt8Vh/wtkA+kGBM4qwuqbc/EMNr5MzqFfiR+eOFbhZA3fowYq0up6L
         awN1IF6Trpa5BzAQ0AF+X4sUpe8E2uL3pqjf4wL1METm6RNYmRywkBB8V4wdUKnytM4e
         iEsA==
X-Forwarded-Encrypted: i=1; AJvYcCWHxQvOIE3W4Ds2NXNfnlCkziXyxVo1hWbqv2X90ccrLNNBI4YuuNk4NptgmKhVTgHJeO8v7BnUICY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAbWyxsYa5HU/veGfseTw3Ka6qXwU7y3lY3n3R6oKJWR5jG9he
	I/RGfi8xdSqgIFR29oxCjB0BCWQ72IrelX30CeLpkvTFhR/ccFHQpf09bKFzaAG7WQepslDDPXk
	3NTAAjWSoN4HRyV1rrGYeDYtpkEsaoLu1tp+T75d+
X-Gm-Gg: AZuq6aIh75ZjeN2XxjCJQIl1txY8sxzXDOr+S82ER9TiN1d1lRrpM/An+0m8hZmwoFn
	XPJfsBAI2t+OY+Nj0sIig9eu8NzG+omBi2uTxPczYsicJ5tXJFmBk9DhysapNyJ3LJebgceN72Y
	+RIFdz7gFMrDZJKG7hNi/6NKS8HLBUZphS3Qoa4gmoQGFjddKfsjhIjLQ+xlKslZZ1y9CUjuirZ
	he8/V8eTgZOsoCVttp4yk01MVjB9RHfZlODbHdXiczz7QUvgSMGMqVnITgNa08QgUmx
X-Received: by 2002:a17:907:e0d8:b0:b8e:14cc:9197 with SMTP id
 a640c23a62f3a-b8e14cca990mr91520566b.15.1769812325869; Fri, 30 Jan 2026
 14:32:05 -0800 (PST)
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
 <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com> <20260130070424.GV3183987@ZenIV>
In-Reply-To: <20260130070424.GV3183987@ZenIV>
From: Samuel Wu <wusamuel@google.com>
Date: Fri, 30 Jan 2026 14:31:54 -0800
X-Gm-Features: AZwV_QjYrhpLENkXIfDxcZ9u-zvP7f57lE4mcVebqUxFVKgl6ULvCT7XG0RHQoc
Message-ID: <CAG2Kctoqja9R1bBzdEAV15_yt=sBGkcub6C2nGE6VHMJh13=FQ@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32942-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BF0CCBF22D
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 11:02=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> =
wrote:
> OK.  Could you take a clone of mainline repository and in there run
> ; git fetch git://git.kernel.org:/pub/scm/linux/kernel/git/viro/vfs.git f=
or-wsamuel:for-wsamuel
> then
> ; git diff for-wsamuel e5bf5ee26663
> to verify that for-wsamuel is identical to tree you've seen breakage on
> ; git diff for-wsamuel-base 1544775687f0
> to verify that for-wsamuel-base is the tree where the breakage did not re=
produce
> Then bisect from for-wsamuel-base to for-wsamuel.
>
> Basically, that's the offending commit split into steps; let's try to fig=
ure
> out what causes the breakage with better resolution...

Confirming that bisect points to this patch: 09e88dc22ea2 (serialize
ffs_ep0_open() on ffs->mutex)

