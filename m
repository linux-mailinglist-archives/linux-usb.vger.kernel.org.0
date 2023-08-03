Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7778A76DFA8
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 07:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232394AbjHCFTB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 01:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbjHCFS4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 01:18:56 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B661B4
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 22:18:55 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3733qsLC015505;
        Thu, 3 Aug 2023 05:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=RhYsP5sxHehKatYLFPs9z+3WxMJnATus3xr70JAT1Kg=;
 b=TH1mqgF2ZkGae3l8f2D6VrqsKiMYjI5DMaFkwyXTeIknp0FWY7xaJ08b0jyRXCrQKd2n
 CxjfmJ6T1WIlooBbaFMERt8IgtMcnmjXfDKdvJr1HkB74X64J1XXAhp9XJdkdyB3KEOY
 kw1smb60QPx4LuH1+/Ya3vKSkpPlCQPJxnxRocfaiZbaJvh2VViAAN4m2GvinPDQGXuE
 LmXz0LmJE36j9rcbNvlR0Mn+3SGesLpq5Rl54Ib0qNkyh8RvaD0RuxrUa3wxUEy/CLwd
 hrxDmsjShVAq0ybC0a0/vP+wf9Nt7iDNH7AH9ceLg6Dp8paI4GEn7hcx1jWSnI0uIGPS MQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s7fre33pm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 03 Aug 2023 05:18:54 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3735IqMK006266
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 3 Aug 2023 05:18:52 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 2 Aug 2023 22:18:51 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH 3/7] usb: gadget: f_uvc: change endpoint allocation in uvc_function_bind()
Date:   Thu, 3 Aug 2023 13:18:06 +0800
Message-ID: <20230803051810.2974-4-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230803051810.2974-1-quic_linyyuan@quicinc.com>
References: <20230803051810.2974-1-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NLGVcD_mtX2XfTOuNisiZCYkg-aMJG6P
X-Proofpoint-ORIG-GUID: NLGVcD_mtX2XfTOuNisiZCYkg-aMJG6P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_02,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 mlxlogscore=283 bulkscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2308030048
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

