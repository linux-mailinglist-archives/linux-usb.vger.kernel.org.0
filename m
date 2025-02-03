Return-Path: <linux-usb+bounces-19976-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FCEA2529F
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 07:58:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8F1F3A3D06
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 06:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7A11DB377;
	Mon,  3 Feb 2025 06:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="MKS0AEph";
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="dvs9iWmg"
X-Original-To: linux-usb@vger.kernel.org
Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120817082B
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 06:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.74.137.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738565930; cv=none; b=RARjV5W0fj3z/BlXNJ4mtdK9DjsD4rvorDOLMXl6BAQqrQxV+tA4Znwp0F94vmmRJsJkHvU5fijvgTJRlI5KO9le8pqNByyvqSsH4MtxkgsYsT48ZjSubNl28GIZj6UYSh4r7Jd40oohKEC4XbpgOhqfTbJicQnPEHfe6Ho4LZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738565930; c=relaxed/simple;
	bh=HpKfWals6gvV6hSueqjY8CYDxxN+av46LngYDKJxyFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ez8V0lbboKjOmC8FmW653HEvovESYEKqqaF6/5KYFjCe7pJUPI1AFsnXYT4LgZnQoiVDgVWOvy4zu7+yoiDp9V+Youe6p7j/+4ED2cRhagD//RxEwpOCUxKvI2JXJJY76IQz4VoSROOKguULOPcXAzxcNsuV4DTiDzTeRfuZYQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com; spf=pass smtp.mailfrom=atmark-techno.com; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=MKS0AEph; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=dvs9iWmg; arc=none smtp.client-ip=35.74.137.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atmark-techno.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1738565927;
	bh=HpKfWals6gvV6hSueqjY8CYDxxN+av46LngYDKJxyFM=;
	h=From:Date:Subject:To:Cc:From;
	b=MKS0AEph4ruaq7mgzdD4DiyBe0fsD3DfkZfQEONyIEwK5XTjQgj8ZyBwHOWJPC5zF
	 JuYlVINMwOeSatdGmI4X1TCbPpx1SSJBs+0AUCRRnDFzi2QNnXjE5+vxOwEDNycSd+
	 tH2t/pfzYsZSMOFwytJLHnC6mhCy0Hj63WqEI6yOnsSR1vp6PnZsVB+qHl6nCSPhOs
	 w/ngwnq53plL0W/SELygelKof8eoWDLn2gbxY51RLvouJAta3auma2RZyxI9Hb38Ue
	 fgR4xElybZNReb8i2Q5d5GcRdRagLX8PwRPC/43i3wulLooiSiS5SyqkJ1AauCBps6
	 KfdOs0PipAWNg==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id ED146370
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 15:58:47 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=dvs9iWmg;
	dkim-atps=neutral
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id BBCD832B
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 15:58:46 +0900 (JST)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2164fad3792so85271815ad.0
        for <linux-usb@vger.kernel.org>; Sun, 02 Feb 2025 22:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1738565926; x=1739170726; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=11ZT4H9fbLzjQvrQILyhKp3+cau0oLWEvJGvUrDp0l4=;
        b=dvs9iWmg96VET6BRU8LdWa8HsxizLd4vwoWCvGu2cvtWLDY/Bp4J+Qra6exLiLcXeJ
         kC1gDepRgsMaX62/w43iIVCb6H2zBEw7n3pO67RpgcDY+ZJh+eicxduDtI8I1FekLqQM
         qy3qX6gV9KH581Pt115as3EW3HzQctKtJ+HA9UUT/j/wVj27ATJPAf2EEZJ1g+VmOssU
         kvuy3z+cXINYefc7N+vLOFlhzqc48+8zCBRvHJy/u0n6jiV0rc3D+j/9xY+6+ZU9LAIT
         +KdLmZgBXbBaonuDcnCVwQRac0tlXa98qKSeBFFJMJHgO6duu7247X44neu0iylUbkO8
         cabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738565926; x=1739170726;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11ZT4H9fbLzjQvrQILyhKp3+cau0oLWEvJGvUrDp0l4=;
        b=AUwCTSv+FY/sFWpdWlFfXu0w+J0xVSZRjnRoAGsgu4vV/FOvmWe3nMfzAi0bD9bSYp
         WW29z+57mIv1s4nYcCZZoVVgl1Q6YSCMTUszOIfiesX+1huC7V4jMYym156UBY5tS/9u
         IXtRLbD6DZ3GhLXCd0WJJNzTb9e4/VtIgbDREfgej6pqEpN9vfc5fq3/v/nlTXfmTi+P
         c5qrQW7+VU89o2XLgI0oXsyi1HHX8Zwi10xsk6h8DSJtgoUf5QW9q6xPpfSaBNBrU3vQ
         XXoR4r15dMpAmeGYMek4fySN2ZGF/uIf+vXuYPN0lwm0MPeSha195K3BAdttOC8siRYh
         lvvA==
X-Gm-Message-State: AOJu0Yx6WiYOuxkoi+qPP2EOl1nobZ56Z81vYEQlVpbJqlsMFbSivHgB
	Mz5xp1w76aVbKvBAmnrlbB8LbTFCE2O+etcy4zipsKqAGzBVEO+WwRRuaybPVk+21goC03FAnGx
	Kkdz6NtVIdJ8K6pXSuvBpJrIs6Q5tRp1ODYCKWTjyoV0hnBrS596QODmt5VCBnhAZE54=
X-Gm-Gg: ASbGnctOPmKAMgJMCmjCFH7Y2p3PqEXylVlXqkiGCN1HpTN6z9wgX18b9efhCOdipiY
	oPozJH+Gjndyqlo4mKfiEfVPNFgTP2al6NOeku1mV2wl1oWQHe0LwH8kvUGqdoV0eidpVh6UBzt
	MC7Bfz7da9NF4zFDAZBLwmS6r3qkqMvZ0GbspWsO5m3T6CMDPDhn/UQPXAC1CpyAsGta6pNCBRo
	Ozo27spM1HTYroARlCyFNSNArWnnzqJVuN+iSF5OgBi9uiExOFkXjb3Tz6IZ5x8+89dRLA/38kk
	MltrXhLmeisqJWfKj16lAQdRiRMsCvb9TScVye3mpZljUnFvP/WF3C609CzhsOMU
X-Received: by 2002:a17:902:f54a:b0:216:282d:c67b with SMTP id d9443c01a7336-21dd7ddfd33mr363334385ad.35.1738565925806;
        Sun, 02 Feb 2025 22:58:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtPhFFH++bFRKPkUR0RSviTIbqX4KaViWw6lqaxHu4nVbbFwJqQuzm9j1D4TH/k0qb9akCSw==
X-Received: by 2002:a17:902:f54a:b0:216:282d:c67b with SMTP id d9443c01a7336-21dd7ddfd33mr363333345ad.35.1738565924336;
        Sun, 02 Feb 2025 22:58:44 -0800 (PST)
Received: from localhost (117.209.187.35.bc.googleusercontent.com. [35.187.209.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31ee774sm68121615ad.41.2025.02.02.22.58.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Feb 2025 22:58:43 -0800 (PST)
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
Date: Mon, 03 Feb 2025 15:58:41 +0900
Subject: [PATCH v3] usb: phy: mxs: silence EPROBE_DEFER error on boot
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-defer_usb2-v3-1-428182286ce3@atmark-techno.com>
X-B4-Tracking: v=1; b=H4sIACFpoGcC/3XMQQ6CMBCF4auQWVvTTnEMrryHMabAVBoDJS02G
 sLdLaxx+b/kfTNEDo4jXIoZAicXnR9y6EMBTWeGJwvX5gaUeJIotWjZcni8Y42CGckSGalMC/k
 wBrbus2G3e+7OxcmH72Ynta67TFJCCdREFqkkZHk1U2/CS0zcdIM/Nr6HlUv4n8BMUFVrU5VKn
 5XZI5Zl+QGqRpKf7wAAAA==
X-Change-ID: 20250203-defer_usb2-ee26f66a01ad
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1657;
 i=dominique.martinet@atmark-techno.com; h=from:subject:message-id;
 bh=HpKfWals6gvV6hSueqjY8CYDxxN+av46LngYDKJxyFM=;
 b=owEBbQKS/ZANAwAKAfKKYH/WjHEHAcsmYgBnoGkiGAgewFMK0YZ3yZfvnyEBWvr/Xmg4ikJng
 7cJqrs3tbOJAjMEAAEKAB0WIQQoFSiLMD+txr0veJbyimB/1oxxBwUCZ6BpIgAKCRDyimB/1oxx
 B+L+D/44ciLQ9mN59Ny7bJdaq49k967IpOp18rI0KfriGa69NjMQEO/K5y3wjcY0TPuzMKilRvD
 zyBNlA8L166gDqfeFgLcQU8HXTM/3SpBBDhobiqwlPa90oz2i3q4aloqI342t1FoVHDufKB+cbk
 +3WP1FRNWHoueXQl1Uw/nehPEXdQB0gT/9FlYPNxg18gSy2M+eCXUqF2iPbYnTK4wrNgH/JUMDs
 I54fYL1X6T+oBi8frOQoWMpfXOWJ5smH8VKsw2QNOQw3LhgvB22N9fiiHjBOHiAE08D4rV9PhxA
 mNAygFkK1hI/ZU848NdtLKZU13IvB59c7iLgZG4IxaOE9oyTs2umM/TPftO/GgbLFgieD1SC+ff
 vdXd1bO5AYiRxryP4gQ1yJr/gxOjogvm+YmbHxiqjyaucTcJ7pedbig2xcwG7QQ+vzL/+oNRa19
 BLjCHARSk5d7zL2C+v+n2LpoUxmHy2hujw+HWsTmiA9Da+RVkPwDnhsCkfF+wsM6Wc3P6qmF7UG
 mgWiw25TJRPAezrkB4ymMPDGhTwhdvZmBxuOGw54Thh3GZ8FwDDSfwQsRPIemF/0bq6PMRDa0ED
 ScFwDUH2Bj70a2eFTFOMnxobUmPYM12xwMb6b2K1Cffl9DKRcqpK0aaxRsJW06tsFmNq2uhs3va
 E0LB7IbIEf+G3Rg==
X-Developer-Key: i=dominique.martinet@atmark-techno.com; a=openpgp;
 fpr=2815288B303FADC6BD2F7896F28A607FD68C7107

Use dev_err_probe to silence EPROBE_DEFER error on boot on i.MX8ULP:
[    0.127301] mxs_phy 29910000.usb-phy: can't get the clock, err=-517

Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---
Changes in v3:
- add trailing newline to format string
- Link to v2: https://lore.kernel.org/r/20250203-defer_usb2-v2-1-69b3a941371a@atmark-techno.com

Changes in v2:
- removed redundant error message and now useless braces, thank you for
  the quick feedback!
- adjusted message alignment (that was also bugging me...)
- Link to v1: https://lore.kernel.org/r/20250203-defer_usb2-v1-1-2366f26462e0@atmark-techno.com
---
 drivers/usb/phy/phy-mxs-usb.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 7490f1798b461c39c29bb74e1e57e0a4adce2bd7..7069dd3f4d0d9433d62d3c3b494c2f99858e1899 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -769,11 +769,9 @@ static int mxs_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(clk)) {
-		dev_err(&pdev->dev,
-			"can't get the clock, err=%ld", PTR_ERR(clk));
-		return PTR_ERR(clk);
-	}
+	if (IS_ERR(clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
+				     "can't get the clock\n");
 
 	mxs_phy = devm_kzalloc(&pdev->dev, sizeof(*mxs_phy), GFP_KERNEL);
 	if (!mxs_phy)

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250203-defer_usb2-ee26f66a01ad

Best regards,
-- 
Dominique Martinet <dominique.martinet@atmark-techno.com>



