Return-Path: <linux-usb+bounces-27332-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E035DB38AB7
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 22:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B25867AC222
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 20:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D7A2F0C76;
	Wed, 27 Aug 2025 20:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fs4jMqr5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3072ECEAC
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 20:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756325569; cv=none; b=pNQPbgRekWnTUbj/AfPkvGe2FVG1uIVAg7vCIE+tcQzTSLgBg3k6m4/auVovFXw1rF0nIMR2aj0D48rt392NT6zhwYPSiyoZARB4KXZaFPfZS6a1lCalKcy/48FJgACsEhS6YDdHBQK7QRJ+n2tObwcE4QdB2f0YZeYyUJeK7WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756325569; c=relaxed/simple;
	bh=meLDgphMIzrKjvme/9NyKwkff6sfs1AHm861URMwqb4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IytXqrEa7QBVV5EBDbwqfA3l+PSD7qUeel/ycJk1tgHIDP+u4BBLH9aDXuIHWWEWCJBrp0Jl5wED3nPWYDrE/fhdejZVuMJA5ktVvqFh9m7Vm3vvXIdM5SfLpMKTR6RwHY+7lB0xGJD4wthSdsKr8mP/wnlNIUsdDeQ4Ggk/BEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fs4jMqr5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RGEjpx018826
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 20:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eCTGEcbB5k6
	fBhyVH2N2aNB10W+jMPYCn5g3eW0CwJw=; b=Fs4jMqr5JCTbDd4qFcRfY/09Ofk
	eKJDb797kgpfG9loG4XpEYoqSI6XHNEfxufqT3Bwt0A2dwq1iUYlYIGiRZ7WXhxu
	PUBz0Cl0xkFJDyt6Jthf80vg/OrEgLmXGfohIUzaVyOT74yKtLrhp4BcvZXlKTOM
	vUWi9A/Njoa3QCXK/h61rrOJrTEgif7XFU1vjd3ktTgayO/R2IpfqSItgTlq/8uK
	bJ8mTgMGSvjBdvq21PF+0bT7UEejyb4AzVfFdIOLT7FHZ9pM0qr/KLp9SmsJm4lB
	dNAlV5UUiWkZlg/uMkO+5RRVLFUajDjG1LD26096NxVEAbl1xIevbf+kSIg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfnthp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 20:12:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b47173afd90so399337a12.1
        for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 13:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756325565; x=1756930365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCTGEcbB5k6fBhyVH2N2aNB10W+jMPYCn5g3eW0CwJw=;
        b=FjfpPtau8sn0E8ocRdLYrjnLGH3Yzawu4yt6L0yqkFpMOALP1NVLT4Fu2rumA7k9HI
         H5UnVX3paQl1WGjfnywD32/AfetZL8kN1cmfAlfToZfHEXY/YHWkMiG+pwFKnZEMXuq7
         FBvE8COAVwh64PLfPLWL0aKVRD2BLnuHxAWYsFjglBi9VNXbA5AbX+Fz9zoxBcG5tHa3
         +nc43Kj46kIyAGyaXgz8h6h5+tfCl5eV19PH/SwXrzrR3PYnmkWdBhg/Fext1IqhaQi3
         Mev/MqAxenVCfSFZfnDZTzJuhN8vmM0v8xihIUTcbf2JprUAXR/kUTJP79lp6udkjq65
         CLtg==
X-Forwarded-Encrypted: i=1; AJvYcCUc0MXwxDWkiIOSTWIMYz10+vAetrSw0i+mcmoXiYwXpjnCwK1IE76bbYVfEVc1IUUXfV/B4WxbCQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGuP6T91rzMHaW5ZgFYurY8n48rr6gdhYRVWX/H3z3OC0sKdgF
	JIGD3CE3xgmIUFI8M3ljzwn3YNus/+psK3qW8LFOh1pohkqO13RVitcEbprxvHKPVX4lPQ+yax2
	rAfD5S1Vg70/cR4Yq+PlzQ/JudDmTzSJ2XaHaFudfrG8ZcC4H3Cf9XC+gy5x4MHY=
X-Gm-Gg: ASbGncuaaM1jK2AGPV4eECUyC2WqilnF98ANb474n2Lf6Qhu5FvcXj02J9yqjs+gD/C
	2RqlxCuk3tDvcXdvDRsdvxqKTmV+VD9MgS5kI3NfJWZsyhgcY3mIzNxlSU2eL3jQVzNiQmRwiGs
	344JD4tWIBN7BhmMr4KBTn1sU0yPRd3bkrv+/rRMpUOsE7mY0/7qujoUUNULKw2hJHwFNtrXdez
	7z7M/LPiLTnsAso3yjbLqdZ6ITYhXwyLwRkURml3f2UII3e350ZLgSauuWZDS5SjU5YWPXjq8+G
	jpyZD/QhBLrGipDTBhW0RAgskuhqm34QKPIvRHgRBjMcvY3cOuOC98YWVBnbb8D5VrGYMAkd04b
	+BSBF6wCZg9zFj/lCu/W0DOBDF98=
X-Received: by 2002:a05:6a20:9188:b0:215:d565:3026 with SMTP id adf61e73a8af0-24340b5ada1mr27366898637.20.1756325565212;
        Wed, 27 Aug 2025 13:12:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIj8L+nwLix1KG/6QnjHpZZhIafsh1DBdgu75+84yKYOIB7X2r8rCg6cN0Ay9YbseD9uexTw==
X-Received: by 2002:a05:6a20:9188:b0:215:d565:3026 with SMTP id adf61e73a8af0-24340b5ada1mr27366868637.20.1756325564771;
        Wed, 27 Aug 2025 13:12:44 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cbbbaffdsm12185234a12.51.2025.08.27.13.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 13:12:43 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 1/2] usb: typec: ucsi_glink: Update request/response buffers to be packed
Date: Wed, 27 Aug 2025 13:12:40 -0700
Message-Id: <20250827201241.3111857-2-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250827201241.3111857-1-anjelique.melendez@oss.qualcomm.com>
References: <20250827201241.3111857-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXzCK+4kd7Ytse
 ULj2LbE9fqfnIcPs5VMCstGGkk+M4u5O2RIs1O3cVjtOA5pe5G/Ap1cWFFzGgFiXmgnclaMs2bv
 bQsew4AvdOV+Bl7w6958keImgwBMVsKUwEH/Hd4+rz/woWSQIsF/FZ3m6ejnIm9KZwW9bTqu5+L
 c3741jKKL9xCq1SJ497y0emM8ntCQt8K0xhsiuxOYgqdHHSldSJkp3h2Hh8Xq3C9SV9pLewTYZ6
 J+4IY5NtWLIMMjcfK7EVY/UKAcRwhCoFvQncVMlXqIIVQx7Cf5nehlWiz9Eo9Q/hRldAuCYZyuR
 l5sbpod5Ph+oml9CUiOKg0IdqMU3C1v17usp/24ZcD/a26kqtfJB2Qc0XQHQf0PvobYFGHHWrV4
 daHq28fQ
X-Proofpoint-GUID: deEPeDnNrEq2T31dMc8q0KKkpZ5ZT04L
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68af66be cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=OI1EoHIFZYFGuZb9aTAA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: deEPeDnNrEq2T31dMc8q0KKkpZ5ZT04L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Update the ucsi request/response buffers to be packed to ensure there
are no "holes" in memory while we read/write these structs.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
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


