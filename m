Return-Path: <linux-usb+bounces-4297-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBD381663E
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 07:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9E3E2821F5
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 06:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D072F6FB5;
	Mon, 18 Dec 2023 06:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="BP9x+L7W"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2043.outbound.protection.outlook.com [40.107.7.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFE56D24
	for <linux-usb@vger.kernel.org>; Mon, 18 Dec 2023 06:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1N4+sFOfj79joOsLeacLv48mTJUSeNgrJysp+h/DWM+ROKmFKlA5T1fSXkM+OgcoFuMWjlUmk86hr4wrQgvi0BWAUWzTbhKC2sGTYsGK365sH0zOakTtMgWwmbAWwj/XHSOBWQaW9ojEFJKE5E6qXAB7rxNErGBmUCWpTcdktLgJKszYnMSXWsiid8JADuGuFKMQ5IRCbfkG8xZ8Rl15tjHnCsMC5oIqmPUfPOpiuCBtvJRICYH/YLxvHhnhZkkZ1YsrNHpToxzea92nmFRwQP9LTmmcf2gWdpmKfno4EHM3jV4Fa3DQ9fBr+KHsWySYROYm0xgclHcGZuIFpDT9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TQ/j572EOcKYXrKSYQHqSuZNVe19DRoQx35XFJPd6E=;
 b=XzFXNPdKi2tAKycoKxND6sK34GE8fOOP1JHWSZAK4mXf2Bs438xT/udg4WPUfnTcDcn+0sZcaLGJlwV2s1mB9+at6Ff+YcnB7Gr7lvS+EYpRLbnVZu7GtzRDX8MSQwUKcI6n/LH5NjycU7UtynOFJCFX65T/4mhHgfPEUonH5UvYKBkL8xG0k0DGzIrthTQf99bQ64HA1fdEeXXzZQSuaTQx84QnF9+W9MME+hJp3cakG4UuaKZOMM5uLOQiTGHOHCus+tQmrZRB+Lx+lKaI0aAboCkOl5VtnelWFRM1MCVuzeaPdPOXrQ8VuliUFgcg+VJ8cG8tsutmVjtLiq3JuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TQ/j572EOcKYXrKSYQHqSuZNVe19DRoQx35XFJPd6E=;
 b=BP9x+L7WO75Ef+XptBoSBg3aqxxT1L0QhyWZRBSkVqkwo+V4zaMkBfpH7vQis6SgyinnQA96PcsrGJSc/mKiivMNcMBBArHS5QCU7SBqavIfAx3oYDqhJcFGsYU+L7Mkvk+Wt/9BJ3KnMP7GZV47G+8noy4Y8wO5pKCF6r98Okw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by AS8PR04MB8625.eurprd04.prod.outlook.com (2603:10a6:20b:428::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 06:08:33 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30%7]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 06:08:33 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org
Cc: gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	luca.ceresoli@bootlin.com,
	jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/3] usb: phy: mxs: remove CONFIG_USB_OTG condition for mxs_phy_is_otg_host()
Date: Mon, 18 Dec 2023 14:14:20 +0800
Message-Id: <20231218061420.3460145-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218061420.3460145-1-xu.yang_2@nxp.com>
References: <20231218061420.3460145-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB5146:EE_|AS8PR04MB8625:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b849373-6ca9-4828-e811-08dbff8fc369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FY6BPOTpK8Ms72kEFeJuSmaieTQ5lA6VOIV0wg4pgPsoMXB+30YwIjV1IoFjo6fCM9O5ZDHafpaHAT4FCPATRxhM6UDYtc+JR+L3cPAhARgcsI/TCDmfxXOONPo0xVWQHzdIZ2N+++tEkaiK6PgUrHjHLsnzcQeOXchX/zWNi9mtIagirKLecWEhFrC5tI7jDnrJL5rY54xTT7OV6E+3fhHS7ilgPnWit9QwLUtTU88HKtR3vxj/rWMU/9NtxSyTCstUmZAhi9Q1O4HG8lHs/yQad9w087ES/jxzqLFptlCSP78G1f7UIw5BIUwDdOPrAjtBTO0OIlB3Bv+1DWvDbmKRMVt10rNjs+oxom9azTMDrenkuxO9V1JQSvYitnLJUbFjEvts/LyJT817kiBsWkXLJ/wvANCv+j4N5upIoaNGddfxJMW3o63LEjt5GfqXzq6tx1GclvkksW/kJvH8bgbOfdpQsUIAJSuJfVjWhfV2yL7HQUY8/m5K7NGted+27XaqcX6XXgF2TdVO+sInx771IdD+IgVctrcRT9ydVEKB/4rRgx/w2EVc9k/RXk/2c1nNAT2m5uFQ8xS6wh6+b7A2voenx7ekc4O1Acb6cRamcEi5hfxO0jrp00BCt4YK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(346002)(376002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(1076003)(26005)(2616005)(38350700005)(36756003)(86362001)(38100700002)(83380400001)(5660300002)(6512007)(6506007)(52116002)(6666004)(8936002)(8676002)(4326008)(66946007)(66556008)(6486002)(316002)(6916009)(66476007)(2906002)(41300700001)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O/+bB4zPaS4LpOKe1Uougn2ymghqAGXnbdTLc/KbO8AiApv/BSew574sVsdp?=
 =?us-ascii?Q?B4lC5tNCn9eetx4VytmtEEZKbZaKTgG2BwWoQsBj6D4a/4rpA9rpWxULlUpN?=
 =?us-ascii?Q?C+7qvSqdcxnLOL6/Mvy5dr5d9n00l5j0xgruf5DaRcfmzFa7tl1OstRTj510?=
 =?us-ascii?Q?/XwKSpimy4QBzSehyrBXyfFoqVQ00XFkeM0dRioQzY+ft3Jyw1xGseNZ1y3O?=
 =?us-ascii?Q?9EtRyAXigUbBKIVRe7l0PQupDBsXikTDyRP9IEmZrlVc3AIZ8+zOMA18l3jb?=
 =?us-ascii?Q?0o1uiAcZfXA9sKfwEfAxuxZ/79xjcXZdJPU+Zw+n/38NBX1UrszryjtP5iUM?=
 =?us-ascii?Q?0QEEbtoMJyJJmo/y5spwwUq3zLYXBZ+Iqt+2J6TmA+fXCLG6cqHdIHEEIGy6?=
 =?us-ascii?Q?itL73vDucrU6d44XyBLBFESC3/jzhQtAD+9Qgk320W/+ik+ExXrMT9ISOTiq?=
 =?us-ascii?Q?81PJbBxF4O3GXXjSu0kPW0jPNKDkuUlMKa6crQPHFmdsGCX0vNUgp3O0YXhq?=
 =?us-ascii?Q?OnktDPqBifdJoyej0gDLs9t8ZJG2Sok0Kquvoz6nRp4kMbJFqqdIpCsyi927?=
 =?us-ascii?Q?UO8PVnu1JBg4ivPN5KsvYlQS+4fZpM82eHZuJYPb4/R0mwtRJOxk0bV9RFhy?=
 =?us-ascii?Q?f7xBdIRPh3emRjp+kscZsaknuyM/jdEljYQdIjs7gK6HOfwZbzdcrdZG74aW?=
 =?us-ascii?Q?4H2RJ6+ZFf3RAzn5eMHfC8ydF6rsMhaJah5rHp0AQDl2GRPOtrb99lhW1Yjd?=
 =?us-ascii?Q?Xq4tajssuwW3UZg7CN85hLPR00V5y2PkcVcaMZqbE78Ix5UmIeZ6tClU5RZB?=
 =?us-ascii?Q?t1rgEhzlNb/GVzDSwNQ/ETbl+1ziXm2+bZ5noQsPK7mJ5UXwjrQtEpFBFhqK?=
 =?us-ascii?Q?S+jU81v0kwg0dL+B7vn1bOSzwA3wJZ+LIN3sUmiybEqJg2AWTL/dOXjS2dsd?=
 =?us-ascii?Q?vJHL6UzTQqszE13KXYABYbFpOF13Ilx9KcLXCAEqAaRKYHkymJCOBTCrdFK7?=
 =?us-ascii?Q?preS1yCTJr7vwbFBPZAFYikjOem/l+mrsSz3mzW0VLaYIQcqJS9dHhdhUHCC?=
 =?us-ascii?Q?21wA8aU02GdrYqdWxrxcTCegbNM3RfI24pwa5AOm0UdHaiMIhNQDbQqVq2nF?=
 =?us-ascii?Q?X9SXpjQXI8uhGJLeWZ2bF/y7oKpQB1Oq1qHLRIc7NPkPo9a5dPxbOSv0vHiK?=
 =?us-ascii?Q?4yNSITCD+cPt6scau0VO9viw8onhUJf6C3KehSJ1o30rpOvPAWRTqZdckGgc?=
 =?us-ascii?Q?giDEMZTWO9neia6paZWZBorShHOH/T8QNcvFVvNAijlHZ8QZs6rYJWhytcea?=
 =?us-ascii?Q?2RHYGa6Fv9R0tTGdiuj9QoI+4q+47MITEa9XIIKBoeP5fg9NFSrWqVlsV88x?=
 =?us-ascii?Q?TFRPMKrTT9u3o4kZ46JVvs0vo3z7J8xI8Ga7tMghpC3OLoARJNy1T7U7gtH5?=
 =?us-ascii?Q?TryGnwi5ERPZJf4nGh5KUS4dYDOqdvsOTWMo3l8vI8+TcrINpScitOsZV8fL?=
 =?us-ascii?Q?h7RrNkgkRcURz5KU9HiglkTcq36BdUke/a8CZAU6QiEgNJDMbYABAieAhqOK?=
 =?us-ascii?Q?0EIzWeyxOXoCuezQOFEZYWqauGd/f3Gy3s7XvSwE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b849373-6ca9-4828-e811-08dbff8fc369
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 06:08:33.0092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7Xpp0BuEtDAk0UCuBpQW6DGGo0DeX4EgeLEotkNp8DEewEP5PIpKlwo4v/voxtZgQGBaHjRuAT3gqrNHykMXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8625

When CONFIG_USB_OTG is not set, mxs_phy_is_otg_host() will always return
false. This behaviour is wrong. Since phy.last_event will always be set
for either host or device mode. Therefore, CONFIG_USB_OTG condition
can be removed.

Fixes: 5eda42aebb76 ("usb: phy: mxs: fix getting wrong state with mxs_phy_is_otg_host()")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add fix tag and stable maillist
---
 drivers/usb/phy/phy-mxs-usb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index acd46b72899e..920a32cd094d 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -388,8 +388,7 @@ static void __mxs_phy_disconnect_line(struct mxs_phy *mxs_phy, bool disconnect)
 
 static bool mxs_phy_is_otg_host(struct mxs_phy *mxs_phy)
 {
-	return IS_ENABLED(CONFIG_USB_OTG) &&
-		mxs_phy->phy.last_event == USB_EVENT_ID;
+	return mxs_phy->phy.last_event == USB_EVENT_ID;
 }
 
 static void mxs_phy_disconnect_line(struct mxs_phy *mxs_phy, bool on)
-- 
2.34.1


