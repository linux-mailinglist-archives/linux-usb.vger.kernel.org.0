Return-Path: <linux-usb+bounces-18983-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BFCA0184C
	for <lists+linux-usb@lfdr.de>; Sun,  5 Jan 2025 07:32:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21B8C3A315F
	for <lists+linux-usb@lfdr.de>; Sun,  5 Jan 2025 06:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BA8824A0;
	Sun,  5 Jan 2025 06:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NNqDAfoh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070951D6AA
	for <linux-usb@vger.kernel.org>; Sun,  5 Jan 2025 06:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736058730; cv=none; b=R6ydJlGX9y41GPin4slIetxmWO1T8xKkV7S67OGrMXxfzOKePUI5exDslvIGwfovYzEygfwOfEOsGKaA2BoIFeLulB+8OhcU6Jr4qh2UMsZKraBunSNpNf+iiC+50jIp/wOKplMW8blubTvpvXz6vljCA7hpVCQbRS5X+WLrk2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736058730; c=relaxed/simple;
	bh=inqwIYNvE/bDvKYCQtclKIDsFywu/mNS/rlq7MiWh60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/VJW2fu5OxuM16I/4xiD1wphsH5Ebgs1lierdJkETBHBN0YL/a7Fx7E0yh7SEoQ1t8Fc8yqgyjOCdJ8QRKmhkVlot8nmL5XR2ozpOzV5jdp+FAO9UuqSskwoXHz5OvvX0UYf6I2LIWLihcZtccNZHRbFg4GpB9/BojEFDZa8I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NNqDAfoh; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e4419a47887so16601955276.0
        for <linux-usb@vger.kernel.org>; Sat, 04 Jan 2025 22:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736058727; x=1736663527; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHDoOfC1VmfF2pR3RKucTthjGLxFK5Dzv+J7tjqfC7Q=;
        b=NNqDAfohH2UnuRalUhVcADupl8e9mtkBKA3mmOkqPnq/gNd5UXx4CkSI186gUjQkcQ
         Z0EECK/oMeiamVlPBmJRK7FESuUUmuGod6onuTVRXAKS/VOhmEm6PrhDjqgFlJ5w5yM2
         o6Hsm70O8qtohj6+SPEsm0YDxLpusl3TKgYPw/FJP5r4YB5idmi4Q5F4SeFUUnu+xtXe
         QHxgGrqCl4rP5lHd2sAYhnyxrN0DX4yjjbjeQ2HZu+ChBzkwUFqjGTc59r3jRPSXSk9o
         tu/Myx1ZB3MW5Uu/lHOQmXrRjM+NBR6sG3HZgdiX8nnq3cAGXTarJrZ24mM6VPLHpTQz
         SdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736058727; x=1736663527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHDoOfC1VmfF2pR3RKucTthjGLxFK5Dzv+J7tjqfC7Q=;
        b=bnd4rN+BXOygiOYR2hisRquRatuKRIj8nB9/8nCMPAeXsdZUna731WqjQa+kpEvkfz
         2EVU6DSm/v+cvWV5xL79B45BMj9hA8u3RQBr61kV6lt/PRqJ0K7uexfKpdJhpsEEISKr
         m3iY5tmxgPl6NU3FEOvnesGsPt4GKDgIHraq2E0xFvFOOmj0P9RGzmK3Tfcet35GaBUs
         w8tUz+8JSGjrztM0s3vxZonUkwfun7Zf6T15AaMDaV4jYCn3hWcsjMhHUMwUcvTXGVW6
         N/rRIZSJRduvnVMbEcY4Lf46/mBFHmFCDfnP8FTp375jF9KZ/rvnQ4edwXRyqiqOrN4T
         IiQw==
X-Forwarded-Encrypted: i=1; AJvYcCXbs/tc2Kv6c+ZVkGEtop5aEbSgP3t/xj1jy07oEAOBGEI+EiBszvXCk1BQLgIP7ca9yN06LQf4Z+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPP+R9zKO+rtIMs7anar3AmHQVfDc/v/EbrpppUOaEoau9dST6
	dtK5+do7FESjKORQiBd7xbUrOggcbjC5QRCF+xXtbpoxS+fL+nomd6oekzAVJf+yUBKxJ/sgLc/
	2YmH1gfdVw9H8xJDDWrDe0bywKbZIX7EZe0Y20A==
X-Gm-Gg: ASbGncvH8TlXCWjU5hX+3zfjTdY6SQ76jk5EVKrRQwhJsUpG8SPnHodH0WJkgWvYv8x
	C0gMNZ5b9+/YKSfqSwZ1wzcS4rttLsnQ7qGQRmA==
X-Google-Smtp-Source: AGHT+IFqMbMAD7FjoPpN7HVTLNJ9M41VkwOZpEwD0bw24qHdqdqsb5AFPaDX4n5Nj7PFsGgD9miYfAAoIrdB+bzcDRM=
X-Received: by 2002:a05:690c:6e05:b0:6ef:7d51:ebb9 with SMTP id
 00721157ae682-6f3f8201373mr423076607b3.34.1736058726997; Sat, 04 Jan 2025
 22:32:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241222105239.2618-1-joswang1221@gmail.com> <20241222105239.2618-2-joswang1221@gmail.com>
 <exu4kkmysquqfygz4gk26kfzediyqmq3wsxvu5ro454mi4fgyp@gr44ymyyxmng> <CAMtoTm2X+aQRpSbNPjw+b+TsYfYT3h6yx2ycXYwfQbcinrwyPQ@mail.gmail.com>
In-Reply-To: <CAMtoTm2X+aQRpSbNPjw+b+TsYfYT3h6yx2ycXYwfQbcinrwyPQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 5 Jan 2025 08:31:56 +0200
Message-ID: <CAA8EJpp06-r9ODvk1dDoH2LwT32BW_uhnkDU9SEeaC35V8Wx1A@mail.gmail.com>
Subject: Re: [PATCH v2, 2/2] usb: typec: tcpm: fix the sender response time issue
To: Jos Wang <joswang1221@gmail.com>
Cc: heikki.krogerus@linux.intel.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	rdbabiera@google.com, Jos Wang <joswang@lenovo.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 5 Jan 2025 at 04:51, Jos Wang <joswang1221@gmail.com> wrote:
>
> On Sun, Dec 22, 2024 at 9:14=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Sun, Dec 22, 2024 at 06:52:39PM +0800, joswang wrote:
> > > From: Jos Wang <joswang@lenovo.com>
> > >
> > > According to the USB PD3 CTS specification
> > > (https://usb.org/document-library/
> > > usb-power-delivery-compliance-test-specification-0/
> > > USB_PD3_CTS_Q4_2024_OR.zip), the requirements for
> > > tSenderResponse are different in PD2 and PD3 modes, see
> > > Table 19 Timing Table & Calculations. For PD2 mode, the
> > > tSenderResponse min 24ms and max 30ms; for PD3 mode, the
> > > tSenderResponse min 27ms and max 33ms.
> > >
> > > For the "TEST.PD.PROT.SRC.2 Get_Source_Cap No Request" test
> > > item, after receiving the Source_Capabilities Message sent by
> > > the UUT, the tester deliberately does not send a Request Message
> > > in order to force the SenderResponse timer on the Source UUT to
> > > timeout. The Tester checks that a Hard Reset is detected between
> > > tSenderResponse min and max=EF=BC=8Cthe delay is between the last bit=
 of
> > > the GoodCRC Message EOP has been sent and the first bit of Hard
> > > Reset SOP has been received. The current code does not distinguish
> > > between PD2 and PD3 modes, and tSenderResponse defaults to 60ms.
> > > This will cause this test item and the following tests to fail:
> > > TEST.PD.PROT.SRC3.2 SenderResponseTimer Timeout
> > > TEST.PD.PROT.SNK.6 SenderResponseTimer Timeout
> > >
> > > Considering factors such as SOC performance, i2c rate, and the speed
> > > of PD chip sending data, "pd2-sender-response-time-ms" and
> > > "pd3-sender-response-time-ms" DT time properties are added to allow
> > > users to define platform timing. For values that have not been
> > > explicitly defined in DT using this property, a default value of 27ms
> > > for PD2 tSenderResponse and 30ms for PD3 tSenderResponse is set.
> >
> > You have several different changes squashed into the same commit:
> > - Change the timeout from 60 ms to 27-30 ms (I'd recommend using 27 ms
> >   as it fits both 24-30 ms and 27-33 ms ranges,
> > - Make timeout depend on the PD version,
> > - Make timeouts configurable via DT.
> >
> > Only the first item is a fix per se and only that change should be
> > considered for backporting. Please unsquash your changes into logical
> > commits.  Theoretically the second change can be thought about as a par=
t
> > of the third change (making timeouts configurable) or of the fist chang=
e
> > (fix the timeout to follow the standard), but I'd suggest having three
> > separate commits.
> >
> The patch is divided into patch1 (fix the timeout to follow the
> standard), patch2 (Make timeout depend on the PD version)
> and patch3 (Make timeouts configurable via DT). Do you suggest that
> these three patches should be submitted as
> V3 version, or patch1 and patch2 should be submitted separately?
> Please help to confirm, thank you.

Single series should be fine.

>
> > >
> > > Fixes: 2eadc33f40d4 ("typec: tcpm: Add core support for sink side PPS=
")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Jos Wang <joswang@lenovo.com>
> > > ---
> > > v1 -> v2:
> > > - modify the commit message
> > > - patch 1/2 and patch 2/2 are placed in the same thread
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry

