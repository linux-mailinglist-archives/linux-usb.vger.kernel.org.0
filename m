Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 462E241880F
	for <lists+linux-usb@lfdr.de>; Sun, 26 Sep 2021 12:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhIZKPc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Sep 2021 06:15:32 -0400
Received: from mail-db8eur05on2055.outbound.protection.outlook.com ([40.107.20.55]:2240
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229802AbhIZKPc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 26 Sep 2021 06:15:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOhS5PZxCnEKco2ME5LEjXXAyQXjnyA4QEQSGxNeGaJLq/Ed7yv/BHQr5krkIIgAIuRxDjzrUOBDelzU231RlGAFqxgV3uJy8qV7No5DYcSRdnx/3+Rx0aDYo2k/ffwptjqvBHTbxXk5bn+R30ehBjabh5IFoV7qHcG+4UzCfd2Jy0wpZmcPnzDz7tl2JnyMbYM4xO85Iods/oixfciDP4ABuJiL/cYF7a+3QKV58xWfzyNA3TIerbsbYlM9Ieeuj6tABzDy9S7ppH2iwQpyS5vtNmbPxN5Ctd/K7Y639GqevsBa/fP6Bik4qwoqqHGmL6c0GCaLjA9bOHwg73NG/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=eyPnhl9Gc9iUwGY6eBxcTGNyMvVgjWnlenaSr9ZEFsY=;
 b=HX+L/z67slFEjYXk5GK45sOxo6DwKwRchTR1VaPNhjN1OYR+hMQGaawHEDSXyZBVeYeA2v2AA1DQCWtbEHWTA9CWUBf6Bpm3Obwv2vZOIhW5K/eutb1Y81ECVhWdjHS3WgMbMfpOo0Sz4vDVpVCBpgAlcFXiEdra5VDvyECJPjWG/2KHKhxGI1s6CcxMZmLGRwuDlNBfnX3CHu0JAB6HBRN+28DZ353yYs79HCz874fgaxWsXU9EwcpNxawosN7nSDEG2daDbIDBOLLD8XuiwWeIkGvK+CaLMm1cc21rp+/xfHpY3YdN/oEPsclsWiIPL8BykmuGYmiut+FUlpzBIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyPnhl9Gc9iUwGY6eBxcTGNyMvVgjWnlenaSr9ZEFsY=;
 b=rvQHn0B0Lqn9UYyZ/ocFxLYc252XLd6+3pjSSy/fJtq5oOCx3LCME3rd40vibvPxVXWv6ShbaV55dnRmEVeuDUzRdBPt2ORquUe+uUcuEnMg12bkFhuSvw26MhU8Y9nZOV6TVE2Bcy6PJHnHtEg4ghRtQfYhqIPjpTGqyaz3C7o=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com (2603:10a6:10:11b::14)
 by DB7PR04MB4923.eurprd04.prod.outlook.com (2603:10a6:10:1c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Sun, 26 Sep
 2021 10:13:53 +0000
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::418c:d3c5:fe04:dfb2]) by DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::418c:d3c5:fe04:dfb2%8]) with mapi id 15.20.4523.018; Sun, 26 Sep 2021
 10:13:53 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: [PATCH 1/1] usb: typec: tcpci: don't handle vSafe0V event if it's not enabled
Date:   Sun, 26 Sep 2021 18:14:15 +0800
Message-Id: <20210926101415.3775058-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM3PR07CA0138.eurprd07.prod.outlook.com
 (2603:10a6:207:8::24) To DB8PR04MB6843.eurprd04.prod.outlook.com
 (2603:10a6:10:11b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by AM3PR07CA0138.eurprd07.prod.outlook.com (2603:10a6:207:8::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.7 via Frontend Transport; Sun, 26 Sep 2021 10:13:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 524e3885-40a1-4ff0-2d13-08d980d657bc
X-MS-TrafficTypeDiagnostic: DB7PR04MB4923:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4923ABA82F74AAFDF03CBDAC8CA69@DB7PR04MB4923.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AF6zNaHhm9X9uWS5ksJfRl7xC9Fb4Th5lGrvn3HagVqtfyhHJeTxZnz1av2122dss7JISbZoOK73OUkFBDGFOMsbqMZLz/jCsCiFbmV2LJnO71Mf1eXYa2ClZ3qQAd821Q73uAmbXobkz2GLRO8Fp4iKL/k03B1B1Xb/NZPNEAkA0NoJcBKSJrg02ELd6/mvG5Jm/RF3nBfoiQbkv8hKlvc1sB76FPbZDjwDD3xWRJMyLwzCbGKB85xvgmKLYcprFYAkxTPXPjjWbw7KVRMpI/rNww9h5+h94cO43+RVaecCvKFeL46ElBFQcu4zE6sluiVhJW3fpTskuSCeX3PjFOHaCeaEtpSwM5rOw8wnFikEoqtYcCtW1Ae1+5jNrpmkZGmOKljWCO9XxKlGx4ZGdMwaHa2spNkJbR7YFlxhNb8PMyY3NzTn6Kf/3a94oDdQ86ICnIpJaas0mLvr9wXlsNcnmV7FqGQkjFIbU+P0zoUA+pI4yFF3evz8axiqY8YV7f+oOuEoQgS0/SwfhhAu+MzO1+n9MRNatHUiM6+lEtH9yzeurdHqxgwCIybF2urbeVAR2SNtyoRiU6alPqfDsyzFEavWpg4h5R1Ptzx4GDP/5AdsxGVamqFVvmI5Rblk20YYGZ5Yt07ds33CTAGNRVBeOlOG0s0rVxMZtC4m2bOpT60ByxkHC0xPZom8qe+k50itscrfGJtSUeeqK3pkM4yZ7+UBDwaYbAmrsshaNN4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6843.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(956004)(2906002)(186003)(508600001)(1076003)(8676002)(86362001)(36756003)(83380400001)(6506007)(66476007)(316002)(66556008)(5660300002)(66946007)(8936002)(6486002)(4326008)(38100700002)(26005)(6666004)(52116002)(38350700002)(6512007)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kckqNP2BUoXVWDu1NmNgqHo+r4x8kYrYplM0heyMiOp7RxbvETlEcaLqOeke?=
 =?us-ascii?Q?OVpb4SrqJk8KZi97aXzn9g20AwuVJUYkmn/IyRrZZnT8DqnU67r6+E4K2Hrk?=
 =?us-ascii?Q?ih6oTbjE6r5ikPDQNCT3ftvXI/mUerhtljvzKJEXqU27g+iWsNJEr3UrtUYJ?=
 =?us-ascii?Q?S7M6MjiR2jK86zrwWexEsyhInBskGFvhzv8xb4mq3HI2XDnLbCVBcnRXkhl7?=
 =?us-ascii?Q?DtkG0PUd/x3/vf29leg3q3BCxCjgixM3QE8qFuu0khuZgEMpSBjDlE283pFx?=
 =?us-ascii?Q?yXnMkC0r3INqeNri1bMe1X26qTjvbLDifGe/kBWMyM9HWjNZNkWxkbgI6rSa?=
 =?us-ascii?Q?KB0qmjX/Br9KdK22kW+I3MNdWcU1NYJlsUi58YEvq9bBQSm+1FwtAs5xOcsg?=
 =?us-ascii?Q?yd5WGZX4rWgeVT2Gt+LmMZErh9CEPTZCBw0RhnyKXfwwvVvYCfaKr77rpjYd?=
 =?us-ascii?Q?GMHqxpq/otFMAWFcC47N9hX7SzxC7brQCAeVycooor84rMBR/mhXT6bOmR/s?=
 =?us-ascii?Q?zSN6LH6/hVdPDLKxhHsJhwAqOYpv+J7MW3Fvh3nekFZJviCJ8wFy8UtYReDv?=
 =?us-ascii?Q?+5tTEGpEgX40XAIvfEjswRcEZTV482PAdFYicQElqjArnWOBWDSFd9Ft16mB?=
 =?us-ascii?Q?PrNzzVyNrVOlNIyR9LjK7x8XL7n2r1YeEVXbCd/INBloQrmNgW7+Uz04PibA?=
 =?us-ascii?Q?JsYhIfCmZ1mB5P3XZCnOKPDhFBhtrueSqbX+6gvN4hD2UP4WIFWklnb2UtN5?=
 =?us-ascii?Q?21fBbjKtM9oSILjm2vY9kXWhkn62hhBl/zi3KiYD6jxYmPjuuFQux7CK9iDZ?=
 =?us-ascii?Q?krXtXQe23aqFYLHWpzWbANuTlhCPi+cm2k4aIG3WdGzVKbIq4aWa/Ijh+w2h?=
 =?us-ascii?Q?BVJ/DFhzKl5Rjcn2y7tkFwMfaTjj3Wk48mEkxxgbs9YvOI7ZbbjCCnjF9fJk?=
 =?us-ascii?Q?BPOlzm6uumCWPsPrySqzClSWsMSYSWlJ0bw2yBbi046zwyE54NIFW15hDC55?=
 =?us-ascii?Q?pz66kg5CH2CtJnnm1CrK09nQqZk97bCyDxWQ/izOAU4zVfmGiF0BtwQoDLfI?=
 =?us-ascii?Q?cx4eK0UPLXuoUIHfw78OW1ZY54be/9P5yaBMqJuN/s4bxbRFx897Gw2BpKjP?=
 =?us-ascii?Q?i95wiTjeARYkVUpU3WGqsyc8oHj3NPvam2Luqf2YIwa59tSKccLvEjyoif5X?=
 =?us-ascii?Q?2Zf4lMIRuu+UJlIFpEobBJ5Q8NF0E3i8nJwHi9XUJTIVsem64o5+KIUIKVLG?=
 =?us-ascii?Q?Qaqb6x0hvPlyZigIgZfopaSUj0Ev8LXOxQJGhVeDGgu7qCqrEexXDm/ygB3g?=
 =?us-ascii?Q?c+Q+dU/zL0xjz99FQNdXZtoI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 524e3885-40a1-4ff0-2d13-08d980d657bc
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6843.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2021 10:13:53.6954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZ3y/Tq4Jc/5RKxrLuGhymYD/5cCFZ9pPPwlOmUe2lLbwvxI/WBvKBn1hQH0pYNYTD+IN7U2Dc652Exxwd6smg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4923
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB TCPCI Spec, 4.4.3 Mask Registers:
"A masked register will still indicate in the ALERT register, but shall
not set the Alert# pin low."

Thus, the Extended Status will still indicate in ALERT register if vSafe0V
is detected by TCPC even though being masked. In current code, howerer,
this event will not be handled in detection time. Rather it will be
handled when next ALERT event coming(CC evnet, PD event, etc).

Tcpm might transition to a wrong state in this situation. Thus, the vSafe0V
event should not be handled when it's masked.

Fixes: 766c485b86ef ("usb: typec: tcpci: Add support to report vSafe0V")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 9858716698df..c15eec9cc460 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -696,7 +696,7 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
 		tcpm_pd_receive(tcpci->port, &msg);
 	}
 
-	if (status & TCPC_ALERT_EXTENDED_STATUS) {
+	if (tcpci->data->vbus_vsafe0v && (status & TCPC_ALERT_EXTENDED_STATUS)) {
 		ret = regmap_read(tcpci->regmap, TCPC_EXTENDED_STATUS, &raw);
 		if (!ret && (raw & TCPC_EXTENDED_STATUS_VSAFE0V))
 			tcpm_vbus_change(tcpci->port);
-- 
2.25.1

