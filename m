Return-Path: <linux-usb+bounces-8078-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A288D87FADE
	for <lists+linux-usb@lfdr.de>; Tue, 19 Mar 2024 10:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A82831C21BE8
	for <lists+linux-usb@lfdr.de>; Tue, 19 Mar 2024 09:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542317D3F3;
	Tue, 19 Mar 2024 09:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ur5sHkaH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EEA1CAB1
	for <linux-usb@vger.kernel.org>; Tue, 19 Mar 2024 09:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710841000; cv=none; b=XitxmrLzdtvNiC+MVXAkgXO0DtxSYtAeCyL6Kc4Ztlva+YJHVESK41DtujJBHB3UZzaAi1pbVR9bPh0uEuCq7EznHsvbrtO1hgS/NE2SQqi8sLKD0t8FrnrBonm9yS1UhiQeiCFAsVcVD9xisD2lGZawZwKrvtPrtOX6qMKR024=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710841000; c=relaxed/simple;
	bh=V0KFxvnAtrXSOfjvHQg7knauss62x8U+7KogQn+yF7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvYN239t+MqaQ9oFX06472Bp9r3n4W00wcMrb3lA4vNRfVhMs4jiheX7CxVzXesgkXztGV2tA5QLXLkG5ydnOQ4KgZkFwzVpdvZX5y0lT56PuWgC4t3k6QPxoDrRaij51ZvdLE07P37t3M/QteyQQgTPxYrppFS5RoaD3llYIgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ur5sHkaH; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-609f24f447cso58867157b3.2
        for <linux-usb@vger.kernel.org>; Tue, 19 Mar 2024 02:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710840997; x=1711445797; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q0tE4rTRpsmTL16kdGX+KFzRwJVG6ZUmpKExRxozggI=;
        b=ur5sHkaH1WBCooEn4kzGlfv0xfwUj1BPKByU96pD+V7cV8qLZbf9SqY0QcIRcB4pD3
         JygIk8+g0480VCiYNj6AF4Pf3B87qxYmjy8RDRfTfV6tEDpkZvr2WWr7KcI+q6ti0ZX/
         qvUjiFsTdy+FL9C0wJNNd5+lwg09/AlZFgZSb4oVdlB2rfCjhfN7S0T5m54c3G4F5vMG
         corZjYM0KyWV9MBkcxZlVURwDXu6VbNsyHS4d1/6KrLhBj2LQlJPLhaR/iD8FXkljMzz
         xR8jJmHA7VBLhyplUjzZ3KaLz6G1/H3oOm6WThqrrV7MjdZh2Y9OKPHEcr+gpV4RA4rv
         m+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710840997; x=1711445797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0tE4rTRpsmTL16kdGX+KFzRwJVG6ZUmpKExRxozggI=;
        b=s3QIfAvSDlLm5xuyfv2QxKGRxgpFB2q/xRgpeCksUc4pu6SsybraTqwnrxOF6sOB+y
         RAhdsGJPhcm13l2yjdRfTw2/gTuP9wd1WO2olZwPx9adV9pbbZU3lVcOtNTX1ugzRkth
         WN0+TE1iUahRLZUgCdn7TIkogJQSDMvb0xkRZXfjr4KyevRSnXevFzutGBR1eK6G0dHN
         VYkbBv10tsL0gQqtam7c/WuhSQbBPIMdCMjhO1JPCWZZc0PUAbAAuiOnp4uH6QIlERII
         jMif+TCdQeVYVId+NYuYWJENbAQbbrOIdEg2OiPrLDY/tjNiHTLkCTjQDwzzO4FrkXL2
         LBiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUekzxmmeoSUGBMF46nUCEaxQUI8jXGehtrxh2JXIw9y71Py6O01ISFUPKpWzR1BOx1ytLp7Cr+yyDCyMOgiCpZ1Qc+5xlH1Lop
X-Gm-Message-State: AOJu0YyenIDnb34XcWi1pE1ZRoDmLpLk4zx7htt43KHrnvhukxp3Ozii
	El2uj5pqGAT8ORoBLlPIz9LtBKUEXZDbJP9XSUowiHRJJRlFlWsa6U7GehzTqWj1F+gMY4H183b
	A+KMNumJCaLhjI8KMAj5gcNhKKcAXDrWaPIv6TQ==
X-Google-Smtp-Source: AGHT+IFuWQSJLHTIN+PSrx6VRbyj8bCDJjySSc07ahzVtGH46dRpslwe/Jo5mgbf3sHZSjSGNrfPeFwn5DSGSqdzqaY=
X-Received: by 2002:a0d:ef07:0:b0:610:968f:c8d2 with SMTP id
 y7-20020a0def07000000b00610968fc8d2mr8021450ywe.39.1710840997353; Tue, 19 Mar
 2024 02:36:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319090729.14674-1-quic_kbajaj@quicinc.com> <20240319090729.14674-5-quic_kbajaj@quicinc.com>
In-Reply-To: <20240319090729.14674-5-quic_kbajaj@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 11:36:26 +0200
Message-ID: <CAA8EJpqgFcBetRRFPQbG1WKHpxqO3tVQ-Yn0k7a+GVx=WN9AWQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] phy: qcpm-qmp-usb: Add support for QDU1000/QRU1000
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, Amrit Anand <quic_amrianan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Mar 2024 at 11:09, Komal Bajaj <quic_kbajaj@quicinc.com> wrote:
>
> Add QDU1000/QRU1000 specific register layout and table configs.
>
> Co-developed-by: Amrit Anand <quic_amrianan@quicinc.com>
> Signed-off-by: Amrit Anand <quic_amrianan@quicinc.com>
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 49 +++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

