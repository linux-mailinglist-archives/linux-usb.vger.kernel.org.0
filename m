Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDD267AA9F
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jan 2023 07:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234904AbjAYG6P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Jan 2023 01:58:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234594AbjAYG6N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Jan 2023 01:58:13 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2862D485A1
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 22:58:12 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30P6VHDo014717;
        Wed, 25 Jan 2023 06:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=E1dCdTK9jBrsvVplEmY1r4KA7DbB755sncn6xKlU5ys=;
 b=Cm1OV1P+X/WlmPpCH+ADdJsQp1eYMfhYzrm5oEt0PjhsfJhTTTvzt7g0MXdBXNXrN/6V
 0GJLErLXLcC7e5Ujl21g4HwdlPRuVStoaTMVkmWox7cN/GLM+gSozWL7kqeajYI2xH58
 l8OXPu8vbS+FQkNbWkzOIlq35MAIA0KuOTOCCsecyOn4Zuy64KeyP5weQ/2VGqMTz3Jd
 RjahhghB+7hdVQAdPtDqClyVlSuVjqGeRJbCKEJtJJtUZGo4mst2AFOsRhaSSbv3y4wF
 vdvFYdEqooxBv0xqRZrWYd9ielnO5t/y+b7QhMVHcltS3UwwkppmQETVNp5rMQi5Tyz6 1g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89hk6ksg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Jan 2023 06:58:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30P6w3O4025415
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Jan 2023 06:58:03 GMT
Received: from hu-ugoswami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 24 Jan 2023 22:58:00 -0800
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Frank Li <frank.li@nxp.com>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        <linux-usb@vger.kernel.org>,
        Udipto Goswami <quic_ugoswami@quicinc.com>
Subject: [PATCH] usb: gadget: configfs: Restrict symlink creation if UDC already binded
Date:   Wed, 25 Jan 2023 12:27:40 +0530
Message-ID: <20230125065740.12504-1-quic_ugoswami@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: L3aTTq13OG_PmaqDMRv8v-tJt9Pjw8d7
X-Proofpoint-ORIG-GUID: L3aTTq13OG_PmaqDMRv8v-tJt9Pjw8d7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_03,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=251 phishscore=0
 suspectscore=0 clxscore=1011 mlxscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250063
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

During enumeration or composition switch, if a userspace process
agnostic of the conventions of configs tries to create function symlink
seven after the UDC is bound to current config which is not correct.
Potentially it can create duplicates within the current config.

Prevent this by adding a check if udc_name already exists then bail
out of cfg_link.

Fixes: 88af8bbe4ef7 ("usb: gadget: the start of the configfs interface")
Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
---
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

