Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D810682A64
	for <lists+linux-usb@lfdr.de>; Tue, 31 Jan 2023 11:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbjAaKXr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Jan 2023 05:23:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbjAaKXq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Jan 2023 05:23:46 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE1686E91
        for <linux-usb@vger.kernel.org>; Tue, 31 Jan 2023 02:23:42 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V494Ka024298;
        Tue, 31 Jan 2023 09:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=g6e/KhXpi6e+jqTqHGnO/JVArw4pjEeQeL4UOoecDnw=;
 b=Usg84UwunCUiBX+cAZFYnekZyXEdkmF7lFkGuMR6knXAlQ0qTS80du6mcqekbhoWRjxC
 yi5NIJ2rDJQRh09LJGRsFpSqS3EEygV9OkVu+RD1y6DsT76Ie8HCMLfRSSIPRgu1g+Rp
 7gByE4oe10hDgUJ1jVIUUPqX4GT8QdkIteuX1sYxaG00Pr9CbxnJxvfByQp5UZ+CU46E
 o16Fk4hup+Xn1iiqLuOWziREGye5Aj+XOsyFCWcF7fdeTsPXOFpfYHCtbwmkAddnF90V
 6OToXhMM77QsEqKurRWmiGv6FauRZZgMl6wc4cGq9DABKFyjgp98EFYWJZFPH5Z7J0mF ZQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nejdm1uwm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 31 Jan 2023 09:52:22 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30V9qLl4010851
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 31 Jan 2023 09:52:21 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 31 Jan 2023 01:52:18 -0800
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Wesley Cheng" <quic_wcheng@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [RFC PATCH] usb: typec: ucsi: change role command to async write
Date:   Tue, 31 Jan 2023 17:52:15 +0800
Message-ID: <1675158735-2757-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zbbbciUZjm8ET7KKX3JURbXw0a44AT6Z
X-Proofpoint-GUID: zbbbciUZjm8ET7KKX3JURbXw0a44AT6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_04,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=608 bulkscore=0 mlxscore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310086
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In ucsi_dr_swap() and ucsi_pr_swap(), it will wait complete.
it is better change role switch command to async mode which will avoid
reset ppm in condition that data/power switch can't operate.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 00fc867..466ae93 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -997,17 +997,21 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 
 static int ucsi_role_cmd(struct ucsi_connector *con, u64 command)
 {
+	struct ucsi *ucsi = con->ucsi;
 	int ret;
 
-	ret = ucsi_send_command(con->ucsi, command, NULL, 0);
+	mutex_lock(&ucsi->ppm_lock);
+	ret = ucsi->ops->async_write(ucsi, UCSI_CONTROL, &command, sizeof(command));
+	mutex_unlock(&ucsi->ppm_lock);
+
 	if (ret == -ETIMEDOUT) {
 		u64 c;
 
 		/* PPM most likely stopped responding. Resetting everything. */
-		ucsi_reset_ppm(con->ucsi);
+		ucsi_reset_ppm(ucsi);
 
-		c = UCSI_SET_NOTIFICATION_ENABLE | con->ucsi->ntfy;
-		ucsi_send_command(con->ucsi, c, NULL, 0);
+		c = UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
+		ucsi_send_command(ucsi, c, NULL, 0);
 
 		ucsi_reset_connector(con, true);
 	}
-- 
2.7.4

