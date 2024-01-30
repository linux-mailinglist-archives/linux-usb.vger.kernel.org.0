Return-Path: <linux-usb+bounces-5667-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8AA842CE7
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 20:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4528B1C23C57
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 19:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF06F762EF;
	Tue, 30 Jan 2024 19:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c0zHAK5C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EAA69D1E
	for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 19:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706643195; cv=none; b=HXfZ2bUWYwhnH8NIrRcmXNhcjHlFWP1AoH6FSWsEomimWM/gUkBfFc8M8MOlcbdn8rh94yqHw6ckW9fy+3ZVvjjBGTK2bvZTaE8LnUZ4le+PS5LK5xoOzBFHuvJMvkbgwNYTQz1YJfI3qgjIedDhGoj8Xqkp3Uhn1U9ApRZvERc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706643195; c=relaxed/simple;
	bh=e+7CRtRAacURKucn1FqVR2dXzWBJwCNvoq64fS8ryjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OB547Z4+5FByqBkpQ23XDmibdhmg7HtIY7gVMqBA3sfKLiN6fqzo7pYhBgQGfQgjRsYMd3bbNkRFIDzL9c8goJsxhOkxn7RArOtSGB4NniMuV5BQ3P9RlBGjf8q6g6XswhNYbMN+5Ezd12ndAkAbwBanxPFcmUohOcBa03TdlU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c0zHAK5C; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5102b00c2cdso3889216e87.3
        for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 11:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706643191; x=1707247991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAdX4i2NJPZ3tcAGVz1AnNprMjFuZ9CFGYxnwfX0ydY=;
        b=c0zHAK5CpZLpr4Ue2Oo0HcjiyimktZYNnIVfJ0RuZ8p8K7ICYT4T9PaS6qTYK7j/YN
         JpbZLXoODcmveuGUh+p1Z/D3oCJPuwjrOxSi83cwPAuTtbNGdFgMHp3oT4nZ6mRq1p16
         OosgZgTNPA2n+QAgeJOWsGBtryn5pJVA+KfW8b4L7/lgV1OcrzOzptFnKVkRoZzz3Ejk
         gyhxUBYCrQtQTQl1tJSC3+mr9S607In3T61emXFc95s5EEd0eSYl4tCMCrxH4p+Mbd0T
         qOKeVX5Jzjx6zU6GNPILdAZ9M0t4Qzi99nik4ImclEo3g0L800SVm01cxCE/gawvJ/2q
         Jy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706643191; x=1707247991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAdX4i2NJPZ3tcAGVz1AnNprMjFuZ9CFGYxnwfX0ydY=;
        b=HvBeb/6828p7tEmGMnSxMw/G3keIeQMY50em9wfyAdl7AAhWOtKGK2hsP87NUxEe+0
         YasaN01lsvZlhADSzq0u+H0DrF1YZ59CFZY5vJVyyGKUxTVqFeLMVDH9w5fp9zF7nDhi
         leI2XXy22BCRH1spIPLawkaxaeQ3QA0JO+zofdBeSQL9sENUPTp+RuwD0j/1sQCl+SBM
         GhcV9+M53cLx+/2aLNzsAkXLEwQrun7Fv+zvQIQh6bCnh1yP32UtMmZowk7hAWb3mCL7
         JAyxr20X3wqgcY6xG3/gpwjhZkClePn4Rc2ejEV4UjewpwYX9fK3ztK6HCdRQ4aHCya2
         CNDA==
X-Gm-Message-State: AOJu0Ywa7HE9HOn0qXYOx/WWYF7fmdyTQ0TOKJl646X1izBkQyPqgvAe
	FnieZ0lp38WsunsNwyTmyyPUCdHyvW30Qp1wPl8n7/Batsp4P+vqOu+8x9iFEPw=
X-Google-Smtp-Source: AGHT+IEwGgxN/pxyOI/n9OlFEQY7Ysm28C7yKvfF7B/40/pYneKwnhG1emIXCGae/T+CRL663Qr0PA==
X-Received: by 2002:a05:6512:2f1:b0:50e:e66c:4d8 with SMTP id m17-20020a05651202f100b0050ee66c04d8mr6367952lfq.30.1706643190877;
        Tue, 30 Jan 2024 11:33:10 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWBgUwJy9yFcg80lFx4LvV45RkyaE5BGSXIIUjCJ1FKqaXg6kLeec28AN0MrjklcUoYqcz7pGSMznWam243z6QzpGYlTI7aawbX93tEmJmJTE7zVqYt3T5coVheY9F4yPXgt9VCGc8f+BU23QnqGREKzgU0uJ7q8yhneit5f67hiY8xESlMGYFrUJw1n+1VNH59ufTnTOIAGK5Rm19aiH2buA2Ucv+jOXNHiuGIo6oPpQTKxKwYQUcNdjc2p8S3RAhoK5nAf/dObnWoSKb26o+JoiwUsACdFZodFGBedFbSr/JDe6dzqsvIOTQRWJ7M7mZF6g1wqQGJdl33lZHyCcMLom+nhHhI6/tKWkSxfva03shqFYgNI+Rl9mBxZ/7oVxZq0+cltXafZr/hCvVZgChj8puGT2rFiEnERt2x7JVXI9XZcD7Rfq40D7BBKPwb5C34DbOwDtPkxp3gLrpqbk36Rp4mV29Z/oL2jgPxxKutE+7lYwnNkfZi5fb+dawWlAReNql57SQccehMVjMrRcSTUBQsGcYBgC4LcmJIrjCfehuTkA7Wsxy12YfdKs9lUT8BJb2LfgqVJ1axdPkmHFnHXrkuCGXoRI1pGnOU5yIZ
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u25-20020a05651220d900b0051119371e7csm366525lfr.120.2024.01.30.11.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:33:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 21:32:57 +0200
Subject: [PATCH v3 4/6] arm64: dts: qcom: pmi632: define USB-C related
 blocks
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-pmi632-typec-v3-4-b05fe44f0a51@linaro.org>
References: <20240130-pmi632-typec-v3-0-b05fe44f0a51@linaro.org>
In-Reply-To: <20240130-pmi632-typec-v3-0-b05fe44f0a51@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1837;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=e+7CRtRAacURKucn1FqVR2dXzWBJwCNvoq64fS8ryjQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBluU7yfPGjEMS4G+a6+qLxZMu7xaY/rudE7cDJm
 ff2GojBB/CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZblO8gAKCRCLPIo+Aiko
 1Wn0B/49odzSXpl4G+EnhuhaCBuZUo6qELnB3FM3676nG1iFdHcrF5Qe2xaTOvk5vK/rYzndN45
 4O1UFJI1OHezf9N8sASSr0xaNt6Cb8KrJMWEnQvsuHcQ9EJMXugjPbppVti4uWMnqjtSeUinELS
 kdGslOgfg2R/WZUQjLUGWSWN7fuOhoepbaEYZ0xTda1j33/KsmGZP+OXSVcxgT1g+dROBRGJw4g
 QA6CZenzB06Es1OB0YUzhC3NklsnG0EoIyynEvMVqI9qdOI6carYy/Z+xWNZcU6RLh4Ij4UazVv
 6N0Wf9r9zbqmjK6EeuLcJa50YyakepPJ+sIyOtULoKwdyCOz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Define VBUS regulator and the Type-C handling block as present on the
Quacomm PMI632 PMIC.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sdm632-fairphone-fp3
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmi632.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi632.dtsi b/arch/arm64/boot/dts/qcom/pmi632.dtsi
index 4eb79e0ce40a..d6832f0b7b80 100644
--- a/arch/arm64/boot/dts/qcom/pmi632.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi632.dtsi
@@ -45,6 +45,36 @@ pmic@2 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmi632_vbus: usb-vbus-regulator@1100 {
+			compatible = "qcom,pmi632-vbus-reg", "qcom,pm8150b-vbus-reg";
+			reg = <0x1100>;
+			status = "disabled";
+		};
+
+		pmi632_typec: typec@1500 {
+			compatible = "qcom,pmi632-typec";
+			reg = <0x1500>;
+			interrupts = <0x2 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
+				     <0x2 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
+				     <0x2 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
+				     <0x2 0x15 0x07 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "or-rid-detect-change",
+					  "vpd-detect",
+					  "cc-state-change",
+					  "vconn-oc",
+					  "vbus-change",
+					  "attach-detach",
+					  "legacy-cable-detect",
+					  "try-snk-src-detect";
+			vdd-vbus-supply = <&pmi632_vbus>;
+
+			status = "disabled";
+		};
+
 		pmi632_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;

-- 
2.39.2


