Return-Path: <linux-usb+bounces-7617-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7449A874017
	for <lists+linux-usb@lfdr.de>; Wed,  6 Mar 2024 20:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE125B20EA8
	for <lists+linux-usb@lfdr.de>; Wed,  6 Mar 2024 19:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08C913EFE8;
	Wed,  6 Mar 2024 19:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nU3fX5Tu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB823487AE
	for <linux-usb@vger.kernel.org>; Wed,  6 Mar 2024 19:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709751916; cv=none; b=e9flam9Dxrm/rpQzqO3sKs2EjyanclTW26aj5vCGEx0m40KtQ+3aZMjyfYWlsdjpwdfyqwenvZSxfHFfGDPAAXU6NXiYUWAI4oIxK+nYSmus+An7EabndgUVgXIR2BYA5FY+SrDd4ZZd/DR4/XGW/9JWQPXOeBAaO4vQ+NpkY9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709751916; c=relaxed/simple;
	bh=mHLju7qL93F2u968OifIn91fsuAol3MDudKqWQKxROc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWbOHxJimGUYpRYTBEir6Bw4Qy/17KljkzL4umUETDhCkGXiwPRXXbLqI6kHYvanq6Q6VjyGsKkrqxvJIr8A4RxjfDn0PxjkSRC5Me+ODm09lzJp2FOLuxecdoZijSlUaqObwnq2s/jOhmqgPtfr1qKtbaN2HXO1bkhDfFVi/3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nU3fX5Tu; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc238cb1b17so11136276.0
        for <linux-usb@vger.kernel.org>; Wed, 06 Mar 2024 11:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709751913; x=1710356713; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q9Dz5IweVp7u5AkiGYK4q5oZtWjMI5V6f9hbtIZbpnw=;
        b=nU3fX5TuZkYqo628+U2CZ7LTDIXLy8rHpM1hIbJ+Jcn3KYsrFNo+jk2n/Jr63nwUvL
         3FfZ/ftece8LHjrawKn8SZt/36xHc1rptCpEsbH58BblT9do3JDklWXovvwip4c0nklf
         F7X71p8Bqgk9vaS/NH7oCd69kaqt7ht/YT6neD4HdGdvNjB6Rl952dUSyCTTZC0pkpIb
         PRghW0coRbR3+ttZoyX9ORYbsySBJYAvI31g64SkFRksbZKfKjp9mgn6Qu3Bef3W6Lvj
         Dyt+HnoPDSFA3qGvWZxFwn4CzmOA6csHwEbyoethy+swhSszmRT1lVL+lMVn6JNH72Et
         MGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709751913; x=1710356713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9Dz5IweVp7u5AkiGYK4q5oZtWjMI5V6f9hbtIZbpnw=;
        b=RsLpbnZLCbDaRfVKaHwuRl5qEqPiXMSDT6q+iFdEUby8Xx0ewQoOLsmm1REqqYBqAA
         o2h8LO0Z5agH7Yu8akZuZLiLBDWHz0gjJF6N9Lv7E3jCu7cokgKKkyyKt184MqQ1tHwE
         bj16OSeqd27zUeGqtEH129ymojTGbiJbqNSpR5Nz33sHVozwTdD1qL6cxxdmDrDW8Bvh
         BUpwEPPaDbKM9lb33TISIL8WpygD1SCTFPHY0IpLaWucPX/GZmdjJE/QDf0kdTMXMonL
         7VdiexB3UhkUZOOeyfBcj2Shejzu7F8tFYaug6hEio4P/ZhQYqpJMRPLaQkkN4ll4iNG
         XphA==
X-Forwarded-Encrypted: i=1; AJvYcCVcu9+W2y/L5wbRl9CAmj+oDpr7RL8SJRDKv+Fn812ZRgPcoyrvxv+zqdS9v/NwV1HfrINzs/WvT8jSM0Vzn2RSAxcyWz6d4DvC
X-Gm-Message-State: AOJu0YxxAujEso5psCFBm3ojV1Mm9KZKmIajbPHQqkpEsZKjugD6UXx4
	OJxfqm2T0ZMtreEPb8ex5ASjBtW+AcwkPU+mX7Bjbbw43fdASw04wCSaTgI/xOmTScA5QdqEfEm
	0EBJA+XqWjRoc8zy4bdj3PvMfuATa+BoZBQxCow==
X-Google-Smtp-Source: AGHT+IFC+4YdX9W/XnW+sn+ulzfAedByNbzUijQDRlwBizUg8UJ0PuL6UYp9q1eWBsfhKNGKnuSCWJkwn3BXptbDTO4=
X-Received: by 2002:a25:df11:0:b0:dcc:245b:690e with SMTP id
 w17-20020a25df11000000b00dcc245b690emr10217316ybg.40.1709751912731; Wed, 06
 Mar 2024 11:05:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1709657858-8563-1-git-send-email-quic_sriramd@quicinc.com>
 <1709657858-8563-3-git-send-email-quic_sriramd@quicinc.com>
 <CAA8EJpoi0T-riqxbTzVymHwZmBHg5xO_Rwqy0ck-7cvGy291_A@mail.gmail.com> <935cdd47-ce71-4095-8cb5-e0f03fb30959@quicinc.com>
In-Reply-To: <935cdd47-ce71-4095-8cb5-e0f03fb30959@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 21:05:01 +0200
Message-ID: <CAA8EJpp4pYCx5hVwrmb0gs2PaRnxUapHqAhksDocEugBsOECbQ@mail.gmail.com>
Subject: Re: [RFC 2/3] USB: dwc3: qcom: Add support for firmware managed resources
To: Sriram Dash <quic_sriramd@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org, 
	kishon@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, quic_wcheng@quicinc.com, 
	Thinh.Nguyen@synopsys.com, p.zabel@pengutronix.de, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, quic_psodagud@quicinc.com, quic_nkela@quicinc.com, 
	manivannan.sadhasivam@linaro.org, ulf.hansson@linaro.org, 
	sudeep.holla@arm.com, quic_shazhuss@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Mar 2024 at 18:53, Sriram Dash <quic_sriramd@quicinc.com> wrote:
>
> On 3/6/2024 2:15 PM, Dmitry Baryshkov wrote:
> > On Tue, 5 Mar 2024 at 18:59, Sriram Dash <quic_sriramd@quicinc.com> wrote:
> >>
> >> Some target systems allow multiple resources to be managed by firmware.
> >> On these targets, tasks related to clocks, regulators, resets, and
> >> interconnects can be delegated to the firmware, while the remaining
> >> responsibilities are handled by Linux.
> >>
> >> The driver is responsible for managing multiple power domains and
> >> linking them to consumers as needed. Incase there is only single
> >> power domain, it is considered to be a standard GDSC hooked on to
> >> the qcom dt node which is read and assigned to device structure
> >> (by genpd framework) before the driver probe even begins.
> >>
> >> This differentiation logic allows the driver to determine whether
> >> device resources are managed by Linux or firmware, ensuring
> >> backward compatibility.
> >>
> >> Furthermore, minor cleanup is performed for the private data of
> >> the SNPS Femto PHY. However, ACPI handling is omitted due to the
> >> absence of clients on the ACPI side.
> >>
> >> Signed-off-by: Sriram Dash <quic_sriramd@quicinc.com>
> >> ---
> >>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 290 ++++++++++++++++++++------
> >>   drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 213 +++++++++++++++----
> >>   drivers/usb/dwc3/dwc3-qcom.c                  | 259 +++++++++++++++++------

[skipped]

> >> @@ -2165,9 +2305,11 @@ static int qmp_usb_probe(struct platform_device *pdev)
> >>           */
> >>          pm_runtime_forbid(dev);
> >>
> >> -       ret = phy_pipe_clk_register(qmp, np);
> >> -       if (ret)
> >> -               goto err_node_put;
> >> +       if (!qmp->fw_managed) {
> >> +               ret = phy_pipe_clk_register(qmp, np);
> >> +               if (ret)
> >> +                       goto err_node_put;
> >
> > pipe_clk is an input to the GCC. If you are not registering it here,
> > how would GCC get it?
> >
>
> The pipe clk will be managed by the firmware.

Which pipe clk? Coming from the PHY to GCC or from GCC back to the PHY?

Anyway, you can not drop this, this will break the ABI. The rule of
thumb: existing DTB files MUST continue to work.

> >> +       }
> >>
> >>          qmp->phy = devm_phy_create(dev, np, &qmp_usb_phy_ops);
> >>          if (IS_ERR(qmp->phy)) {

-- 
With best wishes
Dmitry

