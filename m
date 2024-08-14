Return-Path: <linux-usb+bounces-13429-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F842951882
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 12:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25AA81F23D0C
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 10:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A6D1AD9F6;
	Wed, 14 Aug 2024 10:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g/DJlaGJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69814144D15
	for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2024 10:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723630737; cv=none; b=dLgS2/Zr9kJwSr7MmJlAgmYK+Ao5GUoRn1Ocq/V2FAoSCyTw4jZu1IV/ToxRUMgjwrVyE+dfNJTRp5v6qTxypMvxhAbUvllGiTsrDsuPfRXKI9Lx0Q10YOibSEdgfpmPPdcVCesm/RXJRcN1G6xu7IV08AgtDXhJTSjgooadw7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723630737; c=relaxed/simple;
	bh=gMMEesu7531ovk1t3pp1ZaBof5UtMxEfANDAyFyEQg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ugOQhLYJCgNQ5GAnuVldJ7HX2U9QSOM4wBp2UBjBw/rLHopNV6TptpZ8sqDwYcCXucSiPB65eBWde8BWoCfWOg7kMi1QfYZ4bi2+UqCUevKIeAR9VPAwJVCivpcm75YH9ICatldS4UN4kH1PMX2epQ6Hngu1XmlZET6Rf8mWENo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g/DJlaGJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-428119da952so45061415e9.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2024 03:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723630734; x=1724235534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hlcn3l35uWBmsmhhZa4sbReBOtxyCW7iBKefFzSaEj0=;
        b=g/DJlaGJeOw6w6KsZTYz7fufly0SFZ0nRMEk11ZDaG2OfEDS1j0hvlEpdsuiE0AXeN
         WUX9XjUg4+qqJSxD5fIsxFRiN5YocOR7A8voEerrQcDECA0Z5mJesAw1pGrmxevd5EvB
         LUDQv651UgIhddOX+km1d4I9uoMB9f7E7KYOJfcgJYsFbAifjenrYmuOeD+l+NSWnl1Y
         YQzR2lOr9MouSiSKVnziyZ/WfYXOpsxY5E/X10vbJikOV1dcd1zu/mK/01iCvFdd9QwX
         fdYLn43A9UbS3cP+0KKbIdTF3OoLmenbfCYdBmR6Cw1bJA3ZCvhb2D1bUdtesiuK2v0Q
         UTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723630734; x=1724235534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hlcn3l35uWBmsmhhZa4sbReBOtxyCW7iBKefFzSaEj0=;
        b=YT09/20sqL0coHtdyzJ5ET36gMJPOtf/LFQ9vXVSNklDiruHCzZYnMI0CTTF3b52dL
         YcwdPhYcpDzuCq1JMO6A+tBFmy+UA/3ccptSK8tIgSIbe/N15zFejovhzTdg+1koAMh5
         PBomFsiS4eYtI/XYxqSDTGdoHauE6eB6xkjfNBRcweIU5QnuM1sLtYAY8fV9lLwQGwvu
         sQxvLAzfe3HhGqPqQjzYxtuL1sQFKnlP3oCKI4PWY5Kh0UnPcn/6yWcWU6u/Nccu+Ucx
         igj5WC7zPdM+Y/5aL9BTZ0ezmB2ggMUfksqbAp8rXbOosLS8rjlUJh6VzQBFmR1dSttX
         DxPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHrb+XTwo+pQ0VwFSJC6vyInpQX7EKNUTHocPMG1kgzYdRz+0CFspLzSTCiq24+tRwCyEb1hsgtBpLOz6IBfnmwqu+EvOIhlp7
X-Gm-Message-State: AOJu0YyHNoCPbGLFpdfL1FjTxvznPsMTLU2Kk2fA5vhBjw0iv6Ya3mfz
	xlUexyXkk4mTqjnOAuBu1/TYB/9JQJ62OXWsL3nUGrlNalqULjJ09/Q0R9LRUwg=
X-Google-Smtp-Source: AGHT+IGGCYxMm5pwJ0kqTr0pa1ANOyDh7JooCs78TDBUnUD1W1Z/CNBLZN1iX4ifTQinRs8vqf79gw==
X-Received: by 2002:a05:600c:4754:b0:427:d72a:6c26 with SMTP id 5b1f17b1804b1-429dd22f463mr16562315e9.6.1723630733794;
        Wed, 14 Aug 2024 03:18:53 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4e51ebcdsm12487737f8f.78.2024.08.14.03.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 03:18:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Vignesh R <vigneshr@ti.com>,
	Felipe Balbi <felipe.balbi@linux.intel.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Piyush Mehta <piyush.mehta@amd.com>,
	linux-usb@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] usb: dwc3: xilinx: add missing depopulate in probe error path
Date: Wed, 14 Aug 2024 12:18:48 +0200
Message-ID: <20240814101848.67501-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814101848.67501-1-krzysztof.kozlowski@linaro.org>
References: <20240814101848.67501-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Depopulate device in probe error paths to fix leak of children
resources.

Fixes: 53b5ff83d893 ("usb: dwc3: xilinx: improve error handling for PM APIs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index bb4d894c16e9..b7613a106da6 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -330,6 +330,7 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	return pm_runtime_resume_and_get(dev);
 
 err_pm_set_suspended:
+	of_platform_depopulate(dev);
 	pm_runtime_set_suspended(dev);
 
 err_clk_put:
-- 
2.43.0


