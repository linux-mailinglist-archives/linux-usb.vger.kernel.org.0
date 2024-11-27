Return-Path: <linux-usb+bounces-17901-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D14B9DA661
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2024 12:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52B6C283253
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2024 11:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6EA1EE003;
	Wed, 27 Nov 2024 11:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jlVqIjaI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706F31E5707
	for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2024 11:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705304; cv=none; b=tAQdml7KjmrRwfhVH1R2/IryPfTAP17FJfWEPN36RdIX/pbQ3BJMh6Y/CYJc9J9ZpmppCdAOk1aJtv5hFSMDo5NrUw5hJAnVNXwT7qQ5XkvSPxKBQ2/aroZcEaQ34/zimwvvnmLB1MQVXz/2v5MaZdlXRlm6L8/dm2SbB5wJ7eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705304; c=relaxed/simple;
	bh=lozZ7p/MhDuRt6nX+BtkrwBuJHf1C84dqV892qIj6RI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PH0bXIBudb5BoSJljUf8FWQJMbjm9O6IeniEsYFxp6iFHeOfLv8btVs7/qoy6kW8IHqTVh6ccZ5d4NjfJikYl8XibD8/aYZ6f5Td7L8ZOSXi47IlN3BXZTRXNVRCHtzIJT0uDE7U4S6Imev6TTG3mjRQ4xNv6jYVwU000b6d3SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jlVqIjaI; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa1e6ecd353so442508366b.1
        for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2024 03:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705301; x=1733310101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VB/ikfiNeJLME2Jkz2PKwShANoRD6KN3KhS7opfVViA=;
        b=jlVqIjaIdGwz+w9ViTUCIOrQYfZcRdmM+eCcGyQsn/32+a4NfONrvtQvuxtm0b0RR1
         pK2ezWO53I2ZBg1v31KUlH3PunVEFYyk9uqIjT6+mZ0mJRlKiGlsQ5G6AUJ267uU4N+f
         6lrsEI+QEWEPpFLhPlkEiSA6R/vzVzqhSbSgl7iSlFkEYEmkwT6u9pguqVk9/LIN+yjj
         jVrAd7XAppBxCBY1z2Ctfod9gX7bAXy9H+gYRhhc+YqZh4fRPx4ego6sYGwQRgRoAv6E
         LH9Wwx5BeXti8rhJTdFYKAOO3MBU04ryyOtil320/PXelKyB2W4fdXb6oeWZscrsEJ1a
         mQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705301; x=1733310101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VB/ikfiNeJLME2Jkz2PKwShANoRD6KN3KhS7opfVViA=;
        b=Ca/LGc+0o4O7EqjSQkzTg4N/il1UE+wRoUK/i8iZvajO4BxPX7gEVmyK9jF5MtHgyK
         eyjHnHMOPpWa57pjj/Ywgr95Aim8vAs6S3vghuEKkHREc1HvmYoxVRn3Z1TmhMBFc5yz
         r7wVLOzLcw6FPY7lebnF5yIK7AUjvq5a5hFVt96hpKvPE6YTCL8y4PuRVKTZD8fR8Ink
         dR4o8YEjvQZ1JqQQOyt+0e5e/XoexSxhRmKfGO7/dUTqJGYE9EEqhlUlwMZSNKhgszMp
         fgVPiokPL6u5dXH1DUSTMApdzRSODx3Neoby+QzEE85GJkkJ/LV6KwUE8upa+SfVXLrJ
         +41Q==
X-Forwarded-Encrypted: i=1; AJvYcCWc8wwjpp2NOw8KbflMYQsSwaGKZ/jIDHlilwRPGnYOVTBVc0UI6dJfX057y3IpsGM7n8F2SxuxWGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/rcOc80L5cLnL6g9tuXUKqduvn36ppJRP49wnHNOW6+rkZqZn
	T0fDkFr2HK/CQfBzI+w5x+Qxc90m2UpfuY2gHH4SFsXZFBCATt2QACD+WiX+DPU=
X-Gm-Gg: ASbGncunlWtlM8rsa2BOBD3SgzKgUtrYZO1RDtxXgzrNApCeNXKPHSwKLqcj1ac0sE1
	aGamFmFPAMtkCWykHD3AqoOKtytvOMYLro6nFcYpmukBf7aAG6XjOm4Z0mO40ib/xcD4lSAbI0F
	BBZyNdbU8kyqBIbpiNgpi6MGpuJk7sfdrFqv9Yy/o2/Lo2h/AR2fLaBinZQ0eP0Aj6QqATLCDFK
	fe8K3fmuO8DY1Hh1arLto0MsQAPImpZeVKyVIc0KCcgYOah0GhlvrSstEBCHfmincqGI1MO9Qyw
	ceNSYx0pkyqFPPcOP/6xroTR6yKEFTCRdw==
X-Google-Smtp-Source: AGHT+IFomp5IYrPwtodVx4NfkTQ1BU4IT3aD00OknD9fip4RuVHiqXSHZTCSxH7nkJmeEnB3wrFv4A==
X-Received: by 2002:a05:6402:1d55:b0:5d0:88ea:6560 with SMTP id 4fb4d7f45d1cf-5d088ea65a4mr876701a12.31.1732705300646;
        Wed, 27 Nov 2024 03:01:40 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b339612sm693762966b.84.2024.11.27.03.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:01:40 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 11:01:39 +0000
Subject: [PATCH 1/6] arm64: defconfig: enable Maxim TCPCI driver
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-dts-v1-1-5222d8508b71@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Enable the Maxim max33359 as this is used by the gs101-oriole (Google
Pixel 6) board.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d13218d0c30f..5080fe2ce776 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1121,6 +1121,7 @@ CONFIG_USB_MASS_STORAGE=m
 CONFIG_TYPEC=m
 CONFIG_TYPEC_TCPM=m
 CONFIG_TYPEC_TCPCI=m
+CONFIG_TYPEC_TCPCI_MAXIM=m
 CONFIG_TYPEC_FUSB302=m
 CONFIG_TYPEC_QCOM_PMIC=m
 CONFIG_TYPEC_UCSI=m

-- 
2.47.0.338.g60cca15819-goog


