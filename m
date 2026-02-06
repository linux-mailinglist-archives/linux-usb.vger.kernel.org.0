Return-Path: <linux-usb+bounces-33136-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULYtJojAhWnEFwQAu9opvQ
	(envelope-from <linux-usb+bounces-33136-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 11:20:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA517FC987
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 11:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A0D830A62D1
	for <lists+linux-usb@lfdr.de>; Fri,  6 Feb 2026 10:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973FB36EA80;
	Fri,  6 Feb 2026 10:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Sx70BfRl"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013047.outbound.protection.outlook.com [40.107.159.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B678B30FC39;
	Fri,  6 Feb 2026 10:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770373056; cv=fail; b=EXypcA/Lxyu9i4ZC7x0V28a9Ddyn2TVCqW9SvQnmPZg1nOcoC8OJuXyUQTkeUk/0CTR0RlmAzHuu8gjB/3Rgu6FkaSezvOl+DvPclC2z2dvmx6CmojFsEwlCSaCqR3u9Xpqi68ouGPvgiRhuCdZTeCMXMqzAgJJFlRpOL3gifc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770373056; c=relaxed/simple;
	bh=4ErinY0mGCOtLLx6IA+7AbimNJ2WIJaqipBr9YwNc/E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=R76yha9yfworkMcJy+VScY0CnxbN8IFpBEQDVzRlMjHwFmC77JPvsZTJUcQQd3kiM/8jcNU9lgyT0Rny7SEhWUdAkkM1nBwMULVXLUydXgu6DT4aV3NwpTg7/OdFKdcPlhW5ga2tDaoQIka8OuC1SKJFcumZ4EtKWK4k+WSaj14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Sx70BfRl; arc=fail smtp.client-ip=40.107.159.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HykUQGI050cQWoOIMjfIcxbaASGguQTj0CdDPWd63G61nqxuBd8R1Wtk5JzXIPfdYdseuCL9KES2p6vKoKJh/toicCxO4nSiOAheOTYfmg5oyVJpZKa7jN7S68oqkkSpWdeSdp8hF0CMpOTDpd5vG0H49xfdTyAAe6f8LI1Y0KCcRSvvmdZxFgI/zqibkTR9q6smiARH79GeyxTLaK4KLVZ+4v0GNxJcZ3e+vzYdd02z+8LJ4M98SXgcg1wTftuzQr/7xy/JUcgnSrgoCblzqwoBdQGXC2JuCqA/JPPqbK10sZwqUc6WrC/HUjhRVrEhYb7IurTOSpCRYuKYHRUM3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKnOzUla/12Q8Z6GkCKrHqwS8LQdBDqmLbaDr+6PHCU=;
 b=mz+Nv0Jnp7Ef+6qqK9RDaCLlk8Ui4o6Ji5JLmYN5WYR+xiTKdcZOnhDrsxCDOV5rEjJKaJ0f2Wrqo3NVAPG24MJHVplELbabkbPWW34o8A2I1U4u+ccCrt2J/V298byThBmeDi+r8aRjaDUjvnZ3Bo60sVvs9gtZkK4vr662o+kpbGoqudMiYyq/XbEl6IP5PlAPtXYecASHmz4IHA6DxZHux1/F8Tux1nTt1jmuqUTGiRW03qSJdtGFnhy+pxtyV56rOBQI3fYYckHh5doQ8eoOGnP0CWErKFdio2BkUga6pAvQqotFEKuDtexSfyJQpQTQKm1O0ccKsx5UfbSJNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKnOzUla/12Q8Z6GkCKrHqwS8LQdBDqmLbaDr+6PHCU=;
 b=Sx70BfRlnmVi8y+2Pb0vRGE1klX29jQIugdlLzSAQqkURTYLX3GgZExgtyBR0u9XvJRLDcX7FG5qVrsnX+Zg4sLJeGWqHivCWSHd7slIFDMkVRLpeq1PA4etmTLdwoM9m2NvvAwq/kiIl5LXxfQD9D3utx/OstjyxJ8nuJerAudUQ6tS0Zhnk5LKXOX9pAsb8vUcYuTaO5hukiXNvUc0VytgG4kkzZ1yjKQvmzUwqBL0BfQGgJSZsZX9cblJHhgopxEwc35O/AaxzXvOJx5KoYyti8vN1eYAFzwnbdmECEdi4OSCJmicjvZdwwynXRKpYx4k2OJy/a3AJV4qi2HtPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AS1PR04MB9477.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 10:17:30 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 10:17:30 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Fri, 06 Feb 2026 18:18:51 +0800
Subject: [PATCH v3 3/3] usb: dwc3: introduce flatten model driver of i.MX
 Soc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-3-ebd9b9b77049@nxp.com>
References: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-0-ebd9b9b77049@nxp.com>
In-Reply-To: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-0-ebd9b9b77049@nxp.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770373141; l=14565;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=4ErinY0mGCOtLLx6IA+7AbimNJ2WIJaqipBr9YwNc/E=;
 b=GXnywtjoawxWdguGzXpDi/hnuRRzhD1k3FlqO7jU4gkus/83n8FkK0wBCEsPbq/9AUZybTtHG
 FE25r8rcCyBBzjyNmJcAyOXSUlDzy0i7BK4/YM0MK88z1OWcKl3YrIy
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SG2PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:3:17::23) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AS1PR04MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: 04734f44-f466-4c41-4993-08de6568efb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amNrMDg4QkRtQm9OSGlGeUl1OGlVdFFqemFySUVzN01ZMU02TVJsVTdqcThr?=
 =?utf-8?B?N1hzcGJiMVltdWh2eVFOdmFvb3ROUlUzcUI3T0o0LzFWN29udSszcEpMeXND?=
 =?utf-8?B?dHdkRzhKeGladHJhaFhRSUFVVmw2QVRkSHZXSmVaRE9JU3pkR0RPandQZkRY?=
 =?utf-8?B?VmtZR0VCQVRrK2luRmk4dGxBdWlGeldYdS95eElBYXRUeHhjSFQ1em9yV1J3?=
 =?utf-8?B?Ny95Q3pKWHJ6eHZ4S2xEVG9lRmJNK01DSzg3SWloVnNuTkVqMDZhak5EZ0RU?=
 =?utf-8?B?dDBqaVdYVzFBc0FsSDFqRlFtSDIzbFcrbStsSllVT0xvaTArNjdMQ2Y1TEpQ?=
 =?utf-8?B?YXFheFFBbWo2VWRYRUhmZmVsMHpSenpaWTFranNWanQrNWhHZ0pBaHBrdmxn?=
 =?utf-8?B?WHhhN3hodzh3MU9yUWFFQkZuZGMvWDN4M1REUnlQWUFnNytMbjZIMW9ub0Qv?=
 =?utf-8?B?WjVuYmM4NXpVVGF5VDdBemoyVGpkU3dqZEtJSHQ1RjhIM28zK2lXZGN0UUpD?=
 =?utf-8?B?eFdodmxoRXFQU1lYaUxFa05yQjM0bEZuUFN4SGpseTZWSVNNZXFWTzVzVWxx?=
 =?utf-8?B?eUttaThqOUp0d20yaFhBWW9MOEpvL1dabWQrTFhRazlnN2FxZEE5NDNHcE12?=
 =?utf-8?B?VmFZcktqUzdaNlpaMnlYMW1IOWgzQVB6OXM1bFVTdUc4L2VNbFRrcWltYTJN?=
 =?utf-8?B?WjVPdENuNm40Z2R5U3RYNHMycWw2ZDRsVUYrU0NJQkdTTXpVRXRtcTV5WTha?=
 =?utf-8?B?dXY3dzNEd01MK3o4MXZzWFdtb1ZBQjA5eFNDV3I1bDd2VVlKS2hzVXcyUG9V?=
 =?utf-8?B?T052bkQ2OEZ6WWtQNzhxZWU1VnZjQWlJcHB3azYvZkU4Y0RlY0dRQkZTL1k1?=
 =?utf-8?B?b2hwUVVuMlcwWlJTbHRSeVR6RnZkT29NYWlUYU5YNDEzWmFiQ1B6M1VQbkQr?=
 =?utf-8?B?b1FVMWlwZzg4b2ZENWRDZVAydm40RXhnaFVEMXg0bEhRdldMbGJaUkU2YkhW?=
 =?utf-8?B?Nm9RRVBCdUJwN09xTG5IYUMwb0YzRm5ZbWZPTWtIbllXTWFIR1ptZTJ6eU1T?=
 =?utf-8?B?NG5NTm9PMGd5US8zNDBzYWNac1BXSkNUaGdQYmxkYU4rcWtlRVQrUitDOHVz?=
 =?utf-8?B?ZEo4Rk0weHYvM1B6TWNsZHk0YmtjWGo2amoxdkpRK2xrTGpHZ2Fpcyttb2pI?=
 =?utf-8?B?WUFvSThxVXNNNjJxNGsrYUJKVHlSUnFIQzMyRlNZTDU4akZibTZZQ1lPMW9G?=
 =?utf-8?B?QjNnYmRWZHVteG15M0hiS3JiRG1VUzZBRHpOaEl2YXpwZjVUOGszMGwvQ3hW?=
 =?utf-8?B?aThPRnJoU29neXhCZCtCMVFPK3hJNzhiSGZmUlNHNWY4NEhCTWhaMUZVYUFS?=
 =?utf-8?B?WXVpYWQ4MGN4aUhIM3NsaWcyZVJGblk1TU1rTUxoMnNMYmgvdjBhOGJWam01?=
 =?utf-8?B?bFFkd2xYMlpQaWREdUxhbGhGejhQbldBRHNJbE1aSTNPTFdKYStackp5VUNo?=
 =?utf-8?B?ZGwxdW01NEt1QUtJNHdGUEhGalV3TnE5SGZueXZ6dnJqSytlbjFiSFJSOGRu?=
 =?utf-8?B?L2FsdWgxN1pEZzhKSzAwU1kxdnc2a2tlYXBGMlhUWHloVG5RSktkcjVybVB5?=
 =?utf-8?B?Q0I3cTBkNHp0RGJjckhRNFB5U0RLZ3hRQ0xQZklUNTIrTzVORERqM3BsTFA2?=
 =?utf-8?B?YUNFTGNQRUYrWWdMKzg1ait6UUNzL0JRbXQ5eFpWeERtNE5COTBqeXVwNGhF?=
 =?utf-8?B?c0xYajN5eVRPZWxIZU14bTV1R2lmYlhOdzRjOUdoeCtna2cybXMxYzVpYkNv?=
 =?utf-8?B?VmtudUFWblFNWGd2QlRPN3lJc1hUd05QdE12QVlIL2lqVTR6VzkzSzd2WXUy?=
 =?utf-8?B?a2VFekx0UGpNaDdoRGFQNjJybm5SNXJmeWd0NjdCaTFheUZIWnpFRGNQWUxE?=
 =?utf-8?B?U20wbzhGOCtLOEFXeTdFeW44UGphZ2dZZmxpTzhRUUUydElXbERSbmlUdm42?=
 =?utf-8?B?ZWJzTThuZ1JiTmFid1ZuU0wyRWFYK0g4MEx1NUQ3THFBSE42V2psL0RtcGtT?=
 =?utf-8?B?YTI0OVNwcFd0V2xzTDlRNnM0SUdmb1NvVTJEdG1hY3B5UzVFSzUrVEpSL25p?=
 =?utf-8?B?NHlKT2VzVGF4Y082NDZKOEFWL2d3UXlzTTF0MTh4UjN5d3FKbUY3TndVOVB2?=
 =?utf-8?Q?E2KTqAJfE1Sh6DQFUAEdp6NgMQKTr0ywTFn1jj5vCHIM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzhWa1lVOUtHZXozbThqSm5WdmQvbkVzU1djM2RSMUoyUit3YlhkU1BHQURW?=
 =?utf-8?B?bGlRMGxIWTczVkJ2ZU85TWRDbThpTVRqT1lXZWRyK1JLdGxzYkFBbFRiOGlW?=
 =?utf-8?B?T2tpUmR0MzBWemxnRmtoR29tOWNlUzJ2Q1Vjb0FRMnlqTmEyamo2QVAxUjI3?=
 =?utf-8?B?cmNVMTdwMGJ5VGMyWFYyMllzRHdYODM2WUNqMmIrNU8wakswbG1NYnhvVXR2?=
 =?utf-8?B?MXJYL1dYZEN1SjdCeGM2OWl4YVZ4Vm1mTHA5Nk11RllMSGE4OG1MWmFXMURs?=
 =?utf-8?B?ZHlCZjRsMmxSb0gxME9jcEtPelFFVjhQR3BUem1zc1VvSE1FR0NDQzhSVlJM?=
 =?utf-8?B?bW8vdFN3eTF6UHVZTlM3U3lWM1FCSmoraUJsaUFTSnNWVW9iUmUvQ0lRaWdm?=
 =?utf-8?B?L1JHOStLYmJnOGlxc1NqUDhXOHJsYVp0OWd1TWM5NnlrUmR4K0N4UjY4ekRR?=
 =?utf-8?B?WG5pZXR0YlhoMzdzQXFFK3FTbzVuVnByNWtpK3RHRHJpbWFGVTBxVWlDWjlP?=
 =?utf-8?B?ZGF1cmNSRXlMWTlodWdsYUFiOW1GcjhyZVRqemVhUWNzUVFyOEZvb3IyM2Mz?=
 =?utf-8?B?Y0tnMWRhS1d2d1BGNU1lcEhkQnJybUVycFM0TXlUajQxVlFNSjVtUlJGM2Z1?=
 =?utf-8?B?TjRNSk9vdTROUzBQY29VQy9aR0VPaHNOaVdCRzVxQXFvTmR2eG50Q1VMR2Qx?=
 =?utf-8?B?V3hSS2w0OWVqZDVlLzVhVDcySVRYakU0T3pudElwZnhTVWxtMnJXRTJVT1dD?=
 =?utf-8?B?UDk5L0RGa1lqTGJKVEUxMHRNbXUyOUhCYjhkZHMyVFhRbWlPZk5HYnVYRmpV?=
 =?utf-8?B?eTg5eWNJQTIrczRuQzAvRlhFalB6NjRmZy9sNnlacEthS2M0aVBFbFM0aU5I?=
 =?utf-8?B?WlhQMVZRYWlEUDZyNDN0WFlONzBwUUpNUENaMXZnMVg4MVE1U2tjaytTb29y?=
 =?utf-8?B?L2FBeUhCM2pOZ1FPVS9TaDNnNXdyejNBODZiZGljcEZtUFZ5REdEbU5hL045?=
 =?utf-8?B?akw0VU9KK0FrMHBhY25UZjAxZGdVamJUTWwyeEF0YXd4b2N0NHpPbXhub1lw?=
 =?utf-8?B?QmFwcitiR1Q5YkJUOE5JOWUyN1lUT1gvK3dVR3JteEJ1NVhYa3hFMDhqdWpu?=
 =?utf-8?B?TzI3L2tWNW96YzlvM0I4VkwvbUVRcDBRNWlsdzVqeFdmalpobElraWNQc2dq?=
 =?utf-8?B?bXg5aFp0S05xb2k1Ly9YaFA1SUtSZExEVjJSZ0dPWHprOGVWWlNjVHU3ZDlI?=
 =?utf-8?B?aWVsUFNPTGhmOXBpTUdwc1dhV0dJRVF4RjZJMFdOMG5zZjQwRlJxbmVNUDVz?=
 =?utf-8?B?emJ4M3lCYjVVRnQvejBTNWU1T01uWTJvVWhvTEQwNzFGb2pDVEFwbjkyeWVp?=
 =?utf-8?B?KzBRWVlvMUM5dEgzNFJRV0NPWHRaVnM0S2E1OGk1VSt5eWNGWlA2R0FaRU5m?=
 =?utf-8?B?UEE1dFVNZDV1ZEwwdTM4ZE1JdGYyOW1qTDhtT0VtV1lPVjFYV3BhOGJsRWxv?=
 =?utf-8?B?TitGRlZzYXBzZm9URkUyUGsvNm9HNDdYaXZibVozc0hpME5rODArTFJyM20v?=
 =?utf-8?B?UHIvR2dXUksxaFI5SkVqSWh3bUtNcjVLNzN0RDk2bFVkZG52Nml0ZnVmYWZ1?=
 =?utf-8?B?Z1UzdGRoelpZbCswWms0aExrVmhKb01CRFR2N0ZaK0lRVjMwOFZlbmtSc3dN?=
 =?utf-8?B?SUVIT3RnWVR6WHhFSVNydTlnTkhXODhGb1VGUWVtVHcyd0JSN3VPS2YvT1da?=
 =?utf-8?B?RzBWbGgzb2lmbWlvTmlxcFZRYytRbUFNUlBLSUxLYzZWZDhkU1dleWJ6Mnky?=
 =?utf-8?B?ckRpOVVYbHhhQXhFL2VKWG8veCtSVDNqb0VrZDJ3OHFSRzh1U0kwNEFDTTFw?=
 =?utf-8?B?eUVvMEIxWXgxNHM4RVpFZmVIRTFaT2FFWkdBQzV0OGJ1L0NGZlJIbWdXQkQw?=
 =?utf-8?B?UlZrc09RV3cyRVplMHNidGpqVlFOZDg5MTJJMTg2YW9NalNxUWszcXFEZzh5?=
 =?utf-8?B?Ly9oLzhYc1ZxcUtEWkNsTWZDRWZBUUt4b1JXS1JQSTN3am9peDJyYkZPT1NM?=
 =?utf-8?B?RzhHTlRQT0V3L0Q2aGFNSjVaWDRRWkxpd0Nwc0dhTzIvTXhXYzlFZGp0eG10?=
 =?utf-8?B?eklTQkJRdkNWYjlkN05NbkNQb3Y1VGJ4Z2xjYlErTlRxRk9kanY2N3pEeFE0?=
 =?utf-8?B?ZmlDQ25pdzYyTUhqMStBcVBQSGpIZkgxS2I0b0dBSndjVEphaHhYeVJYUjB5?=
 =?utf-8?B?c0dibWVMVkd4MTJkYnc4YTU5RGFTMEZmTm1BSklMckF0Y2o0QjU3NEJRNTNv?=
 =?utf-8?B?QVMxdytwakdZeXc2U1owSWxoRXNYSWI0WndXUUJrOHhaSEFnSnhuQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04734f44-f466-4c41-4993-08de6568efb7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 10:17:30.7106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HarJOCuo4WJpfHXp/TPysyrFDmTGrCn2P7Dzi61uUQPpCJ4kWmqQq69FBrmz6kVQtKnfQcozP6m8UV++e/29aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9477
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33136-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,i.mx:url]
X-Rspamd-Queue-Id: EA517FC987
X-Rspamd-Action: no action

The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
USB block in a single block will bring more benefits than a parent-
child relation. To support the flatten model devicetree, DWC3 USB core
driver already support to directly register and initialize the core in
glue layer using one device. And many notification can be received in
glue layer timely and proper actions can be executed accordingly.

To align with mainstream, introduce a new driver to support flatten dwc3
devicetree model for i.MX Soc. Besides this driver disabling wakeup irq
when system is active, no other function change in this version compared
to dwc3-imx8mp.c

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - update compatible as nxp,imx8mp-dwc3
Changes in v2:
 - improve commit message
 - fix code style
 - add IRQF_NO_AUTOEN
 - remove pm_runtime_* in dwc3_imx_remove(), dwc3_core_remove()
   will do that
---
 drivers/usb/dwc3/Kconfig    |  12 ++
 drivers/usb/dwc3/Makefile   |   1 +
 drivers/usb/dwc3/dwc3-imx.c | 429 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 442 insertions(+)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 240b15bc52cb..18169727a413 100644
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
index 073bef5309b5..f37971197203 100644
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
index 000000000000..3b154d075bcf
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-imx.c
@@ -0,0 +1,429 @@
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
+	struct device	*dev = dwc_imx->dev;
+	u32		value;
+
+	if (!dwc_imx->glue_base)
+		return;
+
+	value = readl(dwc_imx->glue_base + USB_CTRL0);
+
+	if (device_property_read_bool(dev, "fsl,permanently-attached"))
+		value |= USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED;
+	else
+		value &= ~(USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);
+
+	if (device_property_read_bool(dev, "fsl,disable-port-power-control"))
+		value &= ~USB_CTRL0_PORTPWR_EN;
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
+	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST && dwc->xhci) {
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
+	struct dwc3_imx	*dwc_imx = data;
+	struct dwc3	*dwc = &dwc_imx->dwc;
+
+	if (!dwc_imx->pm_suspended)
+		return IRQ_HANDLED;
+
+	disable_irq_nosync(dwc_imx->irq);
+	dwc_imx->wakeup_pending = true;
+
+	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST && dwc->xhci)
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
+	.pre_set_role = dwc3_imx_pre_set_role,
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
+					IRQF_ONESHOT | IRQF_NO_AUTOEN,
+					irq_name, dwc_imx);
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
+	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
+	probe_data.properties.core_may_lose_power = true;
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
+	dwc3_core_remove(dwc);
+	device_remove_software_node(dev);
+}
+
+static void dwc3_imx_suspend(struct dwc3_imx *dwc_imx, pm_message_t msg)
+{
+	if (PMSG_IS_AUTO(msg) || device_may_wakeup(dwc_imx->dev))
+		dwc3_imx_wakeup_enable(dwc_imx, msg);
+
+	enable_irq(dwc_imx->irq);
+	dwc_imx->pm_suspended = true;
+}
+
+static void dwc3_imx_resume(struct dwc3_imx *dwc_imx, pm_message_t msg)
+{
+	struct dwc3	*dwc = &dwc_imx->dwc;
+
+	dwc_imx->pm_suspended = false;
+	if (!dwc_imx->wakeup_pending)
+		disable_irq_nosync(dwc_imx->irq);
+
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
+		device_set_out_band_wakeup(dev);
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
+	{ .compatible = "nxp,imx8mp-dwc3", },
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


