Return-Path: <linux-usb+bounces-5681-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD9784383C
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 08:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8086B21767
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 07:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B42B56B64;
	Wed, 31 Jan 2024 07:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="VqHSSURA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EF256B8C
	for <linux-usb@vger.kernel.org>; Wed, 31 Jan 2024 07:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706687353; cv=none; b=YEJBu17yhQt+N7BxN/I6AxNjLtaIdj7JvmvqAOjSz08vRmUl3xoeLGhYR8t5dFoJBta1EH04G3KMVfosHJarZqVUjvfyfjvK6NggVlZKN74MNrsLCP4qWTLGTKTeM0f9dnzEuhfzNT1TckQXyg1y88iLC9GtZ+17FclL+dcEYTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706687353; c=relaxed/simple;
	bh=cFshzsRP6t2Dks44DM6zIJiE/XHM+QBGJoIWhhDc21w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=spP05VG7b/puCOE79ShOYRlvteePo48/OrEDdiak1NsdfvwdYlYxYOQO6C2PrB28Fv5oLMoEXCTPDuC09+FiZbayLWr6KGUJIy+uVPhkBbe7cdq19D+pK/7jKRZFGS4OOrN/k4wkLZTcvL7WAdnb3Gjgv3rCgwoACqb567eLm+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=VqHSSURA; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d043160cd1so38595001fa.1
        for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 23:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1706687349; x=1707292149; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVZLwgSrD+dAy2BW+IGcJ8o0k7kjBAromRPFCRfyblU=;
        b=VqHSSURAyQSuHKvRp3AV8T/i5HNFJlYlWPJ3kOeSJmOCbMtDhdZ3QbhG++fKuj/drd
         9GFPQMLYrn46aItNpdTVIcUoA5Ogaswfd9xo00VToN0w8x8AZl9CxspA2Uca1ursQ66o
         IFQ8+I/8nGgOYCOvjT+5UPR1Z931JSaP4eF+S1QzDmFHKqq8kEa5spVhyIfFe3vduhv5
         Ht2sgR/oZaUJEEDRrCsuF6UMSepnDIQoU/Kyj2zBdbn5a9uZJjLDtMSZjolV2Y/5pvQI
         oSi4zkXvfgNqq6/TmSbNCsfDF+/eRmgHlUR5ZMjsziPQuxNeM2EI7ViNZJOE3cPI0yDp
         p6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706687349; x=1707292149;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JVZLwgSrD+dAy2BW+IGcJ8o0k7kjBAromRPFCRfyblU=;
        b=pe9puomYh0PLNBVOXF8fsuWAFWB18cgvhDb3q1y/FC7kdnRNvwzZj0cWMwTxtxqoxh
         yy3Rq2Q0mFXtAZSe2P1zzA5IXQggmMIvRIMO4yE5FEdCjZYOxBC+07/HbqQBANpDsjJd
         z6qqWqtSLzGuE/XL+PYgXugxyOmZN449qB7Vjj0xmRFOa26uhSekYHFljo4262A3ekD7
         A/wN0lDQvy1FTEEvJt0xqtQSfvC2t8V+kYRewvUfW1d+8P7G3DSQlTLpJyptr6dQFRZg
         QkGd8+GUN22IIVne3lEBRSLEnzlzExBN2ZgQp8XH/Byh6AvawRg/y8FvASreq3Stvh6D
         BiqQ==
X-Gm-Message-State: AOJu0YxRubdV/34NyWrC250tfJ2aF9FFirZb205NnnkViTieV3nqJGTX
	4o/3Qvk6RJRKa9cAPQmR3uRa21hT7EeoRrggk1/DcNWlggt4tZyWGufNRY8V0wg=
X-Google-Smtp-Source: AGHT+IFpxDSYNBY2nYQhL30a38FxsOQW/IvLcz1VmAN68w1EZI60f2TZ7kv9cn9VZv7LLBgKcmno/w==
X-Received: by 2002:a05:651c:1cf:b0:2d0:6b0b:554e with SMTP id d15-20020a05651c01cf00b002d06b0b554emr476057ljn.39.1706687349562;
        Tue, 30 Jan 2024 23:49:09 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id qo9-20020a170907874900b00a3685da489bsm124303ejc.175.2024.01.30.23.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 23:49:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 31 Jan 2024 08:49:08 +0100
Message-Id: <CYSQ686XZSA7.1SVD3Z9SR1BH1@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-usb@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v3 0/6] usb: typec: qcom-pmic-typec: enable support for
 PMI632 PMIC
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Wesley Cheng" <quic_wcheng@quicinc.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Guenter Roeck" <linux@roeck-us.net>, "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>
X-Mailer: aerc 0.15.2
References: <20240130-pmi632-typec-v3-0-b05fe44f0a51@linaro.org>
In-Reply-To: <20240130-pmi632-typec-v3-0-b05fe44f0a51@linaro.org>

On Tue Jan 30, 2024 at 8:32 PM CET, Dmitry Baryshkov wrote:
> The Qualcomm PMI632 PMIC (found on Qualcomm Robotics RB2 platform)
> doesn't support USB Power Delivery. However this PMIC still supports
> handling of the Type-C port (orientation detection, etc). Reuse exiting
> qcom-pmic-typec driver to support Type-C related functionality of this
> PMIC. Use this to enable USB-C connector support on the RB2 platform.

Hi Dmitry,

In case you send a new revision you can drop my Tested-by on the RB2
patches since it's a different platform, and the tag on the dt-bindings
patches also don't make too much sense I think?

Thanks!

Regards
Luca

>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v3:
> - Added constraints to qcom,pmic-typec / reg property (Krzysztof)
> - Dropped merged TCPM and Qualcomm PHY patches
> - Link to v2: https://lore.kernel.org/r/20240113-pmi632-typec-v2-0-182d9a=
a0a5b3@linaro.org
>
> Changes in v2:
> - Split qcom_pmic_typec_pdphy_set_roles() changes to separate patch
>   (Konrad)
> - Simplified devm_kzalloc / sizeof() argument (Konrad)
> - Made start / stop callbacks mandatory (Bryan)
> - Reworked Type-C port handling into a backend similar to PD PHY (Bryan)
> - Made more qcom-pmic-typec data static const (Bryan)
> - Squashed usbc PHY single-lane removal patch (Konrad)
> - Further usbc PHY cleanup (Konrad)
> - Fixed order of DT properties in pmi632.dtsi (Konrad)
> - Instead of specifying bogus PDOs for the port, specify pd-disable and
>   typec-power-opmode properties for the connector
> - Moved orientation-switch / usb-dual-role properties to sm6115.dtsi
>   (Konrad)
> - Linked usb_dwc3_ss and usb_qmpphy_usb_ss_in
> - Link to v1: https://lore.kernel.org/r/20240113-pmi632-typec-v1-0-de7dfd=
459353@linaro.org
>
> ---
> Dmitry Baryshkov (5):
>       dt-bindings: regulator: qcom,usb-vbus-regulator: add support for PM=
I632
>       dt-bindings: usb: qcom,pmic-typec: add support for the PMI632 block
>       usb: typec: qcom-pmic-typec: add support for PMI632 PMIC
>       arm64: dts: qcom: pmi632: define USB-C related blocks
>       arm64: dts: qcom: qrb4210-rb2: enable USB-C port handling
>
> Vladimir Zapolskiy (1):
>       arm64: dts: qcom: sm6115: drop pipe clock selection
>
>  .../regulator/qcom,usb-vbus-regulator.yaml         |  9 ++-
>  .../devicetree/bindings/usb/qcom,pmic-typec.yaml   | 32 ++++++++-
>  arch/arm64/boot/dts/qcom/pmi632.dtsi               | 30 ++++++++
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           | 50 +++++++++++++-
>  arch/arm64/boot/dts/qcom/sm6115.dtsi               | 44 +++++++++++-
>  drivers/usb/typec/tcpm/qcom/Makefile               |  3 +-
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      | 30 ++++++--
>  .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h    |  2 +
>  .../typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c   | 80 ++++++++++++++++=
++++++
>  9 files changed, 266 insertions(+), 14 deletions(-)
> ---
> base-commit: 41d66f96d0f15a0a2ad6fa2208f6bac1a66cbd52
> change-id: 20240112-pmi632-typec-4c7533092387
>
> Best regards,


