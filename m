Return-Path: <linux-usb+bounces-5917-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1E884B038
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 09:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF9D2B23E49
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 08:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669A812D162;
	Tue,  6 Feb 2024 08:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ct37zu3U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCB412D150
	for <linux-usb@vger.kernel.org>; Tue,  6 Feb 2024 08:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707209052; cv=none; b=RdFIG2EauEWw9UCCb/HpNYLdsQQq+P6MQYbuKwO7pm9mQWBooxHJOksrCcD1WODQieemtcf4gluAkk6h01g3WoKMiDC46RR0800a5HsHlNCPkcOSF9VD3+gJiKvebH6x43pyi7tyHz4XM7ci6flEEMX8f+DG3oivJ1lmgGqbDWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707209052; c=relaxed/simple;
	bh=FqCTwk7sUruwzRaqSXCYnXyGYcQjWZ8am86nQvU4LWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIOYkElnh30pZFl2C+KQ5Aqe7GjnDRDPed5A8uzGlh2zS+ME/aViD5nJnSIzJNtHgto1yVJX1n5XTXVLGo//fJBYjtV0mjKeX5Ni8mB/9ORLTA75p9qlt+oHVeb1/APBWOVoDimDpXSluoWNBIT9rtUlh/r00yN/+V/en88+KeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ct37zu3U; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60460399a33so17365537b3.1
        for <linux-usb@vger.kernel.org>; Tue, 06 Feb 2024 00:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707209049; x=1707813849; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9hLaUYbbeJoWGCaeZiJdH6jtkwWlEbZlGqXl0b29hVg=;
        b=ct37zu3UT8Yi/o4nWabm99gIXob+vTWEM6y73ADJetKsJUTrzWc9RmMz1YkWugABcK
         GqRhpSnBpM296qroDaXMfDgj4JOtCGYiFxP5IBKQyLhBtjIEFOBZX7PCKOeFKm61MgpS
         YSUlyeHFg9JR7dqQHiyJsSA6fe4SATf1fNp5KSq5I9VAfJ995aNWdbqNTbHNilwVKxqm
         ckAadA8YdSSkPVyALTDQhVZSr1e0IrUa8pEH3p7nX8vkgZsBWJHOQVbqq+yGfCwjDAV9
         tgT2aJImiQOjYSv6JGfVI8lQH7lUm1sfAmFvhwVJrOmLTFoIrtJR/gPzWSmm/aYkjZrZ
         /Sow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707209049; x=1707813849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hLaUYbbeJoWGCaeZiJdH6jtkwWlEbZlGqXl0b29hVg=;
        b=qycrEj0nOFOAx0guwe9HSsYdLCMKO8rmto3iVbIWYcd7ZgmjyEK1e3fH/19joAl1+B
         9Y3ikWaUNc0LoEvirRLmwWCsq2ob3i1TvZgREfZ47hIpY75Y2KRbsa17Hf0MYuTW6BAL
         1/5KDvFxSMXbh/ZQcEzcXmZ//ufEgbUVDxGPoODuyZLp4DUVCNgS5ULvsZnsGmx0RKGN
         3e8tN1j0i0xAAoEL74spZZoa+WDx6RWjZ811b+9pcP7khaNn5w7ypdH/w4E3fYjoDfn0
         lPh+ICHK/aqKxRYSHMf2L55Bdgtl6v4q3SDBrSqF6ynT8EW370EdG6Z3AD9rHqGkTBYN
         mlKQ==
X-Gm-Message-State: AOJu0YyUOzx030a5XdZMgYtlVS2dwfGn+0dbb0lFoFC8AWgspPSqzbI+
	XZFOAPp/9Ug8W+Q46yjQtRaiZ6MCsiNr6L3BdLk1Y0ZafESmz1xDxzb+W822fMaHwJq+J5X02Ia
	oFFpvgLoYQkUWaO3RerYaK9+EJZgTqkyz3LcQfg==
X-Google-Smtp-Source: AGHT+IGTGZcLSeglFHkvH5zeBcQSlSITFA1O7mAZqAecZPLBCHT3Mp+qSSYJ1MPR4Sk1dvdg5amM4UhgKmpJ/wfZHSw=
X-Received: by 2002:a25:ade3:0:b0:dc7:1ab6:6aca with SMTP id
 d35-20020a25ade3000000b00dc71ab66acamr841976ybe.63.1707209049260; Tue, 06 Feb
 2024 00:44:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206051825.1038685-1-quic_kriskura@quicinc.com>
 <CAA8EJpopE91TSCkworWts82tcD_6PLgLmes_FhVhnUovmQWz_w@mail.gmail.com> <f86cb527-3f91-4961-bbd5-4dc0e9a42df7@quicinc.com>
In-Reply-To: <f86cb527-3f91-4961-bbd5-4dc0e9a42df7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 6 Feb 2024 10:43:58 +0200
Message-ID: <CAA8EJpqWt6a5mHcSyYKkEGu_nZ7vn5gjok07kSNe7mVzDE7gRA@mail.gmail.com>
Subject: Re: [PATCH v14 0/9] Add multiport support for DWC3 controllers
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_ppratap@quicinc.com, 
	quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Feb 2024 at 10:15, Krishna Kurapati PSSNV
<quic_kriskura@quicinc.com> wrote:
>
>
>
> On 2/6/2024 1:30 PM, Dmitry Baryshkov wrote:
> > Hi Krishna,
> >
> > On Tue, 6 Feb 2024 at 07:18, Krishna Kurapati <quic_kriskura@quicinc.com> wrote:
> >>
> >> Currently the DWC3 driver supports only single port controller which
> >> requires at most two PHYs ie HS and SS PHYs. There are SoCs that has
> >> DWC3 controller with multiple ports that can operate in host mode.
> >> Some of the port supports both SS+HS and other port supports only HS
> >> mode.
> >>
> >> This change primarily refactors the Phy logic in core driver to allow
> >> multiport support with Generic Phy's.
> >>
> >> Changes have been tested on  QCOM SoC SA8295P which has 4 ports (2
> >> are HS+SS capable and 2 are HS only capable).
> >
> > Thank you for your patches! Have you tested how this patchset
> > interacts with the USB role-switching?
> >
> > I'm asking because it might be easier to define DT nodes for each of
> > USB ports, which can carry the PHY properties (and also other DT
> > properties if that's required, e.g. the ports / endpoints and
> > usb-role-switch) rather than pushing all USB PHY links to the root DT
> > node.
> >
>
> Hi Dmitry,
>
>   Role switching doesn't work for Multiport controller as it is host
> only capable. I don't think it will cause any issues for OTG capable
> controllers because they only have one HS and SS phy present. So there
> is no possibility or requirement for having endpoints per port in this case.

Is it going to remain host-only in future?



--
With best wishes
Dmitry

