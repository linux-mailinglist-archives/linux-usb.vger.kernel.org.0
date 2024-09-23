Return-Path: <linux-usb+bounces-15302-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C122B97E74A
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2024 10:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F25631C21080
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2024 08:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44876757FC;
	Mon, 23 Sep 2024 08:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Y5bZ5M8g"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012016.outbound.protection.outlook.com [52.101.66.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D805FBBA
	for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2024 08:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727079071; cv=fail; b=Ywg7AseSr8QYwVR5PE7tkGsbE7HCZbl4TY4hGSFhQfcyzrArHaxMXzx2KB+kfm0GXCuLyNaJ3Dn30NpEfxdybHlInUBaxII1phr+jOv5SgBsQ96ubwaNlC3KTjX/fgbiMJRl6R9ke+L4czSUNz7V7G30xmjye324S/3ylMlo85M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727079071; c=relaxed/simple;
	bh=ACUEC30puNZB1M3QRbJbowjVa+UdnNqQgRllQoaY6RE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KjErki3Vs7gJdUJ+q8nGDLbzyUgVLgyrCDNzVuHYdM6OIUOnO7qR3cl3LA1qJn2mWsuumjPR7BEMWwWikMtA7+ZSRMPnmb0EaxXwtYps4+US+wTezgilkLa6jdSHMmNs61J2pEz6WTaNhTo/hs2CQzw1tnUMz6mqiNUEERwk3Uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Y5bZ5M8g; arc=fail smtp.client-ip=52.101.66.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/f/7FjihFeU6YAyjHgT/LBNVytUgwNKLmLz+Mxw3VAVdRfh227Pv9Wh5+9vbnyVj8HZhj4c+7FL+cVzX6DeE4AKDzkTNBvw9UIDhBb0Ze61ZITvlAEamdG/FZKAXTRXgZP6sDxEv95kSYP5710Nqha5mnT8J5lR2tjX7MYxCtwJ/m2zC0NmsaDlYqblX4GnMq64sofmTIkhIn+hnrK5Llmd+DRFo2i1nwiJV6B2+fXUcvYVG9Zvr0ub0eSFKf3FSzdEl79Vy2mcRqH7dzPFSChvCXxp53EjhQKUzgGjT7pNOptK3+m6XYfwrSEuFudLQ7V8+zMJgNWszbSQOGDF/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhZ1i4b3f20/FBIzXCqa6JnlMB0/tS68AHYo79JYnss=;
 b=BJraRwEcyT5lHT71e6j8TsJnPI2SSohJRjb99yXjSyETIE2yMuiRZWRjaSfNLmQmjzNnXfWmoxkfroEmHU2yUMQeFNPtJX0MYKSOVvr6S7SlO2JFeaDz1nTpc9A5E5C4yjE2hmQASBMeUFgWs6kFkh3Mrqrqcw+i0V6DSIn0rXpAv1pl+SGV8x9oWtYSj+/EZLMS3fQeEpEHcCiPbn1HQfmImlZ9oNb5QIpoxfVmolQALoKwdygd2azJIPHvzGnx0IGVQJBhI/HvNMgiN5Hanq0dqSjYmPWHfqTAZnjfAQU7GkupbZceTQ4DT3Wxw98WZwTt8fEpUNoKdu24z5fJ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhZ1i4b3f20/FBIzXCqa6JnlMB0/tS68AHYo79JYnss=;
 b=Y5bZ5M8gpOzQ4QdanlUEysTJ9Cc2ZAyUqy5ZF6or+4l96AK+wR3W7v6F86107b51gPRtgHDuVhsZspjgwaz3z4lMi5M/3wNEK3bGsXt1iexcBMeAUo/c6BgaTXpW1B+TyXda8/vevvOMfK7B9nNzvOzpX6NKcgHx3tvMl3mpsDUgJOOeZ2gw3hZ1nMfXx+sTlGIQPsw2yzdmzRk7gUseA6nMQW21Vi/RwtMF5octILsb3xzz4t6Tq0jikAjZob4hOmCp5c9lFH8nz7S3V6MldxhINv2Ezfipcr0/UgMjEkW6guqJ/GeVV2zq54QTQMxsgmsVdog9TmqN6gJxjbk0Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PR3PR04MB7244.eurprd04.prod.outlook.com (2603:10a6:102:8e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Mon, 23 Sep
 2024 08:11:04 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Mon, 23 Sep 2024
 08:11:04 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2 2/3] usb: chipidea: udc: limit usb request length to max 16KB
Date: Mon, 23 Sep 2024 16:12:02 +0800
Message-Id: <20240923081203.2851768-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240923081203.2851768-1-xu.yang_2@nxp.com>
References: <20240923081203.2851768-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0237.apcprd06.prod.outlook.com
 (2603:1096:4:ac::21) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PR3PR04MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ff5c75f-ebec-462e-69c9-08dcdba74517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GVmuyDRpZEJwnusGb5F/3tjTkUoujl9rn2jhr+hgEzv50wCbih/x0TIU5E+F?=
 =?us-ascii?Q?+wDGTsdRs+BxvGGpKJR39WXxepybH6AzXHKs783bKgX92VW267z18BYKwGcK?=
 =?us-ascii?Q?OHcLN4+F8t0R4CVpakqi88MdRy7pW+wFNTEgFBBpeX3xx2MubTgf+LoDzqRw?=
 =?us-ascii?Q?w0WQ4tOD2qFCZ2Da9PWfcE6c0R0UISO8ViqksQmuqdzld8AdT+PsD2bTrPp8?=
 =?us-ascii?Q?7PeWWSLiOTYjuBu/24zBy1uhdvZ6wjeo+EgP3CEsxu7XqNFQn6J64+pdXHcT?=
 =?us-ascii?Q?4YPVmBm1tj2+8xPw9cvPAYugI1hxoMVy/yzP1qe3UJsG85f/3fQ+m5BwnNly?=
 =?us-ascii?Q?3Ep2gnbLvn53ZKDVYt5BuXnj3AsgOCOrLe/9yEzLNdIulKU+LaGJtO2Y7WAk?=
 =?us-ascii?Q?8TjZZybHxQR2oumPb3aBusbEP4UADfHGh8uFvmCJTlpmxsTvqCIDfNDqOaZX?=
 =?us-ascii?Q?wm8GuqdeK7xvvw6310Fj4X6VKYIBYt1Mc6BhwC/3OlT7WX6L9L8r4Gww3ImG?=
 =?us-ascii?Q?O2j6+EEWDMRQZjbHWdiJJU5GmYq50W7hLmFeAFhzSIg8cmAbf+7X4EQAy79k?=
 =?us-ascii?Q?c2hr4bVF7exQ3HA2W705ef+hamsYlMMkAWXem+wGjga1/9sxzQ3TafZtmpb9?=
 =?us-ascii?Q?GvsLV+Tonz85AQC0ghReX6I1Nl8nBMj1L/w4kAc+xShlTZRKt5ewEHsqGFTo?=
 =?us-ascii?Q?SKpCrnraJuIV/jearBXzF6CdHXJtBhPJG/aUdO3cdyIJMoPDkrs7ynx9pU4m?=
 =?us-ascii?Q?Oc3mSsvza/+qwtnX69shJkkgp1h2JOTbGQNDjMmlXq7ChbuqJ2vcYZXhQB4T?=
 =?us-ascii?Q?h/uH3BmJmn42AwLI7K/djF2bgLi8/vDB5lJkZpMnqSKtitLurXUrcYOYK3t1?=
 =?us-ascii?Q?yk+uNtTl59ckGcYVwpNgnx+cMA8G0v7eUOPUC0fgRpxsL8V8ISoRYcQ38y6K?=
 =?us-ascii?Q?uG8CrWPUfcnb6lvhn9wryUVfX1yubo9jVmxD/ohFHV2GMp7ctixm1GQuFzUw?=
 =?us-ascii?Q?Xr9FH3knY4t2gBM+ey5H6eUCkdcv3bM2bMqOKtgNoPcABAn4c8Ehwp+TtOPe?=
 =?us-ascii?Q?IIwXkICdfDgdvcVslfN99EYY68YpVP1x9vXIjVyVJjPQSR/Qs7/gJLQWS+D1?=
 =?us-ascii?Q?AabiUU5kN06oJupOygINIFDSwfvu12t4p3gj92w+ORUdPvIxXdfPRS20uRvs?=
 =?us-ascii?Q?5RFAtc6OpEIeE/9KSiA6aal9l8v5+ABa+IiTCrroOlGIe5815hGDcizZFDSI?=
 =?us-ascii?Q?Mm4U0AZB+/9a4cufo0gY2qnA9uklcSmrdx0gV2bDtIs6ggFKw+nyhBohQ6Bw?=
 =?us-ascii?Q?8ayBu0stYGRFyjW9GrBKwAoucRZmBtnZN9I0pAIMoJeM6w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pMrOIOJxt3TXoMuf+uiem2D9Dzfml7q0AgW3Rgt4plNWMfLlZ8j9td+L040t?=
 =?us-ascii?Q?SA83imK2CWDhuB1hJSGWw47n9DMz3908hjAUmoP+ODvUEX2GFUs4rSW9MuLo?=
 =?us-ascii?Q?ndpYDkQZqf8J6bvqXNAld597dsrcF6IlcMBr8KoV5u47JiAh9QpBEBduaOxs?=
 =?us-ascii?Q?RdUohogWIqYFHMRkmxyFkm3E2zwIiSp+nTSfytOOAB3d9UqeXJk0SQubBYFk?=
 =?us-ascii?Q?S5H+c81zqgmeLNZCGWwnecdDx+T6IVpLXFOsLWqFaFbfS173nTjidQYaopS5?=
 =?us-ascii?Q?nSxBOPaqwX5ja3Si6dv8AvyPyZGTXjxYlX/j6e0cGUTtz5fF93RrVgwhJKvb?=
 =?us-ascii?Q?QHYFKuDOs89BlJAkHJVpUhijXIQ7f8ScxmQqcduECiX88meOQhFkLc9c2n4Y?=
 =?us-ascii?Q?XMUciHTCJTeSttm0x6GasblA6m8pgGNfuN+xzJ5Np4n3FrgnRnNsWOR8pqxI?=
 =?us-ascii?Q?bqSsgv4Fj7yVvQfFbF1E/+D3Lu24mhlqNsmGbbRSB/LNnae7rM+dgN/AiDaO?=
 =?us-ascii?Q?7Y7wSlK21cJi60TYzfCczUTky1eM2agIqwcWJ+irTgusCj02ENGatrgYl9g8?=
 =?us-ascii?Q?JpduMPcq0YEveI38944zagEwdyWbh5hRIjULK27G1i2aG3lubdSKufMdSLKj?=
 =?us-ascii?Q?Nrb9HvugZCqgbk7LBizXZhO9CtDf5UTPOqN4XFvqGUruWlfpUXuQ3A7twcPA?=
 =?us-ascii?Q?6N/BZYUrnJAk6Kx2mHVsmUqCTe7S++BfJB+GZGnRq0DwftxvQ0vzI1Z6nuaz?=
 =?us-ascii?Q?3vPObISIAoWY5N4Tled3Pluj/cPE87bN4fyokmyKi76x7pi9eoldutKoL1Pc?=
 =?us-ascii?Q?h3jnUjtPfR0Y7Iq4jurGKx+uD7KR5qmi4Us3p3sjZv/hbw+KZ8ZFDXZj5tfQ?=
 =?us-ascii?Q?pOn6TKFV9TC0uct04DfCvb/Q63AEWfZCTw9Qz761599XtpQiUf3o8PdA5dho?=
 =?us-ascii?Q?e6IqHLRNWV8wBBx8ZZ+R4xHEknHpbB0oJ96YpU2PkgKatnkUfDHAI5lHjawD?=
 =?us-ascii?Q?0qX5h7KG7JFNwEnhzVvNFjfHd5i9VVcQI4fmWVeyZc8BIkD45ZVlfyxczQLY?=
 =?us-ascii?Q?XIsUq4WcEz+w9NaB0j5vKyw5ma43AwH3eyjqTjpOZGMuFOZ6rhGWD8aDG/rX?=
 =?us-ascii?Q?aI3dvRAde6CTjomItJM5ZzPjxjH9+Ud5Zq/fxBkM7ZOU/rrHatiAWMGh2pTv?=
 =?us-ascii?Q?nR0D6ficqYDswp/T2emYF+zAA9tvyBOKQtB79wgPxQ7SD8IduPM68jq/E5al?=
 =?us-ascii?Q?aWvGi6IWKFO+1JCVEDTVDLb4DfV7uYSenFe91RtBrkvSTSdqHvL9G9V1HUhr?=
 =?us-ascii?Q?40REDExgLfuQ2cLM1UG5UJdRAfcryShZi6QN+P89OMaxdmD2B3a9XO+l9C+t?=
 =?us-ascii?Q?qc26cLQrzNqJ+dQObxtvh5DJ5SZMPI0le+wpJc4unbD6DDxpAJbOzMrs0Zgx?=
 =?us-ascii?Q?4ErofgU10pLPiEohYd+F5xRJbp4O4RsFkixVRJU79yEmOIUOEpmLK38e4Gl9?=
 =?us-ascii?Q?hoTieFzgGLw1P5gWDn0gAk7By6w0Pb0cqoNEvC6Xi+h1zn/tjkzkddeIincL?=
 =?us-ascii?Q?Z1Jf1mxw+EGfWBC8QnmTjVPFaOeAdyyItHZj5Eqz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff5c75f-ebec-462e-69c9-08dcdba74517
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 08:11:04.7679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KXv98pVDQ3jo4eZyqSqBISwuFOdZqnqiLhmRmdpJ6KjUE6sOoVNDVLL2cO6pkD/ydlERcXj1quC3jaqJDz6chg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7244

To let the device controller work properly on short packet limitations,
one usb request should only correspond to one dTD. Then every dTD will
set IOC. In theory, each dTD support up to 20KB data transfer if the
offset is 0. Due to we cannot predetermine the offset, this will limit
the usb request length to max 16KB. This should be fine since most of
the user transfer data based on this size policy.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - limit request length only when ci->has_short_pkt_limit set
 - modify commit message
---
 drivers/usb/chipidea/ci.h  | 1 +
 drivers/usb/chipidea/udc.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index e4b003d060c2..97437de52ef6 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -25,6 +25,7 @@
 #define TD_PAGE_COUNT      5
 #define CI_HDRC_PAGE_SIZE  4096ul /* page size for TD's */
 #define ENDPT_MAX          32
+#define CI_MAX_REQ_SIZE	(4 * CI_HDRC_PAGE_SIZE)
 #define CI_MAX_BUF_SIZE	(TD_PAGE_COUNT * CI_HDRC_PAGE_SIZE)
 
 /******************************************************************************
diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 18c1882cf088..5badb39cb2bf 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -972,6 +972,12 @@ static int _ep_queue(struct usb_ep *ep, struct usb_request *req,
 		return -EMSGSIZE;
 	}
 
+	if (ci->has_short_pkt_limit &&
+		hwreq->req.length > CI_MAX_REQ_SIZE) {
+		dev_err(hwep->ci->dev, "request length too big (max 16KB)\n");
+		return -EMSGSIZE;
+	}
+
 	/* first nuke then test link, e.g. previous status has not sent */
 	if (!list_empty(&hwreq->queue)) {
 		dev_err(hwep->ci->dev, "request already in queue\n");
-- 
2.34.1


