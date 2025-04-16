Return-Path: <linux-usb+bounces-23122-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D9FA8B6AA
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 12:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 120383B1D8F
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 10:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5622D2459F8;
	Wed, 16 Apr 2025 10:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VQPdSe7s"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C162459F4
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 10:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744798905; cv=none; b=UNxs8k0lLjoNZXthPp2emFKagpitcZxedAIYQOR2xJja8EJvIpH+5SapLQYfBznZ6Hm9A4tI2RpDl5BR7Hx6B7ywoOnOASw5tVlxz5nxM9LukZQOgA155mBtoraqYQXHmOi7EQhmlk2DpsNFylZSXt7qghNb1qt3PE8A4oZgAAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744798905; c=relaxed/simple;
	bh=GzLpijeCN/xnc0MpcoS27D9qekhAtoTNeNrAopBITXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ssrT7W+SmQ+Gq+5OfqgQ//JUfly0xHZ22dnLfZkFUg1iLuTFnbLni9IgPgIiCRo3DwOLIybMoN3OE1mY5v/dhL3DDpt9e6C8VcpEXwiXy8EXgYHNMsHBTw6srfV7g78Mrc/8Zv2yhHM5aauDJW7PJELKgTqiWbpJj862rbRgPmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VQPdSe7s; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5cbd8b19bso7040a12.1
        for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 03:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744798902; x=1745403702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gI/k9ZhlZw1nLIMCv8sLSEHLegOn6Koki046UAaZhLo=;
        b=VQPdSe7s3XPRRIatL/vuIpF0gatOl6byF0DEdjLjRJh12vEaMay7M0Bu9vGRDp/vUL
         Ixv9/LROG2lJikblql+I559f1vHm0cb9xaCx/tSAKFWDzbwGfIALR1+s5Lh+Ge8bjDgW
         aoQe06cimOz31neSTApal1zsQBFB//wNc0M3G1y6hsY7Av8BuhFHAjqcOiUhEspuyNMH
         AgghzFk6F2Ra8iZJCz1j1ZSdpvOyhv2KSuHg8AhLC+RBUx+dzgBpAUzOUKJ/ZFdn2cUj
         EUYPJK9qsiKzB/YPRqVRi/xX5TC4jkcIFDJhQ11gpVtMGRNGV6Kvf1dfUC+jhmaScZ2p
         UhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744798902; x=1745403702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gI/k9ZhlZw1nLIMCv8sLSEHLegOn6Koki046UAaZhLo=;
        b=WBusobAM70fwgJsidX0mwCky5fJwHGVf4Dm39o0u9a0clCdHu+nMS7IO/rPdk55vNZ
         Bdx7FxTbu9irVaFffFX8XIWhCqp/+Ddn+Une0acX2cuY5wPRJ/SZErND0kxR7fjhG1Jz
         Gz1JMS4d/ReJAV1fHCvd7h0CcMiLOxv0kiIgnn6DmiyLU4KM4Nc42v8a8cgHFz7pIWav
         c7cqLMG1Aoc/HGQAMGkeTK+dhhZIM58eLtkJ9QgjNwa8RLOxJuw4HuSkNAcjOvquRXc+
         1QOYSDVyUSUN41dUK8lzvDqymWoYjPpfYMZezOTbhzEy5K+vv0tcR/jGY3m84fRYuCBO
         8JPg==
X-Forwarded-Encrypted: i=1; AJvYcCXJdgmcM975h5uNHXU6N/7LojtWVV6gXoS7GtZf2QdBjm7EM+IWfY1YvMGh4smCSmgA9ys9dyGOYNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFoZlP0j+QAK0isd8goidyoWIsplQyUtf1P5EqZDkUuAtri9x9
	2PPdEirFsZUhkma/C1hGxbXEocSWfLS5UlFRRkVnNeXvDvAgSXvFuoE4cIB9ef4VFTqMxDu/cwe
	bk9m1xvc9+r7xNdS0Q1HkaQ9iOHTrV6kQZ7/u
X-Gm-Gg: ASbGncuXYQEyjDnzvD/t0UbUPReFmWluWVzHJfvkqTOXovvzTWFIGZSr4MO33lvV7l4
	JbrvYkfslk8pWqPsqJeuLo39rjlZDMqss+NxVCtsFLWeQMqgozw5T/JGyP9cbX95Xhy7UFclydW
	fj4naXm6cVqQpS8a42eFyyOXo/LScPSVDWtf5AsYguKDDN5uMiyv0F
X-Google-Smtp-Source: AGHT+IG0YsgU3ftiWo0K6lBwOj8sW/iLoTyVfIdyazBDTtja0alyxnkkoDAOkqtdSVB+I4ZxcIm+Daz0cCs9UTP+gPs=
X-Received: by 2002:a50:870e:0:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-5f4b6df5699mr35534a12.7.1744798902226; Wed, 16 Apr 2025
 03:21:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408035833.844821-1-guanyulin@google.com> <20250408035833.844821-3-guanyulin@google.com>
 <2025041107-guru-epilogue-a4b6@gregkh>
In-Reply-To: <2025041107-guru-epilogue-a4b6@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Wed, 16 Apr 2025 18:21:00 +0800
X-Gm-Features: ATxdqUF7ff6_Wg9zdoYu9aYlwaX5VUj6KNg2hBrNvQ6G3MnjCzU81IwJo-w1lB4
Message-ID: <CAOuDEK2av=TmLu5L5xMryh9jCu0hsXNwcC=ZJjnjrtkwG0+bPQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/4] usb: add apis for offload usage tracking
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, elder@kernel.org, 
	quic_zijuhu@quicinc.com, ben@decadent.org.uk, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 10:01=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Tue, Apr 08, 2025 at 03:57:22AM +0000, Guan-Yu Lin wrote:
> > @@ -733,6 +734,8 @@ struct usb_device {
> >
> >       u16 hub_delay;
> >       unsigned use_generic_driver:1;
> > +
> > +     refcount_t offload_usage;
>
> You now have 2 different "refcounts" for the same structure, which of
> course is crazy and will do nothing but cause massive problems.
>
> I know this isn't going to be used to "reference count" the structure,
> and surely you don't need/want the atomic properties of a "real"
> reference count, so why isn't this a simple integer?
>
> thanks,
>
> greg k-h

Thanks for pointing out the blind spots. I'll change it to an integer
in the next version.

Regards,
Guan-Yu

