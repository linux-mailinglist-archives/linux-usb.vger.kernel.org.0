Return-Path: <linux-usb+bounces-16400-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 944BF9A37F9
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 10:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC9E3B2172D
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 08:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7AE18C92A;
	Fri, 18 Oct 2024 08:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pzcJQHYR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9626189BAC
	for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2024 08:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729238786; cv=none; b=kmeTmqZ/aNqsqKfDeXuIkWStgsw9pQQLcSyrjwUG3Cxwl5wBRy3tswiVsOK27xvB7/7OZsApo2tJsusAl1Jx3pfmEBy7PH28gObGTiP78u3NHcCclaiP0+ghCFbEkp4TvZ4Zzp4RF5NCXwE/Ok29KNNjJ7PaiNTN+O2hmZLHqVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729238786; c=relaxed/simple;
	bh=HZ6YXgVkHMC+W12bcHr8/VXyz5WVWmo/IJL16rs+v9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g90dQnvsfaI2omX0l3XIjCMPkogP7rx8MEdbcCa8C1I46Yobm9FzVnuxfV56qslBeoV1xH9B1Vdu7k0gGDJvbApay1d44BzIPJL+nqe6ziXBfDwg7KdNbm7qkhOR4TRG1EokmB132zAQLaO5CqBg3pxvGzNAkqXxMnMevQB4Dcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pzcJQHYR; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e290222fdd0so1567323276.2
        for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2024 01:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729238784; x=1729843584; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UJxs3TzRvpvh37ncfDE5O/qusWTGJaGSYhsl43ibuBM=;
        b=pzcJQHYRoqv8djQOPQ9b0wm56BqP4HuDDduSr7ZAhGzz1H/et/qDnbpRQfabXGJV2y
         lCjb2aeVRqfh39GoVc/nBNtnUoBcRrCwC0bBzgFCrkYrdjGpOMCArHmk+I+3AH8FB50z
         c3FpD6/PCv5hiXGmV0OC5B1tRbZg/lQwGMiGExvF/NxCCpSIPScwllQITYmvy8UVocoJ
         A4g5xVE5sZrQj7OP43vMnUaZp1uZKwwg/IlUheNUqCiRVsL1bQ+fEyfZf/8Zot6QY6DV
         LykYQ43ccTLSSvAvnXRAx26SGWtqFnJXJkfYNJZF9nka9VHr8msyzHPEh5d011Xauu76
         6xJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729238784; x=1729843584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJxs3TzRvpvh37ncfDE5O/qusWTGJaGSYhsl43ibuBM=;
        b=FElBLXq3vUR3J41s37ACcQLak+g07cvK/sdK06C3McN06mt1QAxWqPio/gaEks6Ary
         TxErGR7F79HlgSdLq9IFsq6Adg/T8+2MXuiOTqXdGeysg+pUoiQqHePor+NXANaQW/8+
         gxNnAmPSItq86JXXbQnpLAGUz2GjFZOdUNy3bErwS0RnYW2eli3HsVD385S3kvOYVkvD
         /DLSGsR4mRxC9gm2aGiAekaiyF0LvBcTxGJBsoRgDw+mVH4IGDjxYxnvVpNyscAtOzNX
         fOjGxgZcZzGRZMU7Rr6waUnSUoIbRFUkGvpAzdAONJUpViOS4ug+dgy+isJtLvs+cNDA
         Tf9w==
X-Forwarded-Encrypted: i=1; AJvYcCV3wd5TMCEcOsUEbk7svrl24PCSHXRxovSl8IpLeZSMpSvJc59HiTXWUwi4KSaO/iJKl+2LVRbREBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBiuvPNIBkYkqjqgkrB6/Ic2L8q68WcBukVpai88epLJa0Ub+7
	DLq/JtJmCSPQLfyvxQf0BrV9biPwYBr0I19L/Pc22Rex5KfpF5tt2iV99kj22eqF9c6aomHHsAa
	ktEMbuU4JsJu/rhjaKXKn2yj0BkVqHOzfFfRtow==
X-Google-Smtp-Source: AGHT+IG67iA513l+vzvhN59OEZIDnlrhUn8zZVdV7zNIa0MSXy/0JidUuX5/ugr31L6WEem4xZ1pwi6Fky5+yvRHgik=
X-Received: by 2002:a05:690c:690a:b0:6e3:195a:7247 with SMTP id
 00721157ae682-6e5bfc9c423mr11743617b3.46.1729238783780; Fri, 18 Oct 2024
 01:06:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017130701.3301785-1-quic_kriskura@quicinc.com>
 <20241017130701.3301785-6-quic_kriskura@quicinc.com> <CAA8EJprcOU6qeJvHH+MVoPnQ+mGcos=pDOVBSeSUfBGw-KR6tA@mail.gmail.com>
 <aa68e5ab-86a6-430e-92d8-ed89b4eb37f7@quicinc.com>
In-Reply-To: <aa68e5ab-86a6-430e-92d8-ed89b4eb37f7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 18 Oct 2024 11:06:14 +0300
Message-ID: <CAA8EJprkq-Cct9Uk1Jwqc5Rn8mx8THTRgwCzDx=8ZgbCpwD7qw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] phy: qcom: qmp-usbc: Add qmp configuration for QCS615
To: Tingwei Zhang <quic_tingweiz@quicinc.com>
Cc: Krishna Kurapati <quic_kriskura@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Oct 2024 at 10:48, Tingwei Zhang <quic_tingweiz@quicinc.com> wrote:
>
> On 10/18/2024 2:27 AM, Dmitry Baryshkov wrote:
> > On Thu, 17 Oct 2024 at 16:07, Krishna Kurapati
> > <quic_kriskura@quicinc.com> wrote:
> >>
> >> Provide PHY configuration for the USB QMP PHY for QCS615 Platform.
> >>
> >> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > After checking platform details,
> >
> > Unreviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Please perform global s/QCS615/SM6150/ and s/qcs615/sm6150/
>
> QCS615 and SM6150 are different variants of the same SoC. QCS615 is an
> IoT variant, while SM6150 is a mobile variant. We are currently adding
> QCS615 SoC support to the upstream Kernel, as it is in an active
> development stage and we anticipate many products based on this SoC. On
> the other hand, the SM6150 is an older mobile platform that is unlikely
> to be used in new designs. For a product introduction of the QCS615,
> please refer to
> https://docs.qualcomm.com/bundle/publicresource/87-83838-1_REV_A_Qualcomm_IQ6_Series_Product_Brief.pdf

Yes, I guessed so. It would have been nice if it was documented this
way from the beginning.

Please note that we usually get support for the mobile SoC first. So
in most of the cases devices use mobile compatible even for IoT
platforms, see qrb5165, qrb4210, qcm6490 and other similar platforms.
I simply asked to follow the established pattern.

>
> >
> >> ---
> >>   drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >> index d4fa1063ea61..c56ba8468538 100644
> >> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >> @@ -1123,6 +1123,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
> >>          }, {
> >>                  .compatible = "qcom,qcm2290-qmp-usb3-phy",
> >>                  .data = &qcm2290_usb3phy_cfg,
> >> +       }, {
> >> +               .compatible = "qcom,qcs615-qmp-usb3-phy",
> >> +               .data = &qcm2290_usb3phy_cfg,
> >>          }, {
> >>                  .compatible = "qcom,sdm660-qmp-usb3-phy",
> >>                  .data = &sdm660_usb3phy_cfg,
> >> --
> >> 2.34.1
> >>
> >
> >
>
>
> --
> Thanks,
> Tingwei



-- 
With best wishes
Dmitry

