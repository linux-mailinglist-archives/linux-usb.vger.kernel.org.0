Return-Path: <linux-usb+bounces-24916-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4F2AE0511
	for <lists+linux-usb@lfdr.de>; Thu, 19 Jun 2025 14:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9EC5175BAE
	for <lists+linux-usb@lfdr.de>; Thu, 19 Jun 2025 12:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B251252299;
	Thu, 19 Jun 2025 12:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oKYlR/i3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E9F246BB4
	for <linux-usb@vger.kernel.org>; Thu, 19 Jun 2025 12:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334631; cv=none; b=NUWWaazq4dtoZINFTQIMbvUNMD8Ejel+RiOPJAQeqXE3/GZ/tByAfHdUoqlQQ7J3biFJBAp+NNxvn2nGshQ5UhqMrr4Bcfv84z3HdommFLUVebNdx3JFQxXdhSftLwfLiiZuLmu5Snz/m5SX9V2iYKouTmcSNDCO/1dtUFNdI1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334631; c=relaxed/simple;
	bh=BYv1wKzoEogSiFAnybZR9Kuco3a8+54+9dV70GXXuV8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iXxEpCQQMw2R88nEOBAbf7AtE4grJJIq84BNyAjTFQ05Rc6zoAiTVRkYa7q3cJ77hthGKx34BwoeAe6o30Oey8mKK5mf7EpQhGlhzBLlNzKec+px97QFN6eC0nCXRdLsN+Mffj8na9U7AkLtmoi791skVCGC4CMvfTIEkFw7QXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oKYlR/i3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J4fjSY005657
	for <linux-usb@vger.kernel.org>; Thu, 19 Jun 2025 12:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5nn72h/qaf4NeAzriwbTHooNzuUElEUmweZ
	aL3/DEzs=; b=oKYlR/i3W5WhSERMx040GTIyHrcKJiIpOXI2fhxUvVBrvvcuP3O
	0qGVI32ia2XWmlAfvXkEkV3KG7jUT7meC0Eo/jsC7N9uW+hEupA6EqONx43PDDTB
	QTNZNUOGpgu/iotcyYZG2587HqCtUUu+LbYMKe1Fa7rT8IX4iXRiAJGCWCm2XTmf
	5TJjnmJz8psoEE250vpieSv9tso1AqhL/3UTGz+Ibfh+EyEmXbcd2Znig5+L9q3f
	0DAjaxI5wL6lEEkDjaeCgS0V04fxwVElZeWCJO06Bv1NdCSc1PY3dFIKEKckR3/a
	do9Sgzz3XOs3YA7gcvwUKvD6O07KwV5+58Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47c0rvk1qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 19 Jun 2025 12:03:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-747d29e90b4so755737b3a.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Jun 2025 05:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750334626; x=1750939426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5nn72h/qaf4NeAzriwbTHooNzuUElEUmweZaL3/DEzs=;
        b=NeNuckrAqdjo4/fnzsfZpvjJMxjbHCCVX7z5/o++q4NAu8dR5BqFOxu1oeX0vFtxRB
         Nq0iAtifguzRcFQRBGbhCFU0LSIpouL1ZvU5v21ccxAienBXYFTKHH43y/ndfiD7h+c9
         HR3AwAgxvAu/BK3aNnINEJ3QlS7pxU33ciEKcHjTMtXT+6pa9RmNRk+IWhsROzKfqCfb
         9B7H9gywD/Bc5MLWcmm1osimqqMhgEezLvBaioz5WIaOLRG9Oc7HTnKQxaRhsCmMZ8MA
         9z1DmeYRyfGJTU/RY2qSu3cwnLslQdIx6bQcM1JXBAE+TRwyzCdsO7kMz1KHWVULhovP
         8k8w==
X-Gm-Message-State: AOJu0YwtO1n4t5ugg2jPSGCLq8xZljJrmhVqS9FuTbsRO5nEG2zNKLZe
	CrkibwmSFESqxoXwHIz7kjfG2ty8Xds9jdQYe6hWem7YIJJw0wctZu1L6qJRHUVyhCgy1odhj8u
	axocU+EZAXeUGpPCiA5rmlZ4hlx6rFf9+sOWq0UvtrAEEUBRaeGMp+ywPQo/62QVULk7T2SA=
X-Gm-Gg: ASbGncttiuWk2CAUoanMgCfrfqSfWtEHyer6r/ShOD8+NaUv1Bm6AemOFYsp8OgNNgJ
	ntLa3LDnTQG2UtAX3lQlzLskfE7on1UsLkbIHjMapJFSsmreSmdlQzylqSRd3QV/ChI2Pr/4YC/
	Ivm5OLXlCNaibOSq4cfN5fEErtnpIBHsLJyRWqp9hgIkbY6cLTQ/vS+DwPiKmzDVqwJ+HcWCCP5
	oPO5SnA4QwJRMJ1neX6+DiOanEkW1Ehj/+ek/jjnZZ0aG0QnTGURk2jsDVSa2RdiV5D4gqE6suk
	OJcV9qTiKnI8nbRRTNNzxDuChBEKorZh/g6w2GBLFEAV3pmaX+w=
X-Received: by 2002:a05:6a00:4b4a:b0:736:5c8e:baaa with SMTP id d2e1a72fcca58-7489cfc2784mr27835387b3a.2.1750334626445;
        Thu, 19 Jun 2025 05:03:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhH0iV1FehZN/HsECMB0SAFpUyNm20MWg0wM1POjItQCw6FXfAX2uMuWWmq9njzsMHDO4LkA==
X-Received: by 2002:a05:6a00:4b4a:b0:736:5c8e:baaa with SMTP id d2e1a72fcca58-7489cfc2784mr27835345b3a.2.1750334625933;
        Thu, 19 Jun 2025 05:03:45 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d2554sm13500312b3a.170.2025.06.19.05.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:03:45 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH] usb: dwc3: gadget: Remove duplicate check while setting xfer resource
Date: Thu, 19 Jun 2025 17:33:39 +0530
Message-Id: <20250619120339.847708-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEwMCBTYWx0ZWRfX2LdhpHOUGZ6G
 WZnNNl/hNk+nmeAlvVcboQbI+oq2F9hYQMuuLvrlsIksimFMHiz3EtCuiLyVlidcwIpM9jCieTA
 q3M4i/E59/08Du+JQYwj0C7eX5V4gmPtWsR+qvfrC93sXw7C5qSPuAgb8WPgG6l3ddz5YFxvHIU
 lYZnR/z5QtzjLYHLoEx2cKxDnJ8djAdo+Q3t7WXkXY6kt45GVu3SUQUdNHMmX1w67FW3M3rcu0d
 ZPjIN9NSyM8TPxWlha+O5g6PF8z34TXJpJT2PR+3f73h+JBsmESm7LXgLPzksmgcS6lFfbxru4/
 +bN6Dff5FnLKIJT/rU5OLK8p3fOdXmunGrcflAttO8a+d1+JAb8XKo3ZwheyA6TJ8Kz8bcEtYnQ
 WoRNjWZjZwzKvA57Wr3bdORZbSug9JRiTpYDygqfSNPfKk+0qVzy2PRN+xUgbIIP22sXcaiW
X-Proofpoint-GUID: vUomqvslLMLLmFa230MXJLA8bXdvfYwe
X-Authority-Analysis: v=2.4 cv=btJMBFai c=1 sm=1 tr=0 ts=6853fca4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Ue6Mik-S3He3DxBvPj4A:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: vUomqvslLMLLmFa230MXJLA8bXdvfYwe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0 mlxlogscore=785
 bulkscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190100

Remove the duplicate check for DWC3_EP_RESOURCE_ALLOCATED flag,
as its already checked inside dwc3_gadget_set_xfer_resource()

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/dwc3/gadget.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 321361288935..e45f7cb17d72 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -924,11 +924,9 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep *dep, unsigned int action)
 	if (ret)
 		return ret;
 
-	if (!(dep->flags & DWC3_EP_RESOURCE_ALLOCATED)) {
-		ret = dwc3_gadget_set_xfer_resource(dep);
-		if (ret)
-			return ret;
-	}
+	ret = dwc3_gadget_set_xfer_resource(dep);
+	if (ret)
+		return ret;
 
 	if (!(dep->flags & DWC3_EP_ENABLED)) {
 		struct dwc3_trb	*trb_st_hw;
-- 
2.25.1


