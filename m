Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B11579A273
	for <lists+linux-usb@lfdr.de>; Mon, 11 Sep 2023 06:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233625AbjIKEbH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 00:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232202AbjIKEbG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 00:31:06 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A3261B8
        for <linux-usb@vger.kernel.org>; Sun, 10 Sep 2023 21:30:59 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38B3RDD6026054;
        Mon, 11 Sep 2023 04:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=vogQ9BdTbk1jbLRfLkAnjtnxtgl/Xd0k2IYPo76tphE=;
 b=NHE9UI2aAg4cayWE3MxHlQ7iI0D5ACYxbw1eEqcnKKwVanDBx2dclkRSpQwuXxdmGqd6
 PztOoCG2X/oXGhlGT21fBejOgTKOhCKwf6X+bOS/AOqNv32LXm0QNw2E4vxw8vEtJGtB
 j3pno0qrua+qyXnPlZP9rVb8SA8hWLXWwk2MTxCdvPABLKxE/zwiZPJfIwGHhA4m+E0u
 1Sn0208cL/5RTswYhhij9n9E9Jg6x+K+cE2MGih9ESC8hBumdUOCbCVFYUWrHLVXcspI
 szCEuMkaJHNDvrqk1x5rIIghJLIfAsECCJ0unZGOxFc9Sp4QoZXudSLyLUoTlsbmkLa3 mQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0hfqjmsf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 04:30:23 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38B4UM4N017111
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 04:30:22 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Sun, 10 Sep 2023 21:30:15 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Neal Liu <neal_liu@aspeedtech.com>,
        "Cristian Birsan" <cristian.birsan@microchip.com>,
        Bin Liu <b-liu@ti.com>, "Kevin Cernekee" <cernekee@gmail.com>,
        Justin Chen <justin.chen@broadcom.com>,
        "Al Cooper" <alcooperx@gmail.com>, Li Yang <leoyang.li@nxp.com>,
        "Vladimir Zapolskiy" <vz@mleia.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        Herve Codina <herve.codina@bootlin.com>,
        hierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@amd.com>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        "Shuah Khan" <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH 11/11] usb: musb: trace: reduce buffer usage of trace event
Date:   Mon, 11 Sep 2023 12:28:43 +0800
Message-ID: <20230911042843.2711-12-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230911042843.2711-1-quic_linyyuan@quicinc.com>
References: <20230911042843.2711-1-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ji19IHwdPBhjOpMAu4QnfMeQyNpY4av2
X-Proofpoint-GUID: Ji19IHwdPBhjOpMAu4QnfMeQyNpY4av2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_01,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 phishscore=0 mlxlogscore=446 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110041
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Save u32 member into trace event ring buffer and parse it for possible
bit information.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/musb/musb_trace.h | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/musb/musb_trace.h b/drivers/usb/musb/musb_trace.h
index f246b14394c4..6986a89767a2 100644
--- a/drivers/usb/musb/musb_trace.h
+++ b/drivers/usb/musb/musb_trace.h
@@ -243,9 +243,7 @@ DECLARE_EVENT_CLASS(musb_req,
 		__field(int, status)
 		__field(unsigned int, buf_len)
 		__field(unsigned int, actual_len)
-		__field(unsigned int, zero)
-		__field(unsigned int, short_not_ok)
-		__field(unsigned int, no_interrupt)
+		__field(u32, rdw1)
 	),
 	TP_fast_assign(
 		__entry->req = &req->request;
@@ -254,16 +252,14 @@ DECLARE_EVENT_CLASS(musb_req,
 		__entry->status = req->request.status;
 		__entry->buf_len = req->request.length;
 		__entry->actual_len = req->request.actual;
-		__entry->zero = req->request.zero;
-		__entry->short_not_ok = req->request.short_not_ok;
-		__entry->no_interrupt = req->request.no_interrupt;
+		__entry->rdw1 = req->request.dw1;
 	),
 	TP_printk("%p, ep%d %s, %s%s%s, len %d/%d, status %d",
 			__entry->req, __entry->epnum,
 			__entry->is_tx ? "tx/IN" : "rx/OUT",
-			__entry->zero ? "Z" : "z",
-			__entry->short_not_ok ? "S" : "s",
-			__entry->no_interrupt ? "I" : "i",
+			USB_REQ_ZERO(__entry->rdw1) ? "Z" : "z",
+			USB_REQ_SHORT_NOT_OK(__entry->rdw1) ? "S" : "s",
+			USB_REQ_NO_INTERRUPT(__entry->rdw1) ? "I" : "i",
 			__entry->actual_len, __entry->buf_len,
 			__entry->status
 	)
-- 
2.17.1

