Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 298D762D2CF
	for <lists+linux-usb@lfdr.de>; Thu, 17 Nov 2022 06:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234503AbiKQFgR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Nov 2022 00:36:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234320AbiKQFgQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Nov 2022 00:36:16 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66C546AED0
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 21:36:15 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AH2crpZ007000;
        Thu, 17 Nov 2022 05:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=ppiFqY1YyZgg6wkYgcvR7bwboaz5L+wvlGMUiJZ0TiQ=;
 b=D0iklfsc+L2hi87S+8DG0csMl4LkJGOVQ2gZXv6myiOktQ72A/1ECl4BMR74Vamm1Oqm
 8wx2isLwUBWHho1yz3ZWukxXulhO0tztQ9TNFjCRIBdxHfpOVheGasqxXXHv/TiEnSas
 BnRJlGyPJGqPc51HYV3rh2/BXI3P/sAvgCUUFh+cob/AD4ImuKHYvdunp5LCUH/cR7HX
 NKMluIPKNR7d+NoxPhY33io52vPNlloXZl2Zf/rHX2jIDBzI9nk9DiXnMdu6KC3ejSKy
 BNw4liwE2drgie7Lh5ETlZhaf5JPtAIMJYzrOMXj3XNss7mcWcDehlmystytBv+KVQiT Cg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kw3phsf90-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Nov 2022 05:36:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AH5a6rG002137
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Nov 2022 05:36:06 GMT
Received: from hu-ugoswami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 16 Nov 2022 21:36:03 -0800
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
To:     Jack Pham <quic_jackp@quicinc.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
CC:     Pratham Pratap <quic_ppratap@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Udipto Goswami <quic_ugoswami@quicinc.com>
Subject: [PATCH] usb: gadget: configfs: Prevent double delete from purge_configs_funcs
Date:   Thu, 17 Nov 2022 11:05:48 +0530
Message-ID: <20221117053548.28158-1-quic_ugoswami@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Xo_qsbm3EIE8y2d5yRx-WV409-MiGvzU
X-Proofpoint-GUID: Xo_qsbm3EIE8y2d5yRx-WV409-MiGvzU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_02,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170040
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently the function purge_configs_funcs isn't protected by any lock
So there is a potential race possible there id udc called composite_unbind
and say at the same time the configfs_composite_bind also got executed.
If bind fails and follows the error path, driver will end up calling the
purge_configfs_funcs again, resulting in double free from func_list.

Fix this by introducing mutex gi->lock to make sure serial execution
can be maintained. Also, usage of list_for_each_entry_safe is risky
here since the tmp variable is still valid for the next iteration, in
order to ensure list traversal is clean, use list_last_entry.

Fixes: 6cd0fe913879 ("usb: gadget: configfs: Preserve function ordering after bind failure")
Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
---
 drivers/usb/gadget/configfs.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 3a6b4926193e..f1ac87906897 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1246,14 +1246,14 @@ static void purge_configs_funcs(struct gadget_info *gi)
 {
 	struct usb_configuration	*c;
 
+	mutex_lock(&gi->lock);
 	list_for_each_entry(c, &gi->cdev.configs, list) {
-		struct usb_function *f, *tmp;
+		struct usb_function *f;
 		struct config_usb_cfg *cfg;
 
 		cfg = container_of(c, struct config_usb_cfg, c);
-
-		list_for_each_entry_safe_reverse(f, tmp, &c->functions, list) {
-
+		while (!list_empty(&c->functions)) {
+			f = list_last_entry(&c->functions, struct usb_function, list);
 			list_move(&f->list, &cfg->func_list);
 			if (f->unbind) {
 				dev_dbg(&gi->cdev.gadget->dev,
@@ -1269,6 +1269,7 @@ static void purge_configs_funcs(struct gadget_info *gi)
 		c->highspeed = 0;
 		c->fullspeed = 0;
 	}
+	mutex_unlock(&gi->lock);
 }
 
 static int configfs_composite_bind(struct usb_gadget *gadget,
-- 
2.17.1

