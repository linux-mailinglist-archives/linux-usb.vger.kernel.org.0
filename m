Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97CE72D6F83
	for <lists+linux-usb@lfdr.de>; Fri, 11 Dec 2020 06:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbgLKFL2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Dec 2020 00:11:28 -0500
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:38748 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726464AbgLKFLU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Dec 2020 00:11:20 -0500
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BB59aQP019918;
        Thu, 10 Dec 2020 21:10:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=T2UdM/cWAGK4yfY0pJ+2+qtl+fWm+fXxOTKgDIiTaH0=;
 b=W/MTKhnZc+pEiPcOq141+v765YSD5rHWKdpSBTzEVMTphs18IriW2vIiVnf2rV4fwVc/
 un1oMDfLrm4kXmwY6VqQbU8u2jw70oUrJJcreiiHOIvFbMUVAVG/RPab2I3bCZLOzDIj
 e+X7EG8mECxua/Xylr09QRdJrZ8+cmLSf60qLi3LyVDRuIXdkxRGmli1elVGv1PhE4/S
 RJ06kDN1jdUU9G2r27uSUblMFphME7fUwKEozWcM40D3JHHdhKSyj77Y8vdaY+HrVSme
 RBUAkUTzgAnPsWDhYEMt+YGacigFPQRAINCp+/KfPyWHtxm+msWdKjWYHYzx9mx9EuG8 1A== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
        by mx0b-0014ca01.pphosted.com with ESMTP id 3586p4chet-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Dec 2020 21:10:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMyr8ysB71nZvPyomPwF1hpk2h26yWyADUTAa9A5Mly0DcthMZERiRH77uZbd1tEKDWNCApBrQZeNnLTsYT1+l4Bxm27RNztIGF2mVK6y3Z/aA3GdXzOy2Pa8+FnTIb5IXS6dVX3GHMVh9OutrLgdKSDu+MR7ZJtnotBYL476bn0W3jB50PK/jBJB1ygUPjINoyKJp6gqnZtaHKc9M7ofrkPwAeT7e88fYN3sowjZd6PEffoCXLvL6ht8sUj4J0ylnDxh6zCPcYSVsdQMtTBQyAuAtRDyzB0xl8Jcy+ee+MhzFSh5JEJiPm4hp/CZiVGCkkr0RfvzLHkU8OoUh9tEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2UdM/cWAGK4yfY0pJ+2+qtl+fWm+fXxOTKgDIiTaH0=;
 b=CEkEolCETfHAjD54rVllSGAd9QjHlWkMLUKeMJli2Sz8gH4Popqt2i1m78l5CPlVo16VNBrQAEHt79Lmu1k3NrHa+D6mUovtLpFTlIjGWpu1K1+xf+WrVWU45TIGnKCUyFNsKsrpLgi92/4HLW51+10S5gdnj4hUsXmz4RCsyD10ToMo1ftqshP2iNk38D/0vzSDBQah5u2lvLjcy1+bXIZ/aq/JmKAV+PkwzBCupOvTiHbo4dZT8HHUte1b62rWgYNKkiMwj2rsw0nRHhPLante6y7A8m8nMTNR1RuEyMyREmFLDLxQQPj2s/89XWbfdXMHx/DJyeCFFoiUOXPs8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.148) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2UdM/cWAGK4yfY0pJ+2+qtl+fWm+fXxOTKgDIiTaH0=;
 b=Roa1CKCZsEKj7oP8fTTtF+1uBAmVGLl/0H5AZzCiTETO24kVrJQzE5anlPkOxOWNU3a01KT2eQAueAgmjyKcwHaNuvVFwr0SZmvkMOp25xb0WsBBpQLqT02JnvdHYfJ6QyUGIAAQrTMy3Z2eYnv1mNNH0qlY1BglsFcsW9rOoac=
Received: from MW4PR04CA0401.namprd04.prod.outlook.com (2603:10b6:303:80::16)
 by BYAPR07MB7989.namprd07.prod.outlook.com (2603:10b6:a03:109::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.21; Fri, 11 Dec
 2020 05:10:15 +0000
Received: from MW2NAM12FT005.eop-nam12.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::f8) by MW4PR04CA0401.outlook.office365.com
 (2603:10b6:303:80::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Fri, 11 Dec 2020 05:10:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 158.140.1.148)
 smtp.mailfrom=cadence.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none
 header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.148 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.148; helo=sjmaillnx2.cadence.com;
Received: from sjmaillnx2.cadence.com (158.140.1.148) by
 MW2NAM12FT005.mail.protection.outlook.com (10.13.180.72) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.10 via Frontend Transport; Fri, 11 Dec 2020 05:10:15 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id 0BB5ADao016098
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Thu, 10 Dec 2020 21:10:14 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Fri, 11 Dec 2020 06:10:12 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Fri, 11 Dec 2020 06:10:12 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
        by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 0BB5AC2u014725;
        Fri, 11 Dec 2020 06:10:12 +0100
Received: (from pawell@localhost)
        by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 0BB5ABYo014719;
        Fri, 11 Dec 2020 06:10:11 +0100
From:   Pawel Laszczak <pawell@cadence.com>
To:     <peter.chen@nxp.com>
CC:     <linux-usb@vger.kernel.org>, <gregkh@linuxfoundation.org>,
        <kurahul@cadence.com>, <rogerq@ti.com>, <a-govindraju@ti.com>,
        Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH] usb: cdns3: Removes xhci_cdns3_suspend_quirk from host-export.h
Date:   Fri, 11 Dec 2020 06:09:54 +0100
Message-ID: <20201211050954.14616-1-pawell@cadence.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5d2f6dc-500c-4c0c-75b5-08d89d930ba0
X-MS-TrafficTypeDiagnostic: BYAPR07MB7989:
X-Microsoft-Antispam-PRVS: <BYAPR07MB7989F87F407ACB712F6BA7CBDDCA0@BYAPR07MB7989.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XS6x0W9dfgBY9aotUdNpA1rciBqDxIjXGTshywYxz1eAWucHtdCrVzs65z/nHwPleUSx/iisjPyCs0IWDFBggwdfd7bZV4RI8AqEGmI78q2xEwzjdBBlZ7ounvjJauGMsAjONuxC3zurjPJ3HUJAWuTAGPG5Itk02nT8bXOm1zK3G3mF62gTXrFcFU3GOXynaTgUoBC+nTpZeZ+/0e6+8sQEMSllrY88edJYX3EexhkQa3bUW1dlDjHyabRdEjXwRIqKk6U7urCL567er2KV3PGnRcyYmSChfGfb6T0E3UrhvIkFJOCsBzD1c9236csTphLdlnu94NjZkjMXOcTNDafp1mkKQkMabeuUh2EREftxDUnW3FKT/aqFIk0l8oTcE4g8m7W9iIvcyG0tULJwYWlYnM2F5Or8lA+4X5i13XJOSocA8r7yTSMEeYxOdaEVu8sSE7uSwxt6PeuvIXwsUg==
X-Forefront-Antispam-Report: CIP:158.140.1.148;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:sjmaillnx2.cadence.com;PTR:unknown.Cadence.COM;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(36092001)(46966005)(70206006)(54906003)(34020700004)(107886003)(2906002)(508600001)(1076003)(36756003)(4326008)(426003)(5660300002)(2616005)(26005)(186003)(83380400001)(8936002)(82310400003)(86362001)(7636003)(6916009)(6666004)(47076004)(356005)(36906005)(70586007)(42186006)(8676002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 05:10:15.3204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d2f6dc-500c-4c0c-75b5-08d89d930ba0
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[158.140.1.148];Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM12FT005.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB7989
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-11_01:2020-12-09,2020-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 mlxscore=0
 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=1
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=891 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012110029
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Function xhci_cdns3_suspend_quirk is used only in host.c file.
We can make it as static and removes it from host-export.h.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
 drivers/usb/cdns3/host-export.h | 7 -------
 drivers/usb/cdns3/host.c        | 4 +++-
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/cdns3/host-export.h b/drivers/usb/cdns3/host-export.h
index fb8541b8adbc..cf92173ecf00 100644
--- a/drivers/usb/cdns3/host-export.h
+++ b/drivers/usb/cdns3/host-export.h
@@ -9,12 +9,9 @@
 #ifndef __LINUX_CDNS3_HOST_EXPORT
 #define __LINUX_CDNS3_HOST_EXPORT
 
-struct usb_hcd;
-
 #if IS_ENABLED(CONFIG_USB_CDNS_HOST)
 
 int cdns_host_init(struct cdns *cdns);
-int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd);
 
 #else
 
@@ -24,10 +21,6 @@ static inline int cdns_host_init(struct cdns *cdns)
 }
 
 static inline void cdns_host_exit(struct cdns *cdns) { }
-static inline int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)
-{
-	return 0;
-}
 
 #endif /* USB_CDNS_HOST */
 
diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index 3ff19182b0c0..84dadfa726aa 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -23,6 +23,8 @@
 #define CFG_RXDET_P3_EN		BIT(15)
 #define LPM_2_STB_SWITCH_EN	BIT(25)
 
+static int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd);
+
 static const struct xhci_plat_priv xhci_plat_cdns3_xhci = {
 	.quirks = XHCI_SKIP_PHY_INIT | XHCI_AVOID_BEI,
 	.suspend_quirk = xhci_cdns3_suspend_quirk,
@@ -87,7 +89,7 @@ static int __cdns_host_init(struct cdns *cdns)
 	return ret;
 }
 
-int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)
+static int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)
 {
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 	u32 value;
-- 
2.17.1

