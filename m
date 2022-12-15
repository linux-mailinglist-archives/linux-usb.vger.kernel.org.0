Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E214664D627
	for <lists+linux-usb@lfdr.de>; Thu, 15 Dec 2022 06:29:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbiLOF3e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Dec 2022 00:29:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbiLOF31 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Dec 2022 00:29:27 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0CBF54473
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 21:29:26 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BF2O9M5009220;
        Thu, 15 Dec 2022 05:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=M4kN+Ds9esYCqwXNVVNCik7mbJPEaSop1qd2+UCnA7M=;
 b=H2RVCig1u/jiBabyk00KUvcqPY8E0TupsopR9rCGWnMMIBDsewpYNA84hCEuWHDhb2KW
 9gfWTTHgzGXoykO74MpGgne139hh7e5grHcxnckLulrYhKg4Q9M7XnhTiF4zVQGuKrCR
 lbfowCTUcI08autupKZc7dMYUw/YuvX0R/94JmI18BzIhE/TA1L/w9hfX2HACX3YsoQl
 7zmL/vU3fGphCpkncuOP1pY19fDkSYdZKuofID9zHEwlpNe4Mcz7+qsBq2WBIUYF633w
 a1ohR3UhGjWny2IshIgvCMT16rkkSeenAjVdgDK4oTnTxKzMC14coc3RWHmXaEdc1VjQ oA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mf6rck8c0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Dec 2022 05:29:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BF5TNJ1024097
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Dec 2022 05:29:23 GMT
Received: from hu-ugoswami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 14 Dec 2022 21:29:20 -0800
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
To:     John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
CC:     Jack Pham <quic_jackp@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "Udipto Goswami" <quic_ugoswami@quicinc.com>
Subject: [PATCH v4 1/2] usb: gadget: f_fs: Prevent race during ffs_ep0_queue_wait
Date:   Thu, 15 Dec 2022 10:59:05 +0530
Message-ID: <20221215052906.8993-2-quic_ugoswami@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221215052906.8993-1-quic_ugoswami@quicinc.com>
References: <20221215052906.8993-1-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kszSQpzEm08pdeskIQRdFwXypPzWaro6
X-Proofpoint-ORIG-GUID: kszSQpzEm08pdeskIQRdFwXypPzWaro6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_02,2022-12-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 mlxlogscore=680 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212150041
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

Fix this by making a serialized execution between the two functions using
a mutex_lock(ffs->mutex).

Fixes: ddf8abd25994 ("USB: f_fs: the FunctionFS driver")
Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
---
 drivers/usb/gadget/function/f_fs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 73dc10a77cde..bb6fe1f3a29d 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -279,6 +279,9 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
 	struct usb_request *req = ffs->ep0req;
 	int ret;
 
+	if (!req)
+		return -EINVAL;
+
 	req->zero     = len < le16_to_cpu(ffs->ev.setup.wLength);
 
 	spin_unlock_irq(&ffs->ev.waitq.lock);
@@ -1892,10 +1895,12 @@ static void functionfs_unbind(struct ffs_data *ffs)
 	ENTER();
 
 	if (!WARN_ON(!ffs->gadget)) {
+		mutex_lock(&ffs->mutex);
 		usb_ep_free_request(ffs->gadget->ep0, ffs->ep0req);
 		ffs->ep0req = NULL;
 		ffs->gadget = NULL;
 		clear_bit(FFS_FL_BOUND, &ffs->flags);
+		mutex_unlock(&ffs->mutex);
 		ffs_data_put(ffs);
 	}
 }
-- 
2.17.1

