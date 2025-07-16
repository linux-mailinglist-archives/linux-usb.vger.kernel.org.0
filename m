Return-Path: <linux-usb+bounces-25861-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E31B06AE9
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jul 2025 02:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DCE016BCDA
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jul 2025 00:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B90219EAD;
	Wed, 16 Jul 2025 00:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9DI5IvW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35083215F6B
	for <linux-usb@vger.kernel.org>; Wed, 16 Jul 2025 00:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752627150; cv=none; b=V+uWWoP0XZwuYsl4lQutDK75UDmXgYRAQ1tNWQ7RZKIlx2P21QJwvDBj50ngYFIKD+z3nTBqROg2H35KssvDF1un657GmqfzMh+hlFfCBzcDBav6fM+ab8HNDETC6x7qUtsDTg+qp+xoD6mVKt+svR0mwJrgi/DWdsuQ2cWWXps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752627150; c=relaxed/simple;
	bh=KMT5z8mhczbyFwWS7RYpw5Qrr1RGxPSb+bo/wxuCfOk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RqRDZummKynHoYvvdSLi6liOnTpkcq2AFxZq5ppMdVN+61BDFAMUHmLvEsNmwj3yx8by3aikYxh5hgqFt61ojGaUTGK4nrczpLYSaFCgg8Pf1VemRmdO84+mcD3tLuZj1wSJ9LQSGL6HDL0XP/sK1Y4Y+u+ATHGFwT/wuzhfUVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9DI5IvW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDMo3029553
	for <linux-usb@vger.kernel.org>; Wed, 16 Jul 2025 00:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=25xQM2KEtU4vblrflgweIvHQ5dspnQlwKDq
	ajlJ5ujY=; b=K9DI5IvW4EJecxEAH+s8vIlHUrT511UVAXWSQrvov3zfsjRY8Vt
	Sq9drhV8OecLtG386+YC7DcEEKjlckjLElKpB5VNAsmcWs0eTa4xjjpVmtGZbTLF
	1UalJyhgSTPLLQ4lwWNJ9WmxbRRiPP4VDYU8HMX4v4bOEFwMRJCyQcJRM/FFIFKQ
	X2S1yCY7b+J2oL90EhQYZcmlQDYbuzrt0NaHu/SnqKqj9p6ed37Kec7nYWqM7Pmg
	AejiXKDAuKdTFFyHLLPdKdXF12qLmqBW0N0lXqtGty1LDMgHQ+Qb0Lp7kLxl3Uj+
	jPQiV6kPrX/5P+ZfMY0EOzs79mk0U11ya4w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb23g9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 16 Jul 2025 00:52:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-747ddba7c90so5000582b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 17:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752627147; x=1753231947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=25xQM2KEtU4vblrflgweIvHQ5dspnQlwKDqajlJ5ujY=;
        b=nRiFAM7goRGYxjYgn1lwUpRRk0hrzVClCqXzChQn735S9I8p8jzkukAQuVkZ6stdFK
         27JDV75xoNJGrMEoUH7p7M0KuViABwVGwAs4lZjX7MwBNtbit8EgzOUjInMGAJU0mKkf
         g2neZ57sT3CLzctOMNcBf3f4k4cpapdeyhdVvynPQsLysOjL8A+Ch3MK2HEpeDECbNDJ
         5DXH6w81/z4nVw0aJXyinofLXtFjxrkBjks/thTIgDa/F1TeSZu7iDadpN015tc957QO
         CBcoT87IWfgCZ56H6uB7Wl63ogEbhH4XNEa9F+wOWMrrhAGPUirKSAf40hNTe/f+Ofqk
         DqJg==
X-Forwarded-Encrypted: i=1; AJvYcCVG0nATHO1Qc/SmIf3jlKQ9YjOWnaKQgXvYjWDnlmqhVeviCuyAc7tP+BenLwCGx4sgBDCFCUiVdW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlMPogA6PbZPlaby4vh78l29TU0WL5bwklU7URgLI9ZjpganBq
	mETWcdjEvbhAwq0d1yOWITXq7axSz79AZ/4w37EsoNZi53cHPxY7l27EXsF1rTQ7W6aTKYHDtL/
	SDEpSoDN2nTh6bIW5C0EntQQf/nzKgQ0A0kAgNUi0aioRjQOkD87ezdvyrL5vIEg=
X-Gm-Gg: ASbGnctwBrgxUWB/Y14H814GMlaejAd/hXvF6fxWO/g54+G3q98XtXQIDKxCOQVJKr7
	z7PJI5rBU0s7V+G+5xVisPJFfW3X0cLeIvYPaqar+M49yldgEXOxL6wJFePcg+e9Lxoqigb2N6W
	SVPrVILkBJL4R1/DoUTAnWjjIkaSCfzV0ZWjZLlb4sE4vTkTPzUJXxKVeNl9KKeKHdqXgS/cqBB
	2QAjK+ftErdWFD+nYAC+l06eJZxfUaO7i8Gmzh2pFmtXt8RujPrQRvrVMooFFx+Qz+4DpZt5cuC
	xlZgLH7FNlaiLIMwri8fkmN+HYYzlKnJ7ornMwZK4zt6aBZ2ZMbfzd1frWAZ202H2iLi4sGxwVs
	3N9qHgCjmBZ8yKWJJxS8tyFsBYZI=
X-Received: by 2002:a05:6a21:648a:b0:231:4bbc:ff09 with SMTP id adf61e73a8af0-2381313ca9bmr1001222637.36.1752627146627;
        Tue, 15 Jul 2025 17:52:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYu/eOGeqhr9LJldFOKWzeuC3GEI23AZZeiCfg36XrTPAaeml4wmmR1iwzwasmrypGBn2QCQ==
X-Received: by 2002:a05:6a21:648a:b0:231:4bbc:ff09 with SMTP id adf61e73a8af0-2381313ca9bmr1001189637.36.1752627146224;
        Tue, 15 Jul 2025 17:52:26 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6f7507sm12752326a12.56.2025.07.15.17.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 17:52:25 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] usb: typec: ucsi: ucsi_glink: Increase buffer size to support UCSI v2
Date: Tue, 15 Jul 2025 17:52:24 -0700
Message-Id: <20250716005224.312155-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 98BF5tdgBSghzEa3ir96doOi_jzBKjgM
X-Proofpoint-ORIG-GUID: 98BF5tdgBSghzEa3ir96doOi_jzBKjgM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDAwNSBTYWx0ZWRfXy2x+XvBxklH3
 SKL5SXhw8nKLCUjRljosF4/yN8NUAG9S2Ew8vpvKOwFEGbsEAYxwmnDIpEDV8bNYNMK+vmJdt0x
 tCUgIsM1BpvnvNLpUNtA5i97VimsPI45WmUtoKZnsC16HvFEoCkW60QgSpOstXww7gymDrongVI
 oNuW6UMs0FR+CoQb/ZWn7OYknqHtmFtVnWdE6JIE111BORH2ce2EW4fER8Jo5XMmi/+6j9IUWu2
 +wxiz6Ut2C84JUC860f5hOKoc+wbgg67ZpJVtl5Uom7jsVv294bml2pmKcyIVryqbKKIsYMvf5T
 9fLEp+0RPNs7jGNePVhnNNhM4lRFLDkguIwSW/P6NRjuATdojSxLLyiPljx+Ix3MgOMBgX5ZCnE
 2LEUR+GjNst0NDBZjQX7X1Z1Cv/nqfsdUK8Kn7EnC+YXoDwWdkEf9ci0Lwb3Cozntr7o+z2c
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6876f7cc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HougwLLIzSuBeMajkRwA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_05,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=713
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160005

UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
16 bytes to 256 bytes each for the message exchange between OPM and PPM
This makes the total buffer size increase from 48 bytes to 528 bytes.
Update the buffer size to support this increase.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
Changes since v1:
 - Defined buf size in terms of other UCSI defines
 - Removed UCSI_BUF_SIZE and used the explicit v1 or v2 buffer size macros
 - Removed Qualcomm copyright
 - link: https://lore.kernel.org/all/20250624222922.2010820-1-anjelique.melendez@oss.qualcomm.com/
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 58 ++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 8af79101a2fc..2918c88e54d2 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -16,10 +16,10 @@
 
 #define PMIC_GLINK_MAX_PORTS		3
 
-#define UCSI_BUF_SIZE                   48
+#define UCSI_BUF_V1_SIZE               (UCSI_MESSAGE_OUT + (UCSI_MESSAGE_OUT - UCSI_MESSAGE_IN))
+#define UCSI_BUF_V2_SIZE               (UCSIv2_MESSAGE_OUT + (UCSIv2_MESSAGE_OUT - UCSI_MESSAGE_IN))
 
 #define MSG_TYPE_REQ_RESP               1
-#define UCSI_BUF_SIZE                   48
 
 #define UC_NOTIFY_RECEIVER_UCSI         0x0
 #define UC_UCSI_READ_BUF_REQ            0x11
@@ -32,13 +32,25 @@ struct ucsi_read_buf_req_msg {
 
 struct ucsi_read_buf_resp_msg {
 	struct pmic_glink_hdr   hdr;
-	u8                      buf[UCSI_BUF_SIZE];
+	u8                      buf[UCSI_BUF_V1_SIZE];
+	u32                     ret_code;
+};
+
+struct ucsi_v2_read_buf_resp_msg {
+	struct pmic_glink_hdr   hdr;
+	u8                      buf[UCSI_BUF_V2_SIZE];
 	u32                     ret_code;
 };
 
 struct ucsi_write_buf_req_msg {
 	struct pmic_glink_hdr   hdr;
-	u8                      buf[UCSI_BUF_SIZE];
+	u8                      buf[UCSI_BUF_V1_SIZE];
+	u32                     reserved;
+};
+
+struct ucsi_v2_write_buf_req_msg {
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
@@ -131,8 +143,9 @@ static int pmic_glink_ucsi_read_message_in(struct ucsi *ucsi, void *val, size_t
 static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned int offset,
 					const void *val, size_t val_len)
 {
-	struct ucsi_write_buf_req_msg req = {};
+	struct ucsi_v2_write_buf_req_msg req = {};
 	unsigned long left;
+	size_t len;
 	int ret;
 
 	req.hdr.owner = PMIC_GLINK_OWNER_USBC;
@@ -142,7 +155,18 @@ static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned i
 
 	reinit_completion(&ucsi->write_ack);
 
-	ret = pmic_glink_send(ucsi->client, &req, sizeof(req));
+	if (!ucsi->ucsi->version || ucsi->ucsi->version >= UCSI_VERSION_2_1) {
+		/* If UCSI version is unknown, use the maximum buffer size */
+		len = sizeof(req);
+	} else {
+		/*
+		 * If UCSI V1, buffer size should be UCSI_BUF_V1_SIZE so update
+		 * len accordingly
+		 */
+		len = sizeof(struct ucsi_write_buf_req_msg);
+	}
+
+	ret = pmic_glink_send(ucsi->client, &req, len);
 	if (ret < 0) {
 		dev_err(ucsi->dev, "failed to send UCSI write request: %d\n", ret);
 		return ret;
@@ -216,12 +240,26 @@ static const struct ucsi_operations pmic_glink_ucsi_ops = {
 
 static void pmic_glink_ucsi_read_ack(struct pmic_glink_ucsi *ucsi, const void *data, int len)
 {
-	const struct ucsi_read_buf_resp_msg *resp = data;
+	const struct ucsi_v2_read_buf_resp_msg *resp = data;
+	u32 ret_code, buffer_len;
+
+	if (!ucsi->ucsi->version || ucsi->ucsi->version >= UCSI_VERSION_2_1) {
+		/* If UCSI version is unknown, use the maximum buffer size */
+		ret_code = resp->ret_code;
+		buffer_len = UCSI_BUF_V2_SIZE;
+	} else {
+		/*
+		 * If UCSI V1, use UCSI_BUF_V1_SIZE buffer size and
+		 * update ret_code offset accordingly
+		 */
+		ret_code = ((struct ucsi_read_buf_resp_msg *)data)->ret_code;
+		buffer_len = UCSI_BUF_V1_SIZE;
+	}
 
-	if (resp->ret_code)
+	if (ret_code)
 		return;
 
-	memcpy(ucsi->read_buf, resp->buf, UCSI_BUF_SIZE);
+	memcpy(ucsi->read_buf, resp->buf, buffer_len);
 	complete(&ucsi->read_ack);
 }
 
-- 
2.34.1


