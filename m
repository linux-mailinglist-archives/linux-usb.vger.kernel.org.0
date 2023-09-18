Return-Path: <linux-usb+bounces-319-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 682577A4868
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 13:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94D191C211BC
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 11:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84A21C69F;
	Mon, 18 Sep 2023 11:29:52 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36911C69B
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 11:29:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C926100
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 04:26:07 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38I9ifU0028601;
	Mon, 18 Sep 2023 11:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=0bHATM7srhyd3qi47UYU/1P2EcZ8WvFX12GkxetIFXw=;
 b=bd6dicoNZdbT5bYOg5tb4auC415wrSY/X48xmT+A+F4zZHPoa+UPBFYgnVkGmPWh/Joj
 nARktEFBqu2o8wbGp8HGki3UZ+IHdNTZ4vro3N1NllzuRR4MOgPMocPBMahTwY55QSEt
 DzCY8D5iImND5f6M4ptxU0NqUOiPZA/aabjE15aswiIpKlwMx5G8brSa+ckQvk+1oF+Z
 FuOCdKe2omtzIC57NQIQYp+LFA9cGDMuCy64YVeUmrOLez2gnANy2o/uncwG0lXxKCMo
 6/03g+PG1KPNyouWqkj2ctsGiLyHbnjSxrr0vF1M62JeAiIE7qy3+voIqBS3+wfLfcM6 oA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t54rdtvj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Sep 2023 11:25:49 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38IBPma8017444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Sep 2023 11:25:48 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 18 Sep 2023 04:25:46 -0700
From: Linyu Yuan <quic_linyyuan@quicinc.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alan Stern
	<stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v7 1/4] usb: gadget: remove UDC_TRACE_STR_MAX definition
Date: Mon, 18 Sep 2023 19:25:31 +0800
Message-ID: <20230918112534.2108-2-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230918112534.2108-1-quic_linyyuan@quicinc.com>
References: <20230918112534.2108-1-quic_linyyuan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: uRXfGERIf5QKkprdCrlYh_AHG5zfoh8L
X-Proofpoint-GUID: uRXfGERIf5QKkprdCrlYh_AHG5zfoh8L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-18_04,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 mlxlogscore=451 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309180100
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

It is not used anymore.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v7: new patch

 include/linux/usb/gadget.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 75bda0783395..5b5a8c5f2c47 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -26,8 +26,6 @@
 #include <linux/workqueue.h>
 #include <linux/usb/ch9.h>
 
-#define UDC_TRACE_STR_MAX	512
-
 struct usb_ep;
 
 /**
-- 
2.17.1


