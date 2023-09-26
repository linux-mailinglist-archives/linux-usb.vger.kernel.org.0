Return-Path: <linux-usb+bounces-605-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF12F7AF437
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 21:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id E179F1C2084A
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 19:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102DA37C87;
	Tue, 26 Sep 2023 19:37:39 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DAB4A3F
	for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 19:37:36 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73BA4FC;
	Tue, 26 Sep 2023 12:37:35 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38QIdAjH029558;
	Tue, 26 Sep 2023 19:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=AGrA3Vzkw7tm3/V6u26H5AwPjK+SczZwFde78qFLu6Y=;
 b=CZ0o6/QM1iM0BSmYrsgHygYZEYJpjziCmpOQwQIlN3ybAOop9iKZNuXlauNA7FzH8Y9i
 rPK1QPUvoyp+mLe7DwUBt9LyRsWl3cIwxnxZto+XXdaU19tnXKph6cS0/2jb/aQpkQPG
 8e2hwyARqke4Fd5VT5PCPMadX6nHyxa1mBsr2H/OVG5hrVTbYM4zP40fDMKcWUdwJudB
 vd0AKGyEw4FLWHmgBF4yUfyGF03xQ+JwHDAFHjYN8lnUpNXEF+yMfakPeu9PqcO0ehwr
 OcukCOa/88FO001nct31Y6ES+6aVqkeioOSfO+aoi1aD1VE+J+GxYXF7w2g3XR1F4p03 XA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tc179gtfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Sep 2023 19:37:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38QJbNg8016845
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Sep 2023 19:37:23 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 26 Sep 2023 12:37:19 -0700
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern
	<stern@rowland.harvard.edu>,
        Francesco Dolcini
	<francesco.dolcini@toradex.com>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Ivan Orlov
	<ivan.orlov0322@gmail.com>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_ppratap@quicinc.com>, <quic_wcheng@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH v4] usb: gadget: udc: Handle gadget_connect failure during bind operation
Date: Wed, 27 Sep 2023 01:07:08 +0530
Message-ID: <20230926193708.22405-1-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2wuu3E_Pl2tzHx7c1mh6kerPepCRBwQp
X-Proofpoint-ORIG-GUID: 2wuu3E_Pl2tzHx7c1mh6kerPepCRBwQp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_13,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=948
 clxscore=1011 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309260167
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

In the event, gadget_connect call (which invokes pullup) fails,
propagate the error to udc bind operation which inturn sends the
error to configfs. The userspace can then retry enumeartion if
it chooses to.

Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
Changes in v4: Fixed mutex locking imbalance during connect_control
failure
Link to v3: https://lore.kernel.org/all/20230510075252.31023-3-quic_kriskura@quicinc.com/

 drivers/usb/gadget/udc/core.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 7d49d8a0b00c..53af25a333a1 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1125,12 +1125,16 @@ EXPORT_SYMBOL_GPL(usb_gadget_set_state);
 /* ------------------------------------------------------------------------- */
 
 /* Acquire connect_lock before calling this function. */
-static void usb_udc_connect_control_locked(struct usb_udc *udc) __must_hold(&udc->connect_lock)
+static int usb_udc_connect_control_locked(struct usb_udc *udc) __must_hold(&udc->connect_lock)
 {
+	int ret;
+
 	if (udc->vbus)
-		usb_gadget_connect_locked(udc->gadget);
+		ret = usb_gadget_connect_locked(udc->gadget);
 	else
-		usb_gadget_disconnect_locked(udc->gadget);
+		ret = usb_gadget_disconnect_locked(udc->gadget);
+
+	return ret;
 }
 
 static void vbus_event_work(struct work_struct *work)
@@ -1604,12 +1608,23 @@ static int gadget_bind_driver(struct device *dev)
 	}
 	usb_gadget_enable_async_callbacks(udc);
 	udc->allow_connect = true;
-	usb_udc_connect_control_locked(udc);
+	ret = usb_udc_connect_control_locked(udc);
+	if (ret) {
+		mutex_unlock(&udc->connect_lock);
+		goto err_connect_control;
+	}
+
 	mutex_unlock(&udc->connect_lock);
 
 	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
 	return 0;
 
+ err_connect_control:
+	usb_gadget_disable_async_callbacks(udc);
+	if (gadget->irq)
+		synchronize_irq(gadget->irq);
+	usb_gadget_udc_stop_locked(udc);
+
  err_start:
 	driver->unbind(udc->gadget);
 
-- 
2.42.0


