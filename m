Return-Path: <linux-usb+bounces-14744-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF0196E471
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 22:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 860241F23508
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 20:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99881A4F08;
	Thu,  5 Sep 2024 20:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hS4kzLQ4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC1E17AE11
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 20:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725569510; cv=none; b=YCy4KxupCI/TkDhdX/vTZZqMUC3TTkiBE9LO7Hwl58QPu78hEf2RJEI7tQC+Qj/tNUG1tmmUVqGBVemMcOZGK0ZWc4RhzLcCR5Wai8v7Tu1emb7HgRWhZhbQL7U/jRENxYQdZhuKjkaG6DhsT2R5zpNScnAN+NQbHof1VZTDrAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725569510; c=relaxed/simple;
	bh=E1/m35tqccBauMOvxzlcgHw0vu2EWFXD7bOLaedGlpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bUE2KUZ/ieTqYabu4g4LjxesLTFF69u/pul81/MhyvoqnzFH0dgoXQ1cM+y3pPmUmMm1PtgZPP5fpWHuvW0SoVU9V/WBjcQTx0Kn+1acGHK8MxxaJ4yepbGeYb3/kFXc8o0fF1zwHdgxCBULUDWTx/qzBC2V00uSJYNtcTp25m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hS4kzLQ4; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c3ca32974fso1439190a12.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Sep 2024 13:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725569507; x=1726174307; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHFHHDrSoi9mTgT2wXEnE9G9Bm4oyeMvymokzvkyoUY=;
        b=hS4kzLQ4Z7ph5x8sd+QuqAO1j4xCBsZaQo1AnVZP2aXdiw2zGpW3NQRUHI579l6Qqb
         gwwbtax4rxtPnL1UEgg6JzU7ttKvaEg/YLFfYxUrtAXjrlI9FGjhUixN3LfsXIYnnM7V
         3/qYgX5xleNEhbgZg2bsddvYGe9gAVs5NAo8dTcp96ONlteo8LJ26ZO+Yayh75F4JJ+q
         0WlcTAxJE5blFApoT9ddBte5z4RD71XOr4nPGd9Ee9RN9/4hQ5W8loupZ8MpB3BiiX9i
         45Rm2Sxcb3cynrvh9QzDsvupIHR/76y6mO6Fl9SMYJo/OwD5IXmOEUhda6qPOHiZ9com
         Pzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725569507; x=1726174307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHFHHDrSoi9mTgT2wXEnE9G9Bm4oyeMvymokzvkyoUY=;
        b=mKJcKhUFCoNjTiNfvMFSPJ4YJjERpww1Ttiwirq9L82Kq+c5mVO9LrBbpPiVfOsaOm
         eRV9PCLPQ8BgdntfZINNFaqb2hYtza0tTyzsR/CsONPr97naQmmzZii51c05S5Qy6FK+
         Z6/K+sOyj+9qGiyrQfHwtczd9FBvaUOb6HCqxAguZaVqGRry/ueFZRnpCkiHXHC+BJ03
         4Lzed6eyXnY8jwjDvoYhMSOEE6dsqAScVa0jOKttXmX+jNgOGhF+IzjKc6ExTAOC8qco
         wSU+LYe6ovYI6V6zAkhO15Eowj8vWbNGXTsqw7L22hFoW4xxrDf0qZs3mSPuxfsKxQBN
         aQLA==
X-Forwarded-Encrypted: i=1; AJvYcCUB+mkq0xZ7iInRGRvra2UDHYKKqjO3d66x13oUSrv0evWWqJiNDLHal2jThHuxFH29QdC+JW6Ws+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmOUknSXQEYP415s+nlZn0987y7CZ/p1zR2Kj5cso67BKHiMXg
	Bp89etUH7qtiCgms/5lDJY8Uz52gTpCucCTVU4pp9Q8H7Vgg3qbAzXMijStqpRogpVzUEhhUHIU
	ZDLP8lPCTNL1fdDDAvxq7tjl+OVo=
X-Google-Smtp-Source: AGHT+IFsbuS4bw6FWXI8X4ZUeGBStezn5KuZn4xTgpDgwbpIMkRyAIgNi+Uhguv2aBD1YGVFBElXZUDM5HDMwcShwDU=
X-Received: by 2002:a17:907:803:b0:a86:a013:2161 with SMTP id
 a640c23a62f3a-a8a88667efdmr24261666b.30.1725569506586; Thu, 05 Sep 2024
 13:51:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905204709.556577-1-bvanassche@acm.org> <20240905204709.556577-2-bvanassche@acm.org>
In-Reply-To: <20240905204709.556577-2-bvanassche@acm.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Sep 2024 23:51:09 +0300
Message-ID: <CAHp75VfYDtO27jByCj9vAv5kAf7jf45ZTwecShqJ48jfwfYt1Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] locking/mutex: Define mutex_init() once
To: Bart Van Assche <bvanassche@acm.org>, George Stark <gnstark@salutedevices.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, Amit Sunil Dhamne <amitsd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ George Stark (IIRC you also tried to achieve something like this in the p=
ast)

On Thu, Sep 5, 2024 at 11:47=E2=80=AFPM Bart Van Assche <bvanassche@acm.org=
> wrote:
>
> With CONFIG_PREEMPT_RT disabled __mutex_init() is a function. With
> CONFIG_PREEMPT_RT enabled, __mutex_init() is a macro. I assume this is wh=
y
> mutex_init() is defined twice as exactly the same macro.
>
> Prepare for introducing a new macro for mutex initialization by combining
> the two identical mutex_init() definitions into a single definition. This
> patch does not change any functionality because the C preprocessor expand=
s
> macros when it encounters the macro name and not when a macro definition
> is encountered. See also commit bb630f9f7a7d ("locking/rtmutex: Add mutex
> variant for RT").
>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@kernel.org>
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>  include/linux/mutex.h | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/include/linux/mutex.h b/include/linux/mutex.h
> index a561c629d89f..ef617089db19 100644
> --- a/include/linux/mutex.h
> +++ b/include/linux/mutex.h
> @@ -49,7 +49,6 @@ static inline void mutex_destroy(struct mutex *lock) {}
>
>  #endif
>
> -#ifndef CONFIG_PREEMPT_RT
>  /**
>   * mutex_init - initialize the mutex
>   * @mutex: the mutex to be initialized
> @@ -65,6 +64,7 @@ do {                                                   =
               \
>         __mutex_init((mutex), #mutex, &__key);                          \
>  } while (0)
>
> +#ifndef CONFIG_PREEMPT_RT
>  #define __MUTEX_INITIALIZER(lockname) \
>                 { .owner =3D ATOMIC_LONG_INIT(0) \
>                 , .wait_lock =3D __RAW_SPIN_LOCK_UNLOCKED(lockname.wait_l=
ock) \
> @@ -111,12 +111,6 @@ do {                                                =
       \
>         __mutex_rt_init((mutex), name, key);            \
>  } while (0)
>
> -#define mutex_init(mutex)                              \
> -do {                                                   \
> -       static struct lock_class_key __key;             \
> -                                                       \
> -       __mutex_init((mutex), #mutex, &__key);          \
> -} while (0)
>  #endif /* CONFIG_PREEMPT_RT */
>
>  #ifdef CONFIG_DEBUG_MUTEXES



--=20
With Best Regards,
Andy Shevchenko

