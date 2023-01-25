Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24D9167AACC
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jan 2023 08:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234768AbjAYHWU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Jan 2023 02:22:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234449AbjAYHWP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Jan 2023 02:22:15 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 141DB24111
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 23:22:06 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30P6U1nF029736;
        Wed, 25 Jan 2023 07:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=Wf/WjQ2J/lhSF+TM/r9G5pNXqwNr4z5fUnRTOPj49bo=;
 b=NOyL+8i9zQY//KRwNjd/ioPp/ugzmlR9cZu/qK72rwXu6nI6rU8lwLLxtbl815U7RIr2
 72+9ZsGDHaNJEKnv30VzLX5vuP6HNHocfd6ieUWZzaAK0gq+1ArkdgSh8X5MTHX0ugGz
 GGAU1+c2G5a9x1DzkYCRkFiNHbr77J/3wDKMvr8y7cRGCvh2wmaDD51q7OeZUy4bm882
 SH9ImfOYWz6drqmMe61LxaGWBE3k3v/vFiZPOrVD1fj0PkkVCmUr7XNaW8GVsi2fjhJJ
 d9uVqRdeZd4yuK9qc5NEePN7jg1TggP/6Mm4jXRPhV/nzEG8/r+BNH3Iic79g5BoQdQD Bg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89dnekb4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Jan 2023 07:21:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30P7Lw6Z015305
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Jan 2023 07:21:58 GMT
Received: from hu-ugoswami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 24 Jan 2023 23:21:55 -0800
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Frank Li <frank.li@nxp.com>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        <linux-usb@vger.kernel.org>,
        Udipto Goswami <quic_ugoswami@quicinc.com>
Subject: [v2] usb: gadget: configfs: Restrict symlink creation is UDC already binded
Date:   Wed, 25 Jan 2023 12:51:38 +0530
Message-ID: <20230125072138.21925-1-quic_ugoswami@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W-CGU_kdOsQjE4Z9BXJcFWVD2td5AYrd
X-Proofpoint-ORIG-GUID: W-CGU_kdOsQjE4Z9BXJcFWVD2td5AYrd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_04,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 impostorscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=1 phishscore=0 mlxscore=1 bulkscore=0
 malwarescore=0 mlxlogscore=202 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250067
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

During enumeration or composition switch,a userspace process
agnostic of the conventions of configs can try to create function
symlinks even after the UDC is bound to current config which is
not correct. Potentially it can create duplicates within the
current config.

Prevent this by adding a check if udc_name already exists then bail
out of cfg_link.

Fixes: 88af8bbe4ef7 ("usb: gadget: the start of the configfs interface")
Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
---
v2: Fixed spelling mistakes in commit text.

 drivers/usb/gadget/configfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 78e7353e397b..434e49d29c50 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -455,6 +455,11 @@ static int config_usb_cfg_link(
 		}
 	}
 
+	if (gi->composite.gadget_driver.udc_name) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	f = usb_get_function(fi);
 	if (IS_ERR(f)) {
 		ret = PTR_ERR(f);
-- 
2.17.1

