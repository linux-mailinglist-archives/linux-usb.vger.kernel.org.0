Return-Path: <linux-usb+bounces-28623-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D037B9C8CF
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 01:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DF191BC081A
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 23:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4822E2C027A;
	Wed, 24 Sep 2025 23:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AvBPHbpg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D5429D289
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 23:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756399; cv=none; b=TYX0AvZsgur/6yKKL4uDHaXFXCmu652YR3g42DamVWu13m4yoPJYnVAJah7wH/ylTku0uuPJArRJ+vLbVEE4N/p5v2sF5XDMUQlTorNBE2LvZ3CtS88qJzMpX6Ax1GBkYRiCO18Tqte8LV7zHgyIVs5W9hVUFkFrx8Ee6mivC00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756399; c=relaxed/simple;
	bh=KK69pnbAoNl5x144Z6VFHt42qN29ZBsdut7CQJHZRrs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=otaWOcUgBjg5+bfuWfPlpX/yxDncIYRlLUS1adQbewdP+tbM73MIu9pd376bhXO3TxWUxKHvBhi6AozWchuWajv+hLEk/ZYcIqRCsg28KDjSYjjcbdImVrASuB+SzaZDZJ+dOIhe0T2JpgExMskRsKdqjWDK5GABG5SavX1dkS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AvBPHbpg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODTovG029717
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 23:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GYGy+4NKYRu
	cBFROr7rYVhlIyW1M+CzZsu0iJLkrIuE=; b=AvBPHbpgGphAVrGGZUK/MJP9vqS
	SrZSJcrmTVfWtBT98muad+oIgnxKNSjWd9XVms5paPJOdPWitc+93RdizMGyViFl
	enJ1vfR5tbB9W+oV3zbB1vKXM5MB4lmVcwHuAiXgwobgryiaUp4TKz7YJCo4/rbJ
	EdywNnQADtT9DId+fihOlj0t8/4uW9AywtrxknT/vsth588nKPzt0L/tpOqOMQzc
	zvh853nSLVORqhJgvCgzzN2AJoPW5TAKQbDr9/9gZAOw3YH+406rrxqFAaLPyIm0
	cb130naS/dJCafewk3tc6cIC2Pl8q4COQD0NhfkJHmKQ2M9QvgsSUJNsSiA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fnwcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 23:26:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2699ebc0319so3084395ad.3
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 16:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756396; x=1759361196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYGy+4NKYRucBFROr7rYVhlIyW1M+CzZsu0iJLkrIuE=;
        b=Xe1grYR/OJbJTDhgHTm7a3/PIh4Se5lMgS6Aw93qLPwziWpyHj1pRpBzXU2MRfORO/
         NqU0/ggV6hE7n5fMq7w+1poQcg27/sxWp68ID5z7boz2fEOZyBXlkojqF+32uMb3TCdr
         b+IiGZZvOpkiylShL3WF51xNO77xv1BGNTma2J/UGFdy7DMs5K+ihMptwyicnmBDv3IG
         A5hnv2NJ1CFQio94zW8dQxg2nb9nZp8RYp3IJ4aJpiwwvXeLkjuIS0ShrHf8WheH6Ha/
         2Sn8Ld9aS7MgTaKbC+rLKAejkElAelFzXFcJgdXuyHIq+4o4xkR/vv7UTMLpOG14aeF4
         Xs5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsfxtRa55rFg6bPKzjTmalx66YeKdT49LRcdakHJ/PkDpHkx4SM5Y2ByuLkFe24ALn5N3qKRkX6PI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQmv1ITGc0m9/SljwsAoGma+uN2B550cBDbjB+R4sHRsxCJfwO
	jk7683zrVp1TxH1y1XjPZvIlOVaNgK7UELKzOGoUrIJqn4FAFMFIxk+BuQcHGFZ1EMt+LXLbIvH
	cFasNcA72Bw9BQ6ubxVOHV/U0kYjPks1L3tqrQvk7RrS3AZkkk/gQxChkUIKKf9M=
X-Gm-Gg: ASbGncuazUVsFXvHgEQOYqJ+u8JWYy93CDRGI1WZsvYAXsvtUmDZsq8rQLWQjEiD6+A
	dIy71fHicSOKWpRUk7bl+VZNgvPLaqvAsL4n+QxaH5d/LYM6AtM3VPysBUcavquCTwAYAweY7Q2
	qHpM+xvUCEhpLR076XkNs+IXYwY7NUKXGDRYcunYAtYdvA0d1Mr5zYyZ5xFYvwAF/DH/pmwqE45
	IKtB7RaF20m2Bp4/oEwBAJ2kRkzwaKxiYqLJjdqqhhN+nBoGWxmJOG3eyElR2Rckm0nCwE49E1T
	D1SVh2h/tkMGqSmuTZklEwdRtWz3qpsI4Vy739NT0S9/hpjevNgGBxCpTtG4vEPA0xlVCotTO/R
	t8pRB0rf/BN9a0scjd8o22PgyWJU=
X-Received: by 2002:a17:903:41cb:b0:267:ba53:8bd3 with SMTP id d9443c01a7336-27ed4a7f36fmr15578895ad.28.1758756396287;
        Wed, 24 Sep 2025 16:26:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKn09t+UKPyA6h0HbQGalUfPWYpaUodXo/WnK1LPlyaXBPEVy2q7a1JeG82EUURTm4VlE8bQ==
X-Received: by 2002:a17:903:41cb:b0:267:ba53:8bd3 with SMTP id d9443c01a7336-27ed4a7f36fmr15578685ad.28.1758756395854;
        Wed, 24 Sep 2025 16:26:35 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed68821ebsm4005735ad.84.2025.09.24.16.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:26:35 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 2/2] usb: typec: ucsi_glink: Increase buffer size to support UCSI v2
Date: Wed, 24 Sep 2025 16:26:31 -0700
Message-Id: <20250924232631.644234-3-anjelique.melendez@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: jdBgrTe8ZE6_R4r9CKQMyuRRTHb3UufW
X-Proofpoint-GUID: jdBgrTe8ZE6_R4r9CKQMyuRRTHb3UufW
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d47e2d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=pUSBQGTQOVeKylh7KsIA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX6o0sqfXwe43L
 qdIYWSK4VUSWToeFPKfYe3xDhDNZw6aUZjVWMnH6K/mKqNg+tubdBTf4lQBl9dP8JrPdJ2xtDY2
 knzlklGIuNobeDI8lvxJ9oQ/6vjTCl9y2u8CM7g1Noc7BXPdtkmIcNb97g9GKoTwiJsSmg+k1Ps
 T1MjceX26Lg9C+f3X/UuvFvcDBAzPeFBQTj2IeQJtLcYLWwcMcJbcw6AADHF/uzcQPVvQ1dNLQk
 +10amEDluapeFBWY7qdajXzvs7AKNYiOivmxIMEJrb+Be9c7hq+mUxaRhK5WbYkcaK90whu22e+
 YTeos8c/3W6dPoatQAIrOVbce49zFs7xEDGlT7nfXuZuFHUJWbXhE08gC+FOQx8nO8kBgQV4R3B
 3i+vsjN0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
16 bytes to 256 bytes each for the message exchange between OPM and PPM
This makes the total buffer size increase from 48 bytes to 528 bytes.
Update the buffer size to support this increase.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 81 ++++++++++++++++++++++++-----
 1 file changed, 68 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 1f9f0d942c1a..7f19b4d23fed 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -16,10 +16,10 @@
 
 #define PMIC_GLINK_MAX_PORTS		3
 
-#define UCSI_BUF_SIZE                   48
+#define UCSI_BUF_V1_SIZE		(UCSI_MESSAGE_OUT + (UCSI_MESSAGE_OUT - UCSI_MESSAGE_IN))
+#define UCSI_BUF_V2_SIZE		(UCSIv2_MESSAGE_OUT + (UCSIv2_MESSAGE_OUT - UCSI_MESSAGE_IN))
 
 #define MSG_TYPE_REQ_RESP               1
-#define UCSI_BUF_SIZE                   48
 
 #define UC_NOTIFY_RECEIVER_UCSI         0x0
 #define UC_UCSI_READ_BUF_REQ            0x11
@@ -30,15 +30,27 @@ struct ucsi_read_buf_req_msg {
 	struct pmic_glink_hdr   hdr;
 };
 
-struct __packed ucsi_read_buf_resp_msg {
+struct __packed ucsi_v1_read_buf_resp_msg {
 	struct pmic_glink_hdr   hdr;
-	u8                      buf[UCSI_BUF_SIZE];
+	u8                      buf[UCSI_BUF_V1_SIZE];
 	u32                     ret_code;
 };
 
-struct __packed ucsi_write_buf_req_msg {
+struct __packed ucsi_v2_read_buf_resp_msg {
 	struct pmic_glink_hdr   hdr;
-	u8                      buf[UCSI_BUF_SIZE];
+	u8                      buf[UCSI_BUF_V2_SIZE];
+	u32                     ret_code;
+};
+
+struct __packed ucsi_v1_write_buf_req_msg {
+	struct pmic_glink_hdr   hdr;
+	u8                      buf[UCSI_BUF_V1_SIZE];
+	u32                     reserved;
+};
+
+struct __packed ucsi_v2_write_buf_req_msg {
+	struct pmic_glink_hdr   hdr;
+	u8                      buf[UCSI_BUF_V2_SIZE];
 	u32                     reserved;
 };
 
@@ -72,7 +84,7 @@ struct pmic_glink_ucsi {
 	bool ucsi_registered;
 	bool pd_running;
 
-	u8 read_buf[UCSI_BUF_SIZE];
+	u8 read_buf[UCSI_BUF_V2_SIZE];
 };
 
 static int pmic_glink_ucsi_read(struct ucsi *__ucsi, unsigned int offset,
@@ -131,18 +143,34 @@ static int pmic_glink_ucsi_read_message_in(struct ucsi *ucsi, void *val, size_t
 static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned int offset,
 					const void *val, size_t val_len)
 {
-	struct ucsi_write_buf_req_msg req = {};
-	unsigned long left;
+	struct ucsi_v2_write_buf_req_msg req = {};
+	unsigned long left, max_buf_len;
+	size_t req_len;
 	int ret;
 
+	memset(&req, 0, sizeof(req));
 	req.hdr.owner = PMIC_GLINK_OWNER_USBC;
 	req.hdr.type = MSG_TYPE_REQ_RESP;
 	req.hdr.opcode = UC_UCSI_WRITE_BUF_REQ;
+
+	if (ucsi->ucsi->version >= UCSI_VERSION_2_0) {
+		req_len = sizeof(struct ucsi_v2_write_buf_req_msg);
+		max_buf_len = UCSI_BUF_V2_SIZE;
+	} else if (ucsi->ucsi->version) {
+		req_len = sizeof(struct ucsi_v1_write_buf_req_msg);
+		max_buf_len = UCSI_BUF_V1_SIZE;
+	} else {
+		return -EINVAL;
+	}
+
+	if (offset + val_len > max_buf_len)
+		return -EINVAL;
+
 	memcpy(&req.buf[offset], val, val_len);
 
 	reinit_completion(&ucsi->write_ack);
 
-	ret = pmic_glink_send(ucsi->client, &req, sizeof(req));
+	ret = pmic_glink_send(ucsi->client, &req, req_len);
 	if (ret < 0) {
 		dev_err(ucsi->dev, "failed to send UCSI write request: %d\n", ret);
 		return ret;
@@ -216,12 +244,39 @@ static const struct ucsi_operations pmic_glink_ucsi_ops = {
 
 static void pmic_glink_ucsi_read_ack(struct pmic_glink_ucsi *ucsi, const void *data, int len)
 {
-	const struct ucsi_read_buf_resp_msg *resp = data;
+	u8 *buf = ((struct ucsi_v2_read_buf_resp_msg *)data)->buf;
+	u32 ret_code, max_len;
+	u32 buf_len = 0;
+
+	if (ucsi->ucsi->version) {
+		if (ucsi->ucsi->version >= UCSI_VERSION_2_0)
+			buf_len = UCSI_BUF_V2_SIZE;
+		else
+			buf_len = UCSI_BUF_V1_SIZE;
+	} else if (!ucsi->ucsi_registered) {
+		/*
+		 * If UCSI version is not known yet because device is not registered,
+		 * choose buffer size which best fits incoming data
+		 */
+		if (len > sizeof(struct pmic_glink_hdr) + UCSI_BUF_V2_SIZE)
+			buf_len = UCSI_BUF_V2_SIZE;
+		else
+			buf_len = UCSI_BUF_V1_SIZE;
+	}
 
-	if (resp->ret_code)
+	max_len = sizeof(struct pmic_glink_hdr) + buf_len + sizeof(u32);
+
+	if (len > max_len)
+		return;
+
+	if (buf_len > len - sizeof(struct pmic_glink_hdr) - sizeof(u32))
+		buf_len = len - sizeof(struct pmic_glink_hdr) - sizeof(u32);
+
+	memcpy(&ret_code, buf + buf_len, sizeof(u32));
+	if (ret_code)
 		return;
 
-	memcpy(ucsi->read_buf, resp->buf, UCSI_BUF_SIZE);
+	memcpy(ucsi->read_buf, buf, buf_len);
 	complete(&ucsi->read_ack);
 }
 
-- 
2.34.1


