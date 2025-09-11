Return-Path: <linux-usb+bounces-27964-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C70B5362C
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 16:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8044A1882893
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 14:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619CD345722;
	Thu, 11 Sep 2025 14:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="So7B1T1C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014E434AB17
	for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757601971; cv=none; b=FEO9GL8/TiAQs0XWPVyFr77NXcz9MdlJzwpJZ/PAYS6y5xfd6r7H6vR2S8LAp24eSbwhqFFVKbLEUdcL3jM1HU5TJsG/6VrtRsNC4CmvBU7h+EBoTvjhLtzUmJcwSdQyKHZAtT7g2GKww+0LC8LwgzUlvBhXQ5wQV57/z1jR3Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757601971; c=relaxed/simple;
	bh=VKSX47Aju/DzSJYwp5bYidhSzFn8zeiXLyG/eQpEZMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ECoc27IEyOHEGo0ayRrAp/8bASpLO0wSTeTMfvjxRuueHjuUn0nUOXjM7brQAuLJR3RDzSVWPRlXHH+i0ce00gG1nef4iewp9VJKKm+MLmF5safCoQ3/X2+n9z8fkWpVwZo77MpfD6lOfxUQnF6hfP3V8LISDgJxBlIxRrcnADQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=So7B1T1C; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e96dc26dfa2so633405276.1
        for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 07:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757601968; x=1758206768; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HG5KODUu0GjbUdNiiv9Xwk+9exlrDUpck0LIesxLbE4=;
        b=So7B1T1CKaqLnhHiPP/+1FWFEu/6R4m7Mbj5/xzn1SE6S1xslf7Jhr9oBemetkknbf
         mUV3o0erG1SIkW5Y/MHYT37UHVGW3TE8CRVYfHVeXOwP7SUKwqDjqaF1dYNVNvSWf/UK
         nOtD5PhR0U4xC4G9+92USMeC3V1YD4gVCmT607p+HM1gVGaVv8wXB1lXiJtpLF/8CfrP
         Pu6Ppe0MHyPMWyzVa42Wq2h31rTVK8pl4mAtAiBNaHZ7BGqo3YE54ygZOfTRArfKMoXS
         bKZhZWJqVKRFIpJG4wYe0kGjldN4WcENcRo+No/axwP/KWnYRLnZAC1J/7GbpdJWi7MG
         znvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757601968; x=1758206768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HG5KODUu0GjbUdNiiv9Xwk+9exlrDUpck0LIesxLbE4=;
        b=dVOeCTJQM6mIKsEOGVaPAfnzmpXaYVCJuKdtmHflL6jwABKGPY/fJ5v7fPoUCDzcV8
         e5kHNqRU+qLwo1DEaRJ1MlwAJ/zb046zbn4/XrKqZ2ve80lAvuN+9S2xmSZQZ5yXbgOi
         ptfFwVV7BbribJLznOFWh+1+bq1xtiPfO1fP1o5I/j/Z+mzXrLSDs8S5b/sVpyLAT7D1
         MdsBVjvtMkRath7K0vWthairk2vXXPXX0cCBOBxJNM2SW5gQdgnJeB741yMWakwNvHKq
         HCrOIhjT7hLAaQXpqVF1i2K7puSIaVXb8bRhu+L3Nc9MaTW1apnPXJO58dJEeM7GxklT
         /qcw==
X-Forwarded-Encrypted: i=1; AJvYcCVw/u/AbK7FpVE+OmrXzDhou9I6uCXuWRewl46lV5K+dFLeJBk380f4JGloa+McRdD8rz8GsCwL1Es=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDYtHhFvSYEipUcmIu929TX/VMRxEC3hx3SoLsbvIVvRY6X0HH
	oqHcWCG6M/iBxG+ubYRvLDDgSDlZHh4x5aLJ+P1C3mzDUtdU65hQ2u1izR9OX6w7MMnbC7gUsTi
	c9qLRCx1VdQtm6gxWbIGq/K8hVOIl4cDwEqVOwHmLIg==
X-Gm-Gg: ASbGncscksOp8A23RFGnf54q91r4mqv5FEUtMD2xeHwhIhMLzzdF8vH3CA5PQ/sXmvj
	+bpNbet8aFgjEay3O82vhYNCGZ1FVLHnfLSv9dW7AxDS6I1rgftWuiiypaUWk4NO8Qwqd7tfyxd
	ZVQXxeOEF5YrQuHTf/7ePJVivSaHqpGJVcd2y7wi9KtNHFtvr3QeXfQyBzpK6kDaNBVOXUBtfKv
	/KbDVYdobvs3scJB8Qo6UteFfS0BQ==
X-Google-Smtp-Source: AGHT+IGA14KLSVMCK2zV6p8As0+Jn95rbWVq+KPV+CqkNJxyiiFOFLcSxRvo/0exdQaaGDHMXMlIe6ixp4mKa1e9IQY=
X-Received: by 2002:a05:6902:1892:b0:ea3:d40a:2563 with SMTP id
 3f1490d57ef6-ea3d40a2737mr1177746276.41.1757601967783; Thu, 11 Sep 2025
 07:46:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-pm-v3-0-ffadbb454cdc@nxp.com>
In-Reply-To: <20250902-pm-v3-0-ffadbb454cdc@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 11 Sep 2025 16:45:31 +0200
X-Gm-Features: Ac12FXy4zlU7KeT4OFE-vyI1bqh6ZB1528BpXJl_SwXQzUbCOw7DO0NcEvUZLJA
Message-ID: <CAPDyKFqBJQ92HH1tSq1rfbXV1OwbyvgChyHfv7ykJqf2A6qYpw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] pmdomain: core: Introduce device_set/get_out_band_wakeup
 and use it in usb
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Xu Yang <xu.yang_2@nxp.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Sept 2025 at 05:33, Peng Fan <peng.fan@nxp.com> wrote:
>
> This is pick up of [1] which does not have response in about 5 months.

Sorry, I have planned to have a look at this, but just never got to it.

> This V2 patchset
> - includes usb driver changes(patch 2,3) to give people a full picture on how it is used.
> - Rebased next-20250729 to resolve conflicts
>
> To i.MX95, USB2 and USB3 are in HSIOMIX, but there is always on logic
> to make USB2 and USB3 has wakeup capability when HSIOMIX power domain
> is in off state. Otherwise the HSIOMIX will be kept on when
> USB2 and USB3 are configured to be wakeup source and Linux suspended.
> With this patchset, HSIOMIX could be powered off and Linux could still
> be woke up by USB hotplug event.
>
> Patch 1 introduces device_set/get_out_band_wakeup
> Patch 2 and 3 are drivers changes to use device_set_out_band_wakeup
>
> [1]https://lore.kernel.org/linux-pm/20250311083239.3336439-1-peng.fan@oss.nxp.com/
>
> More old discussions:
> https://lore.kernel.org/linux-pm/20250311083239.3336439-1-peng.fan@oss.nxp.com/
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Overall I think the series looks nice, but I will make some more
thinking of this in the next few days and come back with some proper
comments, at latest in the middle of next week.

Kind regards
Uffe

> ---
> Changes in v3:
> - Add a new patch from Xu Yang to detach power domain for ci hdrc
> - Add A-b for patch 4
> - Link to v2: https://lore.kernel.org/r/20250801-pm-v2-0-97c8fb2a433c@nxp.com
>
> ---
> Peng Fan (3):
>       pmdomain: core: Introduce device_set/get_out_band_wakeup()
>       usb: chipidea: ci_hdrc_imx: Set out of band wakeup for i.MX95
>       usb: dwc3: imx8mp: Set out of band wakeup for i.MX95
>
> Xu Yang (1):
>       usb: chipidea: core: detach power domain for ci_hdrc platform device
>
>  drivers/pmdomain/core.c            |  6 ++++--
>  drivers/usb/chipidea/ci_hdrc_imx.c |  8 ++++++++
>  drivers/usb/chipidea/core.c        |  3 +++
>  drivers/usb/dwc3/dwc3-imx8mp.c     |  4 ++++
>  include/linux/pm.h                 |  1 +
>  include/linux/pm_wakeup.h          | 17 +++++++++++++++++
>  include/linux/usb/chipidea.h       |  1 +
>  7 files changed, 38 insertions(+), 2 deletions(-)
> ---
> base-commit: 1b09efec32046a9c78cfecc46a26b1b139a3e8a8
> change-id: 20250729-pm-243ff7097e44
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>

