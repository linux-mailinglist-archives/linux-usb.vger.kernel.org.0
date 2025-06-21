Return-Path: <linux-usb+bounces-24976-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F983AE2B11
	for <lists+linux-usb@lfdr.de>; Sat, 21 Jun 2025 20:15:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C68D1177080
	for <lists+linux-usb@lfdr.de>; Sat, 21 Jun 2025 18:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B110126A1DE;
	Sat, 21 Jun 2025 18:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aRDdACQs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BB42701D2
	for <linux-usb@vger.kernel.org>; Sat, 21 Jun 2025 18:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750529663; cv=none; b=DUwaEmMq3PZ1s71e/h4cJRyNDf29IJueFgstw0OSPZllOA1tjodlkNdg1KSW0nmYVgA6Qnmt/jf93nWqjocwOzyte933Vpb/gFsH0451ZmXM8+Qf08Yagb2fYTGGGsU3GkmwVxPiMHR8PVMqBG2kRsUHv1Cs4tuUg0Hs/vpH/bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750529663; c=relaxed/simple;
	bh=JNYxpLLFOBRtvMlzQKm/ZNif0iwVlobtKiwFXihfikY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JTIdacYm4BaOrEiFJNh+083nt7X3PTZ/nPaQOhMjxlgKEz8TXfOyBqRWRcP09lZ35qUKR9SIwVARnTOdHpBqEh/SBvvM6eFhcSi9Z9tiUwVwVY1ssiWnqEUQ/nZZhhiRcQ8aOvVyXamtCYS/CtcBtS7azygE7+XMLyrMw1XDuzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aRDdACQs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LHuE72028405
	for <linux-usb@vger.kernel.org>; Sat, 21 Jun 2025 18:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oirU1+a/+8yORbmhMEzS0Sl226rFq5hViGnYuTM/r30=; b=aRDdACQsnsIKaPsC
	6EZNmwi6rj2coudCih1V8klJVqj86soO3SEdo7N3QcThVWq9zCL/Ok0AgjQDprBZ
	wLa7VQ8+Ma61A45+ZrN2kim6u6Z5FocCufIEQ6NlgBlRU5i1M474Pd23FQuEpKWc
	bkS4OyaX04vTHy+BG6xwGfowwQvtecDUoXQtjzcHVLjB45ltYY6mvf8nKjgSoSQp
	00JloOXa6c5e+SL9s0MpbWgdjpe3cn536etUE3XcsS+ZQMK/nxYvnvIHWZWNq3rr
	YcX85/P/hMtn8VfPT7J72i6elHDHBK+Xyg4RmwDEoklbueL+dCQDDbp/y+7jD1N8
	OUtz9Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ds7s0km8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 21 Jun 2025 18:14:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c760637fe5so425672685a.0
        for <linux-usb@vger.kernel.org>; Sat, 21 Jun 2025 11:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750529659; x=1751134459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oirU1+a/+8yORbmhMEzS0Sl226rFq5hViGnYuTM/r30=;
        b=w5s+3eg4GE4K+/Fg4jiuBrNF2VQ6xpTfU3NEzON4lckzqeR3aBUyKOufMHSWx7VFc7
         A0KCxpHNhrzDtBXiBSI2aQdIVoIHDu+a1tAmFeJeohBWh/YJNBC6IA/U/ZNuFypUy/bA
         Al2xQbWvFUsjxp6gLa2yiwblZsv1dEHhDgSXkQsPIdF01+2rBEjs4B6eiKXxdPEE6BWS
         InCTwCKZSeIDzKOB7J3yNcBhn1FtMJ9xhQaWKlV/PVyY724uwnu1Ea6p6MrmG6GjF5wF
         2HSAVyIFH4rIuxBCG/GVMGpSEuTKlO3BVri0Cq3jd8gne9Y3U6k8guyr3ympsugtfXbu
         F2Ng==
X-Gm-Message-State: AOJu0Yy8tpkqYKaongucZXhjXuycMPnYOWTw4lyKUT9PSYmdge798Moi
	HxJFQUdeBLQQGPl+BbOsGhSNk1W+oP9xTORIqzPbnrxenEdmD9jYq9g7LMeYNDcVtq4P/r2ukXv
	5OF/By8H2Usyn6lCnzs45KKGYCv67qEAvTIp+XLH6Qb/ETWmcNCxabwZ+u8t80Oo=
X-Gm-Gg: ASbGncvKWis1dau581ymSOVKbrBzWdBwAd3yXJ+UI08JKyIc3SuD7vS91YCxMAp9Q8f
	8CT5kV+8G6QpWLkE4Bf1LVXb+v4a5K+zP5a5JkSsSHgIdtF7iUR+GjMc8nXPJZVGmBqxLbDAac5
	oBfWU2D78ZFoBvplNEGVc0MUep8zd9eq5vmqmWGZPdOuGxHZmvAsv4pbQ3a+NrAU0nndC+JyjOw
	cGc5Ta1AQuF/PFiQ3KRRX6sIz4irujZErvj8wgst/ONsE7lbl7gKf6zxrKi5cSdS2rzsxsJLb4T
	h/HW4163GEoTMSIGFu0o/PdXH+SzQ/2VjeRp9D8HTEsb1XcWk/AjYbLt+24kz6cE//rM/eDA0nH
	0tPsR1n7dFU9t+C9XNWm3tQruiX1eGn5Yfto=
X-Received: by 2002:a05:620a:8087:b0:7d3:a7a7:27ad with SMTP id af79cd13be357-7d3f9923f29mr1085888685a.37.1750529659589;
        Sat, 21 Jun 2025 11:14:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBm728IxfVCsHScLqUKxUSwnu6QjuV90MNM2egI9dUzP6ktUhVo2klu+wAiUSpjtngW1id+A==
X-Received: by 2002:a05:620a:8087:b0:7d3:a7a7:27ad with SMTP id af79cd13be357-7d3f9923f29mr1085885285a.37.1750529659186;
        Sat, 21 Jun 2025 11:14:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cf36sm752336e87.86.2025.06.21.11.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 11:14:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 21:12:59 +0300
Subject: [PATCH 4/8] usb: typec: ucsi: yoga-c630: remove extra AltModes for
 port 1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-c630-ucsi-v1-4-a86de5e11361@oss.qualcomm.com>
References: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
In-Reply-To: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2166;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JNYxpLLFOBRtvMlzQKm/ZNif0iwVlobtKiwFXihfikY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVvZzb6rUS5eMMljhrS0Q+E/0bKqx4EhaapoTC
 S/gAg8Wn3mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFb2cwAKCRCLPIo+Aiko
 1cxcB/9Cy6IVelfifZerWEZXrYultMWDVJdyoWiBy6c0sL9bdpy6ECtRtiIw5OaGPpz0F6cwEYE
 x44jPn8Lz3vuShxXYwFwp1mFWQIJeidrdEKh5elCZDfvRVdXZqMCvQL6zFkUtuXP/wkBIAIZgIL
 Ipo3XzsKrczew5P7JvHGrYWtPIE3+pr6VZY4KNym4wxbjxXYlZkxeTzSRpc2SzG2NyxpNSIAf6T
 UMU9j+jmu3iacNjuVkjTrJJDuvurdsBq1rVYzH9mK0yBK8r3/JAWUES/Bc1q9bbBgXd28dpRdm/
 tRNp6uTiYNnpB3SWqkgUMhk01YUo3xCInk21AWqsJ5CAqimA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: dD0tcFG0ZiT2UzgEhc8I0gNwyjv9XCCl
X-Authority-Analysis: v=2.4 cv=cIPgskeN c=1 sm=1 tr=0 ts=6856f67c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=L9Ihpj2tn0joOnW3KS4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: dD0tcFG0ZiT2UzgEhc8I0gNwyjv9XCCl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDExNSBTYWx0ZWRfX7hwkDz3yjJOl
 5BUtBk9tDVaFmGlkyCsQchvsr6MxJ54xqk1C2uSr/kMvkThx8mwJsdEHgbx+/zxVPQFTp39Uocl
 K8d0BYq6RANhn0XX5kYdWA8cXqCiOZMyMMg4YHwAQuEfvJZjV9WTLj4PbSYAa/zxVw7JuQkpFTt
 geVmwi5lvrV44WUf0RCOGp2I/mb/HQbqu7Yes/O+9cEVQketZv7kgJEjtfLgzctGCqOkDOu70A0
 BdgTrgP0iz/mWWeC1Q90FJUK/jjJ2seac6eBiW1SRzBXKP1VeRojtUv6BPb4m6Zl4gOIiBlsbMr
 mzumbjxuzMMo1H/A5ukD0eMZ94LIH4eBwLN/VKHQ5XaKj5l2ANXxxrYwYTcFlJpUqA0dYFdX7If
 LF1e3eURrH+/bqqC7pFBIvIMhzXNbNJIX5tAfX2g68dRtMMiDm2rwQW+pz/HNCbWM0f72UNO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210115

On Lenovo Yoga C630 the EC firmware is buggy and it cat return altmodes
for a device pushed into the port 0 (right) when the driver asks for
altmodes for port 1 (left). Since the left Type-C port doesn't support
DP anyway, ignore all UCSI_GET_ALTERNATE_MODES commands destined to the
port 1.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index 7cc1342d6e2f1d2c6f5b95caa48a711a280b91d3..2005f64ebfe43ca2bcada2231ff99c578fdce877 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -71,6 +71,27 @@ static int yoga_c630_ucsi_async_control(struct ucsi *ucsi, u64 command)
 	return yoga_c630_ec_ucsi_write(uec->ec, (u8*)&command);
 }
 
+static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
+				       u64 command,
+				       u32 *cci,
+				       void *data, size_t size)
+{
+	/*
+	 * EC can return AltModes present on CON1 (port0, right) for CON2
+	 * (port1, left) too. Ignore all requests going to CON2 (it doesn't
+	 * support DP anyway).
+	 */
+	if (UCSI_COMMAND(command) == UCSI_GET_ALTERNATE_MODES &&
+	    UCSI_GET_ALTMODE_GET_CONNECTOR_NUMBER(command) == 2) {
+		dev_dbg(ucsi->dev, "ignoring altmodes for con2\n");
+		memset(data, 0, size);
+		*cci = UCSI_CCI_COMMAND_COMPLETE;
+		return 0;
+	}
+
+	return ucsi_sync_control_common(ucsi, command, cci, data, size);
+}
+
 static bool yoga_c630_ucsi_update_altmodes(struct ucsi *ucsi,
 					   u8 recipient,
 					   struct ucsi_altmode *orig,
@@ -98,7 +119,7 @@ static const struct ucsi_operations yoga_c630_ucsi_ops = {
 	.read_cci = yoga_c630_ucsi_read_cci,
 	.poll_cci = yoga_c630_ucsi_read_cci,
 	.read_message_in = yoga_c630_ucsi_read_message_in,
-	.sync_control = ucsi_sync_control_common,
+	.sync_control = yoga_c630_ucsi_sync_control,
 	.async_control = yoga_c630_ucsi_async_control,
 	.update_altmodes = yoga_c630_ucsi_update_altmodes,
 };

-- 
2.39.5


