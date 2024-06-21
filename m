Return-Path: <linux-usb+bounces-11550-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EA99131DE
	for <lists+linux-usb@lfdr.de>; Sat, 22 Jun 2024 06:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78CB6B22054
	for <lists+linux-usb@lfdr.de>; Sat, 22 Jun 2024 04:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34458F66;
	Sat, 22 Jun 2024 04:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLih18L0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F03228F4
	for <linux-usb@vger.kernel.org>; Sat, 22 Jun 2024 04:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719029088; cv=none; b=WHAlS+LMkAgLA5zoahhY2VEe3zYDsMFvsYYoNQEMjouVSQrNK+7bM+0gJc92EbDhGX9CE/x5rXnDYNW18CIJ2/84V1A+FohCozAAZ5nP+lAdDxfZ/vz9PHgYgarIY+Jls3XPH8u/LAmYTgtIQ1WGq4XmwZmiE+8wC5fmTeldG7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719029088; c=relaxed/simple;
	bh=xE3YYs/FP+8u4HvVjhAhss6xmzIFAPW59mnZYTQnnJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b7htVk9T/9VXy5pJ3aHxjY3vW80HMaNwqokHVLBPW6pBRf1y4UbXJMxfbPBaeMy7MN2bGZJu8eJULt5Q/MCNfF+Z+Jb7/vkdZh8dXfKdgqRUhswdgfTBKrdi9HMFBhNPlfDJ9E6n5JdefdR5CfVh1Ddgglq/mOU6vIGCcxRT1zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLih18L0; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6f98178ceb3so1591865a34.0
        for <linux-usb@vger.kernel.org>; Fri, 21 Jun 2024 21:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719029086; x=1719633886; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lL3cYOy5cYINargx9VxFNfKzm+6SWFBJMbMZY1t3oSo=;
        b=VLih18L0MC94CIbosYzqBWDGDfKqHoQU8XjfhLZacIv3iMHDNKTKex9LMBNNNBc8lf
         3TdJNOSbIz/MOXwjhejBiTW9ViE9oVHCbcFIwxnpHpIVtcDAjZ+/55yczVAs6LdY/CpO
         FHaVxkcnEUBj29iXwC6UXK7e+XXezZ5kiTZgDZXMzgnRanELKiynzaWN/zMr1P5eQidC
         64/7KbkxUsk7jGwIs3UAYd40v+xnfXvojSIUSHsxdZpO+WhBkBjBE3YxQV99cpI48Sv6
         nQ855pvEKVZAFAnr0IVvM8tDDE3FE8nQHGujd9Z0FEciEZ5et6uR8wK3V1ieK3pUGy7Q
         bK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719029086; x=1719633886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lL3cYOy5cYINargx9VxFNfKzm+6SWFBJMbMZY1t3oSo=;
        b=ZVSr13+R8JK0LlPeYwobdY3uc3MDWrekbK1UylfGKfh6jSDCrUUvTSNlkanzYP7cgU
         V1GbCu6kGtlUbxOVeH6utQcvvAgDOoZV5im5rFwPTzdyBf+EscUA0Gv/gAsjyOakIVGh
         5s9F4d8FBTy9pD7G6JGRxG1rAxhBeANSRFfjvHyaG4AQiaPybVLhg1C+U5ONCVBRkR4B
         2I4WUbLtj6M9PTux/64xYQNgZkQ8yYaqSMN1QYLlnxAXsFK8lQM3sgri8ROxrB7burB1
         uyLT44si4KIWGc2FwCGfoIisGPVHCJPWmbqTawn265esKbKrqDpG22zWuutixdHXXI/K
         rXoA==
X-Gm-Message-State: AOJu0YzEJg8V0IHEJQmfRG6ngaCasqWXDd8VZqEVEzYDHBi4JUiXlDr5
	VXA0XcEldhtqtAXxzEtPGflD2sxGdEabu3VTWREcHg384CfNsZ18qeDgPXlwD0d3foikEEWOJDg
	wlqjZT4giEn9Ou5DuRfgV9MKhT67/yffHowE=
X-Google-Smtp-Source: AGHT+IEiI5ezlSd3YYXtBtKzsV0Z/xGk0+s/ItVVO9ZX7/jEHatQskKjrbuSS5ooGkEvqgSP5HHRTN9xmqeCJedaJ2c=
X-Received: by 2002:a05:6870:c088:b0:258:359f:6a95 with SMTP id
 586e51a60fabf-25c94d0790dmr10992962fac.38.1719029086031; Fri, 21 Jun 2024
 21:04:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALzsdVJ+Dy=z1JGur71CG-ZzoCH6nxbCuRBHVdOQ2bCgiOeutQ@mail.gmail.com>
 <2024062113-open-knoll-e452@gregkh> <CALzsdV+3xCVuC3oQaE4nCf3F6YAOZ1nyYywSzyUW9jiMDVUHAg@mail.gmail.com>
 <2024062124-dish-decade-c5b7@gregkh> <CALzsdV+J+99x55x7+cioKsBB9Qb76bV_1LFnd4QnuBDfMnsH0w@mail.gmail.com>
 <2024062104-pull-spearmint-068b@gregkh>
In-Reply-To: <2024062104-pull-spearmint-068b@gregkh>
From: minh quan le <minhquan07032001@gmail.com>
Date: Sat, 22 Jun 2024 04:04:34 +0700
Message-ID: <CALzsdVKfnOCorwE5WoHhEO+EXAVHuuTZ9Uig2GCBg_J1oYTitw@mail.gmail.com>
Subject: Re: Repo: linux-usb-gadgets / ptp-gadget
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Actually I don't know who exactly are the developers of that repo. As
the README of that repo, it said to contact the developers of that
software please write to the Linux USB mailing
list. I also did CC to the original author of DENX but it had a
failure: User doesn't exist: lg@denx.de.

Thanks,
Quan

V=C3=A0o Th 6, 21 thg 6, 2024 va=CC=80o lu=CC=81c 17:29 Greg KH
<gregkh@linuxfoundation.org> =C4=91=C3=A3 vi=E1=BA=BFt:
>
> On Fri, Jun 21, 2024 at 04:46:28PM +0700, minh quan le wrote:
> > Here is the repo link: https://github.com/linux-usb-gadgets/ptp-gadget
>
> Ah, interesting.  You might also want to cc: the developers involved as
> per the README of that page.
>
> good luck!
>
> greg k-h

