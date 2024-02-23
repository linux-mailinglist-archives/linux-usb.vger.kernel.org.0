Return-Path: <linux-usb+bounces-6950-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9A1860ED0
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 11:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57F6F1C22306
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 10:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A155CDCA;
	Fri, 23 Feb 2024 10:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I6sZ9Gsq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D4843168
	for <linux-usb@vger.kernel.org>; Fri, 23 Feb 2024 10:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708682433; cv=none; b=ReYA4nDYXHZxaPczOQc6CPyV+/CdfSX4HsObtG7cNTp55mStRkYL8a1qpXWhKphKT/yLAVvuU1g3Z5KPq+xGhFVcZmmdkMaLBfWuKhSr+7Kxsrq6dIWbt59CMZ4C5GAmdNRs9Lw4yMrX2DhrTuB/KRIAaUh/soK75MvRbzkGgFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708682433; c=relaxed/simple;
	bh=FvmkFV7E7EFtLzlkypXGEL2H056wFv8CpoOcQ71laXY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iqZSLXAPIJkAWy8BFBm0XAKFQRN/zkBSWMsFQO9sya/FknFq0RZAXjjU983hejRWYUs6IJ2drF/onnbHDzaTvxwBbMS7XCHMGt8NaN6fv4HJXeaBOQGjczRQ+GcIkwxcnFyxrqjPmUWjYLxLp0IUzaGTBCnzCz84woy3KcmNR0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I6sZ9Gsq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41N8riPM002581;
	Fri, 23 Feb 2024 10:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	qcppdkim1; bh=yqB4hgVXOZp5Hdoig8hNyAA4O70+zKaVhFQqqI5Qui0=; b=I6
	sZ9Gsq40IDtY5WwoAL9CPKKCswg1v9LpIiUVtfRP8vAqzzxUiNluWcMUuXlWibPH
	yzIEIZw1ljT4juHa21KNjpCybculbnR5M6MsoJY9NX4y7qkAHlfo689F2SyNRSiX
	qGUI8UPQNFxDi4wlq3YacLnu2KQqCTgKk/DKwidL+WuxNbyNo7O5dR1r53MuLFIp
	SWAP/QqcYGkRCKka+r1Nnu52SJbg8gmuL6YLIYz6mx/ZCSgXcDNPpkQb07qvI2LZ
	YY4TJwyV+wMlhBdz945JwwHjrp0PGFLTS7Q6pjBDgGwO53a0YkBOgW/TNQHHhJ73
	uPhj91Ew+4n/CEOWgHkQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wer8mr41g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 10:00:22 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41NA0LlZ006393
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 10:00:21 GMT
Received: from zijuhu-gv.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 23 Feb 2024 02:00:19 -0800
From: Zijun Hu <quic_zijuhu@quicinc.com>
To: <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <usb-storage@lists.one-eyed-alien.net>,
        "Zijun Hu" <quic_zijuhu@quicinc.com>
Subject: [PATCH] Bluetooth: btusb: Use right timeout macro to receive control message
Date: Fri, 23 Feb 2024 18:00:16 +0800
Message-ID: <1708682416-8664-1-git-send-email-quic_zijuhu@quicinc.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sdv7UG0YK2aLTCpluD1bptWVJ2HMaWpD
X-Proofpoint-ORIG-GUID: sdv7UG0YK2aLTCpluD1bptWVJ2HMaWpD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1011 mlxscore=0
 impostorscore=0 mlxlogscore=932 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402230070

USB driver defines macro @USB_CTRL_SET_TIMEOUT for sending control message
and @USB_CTRL_GET_TIMEOUT for receiving, but sierra_get_swoc_info() wrongly
uses @USB_CTRL_SET_TIMEOUT as argument of usb_control_msg() to receive
control message, fixed by using @USB_CTRL_GET_TIMEOUT to receive message.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/usb/storage/sierra_ms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/storage/sierra_ms.c b/drivers/usb/storage/sierra_ms.c
index 177fa6cd143a..8b5a88ea4803 100644
--- a/drivers/usb/storage/sierra_ms.c
+++ b/drivers/usb/storage/sierra_ms.c
@@ -75,7 +75,7 @@ static int sierra_get_swoc_info(struct usb_device *udev,
 			0,				/* __u16 index       */
 			(void *) swocInfo,		/* void *data        */
 			sizeof(struct swoc_info),	/* __u16 size 	     */
-			USB_CTRL_SET_TIMEOUT);		/* int timeout 	     */
+			USB_CTRL_GET_TIMEOUT);		/* int timeout	     */
 
 	swocInfo->LinuxSKU = le16_to_cpu(swocInfo->LinuxSKU);
 	swocInfo->LinuxVer = le16_to_cpu(swocInfo->LinuxVer);
-- 
2.7.4


