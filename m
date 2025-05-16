Return-Path: <linux-usb+bounces-24027-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3283DAB97F9
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 10:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 686DF4E53CF
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 08:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1610B22FF2D;
	Fri, 16 May 2025 08:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Uh2OE/LP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1E022F77E
	for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 08:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747385055; cv=none; b=aJ714xRirHbuQsOKUeLfnuJxNW2YajraKlzZqOh2TYhwe6KViQsSkDqGwQuNLZc4+Vy6r0AAP01sgUtSwjozRHsz77w2UdG+Lj5Gi0yTA8vsqJ5EVDjzew5R+e9ZpmtgyuH3e9BP0yJbtM1QPUOktypqNjdFjmTRoOAhL/wO0VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747385055; c=relaxed/simple;
	bh=+yi0kl1LuLOzdvaI+BLRP21icyPViQu/wfjf0CV8SGs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=CgCop+aEtEJ+mAl9nXRt7+34A2E2Bkv57mW0ZCO/6Kbo4zkWezjgRZssLYrsn8nR3Mi7ZLrmwmPh0FdoGtfYSU7BoBEnJprG8aOJj3N8m8lo1yYT+ud2DBGWGQ6pVgsOmUEUUYqcrWpPwIL/15ScDbqTblKaVj8uSlOpxdaxgHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Uh2OE/LP; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250516084411epoutp0150a9125b868fc6074fd496930b62449f~-9XI4uqSd0574605746epoutp016
	for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 08:44:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250516084411epoutp0150a9125b868fc6074fd496930b62449f~-9XI4uqSd0574605746epoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747385051;
	bh=724QmPNpSoqzzfv//J0Nc9L9weI98uMGfhESILwM00Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uh2OE/LPHhq+gAGuYDtL0W1CT9XHI8cFuffGPPH/+ZSIZxuZU72FZfjxaPuFiv0Gc
	 oWekol174p/FBfJ0OV4Y31nx/8tU/yOauXIBjQp+VeNdeTIqQHq9CZgG4Gx4AjLEP+
	 mWu77xL0nj7rhmO/lEYVlXiGX20fe3BbMw2Lk/Xc=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250516084410epcas5p213d64ea27fb69d90dc7df7bae82de199~-9XIMlsup0158101581epcas5p2w;
	Fri, 16 May 2025 08:44:10 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.175]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZzLGc4txZz3hhTC; Fri, 16 May
	2025 08:44:08 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250516070441epcas5p30fe0e218557940026f54f92b90666b3a~-8ARZjask0363603636epcas5p3u;
	Fri, 16 May 2025 07:04:41 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250516070441epsmtrp1fb84e7519a60bbe8102eab8313fcabab~-8ARYqkIF2490724907epsmtrp1M;
	Fri, 16 May 2025 07:04:41 +0000 (GMT)
X-AuditID: b6c32a2a-d57fe70000002265-e8-6826e38957c1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	96.57.08805.983E6286; Fri, 16 May 2025 16:04:41 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250516070439epsmtip28e6402f83e1abc9740249f18d3aa62ef~-8APHKTuV0739207392epsmtip2I;
	Fri, 16 May 2025 07:04:39 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com, Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com,
	faraz.ata@samsung.com, muhammed.ali@samsung.com, selvarasu.g@samsung.com,
	pritam.sutar@samsung.com
Subject: [PATCH v3 2/2] usb: dwc3-exynos: add support for ExynosAutov920
Date: Fri, 16 May 2025 12:43:33 +0530
Message-Id: <20250516071333.3223226-3-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516071333.3223226-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLLMWRmVeSWpSXmKPExsWy7bCSvG7nY7UMgyV7DSwezNvGZrFm7zkm
	i3s7lrFbzD9yjtXi2o2F7BbNi9ezWbycdY/NYtPja6wWl3fNYbOYcX4fk8WiZa3MFudfdLFa
	PLu3gs3i/54d7BZffj5gtjiy/COTxaoFB9gdBD02repk89g/dw27x+Yl9R59W1YxemzZ/5nR
	4/MmuQC2KC6blNSczLLUIn27BK6MqTfPMBZc4Ko4ND+6gfENRxcjJ4eEgInEzne3GbsYuTiE
	BHYzSrzoesUGkZCReDRtIyuELSyx8t9zdoiit4wS3w4uZupi5OBgEzCVmLgnASQuIjCNUeJI
	w34WEIdZ4DiTxJSVzYwg3cICHhJLm7vAJrEIqEpcXLgXbAOvgL3En1O/oTbIS+w/eJYZxOYU
	cJA4+uY1WI0QUM2cni/MEPWCEidnPmEBsZmB6pu3zmaewCgwC0lqFpLUAkamVYySqQXFuem5
	xYYFRnmp5XrFibnFpXnpesn5uZsYwTGkpbWDcc+qD3qHGJk4GA8xSnAwK4nwXs9SzhDiTUms
	rEotyo8vKs1JLT7EKM3BoiTO++11b4qQQHpiSWp2ampBahFMlomDU6qBaan1p7CWI3dDH81l
	+5kr68hjtd15hd+F7xfnLdUtKxSbfTCy88vBaVMEjRvuvf69++rrFcKTtGaY9JipGzze6nlt
	9alZfj27Vm4KP1rDLP19k8zln7N/HDj/9eASl0U3neInNDfsXlq16f8FLw+uQ67rjrovidw9
	3zLwu8ftq/2fpdnueqiJNhxhKngjYtixVOfKz9rmfX/Stm8QijXmjGO4LOJ9YQrzfZUj3buO
	8gSb2AhXPU396/IljvFaQsWyF5xeJv8WrM/Xs5ojeWnK0ljbwjN3H27V/rKxzq3gnPX2q9Yu
	EkePur97cX6H/P4uS9nX1qWz9yut4NeV2Dh5niafXNsFgeBNT7lF5L5OmaWtxFKckWioxVxU
	nAgA6ynISBADAAA=
X-CMS-MailID: 20250516070441epcas5p30fe0e218557940026f54f92b90666b3a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250516070441epcas5p30fe0e218557940026f54f92b90666b3a
References: <20250516071333.3223226-1-pritam.sutar@samsung.com>
	<CGME20250516070441epcas5p30fe0e218557940026f54f92b90666b3a@epcas5p3.samsung.com>

This SoC has a DWC3 compatible controllers. It needs "ref" and
"susp_clk" for it's operation.

Add required changes in exynos dwc3 glue layer to support this SoC.

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 drivers/usb/dwc3/dwc3-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index 20abc6a4e824..e934f94e8fd8 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -187,6 +187,12 @@ static const struct dwc3_exynos_driverdata gs101_drvdata = {
 	.suspend_clk_idx = 1,
 };
 
+static const struct dwc3_exynos_driverdata exynosautov920_drvdata = {
+	.clk_names = { "ref", "susp_clk"},
+	.num_clks = 2,
+	.suspend_clk_idx = 1,
+};
+
 static const struct of_device_id exynos_dwc3_match[] = {
 	{
 		.compatible = "samsung,exynos2200-dwusb3",
@@ -206,6 +212,9 @@ static const struct of_device_id exynos_dwc3_match[] = {
 	}, {
 		.compatible = "samsung,exynos850-dwusb3",
 		.data = &exynos850_drvdata,
+	}, {
+		.compatible = "samsung,exynosautov920-dwusb3",
+		.data = &exynosautov920_drvdata,
 	}, {
 		.compatible = "google,gs101-dwusb3",
 		.data = &gs101_drvdata,
-- 
2.34.1


