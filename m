Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFA29230A8F
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jul 2020 14:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729826AbgG1MrB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jul 2020 08:47:01 -0400
Received: from mail-eopbgr10073.outbound.protection.outlook.com ([40.107.1.73]:15172
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729806AbgG1MrB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Jul 2020 08:47:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVDRTdyxCkRSZUuoc+EzlzQxJ4zf4EDwqM9Mdc8RhWRYrp664Z1SdwYezUbdYiPA3U2Q8imClw5ANNR0EG4RS4XZZfp9VB3/IEsfZbj74BZMdVz7KOkq1bJ1160btlHwSE4UW4hKgh40mdznh4CzkXAfpSzDaiovk+EDpz9Uyq5PjE20GQvsroKNWQ9nxqGmqF5QV+jqb4gKYznjfoWjjXC+fefDoXKhFjdUtNLhVwVLPOF1anoCOPOyeBZUvo6Z2TXI32SlBdgCum7fH++bIP/VvL8va/4tSHhYA63+ZEzEs0Pfkj7HvSNgLm4XlCoNZ6KksrNbGDjlOXfLaT8kwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+Jyc0ZibbywfBE3UHE/M1Ilp+s96M8eNh3xWhrM284=;
 b=VM1dB3sYlvpyOOrKViR2c74n06S2byJYskBSx3S3Y/iQHARPpM8GulyRjXHLyHLUGcsAxBCNsodN0tqF9X5twPpAQ/R9VQbO043iNaeEMex91HU3tOLErHVlROEf35kMb2IXvfs7om2rJbkBk5f+Bnt/C50aOcxVzKbuuo3h+2AttpofmCT0Mz92xxuRIzuOYZllcnxK5YXktv8vLwiXsPmi2MP4g9AV/U7a/Qs8wnKr8Yzu5PBdujVq5fbNU52hxQ5/thvGavXBWmoggJeqoOCQLAMDtr6/knr6A4UhazZZZ/tQHQMTOq7Ro1qGeiU3a9WKwfZezedfwyV/MLv8yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+Jyc0ZibbywfBE3UHE/M1Ilp+s96M8eNh3xWhrM284=;
 b=glGCVjGmEUGg2QHHquRZsp7HneF1ZqMPuEy+NlTkuO/fZQJcP0RTXcxwRPRz9OZjDm/arSd/Jli+8sPN0PDaVEqBxcnpPZzQkt09Z+C6D+uqmlZ5ZIlwzy2nbCV4sc3lJHIVgs9HdB/l8b9pPNFX9pvMy7N2YI8lvbS3Y0FwkGY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0402MB2910.eurprd04.prod.outlook.com (2603:10a6:800:b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Tue, 28 Jul
 2020 12:46:56 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e%7]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 12:46:56 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH 2/2] usb: dwc3: core: add phy cleanup for probe error handling
Date:   Tue, 28 Jul 2020 20:42:41 +0800
Message-Id: <1595940161-3700-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595940161-3700-1-git-send-email-jun.li@nxp.com>
References: <1595940161-3700-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:3:18::19) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.67) by SG2PR02CA0031.apcprd02.prod.outlook.com (2603:1096:3:18::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3216.21 via Frontend Transport; Tue, 28 Jul 2020 12:46:54 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5cd175ea-ac1a-4c66-2091-08d832f44f51
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2910:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB2910987EB044A47D6A94C31E89730@VI1PR0402MB2910.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tNpOWrLGjtZXjmr84eRpMWzalzHT8rgB7QItHRjcCw/vNSa9Fd2BZHEUu5JND9+xVjbeK8mXth/Y0igKIeFrrPgOYMIv2ygI4c66N1pgJWP4lrjr1yY7B+I9VYFsv8WZQBOnU3PCLWN5ncWsAp81Tm8uwfrMT4r9sddX3hMNWxJpo5qreo0+WhB5rOADC8P8DOlI0cQoO7TWW4bB7Z4jpfbo4bhCLZr8UNfxYDhRGtIXoGsx7j8BWhazQSyVmQmZ3NwjqAgRgc/T1wRSE6B5LWaedPl5ea+cEp4RhkjS2jlwPgnPduxFCvbIeRvOY3qNWVV4RN0QMzdLnuGlCaTEn262vsqZheF4yPa/23AUi7RdwpVIHPt+CmJ947yKMfh1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(26005)(83380400001)(956004)(5660300002)(2616005)(16526019)(186003)(36756003)(6506007)(66946007)(4326008)(66476007)(52116002)(66556008)(4744005)(2906002)(86362001)(6916009)(8676002)(69590400007)(8936002)(478600001)(6486002)(6666004)(316002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 6vklZDHJzdkHPW643naKBRLSMZiMEA7uXoUyU+XfJrDuRw4JpDYHcS1JIZCRBA7j8WAseo+YuTyHT4SFGCVYQIhkNn51FimJqEGMQjGavLxQm86bccfJfMJBDH/zc5UeeJeg9zVb7ArzkFE+4mKHbji8eAYB5oXXko1j6pFDEyFd4l4khMkzozhg+8790VCwaeh9MoSrvvXzS7lbN8n3o6wMTn9FPmuMqAwp5p3jh5jRZHOJ5rT81UkNgyjXiaXOmM7V3Uxm7uvNFFVndLWYHNq6iNigbh9ThxNhS54gF1j4HTdCjcgL+pagMpIioAkiH3+fdSocPxgSObxXucW/wtUbcWc40EIkvaeWH+fe5BohAWNZrGBkaoOVkdT/oM/nbtCdYyyyPnL7LCglJl0DzD8fZN3tP9KoLobBf3/udb1z1VWKetL80jm+3/sDuFGLyJSjAjqnUipXNFf0J8Uteris+//RSgLTNIpjie6u82o=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd175ea-ac1a-4c66-2091-08d832f44f51
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 12:46:55.9899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vu3h5OdAalyf5/49bJo+byYjy1XqCcftbHHuk5ycPvCJtt0ipdFJdKB9LOsZy5CH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2910
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the phy cleanup if dwc3 mode init fail, which is the missing part of
de-init for dwc3 core init.

Fixes: c499ff71ff2a ("usb: dwc3: core: re-factor init and exit paths")
Cc: <stable@vger.kernel.org>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/dwc3/core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 0444018..3d11a9f 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1555,6 +1555,17 @@ static int dwc3_probe(struct platform_device *pdev)
 
 err5:
 	dwc3_event_buffers_cleanup(dwc);
+
+	usb_phy_shutdown(dwc->usb2_phy);
+	usb_phy_shutdown(dwc->usb3_phy);
+	phy_exit(dwc->usb2_generic_phy);
+	phy_exit(dwc->usb3_generic_phy);
+
+	usb_phy_set_suspend(dwc->usb2_phy, 1);
+	usb_phy_set_suspend(dwc->usb3_phy, 1);
+	phy_power_off(dwc->usb2_generic_phy);
+	phy_power_off(dwc->usb3_generic_phy);
+
 	dwc3_ulpi_exit(dwc);
 
 err4:
-- 
2.7.4

