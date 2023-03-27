Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9BCB6CA0FA
	for <lists+linux-usb@lfdr.de>; Mon, 27 Mar 2023 12:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233516AbjC0KMg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Mar 2023 06:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233486AbjC0KMe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Mar 2023 06:12:34 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09A574EEC
        for <linux-usb@vger.kernel.org>; Mon, 27 Mar 2023 03:12:33 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32R9dhLu017326;
        Mon, 27 Mar 2023 10:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=4aMdKhkUYdQ6Vr3dPhi8fSTUNf7sq1PH+8lkCvMRCyU=;
 b=J+c9hq8J9gtMngb5lyTawQJlqyntTCBnzj8YQhAAf/8KfsO9bfPDVvB47WrAbWYdWCMQ
 vtjzJYrn9hZnjyeVuwgUSw6BKnK1cycRLHvGKVZQT5kP0dxt0JmjEp3lPMdEjQ7MvxdT
 PuhKu5BjAPIjvl3PvXtp2j/aM5yQ3azKFn8hCI7C45T5wKZ9wJBXlBCJIP07/tRcI5UU
 Eqp5KMCM27UcGnP5HY3gYeq7v6W2stXxV9qaAXs0pl+5NC34LgpdbJ164Sz5GPpVbLx3
 zIS4/yrT2bHeoQ0Rdc2UYSElPtscHJQwp4Hfi246IRjgWeO2arsKpG3v0zGSyKpRZyK/ JQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pk8pvg2vs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Mar 2023 10:12:32 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32RACW79007891
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Mar 2023 10:12:32 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 27 Mar 2023 03:12:31 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v3 3/6] usb: gadget: f_fs: remove struct ffs_data *ffs from struct ffs_desc_helper
Date:   Mon, 27 Mar 2023 18:12:17 +0800
Message-ID: <1679911940-4727-3-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1679911940-4727-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1679911940-4727-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZY65iq1eauCZQbXEyXLBtiQJG8pIOhn1
X-Proofpoint-ORIG-GUID: ZY65iq1eauCZQbXEyXLBtiQJG8pIOhn1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxlogscore=671
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270081
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As struct ffs_desc_helper have one struct ffs_data *ffs member, but it
related function already have struct ffs_data *ffs parameter, it is safe
to remove the struct member.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v3: new patch in this version

 drivers/usb/gadget/function/f_fs.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 32e66f01..a4051c8 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -231,7 +231,6 @@ struct ffs_io_data {
 };
 
 struct ffs_desc_helper {
-	struct ffs_data *ffs;
 	unsigned interfaces_count;
 	unsigned eps_count;
 };
@@ -2196,8 +2195,8 @@ static int __ffs_data_do_entity(struct ffs_data *ffs, enum ffs_entity_type type,
 		 * Strings are indexed from 1 (0 is reserved
 		 * for languages list)
 		 */
-		if (*valuep > helper->ffs->strings_count)
-			helper->ffs->strings_count = *valuep;
+		if (*valuep > ffs->strings_count)
+			ffs->strings_count = *valuep;
 		break;
 
 	case FFS_ENDPOINT:
@@ -2206,10 +2205,10 @@ static int __ffs_data_do_entity(struct ffs_data *ffs, enum ffs_entity_type type,
 		if (helper->eps_count >= FFS_MAX_EPS_COUNT)
 			return -EINVAL;
 		/* Check if descriptors for any speed were already parsed */
-		if (!helper->ffs->eps_count && !helper->ffs->interfaces_count)
-			helper->ffs->eps_addrmap[helper->eps_count] =
+		if (!ffs->eps_count && !ffs->interfaces_count)
+			ffs->eps_addrmap[helper->eps_count] =
 				d->bEndpointAddress;
-		else if (helper->ffs->eps_addrmap[helper->eps_count] !=
+		else if (ffs->eps_addrmap[helper->eps_count] !=
 				d->bEndpointAddress)
 			return -EINVAL;
 		break;
@@ -2485,7 +2484,6 @@ static int __ffs_data_got_descs(struct ffs_data *ffs,
 
 	/* Read descriptors */
 	raw_descs = data;
-	helper.ffs = ffs;
 	for (i = 0; i < 3; ++i) {
 		if (!counts[i])
 			continue;
-- 
2.7.4

