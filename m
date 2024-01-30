Return-Path: <linux-usb+bounces-5672-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFACF842D29
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 20:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DF3B1F25976
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 19:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F80D71B36;
	Tue, 30 Jan 2024 19:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mqDgpYJ5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9EE383BA
	for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 19:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706643780; cv=none; b=Qni6SPhzAwds9wghI4/v7pbQEKqYUzciNWKqIOI4MAYdbzFmr37T7zZ9OXJQsOc4rNjKi8X6HfHqrs0ho9LzWbX7Xsvp8KlgIZ1EAFJgRS0i31iH8+j59nLwkT/HPxWwLE8e0Ll+4+1AbvFLFX/Be3CiySbohnOrfxXjlgPZnXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706643780; c=relaxed/simple;
	bh=qw+048jjcUHQZCX3Cdioc35/zqqYBBdx6N8Q0A+AM3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LvZKFs/Xqsc7aI/9S715YBJC8tNV6DAmAD1903wombuGdsdUBZdJ8hI/U2BhcnL9PZfwHazwRTZRKS9dZ6cQ1Jq8nO9yRjtt/bCFK0xE27a1oAQn7gp02TrQTb2Ppmwn08t5zuZwoJxdmuq4Lv+fA9ZUjio11GQigjEss07b21A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mqDgpYJ5; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50eac018059so5121127e87.0
        for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 11:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706643775; x=1707248575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJ6MdukGRNj/Nnis7GdOSvmn6hBFpS2Qtes36t4P95w=;
        b=mqDgpYJ5qLpsu9uRTw92Eg0Jld2c98LpOP2EVoWG/Eh1G58vwO+YShfXdezxmKEYvf
         eS8/mxtoZvprsUtHearNi8J/eE3vc8eaByTKz9+Ap3o8NGGkmf+tw6cPZ7vOM/Xry8Nx
         oiJssWcqVGrS6aJpEWBAOWj4ek7djS3UUtje8Iwf22Mcqugt9dOA2A9V3TOAyNn8Y3xu
         w0H7I4Mfy88SkFXjeUTUfYaA5nR4vLTpXIymyUE3Y82+JwiARhDJsjlMiDNj0fIkglXZ
         dVJjg4B/aFCiDEmFpNeh1EQKH/IjzB5JMA8N2xJAISqIK9axc/v0Av91LYGzRImOjmCp
         bYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706643775; x=1707248575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJ6MdukGRNj/Nnis7GdOSvmn6hBFpS2Qtes36t4P95w=;
        b=HBnZY5pGZwZ6lmKp4QsLVFL5Ro49x48YTgtr1T8SNpRgwX77nnsUyI9hPt1SKsHn6O
         /SvzsxRuQar/5SSj7kxR+ZZKl3PKhx6jQrmoWy7OfY84gsNNgA1FuqQ5y9Sg33TWuyCH
         WhuYB1I4rZDN5ZlTGG1sn+QcsQOlyH6QCurJtxMfYMfEwNRa6UQm8fmjGzzDvVthoxGm
         YWapaNhWo7hIAnKHBdHEmtctBeuixhUDYUp9hdlRTOAbgYSysQavNn21rGpmG301VqMs
         LP4YRaMjv5Bnnjr1YN1sc1BLH/mHOXW72jwlmtqDWefO18lZyafrgIiLxNCOkCh7Tssj
         L+Kw==
X-Gm-Message-State: AOJu0YwdE8EzLJNdM2Z/y19+Azpo3n3E6HYYZbtmKAhw3p5ymc4W4PSL
	ACWdLaLwSDfwmT9Y7xXXa2Y5VvwXDTHUTEON4fGZGAHy4PkFOKG4qqHIImiPPlM=
X-Google-Smtp-Source: AGHT+IFOgB+HqMDz9bBH2Pzxy1J/XTH3w5MKZj75n33PMPrv7+Hj8nrdyV6w8RbiNOAuhy9uhfV2Tg==
X-Received: by 2002:a05:6512:5c6:b0:511:83e:87f with SMTP id o6-20020a05651205c600b00511083e087fmr4966853lfo.19.1706643775210;
        Tue, 30 Jan 2024 11:42:55 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW7pRHqGqa8Hqpevq+epGWl93ONrvPToEYo2yzduIa8KbUOCz2vcVgCBDcqj4/a8GxZY6Gc6VgvMVLIy8ghggYuqai73QtfC4Zo2w3RKi2XfitvRlSDZBNgQPzRo8yhf8ZWybKMPlhNGkvFTCdetBI+OEBXZaiWtZSQ1w92FuSD8irzBtuKpFu83vZ8X25twsqpgLVpGAUrY1GEHCOML9l94bbprm3TMyBH/hIzY0ncqCEdbCTa2ENIaoGU6owRVM0biBHe+qhKJwnsRHqlk4NSemOtZNKWiMLCh8mSdToYWVN+r4xo5vEd/JrUGWLfodboMZGY+HcuQyX8/GDVcc1r5Cfh/0q9r+TyVRuYOkB9wPpfnWLcf2ww+UieFCGJtwY2WZ8BObKOu9ilvbkQgBiVDvyamCKokF3tztgGFGLygGPAHX3W
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j16-20020ac253b0000000b0051021a9febdsm1552145lfh.153.2024.01.30.11.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:42:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 21:42:52 +0200
Subject: [PATCH 1/4] dt-bindings: regulator: qcom,usb-vbus-regulator: add
 support for PM4125
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-pm4125-typec-v1-1-e8d0097e2991@linaro.org>
References: <20240130-pm4125-typec-v1-0-e8d0097e2991@linaro.org>
In-Reply-To: <20240130-pm4125-typec-v1-0-e8d0097e2991@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qw+048jjcUHQZCX3Cdioc35/zqqYBBdx6N8Q0A+AM3o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBluVE8gx4Xn91rrxGfPfvMU+Qno5S1aJHT6lj2P
 xV5DW8day+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZblRPAAKCRCLPIo+Aiko
 1c6GCACNORwnaYyyNjqzL+Cv9u+EarUQw+8B0cs7R9+niqXsujZvYv0XKpdp0dTZhAfvBkPXuu/
 6BEbNk6SO3Q7UMeok1OktFAs5uIIWHlfy46mYg7rC1OsfGhAAULeFlzV+Htk3uFbSQc8elealIa
 MNvTHd7gNTAUts1DqaepAZ2U3+DV5tiNhb4ZML/UDFn07V78xh1K/JwwHy5LiVuvBchClH67DYm
 JSd2Se+F9fha4+RxMuTNbig43/co0BWIfJp/+mZq4GuhpitxHpjfd7EZMzJL7qdlhy6cb/QcNYr
 PaR1z+b3oM+pQaNBcH6pt2Wta4Aic9yrybh6LFfbPZdb406w
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The VBUS register block on the PM4125 PMIC shares the design with the
PM8150B one. Define corresponding compatible string, having the
qcom,pm8150b-vbus-reg as a fallback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index 66dcd5ce03e6..3cd489326267 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,pm8150b-vbus-reg
       - items:
           - enum:
+              - qcom,pm4125-vbus-reg
               - qcom,pmi632-vbus-reg
           - const: qcom,pm8150b-vbus-reg
 

-- 
2.39.2


