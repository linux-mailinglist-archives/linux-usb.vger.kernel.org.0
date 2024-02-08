Return-Path: <linux-usb+bounces-6038-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4F684DD56
	for <lists+linux-usb@lfdr.de>; Thu,  8 Feb 2024 10:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE65B1C2612B
	for <lists+linux-usb@lfdr.de>; Thu,  8 Feb 2024 09:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193B56D1C6;
	Thu,  8 Feb 2024 09:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Y27UAvjK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BCB6BFD9
	for <linux-usb@vger.kernel.org>; Thu,  8 Feb 2024 09:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707386028; cv=none; b=bafEnzVPHBXkkZ6s7srotlFIhAvCz4VvHMlT7N2Nuzw0PfpLSav6FUgPgs6kAEsBPy3WheIiwM31BwmLXASYoM7+vHHk6ldErG58STgGvXZMCY5u1tZo7piYwK+FMyyO5okBNdXOnsDRZxuQ/ZWZGCcXYrPjSAFXZHOBy3sF9Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707386028; c=relaxed/simple;
	bh=nneSNwEDwWC5ZCN/Y9jDymQQYLA3++FvlbPfJ9Qdtsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F6bcQnKI+xWnIqGa/767kF/kDxFIWcI3KuO+OBRMVc0Iqew4658N33ITXtGZf2xKJN4sK9J1kOmrSAppr3FaZfeHDCshGlNKamv4qvouxaa2/QxZYEEre/PpR36Hvf1oNqvYCBc4T9OS4+M0y8DRFrQhCf1soTNTZe3Te20AAsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Y27UAvjK; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d066b532f0so24557931fa.1
        for <linux-usb@vger.kernel.org>; Thu, 08 Feb 2024 01:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1707386025; x=1707990825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ksTPGKy9XnG6Wf0pky3mdloJMv6LFXQiqMfviW2zv8Q=;
        b=Y27UAvjK2nq8JFezrj1T07iClK5t7YuquF5M8hAob80we0qr2nfglbBBgGGlcLdRak
         FjNCrlHEArcOBM5KuiSvp1+y91iTaXLu4t22IIwieI9MWi0ESxqT/dAP9OLbJv7ltsC7
         Yo1zvFPAUXol6PABrough19n9ZFWOa/LkECe7Ndfdg3xNK8JMxHKIRJQZJp1hW1KdacO
         35/Y4+TnTTFv7oYkI9Y/NP0rAbcW41PVaXLgNladI2DA1EKeZweXnzZDTAXTZI3xG4+e
         KuCRFWiTxWwAvFkE8zWisZP10AD/IP3xcZC/PKyGGz/1YcL33OUPH1AQskt7LL1MA5+O
         36Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707386025; x=1707990825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksTPGKy9XnG6Wf0pky3mdloJMv6LFXQiqMfviW2zv8Q=;
        b=EBp44TEgjBrcmkXdgT7/VZ/ESDU1mU3mYOqAxEKIo+K59Hd/jqUUmUPwdCd1Ip5BDP
         lSCt7MV7g5d+gwMNOAbp3dbJtYTr1idZghCuIgSUvK+g1LZIbU7L4PUgQkxz0UVjG5bG
         Ny31FDXWFno6786I5B0k7niZDHoA7mZK2SNvwzH6njWT8bFSxstOuj3qBcaao6uKvR89
         mtKLZx832GdsVXqUzGnYAhdhsLOGDIOKspdZheThWCtF7T/Hm+ISx7+7FVz7WwadPJ4X
         ydEXAG72qpkBKsLNLWvZYKnCGDhNF6QteF27Xr7lk4vLyK4t7OZFrWIKMj8iFy+eLD/M
         yDPg==
X-Gm-Message-State: AOJu0YygQ5k28kkAw7oeL7xthCAqb6+BsO1GNdfV5Xyo5AtHRA9+5MVZ
	FG0b10w2zKjKxA2+ksJX6B4wASoY3RVxr0C81/c9rxmKyR1aVADcmUay3wQ2NmQ=
X-Google-Smtp-Source: AGHT+IFWvGSfzcJsgH0NmS0q30//h4o1bz4oK1DzwknC/88mXTmK4arnj3DuccwMH7306W/1IHttSA==
X-Received: by 2002:a05:651c:1548:b0:2d0:d802:8592 with SMTP id y8-20020a05651c154800b002d0d8028592mr171156ljp.25.1707386025257;
        Thu, 08 Feb 2024 01:53:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUWQclMxhiDbdB5v3FN884PUDZ7Ixl0M3bttKHmdqzUAJuoh81Z0AwC8Rwa9vYCr6y2Ru8eLuFyOT+nteP0uPfPDo/6xBitevVKGm/UkHx9CNlowPwnl46u/x85hK31T8PMWaJRtFKp6pj20vZOrPklHesxZxIFwdcbGPnDVTRo+o1Lx1krfBlqlvfG9l1Rs+eu8YGHYmsoxeux8jdMJ2/DguJiQStBVxg9kkMxHhJ1xn2DsgJFab4gUolVwmFDA+yWHaI/aPGLB7PfvUV4tMNnjK46FCsWP3e213CNAaD9+7G2VGxOUG87hTPCV/MdLJQC3RHJU28+/qeK374iyuypQ1/EDiNVG77vKZktAJNGZ9QjjhNxZxQ8uo0lIHaFMrbm1K++Kzd04Dqf/m2FihtK88LD/05zwRVamisEFCpJIWl1NIzlo0W6hfp+J8J4fyATOaAvvx+RSoqzmpwjYkXroTZaZJ2asu4FOIBTv+J4vHX0n5rRMPgZ3EI2XQS7MT6ODFoabudQhexQAATiz+btCGAat4EsPARk13p5Sd+pKjqrcG/YPOSUrDz2NQTlGE3BpQsXVhgPWpAECMINpFh3stPW30TqUR4rvZbO2i0B
Received: from otso.luca.vpn.lucaweiss.eu (ip-185-104-137-32.ptr.icomera.net. [185.104.137.32])
        by smtp.gmail.com with ESMTPSA id d20-20020a170903209400b001d8f111804asm2956685plc.113.2024.02.08.01.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 01:53:44 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 08 Feb 2024 10:52:33 +0100
Subject: [PATCH v2 2/2] usb: typec: ucsi: Add qcm6490-pmic-glink as needing
 PDOS quirk
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240208-fp5-pmic-glink-v2-2-4837d4abd5a4@fairphone.com>
References: <20240208-fp5-pmic-glink-v2-0-4837d4abd5a4@fairphone.com>
In-Reply-To: <20240208-fp5-pmic-glink-v2-0-4837d4abd5a4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 cros-qcom-dts-watchers@chromium.org, Rob Herring <robh@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4

The QCM6490 Linux Android firmware needs this workaround as well. Add it
to the list.

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 53a7ede8556d..0bd3f6dee678 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -298,6 +298,7 @@ static void pmic_glink_ucsi_destroy(void *data)
 }
 
 static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
+	{ .compatible = "qcom,qcm6490-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
 	{ .compatible = "qcom,sc8180x-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
 	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
 	{ .compatible = "qcom,sm8350-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },

-- 
2.43.0


