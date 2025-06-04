Return-Path: <linux-usb+bounces-24480-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1002ACD7A1
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 08:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C3C0177618
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 06:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69A6262FD0;
	Wed,  4 Jun 2025 06:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d7/ZZT/6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69F21714C6
	for <linux-usb@vger.kernel.org>; Wed,  4 Jun 2025 06:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749016831; cv=none; b=glE1fV4oBgAr8XgSw3COKjw6WescQRh3mksSvY7HcE7rkR8yCDru8RhvJtuPgvSMKbrNuM0yC/1pQBDi4hwYpA8chHECM6k8VPuVD7Qb/qkf0Q1TuVQ8WNbKZa28Qdeqid7YfMR1GoydwzVNXmrh634Hxv7OFTKty5+vAawL/Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749016831; c=relaxed/simple;
	bh=0+TEVJg7p2jL1KfAfPfpeOEnS0LGaLrv7X5P6gJE1cA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aalgURjce7NvrFQT72BUR/pgwZ/PS4xd9sW7tkkv+VsrYG1ahTM1T7mfoJ1t0hRZ8QZ++SRil31LaNd6lqZ5pLLvAgsEcXXcSw/Y+6j3vBdHptK/snjERfXYHvCzqvtIVv+C3ea1foN1AErTVK2vOhDoiO34KXGASUaYSTYHMU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d7/ZZT/6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553KGppE000776
	for <linux-usb@vger.kernel.org>; Wed, 4 Jun 2025 06:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/LV17/bXn+ta4up463Ni2dQX99wlzghOGZu
	OYVPW/f8=; b=d7/ZZT/6RqMfxHF5fLGEWlueeuiQB/GTlyb50MrS8FZXeh+mnpf
	Lzxr6hpzyCLrybj8y8kakAJq4vDP1DjHgZ8mzsmvTNHYQcvzTj1fWAuBZNN8wFNV
	PspmJozjQ/InRfKIs8DL/HuPhdI1wowiLW9RpAAsiLrMRcTYtaugRKT2J++jGY1Y
	OfnQgU3/5RRhs0u+4JoWAQIOcNss+EaWGLbHczaAXjn4FEPQqZy8CY3ELiE6pctd
	fODFTei6sO4ZGUOqiFgoha+cCVxeflsWwPwKG9qxBrGvbU2eGLY/n/EdaO28ZyA3
	DZgtM9Y0DVHFSK8K9KQ442iUglYT6qstrig==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfuut4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 04 Jun 2025 06:00:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-234f1acc707so53347225ad.3
        for <linux-usb@vger.kernel.org>; Tue, 03 Jun 2025 23:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749016827; x=1749621627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/LV17/bXn+ta4up463Ni2dQX99wlzghOGZuOYVPW/f8=;
        b=dgTQwgWK1X2nIxX8bbUkLPwsPNNrHUb2ljMumFnD5YuBp9Hm1UNLAf74H1Rq7R8RZh
         MYjzbwARSVtrPsnbj+HEC1ftmRtRdBcmM+vpVdf3LDe/Z4UINp6x6E4wAK0cYStdi1ov
         O8XWImovChjyfyk+RmEHkOlymtRhoHSvpIuDGerbGta49Ym5Zv+hUOgMTApPROCE96AL
         x8D2QP1YxABJdIUK86ccpIXNWvcNokGjmZRMVuV+MFjfPM4ztJnIasx8OD90ED/6biEe
         dxFS2+Eo14ct8Hr++b9ZFRMx38c4Qt8Ri1vI78z6dJoB1JgVSL7GIPI+KxUyNCoI1CcZ
         Z9Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUoe/wGbl8rjb6cY7ELXc5wbG9uwG+Ui1bjCKQaQDClG2TkDIbVHa3NqB2px8TpQsQE0M2RFLRC7mc=@vger.kernel.org
X-Gm-Message-State: AOJu0YznCMLa/nf0aJHLGm8WyRsNXkOLgYXEworUUxdu862RQIN5jd/X
	yX4pGPffFuuO4oST5XZvdsGJWc1ZZdPncp8nRUQ1V/3k9/UtKqxlv6rtwFhQftSyIdyjRoqi1L/
	kyqrZ6Xz7VWZ544IlLU0CIYMwYLE6hs9BaTt8kinx5xFcL4Kw18Ue6ogtWyT4RHA=
X-Gm-Gg: ASbGnctThcKD7Z259Dq/89OShfIQVv3rMK37s/nCfCi0Bc1CI91snJhY6wKlbmmgu97
	LDHirbJoPVrP9mxYD5pT34KovMhBI8GTUJzI+a3i1VyYPvy+mhSfaac1Xca/pZ7VW1TtQ6Wh81D
	RdB6g6sbgojz95Y4QcponxJVFckzAMz7wZnLNIP+gaOVyCbsEKWGx6YOrn34VeNxDo3YbeRCxZf
	/MaqaOlzNa8RrSIyDVjSMvzpu2GPiwUQIsY5x5MLHX0a59+m361NNlucRqC7fJvGIgSYdLYyEsn
	URu3t37DSZYOFPw5bB+36xWVg+jmtocsDcDP3J05IQd7BVURIg==
X-Received: by 2002:a17:903:32cd:b0:235:1b3e:c01c with SMTP id d9443c01a7336-235e11e6804mr23432255ad.39.1749016827110;
        Tue, 03 Jun 2025 23:00:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFW3A3paX4fMhfimwAYJuU41jJO6w5XA12vlCaJUDb2iyxsilOXnnW8zPr0niNBljXMt9j3ig==
X-Received: by 2002:a17:903:32cd:b0:235:1b3e:c01c with SMTP id d9443c01a7336-235e11e6804mr23431645ad.39.1749016826607;
        Tue, 03 Jun 2025 23:00:26 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-312e73face1sm1417579a91.1.2025.06.03.23.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 23:00:26 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH] usb: dwc3: qcom: Don't leave BCR asserted
Date: Wed,  4 Jun 2025 11:30:19 +0530
Message-Id: <20250604060019.2174029-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=683fe0fc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=rzSUB_1TqBMNDQYVAdkA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 2vAR03WZ5CHQmk5-NrmMSIQdDysjzUhf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA0OSBTYWx0ZWRfXx4LYOtvd+J8J
 a3b0WIAU33ullNMvFU/ZuY6IKBpTnoERUYGaEU953Vjt13J6a9C/XOOuqKYlqjQrgGCR9gEWxma
 s52KS2w0ipJ3LSC2upxQMMkBvyyWhNBE7VdwdP72UYPDHzG0UVyQkzI7Ww8Kix5QhFO+kQ+TKI+
 UAtxiwUDkWLtzUqxZu3evUzc2N8NyoON+FZ3D19aEoN9xJr0ToGx/ZIe9fA+sWJ50zAoBjIYGJB
 kBLrcZ2ftFqGdu0+clCOo7tFgtGaTM4TCmqls6qPy7vMLCR6s5jpWz12hOffd5PSoxvNEpNOgv0
 5ptNHmOe1BtyAec1/7eIhMD98umH4ficAS9buonqMYCSO3kK4uN/CZ9amFudt6dbk+aBL9neDSX
 Tdxhvc4nDlNkarO8ory7ehwnEP57/lVM8BbZcHv27d/Bk2Y/KLsB5RO7mC8asvHH8JMQpdtb
X-Proofpoint-GUID: 2vAR03WZ5CHQmk5-NrmMSIQdDysjzUhf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=915 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040049

Leaving the USB BCR asserted prevents the associated GDSC to turn on. This
blocks any subsequent attempts of probing the device, e.g. after a probe
deferral, with the following showing in the log:

[    1.332226] usb30_prim_gdsc status stuck at 'off'

Leave the BCR deasserted when exiting the driver to avoid this issue.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 7334de85ad10..ca7e1c02773a 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -680,12 +680,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	ret = reset_control_deassert(qcom->resets);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to deassert resets, err=%d\n", ret);
-		goto reset_assert;
+		return ret;
 	}
 
 	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
 	if (ret < 0)
-		goto reset_assert;
+		return ret;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -755,8 +755,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	dwc3_core_remove(&qcom->dwc);
 clk_disable:
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
-reset_assert:
-	reset_control_assert(qcom->resets);
 
 	return ret;
 }
@@ -771,7 +769,6 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 
 	dwc3_qcom_interconnect_exit(qcom);
-	reset_control_assert(qcom->resets);
 }
 
 static int dwc3_qcom_pm_suspend(struct device *dev)
-- 
2.34.1


