Return-Path: <linux-usb+bounces-32996-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAViODp8gGnE8wIAu9opvQ
	(envelope-from <linux-usb+bounces-32996-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 11:28:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE9DCAE84
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 11:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D67A2302E7E3
	for <lists+linux-usb@lfdr.de>; Mon,  2 Feb 2026 10:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B0E3590BE;
	Mon,  2 Feb 2026 10:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YivoG/Mt"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010071.outbound.protection.outlook.com [52.101.84.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FE021B918;
	Mon,  2 Feb 2026 10:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770028009; cv=fail; b=jW3/DlhczEsEcsiaSZI7uZ1b0XzXjD/fnDxxlVsJbgBQIeTqhS1FIGZ/D/4/fqxdqoaDu+WIsAqG34REQoXCpmiokb6tdardZHX75gD+Mcp8EGc4KACaHkdunJQsL7/CZmEeF9griEzeu4SJdXyRJPI+PBVfjLs6Z3cuvyRjWOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770028009; c=relaxed/simple;
	bh=rs3edGnOwN8Zm7VUJovBFXLpw0L2mVJ7xU5bKKId6rA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mJLimBsFZzs73s+pHuVQfWnxv4Hf6KeA5P920akBYZ+TwB54YNR23Zswx6LxiMfNet7mcv0lAkbzEtDgO4igQ5nN0j85XmF+612PWi6BXa2orD5VcTXNMDI8mQYV2Kc60eKHgHA00Ro7gtl50N1q7X7Dv2z8cIi5Ics5TV+Sql4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YivoG/Mt; arc=fail smtp.client-ip=52.101.84.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=togNQox63i50ru1OITvqlKaBqBYmSx6IhL717EDXNd25/GCGUL/cVHS0+IvaMLAjhJdGs8ow3S3mo1ZEes3AMo0LvCvV6Aur4UVLPBWjmYvffijqBpuHiIBonmFqiXGNEVUfIS7DhPtNoBKx5etpM4Uy4x9TjIkCT/cblxcMRXhkrDGIGAllCDVxxslEyuyxQfGMtTyt8gRiOeLAHYgMDk9CNDYy0vV7kF+DtJwv84y2/qLwc4kGTv74QYhxaHUQlmfAk+1VGi1/3d1+Xesl0tAO/kxIoXtgqVTA876TUe2kcpAW4gQbLh5uCCRx1nuwcsJE7kXgNnvz+ojegl0/GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+e5SMGzxIWTgDLLXXUhx36tyTL3gVLGNDQ0hbieqgGc=;
 b=URgfAoWB495915hXgVGA+OEW5G/BWQ31ntM/7a4LGee60fD9ru1TRi4vtob80rOLIMwUJgjqLTaMV6tiG5DjK4XaeC/jMIMVr2agpxxaosLPwE/XKZzV+L+BLATo/eI8aGhZ9VS1rHcNiryjoXI1Aeg7+zaAwKoyZ8VVbDEFF0Ru3ylCNT/4nXecnw7MFmwl7LLldAIH/JSOj0r5Y7qABWTdXfc6lmhOBfGtsG6JxcIDbr+325FY022w3TSAq2i11wnaaAR0bvsEHV5hSH3tfNpFW9vmzzrQHepENRWk8H/+O06yYPx0hkE3tkTBjxGNXrS3PZomSvN9S8k4P0Xipw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+e5SMGzxIWTgDLLXXUhx36tyTL3gVLGNDQ0hbieqgGc=;
 b=YivoG/Mt/+xRSh1s9y4KEIOeLFAkhD3Kk8DzN2v0GOj6ff3YxUFeMmonEVr0RC0i4fGXJh8oj7jZTgiYCdh4so2LPLvlb3WpOOBLzRoltef8d88xUC0zr2Wh8mN2n+1KmVXpbhL4QqLlhHeoFri5wOb9O7MPO5s78kmvGvNH0AXfgka/5Y1+iAmao/K4Ir919We47EjYILCkt9MiXbkn28HJV0dbzCfLRyxNJ29FxkIK70JOAvJrl/QLxvTKBZ6BgR4k2w9xRQWWF9LvUEwPplu0AEzziTXVkQl1eRQh8WTm91FRZI3VOrmWocPB7Kz9TGsPZjAk4yVyDTQi/DxXEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
 by AM9PR04MB8763.eurprd04.prod.outlook.com (2603:10a6:20b:40a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 10:26:43 +0000
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781]) by AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 10:26:43 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Mon, 02 Feb 2026 18:27:47 +0800
Subject: [PATCH 3/3] usb: dwc3: introduce flatten model driver of i.MX Soc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-3-c44a5e919380@nxp.com>
References: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
In-Reply-To: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Li Jun <jun.li@nxp.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770028079; l=13893;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=rs3edGnOwN8Zm7VUJovBFXLpw0L2mVJ7xU5bKKId6rA=;
 b=gKCzYpQf8zSsM00RQpEdCIuSlCcXhR6IADmRClZ6eDqGfEKxc8lVWYghP0gykmCAxyQON7sY+
 O+9qvozyiVHCCk0uYO8R2fRxxuz4bkFGhDnZvESohxELGRgQ5dq5mqn
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:4:186::22) To AM9PR04MB8825.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8825:EE_|AM9PR04MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed453bf-09f3-436c-05f0-08de62458eff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGdkYVUvbXluOXlZTWtmYU16bEY1eWx2NWRqU2tmS0lnQml3OGltVEYxL2JP?=
 =?utf-8?B?UWNTSXp2VlV3Z0JMUm96ZnJJUXppV0dWalVLZnFoaDR6YXdraC8rZHRoV002?=
 =?utf-8?B?ZGloNjNjRWFlWXFaOGZiWjdQT0VGbG1aSll0TlVtLzJac3h6UWpIUWgyY09h?=
 =?utf-8?B?UmxqRkU4UkRuWCtRTjdnUTRMNHJ0dlB1Vi9WczdheGFwUzd1TVdkWnBxcFpv?=
 =?utf-8?B?Y1lJRGFxaTdpdzdRQmxqZEM4MU8ybXJZYUlnQUFSTHdtVGFydWVYY3N2UGRh?=
 =?utf-8?B?cjhNWkRUeWoyaGlEZWZZSTg5c1Axeks0aG0zbXhNdEQrMVJRN1BhaGkvUHNp?=
 =?utf-8?B?eW9vaCt5OERwaE11ejRYRlA0cjN4NEFYZStwaTVHNEFFTXBSaVNxTUJvY2xo?=
 =?utf-8?B?dk56b0NvNlA0dUVMVkF0VFlmUkZpTWdkeWoxaFMwdjR3ZU1ObHdGUDNnb3ZB?=
 =?utf-8?B?djFDV05kZWUxOE1CQ0VwOGJjMUR2dlBUalUwWDhoM3NXV3JHN3lhV0IvWExj?=
 =?utf-8?B?UnB2dndqdXJMdGNkNHhOYXVoN0NYL0FBYkd5ODR1ZGNEb2MxMmR1aG9UeXJX?=
 =?utf-8?B?OFBwTWwrdzhtdmxhbzNISGJ5UDl5U3d0ZTRsWE5wc1dPc0xzcTdFM21UOVNs?=
 =?utf-8?B?M081d2Z5aGZMNjBXcTlSa2dHRmdnL1JEbmRXckRGbVlaS2V6bmZ5NEhBbFgv?=
 =?utf-8?B?YXM1NjF2V29aREZoZXlmRXgvOExpSENES2tLSkRHWlA2ZmUvbUFPWmppT2Vj?=
 =?utf-8?B?QnlVZWsvVk9uTDN5aDVxcDcvOTRSWmo0MXdHZVJtUEtsYlZnSnNSeFByLyty?=
 =?utf-8?B?Qktpb0RabXMybmt0RUNxaDFxQWJZTk5iUGxDVStEdWlSZ3dxWThBamxNZjZj?=
 =?utf-8?B?OWxpd3NjSW56SnVsclFUaUF6bkJqK25qTkxQTHRTNWo3aUhhd0xxb2dXQ0lw?=
 =?utf-8?B?VEd6WnM5TmdvQnVkNlhIajE1M3JoRjhVYUwwMzBqYzVFQXZnWXNqem1TSDVn?=
 =?utf-8?B?UllnZU52WW9zempHNXd2azFCaXRIRjVGRFdVeHRVOHpjMHdPUnZaY0xOZFdq?=
 =?utf-8?B?cEdhaXV1QU13aVRvMFZaY1l3SWpEMml0K25TMjRQWWpSdHltR1JqWWNwdlZK?=
 =?utf-8?B?Qi92bkhoOS8xZDI1M29XK0I5eWxybkp6VGFRY3VMSWtSUittbnNScHdtRzZx?=
 =?utf-8?B?aWVoQmEyZkdjNDJKeXZLZlM3MytsNzRIajZGVVh4enJhZ2ljVHNLQUtzMGRG?=
 =?utf-8?B?MWRDbWZ0NmhtZXB3REVvd3c0TzBDd0I2SnlOQ3hmeUYvMU1sNEhLbDkyV3Nx?=
 =?utf-8?B?K0dyNkRGdXlIMzNuUzBBcXMwU2xGcWU0ckcxMTl0MmZVSER0NXVyZDNMcXlh?=
 =?utf-8?B?ODdyWEU2R2pkKzB2dUh3MWU4dWM5K3l1WGFwRklRQUpOSGt3bE9vVmk4cTVV?=
 =?utf-8?B?NGo4UldzbU90ZHpFNmZRM3ZpSFBsYnI2S0xNL0xjQnJ2Uk8rYXVMV3czZjFI?=
 =?utf-8?B?NDE2a1VqSitPbDlQRGZGNUhYK3VwTEJLWnBnTnp5RFFGTE9TdGlSYzFGNlZo?=
 =?utf-8?B?eWczZExQZU5lMXQ5U0dyK01iNlp1bVRYZkJyR0dYNjQwOE1EdzI4NUhsbVpt?=
 =?utf-8?B?V1ZRZFdkc2IvS3ZWZlpPRG9sbWgzTUhmd3hBYkllaWFOWlk0NnJpdXJJdU13?=
 =?utf-8?B?M2MweGZMT2RhRE53dVE4ZWdYaisveW15UWNLVkIzUEZqM1BxQUFYVTNuRnZl?=
 =?utf-8?B?M202cGY4bXJVbDNvd2JYdy8yaDJ2Z2creW43dmVjZWptTnZYc1o3clVuc2t2?=
 =?utf-8?B?eHBBNlpnUFVJMFJqdndEdTA2ajVnQld5MlRlS1BjTWxFNDJRNFJzYlZ5djNF?=
 =?utf-8?B?UDlDcGROb2U0ZWNiZGhHbE15OWNrZXc3aTZuL1dEK1ByQ0VSS1g1ZGVNdWdL?=
 =?utf-8?B?RFV0YS9jc1pzUVEzTEdXdjJYczVDQS9HZUFKajN3YUhWZm1oMDdKN2hPdStZ?=
 =?utf-8?B?SXVhQXVLYWNxdmJXSEdhdTBvK1FidEYwcWVVUktybTVSQ01wQlRXNkRrc1BS?=
 =?utf-8?B?OWRmdUYrcTNKTUtWYXNReGliV2VtN1F1azNaVkRwdnZMTWI3YUlRaTEwRW1u?=
 =?utf-8?B?YjNTekNBOUl1VGV5RnJyVjZGSTlDcC9iczh5RTcvMThHWUpjTDNHOVNsWkY0?=
 =?utf-8?Q?8gOL0KWICGxlWjNy2xLGUHMfLm5qvReV96jhFAhgZEcQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8825.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0NjMjRQSExMbzMzWkg3a00wSk8zN0VGaEZaRmY1OU1ZNzRTREJLT3RaK1lY?=
 =?utf-8?B?clhGTUN2R0lJakZpR2RLYzBTNUdFZVMyOW92WUhONUxRNGkzemo0Q2NrSGV5?=
 =?utf-8?B?ZnZCVU9HRThwSXBrTGo5TGR0QUp2Q3MwSnR6ckprVXBxZDFMd0pWcXVKWDh5?=
 =?utf-8?B?ZWVjVEhSUzFuYytMR3R1bGIvMVNtbElacFNMank1MzN1RWp2NHNPaFEzbWFp?=
 =?utf-8?B?dGd4OWUvNUFLOVlXdE9FVk4xNGtsOCt6aVk1aFZPUnFENmxvUG5LMWgrTE1F?=
 =?utf-8?B?YktkQytxMmxjaDJUbHJZUWRKVnlWMi9JRkZoNzBjeHhiWXVnak9PaG95RlhV?=
 =?utf-8?B?cko3Tnk2amRWVWFCdTU5N0svazlCblpXWlJ3d1RGTjU1Nm4rb3YzUDBnUTFH?=
 =?utf-8?B?d2hoeCtwZWtHMlhJRkZjNlNLM3VoVXg1Q2JjNUFHNGFaNDNLTGg1SnlGcDln?=
 =?utf-8?B?QXBHT01sTDlHV0ZBeW1DUVpnZTc1T3dvWFJtOGZpaXp6WUtvYTR6TVlJZ29S?=
 =?utf-8?B?WUl4eVlLZWEvd0xVOWoxNzFheGx6SEQ4M3d1YmRyYXVYT211bWZRb0w2RkY3?=
 =?utf-8?B?VlVvVGJyQnNBbEFSYnRjVUtYQlhFQmc1SzZBNWMzNnhTODdxMUFnRXpuYndr?=
 =?utf-8?B?alRqZHh2cWh2R1F5OXdCUW1ZdytBYXdudkUyTTNYMEdHRi9KL2hXYnBzT2M4?=
 =?utf-8?B?a0JLVFZzb3UvN3pkSDJRT0NLaGJKOENKeXRVRitkTWxPVEpnYW1qUHBFRDJu?=
 =?utf-8?B?TitPMjB5V3VEdThBYXR4bGZPdDl3dWs4d2hMZVBRNGpiMEJaWkx1MWJ2RzZB?=
 =?utf-8?B?d2N4LzJNNklhdjVONHV1VWdhNmNSNWh3YnhTbWhycWIzc25QTlU0N0ZFTDZM?=
 =?utf-8?B?Ym83OTBTRG5iTmhuUTZrc0lVRW1VcmVDQWJ2MWxWNWpna0pnVTZzRHppMXV0?=
 =?utf-8?B?VHFlUG41dHVvM2drZ2ZvSjltWVBCM3BXaXlXUmFEOE9FbUNjRU9nQnNGL2Ir?=
 =?utf-8?B?MldJT1JVZ1laV24vaGh6WmE3WjFMRzVrNUQ2VENXTmhPMEdvdFpqUkZZVVJk?=
 =?utf-8?B?bjZQMzBTaFBMY1I3QkNGZ2ZpVGNLY0NiR1E0eWtFdHJaTk1zbE5zUGM2ZExV?=
 =?utf-8?B?ZGRENUwrdW9CUGpPRVNKQ0FkYmlFckxjZmlkVjJaSXYwTFlIOFY2aWl4cnJj?=
 =?utf-8?B?WHFKbXQ3YU51ZTlDSUMzem50d1BIWEpHcGJnYStqaGxEaHpBMjhoemRJczhj?=
 =?utf-8?B?cEZ6YWxMYmhYbi93ZGpPbWNZNWFsNFBBZzF4NFhYSjVEbVpmNjhvL3VNbmtp?=
 =?utf-8?B?UkhXMmVITHA1Q0xaOWIyTFBhcVYvNGtYQmx4UVorditxS2RiSS9yajRGZGdI?=
 =?utf-8?B?VUR1dkh5TkIwbHdtN0dNclBpQjRUelRBVzIyaTZYVmJLSFVSWjd2dktzRUFt?=
 =?utf-8?B?OGxqNkEzS1BDU3Q1eHFMUW1EUHdHd3k2L2xKWUZCcGtVcWp6Tjh2K3JQU25h?=
 =?utf-8?B?RG5XUzBOcGoyNVFvbGprbS9wRXYxOWhsam1tZ0NBOVMvMFJlRGdERlFaVXdO?=
 =?utf-8?B?RkxlbU1pbVRtZDZrVVdsNkIxbDZ4ZDJma1JNRnhoSTlYSHpxcWRZZU5HdCtV?=
 =?utf-8?B?V0FlcDhoQzBGK1VzejJoWlc0SU5KVVBzNUFTOHRrQ2J5bGNhREJZa0hPVDFH?=
 =?utf-8?B?a3BqZHQ4eUZJa0xhaUhNTW52U1BFRnkvVVpHbFdPaXRlay9WQnExNzZYQmlT?=
 =?utf-8?B?Z2drUWFPbHdlYk85aTdsak9XUFQrRlVadjFCQzgxK1BUY25YYW81aGpxa1B5?=
 =?utf-8?B?WURBYmYvbUNITG53enVEaU1UTzMwZDhWVVdiNldhTmtrYTFkOEVMSlkyNVZ1?=
 =?utf-8?B?NVZHRzVkVm5CNnJUdWdKNEtCUnMybk0zbHU4WmlNZE90bWJ5eDBQZlplQVZv?=
 =?utf-8?B?b2UreWpsRzhiTmJURklnaFFqY0tWQ0dXLzJPaVVneWtnbEZZZUI2SXprWE83?=
 =?utf-8?B?MCtjeWZIU1l3WWU3ZzFTNS94SHVTN1lLa0s5RVpEbGh0c25Xa1FST0VPUUdT?=
 =?utf-8?B?OFhpS2lSQ09kTytpcjk3UGFEdndqS1NzME8rekZXOVRRem5SWi9UVGo5QXNP?=
 =?utf-8?B?K29rYkY1UXZNcnFuTEFPZXJYTXQ5V2tDSm1iZlFTQ3dyek9wQTMwbVB5OG5Q?=
 =?utf-8?B?azVZeXg1YU5QUHZuN3pETUNkS1lndzNoZWdTbXhqZUZnZ3JPam5YcDhDeWpS?=
 =?utf-8?B?RXcwUmJoSjdOa3FZNzBzbmhvdEsydnVlTjdRMFhGb0ZyaFU3WkxsK2VQT1Jy?=
 =?utf-8?B?SkFkRWsxSG9nMEo2ckFwU0pUb3UzTXJhb1dNakFtRndsU0thYXNqZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed453bf-09f3-436c-05f0-08de62458eff
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8825.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 10:26:43.1710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FvE9v3/bAPazHUyunNBWW8xDKcYsj+h4Afsm+lN+uR76llmSAXmE+om6+Ua3gBSwaGNzgZDmjlUxqZLbi2ivyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8763
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32996-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,synopsys.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,i.mx:url]
X-Rspamd-Queue-Id: 5AE9DCAE84
X-Rspamd-Action: no action

To support flatten dwc3 devicetree model, introduce a new driver.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/dwc3/Kconfig    |  12 ++
 drivers/usb/dwc3/Makefile   |   1 +
 drivers/usb/dwc3/dwc3-imx.c | 428 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 441 insertions(+)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 240b15bc52cbd5d5c9d08d9fddd8c63202de1a3c..18169727a413ee72405a89f477e4da16946e1764 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -150,6 +150,18 @@ config USB_DWC3_IMX8MP
 	  functionality.
 	  Say 'Y' or 'M' if you have one such device.
 
+config USB_DWC3_IMX
+	tristate "NXP iMX Platform"
+	depends on OF && COMMON_CLK
+	depends on (ARCH_MXC && ARM64) || COMPILE_TEST
+	default USB_DWC3
+	help
+	  NXP iMX SoC use DesignWare Core IP for USB2/3
+	  functionality.
+	  This driver also handles the wakeup feature outside
+	  of DesignWare Core.
+	  Say 'Y' or 'M' if you have one such device.
+
 config USB_DWC3_XILINX
 	tristate "Xilinx Platforms"
 	depends on (ARCH_ZYNQMP || COMPILE_TEST) && OF
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index 073bef5309b5b5d381c8c4690221091b4df7904a..f37971197203e1379d554da9d60860360ea9c3fe 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_USB_DWC3_ST)		+= dwc3-st.o
 obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom.o
 obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom-legacy.o
 obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
+obj-$(CONFIG_USB_DWC3_IMX)		+= dwc3-imx.o
 obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
 obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
 obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
diff --git a/drivers/usb/dwc3/dwc3-imx.c b/drivers/usb/dwc3/dwc3-imx.c
new file mode 100644
index 0000000000000000000000000000000000000000..57b175e929d7e163df5af7e2265ab7117fa1dc9a
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-imx.c
@@ -0,0 +1,428 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dwc3-imx.c - NXP i.MX Soc USB3 Specific Glue layer
+ *
+ * Copyright 2026 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include "core.h"
+#include "glue.h"
+
+/* USB wakeup registers */
+#define USB_WAKEUP_CTRL			0x00
+
+/* Global wakeup interrupt enable, also used to clear interrupt */
+#define USB_WAKEUP_EN			BIT(31)
+/* Wakeup from connect or disconnect, only for superspeed */
+#define USB_WAKEUP_SS_CONN		BIT(5)
+/* 0 select vbus_valid, 1 select sessvld */
+#define USB_WAKEUP_VBUS_SRC_SESS_VAL	BIT(4)
+/* Enable signal for wake up from u3 state */
+#define USB_WAKEUP_U3_EN		BIT(3)
+/* Enable signal for wake up from id change */
+#define USB_WAKEUP_ID_EN		BIT(2)
+/* Enable signal for wake up from vbus change */
+#define	USB_WAKEUP_VBUS_EN		BIT(1)
+/* Enable signal for wake up from dp/dm change */
+#define USB_WAKEUP_DPDM_EN		BIT(0)
+
+#define USB_WAKEUP_EN_MASK		GENMASK(5, 0)
+
+/* USB glue registers */
+#define USB_CTRL0		0x00
+#define USB_CTRL1		0x04
+
+#define USB_CTRL0_PORTPWR_EN	BIT(12) /* 1 - PPC enabled (default) */
+#define USB_CTRL0_USB3_FIXED	BIT(22) /* 1 - USB3 permanent attached */
+#define USB_CTRL0_USB2_FIXED	BIT(23) /* 1 - USB2 permanent attached */
+
+#define USB_CTRL1_OC_POLARITY	BIT(16) /* 0 - HIGH / 1 - LOW */
+#define USB_CTRL1_PWR_POLARITY	BIT(17) /* 0 - HIGH / 1 - LOW */
+
+struct dwc3_imx {
+	struct dwc3	dwc;
+	struct device	*dev;
+	void __iomem	*blkctl_base;
+	void __iomem	*glue_base;
+	struct clk	*hsio_clk;
+	struct clk	*suspend_clk;
+	int		irq;
+	bool		pm_suspended;
+	bool		wakeup_pending;
+};
+
+#define to_dwc3_imx(d) container_of((d), struct dwc3_imx, dwc)
+
+static void dwc3_imx_configure_glue(struct dwc3_imx *dwc_imx)
+{
+	struct device *dev = dwc_imx->dev;
+	u32 value;
+
+	if (!dwc_imx->glue_base)
+		return;
+
+	value = readl(dwc_imx->glue_base + USB_CTRL0);
+
+	if (device_property_read_bool(dev, "fsl,permanently-attached"))
+		value |= (USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);
+	else
+		value &= ~(USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);
+
+	if (device_property_read_bool(dev, "fsl,disable-port-power-control"))
+		value &= ~(USB_CTRL0_PORTPWR_EN);
+	else
+		value |= USB_CTRL0_PORTPWR_EN;
+
+	writel(value, dwc_imx->glue_base + USB_CTRL0);
+
+	value = readl(dwc_imx->glue_base + USB_CTRL1);
+	if (device_property_read_bool(dev, "fsl,over-current-active-low"))
+		value |= USB_CTRL1_OC_POLARITY;
+	else
+		value &= ~USB_CTRL1_OC_POLARITY;
+
+	if (device_property_read_bool(dev, "fsl,power-active-low"))
+		value |= USB_CTRL1_PWR_POLARITY;
+	else
+		value &= ~USB_CTRL1_PWR_POLARITY;
+
+	writel(value, dwc_imx->glue_base + USB_CTRL1);
+}
+
+static void dwc3_imx_wakeup_enable(struct dwc3_imx *dwc_imx, pm_message_t msg)
+{
+	struct dwc3	*dwc = &dwc_imx->dwc;
+	u32		val;
+
+	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
+
+	if ((dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST) && dwc->xhci) {
+		val |= USB_WAKEUP_EN | USB_WAKEUP_DPDM_EN;
+		if (PMSG_IS_AUTO(msg))
+			val |= USB_WAKEUP_SS_CONN | USB_WAKEUP_U3_EN;
+	} else {
+		val |= USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
+		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
+	}
+
+	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
+}
+
+static void dwc3_imx_wakeup_disable(struct dwc3_imx *dwc_imx)
+{
+	u32	val;
+
+	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
+	val &= ~(USB_WAKEUP_EN | USB_WAKEUP_EN_MASK);
+	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
+}
+
+static irqreturn_t dwc3_imx_interrupt(int irq, void *data)
+{
+	struct dwc3_imx		*dwc_imx = data;
+	struct dwc3		*dwc = &dwc_imx->dwc;
+
+	if (!dwc_imx->pm_suspended)
+		return IRQ_HANDLED;
+
+	disable_irq_nosync(dwc_imx->irq);
+	dwc_imx->wakeup_pending = true;
+
+	if ((dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST) && dwc->xhci)
+		pm_runtime_resume(&dwc->xhci->dev);
+	else if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
+		pm_runtime_get(dwc->dev);
+
+	return IRQ_HANDLED;
+}
+
+static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
+{
+	if (role == USB_ROLE_HOST)
+		/*
+		 * For xhci host, we need disable dwc core auto
+		 * suspend, because during this auto suspend delay(5s),
+		 * xhci host RUN_STOP is cleared and wakeup is not
+		 * enabled, if device is inserted, xhci host can't
+		 * response the connection.
+		 */
+		pm_runtime_dont_use_autosuspend(dwc->dev);
+	else
+		pm_runtime_use_autosuspend(dwc->dev);
+}
+
+static struct dwc3_glue_ops dwc3_imx_glue_ops = {
+	.pre_set_role   = dwc3_imx_pre_set_role,
+};
+
+static const struct property_entry dwc3_imx_properties[] = {
+	PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk"),
+	PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk"),
+	{},
+};
+
+static const struct software_node dwc3_imx_swnode = {
+	.properties = dwc3_imx_properties,
+};
+
+static int dwc3_imx_probe(struct platform_device *pdev)
+{
+	struct device		*dev = &pdev->dev;
+	struct dwc3_imx		*dwc_imx;
+	struct dwc3		*dwc;
+	struct resource		*res;
+	const char		*irq_name;
+	struct dwc3_probe_data	probe_data = {};
+	int			ret, irq;
+
+	dwc_imx = devm_kzalloc(dev, sizeof(*dwc_imx), GFP_KERNEL);
+	if (!dwc_imx)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, dwc_imx);
+	dwc_imx->dev = dev;
+
+	dwc_imx->blkctl_base = devm_platform_ioremap_resource_byname(pdev, "blkctl");
+	if (IS_ERR(dwc_imx->blkctl_base))
+		return PTR_ERR(dwc_imx->blkctl_base);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "glue");
+	if (!res) {
+		dev_warn(dev, "Base address for glue layer missing\n");
+	} else {
+		dwc_imx->glue_base = devm_ioremap_resource(dev, res);
+		if (IS_ERR(dwc_imx->glue_base))
+			return PTR_ERR(dwc_imx->glue_base);
+	}
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
+	if (!res)
+		return dev_err_probe(dev, -ENODEV, "missing core memory resource\n");
+
+	dwc_imx->hsio_clk = devm_clk_get_enabled(dev, "hsio");
+	if (IS_ERR(dwc_imx->hsio_clk))
+		return dev_err_probe(dev, PTR_ERR(dwc_imx->hsio_clk),
+				     "Failed to get hsio clk\n");
+
+	dwc_imx->suspend_clk = devm_clk_get_enabled(dev, "suspend");
+	if (IS_ERR(dwc_imx->suspend_clk))
+		return dev_err_probe(dev, PTR_ERR(dwc_imx->suspend_clk),
+				     "Failed to get suspend clk\n");
+
+	irq = platform_get_irq_byname(pdev, "wakeup");
+	if (irq < 0)
+		return irq;
+	dwc_imx->irq = irq;
+
+	irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", dev_name(dev));
+	if (!irq_name)
+		return dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
+
+	ret = devm_request_threaded_irq(dev, irq, NULL, dwc3_imx_interrupt,
+					IRQF_ONESHOT, irq_name, dwc_imx);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request IRQ #%d\n", irq);
+
+	ret = device_add_software_node(dev, &dwc3_imx_swnode);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add software node\n");
+
+	dwc = &dwc_imx->dwc;
+	dwc->dev = dev;
+	dwc->glue_ops = &dwc3_imx_glue_ops;
+
+	probe_data.res = res;
+	probe_data.dwc = dwc;
+	probe_data.core_may_lose_power = true;
+
+	ret = dwc3_core_probe(&probe_data);
+	if (ret) {
+		device_remove_software_node(dev);
+		return ret;
+	}
+
+	device_set_wakeup_capable(dev, true);
+	return 0;
+}
+
+static void dwc3_imx_remove(struct platform_device *pdev)
+{
+	struct device	*dev = &pdev->dev;
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+
+	if (pm_runtime_resume_and_get(dev) < 0)
+		return;
+
+	dwc3_core_remove(dwc);
+	device_remove_software_node(dev);
+	pm_runtime_put_noidle(dev);
+}
+
+static void dwc3_imx_suspend(struct dwc3_imx *dwc_imx, pm_message_t msg)
+{
+	if (PMSG_IS_AUTO(msg) || device_may_wakeup(dwc_imx->dev))
+		dwc3_imx_wakeup_enable(dwc_imx, msg);
+	dwc_imx->pm_suspended = true;
+}
+
+static void dwc3_imx_resume(struct dwc3_imx *dwc_imx, pm_message_t msg)
+{
+	struct dwc3	*dwc = &dwc_imx->dwc;
+
+	dwc_imx->pm_suspended = false;
+	dwc3_imx_wakeup_disable(dwc_imx);
+
+	/* Upon power loss any previous configuration is lost, restore it */
+	dwc3_imx_configure_glue(dwc_imx);
+
+	if (dwc_imx->wakeup_pending) {
+		dwc_imx->wakeup_pending = false;
+		if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
+			pm_runtime_put_autosuspend(dwc->dev);
+		else
+			/*
+			 * Add wait for xhci switch from suspend
+			 * clock to normal clock to detect connection.
+			 */
+			usleep_range(9000, 10000);
+		enable_irq(dwc_imx->irq);
+	}
+}
+
+static int dwc3_imx_runtime_suspend(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	struct dwc3_imx	*dwc_imx = to_dwc3_imx(dwc);
+	int		ret;
+
+	dev_dbg(dev, "at %s\n", __func__);
+
+	ret = dwc3_runtime_suspend(dwc);
+	if (ret)
+		return ret;
+
+	dwc3_imx_suspend(dwc_imx, PMSG_AUTO_SUSPEND);
+	return 0;
+}
+
+static int dwc3_imx_runtime_resume(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	struct dwc3_imx	*dwc_imx = to_dwc3_imx(dwc);
+
+	dev_dbg(dev, "at %s\n", __func__);
+
+	dwc3_imx_resume(dwc_imx, PMSG_AUTO_RESUME);
+	return dwc3_runtime_resume(dwc);
+}
+
+static int dwc3_imx_runtime_idle(struct device *dev)
+{
+	return dwc3_runtime_idle(dev_get_drvdata(dev));
+}
+
+static int dwc3_imx_pm_suspend(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	struct dwc3_imx *dwc_imx = to_dwc3_imx(dwc);
+	int		ret;
+
+	dev_dbg(dev, "at %s\n", __func__);
+
+	ret = dwc3_pm_suspend(dwc);
+	if (ret)
+		return ret;
+
+	dwc3_imx_suspend(dwc_imx, PMSG_SUSPEND);
+
+	if (device_may_wakeup(dev)) {
+		enable_irq_wake(dwc_imx->irq);
+		if (device_is_compatible(dev, "fsl,imx95-dwc3"))
+			device_set_out_band_wakeup(dev);
+	} else {
+		clk_disable_unprepare(dwc_imx->suspend_clk);
+	}
+
+	clk_disable_unprepare(dwc_imx->hsio_clk);
+
+	return 0;
+}
+
+static int dwc3_imx_pm_resume(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	struct dwc3_imx *dwc_imx = to_dwc3_imx(dwc);
+	int		ret;
+
+	dev_dbg(dev, "at %s\n", __func__);
+
+	if (device_may_wakeup(dwc_imx->dev)) {
+		disable_irq_wake(dwc_imx->irq);
+	} else {
+		ret = clk_prepare_enable(dwc_imx->suspend_clk);
+		if (ret)
+			return ret;
+	}
+
+	ret = clk_prepare_enable(dwc_imx->hsio_clk);
+	if (ret) {
+		clk_disable_unprepare(dwc_imx->suspend_clk);
+		return ret;
+	}
+
+	dwc3_imx_resume(dwc_imx, PMSG_RESUME);
+
+	ret = dwc3_pm_resume(dwc);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void dwc3_imx_complete(struct device *dev)
+{
+	dwc3_pm_complete(dev_get_drvdata(dev));
+}
+
+static int dwc3_imx_prepare(struct device *dev)
+{
+	return dwc3_pm_prepare(dev_get_drvdata(dev));
+}
+
+static const struct dev_pm_ops dwc3_imx_dev_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(dwc3_imx_pm_suspend, dwc3_imx_pm_resume)
+	RUNTIME_PM_OPS(dwc3_imx_runtime_suspend, dwc3_imx_runtime_resume,
+		       dwc3_imx_runtime_idle)
+	.complete = pm_sleep_ptr(dwc3_imx_complete),
+	.prepare = pm_sleep_ptr(dwc3_imx_prepare),
+};
+
+static const struct of_device_id dwc3_imx_of_match[] = {
+	{ .compatible = "fsl,imx-dwc3", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, dwc3_imx_of_match);
+
+static struct platform_driver dwc3_imx_driver = {
+	.probe		= dwc3_imx_probe,
+	.remove		= dwc3_imx_remove,
+	.driver		= {
+		.name	= "imx-dwc3",
+		.pm	= pm_ptr(&dwc3_imx_dev_pm_ops),
+		.of_match_table	= dwc3_imx_of_match,
+	},
+};
+
+module_platform_driver(dwc3_imx_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("DesignWare USB3 i.MX Glue Layer");

-- 
2.34.1


