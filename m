Return-Path: <linux-usb+bounces-26157-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B7FB1186E
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jul 2025 08:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 525D717333F
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jul 2025 06:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610CB2882C5;
	Fri, 25 Jul 2025 06:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnloMO6a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3059D2877F9
	for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 06:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753424602; cv=none; b=az2su2mZbh7PHhzIWnUzVupf57CnsmToV653GXaO5SRaKHQu1/DK6YT4FBH0Aja94D/ODvrTuYEWtOJv6wlZwVA4o4eQ94Bqbp+NZm0Ou0lEnmFHtNsHY8IRR0NSuU/VCgEXZ8znA+Gi5CaOEg8IAgl9yaifFajlBqshNL9DEdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753424602; c=relaxed/simple;
	bh=E0u5NHKCdPJIEfTxEWeqR+t0Kp29cevS+91DXYNko5k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oxRocWuG/iZrPqh35pp+7HAFwLv6LliSC74vFuh6gQKj1Lf4DmlKWrTImNuwf48KuQDGD82k2RwVM9tYVPQqBsSVme/oCwTC+zyVArxgtxTlNcUp9pDSQW6avh0Sfhwmy/lWds89v/U01aW/tJhKYdvhXLtzIoUYXH0nbebcOHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnloMO6a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OLmZUF026719
	for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 06:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=h+8rpQA2MVGC7T1ZSRP1J6JwVsqpQ0K/yM3
	DfkG+seM=; b=KnloMO6aqnQbTXGciSUwIXkDYdRJ84Qgehk0P/9pl7pxBKGCQd8
	Rvqa80zW4i9o5sg2LaizOz8Y1uGKpnSyanMXdyONWUlKKv8fB4x9XjNyOEUUiOud
	wjtP41ZiOTIIxk+VfZmdBg5JkUSZ/D4z7ayW1cvpxh7Imdbmw0kvQLIZHbl/iODb
	WCUpmT/koA4VReoXWjV0hNVMJHRDRunKLaZupx+fnatSFP1CR9r1+A3RMXcn8aM2
	aR0LcwTpeGg9EL+jK3GXa6n8/U/ghogUdT+60iHs9qsETBEIE7zSiJzk6B9lMrkv
	IF9bQiUWdIVUMRTjC/Mg4a7jxguz1mk+oTg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2u1142-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 06:23:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-747ddba7c90so1700424b3a.0
        for <linux-usb@vger.kernel.org>; Thu, 24 Jul 2025 23:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753424599; x=1754029399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+8rpQA2MVGC7T1ZSRP1J6JwVsqpQ0K/yM3DfkG+seM=;
        b=rMQSsX6x5ShL4pnoHxGIFsnuhjA1JLy3ntPY54SFgplUBF0sD4XJ4G+0MyilNKN0aD
         2uglu2mknW4QZPDX2Xc92KAvFtmhCkaACo6vfBloSmlXyyG6rKMn9WpperTkKMcSbmS2
         5JvcE5jCEe57wk3+wIuo3/0oLe9+0V5ACJvk4pTsgX9Bg2qU25cC3uWNnoIYoP7WTT9T
         +H3lYmcBYhz37knPvF6dQgC4csGhaZZBF9bRegrmYy0qpX5iDNooWDtIPuC7J9ghFaxk
         FBTCc5PPwk/Ma8VlU8aS/A/JlvhigGgGjdWZaEr1sSDJkx/Z1qYVW94xN+N/DY6WXML1
         SlOw==
X-Forwarded-Encrypted: i=1; AJvYcCUTH1Sa2z4t87s11JlGS+2JIjcJ9ZgIbDV0GegpgjCDByKS5XqxniDAX67Wyw0kJW1DuIX6Bsc9Rcs=@vger.kernel.org
X-Gm-Message-State: AOJu0YycA+RqfBeWiE8cfNsssF0jCnnztG8xvC1giVjaYeVrtBf7c2zy
	jmWTkx+g5VDV69+28+yv3u9F7dMyu+hh8MF4MxojU4vcEdTz8MiQpWmrepc3K+x0stZjCRAe9Mu
	vPufn5eXHglFVQ6/cTxATuTZ2fLe5VUKcLAkuX+dtFIcfjBl//Pdx0etpyHtJF9c=
X-Gm-Gg: ASbGncvGrrF/X4ugXWtGL9WqazdNfbpsW3qmTzckXsigYht9MMpOx+R5kWFVeaIdcUV
	Gu7wnlN1kH8XCgqTPT2/bQBcgwVU395RfvtLixlMBn2KHgdwdFc3udva3trvsaqvj4RQAY4jxEx
	OOsHFJQGceKCOgVXRmQaEpYxOTfYxXm6H27ijF1iXOi/qf4NGpBswmE/XtLCUg07kvdvFaZo7Jn
	+r5NM3/go4oyQtCVCe8feUnypPacS4WmOm/oSZdwGOreerFehbynjy9MGgAKKPGb2JLfnFf8IfU
	W9EAN2iuegp3e9NV6t2iKbeTet4OfcyFuVtcst2j6uqLuo/D08jubAnbkoSTp0KcYyzh
X-Received: by 2002:a05:6a00:4650:b0:730:9946:5973 with SMTP id d2e1a72fcca58-763358483d2mr1316890b3a.5.1753424599216;
        Thu, 24 Jul 2025 23:23:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj1xluN8FbZiHfwHdnlBmvIEgwOG9qpk8l2JTYBBHhyQ2/ry4/bt7vVkKuqaP3LKXKbrJ43A==
X-Received: by 2002:a05:6a00:4650:b0:730:9946:5973 with SMTP id d2e1a72fcca58-763358483d2mr1316870b3a.5.1753424598818;
        Thu, 24 Jul 2025 23:23:18 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ae158ce7sm3100515b3a.51.2025.07.24.23.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 23:23:18 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH] usb: dwc3: qcom: Add shutdown handler
Date: Fri, 25 Jul 2025 11:51:58 +0530
Message-Id: <20250725062158.2418961-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA1MiBTYWx0ZWRfX6LFhmaDFCtCZ
 mxByOLG2nWthC5zopJZOz4x8pfSfsE0CCsZFFCKDMi5Ygs3T7m7FdCbNO4Ib8x7h6WR8+3iwg6L
 RscA0bsjBJ/QZuhdyo6f99C4srimOU3hFEuXtfyz1sfvtfQgTSLov7hsmhy12K7F11wYXWlJC+Z
 gkB4jCPiMct5hNeGOCxCw2tscTtjKHqVDPpZTa2DWRY9m2Tr/1mPV95kfOTUme5uOFaDCzfEZa4
 ULvMfcF9SlkSydH1uFame1kEGXA+JeD02iLoMoymOjZdiUdD+AvleOukgOQdFJ8THFuLNuhk5nF
 idC2Hc8QiRXTE5hgDgHQiM6SJX0ZNOk9vM61kiF19PVwa2TwBeRWnw2TYX6lq9yMfbaKVluLkzb
 dabuU3/QhyHDoRh5//UG0WL4C6VqdB/0zDAl84IfO60amrqViVDkXBRk1a3TV1P//+9Ox8sF
X-Proofpoint-ORIG-GUID: QAaO9qBDI97YAdCF0vMKgBrs3_sbk-Ty
X-Authority-Analysis: v=2.4 cv=FcA3xI+6 c=1 sm=1 tr=0 ts=688322d8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=RJ3Zkx4DJpP4D3F6pL0A:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: QAaO9qBDI97YAdCF0vMKgBrs3_sbk-Ty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250052

Currently during system reboot, SMMU disables its translations
while devices like USB may still be actively using DMA buffers.
This can lead to NOC errors and system crashes due to invalid
memory access.

Address this by adding a shutdown callback to dwc3-qcom, which
ensures proper teardown of UDC stack and prevents DWC3 controller
from accessing memory after SMMU translation is disabled. Reuse
the existing remove callback for this purpose.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ca7e1c02773a..308360a32c93 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -764,11 +764,14 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 	struct dwc3 *dwc = platform_get_drvdata(pdev);
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
 
-	dwc3_core_remove(&qcom->dwc);
+	if (pm_runtime_resume_and_get(qcom->dev) < 0)
+		return;
 
+	dwc3_core_remove(&qcom->dwc);
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
-
 	dwc3_qcom_interconnect_exit(qcom);
+
+	pm_runtime_put_noidle(qcom->dev);
 }
 
 static int dwc3_qcom_pm_suspend(struct device *dev)
@@ -873,6 +876,7 @@ MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);
 static struct platform_driver dwc3_qcom_driver = {
 	.probe		= dwc3_qcom_probe,
 	.remove		= dwc3_qcom_remove,
+	.shutdown	= dwc3_qcom_remove,
 	.driver		= {
 		.name	= "dwc3-qcom",
 		.pm	= pm_ptr(&dwc3_qcom_dev_pm_ops),
-- 
2.25.1


