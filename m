Return-Path: <linux-usb+bounces-24979-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52636AE2B1B
	for <lists+linux-usb@lfdr.de>; Sat, 21 Jun 2025 20:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD2BD1769FE
	for <lists+linux-usb@lfdr.de>; Sat, 21 Jun 2025 18:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88B6272E5C;
	Sat, 21 Jun 2025 18:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2XRLuwa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170BB271477
	for <linux-usb@vger.kernel.org>; Sat, 21 Jun 2025 18:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750529669; cv=none; b=o5njZIn4dbaZ70myIn22eK1Mc/5ohySh631/YIqynwrEpWB3zutx2tUCUxpIHy4/DM7EGUcLUwRld7711AZkESkm3cGYzbwIDwFLIazWdiDgYzx3any0peIDydAisC2OzB3ll6I5H0f56TUhlYC9njo4wC3qGN+rt65+7Wu8IFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750529669; c=relaxed/simple;
	bh=Vp5Fme7/3hYqg8ZC4exosk/7eg4G/1nTlZJs2jkgM98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qbiTLxhn3DQpcVvuL8PMTpzNJbLtTtXx3DFDJd6bf4q0LFFrG1qjpHG8gS2vUo1svL574/l0SMlZsLXooCHpfqm709r8fBtFUgdP/EXW7IXRElnbRA5ZNyY8daHMWMqx722cAqyLxmEMv+yjQ+2aCAbaK35D0wfNtIVzWvmxa7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2XRLuwa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LFwCEa027726
	for <linux-usb@vger.kernel.org>; Sat, 21 Jun 2025 18:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i0hBPSYquU2It6N5un/PFHS9t4oxEjLZu7nUhJVo2lc=; b=b2XRLuwaub69Oghr
	/816m92bzejA8lRQvpA6x+ay5CRJfD2HiP5dXDUt1x2YuxXF9pZ1zUq7wYWWp5qJ
	ys9GO0NzWJb/MRkkQTxDE94KYPS8i3IU0YoH47iELWxBP97OqkYfRh8aGppLLlGc
	+K2ExuMmk0Lkq6Kmvqpqe7fR1rYADQMCUS1tXhmvssu6l3OE8AChWJS1lS+BepcB
	EFGh7o4WsdkuUcmQRwABPLWrVIPkAzbhKoqiC+CkWMaE+UV6OtVaTJWLnyuZIENU
	fPsJSV+RyqRVRP+pzbmgx8/Sj0PWtpm8RVjK+bdERat/QgIYe+qWso1ePzxHt+mS
	XTA9oQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dpqtruh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 21 Jun 2025 18:14:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d22790afd2so381053285a.2
        for <linux-usb@vger.kernel.org>; Sat, 21 Jun 2025 11:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750529665; x=1751134465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0hBPSYquU2It6N5un/PFHS9t4oxEjLZu7nUhJVo2lc=;
        b=wMBYvOZDK4ggPn8Dc9v2oEsJh5CjpN47PdfmK3gktQp88sZ4hT4QrwYcJ42oiEHIYB
         01UnV3tF8L/1AqR6TLbEVFjeeFNWC6kagH1kd1V6LZEJ8MzSm+U2NvslbSIeDfvswfWt
         94tm0FdUaecBdFMJ1/NL6i68+SW/PwTBPII/dhIsdH8FM03uESI/rjsQnpmjhOdRAgZS
         UUP6LZPUXoS6kUQ2E55SKrrO/qgeOon9wJiO5nr04EJ0XURzj6DHOYaaeKC+BKPiKUOk
         IpqJvMnyEefJkCnLWq36YNS4R3h4qOeAc4g5u66/2uGkYZoVK3nipmlwBXJ7EC5Vc3Rh
         j6Sw==
X-Gm-Message-State: AOJu0YwoJwqMqJArxPOy4rtrgjW4/N4AzEJdsiDPVLWc+JzZeaN6nOqE
	BQXOf7X2yVF4/9XtcDfcM0qq12j15KnY0NxGXwlutHsvoC2bz52yzm7pUlFbquMhi1TlgKPYb+l
	Avik6xv1C9tk98rdQBeOGNIz3PX4Ua1z3Y1pLc3Ax5EwX407Jk3cKm/fyqEZzAsw=
X-Gm-Gg: ASbGnctujdAudKvkOhPAIHAVWfn46qv3uNcY6mkG1tPijqpiUcn2E/nzAMHHW22MJZg
	JHZyCd/94sno2Zai8pAmrKfmoYpRrXM8ZSAAtEUEcv+pOll4OCAkdzRVmWn0zEPNkk3nsfCuc/Q
	Y7oA5SZh71q5I5ba3L13KoFaLpFxYeluFDU05L8aIc0NQFWqXOmD7BGNP8RVyDwL6nFDYUJO1kj
	2zH/PfLO6UPKjdxw1my9qY7krayZLSnSseKCJoNtxTODETgIvmyHn4trbOBv5L6ZwErmGAE2fyb
	wGB0OnnZIphUQsAp8VS3sEbm2Z321nswaVkqdTSqlU3MxNKM7CKNEX49q81UWTiJKTQgFFGm2Q7
	UZvKYcmWCKvd1+msH0ZjClfyAiVt8qyCMmEQ=
X-Received: by 2002:a05:620a:1997:b0:7c7:bb3f:fd40 with SMTP id af79cd13be357-7d3f98c335emr1054952385a.5.1750529664999;
        Sat, 21 Jun 2025 11:14:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+BLvp55Mks0cd0omIsX9xEno7K+V+qTVjIWAp23+UGVrowvzZ6fUThgqonkqEHlZPASIb2g==
X-Received: by 2002:a05:620a:1997:b0:7c7:bb3f:fd40 with SMTP id af79cd13be357-7d3f98c335emr1054949285a.5.1750529664603;
        Sat, 21 Jun 2025 11:14:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cf36sm752336e87.86.2025.06.21.11.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 11:14:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 21:13:02 +0300
Subject: [PATCH 7/8] usb: typec: ucsi: yoga-c630: handle USB / HPD messages
 to set port orientation
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-c630-ucsi-v1-7-a86de5e11361@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3261;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vp5Fme7/3hYqg8ZC4exosk/7eg4G/1nTlZJs2jkgM98=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0bYt2L957xak3P43952cZ0rvWh+R+586RNWWVfPhH1//
 0LbNJq/k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATkTLiYFioUWFX7Llx0X8n
 6QsC7fH3+P707I13XfkqPIZ77k9ugd60Y33MOvkzj3k98HndNGP1cb6WGZvmdugbv3uoGNB2+I5
 x1ztvT+17eoWKBj6lBgIXcpNe+DyLatcR58vhnKV6MEHO667GlG9PWWpjr1Qe/JE1babJUabuhv
 Q9PMnrNLd+uiV8jmPO2n190ycIzXbYP2OZqETSOl/Tn4x6/UJXlCqmujoUWbJPF7M/4eRzZfX8d
 hmObZdq1/A4rw5ac+asvhHTu0KjTefyGGdbSfWwxYu3FFvEftvbWBfTrbX0zryJf7++OxS9pqKo
 QX7958JrwY9fNhQ0z9BwnNckziFnl80xseJIa8jHxFcfAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDExNCBTYWx0ZWRfXwpSOcGOdNgfU
 KpsKnIX3lTbFC+FE98s8e2D9NOvL0UxPhvCUS7V6LjrqGVRWR+ZrTeylh/3O8wdqwjKEUfQVWbQ
 bQ7LMFkK8KFHMfIa6R0SEfD784RG5xTBxI4BXvxInN+EC6zgLh9upqg8rIDlDHaJKl3r8ViB3di
 VSvCCsC34v5gbeQUyAQbPl0nKkBeNcbuS2E/A/8ROk15621EdIQUOQp9LnepUPT3ZiqkD+zYyAi
 z5EAGQArKjRhcJ2BOqWd7Fs8Za+JjMcr7h16lI9HzzkG7fHRzERFcS2caaxNOGgtTKh659sNWTz
 IP1ZiLdsGmE5E7MsgEGlVoN8EkYpWupJtnZGRQrejzIMoy8xXo08PvW1ikQWCoFh9CuJARwKauV
 pgzLEDR9cVDN0NGkpdaYZJtyWoPRksVNuu7rD/t2juuve22Zo1j2cxpRY9P6onDTFSu0PpP6
X-Proofpoint-ORIG-GUID: 6XjATGSjq3-U3OBImhRRxWOWhHljfYzN
X-Authority-Analysis: v=2.4 cv=cbPSrmDM c=1 sm=1 tr=0 ts=6856f682 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KtUMi8uSWGBWOuXQcx8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 6XjATGSjq3-U3OBImhRRxWOWhHljfYzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210114

Parse USB / HPD messages from EC in order to set the orientation of the
corresponding Type-C port, letting connected USB 3 devices to enjoy
SuperSpeed connection rather than beign limited to HighSpeed only (if
the orientation didn't match).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 42 +++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index 76afd128d42a2573ff55433f815c2773462a6426..f85170417d19cdc5ae39a15e2f97010259ef12f6 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -7,15 +7,25 @@
  */
 #include <linux/auxiliary_bus.h>
 #include <linux/bitops.h>
+#include <linux/bitfield.h>
 #include <linux/completion.h>
 #include <linux/container_of.h>
 #include <linux/module.h>
 #include <linux/notifier.h>
 #include <linux/string.h>
 #include <linux/platform_data/lenovo-yoga-c630.h>
+#include <linux/usb/typec_dp.h>
 
 #include "ucsi.h"
 
+#define LENOVO_EC_USB_MUX	0x08
+
+#define USB_MUX_MUXC	GENMASK(1, 0)
+#define USB_MUX_CCST	GENMASK(3, 2)
+#define USB_MUX_DPPN	GENMASK(7, 4)
+#define USB_MUX_HPDS	BIT(8)
+#define USB_MUX_HSFL	GENMASK(11, 9)
+
 struct yoga_c630_ucsi {
 	struct yoga_c630_ec *ec;
 	struct ucsi *ucsi;
@@ -144,6 +154,12 @@ static bool yoga_c630_ucsi_update_altmodes(struct ucsi *ucsi,
 	return false;
 }
 
+static void yoga_c630_ucsi_update_connector(struct ucsi_connector *con)
+{
+	if (con->num == 1)
+		con->typec_cap.orientation_aware = true;
+}
+
 static const struct ucsi_operations yoga_c630_ucsi_ops = {
 	.read_version = yoga_c630_ucsi_read_version,
 	.read_cci = yoga_c630_ucsi_read_cci,
@@ -152,8 +168,33 @@ static const struct ucsi_operations yoga_c630_ucsi_ops = {
 	.sync_control = yoga_c630_ucsi_sync_control,
 	.async_control = yoga_c630_ucsi_async_control,
 	.update_altmodes = yoga_c630_ucsi_update_altmodes,
+	.update_connector = yoga_c630_ucsi_update_connector,
 };
 
+static void yoga_c630_ucsi_read_port0_status(struct yoga_c630_ucsi *uec)
+{
+	int val;
+	unsigned int muxc, ccst, dppn, hpds, hsfl;
+
+	val = yoga_c630_ec_read16(uec->ec, LENOVO_EC_USB_MUX);
+
+	muxc = FIELD_GET(USB_MUX_MUXC, val);
+	ccst = FIELD_GET(USB_MUX_CCST, val);
+	dppn = FIELD_GET(USB_MUX_DPPN, val);
+	hpds = FIELD_GET(USB_MUX_HPDS, val);
+	hsfl = FIELD_GET(USB_MUX_HSFL, val);
+
+	dev_dbg(uec->ucsi->dev, " mux %04x (muxc %d ccst %d dppn %d hpds %d hsfl %d)\n",
+		val,
+		muxc, ccst, dppn, hpds, hsfl);
+
+	if (uec->ucsi->connector && uec->ucsi->connector[0].port)
+		typec_set_orientation(uec->ucsi->connector[0].port,
+				      ccst == 1 ?
+				      TYPEC_ORIENTATION_REVERSE :
+				      TYPEC_ORIENTATION_NORMAL);
+}
+
 static int yoga_c630_ucsi_notify(struct notifier_block *nb,
 				 unsigned long action, void *data)
 {
@@ -164,6 +205,7 @@ static int yoga_c630_ucsi_notify(struct notifier_block *nb,
 	switch (action) {
 	case LENOVO_EC_EVENT_USB:
 	case LENOVO_EC_EVENT_HPD:
+		yoga_c630_ucsi_read_port0_status(uec);
 		ucsi_connector_change(uec->ucsi, 1);
 		return NOTIFY_OK;
 

-- 
2.39.5


