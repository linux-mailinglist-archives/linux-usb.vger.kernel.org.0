Return-Path: <linux-usb+bounces-13267-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E0C94CF5A
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 13:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3108C1F21636
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 11:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B8C192B69;
	Fri,  9 Aug 2024 11:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JBo+ZPHX"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010061.outbound.protection.outlook.com [52.101.69.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E357618CBFA
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 11:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723202918; cv=fail; b=deGegWr4NO0zuP0xUoZCVTMfHL3g/LGdeKtSfuUO6Pnx707vwDdLzbEhAUC6c/2ReIgLpR1xZxONb/CxZr2D4I3GMu6lHc9AbwC1ysZXfmZCcKB1Mtbbpppf3aLZUT4HWaK7SfHf1MsqIkSWwLQLYyOV0T6zRzb/Z1e4CYNScHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723202918; c=relaxed/simple;
	bh=62OeJpikBsHjWYND5VYav9MkvbHpFiKTxMPm626+98Y=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=sE+7I1yvX0E4kJdnAQArHjvNht5Cqahx3z7AWklU+VgOr52uL0meDykucB0b8MUsotWQc72tvrDt3iARQb3dCsr48Y6tRYFW1zHF+vgnGsE72Jo/2Gxe6W8aWPWKNlmHoJYbuCjiQMS62X3rnJbyXrGtWD6HF03VxhNoK99tOOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JBo+ZPHX; arc=fail smtp.client-ip=52.101.69.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrO5yZeXwPGFdpztN2Lfamv+H8UJJw2VW+xQaRCkG8j8UIYtsx9pxXmXLwqWWYsbmtctpDTupJnYFR0QhuNrGOFdL0pG2IOS/rJ+D8nFXNCtH8OjGXZLShwA1WSD6rOv+uIQz7VrVgXo86tcyjSSUINOjoyJB4XgjUo0p+VUuKMcgr7qmNMZ1GeHfAATiHYAcQ5b1AEIPxwJczf0vV1MuewrOSHcqAxG64zAykyTCQs5P5R505+KtVC6whfwoTlweI42udDRUJYqF1JoCEiTTRIh6LcOqD5pXEWBLCVGt1SXxtOVhh5oPLwOCkiySGFZvDdTfoIDg9Nxzej2hIfJSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdKQn4aAm9bOSax5umKxLlBN6l3q16uUDAcU8hHrRBs=;
 b=vuwKnjK/B77taYF+gdW+25Yg3gKHiO5lfcj9RIlL6gOFu+bY8yos4Hxv264z+ghaQRpPoqNJxARBAUDwk50bi4HsHH/nv40SpwgbMow9FH4MK62bGG6VtbWG2v+jbzFKO3ylmnCRTpS4mD5ZG3pthX1Q/XA2SDk0hDoJEy/eQVKUAI1Gzfsn97sjwAii0fEEhh53XpbCOisyISwwSZ78y2MLD21dpKwP6LRt2MoEoyFMF/HoZRMAQDYLSZMMjO28MJzJifVg9EVpd+VncyTIUZ5jjxiyO7rIqWO5drE5YGYCwguS4wj1t4vJqC6wRLcrU5bXapuonME0Vb/QdR/unQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdKQn4aAm9bOSax5umKxLlBN6l3q16uUDAcU8hHrRBs=;
 b=JBo+ZPHXIibPAcTy0/ArrsemiDj9JNSmJlj6wjZTOAj0FuFLJ6whsB7MlOKUaz2vDVACPLGaS47RXrLEkozZxSg0BndlETGOoqsAMwLj8wDIlqEwfus8xaVoTtWyolyfSR+sZf4yhD4cJY0P269gaoHsUbePxEN0rUyH5/tNgybNDrrHGbvSw0oTU0DnowwbZSw0g0tmL5RhEumWustQTvKY7eCNppNATQtMoIx+qWfPyqjzTvK4OOX3yo1ZU2Yf4TcVjlW12Lf2bNZ0o7sHuInEwD0o6PyzrbKqV88yUzXnKqTPh7moli6b2vFwfkQ6XKm0Bti+1IKCmX7u/SHLoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB9964.eurprd04.prod.outlook.com (2603:10a6:10:4c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Fri, 9 Aug
 2024 11:28:32 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 11:28:32 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	rdbabiera@google.com,
	linux@roeck-us.net,
	badhri@google.com,
	kyletso@google.com
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] Revert "usb: typec: tcpm: clear pd_event queue in PORT_RESET"
Date: Fri,  9 Aug 2024 19:29:01 +0800
Message-Id: <20240809112901.535072-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0032.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::19)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB9964:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc93406-08d4-4b1f-f9a8-08dcb8666631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3/0Fi28hIt/SBREnTThYB5KxgZIFjvhb1Qd0WkPUQkqF7ltBQ61AAG6RfSFM?=
 =?us-ascii?Q?2vEqO+wXOZE7FwgOqL99rYDKuGE8qAgriT677Cu/ZT9YUZfgMuxQ4gfzNP7q?=
 =?us-ascii?Q?H6+RLL6FWYFoJ0BpMvqKIqr21GWcWUu8vo9f2BmTm4/w9lDXCXYDvZ9sMRh0?=
 =?us-ascii?Q?Jvy65gGg5pWTLMPEChD2QzV12hIzx+B2//+7N2xVXBV/4181YABbETlHsS3Q?=
 =?us-ascii?Q?Apjy984Xd3NdmXGHFXIGuuZ3gR4/LPSN1Ak+lhex4+PkQoPCKNOBaUgBameb?=
 =?us-ascii?Q?SsK2Yg57rx3Y1aKkSTHztTRwBt5xLy6m3nYSMGpJ7hxqOHaKrZu4aPDx4er/?=
 =?us-ascii?Q?+L5yhWKYeSerwbpNMINes6DrxOedcDADYzp16jak0I8dkT0AW2A45lJZ5Itp?=
 =?us-ascii?Q?HKklNrmSbmqM8iv96f00lcCAuJPmTdle3Uhznfnf5Ex7jDOFQ1cfBB3hLGmI?=
 =?us-ascii?Q?ZHqgUzQN/S/9uG4c/YZHJGWRaYGezG1WHeeeB3hoC5GAB8ytCxuFB0CIMTFq?=
 =?us-ascii?Q?BaviCtbOW98sdhxqWm1ZMMt+/jHBLXcd3LSwFg0uV5Gm2Wwxo0kO3U46yTO6?=
 =?us-ascii?Q?jAhMWvCkUE7WuOCwbHaL4tuMf0YSJbNx2S7mFxm43RM3WJihaDnPzl4Ebi1G?=
 =?us-ascii?Q?4sscf0W+C48ZeXgIu523Wfk1kQQcbz9q6r4Y/hE1XfDFkvYdH90k9UW9FMTM?=
 =?us-ascii?Q?hYLoPMsIcMwlx1mYfLSQH9lULGhfiqlaiviAvliToKbC7hSv01ISVEfJhpUs?=
 =?us-ascii?Q?sbAxfvtLm18mZclcsQHx2RgVGMR4wxgAj5hWS5cgIOgjTF7V20vsk9LeiPdA?=
 =?us-ascii?Q?ox9AjO6j8I+wbjaISTLPiTDqK1vjYPagu/jPebOekgU/n7GVHDYDyU+ZiYWx?=
 =?us-ascii?Q?sSZAVj/I6qx3lUtuEf0OEATWdtwF/ItkVYkPX5PI/7ZACcuWnSvT6VTDZmqG?=
 =?us-ascii?Q?RkpqhsEdPw1ZvMqKW1Zc+sTAgNrdHULUYu1lgGHjk+W7bWMwfmp871F0kLqo?=
 =?us-ascii?Q?mRlGBTwzDMpSZfbjoZRZ6J1U0UNamf3zGHt99YsSDxIRTDz9wilBPvA6emSi?=
 =?us-ascii?Q?ipvBfUbSOVGy/TxBVshYpRcPW49uhAZHW4J6xpesY23jTpywATGtifBmZn9B?=
 =?us-ascii?Q?R7MWzCV6Rr3cBST2uDx/z5SNUIZNM9helpfPp4B4rXCC+uVugGNUc1/GSKQC?=
 =?us-ascii?Q?YiDOaqhupgYT28RCoym9lsYy+qXfs8EdqFme5Qafz8jy183iT2/sMwq+FnJo?=
 =?us-ascii?Q?5A4c34V5tsReF4H4pImvXmc172Rk/+Lq8HMAXSfX3Yw0XG1zYvMsWKgt42OK?=
 =?us-ascii?Q?KcBbVK74pDPJ1I0KOHLtEErQjJkGsHWjQmXzaWRnXnibx/LjsaechVV0Bu4c?=
 =?us-ascii?Q?q6o4oLaJzyIcTIWvuI4m8fk1oQ8uGMj8U0LIpwAuPopESSfmLw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nmez49w0YmXEMU//Q+Tt+rT0ouICtJPomIn9MjVc4M5Ysu1k2iFJWkvlThtQ?=
 =?us-ascii?Q?CdpUiQyowgBPSz7+KdK+Psyl6fFAX45wWye6TQd0H9cGmeSDQ4EGIx0U86RG?=
 =?us-ascii?Q?G8ivekpP+abxDrGfpR41PrqFp8QabFCQLAI7s0Y6Q0cKBB37LRcPgDvQxhon?=
 =?us-ascii?Q?thWkViZ8AxLTw15s570kxj8UlwqievnlzEDrpYPRHAWotsMe7H2EmgVOCh4v?=
 =?us-ascii?Q?lYIPH7Bk13fMGGUP/NC/UcbvjrDFnC1GTPPcXxTDsISERQQYW8wQuiMijqw2?=
 =?us-ascii?Q?rZX6gYDUQ7qKANKdZvqytb25qFIGoiWGr0vohq1yAbAF3Sm7PzpOfwk4GG4C?=
 =?us-ascii?Q?ZwoIelHkirsfZLId2TlaYFg49efbE6x58uz0zlwo37oEO1qKO+mBaAbA19Qi?=
 =?us-ascii?Q?fYPuRqJbSAL2p/zxDzJTk8lshIbH8h6zIzsN98TFeEVUCu6Ua+VD/Y/TMg0p?=
 =?us-ascii?Q?VDUemjJWoDaaJwKm8L9AVXjDgaNUJ9dXKABGZQXglg4/U9bY+syE/Sotk8/5?=
 =?us-ascii?Q?Mr8LrDecH/d0qsG/FrCETW+eJapsCvUmuKh5Il+47ov8T454ICuFu0k789OG?=
 =?us-ascii?Q?8qQSF8atmgpNp1MR9Xa0MyzYsvxdWI3uR0UnOsfI0v0nl+D6fB1l8LoBZmNh?=
 =?us-ascii?Q?Oi10IPQoy7y8TyRcHETu28364Xgqgi3sSkjVmLgzcD2DPJandsq4RZHmTOmc?=
 =?us-ascii?Q?K7+ks+uEOYzrLvXhRgJRODUBpePzSKLH9/o5TMkoVuWDj5FrHVR9JoETiz7I?=
 =?us-ascii?Q?hwPLe6KqclN5bbu/+2SKHS3/XAuecfLDTW6PS2fMLgiYJ1Infw+9DjJ8U0jD?=
 =?us-ascii?Q?EWEilZSGhCAkmP8J7ZbH3l7IrZGnAN5tcWirTcsAh2cEUqfodqIDPjBzdZC1?=
 =?us-ascii?Q?LEfM+OoIYWCD3IsJb+f5kLRHNPmonEmc3pIQmSIkdmagBwimGXQFvh/7QIeB?=
 =?us-ascii?Q?NLm0egU5Q0ufqYHnXnGqSzLQxHYAu/576DhY2vybiapFu96IC2vtZ1GKHNK5?=
 =?us-ascii?Q?qCDyydqGs5H14D/LjkwrKIl8Nq256fWAtdOm024MUYHXC+RmeuzEzgH9dtq6?=
 =?us-ascii?Q?rJJ8dGcDiwVoYWnQJhIxYS66w4c/LXn/x4NC6Qy/GmYqW+rmAZfcqzVBMe4M?=
 =?us-ascii?Q?YOSkBSSAcTFehhZzpwGkqRd/PGdS9p+rXA9Huqm4AkyduWrImD6SuoRKHPeO?=
 =?us-ascii?Q?oJAwZTN5vBXgA8Ww7Ylu+PhzfSRw/J/F+rxZ5ej8DM8DG31VTP3LnZ2IwXeU?=
 =?us-ascii?Q?CfZKrxWs+/c/NbFsn+LgD0IexfTkKsEuIWE/r2bncpTUcROvB+u2VGxiXnwX?=
 =?us-ascii?Q?ozW9vzjrafoAdwvKGptEGqEcJUxCICLCmkuJwAFZuZXUBuWHL/mPw3vfXFWZ?=
 =?us-ascii?Q?T6hClMdORjW1hLykwKUzSeBGPI6H1gRBwK/BoLowF2A/7BzHlTL8eL5Mrl5p?=
 =?us-ascii?Q?jFNRfZTbCEVwFBbc5gWHuIvhkcQ3hi9/yadsp/kA+zUXKl4v56uqxxHmcxoo?=
 =?us-ascii?Q?toM9lTUk6bQTqzuR62d6gId+0DIUFAXKrXysd5edLfaaYTzbKtYHz1LtOI07?=
 =?us-ascii?Q?egYDp8ybQH6mASNkJGIavzqoskeEhsbFHpXHks3o?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc93406-08d4-4b1f-f9a8-08dcb8666631
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 11:28:32.5297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YhyuYRN8egmHXlORagRNRvjyNoCcJg3potqRuapeOE/SgP3Ox3G9nPf9KN9LFcbgR4LcVGK+v+EwzDy/HpHqiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9964

This reverts commit bf20c69cf3cf9c6445c4925dd9a8a6ca1b78bfdf.

During tcpm_init() stage, if the VBUS is still present after
tcpm_reset_port(), then we assume that VBUS will off and goto safe0v
after a specific discharge time. Following a TCPM_VBUS_EVENT event if
VBUS reach to off state. TCPM_VBUS_EVENT event may be set during
PORT_RESET handling stage. If pd_events reset to 0 after TCPM_VBUS_EVENT
set, we will lost this VBUS event. Then the port state machine may stuck
at one state.

Before:

[    2.570172] pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms [rev1 NONE_AMS]
[    2.570179] state change PORT_RESET -> PORT_RESET_WAIT_OFF [delayed 100 ms]
[    2.570182] pending state change PORT_RESET_WAIT_OFF -> SNK_UNATTACHED @ 920 ms [rev1 NONE_AMS]
[    3.490213] state change PORT_RESET_WAIT_OFF -> SNK_UNATTACHED [delayed 920 ms]
[    3.490220] Start toggling
[    3.546050] CC1: 0 -> 0, CC2: 0 -> 2 [state TOGGLING, polarity 0, connected]
[    3.546057] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]

After revert this patch, we can see VBUS off event and the port will goto
expected state.

[    2.441992] pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms [rev1 NONE_AMS]
[    2.441999] state change PORT_RESET -> PORT_RESET_WAIT_OFF [delayed 100 ms]
[    2.442002] pending state change PORT_RESET_WAIT_OFF -> SNK_UNATTACHED @ 920 ms [rev1 NONE_AMS]
[    2.442122] VBUS off
[    2.442125] state change PORT_RESET_WAIT_OFF -> SNK_UNATTACHED [rev1 NONE_AMS]
[    2.442127] VBUS VSAFE0V
[    2.442351] CC1: 0 -> 0, CC2: 0 -> 0 [state SNK_UNATTACHED, polarity 0, disconnected]
[    2.442357] Start toggling
[    2.491850] CC1: 0 -> 0, CC2: 0 -> 2 [state TOGGLING, polarity 0, connected]
[    2.491858] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[    2.491863] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[    2.691905] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]

Fixes: bf20c69cf3cf ("usb: typec: tcpm: clear pd_event queue in PORT_RESET")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index cce39818e99a..4b02d6474259 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -5655,7 +5655,6 @@ static void run_state_machine(struct tcpm_port *port)
 		break;
 	case PORT_RESET:
 		tcpm_reset_port(port);
-		port->pd_events = 0;
 		if (port->self_powered)
 			tcpm_set_cc(port, TYPEC_CC_OPEN);
 		else
-- 
2.34.1


