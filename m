Return-Path: <linux-usb+bounces-55-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A447A0366
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 14:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41FF01F2342B
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 12:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A149121A11;
	Thu, 14 Sep 2023 12:07:28 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A7E208AC
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 12:07:28 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4BA1BD
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 05:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dru6/oVitri6Bic27ZzdgQsu9vkTSljOY93g0LxrCBZVRxkZ/pq96UJfEuwdPafllQsOr9cbxZ/3LdYNg0pv5dOGqDzvN55QkXrU9FhzgkqPBq4ueEnDY+rKnfGdfTWG0DU9L9KWQ+3YRVIy0yir7PYOfYJcLnmUHFTCjHjn1Gb8EyGJjUHUAuxS3nTlCZot+wuIuWBSgqI6utEBiCUjvpflvl1bHZC5Ej4CnUlFhmUVWU7L0vtjjeXHK8hAp/DLYHU0pdw6wQPUIOwjHAu2VhwWFvqHLWiykNO1TMCAelJKGfhI38aphGcyJNQTsDJmyzqf8kCaaGqaforQ5lLAEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hnbv8mmcvDGT990v4EVAhOLpCGHEHIRlQOeGIMZwteE=;
 b=h4mlmZiEkbZJ7KSDAqWUBHqCAj7guIQwFzxeUiz9rDSRs8okfEC4DcvsLiiYAOBfs6uXbEsPaJY9B1utEBdOu6gzTn3G4c1C7c+eJ2FJWV3DvGQIHtvVxTqyHvQhP7HiAt8SuX0ZvYdn/PpFRiSCsuAldvepy1XglhUXYLU70n5yF4ICqn6bikrxB8HBu3We2zptWCtOS90+I+xiC5+R1p2M0DlYyI1zGNATKPXO7ay2P4x0zxfe+CQclPjqOwRc1jtgbO5ZBaqxfFr/wyo1rpvUvpRKYRbzZNj5IMhdEnJcAZ4FyfXpkePqngW3zJS1yYrWWirM9JRvkE+uUs/tpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hnbv8mmcvDGT990v4EVAhOLpCGHEHIRlQOeGIMZwteE=;
 b=KHl5kXBqj50KwNxzz2qIWZBPT14SPUsDKjpWRlADi4Gwls3vD1OhGNREWJb6bQEyJ21yFssR9FgaHipBCGScSCypTLESwoCzvQyviLo3uyabiCu7zSJwxCMWd49wufWw2CJnUsODSjLaD6rz8NFxbFIz/J/IKqTSLstAF8jZK/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AM9PR04MB8486.eurprd04.prod.outlook.com (2603:10a6:20b:419::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 12:07:24 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923%7]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 12:07:24 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: linux@roeck-us.net,
	heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jun.li@nxp.com
Subject: [PATCH v2 2/2] usb: typec: tcpci: enable vSafe0v Detection and Auto Discharge Disconnect for PTN5110
Date: Thu, 14 Sep 2023 20:11:58 +0800
Message-Id: <20230914121158.2955900-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914121158.2955900-1-xu.yang_2@nxp.com>
References: <20230914121158.2955900-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0207.apcprd04.prod.outlook.com
 (2603:1096:4:187::9) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|AM9PR04MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: e6d97760-bce0-4b9b-3d65-08dbb51b282d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BF1WU4lVQkUKFpV5P4c27ixdpU+65uEVKJGu49FDiEoUf7Fa4RC4clgJMQUC1Rv4aiZ2kscOJ8u0/ppRrng4iXWpOfKhmQqOT6Zq1OXQMX1Hn1fOpeIErXLGyYmbH/o9DS++A5NHw50Jtwq8tQT/e43BBPM6gFB8GOrYOhDktcF3Y0Xc6XfgBLtbRz/j+GSJpDExdAc4neuyeu8y5tz/fplL6T1DnaIEaA/6gK/Xyisg5ayD2+A16lM/Pdtth6skwpB8pSdGSMoJP9PnrG39/NEEqFyL4Ret2hP29vTgm1GcENPjS+qM6WJhsiZmWIlYxRqFw3AWNP/j7Q6D4sSTO6H9l9YjakO+wHqSfqO0pb/amGCImY0P5BHM+1x3WkqNsJaA15dBRLFEj3DOXhemkWOjkpo6rz2KtropGh6mOVzSeOXBO4aefEV3+9e0lej4mDUBP16F614PeOgDx72UuRLdSa8L4CMlZJYrE79OLvZhc/cZug504NGLJ63dQzfwPl5ik6vW/62cT2yEBCz1OL5l7B8R2a6FBIDn8gzolV0B7zuDEoeJr1k4AjcwgoK0fVpdgY38W1iIO6jfovuksmPSQmGDYdBhP4dVls953QY+i0dCNCU6pqJJ18slgvHnndB7M/OpCW1D27O9tbV+/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(366004)(136003)(396003)(1800799009)(451199024)(186009)(36756003)(38350700002)(38100700002)(86362001)(6666004)(478600001)(1076003)(26005)(5660300002)(52116002)(66946007)(6486002)(6506007)(66476007)(316002)(66556008)(6512007)(41300700001)(4326008)(2616005)(8676002)(8936002)(2906002)(83380400001)(4744005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UcCHRZPUNdZAYJ8MmUdmIaIcx+2imjPQBPibOH3ylhQOHtFSXNEjwX6J0wHh?=
 =?us-ascii?Q?gAbRTa7dbnmyfd6TEbMrIwqewHN1vDW8cuzW1KLCIyFH5wkUEXBM3aT37hFo?=
 =?us-ascii?Q?T0VVmjr3zmykARNr6IdChbahz4umqEyRfWGJRQLTZig0wnIRq/Qr7LSW4IRX?=
 =?us-ascii?Q?yO/WHFP5RMJpWJOw+BPjeNii+z71M2fdYr/r+tH46/Jx0inWFaz7+FMGSkNT?=
 =?us-ascii?Q?2Fj40M1vbMw8GtbQbN2IaoCYs9VDbYO3kzCfNvqeZAecgmfG4g0j+18em7ve?=
 =?us-ascii?Q?1sKSGZtflWjFxtxEfirGppDGkXUFBKQ8j9hK1ZbwA5gJAGXusXBOfiUs3Lwo?=
 =?us-ascii?Q?6hNQdUekKjCuCEgKS7CHYxL8KhC+F+q83uyJnYTa2NnA+BhGC2voyKmGXCfq?=
 =?us-ascii?Q?6hAA+dWiLoQaImYA/5W2ijs1hFtJ9n2lZdigDTLvjU8IuEQGumOVd9AlkN7H?=
 =?us-ascii?Q?vjI/lBPqVD3R6FIMYgjXMRHd7qKte0b4iuzTEKRveRXHKr/O7okmLHSxVLFv?=
 =?us-ascii?Q?rsZbMbEkn36ftS4PPsBd4EUo5FXpoADpDxQluLeG+3CEMJzxQeV3r/yCOeSI?=
 =?us-ascii?Q?g2kzPttrPmE2uZkOeQ+onknlgo4/gWfpO9SBh6Eo0iuk1MV6ReBFQ83on6aL?=
 =?us-ascii?Q?YCH4cvgi+TZYi04MDfUYiuIyc6Zv2uCj4DmVyU1KyY+b7TQPPxu2tUctTppT?=
 =?us-ascii?Q?32FYQqT3+UZmfejJOgsDBQ7OwzDJAZxm0SSKtMCEylQeZlk2nbsq8wVSXojw?=
 =?us-ascii?Q?7BvZm8b8DV0Yg22RB6C7FsL8+dyA0ukbskTFT8E+Y8pNvyqtW4rPhLjXmGq7?=
 =?us-ascii?Q?6mhDE9j1W7ycb+YCik/gTVe187SzxFA1JbIb2S5Ae+ZCRZ8xjSpJi9HRdnC/?=
 =?us-ascii?Q?YGR8r5ur+pyYTkUdHQtwhZTMwIfaBgpyOOkQgcr63XgXH1K83MjCRvDXadx2?=
 =?us-ascii?Q?ZHc/1Iv39zQSSgk1u5JoYkrAPdVPsY01MDNHhXzJs/4ydM5Z70A+MvFpQHG5?=
 =?us-ascii?Q?xKlPBNSJKi1wx7uxVKfuRuSze7HEYhlyU7gCGmJPPpeMs+Q6GtT7qRa2S8xw?=
 =?us-ascii?Q?lxfvdz2vD19LkswYPBzTSDJqDaDZhHhU9UJPtXqPUJpm82nwN+3JsBA7yd/E?=
 =?us-ascii?Q?iFcGmH/v9AHDp9jLenGc9adhMrOwfbpOL2fa9JQKHwJG/CyQk9oRu6PU6CeC?=
 =?us-ascii?Q?xhCnq5KjmZp86DrgOfPXGTLuvjGrlv0QshqBHZ4BYq1/1XEOCXajVLCHUTji?=
 =?us-ascii?Q?x2EOz9gbcA9cPCPpLNgXEoS0vr6SKgbSa4w9Quub3OXgRO/J3m6RbF/zOulW?=
 =?us-ascii?Q?h4zerUzOds+KzUoJeStJ7SP4bbAqbjxzWaMwtK4SlWXYgCqpc+3jqzYplWgT?=
 =?us-ascii?Q?t6Oe1JURW0ZX/L1dw1nDMabTyTJP/SHgJlaE0GGkVBwa/ghNEE9b0hbqfwZj?=
 =?us-ascii?Q?6WlvSaLselRQeU9L8yncOCPa8mTtaxjnxkIbGUZotlQvXvCPn7GX7fZg4h1s?=
 =?us-ascii?Q?UOk4O9uOH1Nbjk5d3HmfCw+uM/MpTkXAJb9sVTcWHx15g2XK8AckL9ALdwYI?=
 =?us-ascii?Q?HARsLqU9FQGnc06nkRXHSKHlQRf8JMYe/UGb18sC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d97760-bce0-4b9b-3d65-08dbb51b282d
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 12:07:24.8788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZcKB+E5fZf6h3/OU2oIRtPiUBDk2LEvx9z8xC3nwN3mIberOL0Vu6G0W7GKyxxiX4zgk/qtbXh21YsSJMaFKzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8486

PTN5110 itself supports vSafe0V detection and auto discharge disconnect
capabilities. This will enable these feature.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
---
 drivers/usb/typec/tcpm/tcpci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 8ccc2d1a8ffc..141d313b9a55 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -861,6 +861,9 @@ static int tcpci_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, chip);
 
+	chip->data.vbus_vsafe0v = 1;
+	chip->data.auto_discharge_disconnect = 1;
+
 	/* Disable chip interrupts before requesting irq */
 	err = regmap_raw_write(chip->data.regmap, TCPC_ALERT_MASK, &val,
 			       sizeof(u16));
-- 
2.34.1


