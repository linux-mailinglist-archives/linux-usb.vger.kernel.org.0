Return-Path: <linux-usb+bounces-32039-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0E0D01894
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 09:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A8AC30B06FD
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 08:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51CE361DD7;
	Thu,  8 Jan 2026 07:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BRiZQsaJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011003.outbound.protection.outlook.com [40.107.130.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A30361654;
	Thu,  8 Jan 2026 07:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767858131; cv=fail; b=Vjk8wb6WeC0uFsipv9lrnRS38v712YRXxPtkX68t/QxNCWdoUK2sI/P/6uH7LCzk6UDLP/fhzVL/SRzEHKrRBiy6YQOzgXdUfvioFru2rCqGdHonVrPj7xGevUaUxlDC3yAzn3McZYSZDnMJ0USiHvkGC4Q3Zu2sn4YpQo3WFrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767858131; c=relaxed/simple;
	bh=ATeKGa7AmYavW2AIkAzTUcCV08OC/tRKQYtN7hrAiZQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PotkL0OH6RQNdavDtTWe3GXZ95Z1e/BGmp+dsb3bUsZGQqlBz08RQBrvBMNVLktpGExWhDWMnhYsX93FucvRwfKNZBXYLj2nr8NGryBeG4TyMYa2TMqxzN5TSbMGRwugGG3uyuaizKft/+sPpbLYoVUatn+SLJ32UiAsZeFAqVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BRiZQsaJ; arc=fail smtp.client-ip=40.107.130.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMtkMfjrG+jhv//w6z+LboQlYSCguYCWNOzjI2dp+nB6MMvjVqzQyObvuOXSnJ1ApB8r//JOjn4IFnVV1COXFVNh6qjJDy8RMiudZgN3IF8TWEGTP0GHo2C6G+ZppyiC+I97b2R+1cE+wnbIQ3w3r/EycgDz8vgyPza+p9RtSdWfMfa7D/uwYr33yzp5xtmNFTZs4hyvYDOHADwVV0NQ9A759pOsNjvP9KayZ4nuzFRPEVET/HKZ/MsDkjK6VxQSPge1cX3VDkzkGixQaOcuzqKiFaut94Ob2z36rGnZvzysJtHBR+I/Ht6DLru4/eRIv+3s5/VwVlwFLParXEi+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FF1sBn/W+2/Ujq0wgVCzt7DCdBN4g1GE2rzCZzgsmk=;
 b=aG8L3MOYE5kmUMgqPLoOVX5d0C7Qrn90LRsLayZToNSvuU4fF26+e2CSMu896C56QDDMMJBI264d4UGDPs1NjL6Mn2HPyjac2bR6vpRa7U8L8m6Z+9K4VGQYE8DHR80+YHuJKHG5Kcspc+4r4F3ZEduxkUTmb6ku86aK6qoKcth6ztWfaC7Hc9b8quOmMMhMcfIF5lGkLK1wjde2MpjmVOhN3l9Ew8V97AGJRS3Yai+cU8HeMpv9oXWkiexN73ds5LtK072gqWPOXWh3dQ5/VfxyGHjWW+m5Gq+JviT+NWpY59GU4oIGLplMRItSlrNaszx0SG1CByh1vpLLQzH+VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FF1sBn/W+2/Ujq0wgVCzt7DCdBN4g1GE2rzCZzgsmk=;
 b=BRiZQsaJQ8U0DzDcyJWF7VKf5WevJSoygS4cf911GVsOq8wlxoJlz1z2MREgg4vNGnLsW83v1JisehatNJjfrEuzPBT8XqFiHUp9Y2aqpYfTXlA33dbqHSW4/NpDcaPUnrIFA8Xi/YBvBvE75CKazH1eq3tnlwN4Qn/KJ/YP1EZZHRvfUEsLVy2VOb++hSreK88lAeSylOOhjNxZoiEKY389ACUgZk+BkDTS8+l28gD4/jikm7sDEtpzNbqedKcCOpM4sQoDMrpkBf1uxws4mymzW50Y6Meeo0gQ7VHCkEOa4iMJ4YqqfXgsgNpnPw1beC5gE7ly75au/NVrPmxk+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI1PR04MB7197.eurprd04.prod.outlook.com (2603:10a6:800:129::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 07:41:57 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 07:41:57 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Thu, 08 Jan 2026 15:43:05 +0800
Subject: [PATCH 4/4] usb: gadget: uvc: retry vb2_reqbufs() with
 vb_vmalloc_memops if use_sg fail
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-uvc-gadget-fix-patch-v1-4-8b571e5033cc@nxp.com>
References: <20260108-uvc-gadget-fix-patch-v1-0-8b571e5033cc@nxp.com>
In-Reply-To: <20260108-uvc-gadget-fix-patch-v1-0-8b571e5033cc@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: jun.li@nxp.com, imx@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767858202; l=1522;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=ATeKGa7AmYavW2AIkAzTUcCV08OC/tRKQYtN7hrAiZQ=;
 b=2blEgpuCs850BX2UZLTMW7idSPTrBDapO0nZAy+4dc35pNzcAscaibupzG9P5UQJDKZ9zu+NL
 q544vkD+0smD38BTJHg8Qt472c38lLPXS5uY/MJXtQ/WTRu4rFSLsFT
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SG2PR06CA0201.apcprd06.prod.outlook.com (2603:1096:4:1::33)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI1PR04MB7197:EE_
X-MS-Office365-Filtering-Correlation-Id: 04914c8e-1215-4ec4-651f-08de4e896660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3hYTUwrV3MwSGNjU0sxZlJ0WUsvbG9WVWwwQ1dCdE45RmhybVZidDBCY3ox?=
 =?utf-8?B?eFoyNTNPL0JZR0JQcVRCMDcyYnNoN3JqV2ExQW0rSEtCY0tVbFhnVzd4S2Qv?=
 =?utf-8?B?bzc0cWsrYTVJa2xRUmFTTDN0eTMrS2Z0eGM3bG5EWWdtMHp2NTRkaXVUamNN?=
 =?utf-8?B?RVZwSHBRSU91Yjc4ZHhkRTQ3MFRLVTZ3bUtyT2N4eVhRdWFKQjJRMERWajhn?=
 =?utf-8?B?MWpIN1dwa3Y0TDVXa09VTy9XWDFHeDViZXhWR2NlRW5vVWQyUXdnNm9Ld3V4?=
 =?utf-8?B?SFlOMWYwbXd6RnNOTC82dURySEhYRC9oVVVVL2Q4bTgySW9DUmVJZUYrcUxp?=
 =?utf-8?B?ZnVrbU5jMzhwVjI1czh3SExhclUvcU8wbmRrQ0FoSFlGZGpIT1E3dm43MVVG?=
 =?utf-8?B?SWk5bjlHdG11V3ZHQWNHTlg5ek1uQkJGSGRzT3piRlovZjhMQ09aWktBWUNE?=
 =?utf-8?B?UWxGZTJqdGVEbmNkcXRnLzlLbDlJc1A2Q0EzY3o2NDJOeXBqVXNGM0FZYlFB?=
 =?utf-8?B?dkhNbEt5VHZvQzBUUm9aRUEzcHJhdGRhTTh2ZGVGNnBMQWNjUElJeDVheXZI?=
 =?utf-8?B?YTdNOG80YzB4UEpYb2s0b2hpV2t0Rk1naG8wbHdMVVJkTUlQMDdCb21FNWs3?=
 =?utf-8?B?enV5aVFWNmRySWF5MW5hRmF2UlR2RllSUXJQMHNoR0FYYW15MC9BQzhWMEVE?=
 =?utf-8?B?NTB5V1lnSXVWMkkyYkpvTVUvajJVWENpcnNvd005eFphQ1JNTWsvbUxBUkQy?=
 =?utf-8?B?eXM3UllvdkgyZEtVdXpzSHcrRUd3RkgrQ25jc0Q3d2crNmIzb2lua2VBYlNO?=
 =?utf-8?B?TEljcjd3WUdsVFJhY2JCektNeDdXQmNNcHB1NlVJUURkNVBNT0FYSXYwKzN4?=
 =?utf-8?B?ZkdaNnZHVUR1UGtGVzZXSncwZFc2RTh6b1Q0L3FvUEJnMGE5S2d5cnNDTllS?=
 =?utf-8?B?NFI3YW13SGFZRVhNNkhILzJvNjlaVk1xdHA0ZzZ0NGFCMEFkUzJINHY4aXIx?=
 =?utf-8?B?VVltbGV0bDFRMDJJcm9Xa1Y4ZEpTV0RTWndlbzFLeUpsWGJIeW5SSi9oaGdH?=
 =?utf-8?B?bWtjbVV6TE9MMVFEVks3dmpBN3BVZkRLbis3ZEhBbU83dXJKM2lqRlJ0Szh4?=
 =?utf-8?B?bUwzYi9pZHBUUWZ1UlMyR0hJWFJTNzVmendqOG10VkNidGdOSk0wV3ZMNi9H?=
 =?utf-8?B?TzhGUzMvandGeUNGQ2pLOWhwMmVwTlZlY0NzOGU4ZGIrRDExTDIwbFAwSkEv?=
 =?utf-8?B?aXZENTFqZHRGcXUzUEVXMXhTZ3BFNjk2czZtUDJxZ3Q1Uk9uQUEzOWRSanZy?=
 =?utf-8?B?bFBMcHFUYThrSm1VUkJ2d2Qyeit1ajRLckxLd0xJUXFxb0t5aHduM1BQTUpZ?=
 =?utf-8?B?RGg3SUNBWXBnVUk4RWF6VEFnc3prT3B1c2sxZ3FEemJvbWtwU01OWlNSb2hh?=
 =?utf-8?B?cS9iVzBQRVJkSTNJcm96OEd5N0J1YTgwa2NaV0xBWW9aOVRpMGlpdnd5RmNk?=
 =?utf-8?B?RFJMQUNVK082UWQ3RmNydk40TzAwai9YeXJnV2FqdkJJN0E5NTBCT240dmpx?=
 =?utf-8?B?UzJGYVJmcjVYMXRZM1pZZUQ5VW10eVF0ZGxMYmZNc1Z6cjFzYjl1dE9KNW1R?=
 =?utf-8?B?UUJXdUcxUVMvanFVcFphL0VBMzAyOWFXL1laRDdxYVdXckhuckFmRHZIaWhD?=
 =?utf-8?B?Vzh3dDJFeHZXbXg3Kzk1MDVBZEJ5TmYvZVNFMVlncnAvbllnakMxMVBIV3VM?=
 =?utf-8?B?Q2M5SjB5N29STlNINWVINU1QTmdNUlpJcWpYN245eHB0cHZGZHRLY1JvQkdy?=
 =?utf-8?B?Y2JoMUVIbVVtZS9yMkRDV1dPMldyWnQ0dW1rY1dMU3VtUzRtSmN2NG5uY2wz?=
 =?utf-8?B?ZW9RRUc1cytUeCtZY1R6dkk0OVlOak4wQlIwNit3YlRVMSt5L1NzazBIb3F3?=
 =?utf-8?B?VndZOUVBSWVpd2ZUdmRQRGxKN2xrbG5IUzJYeHhkK1B1OGRPOFg2aTRXallD?=
 =?utf-8?B?WUNxbTdiNlFDMWpyQ2NqZE0ycFEvZFBXTk9WVnQ3WGJhekJyOGZ3MDhQZzRw?=
 =?utf-8?Q?AkyxPH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHJnSDJJQTMwK250RElkSXhkMmI1dEF2eUEyckZaUDB1TFdlU3dDbWdyL3Yy?=
 =?utf-8?B?L0RzQnVqZGpma2JmWCtYdkFVUnNmL1R5bE1QU2JBTjdwa09NOEJnRGI0RFBC?=
 =?utf-8?B?dWZBeW9RSG1qbS9zNXhMWXZ6ZzBnZm9RRFNrT3F0ais3MG9EZ2NIQzg0UDRK?=
 =?utf-8?B?VXJoWjFzcjgzM3ZwM0N5VkRSVXgwa1M0SWdWMmRZMGJhcWZDaTNSQWZEVVFz?=
 =?utf-8?B?NXpxc2FNSVl3bG1YR0E4UVEzVk52SEIwZm9vek95Mmk5TGx5VzI5c3VPaHdx?=
 =?utf-8?B?dWM0cHNFVW1xZU5vTkFHR1hycWxZVVg0WTJ6cStjeHg5c1RTRnJnaXhITURZ?=
 =?utf-8?B?UzBrbTRHSWhmU3hmWGNNdm5NQkFsaSs2dDE1VnJ1VVFkN1IzZTYvMEJ6VFpl?=
 =?utf-8?B?bFRSYnYwZEluREtZNHZXWkR1Z3d3ZHRPZXpWTzdtTnlxNDVwVnc3UUlmTWJa?=
 =?utf-8?B?eDVmbmtDUWRFbWwxL0owQXNuMW8wb3pkaXJJcGV1VnlIRGlTQTM3S2lLaDBH?=
 =?utf-8?B?MTFWR01OSk1IVmRrZ0duYjZ5MW1ubVc1aEEzdzV5L0xmREgrRTY5UWpJd2NI?=
 =?utf-8?B?SmlEL2RpclN3TXIrOVNWMnJIcHEydHNiVDlTZFlLeXpzdGVZallSSzNUMDdG?=
 =?utf-8?B?eWpFenozWTNSVjJpdk5DcmU0RmVkRmZzb1ZBeFdobmxyYktZemZUeWM0ZDRU?=
 =?utf-8?B?d1JrSEFwbjlkSnRDdUlzbHdjWHJ2dS91Q3RkZFpLVnhxZzMzM3E4cmgyRFEy?=
 =?utf-8?B?ZXd1UWhsVVRLdllCT2xWdXhKYndQYkc3YlpkYXArZ0FPd003NjgvOVdaN2Nm?=
 =?utf-8?B?NUNFZFMyREo0L1JSelp1Y094ZmUrSVJtV0s1MXdCYi9LblVwaWxObmRaeXN3?=
 =?utf-8?B?MDlBSlQzZnBsM29vaGlnMFdvL2ZNQjBZV21GQnJkaS9vNVVCcTU2RFBObnZh?=
 =?utf-8?B?bHVhNHZhT2x5ZmZHdjI3Q0lMNE5MbW9ac3ZQcU56Y3lkZnpFWThVNWJVRVVU?=
 =?utf-8?B?a0dpVDlZL3FSbUVJaFFRVGlqY3hxMHNuUDB2dGZXOG9WZkJid0xVelMxQU1J?=
 =?utf-8?B?SXlEWFdUOVZRRkt0UndBOXhMY0ZDM0g4bGdDaElJenlLN3NBdlJZTWN4bFoy?=
 =?utf-8?B?cGh0ZVRHUi85N3BaQ1lhYVBFcUJKV0ZrcTFmcFk1dzJwZ3FUV3pzNUJGajA0?=
 =?utf-8?B?bEVXbVdLb21KZ0ZIQTRsb081cE1ybVJpbjhqeVo5bnRVbmc5YktUaC8vTDV4?=
 =?utf-8?B?UWRoKzZwaDVvWDRneUN5eWZMZS90bnRvOXBzMHIyTjJ6NW8wZGlCQlZVQjBL?=
 =?utf-8?B?TjZwSFhMbU5tenZiRG9SL3hXVUpWS2pLcFUrb29OaXdoc3ltelI0bDZWYi84?=
 =?utf-8?B?Smw4M2FLd1d5ZElqTU96SXBUMkF0WmdMNm9zRkpVRDh4bTBHNC91RVB3R01l?=
 =?utf-8?B?NnhWeU5RbCtPWUg5TktrdDd5aVYrcUR5cThzMUZxbmhLdFFDYVhoUmpzR1Vs?=
 =?utf-8?B?bFFyU1NPdTVrTjltdnl4cWpFcWxvMU1LeVY3WTVZZ3JlVUc3ajJmQUx1SWxa?=
 =?utf-8?B?OXdaQ01HK1pMU3ZoZVpuR2RMR3NOM2N6SXMzWXVabWhwUzZzTlBQSkFxMHNZ?=
 =?utf-8?B?M2FqWFZBT3d5V0NzYitJMFhhNkhFYkUyVFlnb2N3VjFHdU1qVUZkR29TaVN3?=
 =?utf-8?B?MnJNMzZDZUhQSjVuaEo4TWQzUFhJbjZnYmduRkVsbS9FTEQxQVdJdTMrVWg5?=
 =?utf-8?B?R0F2cGE2TEJoam1aSmREUmtDTEtLSGx4b3ZtdVNpOUFQZlpicWRPQjBqVUho?=
 =?utf-8?B?cndlTDNkSTBMM202N2QxVnNHMGVPb3pieVhOalhiVlViNkV5NzVuazFRSzlp?=
 =?utf-8?B?bG8rVDhOVUM2dy93TlB2VE02ZEtDc3BxVmZXQkN4K3hmVCtEWVRpbWRCSDJ1?=
 =?utf-8?B?eDFtNkJDVDhlamZEMmxBdWh1Q2tMYWVnZXRhMDkxM3BlSmlTMHNrUEppN1Mr?=
 =?utf-8?B?NlJ6b0ZuQlUzMHNwWEsrTm9NUlVxZ1NLdVJTeDBlakpTcnp1QkM0cEQ5cC9E?=
 =?utf-8?B?S3JKTnZLd05kd3F6Q3FnZ0NWMEZ2SzNOcGZoMEFjRlJ2NFRrUmJBNFY0Y0hv?=
 =?utf-8?B?TEsrck95WlZpVVZkemNidXIxTUIvcE16TGFmUVdodnRnK1VKa3puK3BUUXBB?=
 =?utf-8?B?OFN3RDJxUjVVcXdYRmN3VllXM1hvYUpEMmI1c3JqVlQ0czdLYjZ0VkdaakxP?=
 =?utf-8?B?NGVqeTh2S2xsMmhPMXBETUxmeGhXcDVwb3V6K2cvR1VWcGRWQmdzRFFZSzdL?=
 =?utf-8?B?d3lIWFQ5Y29WWjNkSmNWaU9DMnB6UUZ1bEhacE9TdENzazFMeWJtZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04914c8e-1215-4ec4-651f-08de4e896660
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 07:41:56.9656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZcRT9uN9EBEevCGfYM9XJ6EfiIHb9uVbH9pEIURlK3QSai1gox5PZpb5TYckMT0J7mq+JTgJwCrR3jQ264+aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7197

Based on the reality[1][2] that vb2_dma_sg_alloc() can't alloc buffer with
device DMA limits, those device will always get below error: "swiotlb
buffer is full (sz: 393216 bytes), total 65536 (slots), used 2358 (slots)"
and the uvc gadget function can't work at all.

The videobuf2-dma-sg.c driver doesn't has a formal improve about this issue
till now. To workaround the issue, lets retry vb2_reqbufs() with
vb_vmalloc_memops if it fails to allocate buffer with vb2_dma_sg_memops.

Link[1]: https://lore.kernel.org/linux-media/20230828075420.2009568-1-anle.pan@nxp.com/
Link[2]: https://lore.kernel.org/linux-media/20230914145812.12851-1-hui.fang@nxp.com/
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/gadget/function/uvc_queue.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
index 21d80322cb6148ed87eb77f453a1f1644e4923ae..586e5524c171f115d98af5dda43fb800466f46d2 100644
--- a/drivers/usb/gadget/function/uvc_queue.c
+++ b/drivers/usb/gadget/function/uvc_queue.c
@@ -182,7 +182,15 @@ int uvcg_alloc_buffers(struct uvc_video_queue *queue,
 {
 	int ret;
 
+retry:
 	ret = vb2_reqbufs(&queue->queue, rb);
+	if (ret < 0 && queue->use_sg) {
+		uvc_trace(UVC_TRACE_IOCTL,
+			  "failed to alloc buffer with sg enabled, try non-sg mode\n");
+		queue->use_sg = 0;
+		queue->queue.mem_ops = &vb2_vmalloc_memops;
+		goto retry;
+	}
 
 	return ret ? ret : rb->count;
 }

-- 
2.34.1


