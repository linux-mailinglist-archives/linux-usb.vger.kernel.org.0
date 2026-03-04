Return-Path: <linux-usb+bounces-33974-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLTPKXEeqGnyoAAAu9opvQ
	(envelope-from <linux-usb+bounces-33974-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 12:58:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F37BE1FF6B4
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 12:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97E8C3008D1D
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 11:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8C53AEF41;
	Wed,  4 Mar 2026 11:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="I93/Qljp"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010054.outbound.protection.outlook.com [52.101.84.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554E93A6413;
	Wed,  4 Mar 2026 11:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772625405; cv=fail; b=UdaYUncAY2D0jqDxjXxCOsDoj6dkSIpLMIRlrZ9DI3xOvXgSZhrhsrrhyBcae+9hzsppgoB6dd9iTaqjDDwkEVf23N8yeaOPjrGs/GN6VT84VVMndT5Jpa569WqOROjr13AyUjVKlLaSAVPWXvRJ1fYonSMsPh2vg1EXtV1fieA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772625405; c=relaxed/simple;
	bh=WMEC8prYak3AMsIZ1wrpb0vqzAcV+ojNbhenWGfkQ3I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gzSTI8NZ7fLt3f4siJTXXmbqw+aYtcD2FD3yBZcUgqh3YgA3YMacda/be2XmC2bJS31y06rUbdDlvrmwoh96VpM7FdLpM04fUeS/FNXXdzYIfgQshr3+UW3H6pkLzubLY2LAzftIHQkGQ3GEOhSzG/2X8yOrmJOaNboafpfPf3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=I93/Qljp; arc=fail smtp.client-ip=52.101.84.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VozuD+nzv3OfHb7dYzg3+mdq7FcW3Rd+HdJ5edyuWikrzCNboBNuQ8//LpYKPCwsAVGw7/ONjgeSVD9Ynaon+T+Oq7HiVlGqZm94sF6x0+QxKXimQG8zH2r+jIJ86JLUK635gd8Bbt8YdGeOmOj8OXdp+r1d6qQo6kV/gDaYNeSGh96uwn4SidhnS+DOiSHDHNYIoo8LUv95BDBoMlxuqoNnOIJuJI5jvtApJKc6sqI3BdP+MVP9GIhqht6EMlFDEVc8qpIbJoX/BJrFPD/FsIkifPVhs0OOoxUIS6rERgCjurH0lbqDkJe64XK1i3xlG1MlI0xpHdxTpd9CSVH5ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMEC8prYak3AMsIZ1wrpb0vqzAcV+ojNbhenWGfkQ3I=;
 b=hIAmRnHO7sfCRO4b/GmMiiw25/JprU9eAWJq9hXsJaMWSpvtNe8OBypZdbC9iLa0tr+DAk6I5DNmxjCS2ddnIm+9Ly6Hzkb06WtGYcM1jX2JHTeekdAWc8gSLU7J0K9FCFP+9uixv9xyQnMNqaPLYRw83KkUeklpaFL9sIVo9/Gqjz2tJUwW5nfwzRt1uPHM0KalGfDh9guE0QIGFW9x1jbF33AJNPnqk5Y7duY7G8Ws/u7pl0VhfuldvpEFuk2GmN1wSJu1epGqgxL0V6Yq6RsEpH/15ARHWTl5Lp6EEwYoSrgPSRFa7n0/fxEK9XD6RK6OIrHSEKk7dgIssMY+Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMEC8prYak3AMsIZ1wrpb0vqzAcV+ojNbhenWGfkQ3I=;
 b=I93/QljpARisJglsKkn6GJLK26Q3Mgrf/T9ZMjWjHiWHIhCgshL7viR1XG6E7WxEFjxRlnuu86t/MbTHs1ZMsUU88PqIQeQJwaRFA0TaTsPf2D5jU41ILNNhaOQ5jMuXbHpTtwLn9bnnE8IdyhQdK77FtTORtlAlBzspEpqwKNvN8Nf+5IrCFnIv1dXXrGIk7+r1kUrhxapCOhtrxOrZ8wZPR7JXAraHmms5ovAaDhWqOyBmyXwjDYPDi44iOHwbtsEfz0KCY7Rnbyzk6Hp/kLSRSv4A4NsGr8MNrLmeccWtFqwAa7e0tsBJsKuj8Il8knaGRDPfqL3zd2RmhjzKoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS5PR04MB10041.eurprd04.prod.outlook.com (2603:10a6:20b:67c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 11:56:38 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 11:56:36 +0000
Message-ID: <5db3ef9a-3659-4b92-bf86-530c54691b73@oss.nxp.com>
Date: Wed, 4 Mar 2026 13:59:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] usb: dwc3: fix a typo 'HishSpeed'
To: Xu Yang <xu.yang_2@nxp.com>, Thinh.Nguyen@synopsys.com,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260304113916.856841-1-xu.yang_2@nxp.com>
 <20260304113916.856841-2-xu.yang_2@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260304113916.856841-2-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::14) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS5PR04MB10041:EE_
X-MS-Office365-Filtering-Correlation-Id: 87b2f099-e2f7-4b26-fe16-08de79e515f5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|19092799006;
X-Microsoft-Antispam-Message-Info:
	thh2XUVRYwmLfCdyCSulBTajmOsA2LlWp5d8glFQ6PiYK/t6wJUoLfRj1J3HLS9LMQDhu/7msYqwKX6sgDowCVjMEjueb1Y73VtZ7jAO3gdVRdYIO3SYpiEOSZBsARMjHlJl4HCLAoFJRT5M/DWikzotVIKGEwTRY4u+4peY9SiWStHAFz0Wv85fkNs+ffFKj8iOASBhgh1yPiys42WUn/nUADNlU3q+iZ5g+L7KtlmdifvcHvbXltT5Q3Wr8l39E2k/K61XSICVn6SUFkhAMlu5LgGThex6X/ELvk/1B2CMfIrTAeS2QHzcPLRoayjsHkWO0HhlVqTo+xN4OKRvPU11Q5zHc/z6wwC9Pn3Ylc0oqK8rHv3t8zg3QQR+tL9Cqp777ZXwbIYxTIsWoXCFGVsfHdXnXGLyB8pzvBFCzdUMYiErMVXVRYTvy8oyA0168SBHe1p6DPc0S6U3Qr+lrFEZSUHjVSv4rVjcW8hiOvF/BD6IyUv5oVtNraZNOOuUgav/mAeaGIesf/uUJQRBUQTejHKQsYjTbjOdyNLkYqc0ozZVoZJiwWKmN+sI9/wj8FilZisuBUPPnTIAQTmbDvW4IozK463pf/TaX/Hv9e1HHkaJHHupqi+EuZlVl8gyzadaqPsaM9R6d3GE1Lo0QVK6RglpCL2X5/J/TJobzvbmZockb3jVIM9rUWuiQfvobkwVyUku1Bd/V4uwHDR2uvpFWBTBLaElfs2O8/S2h5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkRkc0lQSG5vSGE4bFkyK3U5b2ZGN3dWOXYxZno1d1c5VHByZjI4UzRYOWxa?=
 =?utf-8?B?cUJjM2hROEgzMVo5UndLRmJkRGZQTHMzYmVMOGhtSWNyM3BoT1IyVkx2SnRj?=
 =?utf-8?B?N2ZYZ2h4QWdlcktHV2xoREpaOThtbFNSaGVYcmxwNU56TDFoK0NadHpiSFZ0?=
 =?utf-8?B?SUtCWmR5cjZnNWxQMXdCcGNWQ1hsNncvL2RsaVlXSGp4YjBtcnBWWjNLeGJD?=
 =?utf-8?B?NUkyQ2xrNWFiemhBZVBZL2w1dTRNNW5pZTYxWDd2VEZudHQ4Umx4VVRDcW9F?=
 =?utf-8?B?S0Q3YWxzaDFhM3ZqL1lobnh6SEdNRnFTWlhiUmx6b2ZQMnQ0b3d5Y3dKM1Fa?=
 =?utf-8?B?eW96VHBocnVKaXpMU3NOZUhMWjd1S3phTFI5MmdZU0hLMUxDZlRYYmt4dkRQ?=
 =?utf-8?B?UXZBVE02NWgrU0ptS1ZCbzRHRktRKzB6eWF2WVZhU1IzcEJFOTBIWUFlcWE0?=
 =?utf-8?B?cU53L2NXRnVTeWFRYjlKS2ZMOTV3aUxPdHQxc0V0SUcrTHhia2RBMENLUG5s?=
 =?utf-8?B?Wno3UGJ5NU1OY1VkSG9BK1hXUWtvOXd1S0V4dFRJWWFrcTVHZHl6UEFBZkdE?=
 =?utf-8?B?N2plcFpCcEtUZmdjK1NwU2hzNi8yTVFNUk4vOFFTTFZZaEFJOVYwd05hWHl3?=
 =?utf-8?B?SjY0ajRGdllMVXhhNWJoeWdNcE40ejVMUklNQ3R5azYyenpoOU4zbVE3TWFE?=
 =?utf-8?B?dVNIY2x2dHhqZ0hpZmNjcWR5RW52OGphZFMzbzFsTDhmaUpUeW8wNkU5ZlBl?=
 =?utf-8?B?MDR1d3N1YXJVaWRhOU1razFRQllhMlNCNGRZQTlEWVQ3NDhtY3hHcDNWR2Zy?=
 =?utf-8?B?TTZrTE5HamI2d1kxVXVmZHFyUGM4dDVXZGRqNTRQZncxc1RJT0JjTE9IRnF4?=
 =?utf-8?B?V2dUeXhPVEpacms5VWhud2JKMmZFb3ZOZzY0aFVPVERkRUNoQTVLY2VWb2Zp?=
 =?utf-8?B?Ynp3N2RYYmhmWTFsNDBNRm5pTTI4Rkd5Vk5lSFFseEdobVcvNkw0aUNJWHlH?=
 =?utf-8?B?N3prSTJaeEdlbHFMNU5BeVdpRjhxbXlFYUdlb1ZrRDV3T1ZaQll5OGNoRHkz?=
 =?utf-8?B?dTlsM2dEUlR5WEQrVEFpTzI0aVp4TFQ2amlOM3c1U3JrakNMczc1blRseVhS?=
 =?utf-8?B?ZWdOZExDV1VMQkN6bkx5T1NPUWxtSmtQanJhTFdaZStoREpkRjc4TkVsK0px?=
 =?utf-8?B?WEVnSGtnWnRYWVlkNm9ZckxYWi84MmpLaVBCeWpuUUUweVZ1YjA2clB4RWZ4?=
 =?utf-8?B?ZEdJbHVvWHFYaE8yeld6c3ZqRFJOamRkY0ozc0EvMTBQVk13MlZFRmN2cEN0?=
 =?utf-8?B?Nk1vTWlBUFVCY2dIU0hCS2c4VG5uQ1RYRHlueHJycXhabHllMGFja0RXMENo?=
 =?utf-8?B?T0xhYWVDZ0VqOTd2YU5GREpPRVRtbS9KUysxRGdIby9EMThaMUNqZnFhZHh2?=
 =?utf-8?B?V283T1Ntb21MbC9tU0NzTnRGSERzNmRNT1NHa1RaaEFXc2pUSDJBTkxhdXh4?=
 =?utf-8?B?VXAyb0I2QmR5NHppeFBIbzNmaGNvT2ZFZFRaTlNhYWI3ckl1bTE1WkczUHN6?=
 =?utf-8?B?TVhVQSszMTJ1MHhEYUFWTURWTEtxNC91NlJ1L3d6YVR4dENicjBZMlRZemJN?=
 =?utf-8?B?L3UwNkluYUdKS1ZRNW03VitSUFB6a3dMMWpCVUJaNXZKb05TUUQrRU00ZUJi?=
 =?utf-8?B?VGVsVHNKeEw1ZkM5dGlSZ254cldoemJkUE8zMjFES1Bna2Y2WTJnM3dlTG9y?=
 =?utf-8?B?NnZoOU4yNzhQSWdtajgyczFVWVpHQTR4dlQ2QUdvbWllNUduZnVac0E2Wi9C?=
 =?utf-8?B?VCtkeHpNa1JFYWUybmkycjhyUnJJQ2t1a2VDVU54ODJMaFpyZG5JSm4zbndy?=
 =?utf-8?B?YjNLK0tnTTBvLy9pVkFTbU1Qcng4ZGtKaXBnRGYwcjdxbjFxRklhM2toYmV2?=
 =?utf-8?B?OWRBNzYySWRhVHBYWkJpNm5nVjd6b3RaYWpZL0hRWEx2Z2w4KzR2MitncE5j?=
 =?utf-8?B?OGpWaFpFdDBpS2ozWDN1OEZJNDViam9RVkcrY0d1WlgxWEEzNERKeGh6YnFN?=
 =?utf-8?B?MmE0b0RWcTRrQTNObWs1dUZlTlAwVFk1OXA2Zk9jNjEzZXVSRVkySXN2WDli?=
 =?utf-8?B?V3JHNFFMT2VDcDEwNzlGbHdrMlNxdGVUL1JDdzV5SUR3S0srcVAzSDhGa2Ru?=
 =?utf-8?B?NGx2TW5zVDN4NmFxTEx4MWlOOVJFZ3N6YjM0UFVxa0c1bkY0UmkzTThZbUp5?=
 =?utf-8?B?cE9wQnpYbUNFYnVhUTRGNUlkV25kZG81emhKbzVOYTI4bnlpbmMyNVpGVWcy?=
 =?utf-8?B?eDQvcmdoVUpUT0lXcWxYekk3eng3WTBOOTB1SzZCamJJSkpMeUVvdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b2f099-e2f7-4b26-fe16-08de79e515f5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:56:36.0207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWMPbe8aSK9XZQI4VCEKO4l+gSY2ofeoK/aaojVnMk11mHUmB05ks5/JexlFDCLUVwWjRmmBd/zAv+AtJXQIAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10041
X-Rspamd-Queue-Id: F37BE1FF6B4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33974-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.baluta@oss.nxp.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim,nxp.com:email]
X-Rspamd-Action: no action

On 3/4/26 13:39, Xu Yang wrote:
> It should be 'HighSpeed' instead of 'HishSpeed'.
>
> Fixes: d21a797a3eeb ("usb: dwc3: core: add support for disabling High-speed park mode")
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


