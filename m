Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD0B56639C0
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jan 2023 08:13:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbjAJHND (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Jan 2023 02:13:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbjAJHNB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Jan 2023 02:13:01 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3840E45659
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 23:13:00 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30A5ulGG015301;
        Tue, 10 Jan 2023 07:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=HbjkBDeFK1UPQ6gRVAgvnvUeEi58krsIsmQ7Kt1jPPU=;
 b=laL+PQdT3Ky871bA2vIZvcXYCbRUxtCIJvjj0uMcAi81KA2D8D+oW8DaQCerlRAh12Rq
 oKFgixZEaGOqXJvSKM/gklDvbHxHHgRjwvIoCvOQfqFMNSApTtv24x6rFk2psoGcGflq
 U4Ju7opg/31kB1KyPk3npXrfqxpETkiZrdFGEeK0hPwuo9QMGAwmjY1RPlQyzIeBz5n0
 exqIUlgHjCWfHA2leSjBxpwSw0zd+l12kp41zJciXIYg6DsJe5SQccVcUKWNfLNTWsMC
 7DjaOdaxhv0csFeaQmhKHP/IINu0w4kSKCuRk0uARGIsX7JOxm1MQoH4CrWuwlYOsuYG Tg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n0ssh914m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 Jan 2023 07:12:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30A7Cu4Y007434
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 Jan 2023 07:12:56 GMT
Received: from jackp-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 9 Jan 2023 23:12:55 -0800
From:   Jack Pham <quic_jackp@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v3] usb: ucsi: Ensure connector delayed work items are flushed
Date:   Mon, 9 Jan 2023 23:12:18 -0800
Message-ID: <20230110071218.26261-1-quic_jackp@quicinc.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uORD-iubgRj0UXf6QYTjxFtIFgk9iXnW
X-Proofpoint-ORIG-GUID: uORD-iubgRj0UXf6QYTjxFtIFgk9iXnW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_02,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0 mlxlogscore=858
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301100047
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

During ucsi_unregister() when destroying a connector's workqueue, there
may still be pending delayed work items that haven't been scheduled yet.
Because queue_delayed_work() uses a separate timer to schedule a work
item, the destroy_workqueue() call is not aware of any pending items.
Hence when a pending item's timer expires it would then try to queue on
a dangling workqueue pointer.

Fix this by keeping track of all work items in a list, so that prior to
destroying the workqueue any pending items can be flushed.  Do this by
calling mod_delayed_work() as that will cause pending items to get
queued immediately, which then allows the ensuing destroy_workqueue() to
implicitly drain all currently queued items to completion and free
themselves.

Fixes: b9aa02ca39a4 ("usb: typec: ucsi: Add polling mechanism for partner tasks like alt mode checking")
Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Co-developed-by: Linyu Yuan <quic_linyyuan@quicinc.com>
Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
Signed-off-by: Jack Pham <quic_jackp@quicinc.com>
---
v3: Adopted Heikki's suggestion to track work items in a list. Updated subject
    and commit description again.
v2: update commit description and remove cc stable list

 drivers/usb/typec/ucsi/ucsi.c | 24 +++++++++++++++++++++---
 drivers/usb/typec/ucsi/ucsi.h |  1 +
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index eabe519013e7..1292241d581a 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -187,6 +187,7 @@ EXPORT_SYMBOL_GPL(ucsi_send_command);
 
 struct ucsi_work {
 	struct delayed_work work;
+	struct list_head node;
 	unsigned long delay;
 	unsigned int count;
 	struct ucsi_connector *con;
@@ -202,6 +203,7 @@ static void ucsi_poll_worker(struct work_struct *work)
 	mutex_lock(&con->lock);
 
 	if (!con->partner) {
+		list_del(&uwork->node);
 		mutex_unlock(&con->lock);
 		kfree(uwork);
 		return;
@@ -209,10 +211,12 @@ static void ucsi_poll_worker(struct work_struct *work)
 
 	ret = uwork->cb(con);
 
-	if (uwork->count-- && (ret == -EBUSY || ret == -ETIMEDOUT))
+	if (uwork->count-- && (ret == -EBUSY || ret == -ETIMEDOUT)) {
 		queue_delayed_work(con->wq, &uwork->work, uwork->delay);
-	else
+	} else {
+		list_del(&uwork->node);
 		kfree(uwork);
+	}
 
 	mutex_unlock(&con->lock);
 }
@@ -236,6 +240,7 @@ static int ucsi_partner_task(struct ucsi_connector *con,
 	uwork->con = con;
 	uwork->cb = cb;
 
+	list_add_tail(&uwork->node, &con->partner_tasks);
 	queue_delayed_work(con->wq, &uwork->work, delay);
 
 	return 0;
@@ -1056,6 +1061,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	INIT_WORK(&con->work, ucsi_handle_connector_change);
 	init_completion(&con->complete);
 	mutex_init(&con->lock);
+	INIT_LIST_HEAD(&con->partner_tasks);
 	con->num = index + 1;
 	con->ucsi = ucsi;
 
@@ -1420,8 +1426,20 @@ void ucsi_unregister(struct ucsi *ucsi)
 		ucsi_unregister_altmodes(&ucsi->connector[i],
 					 UCSI_RECIPIENT_CON);
 		ucsi_unregister_port_psy(&ucsi->connector[i]);
-		if (ucsi->connector[i].wq)
+
+		if (ucsi->connector[i].wq) {
+			struct ucsi_work *uwork;
+
+			mutex_lock(&ucsi->connector[i].lock);
+			/*
+			 * queue delayed items immediately so they can execute
+			 * and free themselves before the wq is destroyed
+			 */
+			list_for_each_entry(uwork, &ucsi->connector[i].partner_tasks, node)
+				mod_delayed_work(ucsi->connector[i].wq, &uwork->work, 0);
+			mutex_unlock(&ucsi->connector[i].lock);
 			destroy_workqueue(ucsi->connector[i].wq);
+		}
 		typec_unregister_port(ucsi->connector[i].port);
 	}
 
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index c968474ee547..60ce9fb6e745 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -322,6 +322,7 @@ struct ucsi_connector {
 	struct work_struct work;
 	struct completion complete;
 	struct workqueue_struct *wq;
+	struct list_head partner_tasks;
 
 	struct typec_port *port;
 	struct typec_partner *partner;
-- 
2.24.0

