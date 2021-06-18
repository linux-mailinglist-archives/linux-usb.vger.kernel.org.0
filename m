Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D87F83AC678
	for <lists+linux-usb@lfdr.de>; Fri, 18 Jun 2021 10:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231714AbhFRItm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Jun 2021 04:49:42 -0400
Received: from mail-eopbgr130074.outbound.protection.outlook.com ([40.107.13.74]:45831
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231295AbhFRItl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Jun 2021 04:49:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RO+CgpcYVUK28rkiiGJakkvrLvz97J4jzomDRu3wBtM/Q0H3MHlLio8+TpYH3J+p1ZedOEjIAdagoDUiwgFaobD2VW0dEUDavfEXe4LplLt00yhf6XkzFmiDP3E1y9OQS00l34vxa6Hmyib2aH343oWsRy9CEPe75cg2sFAXs5D6ozYlWodfX9KDQ10n7xv2OobvLgGh2lv9/wmBjRtNM0aQINCCV3sFUssloL3shbyTU4uUSy25rF37vdKhoVG1m90TytHRb0E2CgdzUDsQDhZzP/rsd+LBHQdZc7m+tyyQS+e6efTW0NPWmsmYAOCxi5xzluKfalVbgwq7DiWQmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXLYNC0uJlF1to4LVDYxk8+P7t8mF/YQj4/GT+TD2Xo=;
 b=DDDr6CQSh1gVFS/R1CMy8pfFdArOFx8NFLBlhiOtHiPaOhjvrKyPOL5vvgqSm6/uQv3r19AgkpVQHheGP4+TpcN/7W3+pmUtAIdSPVQGK7TzZ/UK1sUyynmS64Mn3lvyB0cr8fSOlNvC7kV1smbgzE/+aUhNB3LpsGHqnMHhshagNBwO1rffsGuN7wOl+wa9dhA+TuYjav7ksXsXLnsLKtdDCL8EntENm2viwzSQdjnsxyTCflg+VZT++mfvUJeyE173ZgfrLycXhcfQ4uxbFUELVrAIqzixi+L1yNNF2FnhOqXd2/S38Qx5qlzLIUEonfxCnIbClJFlTNYrjI8OvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXLYNC0uJlF1to4LVDYxk8+P7t8mF/YQj4/GT+TD2Xo=;
 b=RL5xTgXk5Eu3yWyx4kmIRUg+AAwHnhyQuNDpp5wDZkh1TX/BAjU7oMY7Pka0Zrq67nWPA+iHKWBn5vjfj+Sjm6W9ug96ieDkItd8XKCXtAJHPbaCWQUuDvvyk6YLc5ziYWV/v8VyOQgINU/UwmPTuzZ93ri8+xVz9TxBTYqYyoM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VE1PR04MB7357.eurprd04.prod.outlook.com (2603:10a6:800:1ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 18 Jun
 2021 08:47:30 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::79b2:6f7:b5ef:ed81]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::79b2:6f7:b5ef:ed81%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 08:47:30 +0000
From:   Li Jun <jun.li@nxp.com>
To:     peter.chen@kernel.org
Cc:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com,
        zhipeng.wang_1@nxp.com
Subject: [PATCH v3] usb: chipidea: host: fix port index underflow and UBSAN complains
Date:   Fri, 18 Jun 2021 16:28:58 +0800
Message-Id: <1624004938-2399-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0086.apcprd03.prod.outlook.com
 (2603:1096:4:7c::14) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0086.apcprd03.prod.outlook.com (2603:1096:4:7c::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4264.7 via Frontend Transport; Fri, 18 Jun 2021 08:47:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b92055c-f132-40ba-c0ae-08d93235b4b2
X-MS-TrafficTypeDiagnostic: VE1PR04MB7357:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7357E895EABDF13E85470EE9890D9@VE1PR04MB7357.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:747;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tsNOnvlp9Uw+QwJzT1pjFuKI9CH22x5mW7EBjEV/3AY6hG/bdU0fmc5yGhs2MjRa6UkH810vZre1C7yOwEapcZ70e48rj1c0JfXdyCNz6SsjdSwataWMY9nLHCMX11M8kHbBToT439zwDVp8gEeCFhV83kN3yUAeAE4VerVImHH5wElra3YShXWqBXL1IcdFTRjzWLzEEfC2IT2K0jRgej71iCObeO6layFtfjwgQfSU6WixvF4QNrF8EV39RQjN9KAXaWL56KL13gOIqiNEep9hYGKFUTHJEx6eeIRW3Qj57W0jIMc2cnN+0RNr32c4uNN06B6lUWkpQk3dhxLKUgjwfmIjq0xMZN5YQ1oDTMQXk6y2gG+0pgpRrKe31ICKncQtJbRw7AqfnoxckaLTooEhNF5wakDI6Bl6P7zzLrLYYXfrSn/KfqWY4CJhPuojqtMvAXUFNUHdfhvHTSvpBQU81C9y1T0Eq2KDV807EH3NCsYGWXDsv6FfGl2Vef0O1JU1Da4x/S89KGbU7pQbw2V1/txQkw8f5l69Lw7hh7k0U0jUI6AYvgaoOZgbfUb00LLEfk6tW/vllHhjTf7UbnpGW7FnmN80JzNDoj48vnRzReDAj8qV6cDIwebslGF0Pl+bdAHF+RmY1VQxMfOiSGYJlUnR796ocSgnTOIQ9AkxgKWfUFlyp4QmnRu2OiVi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(26005)(8936002)(8676002)(16526019)(186003)(6916009)(38100700002)(6486002)(66476007)(6512007)(478600001)(38350700002)(2616005)(6666004)(4326008)(316002)(83380400001)(86362001)(2906002)(6506007)(956004)(36756003)(52116002)(66946007)(66556008)(5660300002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i+PuzrTWzgfmc3k6eH/BdUu742Ne39v9v7xEF6rYA6wvMnVtzHGZHuCaw5JU?=
 =?us-ascii?Q?m9ZPGTRmTJkXsKl8gSrT5WM6XpVMrLPwzOAkCBiQEDOqYhQFCAXIF/l3Fg5X?=
 =?us-ascii?Q?p5waDeHOcXRes3rbLA+mvfpmHDik+oGXDkPr52D876+IF8FVLkdkKZ5zxcMI?=
 =?us-ascii?Q?L0GpHyIM808EdXESsEofyP2epB9HkOP1g9aC4x2SBV7IpzLP02YdAFKyHRRZ?=
 =?us-ascii?Q?obWEEg5C0cH4K0X9dX6oYLTUJScG2S2z7v+C4Th2OTTNd422xnOWKVVfA/V5?=
 =?us-ascii?Q?sAkzN9mZWar1fOSQ1QGXE1HCObbyT68Wm33k6E4E2mefAyReLIU6uHbFkPuR?=
 =?us-ascii?Q?FDh6OTK8CqnQpavk++Rxa2dgwSU1VuLuUZVkEaUXSzoLxLsD5RRkoYPNawQP?=
 =?us-ascii?Q?gwaZ/KeFIQXP0ZqOo3SoTS0nGXLPsauH6uduhz385jxj1M7/WoFd2+Hxy+A5?=
 =?us-ascii?Q?W69XuU9k6cbSeA15yjBaUsc4tNV4B362AzuTkGxxoh4zJURJLXBJkvB4e7I3?=
 =?us-ascii?Q?aP4yO1VGw1r7uNqMdy4DLD3yjNYwJsc9dWaejVVcYyVuQHlGpJSAUYAR/GJR?=
 =?us-ascii?Q?gh4gFV/Kj+wZwNl4napZ55s5Dj7FrvyZmB2LLl8ToUdxR1EaAiOSBci4NKUw?=
 =?us-ascii?Q?p4uBinuvThpMr5FW2WFr9ekSVzxMbi1kOyRsav5HROQDY6I5A6F1mcSlDz5o?=
 =?us-ascii?Q?EOCLCtedi1EmAD+Whf5+VVAsTYhgbJrhlXwJyh/lmpvX2Jcml34oHMz31lo7?=
 =?us-ascii?Q?cPogOczWNDQjJKXusu9VXYW+3p5dy8ZpxLGhGzFRrfEiumHk/f7fVP94BE8Z?=
 =?us-ascii?Q?SzyC1RVtKiPw60yBk6kc2y4p+DsGo28SzCF9u8aaeo1deNf4lYmz8ZDCTE3D?=
 =?us-ascii?Q?oYTBhxGJjZ+AmaPnml4ieWfePiPQUdUFSsoMIVIM+OyKmCKzR5juYjrnD1kR?=
 =?us-ascii?Q?V8T8HOWV9Fyqk9yri9k0yTFNtGgZlulWWLJAuwvPBXd6a3uCBZd45OLcHWnV?=
 =?us-ascii?Q?VmOFCLl5HtQFC/P57pC4sJNhtkQXDKls1FchqyxKW1S6u6Za6K/EZiNeWaL/?=
 =?us-ascii?Q?BraV5VcmlBGSnPhYuPuf4NrDib1jBUr1nlOjcc1YWbhZOdJIHvqcbt2O1pmu?=
 =?us-ascii?Q?A+XxiGcbwyNOyYV519aXS6zpL4ii2V8zw08ZkbRQrwnIMhF2x25TWfRjDU57?=
 =?us-ascii?Q?umOXqY6Rc5oZod5ETVdNmkK5fRT15NkwO6jM6UtJ2/qzTkp7KrNjnuLug0zW?=
 =?us-ascii?Q?cQ59qLkFx9J8FkagndWXJEf1922RXbjAZZvlqSUcqw8wBWRLN9DwLgS3YQPI?=
 =?us-ascii?Q?il87CwLimdUorQdxG9RfTMse?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b92055c-f132-40ba-c0ae-08d93235b4b2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 08:47:29.8763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3n4kZ8HdwQccZUKAW12+DooTjYLu8LOZYrh/yXBp8rRdww5DyfwNOAzsBQoCnRo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7357
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If wIndex is 0 (and it often is), these calculations underflow and
UBSAN complains, here resolve this by not decrementing the index when
it is equal to 0, this copies the solution from commit 85e3990bea49
("USB: EHCI: avoid undefined pointer arithmetic and placate UBSAN")

Reported-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
Change for v3:
-  Correct the bug's reporter's user name format.

Change for v2:
-  Add wIndex range check to ensure a correct port index value.

 drivers/usb/chipidea/host.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index e86d13c04bdb..bdc3885c0d49 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -240,15 +240,18 @@ static int ci_ehci_hub_control(
 )
 {
 	struct ehci_hcd	*ehci = hcd_to_ehci(hcd);
+	unsigned int	ports = HCS_N_PORTS(ehci->hcs_params);
 	u32 __iomem	*status_reg;
-	u32		temp;
+	u32		temp, port_index;
 	unsigned long	flags;
 	int		retval = 0;
 	bool		done = false;
 	struct device *dev = hcd->self.controller;
 	struct ci_hdrc *ci = dev_get_drvdata(dev);
 
-	status_reg = &ehci->regs->port_status[(wIndex & 0xff) - 1];
+	port_index = wIndex & 0xff;
+	port_index -= (port_index > 0);
+	status_reg = &ehci->regs->port_status[port_index];
 
 	spin_lock_irqsave(&ehci->lock, flags);
 
@@ -260,6 +263,11 @@ static int ci_ehci_hub_control(
 	}
 
 	if (typeReq == SetPortFeature && wValue == USB_PORT_FEAT_SUSPEND) {
+		if (!wIndex || wIndex > ports) {
+			retval = -EPIPE;
+			goto done;
+		}
+
 		temp = ehci_readl(ehci, status_reg);
 		if ((temp & PORT_PE) == 0 || (temp & PORT_RESET) != 0) {
 			retval = -EPIPE;
@@ -288,7 +296,7 @@ static int ci_ehci_hub_control(
 			ehci_writel(ehci, temp, status_reg);
 		}
 
-		set_bit((wIndex & 0xff) - 1, &ehci->suspended_ports);
+		set_bit(port_index, &ehci->suspended_ports);
 		goto done;
 	}
 
-- 
2.25.1

