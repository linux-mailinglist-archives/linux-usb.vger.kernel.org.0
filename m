Return-Path: <linux-usb+bounces-24988-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFF1AE3044
	for <lists+linux-usb@lfdr.de>; Sun, 22 Jun 2025 16:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A01A18858F8
	for <lists+linux-usb@lfdr.de>; Sun, 22 Jun 2025 14:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609471D8E01;
	Sun, 22 Jun 2025 14:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OEzpGeNP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7A41ACED7
	for <linux-usb@vger.kernel.org>; Sun, 22 Jun 2025 14:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750601107; cv=none; b=RVNWP0WX8CMOKmahWKgzBTXCwUvREyj2+dL9fLpfPtEHK1dwtOaWEGIw2TNcH6qJos55IjsvMcI9bucyg1gq3oDCRLn7NTQoE11xyudAyWq6xdr4zGU2c0JOw/vyrumNIqNpN/NkAWu2k4BLEMghTvLhVE1nItjmH7D4UvcAbvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750601107; c=relaxed/simple;
	bh=DRERbPBTTzUi6NNQ7zo50FEjd4vV3AF9vM+vtzoZLOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FEbb46ITIA9647ugTIULdAtH9UQybOSKMJEeqGIn4DQwpgWKa/1nO2ntDW2+gVZZJaqeX6riIrIYLXclVmpOqGD6Z4LbSYB8yrzBxfkyHCp2i6J/lREaNDjLAacYUFhb48gxeUMNQ8ljDLinheIkaFwwpGJFtkHAJDCkHUsfovs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OEzpGeNP; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MCfqHr020858;
	Sun, 22 Jun 2025 14:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=kxCGSHTo64fATEnBssUIqh8BKosMa
	9miDGoROoUAUOU=; b=OEzpGeNPbEQ7kjTOb0bcQoqMHmBjhjZellkc4d9p13x4+
	1Ksp34j6wCvzLqiQdMpfSzzutYCAO709p8irOblmcAJO8vwQtARqG/jC/z3F+41n
	wDs4grAzvKffL/FAY1sGqtYltovTnOnDPd6FV3xfBVW+V+DydeKppnb69B0F1Y2Q
	i/R5kJbNQ4WqiMF/+arwDFs6ItnmE/iM2sygyptTlHIhrZG3nI65Z1kiqTxhzLes
	CKG6BwRgxvGG2H3tjyjzAxwBWe7wsHIiu2jKNfIY/G1Rb85OKy+Ksy+QcIqALyHj
	nkMQoDJKmoz5NYHer77Kk8XhfMgB8Jef902hSNJyA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8y15eh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 14:04:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55MCHJ1Z031423;
	Sun, 22 Jun 2025 14:04:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehpn18mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 14:04:58 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55ME4wv7004034;
	Sun, 22 Jun 2025 14:04:58 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ehpn18mj-1;
	Sun, 22 Jun 2025 14:04:57 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: westeri@kernel.org, michael.jamet@intel.com,
        heikki.krogerus@linux.intel.com, YehezkelShB@gmail.com,
        mika.westerberg@linux.intel.com, wonchung@google.com,
        andreas.noever@gmail.com
Cc: alok.a.tiwari@oracle.com, linux-usb@vger.kernel.org
Subject: [QUERY] thunderbolt: Should usb4_port_device_add() return ERR_PTR() on component_add() failure?
Date: Sun, 22 Jun 2025 07:04:51 -0700
Message-ID: <20250622140455.2884518-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_04,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506220088
X-Proofpoint-ORIG-GUID: kS-tcWMlTuPc8wV4hBCCMnp0i62qTnvD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDA4OCBTYWx0ZWRfX/yJ9WPQP54r3 FgOyoD7WWwh9g28zwI6ZZy3NG/dWEsTtb5/gSVo2P7Ptfcx23OI+ayJpjycg5Lmyy6bylDPm/jE +LdmOPIwgKtcOBTIalBsJuoapybBO93dGISPzXVEpZ4q0dfSW9A60a+q3hABw3TCeCvdKE5xjNn
 SHJs+mNM0L/76vDHRG1lwa60l/A6X8tlnaTqcbNiH4MnQN42VpvTV1r/NQ4mywHiWzrxIGmnM9j Pi6p1zN7PnjMSpCbEyzOPiC8wAjeIl0sBlimQ6XsImLQSE/LXHajcf88DlF6kFOB3ihtbHjhFdE TGlj+vokJ1IvwA74oaw1gvKN5dI3EoP+cTgZOdlNGyF2AM44ylTPLxw69cm9IQ2RON9Bphl1eMJ
 I5Sug8hEPs9y1Le8x7Jx9rppYRdjAIC+waqH/QopjBRdM2FrlZseoQuo9ey07K6NujQrk8H4
X-Proofpoint-GUID: kS-tcWMlTuPc8wV4hBCCMnp0i62qTnvD
X-Authority-Analysis: v=2.4 cv=PqSTbxM3 c=1 sm=1 tr=0 ts=68580d8b cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6IFa9wvqVegA:10 a=xuhGjhNUwvrpSHUj0fIA:9

I noticed that in usb4_port_device_add(), when component_add() fails,
the function logs an error and calls device_unregister(),
but does not return an ERR_PTR(ret) immediately:
Should this be changed to return ERR_PTR(ret); right after device_unregister()?

ret = component_add(&usb4->dev, &connector_ops);
if (ret) {
    dev_err(&usb4->dev, "failed to add component\n");
    device_unregister(&usb4->dev);
    // Missing return here?
}

Thanks,
Alok

---
diff --git a/drivers/thunderbolt/usb4_port.c b/drivers/thunderbolt/usb4_port.c
index 852a45fcd19d1..6db4a0c8e4496 100644
--- a/drivers/thunderbolt/usb4_port.c
+++ b/drivers/thunderbolt/usb4_port.c
@@ -323,6 +323,7 @@ struct usb4_port *usb4_port_device_add(struct tb_port *port)
        if (ret) {
                dev_err(&usb4->dev, "failed to add component\n");
                device_unregister(&usb4->dev);
+               return ERR_PTR(ret);
        }

        if (!tb_is_upstream_port(port))
-- 
2.47.1


