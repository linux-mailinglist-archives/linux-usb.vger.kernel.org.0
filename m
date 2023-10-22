Return-Path: <linux-usb+bounces-2056-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C89F7D2580
	for <lists+linux-usb@lfdr.de>; Sun, 22 Oct 2023 20:53:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D6771C20949
	for <lists+linux-usb@lfdr.de>; Sun, 22 Oct 2023 18:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAACF125B7;
	Sun, 22 Oct 2023 18:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lyIsSvWS"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA6B2F93;
	Sun, 22 Oct 2023 18:53:39 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C64AB3;
	Sun, 22 Oct 2023 11:53:38 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39M3mwLd015796;
	Sun, 22 Oct 2023 18:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-03-30; bh=DLqCwiZSlDSf4bkLi8tuIMPWT+orDX3cplywz0tFQfc=;
 b=lyIsSvWS1ZJP7VXza5BVtJXGMHQrOUNIM/ZDf49gkKCEAmd1hkDIcGST952vAaDbOqe4
 f8orRHkrBCKnx0KF+4z3N+vp8dbUA9QVKYsWcH3KsWQm+5Ta3kXwc5Km1ZDIt1ot2g1i
 O3TlSQag0PvX1KAN6FmgGJFKIKqywNCcHnWVVpkh1CNglvzcow4G9iQwz/Y3sJXKYDCd
 Eu4Aa4GMpRXojQA4l4TYYUgAQQG7UUiYY2fN2dj1AuAZiVqGDrPYziftVtB+w/wr6XiF
 t2K7h0ngub3NbLGoQ8mfvjcX2thtTF/hntMt9UalMtfW3i9OgcYNofeqprbUlQgXtcEr Fw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tv5e31ub7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Oct 2023 18:53:34 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39MH0usR031243;
	Sun, 22 Oct 2023 18:53:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3tv539qcw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Oct 2023 18:53:33 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39MIrXGH033580;
	Sun, 22 Oct 2023 18:53:33 GMT
Received: from localhost.localdomain (dhcp-10-175-52-84.vpn.oracle.com [10.175.52.84])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3tv539qcvt-1;
	Sun, 22 Oct 2023 18:53:32 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>, linux-usb@vger.kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] docs: usb: fix reference to nonexistent file in UVC Gadget
Date: Sun, 22 Oct 2023 20:53:11 +0200
Message-Id: <20231022185311.919325-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-22_16,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxlogscore=963 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310220175
X-Proofpoint-GUID: R809x-Luvyorqu5BjSvjpUoXjyyZSmCz
X-Proofpoint-ORIG-GUID: R809x-Luvyorqu5BjSvjpUoXjyyZSmCz

Fix a typo in the path of this reference.

Fixes: 094f391013ba ("docs: usb: Add documentation for the UVC Gadget")
Cc: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/usb/gadget_uvc.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/usb/gadget_uvc.rst b/Documentation/usb/gadget_uvc.rst
index 80a1f031b593..bf78fba3ce23 100644
--- a/Documentation/usb/gadget_uvc.rst
+++ b/Documentation/usb/gadget_uvc.rst
@@ -126,7 +126,7 @@ might do:
 	create_frame 1920 1080 uncompressed yuyv
 
 The only uncompressed format currently supported is YUYV, which is detailed at
-Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst.
+Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst.
 
 Color Matching Descriptors
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.34.1


