Return-Path: <linux-usb+bounces-32041-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7C3D01E46
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 10:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9BCA7331665B
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 08:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F81D3A9D81;
	Thu,  8 Jan 2026 08:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ftNvVwgO"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010048.outbound.protection.outlook.com [52.101.69.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F503AA199;
	Thu,  8 Jan 2026 08:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860021; cv=fail; b=SrBWm7eO2GZKgzTUvr1gmJ0/E1nvudzK+zSCgVMUz+fUgqd1H2eSllnNOuKigXzWq4dFi5s2rSMBnSJ9ITTLTox5UfjwofdXr3Pyd8W31Moot38bm+WKHt+izIUBQFMKsPLeFLhAwimFUUm50qcij4EHhR+ZJjIeWsOI/3hoj/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860021; c=relaxed/simple;
	bh=6q74r1Ptm3EhYevDbXds9igBbeOMcLeebYsQsu85fuk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=eiBeb45ajmbyA1Hx4VWhsWhzhZ5bJQiHH+9DdjpfjF6tGlXAjRara+Wt6u5ylIjolwkbtT9BYPMJ1t13hYTsdCcECLJ2Rbe/J9L2rBYXu5Ot1+IUKVpL+quwAQVCYLKms1ZI71tGAzMM3F5sh2eYibhHkbm+dDgkP5mMKRwaomU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ftNvVwgO; arc=fail smtp.client-ip=52.101.69.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XGpvxemBlGu1YcBFkWIUexVTFcR53BCGIv5YvZfvmtJI6pyRxd2XqL1dHX7TzZm6UzP7mTgqSFtsaecWSCatScd3sxxU11J8BglmXoIq1Z99MfJtR2GWYShYhlKXQbTOC/ZhRoWVIPSr0sbPWueJfEqDjWCrc48Iz3ZUAHe5ItsFhX82R7V6I8qCYzICvHWHvmMv7RrK9yWgakIClYwOVEmUcHbhxsL9ejp3m/Fp98/13T5DjqF3CjJsQRGQPYzce9sTbbRm9mZWoeF84DGDXzQlb16hIOkLJcht1MEPimxhp90DdX5zaO3tuCJl/IQd+AAEa10f1t2qPUOmh6iclg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HxUNfnMYYPF9M7KuXFPyTL9/k98FAYEfI+7aubFcQ/0=;
 b=h5uKxffg31p+vxc6kDmyTWNnqDCBcvJmhbxE4naA1Qr39h2pHlB9yunL7gmLaEcadY+n1UsLC/5xE+VfOzbd0zYp6rKryEvrSlwMLacqs28c0R27N3pat5Ctt7TlWU3BOCJnkwsH0d3GW/TgJAPFRs2YlU7aHaTffz6iRfhXAKiBaIWkTIB8TE6dwMwuPD2c/QJV9ZfKcZ2CfKH1fwUKrrMHBV29E4ZF++bl/2ozttFc8wOTALnV/ZYabVC6usJ7qy21VBa9M/74k/P06qwmZSzNMMn3XVbErC3qkPd+tAqbXau9YAGglwybpu2ZeK/S+5X/PWtJPL5rSKCSrAmV2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HxUNfnMYYPF9M7KuXFPyTL9/k98FAYEfI+7aubFcQ/0=;
 b=ftNvVwgO57W5vM/9kQUagyeIV4EC2EZYWU9iXgqDlBIbEcQellst3vz7/ByOFAoyCT6S3V2WPFDrlWGTNh1DucW+4to8HNU0blhfGw7McgurEGcxAj3ONZ/6M1kIrTQr6ipbycR7AXPM2jp4JIWpsKXchl69/9X/F5afmj/s1uVGErie+UT7EAJw7BBGIf3LDSjrmn141/V3wExKHkzcuOkPmu23IHgQUy1kKYuL1P2HJ3E36DPVkhTS9jTdiMTsIpxLMWE32vFjBTbd9qHlAxMkpiMk1pp13mpp/mI8oHi2ST+npUMN+rdobBMg8YAlZd6Jme98t1zAhIowYQGthQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM0PR04MB11916.eurprd04.prod.outlook.com (2603:10a6:20b:6fc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 08:13:15 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 08:13:15 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com
Subject: [PATCH v3 1/3] usb: dwc3: drd: extend dwc3_pre_set_role() to extcon and otg usecase
Date: Thu,  8 Jan 2026 16:14:31 +0800
Message-Id: <20260108081433.2119328-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0194.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::22) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM0PR04MB11916:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d178304-e722-4d9b-1ac5-08de4e8dc60b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|376014|7416014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/Xdsy6MS7tpEWBOiPxB+0AHXs+8y0GtV5VCr5K5xYK/yweNJFZGAirGtGOVN?=
 =?us-ascii?Q?ZtFFfnaLklXSonWnAo4nO8c2l1YVFAW9r+14LEccd4dw4UAjGE9tJdZ0P0rg?=
 =?us-ascii?Q?fhwGtxQwV4csesbdQhUsH5TAnbxn8b6sKUz9Mt1w1Cll8wkebKGZPmHRXodM?=
 =?us-ascii?Q?tMYyJ5mWRQ/PmOKd1gA47+dAKRUnZ2C41dOK7Qz/FfGN3xqmPDNxaC9zQtHI?=
 =?us-ascii?Q?GCMLc2xLg+7cg35D14+d/jUGq6MbuHPNwxGQeIGuEre/skEqMRGs+PqbIKPt?=
 =?us-ascii?Q?3bISpviePAL8voSqV+ssd8A8hUg1YEVyIPtNxyzAJTqGLkBfNv0tfwvH/Hbk?=
 =?us-ascii?Q?kcPyJsfPgd4gI+cVLCsoE7uBaAk00LLMYKNb9BPajzxJiPeXfemrygUkJxAc?=
 =?us-ascii?Q?doELIvT6XdtIpaoaeJ6oVKfJHdzP9Y3HUlL3vVjMYrJxg/cb55XyOpGmdAZj?=
 =?us-ascii?Q?cDgkfivwZw41jR9BvOOPP/AuPCUZmLSbaxIfCwOce37VA8U6jnXt6ZosTtHn?=
 =?us-ascii?Q?x0tPqJXR5dTAN2Ake7aw7hVp0jUOe3WP0cF0cQ2qe+9kwUAN+uBXCnBj8S5y?=
 =?us-ascii?Q?dp4REkjXW3hDraD3G1sNuLCXqWbz87T7t2i68Gnts6QOU4y/ubuqjZ+qoTNV?=
 =?us-ascii?Q?4jNAFvVgMAwfNj/g5lrkkms0fte9ZWzBoXrN9ob4kz8wbfGSLJcm0sez8NjA?=
 =?us-ascii?Q?FZQjXpQTiJdbNigw4Qigwq9B1be2rYaBvhSfgBXVBBVCbCAyHQ3ZAHyprjht?=
 =?us-ascii?Q?e6FbQa4J+SfMAOBLMgZo4Efz334q8vMBfYVdjlCyz8WgeLeC0fGC1wDAly72?=
 =?us-ascii?Q?4YtiTl5aS66BNlfknnvRAZn8emlsXTesPtxiDNL9qX94pMS4z2h3URRuvdkc?=
 =?us-ascii?Q?weraJ/H1lpB+fKPkZnPxj+++DVWTCsjLKzuWrg1dpuZ8kv+gh62Y65KoC+bo?=
 =?us-ascii?Q?2MacvPKKp3uMmwv9ezOLaFa6ozHhFYgnJ7RS+Ohfcd/cOPCLpk8cwOwDxKl1?=
 =?us-ascii?Q?MTLvPchZ0UEh/uZbDNi4FR30wmGaj7n/ppBUAHBO1sGbW9M/iCm7gySArRr/?=
 =?us-ascii?Q?euK33aWWsc/zUYGpa9KWR+CfQscShyqcigCUwUXbTDsaN+27dGi+YfmbQlPu?=
 =?us-ascii?Q?oNBPcn72deQf4kEGVSjn6TqD14MlZT1tSwLDf/Pxib5ZSaTjr9wnSqpLugbH?=
 =?us-ascii?Q?mPQ5pJ4Lewhe75sWRj6qJ/Fe6QR4qSYUO8MO9K/tA0QfoFooRuyVv53yotGg?=
 =?us-ascii?Q?v+aKu+52uRMw3hwfR7L+hi0pwS3B4B3t8buKSDHMMjXMOVe2fyu0L7VrfNbj?=
 =?us-ascii?Q?u1czgy6n72nED0OPMofbZ+bBfYfFhzyLdsJPXFW2ea8608XGF9/5i1mWxsb0?=
 =?us-ascii?Q?n4ZRpOYhRedfV4O0Eon3qmcMAkRdyiXsUThGVj6cvw72UWzK+M/p/ZsBvNGX?=
 =?us-ascii?Q?wEDcIPCDQ/sm8Hp9+TpTG3Z7WLOQuYRfN5mx5m6mIQhCTnbTqlr7PSdZ4O1G?=
 =?us-ascii?Q?qDmfcvQH8/GkbyxLTadyGj3OLvfoX/UKtsxI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(7416014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pMWALI8OKKCrNpZ/xW6mSKqc9u9Cw1iDGOHQs6fRq14H2xntBy2LezUY9Xmi?=
 =?us-ascii?Q?Y86IGDxcdMSOJ+DCRZcoQglx7s5d3mKtceYilLpeW4Wnb66xYw3Nbq8P/5Sj?=
 =?us-ascii?Q?ATsSo5o/SxaseEkH943rTHTdwDe/kP3I+UCTg6fsU5cDXNIiE54BPCT3NjXg?=
 =?us-ascii?Q?c5ngxz2A1MU1f7KnVL29/Qo7XJlqPXiKb5SstaLebiidO2xmMEL7HJz/bemA?=
 =?us-ascii?Q?pzCSJrqJ1gikisNnOEBjal1IrAvpre3zsyroHzXQPDg1Ci7nUH65Dzu0mIMo?=
 =?us-ascii?Q?eEGSgV+n3M23KYI91DLuFF9vwj/fBTICgAjWnWesy9bT+oOBwi8t1/iZrEQH?=
 =?us-ascii?Q?QP8rtC/G8f7cgIyIByzF+e2anUaLGf7Q6RyLWmIYg0wHMQD+WEJahecnwGi3?=
 =?us-ascii?Q?Lc5l9VJdoCF4B4MaQJZH8v8kvKLQgopEOec7UkrEIjXDfOOikzgk1Y0pqCvf?=
 =?us-ascii?Q?uzYkvTsSgrxI/mHSmAFhOtbTxOWUuuQ9jdzARSYMGHjymdps+nDlqLGg8UFF?=
 =?us-ascii?Q?V3sIGy1QMKRFhTQuUMe4/mKQ4axaTL3/0CKFMCwN42c+eWqOv4amRq11bqs+?=
 =?us-ascii?Q?bBKk2jWcu/gakn12W84bq2S/A9WZRUDTht+/4MGK97DlmZrFXtq+0WfgRuSq?=
 =?us-ascii?Q?L6r8NFWTQZYRnwj8AEwVNKaRYwDJH+476MJPc1kD3uixo2gM+mt53yj+Wi/b?=
 =?us-ascii?Q?IiKwjfJc5S9YCcWiBV/g6HL/FUrmx1KH7WnV8doDdo4J+wa5z2B1skdxnt1L?=
 =?us-ascii?Q?2frWygM+KvaMD+cRUWu7mfYnT4Fu2MuGWRwgn4xi5qHeohg4MWGuu9CReg2Y?=
 =?us-ascii?Q?lxrIzvfCH/zyqyOaBpq5Fjb2LuksYJiwVI24ns6aA/7ahEqWl6CV/yqH7qPm?=
 =?us-ascii?Q?SACj0cb3o2AS97pqRBt7C5bBn9D8DDuzSfwbKkZDjx5xKJbXgJgiuCuoTNjJ?=
 =?us-ascii?Q?WB0ny/fvc9Shl6wWDgVEiazljrwsgVl5i2ahRx6HvUgRm0nmHcpL1Kv8xi4x?=
 =?us-ascii?Q?ogxKAjWE/+anD0RKRFbcqlh1zFivW5fQcE75GqUlITpK3xQpTWzdg3rVuSSv?=
 =?us-ascii?Q?BwVcgYvje38hl/heTgIlz/SDbJe5UrjOwKH9r6Fpr/ENpxmFkf2Sc8b38QEC?=
 =?us-ascii?Q?irTaMFceZ+9+I+jHX4oMf/6ea7yNkufC/uWJKkIWDw8J1PrrxLEswFFhA5wt?=
 =?us-ascii?Q?kf/qEe99VsyvYu/xQplncBZnosJ2tayWSKMmbSihmZETmoseybtwfe5nbpFU?=
 =?us-ascii?Q?bl4AG3MQfT3ny47jAnYkajkwilH966BYCBVY2FHvrxPD8J6ELA6+M4jFpEUJ?=
 =?us-ascii?Q?CeIuj7Z0D9PAeulWoemFZghHSyPY9mGnusCeEl9ybwHDgvzs9wjj6U/2WB4e?=
 =?us-ascii?Q?f/t5JRosZk834+z9Hd/On/uwS/xxmVSHyMmjAIQykZM4fQIzrn9DWFDucEJu?=
 =?us-ascii?Q?+r8d46TPGF0iPrYaCrpVO1lM5dmrSFOx+MsbOJoDY7M6l5QOUv1UJPti4igf?=
 =?us-ascii?Q?HRtXSz2xCl1bIpbxNifbnmZTJEA3Umi1hQN7BZoKUbOVWUe30PnZyBWUjlc9?=
 =?us-ascii?Q?pzIVOSbBBnU3mhfp8FRjgPvQTrGN8IJ6sXMtnmgMlBT1Cga1yvH/JTFR/C1L?=
 =?us-ascii?Q?1PoWvsDQb+YSwTLfnefTggbXhA3cRgVh8SnkUUisozLkHaBV+PageVqTsPgw?=
 =?us-ascii?Q?+6M1bo4vrGyY+Gri+3es1puCR+hgolVp9eBTMZxO+KylJF3hllzHlL1vYPBt?=
 =?us-ascii?Q?9ms9JW5AAg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d178304-e722-4d9b-1ac5-08de4e8dc60b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 08:13:15.5650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NWyewnFdEyDIoZCRtYMJGepaBzvyOj9GvcljJ1iTrF2FWbubStM/m8JbGda5ar406fHNn+idT7SG4dHqX/5axg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11916

Call dwc3_pre_set_role() to support both extcon and otg usecase, so that
the glue driver can do proper action in case of role changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - no changes
Changes in v2:
 - improve commit message
 - add Rb and Ab tag
---
 drivers/usb/dwc3/drd.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 589bbeb27454..031cfd12300a 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -381,6 +381,7 @@ void dwc3_otg_update(struct dwc3 *dwc, bool ignore_idstatus)
 		dwc3_otgregs_init(dwc);
 		dwc3_otg_host_init(dwc);
 		spin_unlock_irqrestore(&dwc->lock, flags);
+		dwc3_pre_set_role(dwc, USB_ROLE_HOST);
 		ret = dwc3_host_init(dwc);
 		if (ret) {
 			dev_err(dwc->dev, "failed to initialize host\n");
@@ -406,6 +407,7 @@ void dwc3_otg_update(struct dwc3 *dwc, bool ignore_idstatus)
 			otg_set_vbus(dwc->usb2_phy->otg, false);
 		if (dwc->usb2_generic_phy[0])
 			phy_set_mode(dwc->usb2_generic_phy[0], PHY_MODE_USB_DEVICE);
+		dwc3_pre_set_role(dwc, USB_ROLE_DEVICE);
 		ret = dwc3_gadget_init(dwc);
 		if (ret)
 			dev_err(dwc->dev, "failed to initialize peripheral\n");
@@ -433,10 +435,12 @@ static int dwc3_drd_notifier(struct notifier_block *nb,
 			     unsigned long event, void *ptr)
 {
 	struct dwc3 *dwc = container_of(nb, struct dwc3, edev_nb);
+	u32 mode = event ? DWC3_GCTL_PRTCAP_HOST : DWC3_GCTL_PRTCAP_DEVICE;
+	enum usb_role role = mode == DWC3_GCTL_PRTCAP_HOST ?
+				     USB_ROLE_HOST : USB_ROLE_DEVICE;
 
-	dwc3_set_mode(dwc, event ?
-		      DWC3_GCTL_PRTCAP_HOST :
-		      DWC3_GCTL_PRTCAP_DEVICE);
+	dwc3_pre_set_role(dwc, role);
+	dwc3_set_mode(dwc, mode);
 
 	return NOTIFY_DONE;
 }
-- 
2.34.1


