Return-Path: <linux-usb+bounces-6767-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BF985B801
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 10:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C7B91F25F7C
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 09:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83519633F3;
	Tue, 20 Feb 2024 09:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lhMvpXN9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683EA6217F
	for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 09:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708422216; cv=none; b=juQ3z+B6NPh0YSTiRxrInjPRarMbUdmN2+SZTJFzU+up9vKJlKrCLN75JxO8RW7Fbx5CZkSZ2r88yajwp1rca8D0963rGx6n35oqMdGFk0pJVT9K7VCUFLoXxUvZXJE147oimAHdiX1WJ5YIa14F6L0+TCMF/2jXvWeCYdeg1II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708422216; c=relaxed/simple;
	bh=rlFKBjfxBfB5przc60p+qp81VvS1nj/vKLjjDNglv3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/Rnzze2Im/+7gPMgtxfaUowHwQvMym3euk+A5B3oBalhsiKSoSLPw63cMSqGOcUrLnUB4Yd4zuasiceehH+BeIi4+V9EzAxzjv2sjBP/AjHT8eFIsdFq65L4YiUkq88UCZbvAtAqbTN2A7elLJL1SRtkE3b0UxRGzC4zhcNOjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lhMvpXN9; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-563c0f13cabso6337223a12.3
        for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 01:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708422213; x=1709027013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wXGNSO7EAp4ThzIsFzmHN2w6lFZhp54XNCpapquw2M=;
        b=lhMvpXN904q2pks39RZqlAavJW8u9xVuxVNfmDwC0VRkR06xSxBTTOcx2TmUarqFOw
         n29uVI1hmLITquzoPhEO7VBmWTKO/iWJgzxkpJ6R8JUU0OPq6fVsuY1nRTL047tONHdj
         YxSo+arbnPZxqXm8fn79pXozFqIV7zoZwJc6uRIuLggcZmmzo2lruNee7VgS7r3nWh1H
         C3OEn3+EXha5AdDMtvirEUAf1JyYTjbnHFFtkaewLNamlU+UWsZmeRP4DbrN+JFwmCRy
         Wm1hMSAMefS1I/wjZXERJhqnapVlX9I2MwJ06AvkQwZsku8CHo2TLXPqKsbu46FAgfzI
         H/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708422213; x=1709027013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wXGNSO7EAp4ThzIsFzmHN2w6lFZhp54XNCpapquw2M=;
        b=hwmOiyYoDB29s8r/kmd8RJTR8d7qAMtbLmAdl0Hn1JT8Zu7eLPVYtCb8NUvcbY4XbH
         zkfYAM+cVB7TaGIzZiMjZGclkvwk2seMXW4QukEDixiHrX/WaHgqEGbtT+/kuReAhBT6
         PHHmmDIP6wT6wz3YzcYRIcGXXCYzxntfaySkDeEU5mUTvxAQSUeODwgH0GMmphFT96hY
         zofB6rJ2URR9TDO5wloSCXdjz50LK2I9+sbvSUDJA2sBHRvhW/urxJpjgFSTJ/I2y2iD
         xSyO2EBUPx6EjwZcMUjj+wKTKK2sdJucxniiGKT3NgvKpVibANmKwo7JiUJwBp2AF+P0
         U6Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUM7RIWqzrrlCzrA/JG/Z0P2WatUshtAPIMJRhizIWyYW9u1k8wMIckM+AbOkhP+Vj89wBFqnzT56Yd274ZR1g50hCVBZRk6cxY
X-Gm-Message-State: AOJu0YxrXNezCIw8bF2T7lYBjrfwo8rpXX0dQ4CUZYnL3MmYZg8xw0SL
	BMLClgIQ+5YOF1OzZ0vANm6hi+VsdbwvWM0zOBUeXvH/9Z1O3LYCbvbt3Us+Ws98uqLQoFapZ9p
	pamFB3aehdc5rLpz26nAIrXkuGOcLjJ3X7XAi
X-Google-Smtp-Source: AGHT+IGo8bMi1ufIugwBQxJ09WQnYJlAWn1e8eQOJeCgyp5JhtuInq+rAAuyt68+BhpUHU0p7WmO3Bz0UMzJA8+aWuo=
X-Received: by 2002:a05:6402:3588:b0:564:762c:fe5e with SMTP id
 y8-20020a056402358800b00564762cfe5emr3859938edc.20.1708422212502; Tue, 20 Feb
 2024 01:43:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220081205.135063-1-raychi@google.com> <2024022024-trout-kennel-6d14@gregkh>
 <4d62d4d0-3f28-486b-8132-4cc571b6f721@quicinc.com>
In-Reply-To: <4d62d4d0-3f28-486b-8132-4cc571b6f721@quicinc.com>
From: Ray Chi <raychi@google.com>
Date: Tue, 20 Feb 2024 17:42:56 +0800
Message-ID: <CAPBYUsD=3ux8RXgRcroVsmpqNs0D+2NeLhqPHh3TBB_oq=ziXA@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: gadget: remove warning during kernel boot
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Thinh.Nguyen@synopsys.com, 
	quic_uaggarwa@quicinc.com, albertccwang@google.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krishna,

I verified the Thinh's patch and the warning could be
fixed. Thanks for the information.

Regards,
Ray

On Tue, Feb 20, 2024 at 4:40=E2=80=AFPM Krishna Kurapati PSSNV
<quic_kriskura@quicinc.com> wrote:
>
>
>
> On 2/20/2024 2:04 PM, Greg KH wrote:
> > On Tue, Feb 20, 2024 at 04:12:04PM +0800, Ray Chi wrote:
> >> The dwc3->gadget_driver is not initialized during the dwc3 probe
> >> process. This leads to a warning when the runtime power management (PM=
)
> >> attempts to suspend the gadget using dwc3_gadget_suspend().
> >
> > What type of warning happens?
> >
> >> This patch adds a check to prevent the warning.
> >>
> >> Cc: stable@vger.kernel.org
> >> Fixes: 61a348857e86 ("usb: dwc3: gadget: Fix NULL pointer dereference =
in dwc3_gadget_suspend")
> >> Signed-off-by: Ray Chi <raychi@google.com>
> >> ---
> >>   drivers/usb/dwc3/gadget.c | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> >> index 28f49400f3e8..de987cffe1ec 100644
> >> --- a/drivers/usb/dwc3/gadget.c
> >> +++ b/drivers/usb/dwc3/gadget.c
> >> @@ -4708,6 +4708,9 @@ int dwc3_gadget_suspend(struct dwc3 *dwc)
> >>      unsigned long flags;
> >>      int ret;
> >>
> >> +    if (!dwc->gadget_driver)
> >> +            return 0;
> >> +
> >
> > This directly reverts part of the commit you say this fixes, are you
> > SURE about this?  Why?
> >
>
> Hi Ray,
>
> Thinh sent a patch recently addressing the issue in soft disconnect.
> Can you check if it helps:
>
> https://lore.kernel.org/all/e3be9b929934e0680a6f4b8f6eb11b18ae9c7e07.1708=
043922.git.Thinh.Nguyen@synopsys.com/
>
> Regards,
> Krishna,

