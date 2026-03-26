Return-Path: <linux-usb+bounces-35491-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM/OJwLrxGmj5AQAu9opvQ
	(envelope-from <linux-usb+bounces-35491-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 09:14:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 039A5331154
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 09:14:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A63430F7EAF
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 08:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08B3350A05;
	Thu, 26 Mar 2026 08:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6fvrRNq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DEF384248
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 08:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774512481; cv=pass; b=uWOz6cVFCs8p1b3ZT1eTdsw+55xJzrks2k+9fVIAPbeujTbCnsRXOuOEFerHqaBleRZxZcUjYA5NxTPLqpkumdTQjss/3kJljKrfxVxlbUZJCicl3fgF7nKeEmIQXPEQJ43Pk9viNuntzwHHUuKsLjluHnVqsqXr/ChDEivECBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774512481; c=relaxed/simple;
	bh=qQ3t4fEm6UcvNrhoSDVgJCI0Hy9U8j+6sJp79T/tdvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XC/QGLeXEz/4ayI/m/g3+2m6UNpphQGm+5BtmkqyipvUqKkrDU8VpdVzMamR0w2nrawVnksdeLOGXng5iUijRbgsdHdqgg9pWj5YEo6IrcAaoR/Iir7yrZR6pOUuJeUtiJv5/mE+cQxtaOgqRJUDSY9YuSaaCuMDeI3w7wLbW8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6fvrRNq; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fb112c09so6446205e9.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 01:07:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774512477; cv=none;
        d=google.com; s=arc-20240605;
        b=DtPPqIyjlOiAPbRnErCdrj/SbzWm4aL3ZS2pe74htrCeDSOVIywDVWgf7sY/n8B3Fn
         gkDkkQP3Nk//FZac3YFOUtqJaSUm04QrZraQsLYytNorSB22n2iFatFNBmtPcGCdMDzO
         8pHHw68Br86RJXBWfWBeybKh79s7Vx4Y08+I+Oq34miTfV/4H5DpoBPApTE910c8YPKO
         SkemA4BqxCR83wA7QY8QfBx4glf2bSjYWbQ5PYU5jpqGmkuU5e2kt01Lh/pd9xUiZK9B
         hEYmTD2tl5HqR0damcrkSSUue9QOIKASN+Z3wfm3PNZJ7IAvuFp4XlCEOvBf+FyFdPIK
         61iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GxNwnXNSeOlt3YvpFKLNRIc51EgKqgFCtbpdUU6DY7Y=;
        fh=aG9hhZLqF4IPvYUY4hj+v7yT12Cr85jDzNyEI2TBTOc=;
        b=Nk2pZrV3RsPxfCRbIj7Mo82Sk+7B5BI+wK9cm49/NzrcYCN1KE9VBcEMDMBkD/Vi0Z
         XLyWvyPOpDehUXUoMvZz30Lpklvq76tkFuFUje5GvghndXxyIh+n2iY7nWhq0BIdvuKn
         PxOgo+EFYjqEKuKBiYsN05md0IYUeEmXmA5+QuHBwQk5UPu2z/9W7CjTWwoAxEDJI5JD
         aWhjey87Xejs7KVV5gEULoHMxlkVkQS/uJx018GRxW+za7+6H5etcD51uJ0qENZR/Wxc
         FVLWh8NKRMt5A3PkY0hc/AqrptTAF9lIxDwH3+uqZXd91Mm4eUu4CtISbJSk9s6vIza5
         qHIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774512477; x=1775117277; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxNwnXNSeOlt3YvpFKLNRIc51EgKqgFCtbpdUU6DY7Y=;
        b=e6fvrRNqvo/Va2Ah9tQrdun5qzfbhRHxqqortpvXYs/73judfGBX9fE5y+jvOx6Z9f
         Nwk7MiL05b0kyvO0dDJXL0giWF+oW+MhuAdax0Nkutfe6rQ2kJYAPVtYMoXkRGA3bShc
         sNrZB51FL2AUHLi1beDOZBJrTAzbHSPs4mlf8mDdSJfd7fXhwCsWCfYcvbcmzzA7Fp4k
         qRsF/YUD6qt/w+EZ/bhqHq7aTKpzvH8c4H0mFfL4LECa9MOCGJZf37k+2azz/HJqifOd
         Xzd7HVG2JY7wOFQIvPml+cUrwPXNI3+RbGp64id7MMqQT02kcZrP7De63DniLO4KBe7D
         ZDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774512477; x=1775117277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GxNwnXNSeOlt3YvpFKLNRIc51EgKqgFCtbpdUU6DY7Y=;
        b=Q3M+4F3qtiIRhAR9a9O+/Mcztbs2ScgHIgEXiClAe62o5xFhhKKHQpB7LmdrPhkTxW
         nAyT0mjnfG0qpDzMEjvDVoHtghIuYLAuVd7AIT3yxWBYNq6KdsHeKczlRZoWgcJz7PQA
         gMXzo5OlVNWP2rDmBL0Zsr5qEpfDPGmJe7VVXKucNXrhednJFuqOcxR9ZFB4yQsyNiFD
         wZvlFxTtHOpE8q3fKFGobbO90MCLNHOSxd4ZxCAhLMSi9+5B4ZLcdF5wNO1+D5zuZC/l
         SVbTWh3nbbjomxzSwdlDOc7NYPBcQfE4ujp1YRhqc79fVHzqGUnfRJt0vYgXldp9nPa1
         AUkA==
X-Forwarded-Encrypted: i=1; AJvYcCVJMrLzYUI6SeDKSd1NfMjjkDe3G4ERdnVuwxKprmd3ZaSSTyGxIYxzMk4ggGBELXHgdTFOUT2vlYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRKf3MX1rmsfbQObvgPia6otCVBUQtUz0FG/npgsWw3aj5jzcR
	4nk7X0dBXnn/uwpGPZP+seOGhgxpeT+qId8q/m7OAoEJZQ2fC8DpwzRIbAulBzphYZoY/RywUk4
	2jpk6FQ1dV2kIUYqiLjUyCcLEXw5I4Y5zQFRm
X-Gm-Gg: ATEYQzzZZNhdo7X3LOc0nroqKUy8wuRFl13oZL/HSRZelFPg0cldApPcRyVu3zorLaF
	jCvcIW06Ho6ItNBxrwMtbsE3qt34FQ8SiWeEoRiElr+a0eRPBmC6ayckl/ensUutEqWIVTOeQ4C
	l7CuTBu34ehfmNud5yelN7GZHMCNmgRQ30hWtu3ALVPUrGQrVMbH/SRsi69w25Exj5rRilzcNwv
	TV5MZaRXBrwUAYr/a/RWAa+cZATz8TwkJFMfgZCQLF933eM0vlDk8GoO5z4FJUiRA4LoyTUaD79
	SRCAzRZY6PGdwrxjNutuqVAOJAZUj/UCMT5BU0XDpA==
X-Received: by 2002:a05:600c:6287:b0:486:f4d2:eac6 with SMTP id
 5b1f17b1804b1-48715fd63f5mr100683785e9.13.1774512476398; Thu, 26 Mar 2026
 01:07:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326074332.34305-1-cuiyudong@kylinos.cn>
In-Reply-To: <20260326074332.34305-1-cuiyudong@kylinos.cn>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 26 Mar 2026 09:07:44 +0100
X-Gm-Features: AQROBzCWff3A9GRqaigPenrZRtqRniggr8QJYET4Ts4ayvTIideuOJ_2ERfA5hw
Message-ID: <CA+fCnZdstY6Aj=W7csa2qSXPEDgoOeiHj5eMuKnEeTmgp45Huw@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: raw_gadget: fix double free in raw_release
To: cuiyudong <cuiyudong@kylinos.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	Gopi Krishna Menon <krishnagopi487@gmail.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35491-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreyknvl@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,appspotmail.com:email,kylinos.cn:email]
X-Rspamd-Queue-Id: 039A5331154
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 8:45=E2=80=AFAM cuiyudong <cuiyudong@kylinos.cn> wr=
ote:
>
> raw_release() had duplicate kref_put() which caused KASAN double-free.
> The extra put inside the unregister block is removed to balance refcount.

This patch is missing the details that explain what happens and why
this fix makes sense (and I cannot tell that it does).

Why is the removed kref_put() extra?

Why did we get a KASAN report instead of a refcount warning, if
kref_put() is the problem?

>
> BUG: KASAN: double-free in dev_free+0x424/0x740
> Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
> Tested-by: syzbot+25612fe5ab3dcafc3aab@syzkaller.appspotmail.com

Why is there a Tested-by tag here? I don't see a patch testing request
on the syzbot page.

Moreover, there's no reproducer for this bug, so syzbot could not have
tested this fix.

> Reported-by: syzbot+25612fe5ab3dcafc3aab@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/69c401ad.a70a0220.23629d.0000.GAE@goo=
gle.com/
> Signed-off-by: cuiyudong <cuiyudong@kylinos.cn>
> ---
>  drivers/usb/gadget/legacy/raw_gadget.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/=
legacy/raw_gadget.c
> index 4febf8dac7ca..a1fd3fdf1323 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -465,12 +465,10 @@ static int raw_release(struct inode *inode, struct =
file *fd)
>                         dev_err(dev->dev,
>                                 "usb_gadget_unregister_driver() failed wi=
th %d\n",
>                                 ret);
> -               /* Matches kref_get() in raw_ioctl_run(). */
> -               kref_put(&dev->count, dev_free);
>         }
>
>  out_put:
> -       /* Matches dev_new() in raw_open(). */
> +       /* Matches dev_new() in raw_open() and kref_get() in raw_ioctl_ru=
n(). */
>         kref_put(&dev->count, dev_free);
>         return ret;
>  }
> --
> 2.25.1
>

