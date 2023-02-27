Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 795196A3933
	for <lists+linux-usb@lfdr.de>; Mon, 27 Feb 2023 04:06:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjB0DGS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Feb 2023 22:06:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbjB0DGR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 Feb 2023 22:06:17 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670F2E38A
        for <linux-usb@vger.kernel.org>; Sun, 26 Feb 2023 19:06:16 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31R2Qhlt013461;
        Mon, 27 Feb 2023 02:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=RL4hvVLLScLi+ckEyB3Y3tdDdn9zBNU4JFL18uplobA=;
 b=JToo3tT2fMObmxrA5XDKSRaN3rqzacJYQ34Pb7t1o6O3nmn6fhHYYr6Tn+xjysocVB4y
 shrS0BISoAF1cEVyCItql+XbBbM7psG4/OupeBqd/bc5rNjIEDodC5ZqOAs8RERbm0mZ
 T/igpEdNDEnnerXn7y6S0R/0Wzp2S8q+RuWFIFa9WPjRe+UPTGKdoBBRbv1PWjV077Fj
 gZuFKKJDOpGlE5G3sP5TPvQcVZxqz1TYFpKLIoLWBQQ41Mamb+4VP3n6HGLLn2zr/G1k
 jdQlX/J4pwswPngJUkQnR4+H7Gjk2+U0XXVkW8o/08BZ/N+JqVaQ4FlF4+H5ppKfw5Dk PA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ny9x9ue26-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Feb 2023 02:44:20 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31R2iJ8w017152
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Feb 2023 02:44:19 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Sun, 26 Feb 2023 18:44:16 -0800
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
Subject: [PATCH v2 0/4] usb: replace some __dynamic_array() to __get_buf()
Date:   Mon, 27 Feb 2023 10:44:06 +0800
Message-ID: <1677465850-1396-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gwmx4Z1cw47XEiUp69Tbvoi6k_OR-D5_
X-Proofpoint-ORIG-GUID: gwmx4Z1cw47XEiUp69Tbvoi6k_OR-D5_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-26_22,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=2 suspectscore=0 bulkscore=0
 spamscore=2 priorityscore=1501 mlxlogscore=180 mlxscore=2 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270019
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

some trace event funciton use __dynamic_array, but it only used at output
time, change to __get_buf() will allocate tempary buffer for such usage.


v2: remove Aswath Govindraju, seem mail not aviliable.


Linyu Yuan (4):
  usb: cdns3: change trace event cdns3_ring() operation
  usb: cdns3: change some trace event __dynamic_array() to __get_buf()
  usb: dwc3: change some trace event __dynamic_array() to __get_buf()
  usb: xhci: change some trace event __dynamic_array() to __get_buf()

 drivers/usb/cdns3/cdns3-debug.h |  8 ++------
 drivers/usb/cdns3/cdns3-trace.h | 28 +++++++++-------------------
 drivers/usb/cdns3/cdnsp-trace.h | 12 ++++--------
 drivers/usb/dwc3/trace.h        |  6 ++----
 drivers/usb/host/xhci-trace.h   | 20 +++++++-------------
 5 files changed, 24 insertions(+), 50 deletions(-)

-- 
2.7.4

