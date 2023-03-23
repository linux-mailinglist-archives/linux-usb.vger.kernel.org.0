Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E280F6C6949
	for <lists+linux-usb@lfdr.de>; Thu, 23 Mar 2023 14:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbjCWNNt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Mar 2023 09:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231491AbjCWNNs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Mar 2023 09:13:48 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63C05769A
        for <linux-usb@vger.kernel.org>; Thu, 23 Mar 2023 06:13:46 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32NCpwMV013784;
        Thu, 23 Mar 2023 13:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=aVshTzYD9aEXyTdrGbq1+3ZJVGF23DlEjYiXOUuJLD0=;
 b=KolRka7M5NT7LjkAQUWRxHNUf3f+f8iqrpypOyjVgr1dX4X4hl7M7kIWYBaYVWqGPi1C
 xOsI6P6izpT0zoIr8vSwxulpYSgy7ELqyUEw/8r5Jlc1U0WnRy6clgvwmngwZq8UqClZ
 bPOoqpuFT7RRNR90Kz2GE307z8eHJdu3kPiZ5+KWuknHZSbzE4DeSSrAChaRZBDakTs4
 qRykyRNc4+JmmVGc2Z7K+1lny+6u8Q5v4shk6h/IhfI1BduZp9/44l27vz9hocNzzjOk
 yy+/GwCxeomnCH1qoJCohHSK8H1UnCEdJjaL8Pil0cCf9sW3jrdUOdsM2RNsbTI0rBfO HQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pg64k2c2d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Mar 2023 13:13:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32NDDTDv020074
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Mar 2023 13:13:29 GMT
Received: from hu-ugoswami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 23 Mar 2023 06:13:27 -0700
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        <linux-usb@vger.kernel.org>,
        Udipto Goswami <quic_ugoswami@quicinc.com>
Subject: [PATCH] usb: xhci: Remove unused udev from xhci_log_ctx trace event
Date:   Thu, 23 Mar 2023 18:43:15 +0530
Message-ID: <20230323131315.21764-1-quic_ugoswami@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HC9Njc9bLU3zymR-7_wFsx4rcgxMGjWe
X-Proofpoint-ORIG-GUID: HC9Njc9bLU3zymR-7_wFsx4rcgxMGjWe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 clxscore=1011 priorityscore=1501 adultscore=0 mlxlogscore=418 phishscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303230099
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

xhci_log_ctx event is not utilizing the extracted udev to
print out anything, hence removing it.

Fixes: 1d27fabec068 ("xhci: add xhci_address_ctx trace event")
Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
---
 drivers/usb/host/xhci-trace.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index 4286dba5b157..7555c4ea7c4b 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -80,20 +80,16 @@ DECLARE_EVENT_CLASS(xhci_log_ctx,
 		__field(dma_addr_t, ctx_dma)
 		__field(u8 *, ctx_va)
 		__field(unsigned, ctx_ep_num)
-		__field(int, slot_id)
 		__dynamic_array(u32, ctx_data,
 			((HCC_64BYTE_CONTEXT(xhci->hcc_params) + 1) * 8) *
 			((ctx->type == XHCI_CTX_TYPE_INPUT) + ep_num + 1))
 	),
 	TP_fast_assign(
-		struct usb_device *udev;
 
-		udev = to_usb_device(xhci_to_hcd(xhci)->self.controller);
 		__entry->ctx_64 = HCC_64BYTE_CONTEXT(xhci->hcc_params);
 		__entry->ctx_type = ctx->type;
 		__entry->ctx_dma = ctx->dma;
 		__entry->ctx_va = ctx->bytes;
-		__entry->slot_id = udev->slot_id;
 		__entry->ctx_ep_num = ep_num;
 		memcpy(__get_dynamic_array(ctx_data), ctx->bytes,
 			((HCC_64BYTE_CONTEXT(xhci->hcc_params) + 1) * 32) *
-- 
2.17.1

