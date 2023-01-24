Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B988C6793B8
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jan 2023 10:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232517AbjAXJMU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Jan 2023 04:12:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjAXJMT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Jan 2023 04:12:19 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D293A58C
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 01:12:18 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30O8QPYe009574;
        Tue, 24 Jan 2023 09:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=X34eg9PS3FZaVDzRtl3Htnoh2ygXcmFZnnC4luSEzP4=;
 b=fCaOn0TdyGzB0W8ifnvftfhf6P2OL+DGKkib/Miq222DWNOgc53DGIR/cJKrv6YWMddg
 5GyflxUBIKxA/zx91FouYDqCHT/VEVl5SUOWXojqwKiB08I34vJwFHLIlX7Jqvb0kg1U
 r6CCOwpG7B/TYd3NJDTCNRIACSaTc6pmTOk3nF+Rycf7LW/Rno6cYeoTJZs2DBaQLdRY
 xWmKT8+lTcgsvzrme9J7+9h8vHTep2wwNTL6nuNzkAcixlTCI3gi5Ufo+yigdu85K557
 3er0daDFujalRUbuVbvud6SxGT5PXZOAjmxu/x35teTKwj5tC2uWkkGHwzZC15B/lB5+ RQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89htvkn8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Jan 2023 09:12:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30O9CBHP002373
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Jan 2023 09:12:11 GMT
Received: from hu-ugoswami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 24 Jan 2023 01:12:09 -0800
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
To:     John Keeping <john@metanate.com>,
        Dan Carpenter <error27@gmail.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
CC:     Pratham Pratap <quic_ppratap@quicinc.com>,
        Udipto Goswami <quic_ugoswami@quicinc.com>
Subject: [PATCH] usb: gadget: f_fs: Fix unbalanced spinlock in  __ffs_ep0_queue_wait
Date:   Tue, 24 Jan 2023 14:41:49 +0530
Message-ID: <20230124091149.18647-1-quic_ugoswami@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pVltGfigaBcz2NEMm2x3bmXS-4I6ZeXw
X-Proofpoint-GUID: pVltGfigaBcz2NEMm2x3bmXS-4I6ZeXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=616 suspectscore=0 clxscore=1011 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301240083
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

__ffs_ep0_queue_wait executes holding the spinlock of &ffs->ev.waitq.lock
and unlocks it after the assignments to usb_request are done.
However in the code if the request is already NULL we bail out returning
-EINVAL but never unlocked the spinlock.

Fix this by adding spin_unlock_irq &ffs->ev.waitq.lock before returning.

Fixes: 6a19da111057("usb: gadget: f_fs: Prevent race during ffs_ep0_queue_wait")
Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
---
 drivers/usb/gadget/function/f_fs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 523a961b910b..8ad354741380 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -279,8 +279,10 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
 	struct usb_request *req = ffs->ep0req;
 	int ret;
 
-	if (!req)
+	if (!req) {
+		spin_unlock_irq(&ffs->ev.waitq.lock);
 		return -EINVAL;
+	}
 
 	req->zero     = len < le16_to_cpu(ffs->ev.setup.wLength);
 
-- 
2.17.1

