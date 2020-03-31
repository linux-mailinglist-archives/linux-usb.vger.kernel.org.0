Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9024B198DFE
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 10:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729925AbgCaIKN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 04:10:13 -0400
Received: from mail-eopbgr20080.outbound.protection.outlook.com ([40.107.2.80]:8974
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726528AbgCaIKM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 31 Mar 2020 04:10:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TK8ewhP4TbLKRqS+qAZe7Wc30w46ducPMK81FMfPbcR0D1EhXf1R4msv8S6yNs0aV4d5h8flhBKnULQHCF56qKkBt4LJtBkwvJkG8xrq210oLAIZ+JtG9h4Htpj/18zHrGrjdGZyDDISZNmvydpOTL6YRAMV//i7MknQhmNNiWEr2KU+3111yWzYpXHr6yQWPb/MyDGaU8/UPy4bbv95ZNz0yzHheXGFsINzKBJFyEvrJGRaAiuDCcIN2+InePc1p3eNPK63sHuDTWDiS9m7blyBUgnHzOBpL69HXIV6mpW9Lf5Vac7SAe7uxa684bXzEkncCPlMDF5Wqs+83xudyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZfU613EPkEmC1UVN3XJBvsPGFd20jvlcnjDL5fFUj4=;
 b=n+KWN2XirSHTb4SNs0QlzQD9l14Th3ZfHAfmKC4fES00zev1MNg+7pE2scKVmms+NvDdrBQzNweDTq0TFPsli2uHPpVe8eXBcfHywxvEIVUIcbuHd3co8I0jIiQGKjv89dMEelF3STob6y9x8G7beb34f/PtChSvs2p3eFU6gVNMSjoLL+saXCUqyXhussCTzfPb1sdXYWlnQqYATWlMcWmsIy+D6vHaiP7JKFM+HxxtumALsp8tMs+NbM1wHOKgNKljJ7Xhst6Ltc3a0xo6RqDKjYh9YjMGguRmui4U2j7Czv5/h0DH4zF5RNvgKA0EoD1tMZ7pQ/VdAEac2va45w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZfU613EPkEmC1UVN3XJBvsPGFd20jvlcnjDL5fFUj4=;
 b=ANRxhVLpYo+7csynmzCHSy7n8JMEwBXPlXoH8rgNurPCfBdlvwjWu6zHwnsnaAwBvvqenl4P8vr7q7kYBOZ3X7kxasUz63pV0uqBPa4MXb0OqU2solkuT55tGv6IIuTj2Ktd0qxI5ndbeSfHKEc5tzk55S41rIDNGAhFJCaHq2M=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (52.135.57.84) by
 AM7PR04MB6934.eurprd04.prod.outlook.com (10.141.173.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Tue, 31 Mar 2020 08:10:05 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273%5]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 08:10:05 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/4] usb: cdns3: delete role_override
Date:   Tue, 31 Mar 2020 16:10:03 +0800
Message-Id: <20200331081005.32752-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331081005.32752-1-peter.chen@nxp.com>
References: <20200331081005.32752-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0123.apcprd03.prod.outlook.com
 (2603:1096:4:91::27) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR03CA0123.apcprd03.prod.outlook.com (2603:1096:4:91::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.9 via Frontend Transport; Tue, 31 Mar 2020 08:10:02 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9eb48ba8-d0fb-4497-d835-08d7d54aebae
X-MS-TrafficTypeDiagnostic: AM7PR04MB6934:|AM7PR04MB6934:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6934B10EB1F49201A5FC27B88BC80@AM7PR04MB6934.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0359162B6D
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(66476007)(5660300002)(6916009)(16526019)(186003)(6506007)(52116002)(26005)(6486002)(6512007)(44832011)(8936002)(956004)(4326008)(81166006)(66556008)(8676002)(36756003)(2616005)(81156014)(316002)(478600001)(2906002)(86362001)(66946007)(1076003);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i88S+Kzn6JPC2ocyxhT/6PHo/6CkAUUirTBr7WN23+d6Qs4vd5e//cJi83PLPFuVefivk7hIhh6PZDqwf9HBXVLlIOEXkCQ9aSvpU+tira2r+3pUJgVyLWOBq2FgTNRqFdos+4wifYIMk983b+IqJqG6xnnWerQtOKUQ/sczI6B5MUyBY0ftxr9NnckL8Ul7tO0IRq45MJIJ0xQCJ9d2PLQbKsdGNW+2rUj1nC73+03F4fkxmuQ0BICim317hOVQCx0EqTiIvI9K8sOlVf7EPAV9NI8e0DMa1B+ebztF0InmlP4FWE3kUdAfrBtdnM1HNrjwt7fux5e15/hEqJhcuZewq6XxAnd8dfHXbQz9un6xsW3ENTNN8kJ8UjWwlYZBk1ENSMvk3ku/SgD2AG7TH/pXpQ3k5EFgw7w464YtkE+wtVfMV4/aQvjA2athFSEW
X-MS-Exchange-AntiSpam-MessageData: eKCBH5QNsGWrfoEMkrjdZPxEe3efbOTIxU8IKMmIGsZPbImO/bgd69s5n+m77xC09VjL15pxdDn3Is7DhflcseKWeNceVKj8VCBNs/3nzV38LEpg5I+uG5y1cnyWdxXy1WtotcdcBenZuYOptmqu6w==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb48ba8-d0fb-4497-d835-08d7d54aebae
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2020 08:10:05.6337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8rTuU0zo5DdyL5cITySDgNDoonwQPNeRb2e8HoxEf1uu4u3bjSRQP+SBig6GyXrmPTZ/8Vl+z2r0HKyOBzFQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6934
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In short, we have three kinds of role switches:
- Based on SoC: ID and VBUS
- Based on external connnctor, eg, Type-C or GPIO Connector
- Based on user choices through sysfs

Since HW handling and usb-role-switch handling are at
different places, we do not need role_override any more,
and this flag could not judge external connector case well.

With role_override deleted, We use cdns3_hw_role_switch for
the 1st use case, and usb-role-switch for the 2nd and 3rd cases.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/core.c | 37 -------------------------------------
 drivers/usb/cdns3/core.h |  2 --
 2 files changed, 39 deletions(-)

diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index 704c679a0c5d..f57c66a9f87c 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -291,10 +291,6 @@ int cdns3_hw_role_switch(struct cdns3 *cdns)
 	enum usb_role real_role, current_role;
 	int ret = 0;
 
-	/* Do nothing if role based on syfs. */
-	if (cdns->role_override)
-		return 0;
-
 	pm_runtime_get_sync(cdns->dev);
 
 	current_role = cdns->role;
@@ -353,39 +349,6 @@ static int cdns3_role_set(struct usb_role_switch *sw, enum usb_role role)
 
 	pm_runtime_get_sync(cdns->dev);
 
-	/*
-	 * FIXME: switch role framework should be extended to meet
-	 * requirements. Driver assumes that role can be controlled
-	 * by SW or HW. Temporary workaround is to use USB_ROLE_NONE to
-	 * switch from SW to HW control.
-	 *
-	 * For dr_mode == USB_DR_MODE_OTG:
-	 *	if user sets USB_ROLE_HOST or USB_ROLE_DEVICE then driver
-	 *	sets role_override flag and forces that role.
-	 *	if user sets USB_ROLE_NONE, driver clears role_override and lets
-	 *	HW state machine take over.
-	 *
-	 * For dr_mode != USB_DR_MODE_OTG:
-	 *	Assumptions:
-	 *	1. Restricted user control between NONE and dr_mode.
-	 *	2. Driver doesn't need to rely on role_override flag.
-	 *	3. Driver needs to ensure that HW state machine is never called
-	 *	   if dr_mode != USB_DR_MODE_OTG.
-	 */
-	if (role == USB_ROLE_NONE)
-		cdns->role_override = 0;
-	else
-		cdns->role_override = 1;
-
-	/*
-	 * HW state might have changed so driver need to trigger
-	 * HW state machine if dr_mode == USB_DR_MODE_OTG.
-	 */
-	if (!cdns->role_override && cdns->dr_mode == USB_DR_MODE_OTG) {
-		cdns3_hw_role_switch(cdns);
-		goto pm_put;
-	}
-
 	if (cdns->role == role)
 		goto pm_put;
 
diff --git a/drivers/usb/cdns3/core.h b/drivers/usb/cdns3/core.h
index 969eb94de204..1ad1f1fe61e9 100644
--- a/drivers/usb/cdns3/core.h
+++ b/drivers/usb/cdns3/core.h
@@ -62,7 +62,6 @@ struct cdns3_role_driver {
  *           This field based on firmware setting, kernel configuration
  *           and hardware configuration.
  * @role_sw: pointer to role switch object.
- * @role_override: set 1 if role rely on SW.
  */
 struct cdns3 {
 	struct device			*dev;
@@ -90,7 +89,6 @@ struct cdns3 {
 	struct mutex			mutex;
 	enum usb_dr_mode		dr_mode;
 	struct usb_role_switch		*role_sw;
-	int				role_override;
 };
 
 int cdns3_hw_role_switch(struct cdns3 *cdns);
-- 
2.17.1

