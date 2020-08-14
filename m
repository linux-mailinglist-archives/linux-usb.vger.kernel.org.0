Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCCA724448C
	for <lists+linux-usb@lfdr.de>; Fri, 14 Aug 2020 07:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgHNF2q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Aug 2020 01:28:46 -0400
Received: from mail-eopbgr70054.outbound.protection.outlook.com ([40.107.7.54]:62158
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726570AbgHNF2n (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Aug 2020 01:28:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGY/xV9XghMlmuGfHIk+3K4GZyps+kKR68ZDN7GZhdZyFdkPT96ezpULBQj7uoYcDCdAbpzSBfJY1cG+REENGZm+4WgVdZL+Co7Q3FkZYmAz/AtBPmLe6CWPW0G+lKtquBSnTWIVpfC3N4TdCeBhg5uIv3AXUTN0f+EAhZh417YHzi6W20kcK7CeRSwr3wuDFVO5fizSmSRZwdj2oULDjHhWlSJXNf1ebT3n2qyfyTrmAQG5dMyuU1p+I2vRvnj5tj/6tAJEzDlIWFR27DUFQTFBXSNxyHcIykchk12a3xD2QjoyIOmSBKxl+ia0HYD4pQVsOaxs7xhwCq1MywgafA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSabgFmYWfy912yNWOS/brytqu/u/afGBCf2KmieQWg=;
 b=a3RByTE9mZXVUrRhY7yugYgREI0/lJeAFAnOKNZ2ehtjc6uxWoty5zDJbB9L5Rty52QbcMDWUGDJHn9qb+IncmOJR0mNDG9Fb/SatGjwuWLroXI4vpK3z8UR5H/I78lxEqKvmj+hwRn5ljyyjziASi6qt8UAPS053HzmVLju91ApsL13Y6hkjX34Z+YpzZeb+2YNtJH4medWbxPS6BWvkft9z568tMa0mcUxRcX/l7NPQjxB0yvEq6YdEjNMDqzl6NemAdIHfyLpfWZ/HuavschbBG7fub4etyLl5rCw4Nvvg27Fr3a+3BHKUR7u2RokIPEKKrNl1XGiVKWfRGSNpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSabgFmYWfy912yNWOS/brytqu/u/afGBCf2KmieQWg=;
 b=Pezc1K74vKNsj8xTeYmc4xMFP1uTARjESD3QWMJOYeLxZZcorJUcvBltnenESbMgThjui7LJJDXwpriHoJTaQ5TgpGHqD0Zico2/T2B8twtyVhEbEO3mxW9875XSPoB9g3qT3cGepXRiJww3NFolN0zdtuuzK/XmQBD4VUhgXr8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB3PR0402MB3641.eurprd04.prod.outlook.com (2603:10a6:8:b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Fri, 14 Aug
 2020 05:28:24 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2%9]) with mapi id 15.20.3261.025; Fri, 14 Aug 2020
 05:28:24 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Peter Chen <peter.chen@nxp.com>
Subject: [RESEND PATCH v3 6/6] Revert "usb: udc: allow adding and removing the same gadget device"
Date:   Fri, 14 Aug 2020 13:27:02 +0800
Message-Id: <20200814052702.22789-7-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200814052702.22789-1-peter.chen@nxp.com>
References: <20200814052702.22789-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0153.apcprd06.prod.outlook.com
 (2603:1096:1:1f::31) To DB8PR04MB7162.eurprd04.prod.outlook.com
 (2603:10a6:10:12c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0153.apcprd06.prod.outlook.com (2603:1096:1:1f::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Fri, 14 Aug 2020 05:28:21 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cee4db7f-2161-402d-3993-08d84012dd3c
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3641:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB3641D7742B55F22FFE9600188B400@DB3PR0402MB3641.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:196;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DzWSkqAXkxibLats6dwMvyuG7d9Yit0EwEV3iUZk4aZfltZRjq2CKNWiY3LmH86IfP0Fv89r69j74TQ63CFtpy5OtBPM6d+5FhN0u/+hJNZTp3A+XFsynQ328FJfIGcZLhu7igpgfI7DIUrSZ7j5uvAtQATXH5HdFiQX6Res6bDozDEJCBgfusB4q8zvj5j4Xfe5deqQIFWQzuY21rQCw2Xd4gR6n7dpu6g/hvPSIWHl+/Puvb8soenrYRWdIy6VfKvNNEzL5p0nBu53OM0WJBwqPyXVcisx5Rl3UJ16BeDE6ga1gy0Tvkz6B5okSSVo/tKo2xPNwg8kE08ZFVJjow==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(6486002)(4744005)(36756003)(86362001)(6506007)(6916009)(8936002)(2616005)(2906002)(4326008)(316002)(6512007)(8676002)(956004)(6666004)(83380400001)(16526019)(186003)(66476007)(44832011)(5660300002)(66946007)(52116002)(66556008)(478600001)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 0r3m+hNwP8Z4lE0mteZMkEpaxYmxEAzmodTF3e1JeIAj9NzMUQwlicft+rWiXIgMF3d9UBi1dazW2iE2BuezOEtTwborhL5V4Rmc4EngO0SH+RLnJxZ9/W7XWwd+vuiF2KNrofz8nrIAzTWRqCJc97wf1XdwRTbp2BpSzXjQ1I+eZ+B6XYon+fx9h2cLFtoc328TX2zpxKWAteyomKELmxvSv28e6OwlolejvWbuC2W/YWuHNN+pDYmJR9N86lQK6077bU7CoLiO7oCJJrWUtVF4DtZyGDtmdlvZDlxcNvI2Khjno7jWrWJ/R3AjLNKeBH9Fmc4LOXbDQS4rdF0TpXOmbjzcobH5KIKpnS/bt995C2+WtKD/VJOdbKdygPtJB4r9oYqC+S0FASEwSLEG9oTXyhGWPqewi0ZgnCWDJaUhz3jiKnZPEBE2F8apNrkYbnL6llWI9SWckXCWo4sWUhx1lTIBC08dG9+TxP2fCxsgxm25LxGyxtG5uTxn2rSB4WDFgvuc+aTCgW1931vWSCatBQkhbFNeooMNvGCvXTuuaCQsWoU1bFbToL/ndCRRfxyGbmn2VJQyqZu2wSHp2PA8/U3zfEVLqPo7Olo0I2t5l8DEZACqx/PgXOhKwUV0nxKQ1ml/2EZal6jIIrH+2w==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cee4db7f-2161-402d-3993-08d84012dd3c
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2020 05:28:24.1551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SjWQ2iw+jH8ocrDIc7z/+iZYYnMWTzY8XZv0hEDAANxM3wKBCsplQUSq9qre4KWY6vOtLNPVOUGspY2nYG991g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3641
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We have already allocated gadget structure dynamically at UDC (dwc3)
driver, so commit fac323471df6 ("usb: udc: allow adding and removing
the same gadget device")could be reverted.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/gadget/udc/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 2b6770d9fb3f..bf1b0efcfaac 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1389,7 +1389,6 @@ void usb_del_gadget_udc(struct usb_gadget *gadget)
 {
 	usb_del_gadget(gadget);
 	usb_put_gadget(gadget);
-	memset(&gadget->dev, 0x00, sizeof(gadget->dev));
 }
 EXPORT_SYMBOL_GPL(usb_del_gadget_udc);
 
-- 
2.17.1

