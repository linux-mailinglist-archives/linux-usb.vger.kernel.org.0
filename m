Return-Path: <linux-usb+bounces-34381-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHEnAJbSr2kfcgIAu9opvQ
	(envelope-from <linux-usb+bounces-34381-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 09:13:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B49247142
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 09:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6ACA93023D73
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 08:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C6E3EDACC;
	Tue, 10 Mar 2026 08:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kWkxb4+p"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013068.outbound.protection.outlook.com [40.107.159.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970213EDAAC;
	Tue, 10 Mar 2026 08:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130341; cv=fail; b=cITIObHuJPHZJaLDi/PrF7G8cVcG3HL45GDdKaaFBSJtVVq4mmd6LPgoKfNkI6a8H5dI65AfDqB78fRKNzsay7lFePMT5CyzE5JUB1QEg50nc3AUfT1RNDY/rC9B1r+jDTuG6KN+OFXidi+CS/yfgxeCFLVNup4VKpo275vQseY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130341; c=relaxed/simple;
	bh=EnVO7X9Dvt0FaEZGybg5DPCK0eNPzMt1YoS0qcAtBbQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=leq2RISSjF5P9yiRkutlPI2V2zfT5LK5ABL1i18HFWob8nIaYhSY2ypvjosxBQZ0FS8ua79Pas0XIy0tIZTuZkPaGg5CKuuT+pj/8TkbzehbAQzavLQtgk0oDfHxgbbJLt0b+bmzsc/fQlVogGNl09wRSPdyOoBbhEJOIDyu6Es=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kWkxb4+p; arc=fail smtp.client-ip=40.107.159.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ksytOU/nEMYQXYYYKnuXdba7BXbYg1OhCMs1DqQknb4983A0VeIULuV7BIieHmDjokeZoZHf5mK64J+EF+qkkinx2qN/2wNizcmGbjuVtDMxodhjFcVZkWmwmB1Kn7l/DEClpgrgGUSTekloUjtoxnup7TETrFksKPVcv+2nrvVuUSWiXVy2VaL2u0d8GxxJ2wGCFK8BIFdvR3TBu1T/fxdOkQNAtl5QSN/dtihnJcmdlX2AphMq5c5P2yuy28Ol6WwRIRNR9Wvb69V1x1F+APWP8xCGe95qSgdvk0N40fFMePrpbWtH36PMwSJwGaUnXNM39c6/6NO/S8EKzmp//A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lmRUZ3bSp/gXgbK937/GNnem1eSaHKqMnP0bHC/7Y4=;
 b=dM6ZtRFne72qc7SjhGYLL7cK+iCUSMpEvP92whlJYWKLIU5txGqgSvTPajoDg52xz5fKxXBrXOG6oAkIYmQXGurGZXL8Lw9kmmi78TZ+DTYd+QOVxEoon2Lq5qyTFcVI3vVL5RG5nBrXYETWq7y9xXqQEmm/JEk6MKHGFrdJOhEpnXtGiwTIhPo7WvluznCJwKLOl+6aplmFWjQAnB93hEFJOv9fiJyXMs3Elfvrt+hO9y3H4n7+NgZlvDRzoM0AK0VGwgE0fwqwJWo3LxmW4yBGpr3QP2w/KypwaNaNVFLZg7adVmHq2dKsC6RUkK2/u3i1x9IiuNRBlI9xFLIPwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lmRUZ3bSp/gXgbK937/GNnem1eSaHKqMnP0bHC/7Y4=;
 b=kWkxb4+psIuXy00WxM7AP0mWFZh0K+htUN43RCcSa31UX+zv2ipyNwvkCO+NVx21lDpdeiJeBs3kBA4Lw8n6WB1chww02px/sVSTCzsJ2IQzo4hVNQ+MsXeCl0Uyw8cQ/bbotL6vf9CQII/pBxFNVLIiB8KYq8hOE3Dlz/imz3BJr2IAWm+mMAzyyKPDgpOq8d3kiFXb4MDqGQvcDJXl0OyNrdyL3CTtbkmVabqleEKM6xJggiB8dXGkC0Nz8xDhjqEBaI+71MJ1QAa6a+q4zUekJSfZBT3u4AuFWwTtzKDOiJFY+tV/9S/lcEP5gNgm5jZcGaz8FFvyWbynshM4sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB9471.eurprd04.prod.outlook.com (2603:10a6:102:2b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Tue, 10 Mar
 2026 08:12:16 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 08:12:16 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Tue, 10 Mar 2026 16:13:56 +0800
Subject: [PATCH 1/2] dt-bindings: usb: nxp,ptn5110: add optional
 orientation-gpio property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-support-setting-orientation-use-gpio-v1-1-da31dc6cd641@nxp.com>
References: <20260310-support-setting-orientation-use-gpio-v1-0-da31dc6cd641@nxp.com>
In-Reply-To: <20260310-support-setting-orientation-use-gpio-v1-0-da31dc6cd641@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Li Jun <jun.li@nxp.com>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773130459; l=1320;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=EnVO7X9Dvt0FaEZGybg5DPCK0eNPzMt1YoS0qcAtBbQ=;
 b=6aiBfqvFbm23GMLTs4JtWLPPXGA9PeKFILvzrTn+xa0Xb1cCkINbrrPvDdZdBmH7ZG6i9vHFq
 DdFhr5A0xmUCPeEn7Gmbgr3dkt145YJcCwqSNXLASz2MXJVP+zflHc4
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
X-MS-Office365-Filtering-Correlation-Id: e0fda3e3-2b94-4c24-dd29-08de7e7cbe0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	aX/RC5+1jhY5KYcRrXhERZ/NF2ZWaWSymAnoYclm+ZUNLiINpJGY6prwskCdjufB2Fbn8PoJ9beWHbJmF0ff9O04XBcXXP/3ozP4LFJT5x4vEp33aRgLbmo0IE6CzXZIOaBanoRIVJqkGcEp1yq92nnYtYSvwBsOQ7J2DxHiPxRNXWY+KqySojYbb3BlM8yam/mrL6qatdkJiOAquHd8NicsjwKZI6SHXp7sZC+ReshPWfLG9Lo2xMexbIMuMyVSHK4LTJJpmLZ3Giq0mdbxamFk9AeSLV7bocxpWDMOP4+Kui6JveCl7rzc+jAkBrGmCP5HdZATknuFHGvBHCadPvFA8UF7hMJZaPmu0maYMeJFidh5V2JzIXEBt8KezdnnpfOZbXWLsENSPSq61TtYOW/hacOJwyIZXDnvCuM4SzsphU7/E7+xq1k4ZpWbLSzdRTDPsjG6QWPcbS+zAqxvJtZmXBkLcwKI6DZlGOI6bEq5UairGsnOzkL8uR0kqrBezgnlKXrUJPxFdFjyJRacI+gQYtdizLthUx3/XnHFA8IWxGtRZGb/H4MzI/wo6po50uzF+dC8uBYFH4YpPfGJhAj7/mNimsyLFMekrXFvnlx2oPafMnYV7cfQW/XxOg4EtwhA45ayVTbvi1JH2SI6HuVzkdRRlWT8+dIUjaBvdIVXszc+dgwclNLjArGMnqQFsNJbB+q5+grYSYQ0pKoRAhIAjVOinG+egzMSSiqgyjq3yEeEvwbPdF4itP6AS/lcmn9xQvUPYw2XXWsyQ1kGtse8/Bimw7jzHOPyP8nRaxM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anFwTjFGTXRaVTI2ZUNFZGRIWlBKcE83cm5oaUpNT0kxMjljMWpoV2Z2bjhV?=
 =?utf-8?B?N2lyN0pGOFFQVDcvalFHNm9TeXZaZGZVQTNEeUNvLzNFWVhJYTFtOGRkWDhW?=
 =?utf-8?B?blB1bDFsRjJpL2pkU1JjbVA2WVFVTGptV0ZWeno1ejhYVzNTRE8wM2tVME1o?=
 =?utf-8?B?bzZVQWxDYU5ZMWVZUU1KK0gwTWdqK3p6dldXL1hwTHpPenpsV1NNN0hkSW0r?=
 =?utf-8?B?UlY3bi9NcVkrMGc2dW1SWmgzS3gwRDNudFJsVXcwMkVmVDZKYm5SeW9VVWxG?=
 =?utf-8?B?NWJTdlRCZFBwUExQb3lDbjdDZmtDV1JSL0tXeDlFWmRvcjh1ZkxRZno0bUoy?=
 =?utf-8?B?dXVMN0lYY3BIV2tnck1oZmwwS1dtL0x5WjVxb3BpNVlKUXFONHBnZlhDOGRy?=
 =?utf-8?B?a3l5ZEsxSU5nenZOQmZmK1N3a1pHOE9NNzJsZ2R0TFpjWVZLU0FQY2JYL212?=
 =?utf-8?B?dWd1U1NKdmVDWENGQmNQR0hlVFFDOU0yYytTaDlIc1Q0RWR2RUtBd2xqTjky?=
 =?utf-8?B?RXZVV2tCTVRjTWdRSERPQUVkcWRrVGRFOWhBZ2FBMnhZdGZwMFpDaStaMWNt?=
 =?utf-8?B?cjJHdFh3K0phUFo3cFRYMVJmQzh6YWFZREVQbHRwYlRpYkhmcCtwTnlZc0Na?=
 =?utf-8?B?RFU2M0NKUFlPZlg5aFRSZmxnOVp1WDhxNm9NZnpYbnVLbWdzZHFJb3Z1akM3?=
 =?utf-8?B?RUg0bXpUb3BnaVpHaXdoOUhkVzZ5V05GTk0xZlF5UDVLVUhzWGRybzc3RUlO?=
 =?utf-8?B?UXJGUUowdXpsYlhLTU9BM2VsbWpDdjFaYVkzYXg5dHJEUUZEWEt6eTNmVlpr?=
 =?utf-8?B?cWViVDBBMklUcUhHa0tnV2hHZ0pJNUVscDBvQVVUN2dSVk5YU0FSQ2NScHlm?=
 =?utf-8?B?N3I2U2t5MXhOTmFQczh5RU1Da3JCeGhxbmhxWm1DcEhlMzM5U1g2YkJ1REdJ?=
 =?utf-8?B?dW5GWURMVW00L2tOS25yWjNPZW9Sclduc2QxbVYrWjJCZ3Nka0Z4ZHBmMFg1?=
 =?utf-8?B?VFFMbDV2RkE0WHN0ZFBWYkxrbkJQb1k3TjFMcTgzMVRuTmFIQmZ1VlkrU1Uv?=
 =?utf-8?B?cG9zR2c1bXdkbFFraE9SbExoOVl6L2ZCRlhMcitRWEtLb3NubzNwVXM0czd6?=
 =?utf-8?B?UldjL2dveUVUc1EvL2JvVUtuSUZaWjB2cm1qT3dFUExhU0F6YWpxbWVqbG1U?=
 =?utf-8?B?alZ2YzVocFZtSFRYZXNEcWZXVm8wTHJUbnJhR3dDUWtFMlYrRkZ5MUppSm1n?=
 =?utf-8?B?UlhtdVdYMXJIK0RJU041aGZMd2NoVXI2Q0xYVEtrSFVpL1V4OWZFR3pWblJH?=
 =?utf-8?B?aHdMU2laZHAwL3AydGUwQ0QrRGtSclBqTUdhOW5XRmFQUHpnUjF4MHBLVktO?=
 =?utf-8?B?UHdYYm5mcHhHK25Mc0R2cVpwb0UyWWRCOTZsL2hFckZ6OE9EUGdEYi9IM0dT?=
 =?utf-8?B?eHNJaUdyOWZTcG84L01vcEowRGtvWUxqdU01aXRoNWM5WnBOSTJ1VFk4aXdM?=
 =?utf-8?B?TlA5aExpZ2xvdkVVUXdsTlkzL0svb0M1RzF1a3lzeDJYWDY0R3craWUwRno0?=
 =?utf-8?B?dVRBdytweGlJa3RSTkV2ajlQQldmS3Z3ZXg2eEovbytFbFhrNG1UNkRTbW8v?=
 =?utf-8?B?SnVad2VxNzFuRVRKNDBmRVhrV1NuazV2bTJLZWN5R2tESFRCaE9hOGtvS1dB?=
 =?utf-8?B?T3piN2hmbmUvTHp6SUZPbk80Wmg2bEVLdEpuL2M2dkpYU25LT2JsSW1JYTB1?=
 =?utf-8?B?ek8yQm1PV1hkZnFyVUVXbXpqMVdLRmlaYzV4eFZ5WWlsL05OMUNLVkJOS0pB?=
 =?utf-8?B?bS9Qb2NZVFAxanhxUnNMcUY1eXhxUENhc3AzOUZuYm81RitxQ0xBNG8raERo?=
 =?utf-8?B?UiswUGhnRnh0SUhXL2pSajRBemZoYXJOMlVvYnJHTEZ0Nkpya0I2Q1Zkamw0?=
 =?utf-8?B?SkVUVnF6L0JuUnRxNlJwL1FUTjdKbHBUTzl3WlRvVDEzWjhSUWNRM1pGNnNF?=
 =?utf-8?B?VmhUU0w1OG9zcEprdXdvdXVJYlBuTmk3cWJKYzVqWjkxa3BlbXhGa0JmQzZR?=
 =?utf-8?B?SnFlMy9tc21xdjlZR0s2SGV1VTc5VWM5dUFwaEJ6eW10c0Y3RDZpZXhWaU1Q?=
 =?utf-8?B?ck9odVJ6NVUwUkZtMVFuOGFvNEcxVzhSWmU4TFcwU3hENk1tYUVDbU93eVNv?=
 =?utf-8?B?Z0FtUEt1VCtybWNTU1UyNExBTkRpYXU1T0tza2o0TjBhWm1hNjhkWjB6U2F2?=
 =?utf-8?B?U3A4dVh0dk9IbFduTTUzYmExNU1yTFFEWWMyVEgveFFxRjlJbkZzL1lSQjdH?=
 =?utf-8?B?TVZLa0k4ajZRNnBJSTAxelNOdW1yYlcydVZ1VmJSeXdnQ2pTb3F0UT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0fda3e3-2b94-4c24-dd29-08de7e7cbe0e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 08:12:16.4035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5PH9lncElbsb49DPzuMa4iG9V8yqQsKrx/KYNW7faLc8qAPbBqLVgOZhIZLV0gyt+DuAp7Q3oW6tvfYNSe4hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9471
X-Rspamd-Queue-Id: 02B49247142
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
	TAGGED_FROM(0.00)[bounces-34381-lists,linux-usb=lfdr.de];
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

The Type-C chip know the cable orientation and then normally will set the
switch channel to correctly configure the data path. Some chips itself
support to output the control signal by indicating the capability in
bit[0] of STANDARD_OUTPUT_CAPABILITIES register and do it in
CONFIG_STANDARD_OUTPUT register. For other chips which don't present this
capability currently there are no way to achieve the orientation setting.
Add an optional "orientation-gpio" property to achieve the same purpose.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
index 65a8632b4d9e..866b5d033f4e 100644
--- a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
+++ b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
@@ -26,6 +26,11 @@ properties:
     $ref: /schemas/connector/usb-connector.yaml#
     unevaluatedProperties: false
 
+  orientation-gpio:
+    description: Optional orientation select control if the chip doesn't
+      present "Connector Orientation" bit[0] in STANDARD_OUTPUT_CAPABILITIES
+      register.
+
 required:
   - compatible
   - reg

-- 
2.34.1


