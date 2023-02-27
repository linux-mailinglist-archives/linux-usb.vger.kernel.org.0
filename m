Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 920086A38FD
	for <lists+linux-usb@lfdr.de>; Mon, 27 Feb 2023 03:45:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjB0Cpp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Feb 2023 21:45:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjB0Cpm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 Feb 2023 21:45:42 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A818D108
        for <linux-usb@vger.kernel.org>; Sun, 26 Feb 2023 18:45:17 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31R28SpW021848;
        Mon, 27 Feb 2023 02:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=B3baBn7H0Jy6TKPbO+NpkqYT+AYDr8c+4cFzOuSbjPA=;
 b=cn4cUqKOk3FJKp3DCVbljRcpmieN8BgnatPN7TUmjMo/vq5+elTMNfzpVRfG/RyIfoDD
 t2xKeA1BT/mj3OZRaH+2KNmgIFfTohcC5CbLnRioWwIT7FlrdyF9aYYi2ychvKYiWhXg
 MIZVK9eyF9v8vfmX3CymdlUqZhBPKd32OXkWRtl+N1AwLAFh2lJt1B6pSOi2y4fTGMkj
 Far+jUE30VTdfIf3kqTbXzgQIEO7HQKGByv5IQtNah7Gc0L8ezvP/XZuXUOaylGB4QBg
 Qke4sB6TbkMNaFkeZm7BghUntiqqWZC3j9EZ9JhZFHfiCJEDv8ITr0ch7GgCTPYSr6S+ 4g== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nybmh3c79-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Feb 2023 02:44:23 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31R2iMxD014718
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Feb 2023 02:44:22 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Sun, 26 Feb 2023 18:44:19 -0800
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@kernel.org>,
        "Pawel Laszczak" <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Wesley Cheng" <quic_wcheng@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 1/4] usb: cdns3: change trace event cdns3_ring() operation
Date:   Mon, 27 Feb 2023 10:44:07 +0800
Message-ID: <1677465850-1396-2-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1677465850-1396-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1677465850-1396-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IG_YAAFKekvyncxpa6BdO-PFppLzNvME
X-Proofpoint-ORIG-GUID: IG_YAAFKekvyncxpa6BdO-PFppLzNvME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-26_22,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 phishscore=0 impostorscore=0 adultscore=0 mlxlogscore=794
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270020
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

the original design seem have several problems, first during trace event
output stage, cdns3_dbg_ring() still refer to priv_ep->trb_pool which
data content may changed during runtime, second when ring number is
greater than TRBS_PER_SEGMENT, it has no change to show "too big" message,
third in cdns3_log_ring event class definition, it allocate too much trace
event buffer.

change cdns3_dbg_ring() to be called at trace event fast assign time, and
change trace buffer real dynamic according ring numbers.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: no change

 drivers/usb/cdns3/cdns3-debug.h |  8 ++------
 drivers/usb/cdns3/cdns3-trace.h | 16 +++++-----------
 2 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-debug.h b/drivers/usb/cdns3/cdns3-debug.h
index a5c6a29..4618cfe 100644
--- a/drivers/usb/cdns3/cdns3-debug.h
+++ b/drivers/usb/cdns3/cdns3-debug.h
@@ -107,8 +107,7 @@ static inline char *cdns3_decode_ep0_irq(char *str,
  * Prints out all TRBs in the endpoint ring, even those after the Link TRB.
  *.
  */
-static inline char *cdns3_dbg_ring(struct cdns3_endpoint *priv_ep,
-				   struct cdns3_trb *ring, char *str)
+static inline char *cdns3_dbg_ring(struct cdns3_endpoint *priv_ep, char *str)
 {
 	dma_addr_t addr = priv_ep->trb_pool_dma;
 	struct cdns3_trb *trb;
@@ -136,9 +135,6 @@ static inline char *cdns3_dbg_ring(struct cdns3_endpoint *priv_ep,
 		       "\t\tfree trbs: %d, CCS=%d, PCS=%d\n",
 		       priv_ep->free_trbs, priv_ep->ccs, priv_ep->pcs);
 
-	if (trb_per_sector > TRBS_PER_SEGMENT)
-		trb_per_sector = TRBS_PER_SEGMENT;
-
 	if (trb_per_sector > TRBS_PER_SEGMENT) {
 		sprintf(str + ret, "\t\tTransfer ring %d too big\n",
 			trb_per_sector);
@@ -146,7 +142,7 @@ static inline char *cdns3_dbg_ring(struct cdns3_endpoint *priv_ep,
 	}
 
 	for (i = 0; i < trb_per_sector; ++i) {
-		trb = &ring[i];
+		trb = &priv_ep->trb_pool[i];
 		ret += sprintf(str + ret,
 			"\t\t@%pad %08x %08x %08x\n", &addr,
 			le32_to_cpu(trb->buffer),
diff --git a/drivers/usb/cdns3/cdns3-trace.h b/drivers/usb/cdns3/cdns3-trace.h
index 7574b4a..9905718 100644
--- a/drivers/usb/cdns3/cdns3-trace.h
+++ b/drivers/usb/cdns3/cdns3-trace.h
@@ -438,22 +438,16 @@ DECLARE_EVENT_CLASS(cdns3_log_ring,
 	TP_PROTO(struct cdns3_endpoint *priv_ep),
 	TP_ARGS(priv_ep),
 	TP_STRUCT__entry(
-		__dynamic_array(u8, ring, TRB_RING_SIZE)
-		__dynamic_array(u8, priv_ep, sizeof(struct cdns3_endpoint))
 		__dynamic_array(char, buffer,
-				(TRBS_PER_SEGMENT * 65) + CDNS3_MSG_MAX)
+				GET_TRBS_PER_SEGMENT(priv_ep->type) > TRBS_PER_SEGMENT ?
+				CDNS3_MSG_MAX :
+				(GET_TRBS_PER_SEGMENT(priv_ep->type) * 65) + CDNS3_MSG_MAX)
 	),
 	TP_fast_assign(
-		memcpy(__get_dynamic_array(priv_ep), priv_ep,
-		       sizeof(struct cdns3_endpoint));
-		memcpy(__get_dynamic_array(ring), priv_ep->trb_pool,
-		       TRB_RING_SIZE);
+		cdns3_dbg_ring(priv_ep, __get_str(buffer));
 	),
 
-	TP_printk("%s",
-		  cdns3_dbg_ring((struct cdns3_endpoint *)__get_str(priv_ep),
-				 (struct cdns3_trb *)__get_str(ring),
-				 __get_str(buffer)))
+	TP_printk("%s", __get_str(buffer))
 );
 
 DEFINE_EVENT(cdns3_log_ring, cdns3_ring,
-- 
2.7.4

