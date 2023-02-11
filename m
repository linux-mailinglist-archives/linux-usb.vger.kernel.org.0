Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3F36930D2
	for <lists+linux-usb@lfdr.de>; Sat, 11 Feb 2023 13:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbjBKMSW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Feb 2023 07:18:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjBKMSD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Feb 2023 07:18:03 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87F29241DA;
        Sat, 11 Feb 2023 04:18:02 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31BBbgrw019114;
        Sat, 11 Feb 2023 12:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=5h6MzoWQiCUa7cJYpAjuWIpHOhmwTSRHsB1DoYu9mV0=;
 b=KElPFrFyL/WwdpGy8645TdrL9ZdnhcxUoV0gWU1Z2C8AZo81BwLuIps6svbVlFHpVmtA
 ZpCV0d3YWn5yx6GzsBT6qTr5+LgojgcnTzAEbGOQLVm07FXH8IyQFZ7n/NWiwstPa2GS
 eR0QUGs0tdd5PAjIZbJViw/FWL2XkRyFOKo1tvYkdIkWx7wH1iB7TedLx98lDVcgyoXV
 gK+T4inRLkDd1davNoLfIz/avXTt97CODq3Hl37Q+nDyiedUGUQien+YmMwPr6IPh7cm
 4szwgDCQ4SrBbJQvz3BL9gGhicBKyhv1TRLC681Pd+LeMfL37nJy0AzGMVRXMDZhSjMf hg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3np3derns7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 11 Feb 2023 12:17:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31BCHt39032237
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 11 Feb 2023 12:17:55 GMT
Received: from hu-prashk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Sat, 11 Feb 2023 04:17:52 -0800
From:   Prashanth K <quic_prashk@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Xiu Jianfeng <xiujianfeng@huawei.com>
CC:     Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Prashanth K <quic_prashk@quicinc.com>
Subject: [PATCH v2] usb: gadget: u_serial: Add null pointer check in gserial_resume
Date:   Sat, 11 Feb 2023 17:47:38 +0530
Message-ID: <1676117858-32157-1-git-send-email-quic_prashk@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SY-UZA_tNDGrO_D4R37iZS2MxnYPrHtC
X-Proofpoint-ORIG-GUID: SY-UZA_tNDGrO_D4R37iZS2MxnYPrHtC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-11_06,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 clxscore=1015 adultscore=0 mlxlogscore=832 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302110111
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Consider a case where gserial_disconnect has already cleared
gser->ioport. And if a wakeup interrupt triggers afterwards,
gserial_resume gets called, which will lead to accessing of
gser->ioport and thus causing null pointer dereference.Add
a null pointer check to prevent this.

Added a static spinlock to prevent gser->ioport from becoming
null after the newly added check.

Fixes: aba3a8d01d62 ("usb: gadget: u_serial: add suspend resume callbacks")
Signed-off-by: Prashanth K <quic_prashk@quicinc.com>
---
v2: Added static spinlock and fixed Fixes tag.

 drivers/usb/gadget/function/u_serial.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 840626e..9ced0fa 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -82,6 +82,8 @@
 #define WRITE_BUF_SIZE		8192		/* TX only */
 #define GS_CONSOLE_BUF_SIZE	8192
 
+static DEFINE_SPINLOCK(serial_port_lock);
+
 /* console info */
 struct gs_console {
 	struct console		console;
@@ -1370,11 +1372,13 @@ EXPORT_SYMBOL_GPL(gserial_connect);
 void gserial_disconnect(struct gserial *gser)
 {
 	struct gs_port	*port = gser->ioport;
-	unsigned long	flags;
+	unsigned long flags, serial_flag;
 
 	if (!port)
 		return;
 
+	spin_lock_irqsave(&serial_port_lock, serial_flag);
+
 	/* tell the TTY glue not to do I/O here any more */
 	spin_lock_irqsave(&port->port_lock, flags);
 
@@ -1392,6 +1396,7 @@ void gserial_disconnect(struct gserial *gser)
 	}
 	port->suspended = false;
 	spin_unlock_irqrestore(&port->port_lock, flags);
+	spin_unlock_irqrestore(&serial_port_lock, serial_flag);
 
 	/* disable endpoints, aborting down any active I/O */
 	usb_ep_disable(gser->out);
@@ -1426,9 +1431,16 @@ EXPORT_SYMBOL_GPL(gserial_suspend);
 void gserial_resume(struct gserial *gser)
 {
 	struct gs_port *port = gser->ioport;
-	unsigned long	flags;
+	unsigned long flags, serial_flag;
+
+	spin_lock_irqsave(&serial_port_lock, serial_flag);
+	if (!port) {
+		spin_unlock_irqrestore(&serial_port_lock, serial_flag);
+		return;
+	}
 
 	spin_lock_irqsave(&port->port_lock, flags);
+	spin_unlock_irqrestore(&serial_port_lock, serial_flag);
 	port->suspended = false;
 	if (!port->start_delayed) {
 		spin_unlock_irqrestore(&port->port_lock, flags);
-- 
2.7.4

