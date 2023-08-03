Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58F1D76E40B
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 11:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235012AbjHCJMc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 05:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233952AbjHCJL6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 05:11:58 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFDC330DA
        for <linux-usb@vger.kernel.org>; Thu,  3 Aug 2023 02:11:32 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3735fc3Y026987;
        Thu, 3 Aug 2023 09:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=IQxjvLgVthzmQ8/fLKIdp1JYcq8j6pbTZCtO9fGlrC8=;
 b=Te6lmRiUJuDv/YVO22kEX3Qj1ucd2KsRMT+UI45KJojQP1rIlfZRDtJy4xk2RPRtgPHt
 x2F/uJYtZ3GsfelP6Tn7yZFajMM6R34LNNKaEeAhA4e+4OTFiVs+A278jRzpLQz/jUgN
 Mw15XewcTZ+ZK9jxaXBniJqBLJBxyfKfvCycfPpYDU2xbXOONqmZNqB8NPuRZFDIEVXm
 rz5HMWCSD4IcwE+tNkGoB/e+1MeHu77heFih0gnMzzmpdEUPr9PzBuY4XA5xWwgzn1zE
 wFoOJqHs+l5PZV+OyYl6oGlXGhmbs1fhkb7flnpO5Afcg290Hz9sqzdJAz9Pwz+aC8Sm aQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s7upp1g4y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 03 Aug 2023 09:11:31 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3739B9Kv021141
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 3 Aug 2023 09:11:09 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 3 Aug 2023 02:11:07 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 3/7] usb: gadget: f_uvc: change endpoint allocation in uvc_function_bind()
Date:   Thu, 3 Aug 2023 17:10:49 +0800
Message-ID: <20230803091053.9714-4-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230803091053.9714-1-quic_linyyuan@quicinc.com>
References: <20230803091053.9714-1-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HD1-2wnOPo2pOrcAPghrq361ky1najJ4
X-Proofpoint-ORIG-GUID: HD1-2wnOPo2pOrcAPghrq361ky1najJ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_06,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=297 bulkscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308030081
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

when call uvc_function_bind(), gadget still have no connection speed,
just follow other gadget function, use fs endpoint descriptor to allocate
a video endpoint, remove gadget_is_{super|dual}speed() API call.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: no change

 drivers/usb/gadget/function/f_uvc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 5e919fb65833..c8e149f8315f 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -719,21 +719,13 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 	}
 	uvc->enable_interrupt_ep = opts->enable_interrupt_ep;
 
-	if (gadget_is_superspeed(c->cdev->gadget))
-		ep = usb_ep_autoconfig_ss(cdev->gadget, &uvc_ss_streaming_ep,
-					  &uvc_ss_streaming_comp);
-	else if (gadget_is_dualspeed(cdev->gadget))
-		ep = usb_ep_autoconfig(cdev->gadget, &uvc_hs_streaming_ep);
-	else
-		ep = usb_ep_autoconfig(cdev->gadget, &uvc_fs_streaming_ep);
-
+	ep = usb_ep_autoconfig(cdev->gadget, &uvc_fs_streaming_ep);
 	if (!ep) {
 		uvcg_info(f, "Unable to allocate streaming EP\n");
 		goto error;
 	}
 	uvc->video.ep = ep;
 
-	uvc_fs_streaming_ep.bEndpointAddress = uvc->video.ep->address;
 	uvc_hs_streaming_ep.bEndpointAddress = uvc->video.ep->address;
 	uvc_ss_streaming_ep.bEndpointAddress = uvc->video.ep->address;
 
-- 
2.17.1

