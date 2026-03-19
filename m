Return-Path: <linux-usb+bounces-35124-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOwQCQTJu2leoQIAu9opvQ
	(envelope-from <linux-usb+bounces-35124-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 10:59:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7625B2C92BD
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 10:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE749322DD04
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92285375AB7;
	Thu, 19 Mar 2026 09:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ASEyi1Vg"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010030.outbound.protection.outlook.com [52.101.69.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9221374E46;
	Thu, 19 Mar 2026 09:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913626; cv=fail; b=fsjorYaGkC/8qfEasdsXmcDbv12DCiVqOZ2FS14yat6x9yR+D7kUfW4v1F1dw8j5Ir6VpTa+gwXyMrnG9P6ObyLKJS80Dia0/ilQndPkdKUqYWpLauzeCx4JUP/nknuKnyKsAazc0MTYaq4Xsx/Up3M6SosB8kfmF5m5Xb0fotU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913626; c=relaxed/simple;
	bh=V9RSpGEF+47q2Ub3Wo3Vc+JVEnbvXqn5+fItMI7Sf2s=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=fFLOmvCOMHOWsFXEZ8H1bxxMKX7c5DY1pMQAaa4ZrdZI0HwXRP9i22eSUnYx3cdNKs4UlSvtEXBGPJ2Wz2NZBCbeQ44fJ2g+ugUx1hrFhfzfNkx32wpi9QNaYx0+XUVCJ52yqCdd19TKhmYIL0gH6q4hz7xlCRcUN3FCgqNYGEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ASEyi1Vg; arc=fail smtp.client-ip=52.101.69.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kdtc/BVolPJFx09PDy/JVQs/Z6Aqfp8jbQts/PvBJEuC/3lDS/GGCttJBVwUewKg0Kv1gKp7W2IAKQuL3L347+eobcg9t4p/t+D6MuB90jVuKbOI3z7aWNKtCkH9uWqSKwdTG2iWYHuIcGGRZEYr+4SGytzU5eMDhqgoUF4QStfG/fDDMvGIH1zB2So5L24jwm0ZuKmp/JEIXo2vEXCuAwILupPIvq42+0nhUOt39kbMYFJApJLbFUjkMmrrgozL6IPmNpstjuxORYGWieq3J/ZLdZ7dO6I8bFukpTgtFZ3PJShbrUPklaNWlQkym1j4YjG6Yy2TVd18egD251RflQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7iYVR2UY1u1GDf5oQ0KYpjbeHoOuDx9UL9TmY8YP08=;
 b=wFSZfTo/Bd3yAL2A6xYCaMRDXQp3lbDFiIGpuEMp+lWUOPea5xogJa6QVeCklUm6cPgROwbg9TB/J8XqKrh/Ze/koW/KR/J5bWxICr2w10gma+KH8E40OAWVGZpHSsjw1xXckUbJ9ggEkDc7HW7K7Df7Wo53vo/bO0mvQ5l0rzknubVOWaOxtf4frhR1Owz7MtjrFO7OhVwRJG5hzrzZtEM/YR/a0Js4fZPTL4zZLZFPPzlKgxMcX8OfRpFkLD9q4WHSFlRof/HNM0rHL8MEKBS9xIET9dRQgb4hIKKXjUMvUYB3RjWEn8i5zYadr5q1ze4PtjjxSImNttq2RGjJuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7iYVR2UY1u1GDf5oQ0KYpjbeHoOuDx9UL9TmY8YP08=;
 b=ASEyi1VgiDb2t/wO4WoFGhAcod2VuetedhJQZoZjxeCdxz8gi0NDFY7dL3LaHKCgcSbjAovw00C5QLcSgMSig6brPTTgr94CK3N6tA7zvAYsr/UfYoz+++ys7liT5n/szDHwDeYSqT14UDF8w9rNGCyLsE7Mhr4V0XJ80bx0Mxu0jCDhEtprLlOET/91VebDQQP/+p70+VVZQp5fLaW6+SHsD/YOo/0nKzONmEChaakQXBBHsjjopoYWPAZMVQ0nom/AnYal8HFx6DepGUB/3D9K2M50OEjV2/7VBySJTRBnPuwbu6DVD2ak1ZU9frKLlfhj1Feof7gMd2vEmU24Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB10453.eurprd04.prod.outlook.com (2603:10a6:150:1d2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Thu, 19 Mar
 2026 09:46:58 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 09:46:47 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Subject: [PATCH v4 0/2] usb: typec: tcpci: support setting orientation via
 GPIO
Date: Thu, 19 Mar 2026 17:48:47 +0800
Message-Id: <20260319-support-setting-orientation-use-gpio-v4-0-ab6dfa8610c2@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH/Gu2kC/5XNwY4CIRAE0F8xnG3TNDMk7Mn/2OwBoR05LBBgJ
 hoz/y56UW96rErq1VVULoGr+NlcReEl1JBiD8N2I9zJxokh+J4FIWlUEqHOOafSoHJrIU6Q+jw
 22/oO5sow5ZBgNAN5Y/FAxKJTufAxnB83v389n0JtqVwer4u8t18eLBIQvFXSO+28HuQ+nvPOp
 X9x5xd6JelDkjo5GjeSsmiOkt5J9UrqD0nVSWStiQ6I3psnua7rDQnitNN8AQAA
X-Change-ID: 20260310-support-setting-orientation-use-gpio-5942d9a0b22e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Li Jun <jun.li@nxp.com>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773913749; l=1304;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=V9RSpGEF+47q2Ub3Wo3Vc+JVEnbvXqn5+fItMI7Sf2s=;
 b=u4nCtYs+WMhDTlZpI8aJQa8rzioJ0NYl3x2tJxgOmY+6lwlFFnjJPT6KZ2tmVBXU8S7KdQZkg
 4zZNNpqwPHYDW2GIO8e7BIYRzGzyhNrkdGGUvkIJpagLSscmBscw5Ih
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: MA5PR01CA0214.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::10) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV1PR04MB10453:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d7ddf3c-5ca8-41ab-987b-08de859c6fda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|19092799006|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	R7LFVdZGg49buWUX7Q2rl46MdvcDuePe7jnKZEAWsiO44X5XoQk1Dym9RvrEl2nXmm56qtLcf1NcayES9Wv1Npm7janfyGWoMkjMxVfrfmq678PESRlHtIc+Wuo6NCXAu+ootMj3hylyDiqgGymU8i5dOMOrO4UMYlVt/2yaRx3E5wHq583ORiuKfCKqHhIUJpyP0Cw470zNlXbaFOPgmgMbMi6IASz+WLxMX9w1RACUG+1qi00ZUdMxCeux9WhMeLOG55ePGnlVL2tzbVgko+0CvXMcA4zZQ+6/M36P4rJgOI2Xcdwa1cLsqsvnDJ1foaSWjSa7EpMK9b1k+qNJ1M7eik4X66k4aOXEzZe2Xr2nvGR/0YrD/fCv9fskqDa94kneoZgBDtl/rVLthjwzhVVijv4ZxnZs8vhJxl3wOInUEP80fkbInsVwtcqAjxN34fkETdVOEP324bNcuaNxk0XM1yA9ZzcJ8AMVxRtjoN3j9wo8VxfaRaFP8CszEoNXJe0YDvBYL1UoPL9THEA4aqc0rfqzoFGDfcCZ43n3XhTRuzBj9Sszw0mYe8NTcl7+bv7CEdq+rSObg0oA+nDpKK3WVsYmJPdUnkVmwcaI4vQT9QgJhPERECp1obvh1aVj0QPsXnLkf51/wL+j0sAcxABQcRl7OvA2QP5QIUuyTGa2IoIBcaZ+qYijdszTXACF3nk4Zpi9KjpJK22Yhv6V4m6sYY6a33DDizTLXBUETOEm+uHA5K/LEiMGyoJCkTdhaLd3jghwLe8qg+jPCnCSoANKlP40hozPBIalljIfSUo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(19092799006)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmpvL0VtUWlndHJ4R3F5WHNvVGRMaStEYkoxclBWcDhYTW9aSHM5RjJHRHRT?=
 =?utf-8?B?b1VwbTA2SWYxQksyY3lWa1ZxTjFtTDhlaFNJRWFBVjN5eHlTMVJJbWVBNnJl?=
 =?utf-8?B?OWFoS3RNQ1VVYUJnRERBY3BYQ0UyWnV4ZXA4dkZqc0tUUzg5SnJHbXVUZFI4?=
 =?utf-8?B?bVp3QmQ5MURvOHA1VWYyWURwZTFjTzlKcEJiNlA2RU84N0k2VFdXVUt1WDV0?=
 =?utf-8?B?VldpNlEzZGpJd2xEUnV1SEJlVDRKSks2eDkrNm80TU5ab2IrTXBqUFhRRncy?=
 =?utf-8?B?NmhCdGFIckFTMHRqQ0tvRFNUZU1md0lsZ2M3enJtTGpudVU3TitheWh2R3Fl?=
 =?utf-8?B?eWhvMWRyeWxKeGJoTXc3NFZJS2NLenE4cldLeU52K3hlN2xMbUZuNmsxWmYw?=
 =?utf-8?B?MjErRXJDTnNuVkJNb2JhcXU1bkNreEJIS3pwQ2FIR0hUUjVFbVc2M3dKbnA4?=
 =?utf-8?B?eTRkeWxmdGNnZzdFajE3VnZWZW04bFBDZmYrT2ZxeGpsN0tSWm1aZDMwZktR?=
 =?utf-8?B?YWxuYXdCd3dYa3M0SXpZQ0gxRE01b3Iwd3NBNllFT1lPeWo5RTNRMWJIcUl1?=
 =?utf-8?B?VTUrRFpCSStmS0t4NE9SMWZhYWR1eFZ3N3J3L2hCM0RNUGt6UkRvdHZiQ2oz?=
 =?utf-8?B?dEJRcnRYVkoybzA5dXpCQnkxYXJmVVJLeEt5Y0NlUk5VWmNPOStnMDNBM2VP?=
 =?utf-8?B?eThGUktzMUZpVXNod21mS1EyOXdHcjJhWWxUMXJXUGdaRkI2dTdrdzdoRWVM?=
 =?utf-8?B?aUlJSGVPSXJXL3VQSVBwL1pnaXVsS1JXeDY5anl3SzR1R1JBYWlWL0VnVk00?=
 =?utf-8?B?eDZuaW1Eejd5LzZPcHl0ampEWGNmendUTENKV1kzMVh0NEl0QkFUeDdrN3dw?=
 =?utf-8?B?WDF4V0xPSUtmQ3lNRVhBSDdsV2JMc0dpZW44SW9NRHRDWVYrTTFKMXFIZVNF?=
 =?utf-8?B?TU12R25rdnl5VHBLVDExMU1YK1VZOFNOS1hZYTRuQTJHT0hmZll6QUNsUk5U?=
 =?utf-8?B?S2xJMHdyV0U2clpTb1dIUnNGVzZzMUhkQlRGcko2ZktLcWQ0aE55MnEvVDNJ?=
 =?utf-8?B?eVBNSmI4NWV4RUlQSlF1Zkh1WmpheXMxNjN3aE5ENWo1SEtQbXI0d21Cc2xJ?=
 =?utf-8?B?ZFQzeENWRjVSUDNZN0ZjZEF3Ky9LSzJZWFliQTJWRkhrU0hpcnVYWEp2eG0w?=
 =?utf-8?B?NkR1U0pSZ3JKT3lGWEpkeXNVRjdibjhyK1lsSU5CRXFndkdRWFllc1RSUE9G?=
 =?utf-8?B?Z3BEOVVJU2o1UGNIQlpjTitYQVBPaFN0ODJLVExpQVMwU2xxcDA2REdQSEIx?=
 =?utf-8?B?NGtTWWxrbFB1SEtsZm9zV2dWWjN5c0R0S0NONEdadW93RWJSaGc1SnQ3VDVy?=
 =?utf-8?B?V0FjK3Z6eE1JeFZnT05ueEwwcFp6Sk96Mm5vZE0rY2ZuWnk5eC9hdVR3OTBy?=
 =?utf-8?B?OEd3dFBEZjlQVDhJYlBxN2RxV3ZVL0VXcWZrdFFzTzlwNjIrNjN2ZEE1dUx5?=
 =?utf-8?B?ZFo5WWI2TFlxL3h1c3FOL294eDB2aWU2cncwak5UdUZwQ2NnUi9HTmplOHMv?=
 =?utf-8?B?Mk5JakdTcWwxWHF5Z2tCSnFwcUc2dUhYWFNITk0zUU9nSEFmcUJyOVJFNlVM?=
 =?utf-8?B?aE1aTUsxRy9LVzVyNFNMOTFrM2c2ZXo3Ym52d0o0cUp4ckNsbHFxK0UvQUYy?=
 =?utf-8?B?RG9xVlRpSTcxR0ZCaitxY3ZqSEUxdzJucVZ0MUN6VzBJT2VXOFo1YjRqdlVS?=
 =?utf-8?B?Q3o0R044cjcxUmVoVGE2Y3dIK2E5WENxSHQ3dXNaOThwamVGK3NwOFcrYTVO?=
 =?utf-8?B?bTBaTVlEbVZtczBWVU9wNUtZdHJXQ3VkdkFTamRZd3YwSDZDTE0rNGVITW51?=
 =?utf-8?B?alJ0V2dNQmEwcWxMb0Z5d3dPdWlxZFJXaU9MRXY2QVA0VzhOYUZHNXk3L2pl?=
 =?utf-8?B?THZUSHlOcURxUzlxRkpvMlErMkJ1bERUQmVYbUQvemtnRk94cVk5eGh5cytC?=
 =?utf-8?B?UmV6amxFQlNSMisvUHJRaXdXYmlMU3V1ejRIdExJWktoOXNGdTFmQ3lXbGRR?=
 =?utf-8?B?eWdWK0FkL2JHOTF1WWJnRUp2b0dwVkpGaXlIaXZHV1M1Uk1nc20vUmV4TENn?=
 =?utf-8?B?cTJ6eHE3RkdmOTZ0cDNYRFlJQS9oZG5LVmVCSVIxVUFadUxnRDNiWlJhT2dS?=
 =?utf-8?B?U2ZzMmdOMU9tTkVpTHBraGJDKzk2ZGhaNnJLNUV2eW9ZU0ROdkMxZjNsKy9K?=
 =?utf-8?B?RTZjcWl6bkhDVmViU20waE5UMjJnb0l1RVNBVUM1dUc2dnlTMDk2bk84c0JJ?=
 =?utf-8?B?TE9odWxqTGNiU2FxN1ZZdWR0YkRWQ3hORmJ6Tzh5M2c2d2tXd05vQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d7ddf3c-5ca8-41ab-987b-08de859c6fda
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:46:47.2679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2dp7AbIvYGax1ADu2WmZ6byuqbbgyJSBYhxhCMHzaJtCw6GXaVJSFqPyzbNPgrRkkKx2O74cX9jb5NAcUOrLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10453
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-35124-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7625B2C92BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patchset will add support to set orientation via a simple GPIO in
case the tcpci compatible chip doesn't present "Connection Orientation"
standard output capability.

---
Changes in v4:
- simplify gpiod_set_value_cansleep()
- Link to v3: https://lore.kernel.org/r/20260316-support-setting-orientation-use-gpio-v3-0-0e6622b00dd9@nxp.com

Changes in v3:
- use "err = !!orient_gpio"
- Link to v2: https://lore.kernel.org/r/20260312-support-setting-orientation-use-gpio-v2-0-59c523a09f12@nxp.com

Changes in v2:
- rename the property as orientation-gpios
- add maxItems to the property and modify description
- improve tcpci_set_orientation()
- Link to v1: https://lore.kernel.org/r/20260310-support-setting-orientation-use-gpio-v1-0-da31dc6cd641@nxp.com

---
Xu Yang (2):
      dt-bindings: usb: nxp,ptn5110: add optional orientation-gpios property
      usb: typec: tcpci: support setting orientation via GPIO

 Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml |  4 ++++
 drivers/usb/typec/tcpm/tcpci.c                         | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)
---
base-commit: 84db3719d27337b952fe382413d341fb95351130
change-id: 20260310-support-setting-orientation-use-gpio-5942d9a0b22e

Best regards,
-- 
Xu Yang <xu.yang_2@nxp.com>


