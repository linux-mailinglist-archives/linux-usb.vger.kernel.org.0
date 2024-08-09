Return-Path: <linux-usb+bounces-13281-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F7694D358
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 17:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25B6D1C20FF8
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 15:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05A5198A0E;
	Fri,  9 Aug 2024 15:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RU8bgouV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1054192B9A
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 15:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723216962; cv=none; b=u48tlBeYvDzJifsH0acsgD8EctaxCOrhIwJCZq09ndJZksEQ2Xx6iAfnfK41F+SD0rJ4rl1VcHSDDOgetAFSfURb014n+iE3H2yqHxHdD89/9XMEXSDIkdTFVJT4gfbcYQ4CtomQSgB9UP312wGRinPolB2lNZQ3otpLC0DDixM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723216962; c=relaxed/simple;
	bh=I9JBh8Nx6R1OMk1r9f3wJyh5ZFLMFcAl4c+4i4VGcvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EvKFlopyXqsrpEPpxNB4KhM/RyS54lntRQAD56UHC0zjx61k8fRyLfes1EeisG3h5ukPbbzZFNrapTl2y35y/BqiiMsuv0URqQ3OZjbEfnX1cbkEj0gG9qV2//SGpVxHbDwOk+sC+KcY2SZFXUpX/T5qXtqJuJzX4m0TfQhURV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RU8bgouV; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7a1dcba8142so238307085a.0
        for <linux-usb@vger.kernel.org>; Fri, 09 Aug 2024 08:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723216960; x=1723821760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9JBh8Nx6R1OMk1r9f3wJyh5ZFLMFcAl4c+4i4VGcvY=;
        b=RU8bgouV2bIRmDylDOCQ5wmdovD8UffyUBMcrprkDNpdgWUBN6+qLERua5J12+1IkF
         lY9Yvbm8zZE+e11wvsfYl96/rtL5R8E9S1151W6NKKbKEJyrCo6AELLBqiEjkZMtSExK
         qIuAgnf6jOxFay/dRTX9jLMPA0wt+T9EQYlEjaUUFa+k9JH5m6wFBuxfcBoKgmX8lP10
         DmkoYu8WWozzU6j0uLifdBFx4am/J/6Tt+X9ypQJTcsO+vk/8ZiLseGjn1Ep9NrxkHn3
         7Lk7S5NyCVd/Nh3+qcupBDg0jPrwkcax6O9cT+k8eIq+W6FPjYvgzMbnFgAsSqNtZIqJ
         53Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723216960; x=1723821760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9JBh8Nx6R1OMk1r9f3wJyh5ZFLMFcAl4c+4i4VGcvY=;
        b=w2DJW72u1SFbjY78vbsK+ReNyrz4Y/56L/UOA5TU/FYuk8t94Rar4xPNIKi2/wrVAr
         kq5UtjJap98d0GdmS3XwFk1sTy+SPfuqCSZBbX/VPjy1NLisPACVQieGc5L/Pl20pggw
         L4ckVP6V3F1ZkchOMm7WuZNLbJE1R4L9xRlbYv+KE46S3V8irwCMHKjBVnG7RTfvqu1/
         WSnxovDgUM15X+5tOUlEDCa9l2tP8BrsFSbGlbZ2cgq3ZnGJanNPn0/PyleY0e8eq1rN
         9OrLHMmZlXjtFmimxL4LxjzTD6RVU30FNT+t+UklhG4BbY+VYwU882fwPJ0acK+kFDeh
         +KXw==
X-Forwarded-Encrypted: i=1; AJvYcCWYRs+l4alIK0eMgkj7XmxYhOv3QXSLj299EStg/tLjlHvDVrSKjxq+YH/kOAmr6ZB69SgJiT4CJm7hM2D0oCQ2pAbWSrk0LIZ1
X-Gm-Message-State: AOJu0YwL/IvydhXluZoFLMj9g9PYMNd7QoTyYbdujSNtPgEP+vPrInAk
	tOpP+NlXCSWgYu2UWQ6ahPxjWL49iW3gdlijKFoJFzfkWJRBGO6JdNqJcdSWAwMH9uF+cPt7qcI
	1LD08xK2ceqa6CJZ1T4vShX2CLU39BLnB2/mL
X-Google-Smtp-Source: AGHT+IF+eJ/yOfT8He9fhZRxlhLxrCA8EO5BcB2j5C7/E9D5kNDpoCIVUp0J9rAlNwgnKL8gKHxSp+tNgJOpiG/gEwA=
X-Received: by 2002:a05:6214:5c02:b0:6b5:8015:d72d with SMTP id
 6a1803df08f44-6bd79b4b3f0mr27122676d6.8.1723216959717; Fri, 09 Aug 2024
 08:22:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729022316.92219-1-andrey.konovalov@linux.dev>
In-Reply-To: <20240729022316.92219-1-andrey.konovalov@linux.dev>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 9 Aug 2024 17:22:00 +0200
Message-ID: <CAG_fn=Uafd4y9eetxBKWWROpSdDYWTOpjhOsCU4ZVf2Z1LvvVA@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: dummy_hcd: execute hrtimer callback in
 softirq context
To: andrey.konovalov@linux.dev
Cc: Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcello Sylvester Bauer <sylv@sylv.io>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Aleksandr Nogikh <nogikh@google.com>, Marco Elver <elver@google.com>, kasan-dev@googlegroups.com, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+2388cdaeb6b10f0c13ac@syzkaller.appspotmail.com, 
	syzbot+17ca2339e34a1d863aad@syzkaller.appspotmail.com, stable@vger.kernel.org, 
	Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 4:23=E2=80=AFAM <andrey.konovalov@linux.dev> wrote:
>
> From: Andrey Konovalov <andreyknvl@gmail.com>
>
> Commit a7f3813e589f ("usb: gadget: dummy_hcd: Switch to hrtimer transfer
> scheduler") switched dummy_hcd to use hrtimer and made the timer's
> callback be executed in the hardirq context.
>
> With that change, __usb_hcd_giveback_urb now gets executed in the hardirq
> context, which causes problems for KCOV and KMSAN.
>
> One problem is that KCOV now is unable to collect coverage from
> the USB code that gets executed from the dummy_hcd's timer callback,
> as KCOV cannot collect coverage in the hardirq context.
>
> Another problem is that the dummy_hcd hrtimer might get triggered in the
> middle of a softirq with KCOV remote coverage collection enabled, and tha=
t
> causes a WARNING in KCOV, as reported by syzbot. (I sent a separate patch
> to shut down this WARNING, but that doesn't fix the other two issues.)
>
> Finally, KMSAN appears to ignore tracking memory copying operations
> that happen in the hardirq context, which causes false positive
> kernel-infoleaks, as reported by syzbot.

Hi Andrey,

FWIW this problem is tracked as
https://github.com/google/kmsan/issues/92, I'll try to revisit it in
September.

