Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9B976DFA6
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 07:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232346AbjHCFS4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 01:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232321AbjHCFSx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 01:18:53 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8248E43
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 22:18:52 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3731oILv000778;
        Thu, 3 Aug 2023 05:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=MHKC2O5Ca6zwOFezTeDj0xpV/G/veq0lBWgAS7sp7fc=;
 b=NnEF+HzEFwHy0odA+tpd9q+epApnrA1CRaZRchSp9+XxBfRtN7FXR4L9GqjMwcazoaLr
 z4b7eBhcCRDBZ0y0OuWkbQ6jPYvU2pMi5yCcU6mbt/LUvAlIX7YJrguRD9k0Ilt70NqK
 RbFY6lmzrHr44A3uiUfCGk8Ve46MMpl07Fsdv9tqAjYx620Z7Ooqj/T5mqdX5D76GttN
 fk2zLJuuwT6POKwveHPLlcq25J5viKByORNXD1C8LR27QX8z4VAYqjFQpKu/ynecX+sI
 XRvyrC0kZaMpBfDFBJ4qzFR1q5RQlXkfaQLl89+bNWf4PLRlcuQSVtu/vd4M0nQG3SHJ bg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s82wx892b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 03 Aug 2023 05:18:51 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3735Io5q025555
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 3 Aug 2023 05:18:50 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 2 Aug 2023 22:18:48 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH 1/7] usb: gadget: f_ecm: fix ecm_bitrate() for SuperSpeed and above
Date:   Thu, 3 Aug 2023 13:18:04 +0800
Message-ID: <20230803051810.2974-2-quic_linyyuan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: yRAjCyJ3I_iLjlifRn1ul0-yKRbaWCwy
X-Proofpoint-GUID: yRAjCyJ3I_iLjlifRn1ul0-yKRbaWCwy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_02,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=613 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308030048
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In function ecm_bitrate(), it is not good to report same speed as
super speed when gadget work at super speed plus.

Change report speed same as commit 986499b1569a ("usb: gadget: f_ncm:
fix ncm_bitrate for SuperSpeed and above.").

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/function/f_ecm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
index c6e63ad77a40..8da7d314602c 100644
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -68,8 +68,10 @@ static inline struct f_ecm *func_to_ecm(struct usb_function *f)
 /* peak (theoretical) bulk transfer rate in bits-per-second */
 static inline unsigned ecm_bitrate(struct usb_gadget *g)
 {
-	if (gadget_is_superspeed(g) && g->speed == USB_SPEED_SUPER)
-		return 13 * 1024 * 8 * 1000 * 8;
+	if (gadget_is_superspeed(g) && g->speed >= USB_SPEED_SUPER_PLUS)
+		return 4250000000U;
+	else if (gadget_is_superspeed(g) && g->speed == USB_SPEED_SUPER)
+		return 3750000000U;
 	else if (gadget_is_dualspeed(g) && g->speed == USB_SPEED_HIGH)
 		return 13 * 512 * 8 * 1000 * 8;
 	else
-- 
2.17.1

