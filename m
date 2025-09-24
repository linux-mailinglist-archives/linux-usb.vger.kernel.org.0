Return-Path: <linux-usb+bounces-28622-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C8981B9C8CC
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 01:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A1CD7B7CF9
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 23:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B993F2BDC04;
	Wed, 24 Sep 2025 23:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E9hvidxu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E9D284B37
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 23:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756398; cv=none; b=ts/UYB2sBA2xZIyxGy+QGGcvwqa8LyCLWHmcucxYvxq4zrY7951iGXLDfHnMo4n2VV89933FlxPZE4zwfB1NzD2tkI8n10Ujj0HC+x2FQhL+TzOqWfp6OHp1SJzPAxt6Qk92jgs6dXWBJEfbT2iXM+4j+jRy+QJnqQKwQTahnqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756398; c=relaxed/simple;
	bh=A52ROh/Md8E/l7pDVKt3JwMJSU6DehcWufqvmQgZXsc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mGpxRGgBLSFzjlKZTbW13ZT25bA4xndm6t6Q4hwC891QPudo1Ds3pqVVr+YrleC+Q7NZznFjqlSLWZRopLibOYrSba4GjLBfc4owPSr3jzQX5UB9uQ/J9n5uCUJFERtSpVgNJpVjqtTVHyPWCcP9OIMTpj9VKF0ezXmtXMzNt6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E9hvidxu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODb2An019952
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 23:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uBL+fRZoVJd
	0EnYHl7fL+1Rjn/9hbw2Gf19pU1BpfeA=; b=E9hvidxu+rY1CsCN45h/7J09W3v
	y4ByyRj548wRNOsiAV/E9I/ttJ+IWBNX8WkEk5GMcIq+odj2U6Z5Qd+EjqkRQI09
	0gRdV2loGW5JxcKVhplCgu0Qs2PNY7DA3fFuFQXxXsORl7c61T4ON3UNOQd7qY1/
	WQ0ok8eLpFuEJYsbX/BdKItQBgFzl6YXzIpJTDjpRf01QFtVnxwA0cNmPnGthWTD
	adW1LnR/GiVlVNEai+JRlHbAqCyamxobgBIwAvJ8dy2ZCvP+57jbkSx+coqlUVfk
	eQTvSCMm8PdF56BmKks1t6Vj0um3w82beREm2qrXmI88E8o6YOyokYt1Yyw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdy8b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 23:26:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-272b7bdf41fso3539885ad.0
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 16:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756395; x=1759361195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBL+fRZoVJd0EnYHl7fL+1Rjn/9hbw2Gf19pU1BpfeA=;
        b=dOxwlC8BHyQFG4E7SJMhaLioBO5MCSTlht7XVi++6TFbqSKkKl88Eoc8eBaiq24fND
         CowEBBiOM0vl+dfgC5Vml2QyD4hlEa/TtbD1kiJizPKf/ZpYZ81YeY7xqY5WPw7wDzEk
         cGLDry3O5w/vYdelGh9lc5Ya/CU2WHk19+ObYvHCvrgDvw4V5GO2UUeeG0wlEsVDsHGp
         4jp4n2D6qZOxV8H59DKpIRkCv0mR2J84s2GMim6400CBPSYm1aBeVIu8fEQcZ20ugBSR
         ImSBcCJOAqMd0wwTeRcxq8jrT59ZGbgxRON6MszO+ftzkrexpdK4+vEc2v0O8CVD/Z46
         2x/g==
X-Forwarded-Encrypted: i=1; AJvYcCU2DflDJGN2x/Ik+oh98aa2osQqZoqLfh9zsyVkvvVyZRybEWkDoYYUM0GYvf03MyjpuwwsPaAfyQo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuxAXvo4JoOrx7l93k4smtSy4FA8EA8sFrtr5rom628wtG+ROc
	uq7N4aaofAV3paatdP3xqRI1EfwDXcM1pypBtAN4IM0r8kk/GSKGzsWl9DVtEMGdfKFZ4CbFqqE
	ohZQ6mRy/4KFYXHvai+drR8PlgvJPFYE7T1lLXp5RtIy17O7TrQ7vfEb9bv+qoLY=
X-Gm-Gg: ASbGncs/CjgiEZ0W9bzbpNJkuISPjjxtzfr1WSO5WMcU0kk8jmnY8U0CSjk26w2rN7N
	qb4PJOExk4Ten4hRHEc9qko0+lYkp1+A+P2Q+ycBeVQn6EPvzvpIGPBeeQj5fQfa7hB6LaHiKfo
	NYlJbkvkaH62jfuNwZfX+W4esGx1X6kjQnZHY1pzqjGvxYFvYMCq79pCdYxqtKrV1GAM05ZJtoq
	Ue160B4cuk1Tu63vUwkBgf0o+FkRgXmJozXdcskgU2ryMbn00rLz63Ptr6yBW/mhXCXpMC0O4vD
	YNHjZhMbf0KC0OyF+QvAz8eUfW61pw/VcVjOVdFCQNf34x/6X5IRvXFwiqEuO4Oqse174cPdWc/
	dRTK2klXbnArkXl7ImmYgnJNJe7o=
X-Received: by 2002:a17:902:e74b:b0:24c:caab:dfd2 with SMTP id d9443c01a7336-27ed4a7aef4mr14903295ad.61.1758756394972;
        Wed, 24 Sep 2025 16:26:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJEScj3N7017e1VxtcyNk4O5EUgwv1v9frS+qgd/Wrq1/qSDc6Y7tgNA0T1wmE6TpBQUbcGA==
X-Received: by 2002:a17:902:e74b:b0:24c:caab:dfd2 with SMTP id d9443c01a7336-27ed4a7aef4mr14903135ad.61.1758756394583;
        Wed, 24 Sep 2025 16:26:34 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed68821ebsm4005735ad.84.2025.09.24.16.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:26:34 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 1/2] usb: typec: ucsi_glink: Update request/response buffers to be packed
Date: Wed, 24 Sep 2025 16:26:30 -0700
Message-Id: <20250924232631.644234-2-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924232631.644234-1-anjelique.melendez@oss.qualcomm.com>
References: <20250924232631.644234-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: s662JMFF_R3MPdMSc7TzLYOoLW1baMTF
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d47e2b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=OI1EoHIFZYFGuZb9aTAA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: s662JMFF_R3MPdMSc7TzLYOoLW1baMTF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX4X3zsFhi58KB
 DOvPVFhqOsTnLT5cl0gIc5bngNP5hHWtEXOiAHf1tFeuWom1NaapNNy1U7enYU432vYbEPRWvH/
 89CzngfWzf3EvfeLjCLU/P7Bh/NTjNldLuOw2qNnZ4w5qf3xtwxQ2r7u8Vv6JuO3QzEyQJ/DWx+
 HzpJVCAdHOHuUs/Jv4zLmUPJpE7YydZBiop2boFSeFjWMYCjKMQB3jrZZOH9fVTFviaFv1Fnjyg
 GVz3G6kYA5m1Q4o/pCPWxA2ATkwtYmXUTEwIU8NgUGhCvzWwFa962RC1RUpNGTslHJ/AZuyIyJQ
 OQQo9nRGLpf4hzc3fzIEShWuHfz7aIiFHwr+yUmqxM9O+Ovm/Uo/gQJS9j000haTCk3nJO1b0dw
 k+MIgIP+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

Update the ucsi request/response buffers to be packed to ensure there
are no "holes" in memory while we read/write these structs.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 8af79101a2fc..1f9f0d942c1a 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -30,24 +30,24 @@ struct ucsi_read_buf_req_msg {
 	struct pmic_glink_hdr   hdr;
 };
 
-struct ucsi_read_buf_resp_msg {
+struct __packed ucsi_read_buf_resp_msg {
 	struct pmic_glink_hdr   hdr;
 	u8                      buf[UCSI_BUF_SIZE];
 	u32                     ret_code;
 };
 
-struct ucsi_write_buf_req_msg {
+struct __packed ucsi_write_buf_req_msg {
 	struct pmic_glink_hdr   hdr;
 	u8                      buf[UCSI_BUF_SIZE];
 	u32                     reserved;
 };
 
-struct ucsi_write_buf_resp_msg {
+struct __packed ucsi_write_buf_resp_msg {
 	struct pmic_glink_hdr   hdr;
 	u32                     ret_code;
 };
 
-struct ucsi_notify_ind_msg {
+struct __packed ucsi_notify_ind_msg {
 	struct pmic_glink_hdr   hdr;
 	u32                     notification;
 	u32                     receiver;
-- 
2.34.1


