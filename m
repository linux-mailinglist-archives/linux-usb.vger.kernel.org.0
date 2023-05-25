Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84F047108E1
	for <lists+linux-usb@lfdr.de>; Thu, 25 May 2023 11:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239801AbjEYJ3y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 May 2023 05:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240063AbjEYJ3r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 May 2023 05:29:47 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B04191
        for <linux-usb@vger.kernel.org>; Thu, 25 May 2023 02:29:45 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34P9PGrZ013925;
        Thu, 25 May 2023 09:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=Saf3XI6y0I0Tx0sSFCtSp+dNchS4PAmoRlZSRo0431k=;
 b=Rv6naMKoi3Aj0R7fMCYoploEDmRsnjuPkPsp4+xaFP9N+diuiulrLOtwNaDyh8pPpXgK
 MLEaGoCpeb7SEfjPpB3TnCIbqxEn8DIbejCODtlG5f3hM/moNTs3AGb2/1keh0QOPIdD
 sNMjy4Er2FNiRDFYsPJxloGYBsyNCD4F2T0NIOLCIQtiFqhug79BVxaeW3V/59iw7hvq
 ryHk9xxG6tnU5EofJjGKN242ExyOnda5ORLGnNTY25m0USWjmsE0QMjemQkj/6MDTZhx
 kX+WfcFppsY+aVdhlLJitMYfUQHNn1GVxMFLwhElxmW612UCuwOFniRMH8vHSkOekEtW wQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qt29frbu4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 May 2023 09:29:40 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34P9TIH3014691
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 May 2023 09:29:18 GMT
Received: from hu-uaggarwa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 25 May 2023 02:29:16 -0700
From:   Uttkarsh Aggarwal <quic_uaggarwa@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Keeping <john@metanate.com>
CC:     Linyu Yuan <quic_linyyuan@quicinc.com>,
        Udipto Goswami <quic_ugoswami@quicinc.com>,
        <linux-usb@vger.kernel.org>,
        Uttkarsh Aggarwal <quic_uaggarwa@quicinc.com>
Subject: [PATCH] usb: gadget: f_fs: Add unbind event before functionfs_unbind
Date:   Thu, 25 May 2023 14:58:54 +0530
Message-ID: <20230525092854.7992-1-quic_uaggarwa@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xNZNGLnnYpQdhWDzBDINYvurFhUrqX0L
X-Proofpoint-ORIG-GUID: xNZNGLnnYpQdhWDzBDINYvurFhUrqX0L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-25_05,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305250079
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

While exercising the unbind path, with the current implementation
the functionfs_unbind would be calling which waits for the ffs->mutex
to be available, however within the same time ffs_ep0_read is invoked
& if no setup packets are pending, it will invoke function
wait_event_interruptible_exclusive_locked_irq which by definition waits
for the ev.count to be increased inside the same mutex for which
functionfs_unbind is waiting.
This creates deadlock situation because the functionfs_unbind won't
get the lock until ev.count is increased which can only happen if
the caller ffs_func_unbind can proceed further.

Following is the illustration:

	CPU1				CPU2

ffs_func_unbind()		ffs_ep0_read()
				mutex_lock(ffs->mutex)
				wait_event(ffs->ev.count)
functionfs_unbind()
  mutex_lock(ffs->mutex)
  mutex_unlock(ffs->mutex)

ffs_event_add()

<deadlock>

Fix this by moving the event unbind before functionfs_unbind
to ensure the ev.count is incrased properly.

Fixes: 6a19da111057 ("usb: gadget: f_fs: Prevent race during ffs_ep0_queue_wait")
Signed-off-by: Uttkarsh Aggarwal <quic_uaggarwa@quicinc.com>
---
 drivers/usb/gadget/function/f_fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index a13c946e0663..f41a385a5c42 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -3535,6 +3535,7 @@ static void ffs_func_unbind(struct usb_configuration *c,
 	/* Drain any pending AIO completions */
 	drain_workqueue(ffs->io_completion_wq);
 
+	ffs_event_add(ffs, FUNCTIONFS_UNBIND);
 	if (!--opts->refcnt)
 		functionfs_unbind(ffs);
 
@@ -3559,7 +3560,6 @@ static void ffs_func_unbind(struct usb_configuration *c,
 	func->function.ssp_descriptors = NULL;
 	func->interfaces_nums = NULL;
 
-	ffs_event_add(ffs, FUNCTIONFS_UNBIND);
 }
 
 static struct usb_function *ffs_alloc(struct usb_function_instance *fi)
-- 
2.17.1

