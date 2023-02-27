Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F32A76A38FF
	for <lists+linux-usb@lfdr.de>; Mon, 27 Feb 2023 03:47:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjB0CrW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Feb 2023 21:47:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjB0CrV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 Feb 2023 21:47:21 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 101CEF965
        for <linux-usb@vger.kernel.org>; Sun, 26 Feb 2023 18:47:03 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31R0iBht023055;
        Mon, 27 Feb 2023 02:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=/jkp4RMAfBLBjOBrq8VJwg06AqEjzGvj4EfG99gY/zc=;
 b=Qe0ep5pZyOHYJVAOKFyeranzpp2FXt20bqY+zZ4OdPbd6GCA6glE8XtusPdj2M7KWgcc
 nWITkG5B3alr0l5qrPSkwbASeddLx24XiIWlz6jvaYTJxaXrFfg57Oc1wC7B/alfR4l8
 naFVTJzVRDMxQnmcTFM3UKGh31tkJB4y8TWgc7eHFtxlED2Vjtwv4dT9Xo+NxHMFOKUt
 jcITpPVLMyHd9XAPjxLvoSuU3uPmyV8vzo2e8nlMSBjB6IzRgw17RmoRk2JmR9gJfklV
 L0yqoOA9NDNJ6kib++U+mLmzrgXBZ9ivJ8IQzvRWkCWIG/qO/FLAhAhXja5GoRdzUund uQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nybgubauy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Feb 2023 02:30:12 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31R2UBle032693
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Feb 2023 02:30:11 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Sun, 26 Feb 2023 18:30:08 -0800
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@kernel.org>,
        "Pawel Laszczak" <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        "Aswath Govindraju" <a-govindraju@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Wesley Cheng" <quic_wcheng@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH 1/4] usb: cdns3: change trace event cdns3_ring() operation
Date:   Mon, 27 Feb 2023 10:29:51 +0800
Message-ID: <1677464994-32409-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XBYxFo5EreP95e2cF3_nr7bHAE78jWqs
X-Proofpoint-ORIG-GUID: XBYxFo5EreP95e2cF3_nr7bHAE78jWqs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-26_22,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 mlxlogscore=768
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302270017
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

