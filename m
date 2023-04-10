Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E13F6DCDE9
	for <lists+linux-usb@lfdr.de>; Tue, 11 Apr 2023 01:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbjDJXUM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Apr 2023 19:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjDJXUK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Apr 2023 19:20:10 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E22C1E7C;
        Mon, 10 Apr 2023 16:20:09 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33AN091l026043;
        Mon, 10 Apr 2023 23:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=MEIIiB7asQwxSOKBrgES6n0j3671fTTzzrR6gNjEmX4=;
 b=ZEEng0sBEpI5RA7fRLSfprilUBvI5YTmKrvf58eWkRqcd+CWkOL2BcfXMMNqCTqPqQ+R
 JE11LuhsOowNNpqHWgugxUS1orf+SOJqbOW5nEkDiiXBTGV6QKJDYObysUXS51ocuy6N
 tG4B7J3QEXnNqcCBECHvmdCZgkYtp9gJqRDiped+nYGDePLVIkEJIogxSKObsVj94XjS
 VizM5cvGJh/zC9lE/YC0H9nWorA1oMZVUFMjjoKLpuR6cZnv6XJrjXVuiQGrzhiPFUSt
 GeRB3uclj/PMEigz+dQNHggQXbULs1+Op1op1PDaCnFUeqzyFF2GPDyRSAk9M5Qst4hG Dw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pvq4dgga4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Apr 2023 23:20:06 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33ANK5l6029453
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Apr 2023 23:20:05 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 10 Apr 2023 16:20:05 -0700
From:   Wesley Cheng <quic_wcheng@quicinc.com>
To:     <gregkh@linuxfoundation.org>, <Thinh.Nguyen@synopsys.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <quic_jackp@quicinc.com>, <quic_ugoswami@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v3 0/3] Avoid having pending end transfers on soft disconnect
Date:   Mon, 10 Apr 2023 16:19:51 -0700
Message-ID: <20230410231954.437-1-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: N5xQwHQ1H46g0Ic5uF6749AumOcz5HEF
X-Proofpoint-GUID: N5xQwHQ1H46g0Ic5uF6749AumOcz5HEF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_16,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=629 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304100204
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In case there is a host which takes time to complete a SETUP transaction,
during the soft disconnect sequence multiple DWC3 EPs will have their
DWC3_EP_DELAY_STOP flag set w/o issuing the end transfer command.  Once the
controller halt sequence occurs, the soft disconnect is successful, and
the subsequent soft connect will attempt to flush the pending end transfers.

Soft disconnect sequence:
  dwc3_gadget_ep_disable   name=ep8in flags=0x3009  direction=1
  dwc3_gadget_ep_disable   name=ep4in flags=1  direction=1
  dwc3_gadget_ep_disable   name=ep3out flags=1  direction=0
  usb_gadget_disconnect   deactivated=0  connected=0  ret=0

Soft connect bug:
  BUG: spinlock already unlocked on CPU
  spin_bug+0x0
  dwc3_remove_requests+0x278
  dwc3_ep0_out_start+0xb0
  __dwc3_gadget_start+0x25c

The bug occurs due to the flush of the pending end transfers, as the gadget
start routine is not held with a spinlock.  However, if the DWC3_EP_DELAY_STOP
is set, it will call the giveback API, which attempts to unlock the dwc->lock.
Ideally, the DWC3 gadget should not have pending end transfers on a soft
connect, so fix this by:

 1. Re-locating the SETUP phase check after stop active transfers, since
 that is where the DWC3_EP_DELAY_STOP is potentially set.  This also allows
 for handling of a host that may be unresponsive by using the completion
 timeout to trigger the stall and restart for EP0.

 2. Do not call gadget stop until the poll for controller halt is
 completed.  DEVTEN is cleared as part of gadget stop, so the intention to
 allow ep0 events to continue while waiting for controller halt is not
 happening.

Changes in v3:
- Removed fixes tag in the refactor change

Wesley Cheng (3):
  usb: dwc3: gadget: Refactor EP0 forced stall/restart into a separate
    API
  usb: dwc3: gadget: Stall and restart EP0 if host is unresponsive
  usb: dwc3: gadget: Execute gadget stop after halting the controller

 drivers/usb/dwc3/gadget.c | 101 ++++++++++++++++++++++----------------
 1 file changed, 58 insertions(+), 43 deletions(-)

