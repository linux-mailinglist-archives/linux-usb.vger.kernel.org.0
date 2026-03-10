Return-Path: <linux-usb+bounces-34380-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCVWHXvSr2kfcgIAu9opvQ
	(envelope-from <linux-usb+bounces-34380-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 09:12:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 749B624712D
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 09:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 02FEA301EBFD
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 08:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9845B3EDAA1;
	Tue, 10 Mar 2026 08:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fR76prjU"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD4C329378;
	Tue, 10 Mar 2026 08:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130336; cv=fail; b=oXLxXCd3QQJp+F7vBvH/IwZaSyH3kD3aXcbwtf56/yd3d60psVM+KW8LR665V5rNMnU5uzraKK5XEtQqRS0mmLd69wsHVJEKJ0wVV+FuyT3G7DDSeLqngIzIY9LwjGuKePXsExKmPu6B1xVuXljsXM5LHnAdQj2dPzrR9skqVp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130336; c=relaxed/simple;
	bh=28FXWWEE9tBC8DNhGo5MCLxPFVS4T0/FS4OcGySdDZU=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=UshmiGy8x/qO1aQF/htgovF3vtk1zxjE2o6n/lcubsiBAKLGGp5R5h4gNqAlaCPn8xSaL1lKjYFKfCEw9RAffSTuV0Y+arIv7ROlDRxyG1uC9B8pKZjIZ0lFTKg9Y6R9haqMAFFp5pZL/kWPEHH9YKWva6W0NOpbIyVeK3USsLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fR76prjU; arc=fail smtp.client-ip=52.101.69.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxcEMKWtTpD8ibTzwEhkKk2ci1xwRkEf7nSzBvim/82+UZYO7XR5e0/6vLivl/pW8FX7KPWYpQB/zkQEoCHJwrYNldgWfBXPKMV+5fT6moCHzgevFCk64f6YQU1ECqKkZVOrn0OLcsjHg3retuKJIqOASoqSlImLUJa7sO77LxledobCZFDqDyls075SbJ3SCj102JKQgD+ntR5hQJlI4QEP0mC8t3MLk+1arhMIczZ04qHFrhm0bfjFevqFS3H+8I3fe2rSRwLl3qBJcpVv1zysn3T8kPmt6NFkBvpcg5zUBMgPCudQk83NjabijU7xcgM23fRUfiyLeO1LvjBTsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bY47x3c8BbgDxtDm4ZsWrDNxqmbhnve0gwSrZg5t9nw=;
 b=uw+6G3b3JwI26YyQzZt27DzzsRIGOrwxcqZyt/Yp+vvpQTweKb0/36qxKiF7uSruZyVcPfMAjEGgFYNgTuiQzmIlxEJiQfymaL0u+duSV33S4oYJ6wngCJkESQ9vA6A/5QJIEAyWfD9CGgd1RUiq4zUyg3PHZs9tXDFXh5LVsQgqZZGaACNUcYuReM68agw6D0lkjwlrE9p4pAmpLISFEbn1fIzP9lP8sjSVutM1pnjZlLDuKt0btMHhIFIo0mV6OQmE7v1U46RvQvD2BI/paMF48lkJH7hSWIA8rohb8ZQModDwgokGAajf4jWMRB/JI/PKKSC07EXSLzroTYt4Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bY47x3c8BbgDxtDm4ZsWrDNxqmbhnve0gwSrZg5t9nw=;
 b=fR76prjUUEl1sX0ncdg5E891hYU++kYhjz7jEP5KqSLmS3ybOmjfUgkXQKKVYlzOxWJUW2cnRydMJYwyd0LGkTFqciqQCJliRPLmrUn4AfNsdEBzxYZ89USCeNZk/tZE+4lwY1t0KkbUP4e8/3tq21OscTgfuujicz9bcTeErgbpyMsC8a2m3lI4fjocD2KuPZSmn6xgH9/c/HXz5zn4LAiQHVBgzz5BtAb7kYdWYBL4V8JqY0F614MGqPFrvrpzzqL8Bnco6qgRJ3taIMGVs4KfABSJBy9LQP8tf7STJ9S5zw4gRROQy9hQQGL2swVhl+xTOUdxVpEgom3I21SzCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB9471.eurprd04.prod.outlook.com (2603:10a6:102:2b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Tue, 10 Mar
 2026 08:12:11 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 08:12:11 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Subject: [PATCH 0/2] usb: typec: tcpci: support setting orientation via
 GPIO
Date: Tue, 10 Mar 2026 16:13:55 +0800
Message-Id: <20260310-support-setting-orientation-use-gpio-v1-0-da31dc6cd641@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMPSr2kC/x2NMQ6DMAwAv4I811IwbSX4CuoQwE29JFFsqkqIv
 9divOHuDlBuwgpTd0Djr6iU7NDfOlg/MSdG2ZyBAj3D0AfUvdbSDJXNJCcsrmeL5h7uypiqFHy
 Md9rGGBYiBk/Vxm/5XZv5dZ5/TQOkKXYAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773130459; l=704;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=28FXWWEE9tBC8DNhGo5MCLxPFVS4T0/FS4OcGySdDZU=;
 b=px1ykrA9CVusVAOV+vf3CaOPvydtx8/QiBFpLFBi9X2SNzVrjHxM4YbwibWZrxIy5Zx83zpgu
 3n1rgyWPtSVAtL9CH0fknY+9qSvhKZI1fpFE3I3mtDMWkH2OCCL4Wlu
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: MA5PR01CA0139.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::12) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAXPR04MB9471:EE_
X-MS-Office365-Filtering-Correlation-Id: cbf4d4e2-6683-4594-f313-08de7e7cbb30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	7/h+Qfq/ERFYi/Mn6+OxPIuEOn5uBNnLce6MiJboZONm589K1RuUJ/LOLW6/yPlRU/Rq/2wn1/hmuPdh7ZBlmurjxf/tzRL3PeyE0UQu7JbplsT+VsNTMXOvW1Z+uP5XyxSu9hLLOKhgVbVyweTbySbFM6yWjBewEP6bkYIX7HE9ZJVDrOvae1tVmc82nI7SirGlnNSLO6+llog3TZjxNGXbmVRkQBdNtNkg/86DD71RIfiXycnH+ijPdiG/kUkOC0qFQqRFGjKwk7gUqt5yMN1ILMWdCF2UEiuMS9GN9RCPUlCZLzUvWiVwMoEGcJzenZ+E1Pz7Qtak0ZZl8LhBY+ZrbhycsUTf4tV7EJyJ9VzPh7zt6UHKUlIo/Wf2ayC9uCzjcQcxKPoiHPnl/sCUIuMR5fvZr8+vBq2W0F8iKodHSUqzLl7bZeIxTJVvyRC1MIwcEXRxyRDXYzkQF8os2KtaZrKYYMFRCZlxN3IZ1O0NrORo2PLhbSBk8qig/cD1DOvYWRpx+eEI2dhon7wEuLFW8f1VpVTp7rqgyGMDrMB1hA4dwuzQq++3kkxLz1k5pJKHdsWm9RESr5W5GNtBLns+LjtTowYN5mifdEkspEqRfjydoivhqjg9TSG8+/qtHODerG3FXcejh7a0hi+pzSEro9x/PreCSEXLveLMP73kqeEruL+pwLScXPCSMQXRa3/18sQTrEr9mrazyul+fzMK/alpsvReXmke36QFvo9OsqBcYxeoih8kQ5MJ2tR5rp2F9lr2i3KhCBVFZ4/P3/mn6lp4EDs9dI9vlxbSKeA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHB1ZHF2bmRQTHJkditPVjdNYlJjWjJUeFIvZkxUckgvQzgwVlVQa1JrbjRi?=
 =?utf-8?B?N2cyMmpnQ2VRRW1kT25nT0VBQWUvdFk4RnFUMUYzeHBxeEdwL0hhN1R0T2RH?=
 =?utf-8?B?dUNoSUxrbmNuc3dPbmxtK210TzdNZjkzQVBXWmk5M3VNbkFSN0Yzc0ttQjVB?=
 =?utf-8?B?MXBHTjIrMVAvaVlyWXdlMXJ3aVRCelpzYTFFbkk5MWdubDlSNCtLemtTR3BS?=
 =?utf-8?B?TE5QSEsvbXg3bmZ0UHlZWWdsVkM0anJLVDZOSWRuaVUvSTZ4aHRGdXd2dGZX?=
 =?utf-8?B?ays1akExQzZ3ZW9ScEZQdjQ0Z2xoVW0vSlJGQVZZQXJOeU9nbjVWV2V4YW9w?=
 =?utf-8?B?TGRybkVNMW9lZzNMVjRWb282NE1ybVZheW85UmU2NnVMcmg5QjV2d0ZSRUdq?=
 =?utf-8?B?Q25ENW5DNWl3UFY0QnFpZGZXYkdabUUwY0h4SzFWajFzakdpSW5EYVQ1dnlo?=
 =?utf-8?B?WnFOWmFqc3BrYW8xYks5a3F0NkVyRkhzaG5UOVZzOFBhSlpGbG9NV1dSSTRo?=
 =?utf-8?B?WDVORlJvc1hSYUJ3eGpqTkhjMHRCREpMQWJLdGE0TFhXRlc5MFUwM3hHRDZn?=
 =?utf-8?B?UnFwQ01iVGNYckZEbUxYNEF2Z29yd2JmTkFjVmZ3K3NDM3ovcW90UlRVaUFv?=
 =?utf-8?B?RGxwWEpma1pPbE0vdTlYU3Fqakhib1RqYTRrOEkyQVJyRkhlaUxUT2w0Tzlw?=
 =?utf-8?B?ZVNlcHRVU0dobXJDVzNjblRkSDdpNlVodlVmUTBqSWdReFJXd1RuWW1DZ2N5?=
 =?utf-8?B?Rk12L0hYQjRLQXNUbzRkcHROUVVjRFoxTzFJc1ZFb1RxRmw5VzBTU25odzJw?=
 =?utf-8?B?eis0cnZlTElEUzlYVXFEVnRCTFFzeWtUR2pjelplTkxlQzZ1WnYwVmtHcEpn?=
 =?utf-8?B?NTBxa1k2U0dMcjZoWERVRVBoU1EyemMyQWI0TTVLbTdKRW5XMDdwZVJDTkxX?=
 =?utf-8?B?dEtGTTVLQ3pPcE96Q0tXM1JHZEZpN1JoVzFWbUE0YUlJTzZLVHJ3ZnFQUXh5?=
 =?utf-8?B?UExDODkxcmdLK0lqN1NPWmFXN09QVkw0SXB4K3Z4d2ZLOFBVTktrSnY4NU5o?=
 =?utf-8?B?c0R2YnhTL3pVVHhEaVR4Kzh1TnROUjdzWWlIWkRMQlovb2JyMG1NZk9GWkM2?=
 =?utf-8?B?dC9ITWRCc2ZTRE9DUDR0MXNsbTlsMHo1aGVJOUwySHZZVlBhcmtQd0g2V29w?=
 =?utf-8?B?aTdRWm1TcjJHa2pMZDU5NTlRTlR6dWQvdmZEUHlPUE1rOGlIcE91ZzVHNlZz?=
 =?utf-8?B?c0hjT1pZZUlHTm50eklRTW5aQTFsb0ZpVk1yZk9MSHNRdVBwenZISk9HRzFr?=
 =?utf-8?B?eHZ6NFNadkVlUWs1M215UlBzU2tNdCt3cnd4UnM0MEdhV2ppQ2d6UWhvT2xY?=
 =?utf-8?B?WE0rNS9xNUpzR3MrazZ1TDJhMWFLNXVXRFRQSnB5TUdjUWFMODFUdXpuRlVN?=
 =?utf-8?B?ZlB5YThHbUQ0OWM1YzNqL3JzdUNYYkt1cEUvVG5NMXhEakwrQ2Fld0dQOGNs?=
 =?utf-8?B?MzNsVmlLTzhoVVNyTGFhK1lwYlo1MjljNFovNjNENlFMMllrYmRhYmRnYWVC?=
 =?utf-8?B?TmhXakZoWjVCTWV0ZGJDTnl0Q3BseUJVbW9sUGFmVVcwa2ZaMk4vTGk2aXRZ?=
 =?utf-8?B?U2cxOHFWRkk1ZnR6R1l4QytCVzVoVHVEY0FBRGNBbXIxdkFlNXVTb1Q0Um5l?=
 =?utf-8?B?UmpFdkdwM2FUYmxmbVJEWTJ2YXNzZHU1WmdqR1dxTzd0ZllFZ09QTzdVL01u?=
 =?utf-8?B?UWdrYTNsOXZBbHZMcTUyWm82bnRLcjUzeWtZeis4NXBtUjMybC9qQllLWWwy?=
 =?utf-8?B?d0U3YllYbTF4M093bERlcGY0TTBoOENIMUJ2N0xQdEJ6SWFpSkxpMUVoRlpC?=
 =?utf-8?B?QWhnTXpSaytzMzJUOUhxTkUrbS96dXMrMXRUQWtQaXJMVnZqMENJTUZ4Ukll?=
 =?utf-8?B?V05iU2NsRGVvZmw0UVNRM2dqVXRrWnluQlNwdHQ0RHJicGliSUVPS0d3cDBR?=
 =?utf-8?B?M3JlMGJNd1JBTDY5NlMxcVovVkcxNW80bmZXWUxwRWRnamNGRkxNOWkxT0tH?=
 =?utf-8?B?Q09nNUZPSUN6TEF0Z2x1OWttaG4veTk4ak8vL0lBSmNEN0Y0MloxTmgybmV2?=
 =?utf-8?B?SmgySUpZNWFnblVHMGovWkhDcjAvREZUeWNpbTRJNVlKaHVYTktpeDdKNkpM?=
 =?utf-8?B?aENSYjNodEliM3VqbkpJR2x3dVVlR0U5dVlZV05IcHdNS0xpWW5VRFdWSzdt?=
 =?utf-8?B?NmY5WTBiL3ZvUmdTdkFVeUphbEZBN0tRcTNDVjdVRHVpeVJ2L09nRHdCa05l?=
 =?utf-8?B?cE40RGZvakh6aWNSdHAxTjRWcTNxN1A0SzBNajJxYzNLY1lvZFBjZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf4d4e2-6683-4594-f313-08de7e7cbb30
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 08:12:11.6156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnhFyU4ekysPkl1n8iRxbrKs6h4l1W/QSaT9SD6K13i/TgWatywxkjJ71WjR+DDAzHUJWcmW9ilHrJP62201Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9471
X-Rspamd-Queue-Id: 749B624712D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-34380-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

This patchset will add support to set orientation via a simple GPIO in
case the tcpci compatible chip doesn't present "Connection Orientation"
standard output capability.

---
Xu Yang (2):
      dt-bindings: usb: nxp,ptn5110: add optional orientation-gpio property
      usb: typec: tcpci: support setting orientation via GPIO

 Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml |  5 +++++
 drivers/usb/typec/tcpm/tcpci.c                         | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)
---
base-commit: bb375c251ab40bdbc5272008fcf2bc6cd5266610
change-id: 20260310-support-setting-orientation-use-gpio-5942d9a0b22e

Best regards,
-- 
Xu Yang <xu.yang_2@nxp.com>


