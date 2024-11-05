Return-Path: <linux-usb+bounces-17094-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F569BC6B4
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 08:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2326F1F236D8
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 07:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB0F1FE0E5;
	Tue,  5 Nov 2024 07:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bMoQfZz+"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2084.outbound.protection.outlook.com [40.107.104.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C831FDFA0
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 07:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730790886; cv=fail; b=rOQdHcotFbuS+TnhT0Ewqf5O5JqpYSn54PuWiloH08f1E2v/gayRbfHRAs5y4gU0JcC+9Wq+1usDcbv82nU1pJsBE5uazgDLAqLWDzW5fHP/nnIVXSXmB7BV0bwhzv9G+PS5UG7kBCl4mXtigroDnDWowzgYhDNRGMNQcslkoAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730790886; c=relaxed/simple;
	bh=/ZqZcXYMqX4GuDh32ue2GWkPAHo4Ec33sO9ac+tqYEU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=XpOgnZ0Ppvu/G4GOIj30UdZE5TUmdLaXWiaY/ukzKjkipBA7MQ1zuWiSfs0O74buhcdRUdW2vjd2w3lZi+0fyPcNAPeMuOZ6Jy2XKRpDM1FTklX9C8kG+3s9fuayK9Dm8H1/I/MdOvNXhGf1XErbDEGEpIF/Sm/Z0rraBNIi47w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bMoQfZz+; arc=fail smtp.client-ip=40.107.104.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZD+uoRUxEd+2sbkniJS3WGZLZudm68ltc3pXzKGEPro6gqxWD3avTw3zrlRWIHX23ZafwVU5jHRVJQ9VW29JIhT/tH58ojcgBpx56bFf26lAlwRwZytZsEBLa3lmvAeah89IU7kkR2pUyow5vCWSsOQlQf7X+CjxTz1hHedIf8FEghK3tk0bdmwSEuT7xGUETzkRCa7oVYjmf/P/gpd8cY+TzevmYZHj8/m1HVLTYj9acVmZOAPMD/y0Yu/ywj7crlAcG1Xo/Ih8IockO29G7GKVwSKLrDE6Y+qpzUZXffcyhgFzuZXxmC8s2MRV3fQut9P6reNHTJ7CuHIODvkq+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quyPFDbIzZLGMYpEHZgYiMhdzE46xw4JfcsH/glwvow=;
 b=XiyTSQHkvyYi9HoEPCzW4yPpi/MVNn93XyI3f+YtgTwWQELlU2cL8K8IdJd1LqsQUk+j18qQw415VDWY502VxUKrAPC8Y95aLWZvBVWsIPt+W/PSU28sqKPwpNpYqx/MYVEvgY66Wj8AKbqPw59iHwGVEwCBQ5ompqRw5j/Ly9baD0qdS293OcnlmArsqVPHKZ2xJh7hgEhQXWkQjjhZA7EZPVJChGTKWrczn3IfvtsuvrBI2sjHLAl87NRfUcdT3uG0nL87USyUMKKQfFDE/SwJtw3xQ1uB5mTViW+kLZmt7nc5kqJDai82njghjdvMADQiKscIa/hEZDypUEE4lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quyPFDbIzZLGMYpEHZgYiMhdzE46xw4JfcsH/glwvow=;
 b=bMoQfZz+xWb7c6U/OQQpdd+74+xYPPWOwtRLwV34tRVrL9eavFv6Tr0jGmEzk9xhJbMiCydoqGODK/Cn0hUgLrLthQpO/Lce/N7n+o/FFAaBL32x6crA7tWBRrjGUL6seznaerKVvOtmY7Brs7vgRoEzbqKMRAGNk8RHvztZ6iFs6JupoPhYrkfeUolaFlyLlZ5dM8jqdLMSy3tvasuYOsfnJpciF0Mwv9SVAX57VDwHe5+H5b7IioiVAcIZn+385b89/5WgsfiAeQLl6bzcQc8wP0cAl/rCZe6TgUhbPtUEYZjb5OX5cGyWLzyICqvWpo7YCycDQ7kWsi2HFnNwLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10851.eurprd04.prod.outlook.com (2603:10a6:150:21e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 07:14:41 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 07:14:41 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	rogerq@kernel.org,
	d-gole@ti.com
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: dwc3: core: avoid reading register after bus clk is disabled
Date: Tue,  5 Nov 2024 15:14:26 +0800
Message-Id: <20241105071426.2411166-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0127.apcprd03.prod.outlook.com
 (2603:1096:4:91::31) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10851:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e1f7b04-31cc-4109-e9a8-08dcfd69845c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qpA4lxckRXfA5IWJDGk3CohtmMRe7XtuBk1/VlQedqOFceYlG80TlqBK3z5l?=
 =?us-ascii?Q?+gdhoV44kQgVVDrLiuaC5GHMf4b34yYx6yKgCORxmuvb3epONvh89vP43iYa?=
 =?us-ascii?Q?VN4JZWubufbO3Qz6Mzt33hFPUNdOjeIzZnVu33D3Y8BzzXCUfVef0ohLkKwq?=
 =?us-ascii?Q?gTV+taHAZ0buaS7bylyI3DGiayQWHd6WSImbSKpx27SuQ6MkOrM3WYQ+RWtR?=
 =?us-ascii?Q?X/eHN/Wcw0zV0DjiZUj/OL+2neZ8CRAlZFpPMdiF8J6YUgzipY1fPcQfu3Xt?=
 =?us-ascii?Q?e8y2D0rDFMqQLO90+9wCSdnCbDj26gX+85J8/FPNimc/Mf9Ie6AXqvFr4c7/?=
 =?us-ascii?Q?UjItT1UZLDbWeF7dZub6AzLg454Dt9O6YPBDHr55Hz4lI4YSqL292u97OB+s?=
 =?us-ascii?Q?y4k79cp8CLEcpV19wn3N+KCHDBUTgHiuMt6GN4GU917g+bg/JhVW0GMPKsuO?=
 =?us-ascii?Q?TH8zp6Q5p+GO1hZc6LDIMuoRJtcENW3yWnJ4cfRdtwDQfVKo5l4xiV9kuEBE?=
 =?us-ascii?Q?9GXcdCyOWBtPsQCPLs8X3zSwgyv1zZJuRPigsVTumrT6x9FzakrbsurNDOTn?=
 =?us-ascii?Q?o/JbWVFSCBZnLmbgg9NnGkzcvdoji7GX+5CUV7S2xLFxpz5vFK1XORdXMDXl?=
 =?us-ascii?Q?+Aqb0/KeCyGwrhNlKv+qscY9M80b4HP4xDe9iANQ55RrmvOpq53NZ4E7ZKN7?=
 =?us-ascii?Q?ahLNOIll4Fb4gf0P29rvFtNOJzkllMT1fkNye0ESWMqWVgbvdKNpmfo9Kt2t?=
 =?us-ascii?Q?oOs2bWgb5AnfBniA85TvzZ5ebptzfqFaeqp07S40363T/OownswzuHfYaJx2?=
 =?us-ascii?Q?GNV/Mu2+MU3UXKQpei4TdgmlO9gWniVJ5FQfJD+6/0DcixWIwASphWeQv8WC?=
 =?us-ascii?Q?fw0rLMsYK/2UU88hK907w3PUPeqqBxtYu0ZnYIRswtMESESmCu+e38eaqp1p?=
 =?us-ascii?Q?95Ih9q0VR2/oyJyVb0u8RmxnfWcTlr9YDAOaoTCnQlZ28ugfmSY/5wRiEOdw?=
 =?us-ascii?Q?hMuQnYxgKj97Ub3TWp30JqXQDRE3YIRR2IdiGRK41Z5565q9u6AzjfpD4hdw?=
 =?us-ascii?Q?e3+oWFI4DwrkiD++o3sJVQ8Xn6CzMOYfABY6EjhAMOvvYYHVZ0lhrYxicOZh?=
 =?us-ascii?Q?mkZ0jmUZ0OqSN8uKhw19iA0uNoXN02bdXGUD32f9+vNhg+eurA82jH7BF/LZ?=
 =?us-ascii?Q?nqSXMS9ywWhuvF811Ra9TXBuHSeQBxNc7FMfwVjahgrkRbG2yRYSmERiaRVp?=
 =?us-ascii?Q?lwu+daBPk+Fl3MRHym1v7SgS+rOwWKwoLyINERVHB/5yGMR29mbaw0VxwxjO?=
 =?us-ascii?Q?H2QCWwO/Rzro5O5VVJlZZ6XNpR85YFAjwshXe356/HjUTZQxorpKSGgIdp9m?=
 =?us-ascii?Q?lQ5qqQQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F6PpVVz01q/qIkOUf9zl4lJWqVcWfYaJNniwvFBwYE4hsSoXQoZ2QoFR7Ymh?=
 =?us-ascii?Q?zbD2ewOefmWx4BuM/Qo84vngCoJKTG+m0O5ml5ViT+Vhrm2uxv6h7uhdTw1n?=
 =?us-ascii?Q?FKDLPZOKGFbunL8Q4yf/GFmKZgDum9aG/uW9OI1RThL0NNYYevRKd+8ryijp?=
 =?us-ascii?Q?6J+LhzPz8f6XvIfp1yuOCqGp8lobplRBNjOlf02b1KM/SZ5qaq89m20uubpQ?=
 =?us-ascii?Q?pZdlDDLiP9aPY4pkiiSKBzgx0w32nvdo8fTT4sUVZxtkviBYTr0W67ztnp7k?=
 =?us-ascii?Q?YZL9Xhv1xzhrhpf1LLiEp2gFc4HRUztYkEZF5azWV3VzKIrF3Mjz90u3r+o5?=
 =?us-ascii?Q?my/yqVY+WVgZze1gZ44ad203woB5rOrQ+3IPFW5+lDLq8N2FXS9jxQ4yymaL?=
 =?us-ascii?Q?KXmlT2R3PGHhPxChX/RR9BP2drPLyeVkSp48kC84+ZVU1ZirBVnr9WV2mmeF?=
 =?us-ascii?Q?tZ6oF3sQ4cm58ese0fJ6av1JH9BP6WGKxLzsO14m2jeeDN852KAlYCyHa7B9?=
 =?us-ascii?Q?TegaMDAUHJzg4hvbWyreniRaEi9Lnrh+eUw1VSY7QW79J4vF/XJqOPzH2IpP?=
 =?us-ascii?Q?Lp7cUT73EYzXmRlPrSU970329FqhygmrrqCj1BYGu9XQVuiSyl6UMl2u5OqO?=
 =?us-ascii?Q?w5S1YgOoMKPrdww+aeahjxBDLNXVfId4yI88OXTOiC+6iswKpnRT0FZBoaCN?=
 =?us-ascii?Q?y37h9M/6UgsaLutbldX9awuZYK8UBN4Q9Qj5+QwBrLmxzbvii74nwJNgfuH8?=
 =?us-ascii?Q?L3GdLW2CF1nQXyYxFOckOdU0Rsm7xOKs/fRSWEyRRqbo359XePjAIwnYo9pp?=
 =?us-ascii?Q?W9WKR7GfmhJaHUTqpcCM4n8YDQff2CnIXlK48vgiEN1lAbclD4H04X63+cyQ?=
 =?us-ascii?Q?aDjLYxTKNOWzdekZMqyeznmMR/sNVly36Mox9wUVO/914zPIsZLf93l44oQI?=
 =?us-ascii?Q?sr6UXBVSOgZH+4ZUBqp3tLHlZDjuV3nZlQ1lRBbS+mX6XZ1829pUra6FO7fI?=
 =?us-ascii?Q?tC+PsG51AWGqZjZBiIE3CNbO7h8+KDplFfAJV4bN7mpS3gaZMKtVlkioNlte?=
 =?us-ascii?Q?fbMycrtFyIXvYa5RysVji+214pEtzuZQwByCM+rfFznsXbN11WUSi+49Rc8L?=
 =?us-ascii?Q?DuQBLh71IUB0W0fJt/3pAs7DJ+mSST9WMXYLselxDTYXJsxoxzSpX5Rtrq/O?=
 =?us-ascii?Q?vPNTOMTvsxV4Jwmz9kx8IWNSuyUdCXbiB+kuOTuLp8A6pGSrxiy34I/zXkh9?=
 =?us-ascii?Q?7wTx8z33f+ha6uPxlfFiiAW4OxpoYFdGW5jq378GF2Bsml+FBbEPSG93fST/?=
 =?us-ascii?Q?F5pgXYktY1/S6KR82VTIr9wu5Jm7yQ2wQ+jdC5oTmzAxcSvnXBbAo3h406HA?=
 =?us-ascii?Q?N/xDyd+K2DcwOTGcrtMTbkeImavlHKxDFVlC66bOzNFpYz0AeyHHyOikifPE?=
 =?us-ascii?Q?BV5z8SkX8DXN54tMcO4LjqJ2lJFho1K1bhevk6NQuM7P0p10mz6C2psuUYuL?=
 =?us-ascii?Q?2uZ90SaBrSJuysT+Ch2UMXiZvWaDAR0pdKSZ2JsCB69M9Lol5oa385Iiiunv?=
 =?us-ascii?Q?wHBO4rhTSYAeKUPD9gfeN5OC1MzofikZMW4DrAxC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e1f7b04-31cc-4109-e9a8-08dcfd69845c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 07:14:41.6857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T881h7u5Dhg24/+pQl+WSwSo08mJwyjaG78OPOv4mATdDj8SCwAW82Mtedy9LCxVIjpjhnuK8hQJ7JRuqaGe0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10851

The driver may go through below sequence when works as device mode:

dwc3_suspend()
  dwc3_suspend_common()
    dwc3_core_exit()
      dwc3_clk_disable()
	clk_disable_unprepare(dwc->bus_clk);
    dwc3_enable_susphy()
      dwc3_readl(dwc->regs, DWC3_GUSB3PIPECTL(i));

Then the driver will read dwc3 register after bus clk is disabled. If this
happens, the kernel will hang there. This will move dwc3_enable_susphy()
ahead to avoid such issue.

Fixes: 705e3ce37bcc ("usb: dwc3: core: Fix system suspend on TI AM62 platforms")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/dwc3/core.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index de434f78c560..b0f1e32d426f 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2347,6 +2347,15 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 			    (dwc3_readl(dwc->regs, DWC3_GUSB3PIPECTL(0)) &
 			    DWC3_GUSB3PIPECTL_SUSPHY);
 
+	if (!PMSG_IS_AUTO(msg)) {
+		/*
+		 * TI AM62 platform requires SUSPHY to be
+		 * enabled for system suspend to work.
+		 */
+		if (!dwc->susphy_state)
+			dwc3_enable_susphy(dwc, true);
+	}
+
 	switch (dwc->current_dr_role) {
 	case DWC3_GCTL_PRTCAP_DEVICE:
 		if (pm_runtime_suspended(dwc->dev))
@@ -2398,15 +2407,6 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 		break;
 	}
 
-	if (!PMSG_IS_AUTO(msg)) {
-		/*
-		 * TI AM62 platform requires SUSPHY to be
-		 * enabled for system suspend to work.
-		 */
-		if (!dwc->susphy_state)
-			dwc3_enable_susphy(dwc, true);
-	}
-
 	return 0;
 }
 
-- 
2.34.1


