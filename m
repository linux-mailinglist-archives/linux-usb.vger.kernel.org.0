Return-Path: <linux-usb+bounces-5521-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5164783D168
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jan 2024 01:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80AC91C24305
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jan 2024 00:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA29B800;
	Fri, 26 Jan 2024 00:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RmvsWzwh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5F67F0
	for <linux-usb@vger.kernel.org>; Fri, 26 Jan 2024 00:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706228521; cv=none; b=iFid4A6vjbrCpVgv6tCPzWZf8je6km/kYWCfx2SqyPJWyS+dRvDcJaZIpCbt4FukDMW02CCijMC3+JoKicPf/cmluZDAHYhMSZwAeRYlC0OISZpkLclw7ljzxhs8umnalGCKtuCnNPd49RRuh2wzl+lLWM3tzFcpYyEB6aK53Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706228521; c=relaxed/simple;
	bh=QrCvh2bDVmQVhbZy1e0kGFeRP9qJbI85tKvDb1mTQrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGzdZfkSQTqSBD1/sc+QUOvWq2HyvfkHUyP9ha6chnvj5s8NZIUZ/uluCstaTyyToagejq8Fg6b6OXe5ekWie49Z7qgOxTPTE83rzSGnekrnBXMbg/KvJ2fCUxpJpg4S4FJp2pokKqN1XOarhF0UTPgdMPZQbHb3IrKRJ1NMiKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RmvsWzwh; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc261316b0dso5722844276.3
        for <linux-usb@vger.kernel.org>; Thu, 25 Jan 2024 16:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706228519; x=1706833319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrbGD9nhu09VbWmra4xDpvbma+oaLmacGCLBgklrSUo=;
        b=RmvsWzwhavUjq1AC+FKseIM5zk/ELvLlcuFnO/zFX043ilLWONPaoLLPF2FG3ZA+P1
         C5CZartLiVid1Te52NhZAz3PI1q8y8SZOcoBaCeq3AVSMdxemXZVeqHcKts7uEUv40lO
         AfnCFYxAUwxct+7kiH8QjMfR+kyDS0f2zlwX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706228519; x=1706833319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrbGD9nhu09VbWmra4xDpvbma+oaLmacGCLBgklrSUo=;
        b=aB4Eo/cHOBFLG33dw9Ri5wtONHeOc/KrFrUca3GLpDZgufaErUVurIP3iM8WYpkBng
         OyZADMsPfedMiW9b2oj9nSWUxtZOj/t8UZkH0xPPUD7AwBRvd/V+ho/OcTMS3vBEnmD3
         Peu5ihp3id1VuyVCC4DNDL1G5qVXpkuQNd6J9p/gKcUFPFM7o55Tnrst3llf3rvs5QM+
         LfJpLZlN2vvF6ykl4dowQrqbot/OFITmcbjAdwhG/jz/W2zOsia2xRa79ttngcO12PtE
         /tTTBl7Ys/Dq59E1QbU5P1DdZ2Mm45Q2m+8iJcYJGHMwIIo/LAr/4kWQ8nRx5/f0+Yyk
         zaBg==
X-Gm-Message-State: AOJu0Yxy4dedpkR6Qy7KyxB8yB1P1JbdcuIek+MyYu1IfyHmNJW2KJTF
	yTFqKBGchp98kH9ajhbnV7tVJtQ4aXU3a95aZd4IYLN8gzXchUoI0fJvCtkjdly3x1Xs/z5VXPP
	q0qXYtuTKBCE0nX0s3X2kZEidPeZyfg0v1jny
X-Google-Smtp-Source: AGHT+IEfeg2FKKJuV9m6qG4eLrGvQu+qOTRhRFjoZLik4/bWQ3prpv89FI6li2fQntezwSxka1dOBpSSL+KAcu9h9K8=
X-Received: by 2002:a25:f911:0:b0:dbf:67f0:efc5 with SMTP id
 q17-20020a25f911000000b00dbf67f0efc5mr518538ybe.119.1706228518825; Thu, 25
 Jan 2024 16:21:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125004456.575891-1-abhishekpandit@google.com>
 <20240124164443.v2.2.I3d909e3c9a200621e3034686f068a3307945fd87@changeid> <2024012512-haphazard-mobster-f566@gregkh>
In-Reply-To: <2024012512-haphazard-mobster-f566@gregkh>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Thu, 25 Jan 2024 16:21:47 -0800
Message-ID: <CANFp7mWzA5df9iFpCWFRpXuOP06yDmBehYDYNACjrW2fPvp_Ow@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] usb: typec: ucsi: Update connector cap and status
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@google.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	jthies@google.com, pmalani@chromium.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rajaram Regupathy <rajaram.regupathy@intel.com>, Saranya Gopal <saranya.gopal@intel.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 3:03=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jan 24, 2024 at 04:44:53PM -0800, Abhishek Pandit-Subedi wrote:
> > diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucs=
i.h
> > index bec920fa6b8a..94b373378f63 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.h
> > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > @@ -3,6 +3,7 @@
> >  #ifndef __DRIVER_USB_TYPEC_UCSI_H
> >  #define __DRIVER_USB_TYPEC_UCSI_H
> >
> > +#include <asm-generic/unaligned.h>
>
> Do you really need to include a asm/ include file?  This feels very
> wrong.

I didn't see any header in include/linux that already had these
unaligned access functions so I opted to include
asm-generic/unaligned.h. Is there a reason not to use an asm/ include
file?

>
> It's also in the wrong place, AND why "asm-generic"?  That also feels
> wrong.

asm-generic is definitely wrong; I misunderstood how these headers are
supposed to be used (should be just asm/unaligned.h).
For ordering, I took a look at some other files and it looks like
<asm/...> goes below the <linux/...> includes. This also probably
deserves documenting in the style guide.

>
> thanks,
>
> greg k-h

