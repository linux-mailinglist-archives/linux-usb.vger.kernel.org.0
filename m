Return-Path: <linux-usb+bounces-34708-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDCVMkYQs2k9SAAAu9opvQ
	(envelope-from <linux-usb+bounces-34708-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 20:13:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB222777B1
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 20:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AF60305DA3D
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 19:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E060A4014A9;
	Thu, 12 Mar 2026 19:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LNgCZvbw"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011052.outbound.protection.outlook.com [52.101.70.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2813C3A6F0F;
	Thu, 12 Mar 2026 19:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773342787; cv=fail; b=Mjop+TI1gqbp9K1MTfOhqMI7n3hpFuLHb/TO9W8oLBQN9mGjZ72ISDObeLuqCMCFeukdzpJL5WYBfpLECz8GxqUoQVUmKrB3zlRQymTz3Lf/yZyvYVGZ6oCL+cFu8Pm6EPZR3n7d/UCaFuoEQQbrOycemyc1Ba15qOb4qJHaaYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773342787; c=relaxed/simple;
	bh=mVf+wR+cpFrrpOvqaWj8S9TEIiGgVZiXkzwlY/v6CTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BS6wCyvMVT+jDhEkAtXl+Fly7JHHsi2v8r50VQoHM1vt9o7H5U8LV+x+Lz7sk82oL+xAYDnzYX/+zEEZdmVF/TQzHrxViU/UJbfnkqM30EVzN3WHlrdchWflNmxUoe/6IQy9bGvq7KbnSVPTfTcGyNzkCawP7wty7DDpd5Oav0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LNgCZvbw; arc=fail smtp.client-ip=52.101.70.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSQwQcuVGgzEOJ4qBLK2FPsOS7JtmOz3U/puEKWceT0Lb4vJNbecIP4V0bSvF8itXgv19QzbqFH+ioyO9NUsDwVynjJ36l94jD5XZ82zOsLJZKggfWmacMZHexGG707uXAwfv88qvBbmugZuYhIYfFSm+rnkkdejrAyd9/qZGYXOOfxOCldhUMtBv/gaTZIo3YbrfHqYV8kW4LRsikdS/oU2xaCYSkz8kyrNdw+Qi0uQgK865zOuEnpC7R/8oWK4lP/sEiSn699MzaxKAnx0QU8fAyzNzZQV1EZRQ0q4pSm+9X0/vLHnd9QcVqTHTb+QpXvkl4c08RO84zlJG0/lJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39e/ZIOHQowVPvpbX7Akwhf0Krov9TV2IoyEQnllq+c=;
 b=qidEN7f/YEn8e19WERFY8yd1/GZKVbhNpNJiGImVEBU4LU0K2OTy5nJ15qya0Gr/Zt+P1JnVzfvDGh+yulqJCH/+vhNKUA72xRnfPToTZPEvX40hUVQmRt1WmfGHlvMQdq01b6mdwXQaBQwERPYEIC/mqd7AgKzI9UJezCSKlAGWvxH8C/nS2QKGOPNR/0/dqQysM3/LgYG+SHU4Z0FrLCQtEhMHoEBFh22MOheAISwRERoENu0nPmCUqyvwelFjVAMPtsr72V1LfDR1Cb4fTGE5+sKQH49RuBi6ZxxoNos6T7RJTB++dVkd4Zrs5evp1r5v3arMS8zZW71C7ISCBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39e/ZIOHQowVPvpbX7Akwhf0Krov9TV2IoyEQnllq+c=;
 b=LNgCZvbwe1NQmr50+0ySq696AU7Z6NtueGji4iQOWRjUYm89599pZY986TlYQVkKsebypW7iPWBdwTP94JPh6NT3CXg8/FwH5IiyJ8ez3giNpVg3cphw9He27I/g1PiQb7Jmidus7cnEnRU1PIVeU6tnJag1F5HqYMjEyYuH4IHU3H1CA4Y47xopzRdL7VY5uQkz6EZ9p5T/T2qiwrm9S9gUfDjeaijrgLQ7KtOenoRwnTRwYTSzERdZqSc2c5XtnPYBDBBHCoSKddf1dnc8jIifPhJ1ACy9aOAAcN9RQNjFgK3/VjlMiDeLffPz7L6rqYyhx8Xz5g2pUZLpouGUUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB9133.eurprd04.prod.outlook.com (2603:10a6:150:24::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 19:12:59 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 19:12:59 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Li Jun <jun.li@nxp.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Frank Li <frank.li@nxp.com>,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v2 2/2] usb: typec: tcpci: support setting orientation via GPIO
Date: Thu, 12 Mar 2026 15:12:41 -0400
Message-ID: <20260312191243.3479247-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312-support-setting-orientation-use-gpio-v2-2-59c523a09f12@nxp.com>
References: <20260312-support-setting-orientation-use-gpio-v2-2-59c523a09f12@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0055.namprd13.prod.outlook.com
 (2603:10b6:806:22::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB9133:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ad67a69-cbda-4ee4-61e4-08de806b5fe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|52116014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3IXBBmHc+MqY2PYHFGvUBqdDgRVrhfS3Uow3nuI7tz75/oARI30wtF27CkzOTjYAxKx2KX9dWZZYMV4Ao2KpLLMc1j4MnuEYFVlYCcsW/EktXRUKWCHP04ZOMa4m0UI1ny4QWpI3Q97Q9fALcL71U1FfYYiU7ZyLkLfaC61QySZBlaFq+T5pxIdVQ3YV7Rp8++HdwU3hFNRVgqBiucjznL9OUlRbYahQXHR1Bps/JQLnNWT3ok5xp6nauJwucRRiG7dUuASt0tyBS8y0xdYkdrqg8jFidSw2GMxdf1A5qxTBXV3ID6K4otTZBqSwmsHlIBhcSxM0D4l+xkv91b2o4GjSHZkMm0gQ1BkZz+v32iXQOzVPYmXfclci5QAXV1TfU663TlM1Sm+Z2LiTJvzgit9RXR/a+E+LVtWDgh94KNeZvyk3s5jS1gbmaJH/Ug9t4wHqjJHiSAw6smfaS2m6IMSJ9oC2/eXHFz82KqVgza7L0F5u/48VKD13ziYE0GHG8XVKst24qbrG00oFkNy5th6qTfyNlBOW1Xfl2HNq+irEFCBzmXLcA25wyFwDjKoTybpCaEPkpeyWIQBisi6DtGxaKGfffc0OzDLdv+0ipnT5B/3WG8OFbkZdZ8J1343JzcA67rthS6Gmt2fWiJ/nWNkiHhigTM8cirgvQXW4hCRpTbQV3FEAMVdvETgyIccwJz293eNwkTGHMgPqaYfaKaKwrErmVr0EyiawsaBcUPIup9S+d3xNTef9gNvhWI4FOaXAbZoxhZvztN/WcRUI0c+6TWvra/dM5Rt/176utMw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MTqU5xthARDp2/YY3hcqB1SkWrl3rvINz0SqljNY4rI5qgNYvOGX8Bx/oHBf?=
 =?us-ascii?Q?37Mbyp+vEc19xY5wMF37bqkjdQ/sWrxwWyzLLF7+0mU24LJuFe50cP4RoP2U?=
 =?us-ascii?Q?TL2+Q8ejtt9DaFmZCkaGSwKEjabJVqmc/SJFyLKxUwxf9vh/WaeKat6qWI0K?=
 =?us-ascii?Q?9EZAvHhNEsq0ytlvLrAzROvFTalJ5Et2PNIbdWZBcrYBhw3BLl+r1yBV4Rdr?=
 =?us-ascii?Q?9bGwIfFtbJ+pqFVT3XjW13muQWg9Zl9DceCXsiXPDZeJ+4Dd9WS4R4x018qU?=
 =?us-ascii?Q?nGXDucLSylazMFIr9X91atfQqvFIQYJFCjmLF/bYqyQfdwKv/gugPONYjlV+?=
 =?us-ascii?Q?ayo1tkEbXX/o7ol8ytbf1MqS0GgUxDLlBkCY9jy7OAPzAsfbZZR9wgFSgIme?=
 =?us-ascii?Q?ObUqnGXJRC3IHI384M82YACAKQ+i55kW6VpcZNwRe9LmkGAYWDpDRKe6Wz2W?=
 =?us-ascii?Q?0upC1Ifqd6vHpJOj6+fUpqut9ovtLEjgtUVQk6E9lbUYPNHmofAew5/RlCAN?=
 =?us-ascii?Q?20IcfjOQsk/HIO0q1CLZLxhY1otNveZTdAm3+J7YX8ofeltmBEAOlvwbYSnD?=
 =?us-ascii?Q?lS/D0vMrLHvLu1DDTM3GNOjdbgiIy6GrDNNvcpET3MwUDgteu6MoM4jQQB4Q?=
 =?us-ascii?Q?Zgsp/39mjjwLh6atMcqdFHe8TzjSRFByYjF20KVCPQWIDZPiA+I3WBAnz4k8?=
 =?us-ascii?Q?cKc2R+ARGWch41hM+iCnnSKhf8Azj+RPreiTAS/aZygbsrj6Ou+lEQbDR9OA?=
 =?us-ascii?Q?GkPpKh+TKCKJ/iSLk24gnbdyA2x9tHZ8WLYGxnBdwg8zkFiQa1PWDQ91bXzE?=
 =?us-ascii?Q?3SUaZfR3viVb+oAhwzs0y3vE3CwECRS6TH3L5DhfKQoaiLgPnhJUMymzoQ3d?=
 =?us-ascii?Q?bPD+POVsbybdMUa+9jo+cq1ihw/inevkVj2YXsklYEw8v1gXClNgAVfqDGhf?=
 =?us-ascii?Q?8lcbVQBS0w0YkxhmNkjJ9N1jopm0tI/sAG1XOC5niObC1fiukYDYpCbNoMnU?=
 =?us-ascii?Q?8B3jQZn1pYLZq710eMWsO8qIGbAjDd6SRCri+obi7isKc/882if6BxthToMd?=
 =?us-ascii?Q?Mf5ZbYW4zMmmh2qUD5f8/X/JH74M7h1+R5EOpGsVoaS71XIsZfAU07aqeenm?=
 =?us-ascii?Q?dF4snjUmz7b6i06fP6T6+lkRx5n/3o3UeQ5PLHuXMnJVSHR0nsOXVryplZLp?=
 =?us-ascii?Q?DWBCl2ueTmsMJJKt8bKr9jfW/0a6oLVHGYy9Y4KlWByx5wp0K7Qm86YOP9U0?=
 =?us-ascii?Q?xu6bqT7dvstzQI0ntuz7Z/bw35bA3Dpejoaij+nt4DD38Su06QXtm4dsqKnA?=
 =?us-ascii?Q?wlTSnsHYyTyLgrxaag+0pP/gfkcMuUQqmUWR8WYWAeW9DGo6L0zoUpdpje2a?=
 =?us-ascii?Q?yL0/26v8ltzHeEiPHqgFRKwZUsNXDU0iVZ7rdCM7pH7qYiA+QfATR8vocDr9?=
 =?us-ascii?Q?5ShbAHP7eM0Tc9LBXtmd84TV3mHbO5wDQ6s/WPOLhtCAgNTK4CGPPleK2qk0?=
 =?us-ascii?Q?yAQI7Ev50urvD4jwx89P6z7Y4IhTFFnMcu2xLd6PNSMYYW6YfkdkpBuMd28J?=
 =?us-ascii?Q?Lw3V0Ui/x2Ip1GaNp2ZjqjIdA0S13C9hPku+u/CgW4vk1uyFegWTB94fTH3q?=
 =?us-ascii?Q?VgGZO9VtHrA/vvnUVyVQEc6NobOThkum1ksipuruglgMsjj4ZrN6GpbGQzhr?=
 =?us-ascii?Q?/+5nV7CWjJ86Mg6RNAzKmfhfbj8HkEJMJ2CgS3EM/yqmsM+E?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad67a69-cbda-4ee4-61e4-08de806b5fe4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 19:12:59.5974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDon3tWOsPfUPU5sJQ3gfCbbHdYM+X7jcHD0ps8BaFZ26+a/+LLo1CHiQHWxQiK7M7gVO1rMOTHrQOJTEeko/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9133
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34708-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 3CB222777B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Frank Li (AI-BOT) <frank.li@nxp.com>


> +		err = orient_gpio ? 1 : 0;

AI: Redundant ternary. Use `err = !!orient_gpio;` or `err = orient_gpio != NULL;`
for clarity.

Frank

