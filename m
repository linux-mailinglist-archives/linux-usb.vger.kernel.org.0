Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDAD2D61B0
	for <lists+linux-usb@lfdr.de>; Thu, 10 Dec 2020 17:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731837AbgLJQZB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Dec 2020 11:25:01 -0500
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:37678 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388615AbgLJQYn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Dec 2020 11:24:43 -0500
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BAGHVXP017768;
        Thu, 10 Dec 2020 08:23:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=EN8PrzzqRBSsZSDhjX6f3+c+48quQxIfKKBfROjrUJg=;
 b=QKQhkdmaXwecupKYEYWHgWOLrc8ryINsDCvW6FmtKJpml4VuDrQcQ0zc/v3xkDNzvQo5
 G8DrBk1uGE4DuW9IJPzjK0QS++1st/id4zprA8/w2NtfS/L7khj9Y88OZHO6By8C2d8a
 dJg1mlA0funKlsXk0q2/HMtsrjMSQRMG12atnuT35DGStlkDB1HYcKID4+PcVx/D7zmx
 VZf/dUW88ZDSvqxfDIcIuFi40SjWEAtP/LMUDdRIuCyjFLpvsbDvGTuABetXBH1E+jfM
 VUHHyCRXwCxaA4wbOnZw6Y3QD/oPkD3z8x38U7DlT6SR2fVbWpcNbRuMb+i0VvROxv4+ Ag== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
        by mx0a-0014ca01.pphosted.com with ESMTP id 3587n31yy2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Dec 2020 08:23:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRcKv/n6YQaFqEz+gxVrA/9D+hnFzgdf2b9EKvCWhreBLJq4T5S+Y49tPdOZnjvqAPZP8X0SO6rDwwP4qV+rc8sXgdGViRt80pxzMiPvpbdZ9n9gtgKP0WEg0uG1yARdxm9Iz4PHrA9h7Wgu2jkEmBPpUxzQqX2T5RrQRAeprVMxB9nggUctUqDmPEcRsFv2Pd2pHm8w0j8TOdJUCMANmCt02j0iW8k6F/KJr6QV6RW/XcMzHk2boSPZ45GylpuR9YZy46SdlFBp82JRNpyP2OenJfzxsWmVAES0vqLsXC5IDhk4T0wtEhuraEnDCSWJ1I1a90M0e/38BCYmuMdvVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EN8PrzzqRBSsZSDhjX6f3+c+48quQxIfKKBfROjrUJg=;
 b=bgeSw+eaUVpGgDFT4gDivVYo4RN5NeiIaEwwbVqBTivtFS+eX3ENh8GnT98rWQKYyHjkBBDLM5ZPZSFCSBFc+Fi6PabqYgyHP56vopSaFHJ/H439SvnC3zWavlXtpjFbwbcggJWV0c5G7A5QfCMVvxjkQ520xGqti3/RirIYAnGS6mvoEvbiVa6soFPMBtiF7TuxiV0vSJkBMRHFGtI1GYM3uD3kXqO8a22Eff1SiCYJPZ6zB+jVrTFoSDGaJNP9ljnP0VicKUGjksXp0otNJblbRfm0y+2wktnnoEdeJyXMk8XZQynTfMxc0a16L63Cf6/uIcLB0cWnClLX4uSGNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.147) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EN8PrzzqRBSsZSDhjX6f3+c+48quQxIfKKBfROjrUJg=;
 b=kK5uhzLBTDy27MeVQPcqANszmte9n1wBPB5LwAb/Iv32b8brhd7FwmtqV1ohtiqPjT/P/riMHgGnOLFfT7qE6Sq4maNyT8rLuNF+929WbmpQEnrmTyftyzHCOI9BJl7kfYvWIDqJRAFrTwhUevPvwUZeRYYPLpPomROjv7ifD+c=
Received: from DM6PR06CA0002.namprd06.prod.outlook.com (2603:10b6:5:120::15)
 by CY4PR07MB3592.namprd07.prod.outlook.com (2603:10b6:910:76::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.22; Thu, 10 Dec
 2020 16:23:21 +0000
Received: from DM6NAM12FT021.eop-nam12.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::c5) by DM6PR06CA0002.outlook.office365.com
 (2603:10b6:5:120::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 10 Dec 2020 16:23:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 158.140.1.147)
 smtp.mailfrom=cadence.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none
 header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.147 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.147; helo=sjmaillnx1.cadence.com;
Received: from sjmaillnx1.cadence.com (158.140.1.147) by
 DM6NAM12FT021.mail.protection.outlook.com (10.13.179.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.10 via Frontend Transport; Thu, 10 Dec 2020 16:23:21 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id 0BAGNIgg031608
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Thu, 10 Dec 2020 08:23:19 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 10 Dec 2020 17:23:17 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 10 Dec 2020 17:23:17 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
        by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 0BAGNHoa010400;
        Thu, 10 Dec 2020 17:23:17 +0100
Received: (from pawell@localhost)
        by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 0BAGNFeF010393;
        Thu, 10 Dec 2020 17:23:15 +0100
From:   Pawel Laszczak <pawell@cadence.com>
To:     <peter.chen@nxp.com>
CC:     <linux-usb@vger.kernel.org>, <gregkh@linuxfoundation.org>,
        <dan.carpenter@oracle.com>, <kurahul@cadence.com>,
        <rdunlap@infradead.org>, Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH] usb: cdnsp: Fix for undefined reference to `usb_hcd_is_primary_hcd'
Date:   Thu, 10 Dec 2020 17:22:58 +0100
Message-ID: <20201210162258.10289-1-pawell@cadence.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d198f8f-10b1-4f24-1fdc-08d89d27e909
X-MS-TrafficTypeDiagnostic: CY4PR07MB3592:
X-Microsoft-Antispam-PRVS: <CY4PR07MB35922BBFD9C770E5D7CD175FDDCB0@CY4PR07MB3592.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gbPNdxYTdd93lLUQGqMbfC15f+qsPtZCeEwooI2FoEQGYr3PF185fwWdYFcUF3obrpPIi+QdvjOrXKlIeweBO8tj9Aq2qyPXKo8Q2eEjv5Ed4u97dFM/HpoUnDbX9vHHFJm2Mi6+VVecqv/l2mdrEE4rSZA9u62MDFMt4SLDo43ZYlCw5njIBDbk7wrZFiinEcip1bTA3lESAVzSXLDnaZTVXjE9B1HRibXPh5eRCBaozNBOG+BozappCnJfWy5HGZT+FuVv8LG0/DaTi0xP9bYzGMR/w/M1GPIqifGfaLeEptxz7qGXW6XgjZSiFOtLdWmru+8yCTqbf58dw2nX5rDtwYx7XOHA4M4yRt5l6kseFtCRDooJasahHVChOVGeI1r8Z8T6qr1mtzwyT16+0jUfGsHrFyRN58Hy7+U7FrxI2Rh5APbqJv4tH4HUjDlphIjrBhpR3t9lSSEoZUsR0NA5hW6qgnsHHLWcUNlAST0=
X-Forefront-Antispam-Report: CIP:158.140.1.147;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:sjmaillnx1.cadence.com;PTR:unknown.Cadence.COM;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(36092001)(46966005)(2906002)(6666004)(8936002)(83380400001)(26005)(34020700004)(42186006)(6916009)(4326008)(47076004)(2616005)(508600001)(426003)(5660300002)(1076003)(336012)(54906003)(70206006)(186003)(8676002)(86362001)(70586007)(356005)(107886003)(7636003)(82310400003)(36756003)(36906005)(81973001);DIR:OUT;SFP:1101;
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 16:23:21.0850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d198f8f-10b1-4f24-1fdc-08d89d27e909
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[158.140.1.147];Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT021.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR07MB3592
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-10_06:2020-12-09,2020-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 mlxscore=0
 clxscore=1015 phishscore=0 mlxlogscore=692 priorityscore=1501
 suspectscore=1 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012100104
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Patch fixes the following compilation error:

ld: drivers/usb/cdns3/host.o: in function `xhci_cdns3_suspend_quirk':
host.c:(.text+0x9): undefined reference to `usb_hcd_is_primary_hcd'

This reference to 'usb_hdc_is_primary_hcd' is from hcd_to_xhci(),
which is being built as a loadable module:

int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)
{
        struct xhci_hcd *xhci = hcd_to_xhci(hcd);

Issue occurrd for following kernel configuration:
CONFIG_USB_GADGET=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=m

CONFIG_USB_CDNS_SUPPORT=y
CONFIG_USB_CDNS_HOST=y
CONFIG_USB_CDNS3=m
CONFIG_USB_CDNS3_GADGET=y
CONFIG_USB_CDNS3_HOST=y

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
---
 drivers/usb/cdns3/Makefile | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
index 01a9a9620044..3f9b7fa8a594 100644
--- a/drivers/usb/cdns3/Makefile
+++ b/drivers/usb/cdns3/Makefile
@@ -6,8 +6,13 @@ CFLAGS_cdnsp-trace.o				:= -I$(src)
 cdns-usb-common-y				:= core.o drd.o
 cdns3-y						:= cdns3-plat.o
 
-obj-$(CONFIG_USB_CDNS3)				+= cdns3.o
+ifeq ($(CONFIG_USB),m)
+obj-m						+= cdns-usb-common.o
+obj-m						+= cdns3.o
+else
 obj-$(CONFIG_USB_CDNS_SUPPORT)			+= cdns-usb-common.o
+obj-$(CONFIG_USB_CDNS3)				+= cdns3.o
+endif
 
 cdns-usb-common-$(CONFIG_USB_CDNS_HOST) 	+= host.o
 cdns3-$(CONFIG_USB_CDNS3_GADGET)		+= cdns3-gadget.o cdns3-ep0.o
-- 
2.17.1

