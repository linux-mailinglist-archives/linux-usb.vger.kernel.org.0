Return-Path: <linux-usb+bounces-23431-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A021A9BF47
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 09:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A6C517ECE2
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 07:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2699D22F74E;
	Fri, 25 Apr 2025 07:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="htd3/tO3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C1122F178
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 07:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564936; cv=none; b=nlNX/WAnYLMBk2tOfJp5MkmOUoA7JU1gWRmSfEyyIv/IL2X31yQXgmpYDqDE2/JDilsVpP2jB7qHYIbpWbqavE/6PjqgZKfHV4TpguT3lQ+qiUiCpIyh8F7IKJKeMJ2z5LxTQCFeavCHem8+tVc/SZYJ+ufXfjRi+iqiouDwu7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564936; c=relaxed/simple;
	bh=QtPrcGpMh3mVwXvK9TpUt+VlyNAQdkk2FKBhOhf2Zcw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HgowEDRtRwtjO7/NmViPJCqAzvwllpIEbDtCtceS+moq1obFTN0FnaaAJMTLppclryi3w0DidwZrAuM8hWloXC9Xv8rUdqfZm/aj9K3fiG2osjrLmr72OhEBvO5Oq21Xf27JivWvpyTV8NxxCx2aLFVtsN897cScxAEOzMscE44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=htd3/tO3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so12309155e9.1
        for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 00:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745564931; x=1746169731; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l/pFaQ+mrPPFB1oid9YI7FCJXak/BuW7x5kjtSlS5Ek=;
        b=htd3/tO342rbCgFnOX/z+kZObT1w3Kwhe7I0aeU0u/bAm/PSS14uDrLUN5NPoaSI7r
         iHrweZApcbC1r5JkyLkk7lbIiqBZ/Zis/0+WwfdhPeJKgpTHOi4MMkXNjZFGvBPIoB3i
         UIgpLC+UAy48HNDnseN0Xp5j9Azcd5Y4vvHG6/zqKIhDFyEulfYiNkBpOcyWPqwOJy3T
         uVPiXFxToJG2vUGmtMxGUyXGwZbJSHLD2+tIuACBWGRvw1EQonXqU4uHPBwOZLNFqCQd
         nV3dLTP0tBHdVZX6y9lpVgRGZRn9zEdAop4qwBx+u6WJfTzm8+8iXUKZyQ2WcQKv3vHd
         T7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564931; x=1746169731;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/pFaQ+mrPPFB1oid9YI7FCJXak/BuW7x5kjtSlS5Ek=;
        b=bWDCHzx6IT+ht14NigtiZ6DIB2pyyT8yjS2omvTm+w2HJjjDDRc+N1GDPCNj/ITKRA
         rCBVwwGRtuACLKwOCZLJzbPp43DydUrn0DKuAIxhjPYyLl0B0IesEy3QWN5wP0GVyuJW
         N7Lxjz0MXQJ+LMeAatCi0A0EHzjeTVf8GDEga7qTVzHb4HGzjvRTx02W+peQb1c/CSm8
         QL4qeFb/SaiIM1hywm7i+g43sw9S99VH3wlDv9UV0PxL3SDvlHGy67F94mENrBXvl9As
         H+xmrTsAQdKu1L4L0LRRXTinFSvTn8BFAqmARPrtyhdVBX++ilRVEUOnP0PH9hB7xtX8
         ckzA==
X-Forwarded-Encrypted: i=1; AJvYcCWfwSphyj/lUQ6pSuLOcKKIlVoLew8Ssh/BK0ybPCrOhUXe0TaCebpVkK2JOG/Dq5yCAnNTmjV3M/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyAtPORSd6s/7Toh+24hCiUS/1LsTP2IXXi4vvkC8AV3uePK30
	tVi57YCX1ylCySUUkkUwHGUlNYJmHLSVJY2++0f5MkeUY+o/bXlILaFb7fYCIqk=
X-Gm-Gg: ASbGncsccFOHk2NbyrwT4I7sFMRPsov2Bh6XvF+s+ohunHLLe8fDvVvBgTfSNkU8JsJ
	Mr404Hug9T9TIz1DJ4Y/ijKqJwnJLCOnXGfLH93BzY4SRsp6Y6XU1k8cob28OWK9Ra/WqWI9Cnf
	6uzuqxUC0cTC3OAxlCJOtmbwx9nEtiuGfHTLrp43kvHx2fjMu3zOoUtLA7WeUXHLrw+B0bj8fQJ
	A0nPGiDlPsvXs6ChKd4bRom37x5Jr85c6G1myDnQGNyjEEu2F82c5/VfSNI36KywUtQPAuE+6Jx
	VhXEJah697sMO4USWQeQmcyDeU10mp/hkQ/XQKCJYi3KYqoezhzjFFyRakrGD5s2exvaL7xqeUo
	KyHQdZjTjPx8JY07zBYwbKx7zviEhdFjZCVZMbAOnriF7wG88bqKcA37A
X-Google-Smtp-Source: AGHT+IFzhPfcdeLBF728LvxKH2NQytv2+lwn8cMdeqMenQFWngddQx+8HhHl2rf3w1TkCbe6pFjxfg==
X-Received: by 2002:a7b:c305:0:b0:440:67d4:ec70 with SMTP id 5b1f17b1804b1-4409c48b0e9mr40766735e9.8.1745564931526;
        Fri, 25 Apr 2025 00:08:51 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ad112sm46202735e9.24.2025.04.25.00.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:08:50 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/4] Fairphone 5 DisplayPort over USB-C support
Date: Fri, 25 Apr 2025 09:08:11 +0200
Message-Id: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANs0C2gC/23OwQ6CMAyA4VchOzuzFbaBJ9/DeABWoFG2ZRiiI
 by7g4uJ4fg36dcubMJIOLFLtrCIM03kXYr8lLF2qF2PnGxqBgJyCaLkXVA8jNTy/knuwW3gIHV
 jtCiLBpGlvRCxo/du3u6pB5pePn72E7PcppumBIA+0GbJBUettbR5qRW0166mGAbv8Nz6kW3iD
 D8lfXWkQFJqpSowpqisMf/Kuq5fxSyNlvwAAAA=
X-Change-ID: 20231208-fp5-pmic-glink-dp-216b76084bee
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

This series adds all the necessary bits to enable DisplayPort-out over
USB-C on Fairphone 5.

Devicetree (patch 2-4) patches go via qcom tree

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Add patch to fix dt-schema validation with fsa4480 extra properties
- Link to v2: https://lore.kernel.org/r/20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com

Changes in v2:
- Move adding "*-switch;" properties already in earlier patches
- Move wiring up SS USB & DP to SoC instead of being done in device
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com

---
Luca Weiss (4):
      dt-bindings: usb: usb-switch: Allow data-lanes property in port
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add PTN36502 redriver
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add OCP96011 audio switch
      arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up DisplayPort over USB-C

 .../devicetree/bindings/usb/usb-switch.yaml        |  15 ++-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 103 +++++++++++++++++++--
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   9 +-
 3 files changed, 118 insertions(+), 9 deletions(-)
---
base-commit: 4157b0a73f61cbcb3593d2fc86eaceeb5c06e1ac
change-id: 20231208-fp5-pmic-glink-dp-216b76084bee

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


