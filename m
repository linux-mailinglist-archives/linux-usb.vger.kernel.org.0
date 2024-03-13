Return-Path: <linux-usb+bounces-7899-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC7587A0CF
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 02:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6748C1C227C5
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 01:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34A1947A;
	Wed, 13 Mar 2024 01:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nieMchtF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03F5AD5D
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 01:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710293456; cv=none; b=EbsjOUJchyin1zCREs1e/j3WU1mD8CK2HbqdAm7ObWzn4jsuEPBuI0zEf+dFr5gPUTqHM/khbcEF9jl3IYQYzGGsDe4DtkkOtrhkNrgQA0P/anpbjuMF9UsVJY+vXzVkoqjT4sAD3vedfEp2BgVCJ5Zm1tzeHrh57dx4J2F3A5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710293456; c=relaxed/simple;
	bh=BenLdQ35Wc+TwgKsCAMpXY/C8JnxaW2a3q5vmQ9O/9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vA9mSlnDtm3T9oHZAkZJF1gsCWq9RLX74K4jFda7tFsSQKdwh3fpBxgMaHTuZ7NL5mew7PUBXFzKnxoqLYQUMZNBYoHsMsA6szwfWuLaJAplvv+VeEHvU+he8ssvdf31xt4/V8gUX63lNCH/lSFcX2GqvL4MO9hO+ekVJzQOYIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nieMchtF; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-60a15449303so36221167b3.0
        for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 18:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710293454; x=1710898254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BenLdQ35Wc+TwgKsCAMpXY/C8JnxaW2a3q5vmQ9O/9M=;
        b=nieMchtFQ56MTkhXxh1k4qFqaCMZoEToLkn3UhRazuwO+Za/BR1fLmLGesvU8In6Rg
         bEWcT9GwOeMIK0/miy2RjcFnj07EfrcTwLpSvB7LSy+d23ojeGSttNibHG0KpuLe0Or7
         mpmInpiFT8sxy2fitOAzRCZz6C5k/9olEPSVyl7P48HXnp2GQfnHiCHfRF+8j4cVyJsj
         nUbaB1HAXnPlGWM1+ZUldQdeBabhTAAM2z4zNndz3zypo7JeiCNhmkC69F1d/7AYfmVn
         G+uUW/bM8aTKb9NS/L/rP4UaLvXWb66oz/cvmNdktiBjUnHKNkocwkihhb2UBXP3mhpJ
         f/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710293454; x=1710898254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BenLdQ35Wc+TwgKsCAMpXY/C8JnxaW2a3q5vmQ9O/9M=;
        b=LXAD1AH68acAnOJfxPqSZZxiEMEJ3jtimqXO7NWZ5Sc5lhpJ6sKg8UN8XQpjYHZbhl
         yvc+MvpHCJ724X0xdhWhLGCzHHQm15hAm6LVTRkr631qQABImHHYc3eQpA9YVHG+S+M8
         EFqy9/6eDCDIP1L9GHadx4TRqDvwqduItC5/4ogh01fWl/F1toL4i+dVP8PjwItuMM9K
         kwGeUt1Fwdyk5cwUCnVApgg+5wmyvpDa3450FTFz6AswvcRLrA/a12YtPj2EYCdSwnSw
         Pf++Ngp0hgyatJQJN7ZuEshNJhKUH7/+lJ5vLIOZakgknY6n/B9Vl8mNBz32Rvvvbz52
         jZ1g==
X-Forwarded-Encrypted: i=1; AJvYcCVOuaorcBOuG9shiEA0GvOvmqX8vOsiYXfypKMYA9/1KwiX84JgDJqS6JVENtQbt2u0nD6uIPpgd/z3HbcKmb9EBxB+LYs7khUq
X-Gm-Message-State: AOJu0YyCQvCvXnZoAgqc87UP6wCxmvvJQiuY6vTwCvlVxb42e5CEDYMf
	y61W/JhCuRdYYJn+inoO3myTn+95nNIboK4B5ov4dGBpkmsmmif81k6+09CJZ5LHeunJgwm1+sf
	I9QjojeH19YTFMso3tafKSEnkQYQ=
X-Google-Smtp-Source: AGHT+IF9cJ9DlIxAtBDWxcMhdqr8Vk7nmj0Ta0sETDYD8DdZx5tq6tI8Iev3LM1yEVKFBNDMbgbxYBiStjA9tqgSN0I=
X-Received: by 2002:a0d:fb84:0:b0:608:b6d1:c334 with SMTP id
 l126-20020a0dfb84000000b00608b6d1c334mr1029921ywf.52.1710293453707; Tue, 12
 Mar 2024 18:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240312055350.205878-1-alexhenrie24@gmail.com>
 <20240312055350.205878-4-alexhenrie24@gmail.com> <ZfAG0uEmtiOBNeR_@hovoldconsulting.com>
In-Reply-To: <ZfAG0uEmtiOBNeR_@hovoldconsulting.com>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Tue, 12 Mar 2024 19:30:21 -0600
Message-ID: <CAMMLpeRpMwL3+c-uBrASuDOT4=YmxGRn5q1g8xKw2BAfdpujNQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] usb: misc: uss720: point pp->dev to usbdev->dev
To: Johan Hovold <johan@kernel.org>
Cc: linux-parport@lists.infradead.org, linux-usb@vger.kernel.org, 
	sudipm.mukherjee@gmail.com, daniel@gimpelevich.san-francisco.ca.us, 
	hkzlabnet@gmail.com, reboots@g-cipher.net, mike@trausch.us
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 1:39=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Mon, Mar 11, 2024 at 11:50:29PM -0600, Alex Henrie wrote:
> > This avoids a "fix this legacy no-device port driver" warning.
>
> Please be more specific.

Hello Johan, thanks for taking a look at these patches.

The warning comes from parport_announce_port in
drivers/parport/share.c. include/linux/parport.h says that dev is the
"Physical device associated with IO/DMA." Commit 4edb38695d9a
("parisc: parport0: fix this legacy no-device port driver!",
2013-05-30) fixed a similar issue and says only "Fix the above kernel
error from parport_announce_port() on 32bit GSC machines (e.g. B160L).
The parport driver requires now a pointer to the device struct."

Do I just need to include "The parport driver now requires a pointer
to the device struct" in the commit message? If not, where can I learn
more about what the dev field is for, to be able to write a better
description of why it's necessary to fill it in?

Thanks,

-Alex

