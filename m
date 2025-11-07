Return-Path: <linux-usb+bounces-30194-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CA593C3F8E7
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 11:45:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5069A34E408
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 10:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5DC01FE47B;
	Fri,  7 Nov 2025 10:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ipfe5PL6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ihM4IUXQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5F6757EA
	for <linux-usb@vger.kernel.org>; Fri,  7 Nov 2025 10:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762512311; cv=none; b=W7O4sWwKBGtzlaIk4DQ1rAQR+ExSv9ryl6ovdE9GY3RzNNbsDatYCDNr9NPFOuyzxLYxoV5VqWIf1OWlgqRO1P/y0A9AePp+di2dNv2kGQO/OL/Gs53R3tahp2E3uti1SgPpG8YFKeshGaFhlP1lSm6QKCEi1PVJgLJsyV20Tts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762512311; c=relaxed/simple;
	bh=cldVxJpRNKgcFoYyGi5TZxiwhzfN4EJKPJL34klWTCM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dkMWbyMMvGfKAyaKq9IAG2i0qhH6xt1MhQv7/gmpvUxMzIcgzsDJQFlY1n+mrVH+APzEqCgxDQAt+tsFb2GziwRR3d9Kx1AfgLAV2eVAD5QFr4wShaOj5tunkIdVQxZuHmj0WwKpue8z6tBOLna/NBmYWGFptAZzNURkUTirQu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ipfe5PL6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihM4IUXQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A77gd9V3748374
	for <linux-usb@vger.kernel.org>; Fri, 7 Nov 2025 10:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jzF0z6hZFHuEWKL0+LuBE3RXthAv/UoQBwr
	q4S+rbnQ=; b=ipfe5PL6a6URkUKf47E+fnN8OJTeFFpPmO/56E5fGfl/Z/LIWPA
	lw6qMCHtDTx6QUB24WoH2ZAC0mU4pKVutO9ZpHmUai+t99OUP2h6BUozLojhz0Hj
	/e63Ysz3kAGX76R5XwMdfgnUZ5X7iXcRivTEQv9IBSU4y9kHHjhvmLAF6z7lImDh
	VXEMBOiicE7urIDLTc6EYoYxCuPikzQqZso73+7PhJGHq29J/x+Lz1bda7GjFrrL
	DA0e2HlSMA9mbxjqcTgjZnIJ6WNd3d3IyHSwO51xRapsyZipFmm0ZLto97E9Cr6E
	Ib9dfW+7yNmAtwywZrSZ4TQJzd1gq/xTjtQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8sy6kyac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 07 Nov 2025 10:45:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b98e6ff908aso1412884a12.2
        for <linux-usb@vger.kernel.org>; Fri, 07 Nov 2025 02:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762512307; x=1763117107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jzF0z6hZFHuEWKL0+LuBE3RXthAv/UoQBwrq4S+rbnQ=;
        b=ihM4IUXQLx0fBQ7xi76wwlAtq0sa9LsEAn5mpQeYoVFr7w7jdtQkwc2qyadcGSKKuM
         vRtmteFEcUh3tPyar6QIK8PNO/4Nriwa7xq9JZJrh85YKrrSZ7vOMuWGQ3/827sI6Gr8
         eyVjamA8HGoGp8YvkyID6QpBirhOVnxWYBeso83E1rSN6WNYLVZCdVCvtmS0hT1yNk+9
         Eae68zlOnpkOKf9Zam12Rd/ptlGi3W2ZGqpREZesChJXJXFkBIlVaY9NS10rG6wSnTMb
         /JNy8nQQPMKLDdwexV+zqTn2Ks8xjVehxE1MjDHgdds6hy4bZ76h7xB/5eTx05Uh9YYZ
         7gHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762512307; x=1763117107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzF0z6hZFHuEWKL0+LuBE3RXthAv/UoQBwrq4S+rbnQ=;
        b=vr5xNiwElbPTwsRkKgTrix31/FsQvWvpuApN1YIevPUW8UQjNJBy9Hydkc7D9O+EVg
         17MVgueXjDERo1g8VMQ6d2/vd3l8H9jc2EiSz/ohZGZYw8jgU1x1lefk3kDJUfsP2MF5
         RTRkOkZ/NdLaq5ja01PJgkYLTHuFE0bdAyQkeAMp3ZLcPbCRMm+LLKYzMe7V3acpEI5+
         4aKzW2q1/KlaymVLT9BRvMq5/7PXZ2SUM08m3rNS/7X04SX8iJhvnKq0Ea6/G2XwT/8t
         WElJODZ7j5Esm8SwrRSKIMOS99Ak5emlYsWBby8RIikv1mhs6rGCfr10KoYVm5pxVcy0
         +W7A==
X-Forwarded-Encrypted: i=1; AJvYcCWRqhF5YOJjtNsD5eABLVTddvnyTIuvKtFCkqQTV5i6PlkIjROjUg2s1YxZG4qJWEXSB8k6F+5jMww=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7efi9LpQEaZEyUKn8WcdMi/YcbswH4yiKZG9FGtzt7TMnGZ/D
	xddvRntvRa40YUmEfzjxok12mll3/I2Gb1FtBz7/euC3gHuShpoeI0Xp/C9r6O23Ytpo2web57e
	wqsoQ15NXQfLz2zC7KXi6fLAxSveAhm9ZSOe6Ok2QQsuIX9tQu4NrwQfe8g8lkJs=
X-Gm-Gg: ASbGncv3yZ7favTHwJzS9h3s+pgvRPKxN7hzxoOO3qnvMI0gFffXcjPXtZl15hI1KR7
	3O76HsYsoGYvIe0Kg8WUTGzOSkuh+HLhsCT9tISanJoQntrhuk/EBpkEl5LEPhnMr2fCctQYksO
	jaVckPX1SqHGb8QZ3ihAvaD7WkUJwxwIjQeQaYvwcZWgil3+Qtr8h6qli+rgT9YUFJOM1A/1FYC
	ibJaqq0b9ec1/y3PCtp0I/xmNVUHfmOWsV1fpaWJRvAcMM16QZZljYiyLDqNSFi3KJaJSwTG99y
	o5Xcg+m8WKOgGmogkOoHGW1yHzIAL0LjIeprw0Q6ob3GKEqvZRh8ayAwlLeN3IkgktkEDx87olJ
	iFriJstFXgClOvqkEmka7Mbg9U6sbIkXWHVcPPTgk3t9X4n/gkaB0
X-Received: by 2002:a17:90b:2b43:b0:340:d1a1:af6d with SMTP id 98e67ed59e1d1-3434c59666cmr3200923a91.36.1762512307540;
        Fri, 07 Nov 2025 02:45:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLIPMfoRBFdSkLK6MSwRI0bu0MIuKCQtHo+cC8zhSDBXAl4TEpY+PzJ0TgjkcmFqBio+utwA==
X-Received: by 2002:a17:90b:2b43:b0:340:d1a1:af6d with SMTP id 98e67ed59e1d1-3434c59666cmr3200902a91.36.1762512307083;
        Fri, 07 Nov 2025 02:45:07 -0800 (PST)
Received: from hu-punita-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d08b69e5sm2137711a91.0.2025.11.07.02.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 02:45:06 -0800 (PST)
From: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
To: gregkh@linuxfoundation.org
Cc: Jamie Iles <jamie.iles@oss.qualcomm.com>, Thinh.Nguyen@synopsys.com,
        fabioaiuto83@gmail.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: [PATCH v2] drivers/usb/dwc3: fix PCI parent check
Date: Fri,  7 Nov 2025 10:44:37 +0000
Message-Id: <20251107104437.1602509-1-punit.agrawal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AYu83nXG c=1 sm=1 tr=0 ts=690dcdb4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=jM0-4Wpw8WwY0CpfOG8A:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4NiBTYWx0ZWRfX1DqH8Oo6oLRj
 mjAqFYRco0vDoLMp9IOQqsI8EtC0zGOO/yvxA/V1yEcrJbDOZak69LQlzB0r8OD6eQNuNjISq6e
 ZwGVG141I7cH0oDGQUt2gI9CupWSHmHAJUIKQO0lEOxk1Y0mdhf69q5GTrMC5ALOidmzcZDFne+
 eH8c0+CEphOeYhPP2rx48MBBJbt2ISZwBjnYIRKrpCWvVi5j0IfOTgo4XqYts72k+cswcDipeB5
 Yp8axQqeAEklyQwTb9BFjo2iUSuEqG2jua+v6GLi4/zpTzds1ctxNsR05bHNPblWOmyW3E87gIA
 NgboBYAIW6xsaHBELcwl7tkBFfyjJtItqQ1L2FNC3dbxDT7BUMBrKaEPsuxKu/BF5G/REG6bFNv
 S+WRibaPZi8hm8Dlht2YkjYrfoS3ig==
X-Proofpoint-ORIG-GUID: ZngHDOKN7xYWnlR1Fk6f_hDqtuES2QpL
X-Proofpoint-GUID: ZngHDOKN7xYWnlR1Fk6f_hDqtuES2QpL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070086

From: Jamie Iles <jamie.iles@oss.qualcomm.com>

The sysdev_is_parent check was being used to infer PCI devices that have
the DMA mask set from the PCI capabilities, but sysdev_is_parent is also
used for non-PCI ACPI devices in which case the DMA mask would be the
bus default or as set by the _DMA method.

Without this fix the DMA mask would default to 32-bits and so allocation
would fail if there was no DRAM below 4GB.

Fixes: 47ce45906ca9 ("usb: dwc3: leave default DMA for PCI devices")
Cc: stable@vger.kernel.org
Signed-off-by: Jamie Iles <jamie.iles@oss.qualcomm.com>
Signed-off-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
v1[0] -> v2:
* Added tags
* Cc stable

[0] https://lore.kernel.org/all/20251105145801.485371-1-punit.agrawal@oss.qualcomm.com/

 drivers/usb/dwc3/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index ae140c356295..c2ce2f5e60a1 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -25,6 +25,7 @@
 #include <linux/of.h>
 #include <linux/of_graph.h>
 #include <linux/acpi.h>
+#include <linux/pci.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/devinfo.h>
 #include <linux/reset.h>
@@ -2241,7 +2242,7 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 	dev_set_drvdata(dev, dwc);
 	dwc3_cache_hwparams(dwc);
 
-	if (!dwc->sysdev_is_parent &&
+	if (!dev_is_pci(dwc->sysdev) &&
 	    DWC3_GHWPARAMS0_AWIDTH(dwc->hwparams.hwparams0) == 64) {
 		ret = dma_set_mask_and_coherent(dwc->sysdev, DMA_BIT_MASK(64));
 		if (ret)
-- 
2.34.1


