Return-Path: <linux-usb+bounces-7470-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E779486FEFC
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 11:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2E1D2832F5
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 10:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F82222F08;
	Mon,  4 Mar 2024 10:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aWdKqM0j"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F48224F9
	for <linux-usb@vger.kernel.org>; Mon,  4 Mar 2024 10:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709547898; cv=none; b=vF9iolPucbbatggVI3aGWmAiH825RJ8UsY2ulABWfx0ytqoPAXtGlt0g+AHZT8ZLDFo2qbfMzbgLwfjkopHFYi56DLOtUJ3kMDPpVcZcsf33q6NENteYA4sW/mWq8lUNbC+WGT3sbX/q1/qybr1PiPK88yUHYl/GIPrsvz2VDpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709547898; c=relaxed/simple;
	bh=B/p9C/j+Ad9n8/+/6/pEpIkJ0VSlGvhLs4GQUeDwZIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUL/RvTFplw5NSr2b38ygSXMuYJKPz88ShElggQcj/uBm+uPafS7GZ1/0qV/W/86QcM91V4msW6ybNoqOeKfjS1FF6TwG0cStriamMY8PL1l6bMbHhZZGuYcJloA46aFKSp9jqPXIUy/qt0U9l3nrbHKuAYKj4h8NU3q4/SvDDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aWdKqM0j; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-608a21f1cbcso28493387b3.0
        for <linux-usb@vger.kernel.org>; Mon, 04 Mar 2024 02:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709547896; x=1710152696; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5MvLLiHKy+7g4m0EQRZXmKZVCgjWHjYHDhw5XRYe9JM=;
        b=aWdKqM0jNwgdoz7BQTJbEAMhDwybCb8S3UokcTl0ExyMLWDlh6UVHnCBvy3ouypN0S
         /RTa/sEpDMLIwLXkUriPpMLT64nASCCvukcUytySRKcJXr1iSiBKwJF8oppsK5EEXRK9
         sv385nSIvV5kFhhpMRRWIRQD8enJCz9tfnynMseqjA/CyrjGTBhs8ntfsCckACKmwMuj
         3xZVKEQAuc5eWa0QbNJpzpQLxdObBuA9uyP13psQY3Ev49WWhKK0LqaMoYz7/yj+pl8D
         FbfnPZpZXic0RASz3/d0e0mtckC4kmUjJuD7sIF7ZOIqKDD9n39ihdqmXNGhL58Lm8zj
         izEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709547896; x=1710152696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5MvLLiHKy+7g4m0EQRZXmKZVCgjWHjYHDhw5XRYe9JM=;
        b=PuEFEiuP6wC3gkJrs5kkuoxJMTBLIuoV5XLu3XwOezLQGT4/fgvU5g+/8fJDe89WOb
         PkReoE0LJ8LP10LDUlHOgFxQjA5YX+ljRZU52itLKfnAZHZXz63ZRG7GwuGB5AOHz+gA
         ZqrPSqGPQ4/r7jAFHyWpOkh27keS9Xq/j42nLEXoTD/uLSN0Rbfp2M8VRbwLlzM1Ql56
         Qir4QuZup8PghU7DfcgJLAtCiEwOL8NT3KgM97XLcyIGsiFSTXosO48u5FswewClIX8O
         InzMHOYi19l3GAOWm8P5WU0v2q3+YYVfuG76J8uyZgBvL0SuGt9ji1oq+IcTBcUJBZVV
         7rYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDZA77sxj0SkeHNXB156+Ps0AhKKfZpqOh7CjeAIDxHAImoTtfccdaZQkc/G4/HBM5mC/+IGAxG9etNJD355lcbkg2OWEweebg
X-Gm-Message-State: AOJu0YzdBpbZNA+Kapajwa9atygYXdg7Y1x3wmTyuZoc+OX5lyeAjnOu
	7wk3WY4OI9vdAOa/HRpRDhVd1PPSO5reP4qhVdWLF+xDyT/l4cyzkl2OHOpQRa/d+CRHe9hD8Le
	sgoh/ZzurC5dceFJ01ZKa3hWJKuGGwK/jhtDJqBcDDH8LO5N2dTXsBw==
X-Google-Smtp-Source: AGHT+IHeJ2eLw4BVw7Jt2jcC9lyLDaioLDtXDPZBlMbV/W5XEb0laPQ/T9UXMRYekhs6WmzEEvWDsP2x6CTAI2UYGi4=
X-Received: by 2002:a05:690c:f90:b0:607:fbb6:8be2 with SMTP id
 df16-20020a05690c0f9000b00607fbb68be2mr9509835ywb.47.1709547896129; Mon, 04
 Mar 2024 02:24:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240304-pm4125-typec-v4-0-f3601a16f9ea@linaro.org>
 <2024030414-stark-service-ce78@gregkh> <CAA8EJpoCm+jqMsd6=pnpd+cCtqLYnMWLmrNQgjiyhi7ugeUjvA@mail.gmail.com>
 <2024030456-felt-tip-frequency-f8b9@gregkh>
In-Reply-To: <2024030456-felt-tip-frequency-f8b9@gregkh>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Mar 2024 12:24:44 +0200
Message-ID: <CAA8EJpq1VBA25kc1SLzb+R5MZDGzhqUqmG-nxUN9NmMK3RB=3w@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] arm64: dts: qcom: qrb2210-rb1: enable Type-C support
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Mar 2024 at 12:09, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Mar 04, 2024 at 11:51:27AM +0200, Dmitry Baryshkov wrote:
> > On Mon, 4 Mar 2024 at 11:49, Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, Mar 04, 2024 at 11:26:09AM +0200, Dmitry Baryshkov wrote:
> > > > Reuse Type-C support implemented for the PMI632 PMIC (found on Qualcomm
> > > > Robotics RB2 platform) and implement Type-C handling for the Qualcomm
> > > > Robotics RB1 platform.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > Patch 1 added, 2 did not apply to my tree :(
> >
> > Thank you!
> > Yes, patch 2 should go through arm-soc.
>
> Having patch series where each one goes to a different tree makes it
> really hard for maintainers to know what to do, and our tools want to
> take a whole series, not individual ones.  Next time perhaps split it
> up?

Ack, I'll keep this in mind when submitting series against usb-next.
I have always been on the other side, because splitting the series
makes the life of the reviewers and testers harder. With single series
I can review, apply and test it as a whole item. With the feature
being split, I have to collect all the driver changes and also the DT
changes to be able to evaluate whether the approach is sensible or
not.

-- 
With best wishes
Dmitry

