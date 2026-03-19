Return-Path: <linux-usb+bounces-35125-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA76C4rMu2mXogIAu9opvQ
	(envelope-from <linux-usb+bounces-35125-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 11:14:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 391D12C9521
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 11:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 01C9B30B4E32
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A25376BCA;
	Thu, 19 Mar 2026 09:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="f/SZs0iL"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010030.outbound.protection.outlook.com [52.101.69.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761A03750DC;
	Thu, 19 Mar 2026 09:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913627; cv=fail; b=sWD29pM+hllAsMceD1QR7MLuC3p0vARO1ot/bsiJITCcLL/LY8gBvilC6Rwt6Wpwe+WBPT/JCZzJEKJE302OSNAc1ejWYevG18yE8XMebF0TAz/CeW1ip0IJGXjlNJATNkpVFyUy9G+CFaGgIcBDmTBxBVHbWcAQTC4TAkO8Fic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913627; c=relaxed/simple;
	bh=Yxval7MrNCuIXs1lDfi5nqgh6oU2AJNYoQRmTDGKiWQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZkADIURNO17sOn51qOeIuc3UpZ3uXZzYrmUF+OdTBg4ScZ4qIr9hdOZAqDH7A/qZNx5j7uSBE58NWAPX/FW4GIyc8XQ3IDRBvneQiRXJTqcV03UEP5fnP3kO00GbmoB8PzJPhjw/FWHOQwsEc4KyFIsErRkB11k6Za4oifKoSRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=f/SZs0iL; arc=fail smtp.client-ip=52.101.69.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XoHwTIBFei6Bfk7tFYN61EjXEs4VDDVuOdt/JziUkS0Q6J4WBBYlmpm2OQg9sj4NX72+GfkSqhrbSbHGytV+HIBmr52CzTxRCdg1nbA5u33dH3syR62nFMKXCFp5mcmQJYul1nJ+QwoGA1Evf7XvuJTgeVDIHlX3W2ur7cqn4KDxiAs+1aXTv6G7aa2tSTYO0agBgCUeaYlNrtMFTH9v7QLlbi4RzN/z8fWiMl7vWKZAeeL1p+Yy/V+UerhxU8GgdUwTgww9y4aJHbMylpfqJQn0vQyB08uNu9NxsQN9W4TkD0qohNldOD2hxAAGCqzqPtXXTuPpBCzsYFNRBbD5bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jekD139htjxMzkZUhVBXpARN7EOrHdEjFYlYO++i6E=;
 b=sGo2oy9CT7/GqQM8d41tDGOTiYnCLTZlQHlTfyaqaxe4LYFt9THOFk8dMDpmyHLxZcuXF/E+6VKiOFHpnwDzKdcMwKVw2JZJ2oDKRFLOQUuC6Y9fqI5+eqPtYjUHDCdpMnZtGw5cy0asKNF7TQdIOxNK00LH3zQGyKDS5IQoD+Zsq3mKRWybG8/Um/bZCTVr+l3GRQrnuZPXU4De9A7NAiaU/vi5zwvftRO6kONtuTXgpQ9TdSgfx28GczLLCRP+JabWK2Uz9WCAcn9jrtFEdCmXZoJ237cJoUCK4XSOkWtpVk0rcodA92vovw+LUHKA3m40OVDUAqt+Uq1goFDUPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jekD139htjxMzkZUhVBXpARN7EOrHdEjFYlYO++i6E=;
 b=f/SZs0iLnhT+SA0NNEhSN/S0kbWnoy36DEBq/oY3enXyKheXH54ZxnyQmFEsacwriUX+OEf/te9s5CXOyIXWJgWlrz9fyqNd+acFJgnRqsRSOn49w9LW8BAvNn1e7oQhW/a1rK3m2yq1yZL4SGAU45FIXUGdAw6hVqjypUm22BzkoPPYn7tRhDFKGFB1T2Yxel1d/ueMiVExEFLILnXYDTBNs6Y5EpWQBpXl4Xw4FXajIfs45FAU++1KlWuCIHn1MoX/LSh74wws1jREKJ/ovDic+ebNcNv/WuRl74CVClKw23No8oU/GT4hRhHyvrpRcmjBlRyTj9tZOvnlZ+2RqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB10453.eurprd04.prod.outlook.com (2603:10a6:150:1d2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Thu, 19 Mar
 2026 09:46:59 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 09:46:51 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Thu, 19 Mar 2026 17:48:48 +0800
Subject: [PATCH v4 1/2] dt-bindings: usb: nxp,ptn5110: add optional
 orientation-gpios property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-support-setting-orientation-use-gpio-v4-1-ab6dfa8610c2@nxp.com>
References: <20260319-support-setting-orientation-use-gpio-v4-0-ab6dfa8610c2@nxp.com>
In-Reply-To: <20260319-support-setting-orientation-use-gpio-v4-0-ab6dfa8610c2@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Li Jun <jun.li@nxp.com>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773913749; l=1456;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=Yxval7MrNCuIXs1lDfi5nqgh6oU2AJNYoQRmTDGKiWQ=;
 b=DAHmRHfAeIMONUB2DYmNUhzJVLdhcB+h0D/24qvTjLlHdQoyvqHrDHdl9knrMI4HkJCiAvNyC
 K2DzFcKjKyDDajHIfMsaZP92rHfMSBBZKB5NfmMwtlaycYqBA8Ye2uQ
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
X-MS-Office365-Filtering-Correlation-Id: 28439a83-841a-4c4a-d77e-08de859c724f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|19092799006|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sSwsFDP9LNkF1Imzr6u8KGG/TdvXl6FhYPC7prufIXURIf9d+d4y4E08V+48b2DFcXsWLwYsKYfxA3oeeN5ZM4MQuA2Aaenv04UPaopstjun8M1ptXDnnJyNTF/jZU7Ny5TLTxsgvY5klkswbhTEtDUeLrGJvjWEF99yYczQwlCeDLJo/RGSBGNrHCEOy+IHzgtXMkemvHFEpxd98AF/76HksfgzP5axTJQGTeFOviycvnG9SPL7pjCksbAPKKSgMcjSm+JqdWYUU9iHb1SSSQIzJ2S8KM5AXMxMpnZ6HGBfkhBnmPBp+Wl/7yQtFZF/ju93CdvsXz3ztGI0ZGtHC0qUd13mh0UOGs3fidfGwkw+MXTe8bJoZhK5lAOkMY+B0QNFVJxRYqo6XBS1GeFEHBHYm6Vt00eAEqLMWkuSlB/7zxVEpDPcT9N3b8T4Dc+NwIDSs3gj0SV7FKUu4UDOR+pIC8NHTBw4N0Kj2RPi3g7yly3mSpbpseJOMcHXaciD1qs8tuKg9SxKfOTrpEld+hHq5oleCHEM0U9Z9lr0BZFzmwpxa1SoStxhH63UVO1pZeeSijGlwcl8IAMpki47KuI8Z6McBOD/R++jAgRcbUoUWmvV1/wQbZYQ7OKeNFet8csVGsZGxQL3Kc7CaGzGjIfj+TQT/Y4N/LsIIXe/R9MFqQ18wUBZD9uQvOf7/b9wliwTDApinGsvirPBORfGU8wDZURB9tYl4DdLqRFSctHDiSkaxWcFsd7trGQ8bm6luLDXtOvGdhoe0jK3/GMLUBHnR7AETucun055YMtxcRI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(19092799006)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWhZQWxVOFlZNENVL1U4Zzg0TXl0SnlRT2pERGtxRE04Z0RnbXdBTnl1Wmhk?=
 =?utf-8?B?SW9hcTlsOGJkdHVMd0JTQXkzZFRGTVBBSHhXL2xBSjhJUmNVK0JxV3hWaUlU?=
 =?utf-8?B?NGJpMG90NnBJdzlkUkFQcENZK1B5ekJFN1lFazdKbk04SWpDYnRFTG1PNWNQ?=
 =?utf-8?B?SGs4MjUyVU9wNERjVHJmNUw2cWJKL1doK29uZzU0dHNiNmVPcGUrd2JKRkRV?=
 =?utf-8?B?Ym5ib3N0WURBai9yQzZMb1c2QXZDZzBaRHI5MEtlcndLMXNZeEV5Y01xblZR?=
 =?utf-8?B?MGJta0ZzQjRiSUVRbC9OZURjb04xQktNWEJ4MndIb1hyU29CSTczdytyUEdI?=
 =?utf-8?B?Q3hPTlhjNkhmRGpZS0ZOUTBZYTBaQ2JQUFpXVXdzQTRVdkIzcjZrdk1xMlpU?=
 =?utf-8?B?YnMxUkJrZWRPc2Z0VTdWckJ6b2xQZEtpWUhFNVZKaExtVXRBTS9yUUpUVU5W?=
 =?utf-8?B?bUJndnU3YlAzZzIyQUhYdlNUQU5SMnNUOXV2cWs3czd4d0NHNW4xK3pnL0tl?=
 =?utf-8?B?L1h3MDVrM0Y1LzJXWVloTUphektaRU9VMXBranJSU2pNTUJNOUJHN0NQb2t6?=
 =?utf-8?B?czFaTHFkUTh6WXVPMDJBYXhFQWY1aE9yV1NqcWIzN3NDUDZtMjhRaXJYQUI3?=
 =?utf-8?B?NWdyaUtySytGNXRRek1SYnJzZXhSbGQ0YWVwVnVVaHJoa1hpQmVyNXZJanpl?=
 =?utf-8?B?OUw2YzdXcDVlcExPOXozclo4NFFJbXpQblpYNXlDUWN6Mk5rNHlwMUFuUVBX?=
 =?utf-8?B?NFdVMTBraCtqMXdRNU5DL2RXdU1ZVDNTR3VSRmFGSXJtWWtwa3l2OVZGbWty?=
 =?utf-8?B?WGMzMHNiblBvN1RPRzMwUDlzVmY3TjZIME0ySHdBVDRBSVdaQVBxbXdQZ2RE?=
 =?utf-8?B?TTE2VXRhejVmb3pSNW5FN0ZLWmJQQ0dseXp6ck53LzhEeVk3b05IS2o5WDdh?=
 =?utf-8?B?YTNDOHNqYnJ5RGxUVnhCcisyTGlIS0QyKzVpcWdVSVIzbGF4Nmw2RUVMcUs2?=
 =?utf-8?B?d0k2SWJPNS9oWDJjUk9LRXc0NlI0NUxVLzI0QnNHK2wwV0pHVkVTUDlPSWQ4?=
 =?utf-8?B?YTQwWmZBODk4Z2dmTFBPaVh6NmJVTUpLNjE3MTgxemJRNGMyUXVJMUl2VXEy?=
 =?utf-8?B?ZnJsUExPSmdHQ0JUNFJ5aWkvWFJFejFnNVI5QU5wTkFmL1huYjh1L0ExU3Z5?=
 =?utf-8?B?UnYwK2N3WXhnMnd3cWtNbXlKcGtuR3hwWjVSSUx0UU5xREFrbSs0NmxJZUJU?=
 =?utf-8?B?RXgyOUlBNjd1MGhkdGZYeUQ2NzUyOHRwaXVrbUpNb3N4RmhJL3ZtaE5VdEFK?=
 =?utf-8?B?dkhaOTk1UkNxZTlkTlRYbFZoam1DaTFmVmc4NzRzVlE5ZXA2TmlUclRxangr?=
 =?utf-8?B?UkhLVWRRdGtubExtV1BJM2VPdUtOYVNxdnZwaHloUC9Mck5kU1pSUUYwR2xD?=
 =?utf-8?B?eWozTENiRnNrbzFJbzVReGZxOGRJOVlsWmJqZ0xrdnFpQkFoVnAzVGV6WkdP?=
 =?utf-8?B?ZGNkM0ZYbzJ4aVh3UEVyMXd6Qm0xUjNXWlY3cFpWMEhNSk1jU1VHMWF2NDhu?=
 =?utf-8?B?bWQ4aU1XU1BQVmN3YVJBTG01bVlrRzZIVXpWMHp1dktRT2ExakhOUWtsalRC?=
 =?utf-8?B?NERxWS9pN2NLRjVHY3VlYXpQd21HbG1WcWYzV3pKb28rU1I4bXNsSG5Pckta?=
 =?utf-8?B?QXl6aDl0NnJXVlhqVGpueXR0SVdyTGtJMU9hN1lmUjg3c0NRT3NBTFlFZ1VI?=
 =?utf-8?B?aERsdjl1bENzQTJrU1Nhemcxci9MdzFzb0FIbWZxckJQb0g0aGxGdG52L0hj?=
 =?utf-8?B?OEhnTjAwcGVaYmgrbGdmQURxNjVHeDFxNE1xWG5DTmVwa3FvYlRuMHdRSm1S?=
 =?utf-8?B?OUlieXN3ZVl6WEN2dkM4QW5BdkpnUVVndjBvZjdocUYyaW1mNkwxQTRmMFQw?=
 =?utf-8?B?ODJUOTZTRGVhV3BjTmkzWmZvM0MvZkNJVndUOWkvWCtLOWNNOTlmbGNqdXFJ?=
 =?utf-8?B?YlcvL01CY1l1TlY0cXlJbmNNWFNrYWpTOXFvVy9FcjlSOHROZHJodlFqeTBy?=
 =?utf-8?B?Sk1LL053YVM3aUROUTJ4TzIwWlYzaUxoaGZLbDl4dXk3YUVtVWlzbXg5UGJw?=
 =?utf-8?B?REJicjVOblJCZy9YSERSWGNlVzYrK3FySjgyMGl6c2RFQWVqTW0xTHF5WnZZ?=
 =?utf-8?B?ZVlud1Zod1NLZTY5ZTFSTVk4NGFBZHNaYTk5dmw2T25YVHpNVEdJNVZacDJY?=
 =?utf-8?B?Tk10R2g3cVRIaHZyNXJJbzJHRUxQSTBwTkxMRVZFMUtnNFBLSHM3cW9rYjRy?=
 =?utf-8?B?OXJLZlRFWGNSTGMzbkZZTThnbzJ0YUUwek5lMEw2UmRLbVJDTGNmUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28439a83-841a-4c4a-d77e-08de859c724f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:46:51.4158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3S8OUFzCaJgjDaKs/EJuX/uCx8pkxtATW4KwRNziTswbGzPHMdXp2V6uzmBYjnOh0SPTp8+Ikw54GjbHbqPotw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10453
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-35125-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 391D12C9521
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Type-C chip know the cable orientation and then normally will set the
switch channel to correctly configure the data path. Some chips itself
support to output the control signal by indicating the capability in
bit[0] of STANDARD_OUTPUT_CAPABILITIES register and do it in
CONFIG_STANDARD_OUTPUT register. For PTN5110 which doesn't present this
capability currently there is no way to achieve the orientation setting.
Add an optional "orientation-gpios" property to achieve the same purpose.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v4:
 - no changes
Changes in v3:
 - add Rob's ack tag
Changes in v2:
 - use property name "orientation-gpios"
 - remove the "if" condition and modify commit message
---
 Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
index 65a8632b4d9e..581e5916eadd 100644
--- a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
+++ b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
@@ -26,6 +26,10 @@ properties:
     $ref: /schemas/connector/usb-connector.yaml#
     unevaluatedProperties: false
 
+  orientation-gpios:
+    maxItems: 1
+    description: Optional orientation select control
+
 required:
   - compatible
   - reg

-- 
2.34.1


