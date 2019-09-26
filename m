Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31CBBBECF8
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 09:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbfIZH7I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Sep 2019 03:59:08 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:30896 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727578AbfIZH7H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Sep 2019 03:59:07 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x8Q7x1Ju024441;
        Thu, 26 Sep 2019 00:59:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=YicJJG6C0kCZ6dJeVmeweQ7SesCItVE+nvaW9gXhYAo=;
 b=ia/X34KCuVnavV4Jsk+EKUuICF9rC0IJimFR45VIp+dJbwEdAz63Lq6YKcZG/G08fS14
 Gs+uSHOsmHVfGxZyHqDkRN++SDc3ibvjFg8mZKP7Awt6HfhyqdbZcjdrgW+MXZbj2lFa
 OmNUxhnmoQe6p/xHsob1Ut54lOoqkSu750kBkgn+VBeahDW/xk8LfviGcDm2ROy4v8I1
 myxseiNm+iqm0NCNJ0SFTmvvyU0txZXUQKmMo+kMG7B0XqEWshHwtLaGJpC/1AgM5xUC
 UE34I1Q2sVo6VUh5tEv8Ayj3yiOl3sOnmPVAc5Cgz5ST1U3bb2/v64MfRQDWqSOU9znY cw== 
Received: from nam04-sn1-obe.outbound.protection.outlook.com (mail-sn1nam04lp2050.outbound.protection.outlook.com [104.47.44.50])
        by mx0b-0014ca01.pphosted.com with ESMTP id 2v5fewv4ys-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Thu, 26 Sep 2019 00:59:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/TUQXYKUsSzxTlxkmJYjkxL8x4Q+2SN6LhycQIIdaXXRddBztShlTRcS91JXQgpfzcU3jKKuCpK7mTwm/T2FvlE5d+Y2BsQqsaTtUpmCKoXGNKz3GJ0uprolHCMLlk17+hy2LYkbnbz6KHl3vDyGbhlpZjJaOBD79AOlmoY/+MlL5pUWhbknCuwzk307+lZX3hRXmnAmQs+7fZyD2c5MfbXepNr/9AzTH7NH8XZOz2VouH5abJ5QofVIor4oVJuQHMgBQ6oDwl5oy9W9Xj60L7yHjjhwDI5Y7WR+e+ZerEWtwDjwmv/xICSp5wHKuCE4UPHIg3u4d8VT8nxYzDZGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YicJJG6C0kCZ6dJeVmeweQ7SesCItVE+nvaW9gXhYAo=;
 b=PVDjyky7/mpqXTAGJIHckUf1qhxR7sSgXGwhWSlVcL5j5ihbobrLk1sQnclnuwKbx4pwsYVlKFkLbbBxZrXq9/XhAOk76Z4VideV9MNpmus1hY+kzk05w8zcjBdz5dYV61XF+z1lZCl9d2eHKa/6GvXdgs+Qjtjzf7rMsRCxJN00SS1ICSqMsoppx8x6bb2FW4poUv0k+2PXmvCCJ3m2Pwy8z0CAFSPkOX/iDA4eHdqQWzhxCI4kSQTDZFwV+DJztNm2oJ63BqEyZaExYyDpM5KbgWbzfozLklkTa3ZsiljRGXSlEtQizuSgZKdgV0h7hkBAiRfwNqjBA90CkbGabg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 199.43.4.28) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YicJJG6C0kCZ6dJeVmeweQ7SesCItVE+nvaW9gXhYAo=;
 b=Ic9s6ZU+XYWud/PLS7app0/jJOn0vcyYT1GfgTcdcpaVyY2rP86oGxZhfJnOSLNpA55hvePB0gtDQ4Mz12gHs8VeEfIJV5Gi/aqDxiHP7VsN2LIwM5kn1wywr1kLAM7f1/sVZwLZulUDPMCO31k6vJDdJLBPJwIpykrJs3I81/o=
Received: from SN4PR0701CA0002.namprd07.prod.outlook.com
 (2603:10b6:803:28::12) by SN6PR07MB5600.namprd07.prod.outlook.com
 (2603:10b6:805:f0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20; Thu, 26 Sep
 2019 07:58:59 +0000
Received: from CO1NAM05FT006.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::206) by SN4PR0701CA0002.outlook.office365.com
 (2603:10b6:803:28::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Thu, 26 Sep 2019 07:58:59 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 CO1NAM05FT006.mail.protection.outlook.com (10.152.96.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.7 via Frontend Transport; Thu, 26 Sep 2019 07:58:59 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x8Q7ws9V019648
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Thu, 26 Sep 2019 03:58:56 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 26 Sep 2019 09:58:54 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:58:53 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
        by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x8Q7wrju004765;
        Thu, 26 Sep 2019 08:58:53 +0100
Received: (from pawell@localhost)
        by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x8Q7wruS004761;
        Thu, 26 Sep 2019 08:58:53 +0100
From:   Pawel Laszczak <pawell@cadence.com>
To:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <felipe.balbi@linux.intel.com>
CC:     <dan.carpenter@oracle.com>, Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH v3 -next] usb: cdns3: Fix sheduling with locks held.
Date:   Thu, 26 Sep 2019 08:58:41 +0100
Message-ID: <1569484721-4424-1-git-send-email-pawell@cadence.com>
X-Mailer: git-send-email 1.7.11.2
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28;IPV:CAL;SCL:-1;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(376002)(36092001)(199004)(189003)(47776003)(8936002)(48376002)(2201001)(110136005)(81156014)(42186006)(2906002)(86362001)(14444005)(54906003)(76130400001)(81166006)(336012)(426003)(16586007)(70586007)(107886003)(6666004)(87636003)(50466002)(26826003)(316002)(305945005)(4720700003)(486006)(186003)(476003)(2616005)(126002)(70206006)(8676002)(36756003)(478600001)(5660300002)(50226002)(4326008)(26005)(51416003)(356004);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR07MB5600;H:rmmaillnx1.cadence.com;FPR:;SPF:SoftFail;LANG:en;PTR:InfoDomainNonexistent;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cdfa051-1698-4850-d29c-08d74257634f
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328);SRVR:SN6PR07MB5600;
X-MS-TrafficTypeDiagnostic: SN6PR07MB5600:
X-Microsoft-Antispam-PRVS: <SN6PR07MB56003B0BE0C41B00172B21E3DD860@SN6PR07MB5600.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0172F0EF77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: HBgZuLK+8Maw3WgW6+LhicwVAEib0KlSzzGPU3mZXcPcjYCCDdJRqbswCppizTkCCI51a7JXP6kVMzEaNJA8jYmracVbFHBi2qA5miO1zRSSf1cfkTbOdQviZgEl5DT5+EZd1xX1hZaKgvzMkYbZVFQJRWTO2XKbWdETerz/GMi4pkISULwEWjNCYywVEn5n3/e9iTYpfm/WbZ4o95IMfIWGh+TKT6mgJi2xtQS/J5y0pKTwTPe0tfmNeZ5AMI5oDKqdJAweYRvmzeKNl/5aP4vxqEddBEKkkXjyc9eBHjSuDCfKxAZIjayoWcCEIU4n++hJThyx+94kNSllifJmb5vC9oD3qRoTeRp8fFMubXFVD+iyLRA5Dfov+Esla9X/4nuWw3/09vhTitAzE1/jcPJ3ih7UV+uHc2CKoHJqPbY=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2019 07:58:59.0406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cdfa051-1698-4850-d29c-08d74257634f
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[199.43.4.28];Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB5600
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-26_03:2019-09-25,2019-09-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0
 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=846 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-1908290000
 definitions=main-1909260078
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Patch fix issue in cdns3_ep0_feature_handle_device function.

The function usleep_range can't be used there because this function is
called with locks held and IRQs disabled in
cdns3_device_thread_irq_handler().

To resolve this issue patch replaces usleep_range with mdelay.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Pawel Laszczak <pawell@cadence.com>
Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
---
v2: added Reported-by and Fixes tags
v3: added version of the patch
---
 drivers/usb/cdns3/ep0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/ep0.c b/drivers/usb/cdns3/ep0.c
index 44f652e8b5a2..0445da0a5a0c 100644
--- a/drivers/usb/cdns3/ep0.c
+++ b/drivers/usb/cdns3/ep0.c
@@ -332,7 +332,7 @@ static int cdns3_ep0_feature_handle_device(struct cdns3_device *priv_dev,
 			 * for sending status stage.
 			 * This time should be less then 3ms.
 			 */
-			usleep_range(1000, 2000);
+			mdelay(1);
 			cdns3_set_register_bit(&priv_dev->regs->usb_cmd,
 					       USB_CMD_STMODE |
 					       USB_STS_TMODE_SEL(tmode - 1));
--
2.17.1

