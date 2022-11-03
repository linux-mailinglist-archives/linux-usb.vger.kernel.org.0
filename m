Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3605D6177B7
	for <lists+linux-usb@lfdr.de>; Thu,  3 Nov 2022 08:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbiKCHjG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Nov 2022 03:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiKCHjF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Nov 2022 03:39:05 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 540102729
        for <linux-usb@vger.kernel.org>; Thu,  3 Nov 2022 00:39:04 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A35nsSg004805;
        Thu, 3 Nov 2022 07:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=ECf654x71tCxWXUbENupjNuPfgA8DidBFDd8jL4N0pI=;
 b=PajPsS+W63j9GfW17NerstjfSXifGtLYYbQu0NiXVAAX/0AJ9jZEGaDRJGUzSn+Aq6Eg
 CfrfPOvuWpmhkZ7ciTybG+FWfH4XBhDPl77zZvz9JrcG8xC+cpBOkWCATKGg2KF/LKNT
 fQr8Vs6GmDnA5slhkuP67l497YkajhM9AjRqXDyFfrWp5IkHzUROIpn8q60HUWOEMjU5
 mGsYrX86gSMzMeGlPJuE5qQ26IxyXhz080gGTTQZRjUuEwfNAxAKTF4WTTZfLxyhKQwc
 Sr9mntMnMeb5v6lAig5PebitvAyoWLHebZeFUzfaof2AZGFpIR5yfUSllUSdGnShPPPf tg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3km70s8jdg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 03 Nov 2022 07:38:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A37cq9i029388
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 3 Nov 2022 07:38:52 GMT
Received: from hu-ugoswami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 3 Nov 2022 00:38:49 -0700
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, John Keeping <john@metanate.com>
CC:     Jack Pham <quic_jackp@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "Udipto Goswami" <quic_ugoswami@quicinc.com>
Subject: [PATCH] usb: gadget: f_fs: Prevent race between functionfs_unbind & ffs_ep0_queue_wait
Date:   Thu, 3 Nov 2022 13:08:21 +0530
Message-ID: <20221103073821.8210-1-quic_ugoswami@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Zc7MHHLf5q_B4cXRvDdDongePPT9W51_
X-Proofpoint-GUID: Zc7MHHLf5q_B4cXRvDdDongePPT9W51_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_15,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 clxscore=1011 mlxscore=0 priorityscore=1501 mlxlogscore=591
 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211030052
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

While performing fast composition switch, there is a possibility that the
process of ffs_ep0_write/ffs_ep0_read get into a race condition
due to ep0req being freed up from functionfs_unbind.

Consider the scenario that the ffs_ep0_write calls the ffs_ep0_queue_wait
by taking a lock &ffs->ev.waitq.lock. However, the functionfs_unbind isn't
bounded so it can go ahead and mark the ep0req to NULL, and since there
is no NULL check in ffs_ep0_queue_wait we will end up in use-after-free.

Fix this by introducing a NULL check before any req operation.
Also to ensure the serialization, perform the ep0req ops inside
spinlock &ffs->ev.waitq.lock.

Fixes: ddf8abd25994 ("USB: f_fs: the FunctionFS driver")
Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
---
 drivers/usb/gadget/function/f_fs.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 73dc10a77cde..39980b2bf285 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -279,6 +279,13 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
 	struct usb_request *req = ffs->ep0req;
 	int ret;
 
+	if (!req)
+		return -EINVAL;
+	/*
+	 * Even if ep0req is freed won't be a problem since the local
+	 * copy of the request will be used here.
+	 */
+
 	req->zero     = len < le16_to_cpu(ffs->ev.setup.wLength);
 
 	spin_unlock_irq(&ffs->ev.waitq.lock);
@@ -1892,11 +1899,13 @@ static void functionfs_unbind(struct ffs_data *ffs)
 	ENTER();
 
 	if (!WARN_ON(!ffs->gadget)) {
+		spin_lock_irq(&ffs->ev.waitq.lock);
 		usb_ep_free_request(ffs->gadget->ep0, ffs->ep0req);
 		ffs->ep0req = NULL;
 		ffs->gadget = NULL;
 		clear_bit(FFS_FL_BOUND, &ffs->flags);
 		ffs_data_put(ffs);
+		spin_unlock_irq(&ffs->ev.waitq.lock);
 	}
 }
 
-- 
2.17.1

