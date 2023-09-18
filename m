Return-Path: <linux-usb+bounces-315-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E26BF7A485B
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 13:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EE451C20C03
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 11:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06F41C684;
	Mon, 18 Sep 2023 11:26:52 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797D338FA2
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 11:26:51 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B024FCF8
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 04:26:07 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38IBBLMa012231;
	Mon, 18 Sep 2023 11:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=XL5n3BbDUaFfydo3fdANqE447oHpBA54jf4ZZ2l8u7g=;
 b=nYxD2dVN5+rj6jvH5UhgiOrN+S4IbbC8mHnMLOvzEk0SzaoVJ2n4xx+Wj7/KqG3bC9np
 KqGAvSwwKbll/NclAEV6JmhcgX5OekVu75BjUaEbAgkQKH5wf1W11pZ5dZL2QTEeCpJl
 L+pb+FVYKnOfx1i7+4uplft3/6MUNGhTQXcwKDIS/ZKfNY0cW3pW62ltog2+qZZx9cEb
 WDd1lLDJZl5dpvGP4FxNEygc9U15MJzhhGXAaOL9H3X1DfAaitSVFskGQu6k2ZSRjjSj
 /PrZDL4XWXfagCCcrPh6pt9UeWx63e8EJT0vhTSjb8pWXMSybMuW9eOiFdkGdTiIbUF+ tQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t54rdtvhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Sep 2023 11:25:47 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38IBPk3m031835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Sep 2023 11:25:46 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 18 Sep 2023 04:25:44 -0700
From: Linyu Yuan <quic_linyyuan@quicinc.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alan Stern
	<stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v7 0/4] usb: gadget: reduce usb gadget trace event buffer usage
Date: Mon, 18 Sep 2023 19:25:30 +0800
Message-ID: <20230918112534.2108-1-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1v5C_MxuhWk4HiMjZ_BPdCTDMpoxkVOh
X-Proofpoint-GUID: 1v5C_MxuhWk4HiMjZ_BPdCTDMpoxkVOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-18_04,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 mlxlogscore=845 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309180100
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

some trace event use an integer to save a bit field info of gadget,
also some trace save endpoint name in string forat, it all can be
chagned to other way at trace event store phase.

save one integer member which can parse it for multiple bit field
information.

ep name stringe can be replace to a integer which contaion number
and dir info.

in order to make sure bit field have same bit postion in memory for little
and big endian, define the bit fields differently according host cpu
endian type.

v1: https://lore.kernel.org/linux-usb/20230911042843.2711-1-quic_linyyuan@quicinc.com/
v2: fix two compile issues that COMPILE_TEST not covered
    https://lore.kernel.org/linux-usb/20230911112446.1791-1-quic_linyyuan@quicinc.com/
v3: fix reviewer comments, allow bit fields work on both little and big endian
    https://lore.kernel.org/linux-usb/20230912104455.7737-1-quic_linyyuan@quicinc.com/
v4: add DECLARE_EVENT_CLASS_PRINT_INIT() new trace class and use it
    https://lore.kernel.org/linux-usb/20230914100302.30274-1-quic_linyyuan@quicinc.com/
v5: use cpu_to_le32() at fast assign stage to fix endian issue
    https://lore.kernel.org/linux-usb/20230915051123.26486-1-quic_linyyuan@quicinc.com/
v6: missing three cpu_to_le32() usage in dwc3 trace
    https://lore.kernel.org/linux-usb/20230915052716.28540-1-quic_linyyuan@quicinc.com/
v7: define bit field according cpu endian type, remove wrong cpu_to_le32()
    usage which point by Alan Stern.

Linyu Yuan (4):
  usb: gadget: remove UDC_TRACE_STR_MAX definition
  usb: gadget: add anonymous definition in some struct for trace purpose
  usb: udc: trace: reduce buffer usage of trace event
  usb: dwc3: trace: reduce buffer usage of trace event

 drivers/usb/dwc3/trace.h       |  63 ++++----
 drivers/usb/gadget/udc/trace.h | 114 ++++----------
 include/linux/usb/gadget.h     | 268 +++++++++++++++++++++++++++------
 3 files changed, 285 insertions(+), 160 deletions(-)

-- 
2.17.1


