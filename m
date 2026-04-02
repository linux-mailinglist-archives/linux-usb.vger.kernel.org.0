Return-Path: <linux-usb+bounces-35856-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEB7OmVEzmlQmQYAu9opvQ
	(envelope-from <linux-usb+bounces-35856-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 12:26:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E2B387B42
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 12:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF6AC3044B4C
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 10:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889F33CA4A9;
	Thu,  2 Apr 2026 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="loml4KzG"
X-Original-To: linux-usb@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013052.outbound.protection.outlook.com [40.107.162.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D584F3921CE;
	Thu,  2 Apr 2026 10:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775125468; cv=fail; b=re5nHzXhNqCISO39TCjnGj1dNcKgwiYUhuMjkYpCTepPYzgYQoKJMKhUqovn4E1iCl8yJb8PRUE2lDA4LluxT9firg6gJ6cjwjh2GOAoFHqwhV5GdW7svwrCkfjG6XxJjOLYGzDzF+FhngtYAsISSlfienzxGR4lAADJH98uSD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775125468; c=relaxed/simple;
	bh=T002WR+RCbbGb5A4nXZeQiEoHrPGnMX46nGvfuR3ij4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ae7hcxCjlFpXOdmJHZGLhDkkKrRgJ4Mz1rSD308cyJDTFpPmiVBqIolL4HRNhOnlyDVuxgmrUqzCXlC8h44xRSDUGPk7LD/jM6MY+evXJROfQ85lfo/dxvy4TVvRg0MMuZE3ThY3E2ybNlRuxwuSAxtQgwKhliKe3c80qs+q1J0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=loml4KzG; arc=fail smtp.client-ip=40.107.162.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y25Jufo52I+5J5d1lGTYaZ8qUVcrlsSDQbLkB/ooqpDVY12tHQ4DcGXPbEG6d0kCoSjSQn8ltX1nx37T8nuo71yy15yynqcczzJsXr4+ySk8Vrsk58pKdgHoLFwiFAjq9+CbT9uTdTaSTEUs9GMN9cwZD1zImhaLjonyfU/EpMGJKihcIYqiFBSEu8PqmzICDNLPvoMQgqfIoc5ICd399L2Ty2x2Zp2/BQOz9r7vybzItzVyzRBc9AXklP6vcatwrqrD8pbihrQIB9DM4mjN4InmjB2AU1JljUBHTALh6S76Su9YVHbZTeQRJFKkEqgi8N4NZlO+DeCDkrN6K/8+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T002WR+RCbbGb5A4nXZeQiEoHrPGnMX46nGvfuR3ij4=;
 b=Tvza/SEGY4utGssuJ+iokqNvEfcucQftydyH3i85aC0CcZYzp9+TOm5IVuopsNlAwx3c9nTLN3IVA+fpuXW6Z9L2VCDVMc3lQoyynCp3CkDMwi0b/JrdfClPuaxlkB8aSPE8lvztGNiPeodDtdJ8Wi0u/t0Cpj6ObbtdDbPDXR5kbbEibBCznkUc6Lu8Yd99oD/CF2b499KMd/Yb1qHeVGJzF8UipSZl1Q0sx2BJ2IxQJoJw6wbchAmtES+bNqtskAgzh7pEsJQDmL9eqJbGHiOfpKZJefqJWYG7tGLmvrssbBiD7556GYxc1d5Y8XPxxUyv5ly331U2aUKYVmObKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T002WR+RCbbGb5A4nXZeQiEoHrPGnMX46nGvfuR3ij4=;
 b=loml4KzGT8s3y5k+ZQgg2uQRSg6Nlmv9GWqZco4B3pqAxigVHXC/DkTJVf+3062TFf1cX3nX8vWvAs5QuELD+Yqzs2WsrOFJwYlB5jv8Bd8rgo5Cb6bW8dTO7NsofK+Mbl7Z0/Bw7ObUAyPSwHcuNzrLWPB53dastGsxfxh5WHb6a2I7n3Zqt3z7qG1kRUcVCLUzemn2GU+Xa4Mx8K3+sGicaUnUGelN5mYrk1AEjTZ6MOYeeEWtWcR7THBnV1jxJpXFkEQYVxUxmRP9eI9OBf182gQnYUzMfligFDTiYQQgHszvY8dWyGeIK+Ivs49pwIEQpqgEFmNOCvOgi7LrZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA1PR04MB11382.eurprd04.prod.outlook.com (2603:10a6:102:4f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 2 Apr
 2026 10:24:24 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 10:24:24 +0000
Date: Thu, 2 Apr 2026 18:16:28 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: "Andreea.Popescu@aumovio.com" <Andreea.Popescu@aumovio.com>
Cc: Peter Chen <peter.chen@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: chipidea: udc: reject non-control requests while
 controller is suspended
Message-ID: <fbrg36w35eu7txbsshh32descrn6bzfypjqs6wwb76ijjbay52@opctausuvgi6>
References: <FRYP281MB261885D9851351180B1EC037EA53A@FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM>
 <yel7zijkcua3cdn646fadp2pebatkbt4vracrpsbcdtmpahzxn@dhiapuctxbfe>
 <FRYP281MB2618B5E8484BD399A6B3085AEA50A@FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <FRYP281MB2618B5E8484BD399A6B3085AEA50A@FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM>
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA1PR04MB11382:EE_
X-MS-Office365-Filtering-Correlation-Id: b95a4280-6434-4151-7c7b-08de90a20305
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|19092799006|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	lIOtw4n2gI76oqbxzwe8jenD5T/fKPws/8+Q0AH6IzWBDCuMiklkU3OmMlgVFGHMxOvBaCPXu3CK9JPjN1Cv0AIYf9cIpI0VDrTQ23PHKQneXJ/77Q57zlSg1GvNtWAMmxygxqY7ETl9RYmgNOG8Xwb6WWyeFI9Inzcool7hVDzQZJpEemK22z8GXZUuilzKFowMIkhIPxZ1fHwplsaZT4fiZo+2ICCRgJRS7cweUEw2GzWRyWSNnf4Eod6pKmO6uCO1kh2zop4D4ItPjhoSgmW7XDCtG3wxIY9iWhV0AnWYh00EQKsc4cAXKbAGjm3rnVO6BvhYBqV58afA5g/ooJPq0N0C2SHn6qL1Yya1DAAEJ1JCOg7Uu30ijWDuYDqVJrTiGTNSLFSUW/u+fMFjJHhC2CyjdtCcqcJLG5QEQwu+ao5mDPzKhuKvEV7Zi02RzEBk74aSGMPQsEAYe3sAQsN8falMPgD8wqjNKID6E0KmhyQD/vfUgoQi4DsInQMyitF8IzqDKVl6Pa03KyKAPHEMrc6L8GrwlQ0Oy/yf6FwlrdBjnl1uQK7opKnLU4lcUr0VbxwZms0L7X16km1HUJjjqBiWJYsSjwPkdCVc6xddQ1aycbIc7/9XmZoZn+0Wxvn5jsGsvp5VeKzGM9eTJkEjseX9PsjScoPPNLvl8yM/JXk7bogGkErWIxoXsTb7HGUERlqa4pLb3nfXKXjWaCTEFRcph0KszQlaNgu94V1Ge7qTPDatiD1gaWW83ODEenKtehCbtPvQ2lZLXtEepLdhvV6ttMyM8o6nqnNsuhY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(19092799006)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVBoaERNYytESDB1RlJ6clFFNERnVVRsbmVsVU9QQjFTQkU0QnZMeGQwb1Nz?=
 =?utf-8?B?cFQzWGN5MzY1bWZEVlB1ZmFNdDNHbUZZUFJJZ2hVNVBGdU92TXZtU3hmY0tF?=
 =?utf-8?B?bHZTa1FtM2pxRi9RT0FtMjNId1hCbG1nU2t2Wm84cE85eE84Um9KdFFXWnNv?=
 =?utf-8?B?NkdHdjJsVCtJcXMycEJtUmZydmsyT1J0aTRNbTkzNFU2bVZYWGF2cHlkcjhN?=
 =?utf-8?B?Y2JJTTdFOEl0NmVhV2RMVC8wZHUwZjk3bXdncE1nZ3pwb01MS05iZjJCNjB5?=
 =?utf-8?B?cXpta2xiOTVlVVNmRkdiaVBKaHhPN21NYTkzOFNlOGhTSVJ4UjNnWVJ6VVZQ?=
 =?utf-8?B?KysybkY2Z1d6RGc0WXFFdU1aOTE1MmxHVjRQZUtYcENCYTZXTFpFMmJMYlQ2?=
 =?utf-8?B?Ry9KbS9odWhaem9yNWR5Qm9GZFJFWEQ1RWY4aWlCQmx4bkVsTTVLdkRScDZ5?=
 =?utf-8?B?MnhQWHdVNmtsWGtYcVI3cWpYOHFiN3hDU3NRQU9EL0R2RUpXL3pSZ2xYcE8r?=
 =?utf-8?B?NHg4Mnk2ME4zRmJMaTBWRXFrVjdNVFQ5VURBVVp1bkhCb2NNMzRJeVUyMjI0?=
 =?utf-8?B?ZklramlUUDE1ZjF4NzdnVjFBWEVDanpId3FyZWVHNUZtTDBmZnc0R0JZTnlC?=
 =?utf-8?B?MnhWZ0RUQ1psa1FOVnFUNGJDdzNURmZabmhxbWZBWkRJY0lWTTVLWnovV1Fv?=
 =?utf-8?B?c3djUkwxVXR5OTNwQkkxckhoSmx3RzR6VEg4T3phS0tocWJYMFlPL2RRR1M4?=
 =?utf-8?B?bWppaFNmaU5pc3h3ZjlxTktBUnlkVmtMc2kwVU1NT2I1cmlDRWlsWXZOclNp?=
 =?utf-8?B?Q1YxT0g3b0Q0N2pzZm5zQlBNNXBvS3R5VDNpcmNZMUVSUHFhdG80aUVMZ3ls?=
 =?utf-8?B?aGVOU1k5c0JPV2kxczgzOHBZTWROSUNwRWNSdlNuMTVFbXZOcXA5RmRGMTVq?=
 =?utf-8?B?T1VFb3EvemlIUWQwbnRpSU04TFRETFJqNGZHTHBVdCtiZ0YrMVo3Zm9qaEI3?=
 =?utf-8?B?YkZBc0lvd3J4RjBoVTA0U2MxVzE0VmNLQmRhNVRLalYzajdad1dGQkg3SDRM?=
 =?utf-8?B?ck5HYU10OWR5dFIvZTdoS3ZYdkxGa2NlVlJMdlBTc0ZBd2tYcTViWHdueC9j?=
 =?utf-8?B?cUFTVzRoWW5jS0owc2Z6U281S0tjWTV2aTFUTDNKYUVLbnJZQWw4QTcwQ0VK?=
 =?utf-8?B?eGxSdTJFcWE2aTB3eVFxNWFhZXRpWDBORWhKMVBXdTZQQTVBWG5ETU9sYjFQ?=
 =?utf-8?B?RGE1RHk0WW1DUlZvUWdDMkJLekdqeG1lY29ORFBMRVFJNU1KTHFGdjNQNFFi?=
 =?utf-8?B?Yk9qK0lyUkNCRjhUVWVVNWk3MHdHUCtVWU9OZnM5Zm9vRjNISUd4NnptbHBQ?=
 =?utf-8?B?cXhKa2JjM2djVmxHTUlIV3dQOHZFNFU2YlFKeXFnVXRncnE5THh0aUtML05B?=
 =?utf-8?B?Uy9Wb0lLak5PLytNTUpIVWlCM2JoZGY5TER0TlBwZHBsR0ZwaVY5VFBlWmdO?=
 =?utf-8?B?NWlnY2NoamF6c3FPeUJZZG5KYWowMGRaTXdrYTVIR29XMTlCQkoySTdBWisy?=
 =?utf-8?B?TngxZlcwOTlwa0gyeXUxR3pqV3dFVjJWbWFvbGFhaGN3RGVhdDJOTTBmcFdJ?=
 =?utf-8?B?cjh3OTBPMUJ0cHU3ZStLTUtWRlhoRVNwWEtzdmJlVEZPbUM5UG5KTElkN3VH?=
 =?utf-8?B?ME1BWlp0OExMQVE4emVZbTZPeVNscFNGU2IwRHc2VTUwc1JCakh2YzVZN2p2?=
 =?utf-8?B?bUxPa0MvalQ1L01Rc2h0dEs3R3IvOWorWnRKRlFuSDlxaTdCOWRxNjI1c3V5?=
 =?utf-8?B?Uk9kTzZpMHdId1M5RDRGdE1XL0JER0hQa28rZHc0eWRZTkZiNDhROU43cjZM?=
 =?utf-8?B?UWZCZzhJNFIxRUFsQ0NObmtEcjg4RlJiTnZscTZsNndTczlCSVBLdUUzL1d2?=
 =?utf-8?B?dTRxeXVLdzVwbHAwbGYxRFNEQlprV0hxQTZ4eGpVN0l4a3JFRHRWVnV0MEZ6?=
 =?utf-8?B?bnV0WGZwb21hUjRhZTlJRzBUUEdyR051QzZVQzY3SmpJeHJNOXRXS09xOGpq?=
 =?utf-8?B?anhmUTc0cUg4MlRxSjZST3QrQ0JxS3U1VGJuYUJSMFN6cFRMNWJzRCtKcjht?=
 =?utf-8?B?R2dqTXU2YXF4VzJITjhQWE9HdVlWZG5FcnRYSEN0NjkyTUk2b0VBYWhWODRT?=
 =?utf-8?B?RVBJSHFCQ0VTRTVuY08rcXdaNEErc3J3M0phK0gzNFhma0dVaXZoWlQxMWhr?=
 =?utf-8?B?czBQUjNDTndKMGpyWFpNWmVmMTNLV1J6SnVVR21lL29zU3lqMnZJcjlyWk03?=
 =?utf-8?B?cVRwa01XTGw5ZWhKc0dDNkFZd0IvU1JEWEhsZUFPUjVqV0V5WjVwZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b95a4280-6434-4151-7c7b-08de90a20305
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 10:24:24.4858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kxSsu/Wq+q0T9bVHGM7kxBYVnxBCY3KIjwofU6Kn7W4TBbv1hp/MV7OvVj9Dywbs9mRqXQ5S7EqsNDAf9m8/FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11382
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35856-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 63E2B387B42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 10:47:54AM +0000, Andreea.Popescu@aumovio.com wrote:
> On Tue, Mar 31, 2026 at 12:21:45PM +0000, Andreea.Popescu@aumovio.com wrote:
> >> When Linux runtime PM autosuspends a ChipIdea UDC that is still
> >> enumerated by the host, the driver gates the PHY clocks and marks
> >> the controller as suspended (ci->in_lpm = 1) but deliberately leaves
> >> gadget.speed unchanged so upper-layer gadget drivers do not see a
> >> spurious disconnect.
> >
> >It's strange that chipidea UDC will runtime suspend even it's already
> >enumerated by the host. AFAIK, the udc driver will call pm_runtime_get_sync()
> >in ci_hdrc_gadget_connect(is_active = true), so it will be in runtime active
> >state all the time unless a explicit pm_runtime_put/_autosuspend() is called
> >in somewhere.
> >
> >Would you share more details how device controller go to runtime suspended?
> >Thanks,
> >Xu Yang
> Thank you very much for taking the time and pointing this. It made me realize a very important distinction. I am using an I.MX board, due to this I will split my answer, so you can decide if it's still worth what I am proposing or you can just reject it. Either way, I am most grateful.

Thank you for the information.

> Still applicable to 6.19 mainline:
> ep_queue returning 0 for USB_SPEED_UNKNOWN: I believe there might be the following window: _gadget_stop_activity() sets gadget.speed = USB_SPEED_UNKNOWN, but ep_queue is called before that completes from a concurrent context. The return 0 is misleading and should be -ESHUTDOWN.

I think this will hardly happen or the window is very small. Because when
the driver sees the speed is USB_SPEED_UNKNOWN, it has most likely already
seen that ep->enabled is false. _gadget_stop_activity() will call usb_ep_disable(),
so usb_ep_queue() will return -ESHUTDOWN early.

> I.MX specific: On i.MX SoCs the chipidea controller sits inside a power domain managed by imx-blk-ctrl or the GPC. When that parent domain is shut down by the platform PM framework, pm_runtime_force_suspend() is called on the chipidea device, bypassing usage_count entirely and invoking ci_runtime_suspend → ci_controller_suspend → ci->in_lpm = true. This happens while VBUS is still present and the gadget is enumerated. This is the actual path I observed and it is platform-specific, not a general chipidea mainline issue. Due to this, please disregard the proposed change with _ep_queue guard on ci->in_lpm

Then I guess the PM framework is working abnormally. How could a parent
domain shut down itself when its active subdomain and users are using it?

Thanks,
Xu Yang


