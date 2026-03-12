Return-Path: <linux-usb+bounces-34653-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLALDg51sml/MwAAu9opvQ
	(envelope-from <linux-usb+bounces-34653-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 09:10:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D5726EB1A
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 09:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7170732149C4
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 08:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662BB314A7A;
	Thu, 12 Mar 2026 08:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Snm3hwua"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010001.outbound.protection.outlook.com [52.101.69.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A9C3164DF;
	Thu, 12 Mar 2026 08:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773302768; cv=fail; b=RTBnny9FS2QdkxObyASAwym1W0clgpOYeW++5aE8fLbc9VfPsYw7zjYGJOTbKuqS/+MjV59xEb2H6+prcJHsIR+zS2dVunoKKUJe1dwyKx2bzJOrM1eUA5MtZOKH2ytudbqARcl4eaAamw7dUf95H+4aJKyTqK3hm4LTLiWvsMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773302768; c=relaxed/simple;
	bh=i6Rs/XCLa0crGjvSWfQw00AkDSz1/f6Xkf3jToF6D7w=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=dXCvV1TBiBWkjPECtrbciPtxRpvFD8jvPz8NYl2nHQtf7v8bn/1pfcU7KJ6pZ5sdZqeSyKjXsnsgSxVXjc79HgmGbkcIy2u7Lb6ts1811HGwO6dB1XD3ERU44PNaL5wHvvPEYmg4UeYjlvElKkxnUwAOA6f7PFCXOecBQAumb9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Snm3hwua; arc=fail smtp.client-ip=52.101.69.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IoJm/K6D2wGYYqmZWzu6UB3mEsS1b3b/yenbpXsE49Jj2nLZrPei0q/91wa673Myx60xhhdYmPQ1zs9B26DYACDavpVXG8r2kjHTUlN4oF0SzCIarJPXyymckX3O23k7KAMAGYwa/w+C8l9cPROIx2nilf4poH6qDkBay6uqqWdkfYNHO3FLGLweKr321VSt5riTCwmiXdIvxfzpsB83VqCK/5ElCIRuhlq4v53Tg8jJ7n8T8pNPG9btYs320nWuXHBCBSOTtSM1uedH15xuc01zBOuaF+epUHQHPJmGgZz1DwkbB4GoLg0mKo7IzudObVVKzPLBvcbuf9iYHmmitg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcKOF3aV0QQjo097KRv+1mTGAPyYccUy8KPDl+8jT8M=;
 b=MzPUyeeX40GU/1CVexvvb6+B2AoxX6jDjbrjZvECUy2J/xbzWoluYAs4paNQ7oWw/CyE74CFAGbvcaNJYih33csGKpBlbLG5gVD28BQzcFg9mPrtkJY3bIdWl6KxMqAsiE2xZsxV7oUjH9QZ6ilOl+CdZJtcHQ9AK8CZGUwfvGQnwObLBDSqVZV0Jdrmbul1OPQEpTPVA3sRiLGOFcvnYPxxhVO3UDY/q9cD72gdk5oEZ4bYKhhh9xhKDwE9JIflRHKJqYvsRP0yP/ZwokTs/7siMHcC2U/oD3eyb0aJvQLP/zxueYXMaP29/oCReZxetic9xCLTuL6Go36ZhQkCBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcKOF3aV0QQjo097KRv+1mTGAPyYccUy8KPDl+8jT8M=;
 b=Snm3hwua9WYx6S8o+SPx/775La9AKHLbqWXBRMzhYpQMC+k6843LJ15G1okuP/Y8zJdwKUqo8frGi69sgrxBsWoV8fH+8CXZcufYzEs6pb2RVRsavdDWOTO/21ZzQg1o4+vZOTchoQUPYLPkf8wh4bxlvwtu4Y8NsBJAfURjTcoueafEHQqSjfHU7KwGPYrSDKyYNxW005HQi5j6Jgbr8WS7OoVYLrw1Q0iEN8ee9dsWRaJoCwJ3+QOXN3I3jg0yUbfdaAyHuLjfmsDnKFAAn/7kWFkr7dFQwLI5S9nHy2/+qUmDRbgxE+Ov2TSH66/HK8vC6D1s8GtXfdmt6e0tyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by PAXPR04MB8427.eurprd04.prod.outlook.com (2603:10a6:102:1cd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 08:05:59 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 08:05:56 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Subject: [PATCH v2 0/2] usb: typec: tcpci: support setting orientation via
 GPIO
Date: Thu, 12 Mar 2026 16:07:23 +0800
Message-Id: <20260312-support-setting-orientation-use-gpio-v2-0-59c523a09f12@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADt0smkC/5WNQQ6CMBBFr0Jm7Zi2IAmuvIdhUdsRZmHbdArBE
 O5u9QYu30/efzsIZSaBa7NDppWFY6hgTg242YaJkH1lMMr0qtUKZUkp5oJCpXCYMFY9FFuqh4s
 QTokjXobO+MGqhzEE9SplevL2y9zHyjNLifn9q676u/4ZWDUq9LbV3vXO952+hS2dXXzBeBzHB
 +D+c3HWAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773302893; l=974;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=i6Rs/XCLa0crGjvSWfQw00AkDSz1/f6Xkf3jToF6D7w=;
 b=7Bmk/oMC6GXkRNQLyHCwAt7X0YPd9P7+8CJ8vIEekJWTWuhQiX/ub9U5mUEmaK9u6KI/OggMD
 Qd3jSTdcsN0BQknIBsYIgu405AsYYurjpBydz3BSTIRaM2oOsu9IQkW
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: MA5PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::7) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|PAXPR04MB8427:EE_
X-MS-Office365-Filtering-Correlation-Id: 637de469-72f6-4886-e776-08de800e3015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|52116014|376014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	62sTO4WLQlQJCpvSNLVOBfIfnP4Vgicp9eS+3h+8pxs3fk3Qs9W3sF4rRxMYEAUBYa69zmh6lNhAXYXfDy5PLkdvLhfIh6ZERbslloijmOPPylgTSnc2hY5h0Iu1koGXyOIqEScQHU1c+BcYKv8Lg9kB46u5OHSZbDlDgvDg7L/8GzuwN+MuLA0JwkvApnd0YVES1NQipua8dBweblExw8s53ClIngfCUVRLMovvnPyQZqPhKMWrzcNWEkxPW7qqC6pDiukG1mF2CVqlRVJ1ke7+i/1Ka1JLj1X8/sJ07esUEWcuUd7hxX+kurPOaq8g0EEWV54Fkb9UQbpMOx95HfFGeXUekgmAbfpxX8GgCLxq85Lwo227v70thOw3kakcZSrQQ203k4KbWf3HDK9jkssdZUM/U6Cg2Ge+w+x0uc+ZnfyJCQOGb7i5sfLHF605T+YoqsZezUgsOO08Qc9CNDlUb+Ol8fL4moazDseheF6RTC5yCyv2tAMbe3jkcdNOVRhAkp+fhSf5VQYnq/Qd4iM3HIS8s+tyU8Y+i2oZAvXzDqpDrjpFDLUT9O7O2cg/nbCSdt3sCITbv+zMENcTN0rf2IxLMww0DtrqumN0VSG0va+ltwEs+TbxvQ98SekV4b6hYxE6kc+w7GIUG4DMJLLQCFin4wbaxhLBtCP8v34LZgbOe9ooHJn+pC/eRysRwOcCZp98kdrp8FesnJRzYa2aAhzkuEkDF5HXfyJJzTCIE3ZpYC9So7/dldVkoA30GLAj+yEBslMtcoNq8CVEDpBcCup5cvAaG8kHpgxlBg8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG9XQXRiOVpYZWFnc0htT0tmeW9PVEhHcllacFhBc1NtRURMdVM1M0ZlcWRL?=
 =?utf-8?B?aTdpM1E3T0hBWDFXMFBZR1BBMjZHTGdGQ0VxbXNrVGViOUFVMkE0SkhCalpU?=
 =?utf-8?B?ckE1bjQ4SWozR1JEd0gvMzMzSkdqRXJab2syVWhXNjdQWUQ0bEtmWGlIZjFm?=
 =?utf-8?B?QzRkMTdlTHdPNC9JVkRNbmNyTVBRbnVUcUhhSmVVamc2alEwWEJQaklEQTNK?=
 =?utf-8?B?ODZHbW54cWFmN3Y0UlpFTEQvMUMzWWRsTG5jRHhDZTRCNnNudm5pY3ZnbEl3?=
 =?utf-8?B?UnAyUnFFdm9DVVgrZ1ZnOFVqbndRZmJEQXFyR3hlN2tReEp2K2pUY3dGZjJy?=
 =?utf-8?B?N052ZTM2dWhJZElnY21KZmd2OWQ5T29oTnhidzdwKzFGaDdEakp4M3FzdnhF?=
 =?utf-8?B?NEZpaVFKQ3FnRGltcE1MRmpkT0owV1BuZHZOaHZERXNXMFQ5L0JBLzBVQ3B1?=
 =?utf-8?B?ekc3Z1pJeGdWN0RvRjFMdi9jRHlRa2VvcnF1TjVidzB4QmE4cWRTc2ZoQzI0?=
 =?utf-8?B?UkZBSnJQdHV6VHZaOTE2NjFzYzJGQWZQZVFBUFZ5dnNZWWkxVGZZWE9veHVE?=
 =?utf-8?B?byszRWNkS1JTZy9RZjBYeXI5VmY0NEJZem9vWnEweTNrR000L09ieUVoWGNm?=
 =?utf-8?B?dGtiQ2NuRS9NU1l3clNRVDNISG5VV3RXczk4NUY0KzFUUjczVHVLT3JUR2ph?=
 =?utf-8?B?OE1YWkpHTmw2NWhHdXdyVkFXc0lFYWp2VW1xOE5qeEFJVzZmZHZDdHZJQVgy?=
 =?utf-8?B?YnBmWEw2MmM5WGswamFBQ1JOSXVpNU43bUdTeXZOZlFXenUza3lXNzlHWnJI?=
 =?utf-8?B?cHhydVJKL00rcGFMNGVrUnJsbTdqMjc3RzVCQWtsekFJaGFISmJFYTFYd0Nr?=
 =?utf-8?B?YUNWRWVDU3RGUnpjN3pndFJ3VGRyb0I1LytIalNtQVFhWUdIekZNVnAyNzRx?=
 =?utf-8?B?dXhielFnNlV2QWhSYzNSK3FnaFRFQ3VIdTJWRGJXK1VuM1A5WHRieUExby9S?=
 =?utf-8?B?OUh1dWhiVGFhU2gxQUwzU3FHeHBGL3dOVHN3K1V4RUJlRk56ZjB1VEgzZmRw?=
 =?utf-8?B?RTVrZkMvUXNqZGlwdWdPSlorQnlFM0Rxa3VtSWRSbkh4azNZODVoRCswOE40?=
 =?utf-8?B?U21kbWFJa1RnTUtYZjlnczFsRVVFZkZSelRGL3IvdjRVUjVZenY4YXNQbUJ5?=
 =?utf-8?B?V1pmNERVMS8yaHE1aHpNVU1sckh5bW0rS01QV0RtbzN3dzFjcGZ6c3llK0Zr?=
 =?utf-8?B?cXpaVmg2NkRHTzhjRHI2VERjb2ZMNFluTEZsYUNTUmpTNlRnd3FTQzE0Q1pC?=
 =?utf-8?B?MkZCYWhoWCtySU0ra1h5Tm16MmZIaWtnUlVYZDA0Zys3VE5uUXpVQlhpMVhD?=
 =?utf-8?B?TnB2SUJTZkwwaGxWNDBuVEdhaG5lNm1DWVBJMFFQR1JWVGVzdWtidFM1NTNz?=
 =?utf-8?B?TkNUV1BRZ3ppN2lzTXkxYzlZVUdxQ0hWbEYzMVVST0Z0TFV4aytXcDljL1VJ?=
 =?utf-8?B?VXpST3FiMmhRM3hYQkxjV2FUdlI4U2hBVGRrcWwwTjd3M1BLWFdZMDRhd2Mw?=
 =?utf-8?B?N3JwRjVxZTJRbFpmaEFIRGE3N0I0YjlVWjd6R0ZiZTRaRGdxV3pBRmhWT29m?=
 =?utf-8?B?d2NaSFlhMnp2eDVZeGdVd3Z0RVpUamRYMW5xTFdqTVBzTkV0L0pON3g1MlB2?=
 =?utf-8?B?S240aGlBVkVWOE9YTkw2Q1Rxa004VFNSZXg1WnprT1NEbGIzVVFaV1Z2NlRD?=
 =?utf-8?B?dTAzbk1tYllTZ3BlZzl1eFk4Y0N2SFltc3IrcGFRdkYwNURsL3RSOWxvRWEx?=
 =?utf-8?B?TDRCMVRZUzBmT21uVWp1QnlMVXg2RzBBeloxeVpUZngxNzJHVFZzRmlvTFk1?=
 =?utf-8?B?aExVTHpKY2tNVnlvenZ0a1ZOU0hlOUJOM0VUT2ltSkxRazNSZVhQanRQL2tt?=
 =?utf-8?B?WjJVUlNaZ2pZUGtOQnhCOEI2N0wrQndML1FUVDVwNzd0MHo4dkJ5SVVkM0ph?=
 =?utf-8?B?NU95TmUvNFdiYW5hVlRoc2Q4OTd2SjJqOHVqbkdhM01LQk5YVy9hMklkbHZj?=
 =?utf-8?B?RlhLeTJPd1ZjUkYrQVZ6elJibmxuVnRuREkvcWMvQmMyTTZjdlJtclRqVmdx?=
 =?utf-8?B?Z3ZubW9LcDVxWVdCSUtrR0kxd3VXMC9UeEhpUTVoNGNQYm9hV3NEYzFRZlZE?=
 =?utf-8?B?eHRoaHlMWXE5VVdWZVMrYThKZENodnVNSEVicXFpcXA3STRuQ0preEVLb1Bh?=
 =?utf-8?B?SDJudmNoRUFxZklSanNHTFl1VzkwRXA2NFdzb2hFM2VKWHhoeFZCdzEwMzBr?=
 =?utf-8?B?MUNDaFdVbUxsaC9VajVsVmwrOXdYMTFRYmpaK1NmTU5LYXliNkExUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 637de469-72f6-4886-e776-08de800e3015
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 08:05:56.0872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BChH5MxhY7f2ns5WR4zx/BhfOA+/C9e7d2n4BE9HL7EGlmyj/MdatL5G7JQYRLNkeK1BgZDCLFevkc4LIwX6LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8427
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
	TAGGED_FROM(0.00)[bounces-34653-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 82D5726EB1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patchset will add support to set orientation via a simple GPIO in
case the tcpci compatible chip doesn't present "Connection Orientation"
standard output capability.

---
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
base-commit: bb375c251ab40bdbc5272008fcf2bc6cd5266610
change-id: 20260310-support-setting-orientation-use-gpio-5942d9a0b22e

Best regards,
-- 
Xu Yang <xu.yang_2@nxp.com>


