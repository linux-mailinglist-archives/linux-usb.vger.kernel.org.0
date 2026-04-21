Return-Path: <linux-usb+bounces-36383-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD8nJEo152mg5QEAu9opvQ
	(envelope-from <linux-usb+bounces-36383-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 10:28:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D25438267
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 10:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A308303B4F1
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 08:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B989839B979;
	Tue, 21 Apr 2026 08:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M3/ZzX5l"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011059.outbound.protection.outlook.com [52.101.65.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C223D39C015;
	Tue, 21 Apr 2026 08:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776759751; cv=fail; b=ZIORafkME+4m1UrpNyJBRxnn0EQivx7AR1zPHQ3m+iPyqa3pTXEsOmiI2VwUL3PTrfAQwhyf9AnXzMu3OlIeaDDMzRaljqho7lUMeFFuq6d6L/vBF3OfLwpcoyn3w3OU/PzNPAEylvjsN6ybENhrSkWQPPXPuo7nLEFBRlDRDqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776759751; c=relaxed/simple;
	bh=SWJaq2vLPQdt85FeMrHaGOsuvLA+jfYbZRMLhRW73hU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PJR4GbH2MmUPrwX1wZotdQMOiJp37FgcBBd9M1TdkuuwbL/0v8IhpqBvwJ6H7WewExdgOYS5vlaaY2VpR+aJ2jSaohpOaCLHORcGkHeYFJ9+JFZvFxmSo7JzBaMxp3dO6lZPR3t83Xc/eKtzhm4cKnU48q4ooj+tJi6BaNYX+U0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M3/ZzX5l; arc=fail smtp.client-ip=52.101.65.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=szPZ4kJG57ftA7m5hcit1uuKJbsxlpgtlhn3T7Q8M5mEZuwMkIijyFtUKDhBguytKzLBUjpKLDk3i8St9Ro26FAZdtPOK92K09Bg8+twY3OtDY3JeLz1chci9JW/XxmUsOANVAYNaTKtKquspAA9HsPVb9C+zFL20T6P6ogEqp7hIwhKmM1H/ouMEaJdVpDDoh81tsivPb1s66nOG/hHcZhbTd4r1TeO7mCNe+SHYMYvrq5fIXTHXhtDkrI1RL3ER55wdJvJdZale3sPljba+Sv9Joe0M/h+lsfFvA1MTxVLUt1OKEsfUlv/GqzY420t2gSrxERaASwyiW/d5y4CGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/T5VbzVaZCW1NGGXu4GHs9zUsgcab2Jd0hIqinqgEA=;
 b=Vj0WA28P+k7nhxChyUoNNyUTqVk5bnHv/qDp1Bpiq1B6cJ2COUAd1DXGDmZqlzX4EIeNozhno1gVZhqTfO5/I1xDlu2SrStMRTOe2qFqXCn5VuOQI5bzc9ChR9vAaUViLQy8hPADuGeehcjfbUSMcQLVnUq5LcjZyOVMkC9T8njmfEXDtFDaBUd2li3oS6C/eSQhrnCPIkjMo443pak2NcVuyY05bZnMPT6ytuMW5lssivAZDSQ8fYStNz9kah9J4QFTu2D8BcfpA1suPURy0EgE+wLyPZt1clLVtx8QgkWarw6bIDA1h6yOsuw1xkrvvBIkcOVpj8SWKzwG5g6fUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/T5VbzVaZCW1NGGXu4GHs9zUsgcab2Jd0hIqinqgEA=;
 b=M3/ZzX5lX4H98tKGPnCrfMknOe9o5wO0CZAMC3jiHEhABu/aVdStxI+vR8/7+euzokYtllua+uWURzGa4Ruc3m3VbBSwaTerdfVvXHQXyUypCrIE1VW8NmsQWw2ZmZJgmiWzjE5zB6wfrguw30kZCpqVIVM+aBU7NchyPfEXPWzySN3OQGa7rMefx+sLlQUJ54e4M8WzSXykFIb1SJL4wtgDS2Eu0HkLSpHRTuslv5eyXBMCC7hSz7Jg+bgFI8PnbArVG+d86pZRGkz/OIHGkXEmThEOCf2wZl+QnwB3amUuBBlAB0YpyDO2yIPR3VfsgmUK4r2/6Vams/OyH33nxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBBPR04MB7532.eurprd04.prod.outlook.com (2603:10a6:10:207::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 08:22:26 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 08:22:26 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	jun.li@nxp.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 3/3] usb: chipidea: core: convert ci_role_switch to local variable
Date: Tue, 21 Apr 2026 16:24:36 +0800
Message-Id: <20260421082436.1264442-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260421082436.1264442-1-xu.yang_2@nxp.com>
References: <20260421082436.1264442-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0219.apcprd06.prod.outlook.com
 (2603:1096:4:68::27) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DBBPR04MB7532:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bdcfc92-8cfe-4d5b-9d19-08de9f7f1f0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|19092799006|366016|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	XP33zckOGE+8IdT6/K4wth+fh6Aqlc2cWgiDDRY7CzXIPbItXm95EGZ00ItYg+UKs9YboMAblCjj7KVoVpCV3JCx7zpKZ6OiyqJ0LpB1hSy/0qhJhuC5z4qki0ldz3d8EErhriGUoNNDqSYrJW3cW0yF6DIEr/e7eFQWLUhD5EAO8/0JR1MVEW36OgoZ/AMAuQRzJ16+fBxdYn5Rf5pWniv5jHNYL+KY1VmDO2MTj+wse2SfH1LDyb7ifVv2vBWtPBLztDnUqOIBoSRLB43sHlU9PBplDfSkowWUM4Uj6sYhKt3dVEx1uzB8xURmVkJIuYGmY3LW+kCmG9AZKAq2wc43vxfW3Fjtihp+qOPr4AfGGdojLT1Tvsqv9zPQ2Ypn83iER/UYUFMc6YFpUgjabT1/BCkhnw09ATu/fyHGXsb0QyqUlT0N7wnlupVO/8FbWDtBdMgqwacn+uGfL299xwlwhAtLlwtbT/uO26Y3KM4BgBJwhEssasT5Fxq6409gMmuWxGYSaaYBNxa7nSAIvCL9rRKAEGuC+/Ro4lvflTUe9u9SumE6eofmXQYFjYnmdRtlgX32uLVZjpGignMxCY1tcdbxwb5N4XeVHoxNyhIAd9K4iMIB9X305rEI72oMUfMPCzWOhdNg5FACEYWhkoBRJC6O7ygcjYlT2pNTMawuogds1Hnr/hjoNb3JAY71dftTF+wxA1GH5esSgKFepNXv6cWGWNS9Cmz/An0Z09mWIxLruxwQ2CaKkzQSlEBaC3ui9qEOXi0NxVbzw7IHLCaJrVG7qrVQbM9TZax2Q8k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(19092799006)(366016)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YDaG+kgWlD+8YrbqfdEpsIggMh6trqtW1J9zVAnc5+YE4MycipJwx7Gy8a7E?=
 =?us-ascii?Q?AyIQ72YCeRjyCaV7wtnPHjOp+YqLboEWYKs9z4030tnscr0U93OxTtJlLzx/?=
 =?us-ascii?Q?5JrQlNpswEr33I+rabLEiN6Pjlonw3BF++ylElInIJW3UYsje8hJguCRqa8+?=
 =?us-ascii?Q?y/36+XuhBwZysRUAXI5y5N6jdf+kLwHSXZ75mpZ4nntTINIrci7XxaqZKv/Y?=
 =?us-ascii?Q?7sB+Mx9ciwbWfxjM0JyF8CdSSNZil1KIlZZKZ8TkxrslKIcN+9f0oxlNtWk9?=
 =?us-ascii?Q?B7WDrzzsMc4khrGXi3Vjn/REuOSggCRXNGl4E24G9W5Gvil/coIirVrpKpsN?=
 =?us-ascii?Q?FqB4kxUXqEnPp3oomZbpEpa9/osXxODZeEeK8hK+kFFJtslIfjOrT79OxdBy?=
 =?us-ascii?Q?8CuCzsZDeUGrZCkzuxHw7RbwwmPNoCnKNTA1Emf10j1H2LaSBDVXX+SyX1uX?=
 =?us-ascii?Q?WAu2zeeD24XOlxMSbD1920N4K7oBQAbaOGtS/sZMVx8/A97cEo48sJIQAzH4?=
 =?us-ascii?Q?jdCdsPvzAXSgqYiY3OF+htejO+UGdvMpPsU/giAilGOzRC6KTOVrPoxaxa2t?=
 =?us-ascii?Q?JNZDe/0lYCFeGfT4Ehh5f8BsPwTVD8FdOkffyQZoAKoSIqjQtHDVhqv0r2u6?=
 =?us-ascii?Q?hlIPi4T3dexUDhPb9Pqz+mn6lNKkqYR9Awhe8odBtkNoNv4qSTSJuD82aoqg?=
 =?us-ascii?Q?lAlAzEptISQpEWOkTm+buq5cjlFfpL3U57TeNvftOJiIY1T9iXr7OuxFrO5Z?=
 =?us-ascii?Q?YPxBD0kLejQRmEYbFzHHbgWfdagT5ckJbQlNmBcztjbflOsMRN62Cnat11bv?=
 =?us-ascii?Q?AruW9IbAgMU5lPmnG6C3kbjgu1F6Bl/ITZ9Qoidswzlt2tSGLyaQiFCeseiI?=
 =?us-ascii?Q?YoHzF3K2v1rc0DWY7P2RAFUTiP1uiWFdFi383CJQGrUkx0VztOGy9nxxA7nY?=
 =?us-ascii?Q?gD7kEm5hAMxqMuuEdV7oP1X7AFVfay5EZfzloGHMQ9XUybCfH+pLJIxNfjw7?=
 =?us-ascii?Q?CPSmVmwP23GtdiEV7i+YfBmBEGevkq+r/QFD6sQtHLlog6xYuwUO4yx5BjYc?=
 =?us-ascii?Q?aB75ByrrogeVU+9ZNgL/bWQYVZIUxOEM7+6WZp5pW+S6SywVt1czsHs4qIWx?=
 =?us-ascii?Q?Sg7kJOiOcQIolFlOwNMyjsLx9G6zMXLucFHB2h5xZUypJKYnmNlNjyRgUQGW?=
 =?us-ascii?Q?AhmSeD+ELSBTtAjhY9CXL2b+PzBe9O9BStoMcyR0wU9v+7bVki6v1sUqeC4A?=
 =?us-ascii?Q?ojX+eZ6wg94w4Y2v94hMm7yIN2QmCgC6ZiuZd4PfSFwKJYen66RWN39vmHOz?=
 =?us-ascii?Q?X0xkNe12fxjUp2lsMpqqxc9LjzXbU2JBP6u4dB7m04AR7enxEZqLtHzmCV7L?=
 =?us-ascii?Q?uDnHU6xNDddXh0MtzcYiVjAlRwp+E7NWBgQTO9lZD3fnjggSzAWA7U5CfYPM?=
 =?us-ascii?Q?+ouAMWbBMBWLp/QbRjRfQaBIHF/Z7zhrKMS4x3wi0mvM9AB6N9hDo1CJjBVQ?=
 =?us-ascii?Q?me4roL0RGE8f/9viaxmkzzapuUpSRAJVwfskmQM6A3cB6y7S4WtN8KrhUNxt?=
 =?us-ascii?Q?aECydtDxV6SijC1yhuX0y/r3msCt3tVcqsPPmrcbHVwTpCeTE8M2A6ij4zyi?=
 =?us-ascii?Q?tylUcIquubg9f4HV6sFf5bzTTuQkaBnDZkzWamJQjj6cs+TxzwEdnz/hgQx8?=
 =?us-ascii?Q?saO/QhcGXjBjSQMD1SrMlfPcmqop3R8UDMokEsw74NipIok3c9xgF+WEYcnM?=
 =?us-ascii?Q?qcOXIFW1PA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bdcfc92-8cfe-4d5b-9d19-08de9f7f1f0c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 08:22:26.4674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Z88hKzqFZaPGfKZvKK19Jo4U5NuUwCfhhOOyW9nY7LEmgcs7x/V+yKmV0dqJuCqpSOvdrJ8B5JHOqLSctl1Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7532
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36383-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: E8D25438267
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When a system contains multiple USB controllers, the global ci_role_switch
variable may be overwritten by subsequent driver initialization code.

This can cause issues in the following cases:
 - The 2nd ci_hdrc_probe() sees ci_role_switch.fwnode as non-NULL even
   though the "usb-role-switch" property is not present for the controller.
 - When the ci_hdrc device is unbound and bound again, ci_role_switch
   fwnode will not be reassigned, and the old value will be used instead.

Convert ci_role_switch to a local variable to fix these issues.

Fixes: 05559f10ed79 ("usb: chipidea: add role switch class support")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/core.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 95d9db159ce8..07563be0013f 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -655,12 +655,6 @@ static enum ci_role ci_get_role(struct ci_hdrc *ci)
 	return role;
 }
 
-static struct usb_role_switch_desc ci_role_switch = {
-	.set = ci_usb_role_switch_set,
-	.get = ci_usb_role_switch_get,
-	.allow_userspace_control = true,
-};
-
 static int ci_get_platdata(struct device *dev,
 		struct ci_hdrc_platform_data *platdata)
 {
@@ -787,9 +781,6 @@ static int ci_get_platdata(struct device *dev,
 			cable->connected = false;
 	}
 
-	if (device_property_read_bool(dev, "usb-role-switch"))
-		ci_role_switch.fwnode = dev->fwnode;
-
 	platdata->pctl = devm_pinctrl_get(dev);
 	if (!IS_ERR(platdata->pctl)) {
 		struct pinctrl_state *p;
@@ -1033,6 +1024,7 @@ ATTRIBUTE_GROUPS(ci);
 
 static int ci_hdrc_probe(struct platform_device *pdev)
 {
+	struct usb_role_switch_desc ci_role_switch = {};
 	struct device	*dev = &pdev->dev;
 	struct ci_hdrc	*ci;
 	struct resource	*res;
@@ -1179,7 +1171,11 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (ci_role_switch.fwnode) {
+	if (device_property_read_bool(dev, "usb-role-switch")) {
+		ci_role_switch.set = ci_usb_role_switch_set;
+		ci_role_switch.get = ci_usb_role_switch_get;
+		ci_role_switch.allow_userspace_control = true;
+		ci_role_switch.fwnode = dev_fwnode(dev);
 		ci_role_switch.driver_data = ci;
 		ci->role_switch = usb_role_switch_register(dev,
 					&ci_role_switch);
-- 
2.34.1


