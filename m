Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B28846A6057
	for <lists+linux-usb@lfdr.de>; Tue, 28 Feb 2023 21:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjB1UYi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Feb 2023 15:24:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjB1UYh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Feb 2023 15:24:37 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653382CFD7;
        Tue, 28 Feb 2023 12:24:36 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31SFat89000539;
        Tue, 28 Feb 2023 20:24:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=MWs5GaP2YVGYWhAhendLbTbrvGg9jrB0sDUAkoQfZzw=;
 b=Q3e4KwtnwqFuQqDRCRkPzoQPA+9HZCAg4ZgcKV+dT/4WYP38GcZ4oN8fo7bokI1dwn68
 UckKZZCH8pGJfIjFY4UNjNZ/THrdmo1e+7t/zsUjb1dZVnv5YZxMXyW9O6BYmVoq+7xS
 ktkkzYZNxgrYiJ9wqtzRKJyHFjQsfcFBCNIoo8dBqS3YF7vAUiqRSsJq6P41ubIltHUK
 oIS4TcrFrBd+FMTEDaJ3i1AiTIZN/fTFWxHfcL6a0EZuLioXuetCobwnJzmYd9q9QqHm
 JayCYEai+d/mUO5T+iM9r46uCn4HheQViReyZo4514rbPAFEByFsrUFROMe/vw0CzkRl sg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p1csvt9qr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Feb 2023 20:24:33 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31SKOVwh015244
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Feb 2023 20:24:31 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Tue, 28 Feb 2023 12:24:31 -0800
From:   Wesley Cheng <quic_wcheng@quicinc.com>
To:     <gregkh@linuxfoundation.org>, <Thinh.Nguyen@synopsys.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <quic_jackp@quicinc.com>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v3] usb: dwc3: gadget: Add 1ms delay after end transfer command without IOC
Date:   Tue, 28 Feb 2023 12:24:18 -0800
Message-ID: <20230228202418.9126-1-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5BvWqKXDgSMjTf4zlQnCJIsqskYYIRV9
X-Proofpoint-ORIG-GUID: 5BvWqKXDgSMjTf4zlQnCJIsqskYYIRV9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-02-28_17,2023-02-28_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 mlxlogscore=464
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302280169
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Previously, there was a 100uS delay inserted after issuing an end transfer
command for specific controller revisions.  This was due to the fact that
there was a GUCTL2 bit field which enabled synchronous completion of the
end transfer command once the CMDACT bit was cleared in the DEPCMD
register.  Since this bit does not exist for all controller revisions, add
the delay back in, and increase the duration to 1ms for the controller to
complete the command.

An issue was seen where the USB request buffer was unmapped while the DWC3
controller was still accessing the TRB.  However, it was confirmed that the
end transfer command was successfully submitted. (no end transfer timeout)
In situations, such as dwc3_gadget_soft_disconnect() and
__dwc3_gadget_ep_disable(), the dwc3_remove_request() is utilized, which
will issue the end transfer command, and follow up with
dwc3_gadget_giveback().  At least for the USB ep disable path, it is
required for any pending and started requests to be completed and returned
to the function driver in the same context of the disable call.  Without
the GUCTL2 bit, it is not ensured that the end transfer is completed before
the buffers are unmapped.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
Changes in v3:
- Fixed subject title and modified commit text to reference the new 1ms
delay

Changes in v2:
- Increase delay value to 1ms
- Make this applicable to DWC32 revisions as well

 drivers/usb/dwc3/gadget.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 3c63fa97a680..15adf07a4df4 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1699,6 +1699,7 @@ static int __dwc3_gadget_get_frame(struct dwc3 *dwc)
  */
 static int __dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force, bool interrupt)
 {
+	struct dwc3 *dwc = dep->dwc;
 	struct dwc3_gadget_ep_cmd_params params;
 	u32 cmd;
 	int ret;
@@ -1722,10 +1723,14 @@ static int __dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force, bool int
 	WARN_ON_ONCE(ret);
 	dep->resource_index = 0;
 
-	if (!interrupt)
+	if (!interrupt) {
+		if (DWC3_IP_IS(DWC32) || DWC3_IP_IS(DWC31) ||
+			DWC3_VER_IS_PRIOR(DWC3, 310A))
+			mdelay(1);
 		dep->flags &= ~DWC3_EP_TRANSFER_STARTED;
-	else if (!ret)
+	} else if (!ret) {
 		dep->flags |= DWC3_EP_END_TRANSFER_PENDING;
+	}
 
 	dep->flags &= ~DWC3_EP_DELAY_STOP;
 	return ret;
@@ -3774,7 +3779,11 @@ void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
 	 * enabled, the EndTransfer command will have completed upon
 	 * returning from this function.
 	 *
-	 * This mode is NOT available on the DWC_usb31 IP.
+	 * This mode is NOT available on the DWC_usb31 IP.  In this
+	 * case, if the IOC bit is not set, then delay by 100uS
+	 * after issuing the EndTransfer command.  This allows for the
+	 * controller to handle the command completely before DWC3
+	 * remove requests attempts to unmap USB request buffers.
 	 */
 
 	__dwc3_stop_active_transfer(dep, force, interrupt);
