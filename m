Return-Path: <linux-usb+bounces-33734-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDkXM3UnoGlEfwQAu9opvQ
	(envelope-from <linux-usb+bounces-33734-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 11:59:01 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 069051A4BB9
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 11:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22EF8302514A
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 10:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CEFC32C942;
	Thu, 26 Feb 2026 10:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dZ0hLR7I"
X-Original-To: linux-usb@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013003.outbound.protection.outlook.com [52.101.83.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2FB2DE6E3;
	Thu, 26 Feb 2026 10:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772103534; cv=fail; b=XZPNLEgYKkJDF76UYBFTM2hTD0uGBxjnh4YyT+RIgJeSPWjqPxeTVLSaCpulRv/vJZPgREPQkH/+fYXshTDngY19bXjP/A6neofoBuf+pQ5EDadDFWhG0WkvtCCRgCqn/dpYe8g2KQkLVBGNFOrc/lq/pV1Cs4XtGkdJVAHf5T4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772103534; c=relaxed/simple;
	bh=ioTU+vjAfJzzyyzu1hTlZ4UoFFiLKbB+pN542vX/GDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LN5rbwARAgqHa37OnMFMpkIZSws6JYGwTYD04Dc+wTySGxbdc6tsFk6T7k9UUvBqbmX7mdlbaasNZs7oNFcqOe0RKKqRMW0CP+963lKpZTwHzMxviU3rfRUv3XA4MgxaoOXfUMtRE00oh+bZSbelrS9MLAjcsAE0sa3S3mTEPEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dZ0hLR7I; arc=fail smtp.client-ip=52.101.83.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4qsg2fO7Ou/BcjBVZO918F61e8KF3TTOK14YTKDKS6cY++RoDjS8fKADmxVGrCCP/DHyKGX0bCV8wUKQu2jw04Kzh48Lke2DwbWe9UIHbm2tOxx0/tBFIthWSqk2hUXWWOXhtOaVnHu5QYmH93sHgT5MMNF8IoUGyp5xydLYlSgbPE/TUxb9907Hx2CXqBiNlCH0NWvl3izMirrWQnrEamXhxWt8u0SssrJG4q4SFmPE1BqAdf9gr9N2g8JZG7wVwBY7NEYr8QK1LffWAqi08k8IgVqDCKouS6Ch5OeoI8KRHDn/U7IlUAQV8t4ERh1PR3varD/a39yYr6P0+eCGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFHtejPoxK9CfCspbtw72xLzYtf/WljI31sL+6ScVVQ=;
 b=vcUuLULI0ODxQqWAkIih49DP3f25Q2Iv0Qv9agwHtegScVJulN0jz4iqzB0PO/ERpIWZ509GkN1Ikh3HrVRq0yEqk0p0FDh693pSMz6wujDdX0EW7mEpjB/f6ng79Od0fPjFt+GLRCJYdTLsn7Iog7oIdO9I8tJnKKC60y4gLj31XhvN3851oObsF7k8pecY68SBXBpzbQMf9FG7+mxj9+q6H7ZAv8yBYi3lNrME554zCUZ9ZrNfdXtwcvB7pJOYMJOCPpMJkrMYBDUY24ksUvTEYaRSUvgwHSFr9gww+SsSKgYmzjoELq0iDMLjmUwKkKrNsGZ17w3fxIFQqmqsqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFHtejPoxK9CfCspbtw72xLzYtf/WljI31sL+6ScVVQ=;
 b=dZ0hLR7IYCedZIWNZvvbliu5/lKcotYd7avWqZTtbJBiXb5LimXyCACUurWXuiAs3d9K8NcKsjJpXbxAPwdC3ITYQD6BO0xVzrTz2OmJBVxe6lqedyJVBPjk/GsChUgoM8iiQ4mytDeoMzoa9wyq4VgKu8fRTAJb2IJ/Vl2ovjhmamlgW8NEL4j9/mDwGhQr9FjziwHiXa2Lh5+y6vW7U4aDiSMVng7fiQm4KOmUTFo7P9QV4sgEGtW4rtiS8ckgW5Z1QsRnWj8OqXxfHEj/dAp+1sgqCYdgaJwZvGIpXByhZdHMwmAHfhpy/n6XlN+okqHYQlRoG/uqWiSIEPL3jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
 by AMBPR04MB11762.eurprd04.prod.outlook.com (2603:10a6:20b:6f1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 10:58:47 +0000
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781]) by AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781%6]) with mapi id 15.20.9654.013; Thu, 26 Feb 2026
 10:58:47 +0000
Date: Thu, 26 Feb 2026 18:51:07 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: gregkh@linuxfoundation.org, m.grzeschik@pengutronix.de, 
	stern@rowland.harvard.edu, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, jun.li@nxp.com, Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2] usb: port: add delay after usb_hub_set_port_power()
Message-ID: <srg6y4zggr4vqofigb4hn5hfvwwci4bdspzq3hfuo5nelykw3t@n7ywcsb5savf>
References: <20260224031909.3546487-1-xu.yang_2@nxp.com>
 <CAOMZO5Br6uEJ5ffq4JCary5p3Di+bF4MDmUtOEdDqpU6xs6VJA@mail.gmail.com>
 <2r3pvujs6vdl5si5rnplgnezw4nllyunshipetvztowkngkv3h@glsewrhncjvl>
 <CAOMZO5De8a88+1uFzBv_aDNFz7KRd4Y-+AL-eeBcK_d+i+COWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5De8a88+1uFzBv_aDNFz7KRd4Y-+AL-eeBcK_d+i+COWA@mail.gmail.com>
X-ClientProxiedBy: SG2PR01CA0185.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::19) To AM9PR04MB8825.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8825:EE_|AMBPR04MB11762:EE_
X-MS-Office365-Filtering-Correlation-Id: b861a1e5-4af6-4e5d-29b6-08de752603a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	Mc8/dSKPdtOGW/c7i2lJ3SH6bViM3W+BKfTd2//gK8BanqIiaFjAQ4ptmW1MwNJnr7zMMH3kM9KXdzironJstV6zLlcR9oXBJWciG0g+zNmO8BXq5XXvezjO6WxrxlhCTpgsw/LO+NzBE2EZJ7RFLP7PRV85vDxfkHhBiOsCSVmegsS02JDzpmyvLq4IpyjL00urBYMWBAJ2Q6UsJoeS6citdg/kbahkI+ZXI8dcvk9VGRiQTOnrSi/OFyo1gVMsbk6Fg3Lb7XeuLghBUH5dlm7KKp3czfBRQJllZT1ND1mRxUM4LCuTN6XruVUPnqbGyXa87EDyhGLWBXcx3AuSN+tn8KWYwhGJYiBEzfbObuA+l0KQQYm6k8LA7bMcKVyV8/ZOuhk6hvmeC4HtjaFIi7v2AhsGEDmICEF0PNoDoq5sBvk/7PAOns0ZVYG9Xs37J/wohrYl5SyeEqBaTD+or9mtWmEECw55tMVQRxW3JoErMiLOPhCJlPcaRvoHXUyI483BieN9WffmXikMwIKkKjQoTVL4x7GQQrjcN2/T6ynCUQT0pMEQhaTqwNYcxOjrYenkbqWQW/mDpVSyBvZp2Bw0tOhVlPQ5mMGMOh+S8as6QSMxZX+Btdyohi91HMxdB9yhw91RXV9458p/pLb9WYLPWLK5mhEsmk2EQM6dFiPqIrZalnXPHs4Lsv72cccoyZHGh9mNi+AfrBXvvEse1VbexoCKIby9iOZYVtDgeYkwJPMqn0j2aM4D0McFE44O
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8825.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZW91L2xpcktaSStZaXFtMHNMbG8rVG1td1BxeGs3SG9XbXVqQnNDS2Q5dVVP?=
 =?utf-8?B?WTNYWHRnejBNUXNYaytUZUNSbENlN1dreDFxU09YU2ZhVm5sZndlQWxlbEZp?=
 =?utf-8?B?R1BVZnlXOW1TMU00UXpJYVRlMlJRQ0JmeWdNRStjaWwwMGlZNHpDWVlreUVh?=
 =?utf-8?B?ck50cE1iN240VFduUnlQY051L0RvdkNJVWs1VmZIRDlWKyt5UEZLZTYwU3ZP?=
 =?utf-8?B?RnJ0a25pWTY5Sm5JU1NxL1EvaVVHUFJiWGVGd1hRQ1ZuK0FHU0lzZjdqLzFL?=
 =?utf-8?B?WmpxUllueG1wa0Z5Yyt5bSs5bnNybjZ3d1F5ZlpiNXpBM2FCRFBrcmhZVkMx?=
 =?utf-8?B?c2hnbUI4THZ4UCtiUVNKcVdTSGtmRXhERm5aK1M1NHdJQkczeEZhV1VHR0Mz?=
 =?utf-8?B?ZTBYVXJoQUVKUmszZG5rL2duZU5uWU1OZXcvYjdGYUZ5M2JuaG9ndUlwS2Zn?=
 =?utf-8?B?Y3RiWlRFMWlhYlNxaFMzaEc2cndSUUVnbVVsMS83WWVzY281SnhpVjA2RFFs?=
 =?utf-8?B?NS9XN2xUQmhiQk85UjdCU3dnWW5sOEN3anB2b003MlJDY0wyR0VMQ1dUODRQ?=
 =?utf-8?B?UjZVeG9xUXd0Q0FwbHhHQ1piZ0lXRGxUZHVoVEtzRk04WGkvNGhyMHZ1NGlD?=
 =?utf-8?B?a2k0Y1R1aXBtWUYzb3VLbTNCc2ExS2JJcm9LVFBpa09nbitYUXVzYmJtUnRO?=
 =?utf-8?B?WTR6YU1kN1VFZWF6ZFFpVHFQMmljSXNha1VKUjZDUDVyZm4vVDJWTjJnY2ZK?=
 =?utf-8?B?SFZON3oyWjllRTI0Y1ozT3NPcnU4M0lhRkRRTStxdEpXZTZoVGR0VHF4QWJ2?=
 =?utf-8?B?RldFYU16Uk5NNFd5MndOUjhSLytOY2I1VE54SlRLQVVLSWdqRXozVHlaelFD?=
 =?utf-8?B?R1hWSWEzQ1JrNmVzVGVUL0s4UkUrcXhWR0YvYlJ0aUlBMTdjcWZUcUJZaDZQ?=
 =?utf-8?B?WU1pVE9DVkJZc1N5UUhZd29JZ1pWMUlsMlhOV1lCZW94WmNPU2VmS05GdEYw?=
 =?utf-8?B?b3AySXBudDFZUmtxeUxITUk4anBYT2Z6ayszajB3d3JsbWhjU0JuTXlEenNK?=
 =?utf-8?B?TGhHbGdUekFnNXkrSk9ldUg1c0xLbE5JSlZ5dTlwd2JIZ1J3TXFrM3pnOC94?=
 =?utf-8?B?NjVtMFE4SWtWcS9NYmhPWmlpU1I5QlJwYTIrdHVGQU9HelNjRU5mY3N3bi9K?=
 =?utf-8?B?QkpaTWp3V2xDbUs0MVl6Qmh5cDRUZHhlV3RrZzBRQ2xmRkNDMjRUNncyZCt0?=
 =?utf-8?B?SVhsSHRKSi81bGNyeG9XZnVGaW9OU05od0RMLzhOSllmUStXbG0yMFo5MEpH?=
 =?utf-8?B?NlBHRzhJcitOYVZKVHNnVVAyZTJGbnlsVjVYbzR6QnpCUHBPRWZTNzZDd3Y4?=
 =?utf-8?B?bm5XTTJtR1pzQ2FnM1U3L0FSeFViV2FFNUs2L3E0WW9RdmNxOWxCZjBxeUU0?=
 =?utf-8?B?NWJvLzQ3N1p4a002d3FhS2M0cG5kSzRGVExoUm1jZFBQVTN2R3MyZlpSc2Fa?=
 =?utf-8?B?b0Q5ODBmaUp6NTJjalkzVSt5Wjc5dmlpUkZlb1UwdGduUXZXeTh6cVZScDg4?=
 =?utf-8?B?eXIwUWsxUkZRY3hmc2gzV0R6VE5SRnUyTmprTTFWUmlQMXFobFhxYXpmeDdu?=
 =?utf-8?B?OC9XMUFOM2VGcnpZcC9sbmN2TERpY3Y4WFoxd1p3b0x2OVJSVzE4SFZUQlNR?=
 =?utf-8?B?dU41RXp4dkRlMEdVL1l6WVlzNktSQ3lUUWczR0RtSTZ1NEJVTURxT1piOHM4?=
 =?utf-8?B?RXRqU1VNNUJrbnQzVXBDT2lCL2YrL3EvOTFKNDV3L3grOUZNN3Q5b1FYQzZa?=
 =?utf-8?B?R3g5ZVlNUXBuWGlKZ0IxVHFqQ0ZDaElrUFhQbVRaelQ0bFVPZ0lzWCtjeW1n?=
 =?utf-8?B?MTlVMFZRWXB2ZlNYeTFTY0JaUzJ2QTMzZFBFMmkzY0ZRQi93K2FYdFFieU9B?=
 =?utf-8?B?WGlObFNVNU9BRjZTVk9BQ0RldVlqSzhBbnowUGVTOC93NVlRVEdQVnNycXpG?=
 =?utf-8?B?ZUVnWllXS3pFcWxmdnh5ZUlQY1dtWlRwUmlydnhCNHF6TW5udjhqK2JPSEdG?=
 =?utf-8?B?RFg2V0RrK1lQTDZGV0tOZ0hmcVQwd1YzVW9kMExCeDZPd1BGMHVWVnBtZloz?=
 =?utf-8?B?OWtwN2ZCOUFFRE5xQmczcUFpQkNLdy9oaUYvd3BuQndXZmwzUzRkU0lMakt2?=
 =?utf-8?B?TFVlVUdFb3cwRHlEdDU3VHIwUEliRDJZN2I5MjVKQVdDRDIyM25oNWVWVFFB?=
 =?utf-8?B?L3FjSHRMdWxocEU0N09qTTBUUE04aXptUFgxK1RDU01Db1BDTkNrRjZaWkFS?=
 =?utf-8?B?ajRQb21DbWYzZjNJNFhqeHdZaWpDSWlFeVo0eThaYVBqS0M2KzdXUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b861a1e5-4af6-4e5d-29b6-08de752603a4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8825.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:58:47.1076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0mGIPhg7lhhUSowcZHQ/LFg+G4N81RHM25RgEB+nmqG8PVQf6hy0iAeoy+dEa5wpDajyBlBaJ2/HwWxk3RJ7Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11762
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33734-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: 069051A4BB9
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 05:13:17PM -0300, Fabio Estevam wrote:
> Hi Xu Yang,
> 
> On Wed, Feb 25, 2026 at 4:47 AM Xu Yang <xu.yang_2@nxp.com> wrote:
> >
> > Hi Fabio,
> >
> > On Tue, Feb 24, 2026 at 09:19:51AM -0300, Fabio Estevam wrote:
> > > Hi Xu Yang,
> > >
> > > On Tue, Feb 24, 2026 at 12:17 AM Xu Yang <xu.yang_2@nxp.com> wrote:
> > > >
> > > > When a port is disabled, an attached device will be disconnected.  This
> > > > causes a port-status-change event, which will race with hub autosuspend
> > > > (if the disabled port was the only connected port on its hub), causing
> > > > an immediate resume and a second autosuspend.  Both of these can be
> > > > avoided by adding a short delay after the call to
> > > > usb_hub_set_port_power().
> > > >
> > > > Below log shows what is happening:
> > > >
> > > > $ echo 1 > usb1-port1/disable
> > > > [   37.958239] usb 1-1: USB disconnect, device number 2
> > > > [   37.964101] usb 1-1: unregistering device
> > > > [   37.970070] hub 1-0:1.0: hub_suspend
> > > > [   37.971305] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0002
> > > > [   37.974412] usb usb1: bus auto-suspend, wakeup 1
> > > > [   37.988175] usb usb1: suspend raced with wakeup event         <---
> > > > [   37.993947] usb usb1: usb auto-resume
> > > > [   37.998401] hub 1-0:1.0: hub_resume
> > > > [   38.105688] usb usb1-port1: status 0000, change 0000, 12 Mb/s
> > > > [   38.112399] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
> > > > [   38.118645] hub 1-0:1.0: hub_suspend
> > > > [   38.122963] usb usb1: bus auto-suspend, wakeup 1
> > > > [   38.200368] usb usb1: usb wakeup-resume
> > > > [   38.204982] usb usb1: usb auto-resume
> > > > [   38.209376] hub 1-0:1.0: hub_resume
> > > > [   38.213676] usb usb1-port1: status 0101 change 0001
> > > > [   38.321552] hub 1-0:1.0: state 7 ports 1 chg 0002 evt 0000
> > > > [   38.327978] usb usb1-port1: status 0101, change 0000, 12 Mb/s
> > > > [   38.457429] usb 1-1: new high-speed USB device number 3 using ci_hdrc
> > > >
> > > > Then, port change bit will be fixed to the final state and
> > > > usb_clear_port_feature() can correctly clear it after this period. This
> > > > will also avoid usb runtime suspend routine to run because
> > > > usb_autopm_put_interface() not run yet.
> > > >
> > > > Fixes: f061f43d7418 ("usb: hub: port: add sysfs entry to switch port power")
> > > > Cc: stable@kernel.org
> > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > >
> > > On an imx6x-sdb board, I still get the inconsistency below even after
> > > applying your patch:
> > >
> > > # echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
> > > [   20.656414] usb 1-1: USB disconnect, device number 2
> > >
> > > # echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
> > > [   28.263516] usb 1-1: new high-speed USB device number 3 using ci_hdrc
> > > [   28.466813] usb 1-1: New USB device found, idVendor=0457,
> > > idProduct=0151, bcdDevice= 1.00
> > > [   28.466949] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> > > [   28.467039] usb 1-1: Product: USB Mass Storage Device
> > > [   28.467086] usb 1-1: Manufacturer: USBest Technology
> > > [   28.467126] usb 1-1: SerialNumber: 000000000003FF
> > > [   28.501826] usb-storage 1-1:1.0: USB Mass Storage device detected
> > > [   28.510452] usb-storage 1-1:1.0: Quirks match for vid 0457 pid 0151: 80
> > > [   28.517597] scsi host0: usb-storage 1-1:1.0
> > > [   28.524066] usb 1-1: USB disconnect, device number 3
> >
> > It's another different problem.
> >
> > For ports which VBUS are not controlled by PORTSC.PP (always on VBUS
> > regulator or Type-C controlled VBUS), they are still powered on after
> > you disable the ports. This will cause PORTSC.CCS still be set after it.
> >
> > When usb_autopm_get_interface() gets called, hub_resume will check CCS
> > bit and check new connection again. So you see new device is reported.
> >
> > Below patch will be a workaround for the issue when you disable the port
> > many times:
> > https://lore.kernel.org/linux-usb/20260223-v6-16-topic-usb-onboard-dev-v5-1-28d3018a8026@pengutronix.de/
> 
> I applied Marco's patch, and it fixes the inconsistent state that I
> reported before on the imx6sx-sdb:
> 
> # echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
> [  110.494838] usb 1-1: USB disconnect, device number 3
> # echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
> # echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
> # echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
> # echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
> # echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
> 
> Now I want the USB OTG2 VBUS to be turned off.
> 
> I understand that the chipidea driver does not turn off VBUS when
> vbus-supply is passed, so I tried using the pin as
> MX6SX_PAD_GPIO1_IO12__USB_OTG2_PWR:

No. You can't do this because CI_HDRC_TURN_VBUS_EARLY_ON won't take effect
as we talked in previous thread. Then, USB phy will work abnormally.

I recommend to unbind/bind the device for switching VBUS off/on. 

Thanks,
Xu Yang

