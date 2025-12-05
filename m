Return-Path: <linux-usb+bounces-31192-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F35DFCA5ED3
	for <lists+linux-usb@lfdr.de>; Fri, 05 Dec 2025 03:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6592031496FA
	for <lists+linux-usb@lfdr.de>; Fri,  5 Dec 2025 02:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90E2246332;
	Fri,  5 Dec 2025 02:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GVfzF+HS"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013071.outbound.protection.outlook.com [52.101.72.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195731A317D;
	Fri,  5 Dec 2025 02:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764902921; cv=fail; b=XSwdvs5bNNX6xVkdDomNXjL6ZBtGuClrcRJuxceUQhTyrDfLatK6qcd8ys1W6V81PeNduwN8V1BPg5PqyW5P52NyrpXF/75nmb4AHkN/NjL8VY3lgDO/wpQzg5br0oZVPPkGCfO5L/64ozKtq7cJRUCznWTZF9yGLMrnlEBMIbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764902921; c=relaxed/simple;
	bh=vf0pmMHfkP855UW6ISOQ1DP+OemE1JIfNauKZXppbbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y/ETrSMNn/wwn4ifQt97wZeRF7rUkjaedBFDfGeTFIflGOfO/6fzwtaBwnIQjr6+TPDAjls7+cEdh4fn7NzFG4ABrFPHCR4gNzkHBJNonfYCwH2gqqNaXP10EwGoYS0ci+O4K4eBCMmxSWAFW0pz9Ihv8ink5woKJ6E5JQ5OoyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GVfzF+HS; arc=fail smtp.client-ip=52.101.72.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GDZba01VXGnAplh5CJJ2HibR/7Em6su5C5IFVX6nfuT7Xnsztgj1p4UeH7RIyN7w/T0stiMc34YZASS9Jph7LtP3vUuEonSDOlQTiaXzHlDrm9oCatEOoRrtXAHhARwS3/aK61KMXd9Gy5Rr8GE59nd4tFwWGREUc15EgpXV0EAi2iVv0Y3NG46e8jrBV2wT6EhSdABY+pEAsXGioVgvwgiboV1udjyQjZIfGNJYu81B1hupjkuBIfrFHtcqOCjmsMVQgqMXiKq/41nSG8zosULzcu0B5wD053KfrmVOMGYPqtNzqS8VBdtlTUawX3oUP0P5DZ4f60rjZOyJuDprQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3V3e12sGkeOrzFtpEF7+b1EFkEJYeS4dm7/DPTGQjo=;
 b=D+R/V76S6LyV4q8XrUfqmG47jZaPviIZ/BxXwD1P1PB7KlecxdxWK34w1XwZehNz/MzBYYJxk+pFLjlf2YE5NbtlaUH+foyA5zENzeoU03262DtfWvdr+a7J7FiO7h/yN45a/ulLNnFxCsA5zjISVB91pxJtuE0nKdP1J3vWCogWU3zBpV+EXA5fwzetksMlJ6f872a5N1DCDAAlxn0BLEtvCQ9v9KnB15vUJOmD3pD+QcZ9jUK7xyHOttPsWxVwU4zrMWg1i+DzIL9AzRGfLMYfrYjkAsmxvXwpRLX/Otwxs8AXLMXZFD061xhrO9j3a1WU34D4L9wu2DIWlrjGLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3V3e12sGkeOrzFtpEF7+b1EFkEJYeS4dm7/DPTGQjo=;
 b=GVfzF+HSMhTrrUqCyMs3++MoRaBJ76GC2rlwGlLSOm2OzbsDPU9Y5wE9W3QSMrHSb0TU+bOu/6MML5cKXFwvAwHRsTZMKWM3Q8URZBOraEXpGmCisnL/9fx7DtTyQZbtMISWA3QB9g+TRL+9PbaXBPOFd9Awb22fa4wPDEkVQzH1FH9OtBNNbWwox/UMQD4434oKif+MukRF6uqlQ2uMv+RLiYRulV8jBO3C+W7zVYbo1vZLvMg9FslHJUwCpVb4qMWpfU8vrpZadVCScL+K/SFD+GFOcZS2K4KmwcWfN19u7ikIva0fC9sgb/7dUcnQlDloQewEkcM1Z1V1bQxvqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9SPRMB0022.eurprd04.prod.outlook.com (2603:10a6:10:366::7) by
 AM9PR04MB8841.eurprd04.prod.outlook.com (2603:10a6:20b:408::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 02:48:33 +0000
Received: from DB9SPRMB0022.eurprd04.prod.outlook.com
 ([fe80::8c26:6739:46ea:171c]) by DB9SPRMB0022.eurprd04.prod.outlook.com
 ([fe80::8c26:6739:46ea:171c%4]) with mapi id 15.20.9366.012; Fri, 5 Dec 2025
 02:48:33 +0000
Date: Fri, 5 Dec 2025 10:41:42 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "jun.li@nxp.com" <jun.li@nxp.com>
Subject: Re: [PATCH 2/2] usb: dwc3: imx8mp: disable auto suspend for host role
Message-ID: <qnaxqfnnjxx4vnsceemcgsq37uai4apqypcjiudyrdb7jrz5bf@qyhzmjf43vvb>
References: <20251105074504.1427926-1-xu.yang_2@nxp.com>
 <20251105074504.1427926-2-xu.yang_2@nxp.com>
 <20251113230541.wbzt6xbine5gdmpp@synopsys.com>
 <7kpf7gnftumdwdowutryjz73nkap4vp3cfisrigt6def4f36vg@ijlj2eqwzsip>
 <20251121003742.q54ouezxhghmpwgn@synopsys.com>
 <bj6hroepwqflz5z3wabxacfhxltt2u6x274gd5v66rihosy3my@pzgq2e4v45fx>
 <20251202000013.qnv3nkhyr7gtlu6n@synopsys.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202000013.qnv3nkhyr7gtlu6n@synopsys.com>
X-ClientProxiedBy: SGXP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::15)
 To DB9SPRMB0022.eurprd04.prod.outlook.com (2603:10a6:10:366::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9SPRMB0022:EE_|AM9PR04MB8841:EE_
X-MS-Office365-Filtering-Correlation-Id: 54561292-04ce-4b95-9e27-08de33a8c72d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kSd2ldBapCQZtxCfy7/Szj6+2/1WNGWMlJAS+9VH78v0cL/MV7XiE2xzfcju?=
 =?us-ascii?Q?izWmlm2ev0nbapis99xY831vWDdRB5S4JMlHxp4z6UO2YLTfqHqUV1p+gFmV?=
 =?us-ascii?Q?OZHeQIqVJBBmvXjC5ChKdJTHa8n4ihK+Q5QtjnBY4z7uW68CGI3G0qgnvUhm?=
 =?us-ascii?Q?Cx+71V2rgtijQsRTA0KFVWGJkVYOa6R+oJMhs0Nr4XYAuV3WXgF/Rq3S+E84?=
 =?us-ascii?Q?eqT6uvxwYGG7r4xxj5FJ5sABpzx8JFtbr0e39LYsG8tscYrPWqEleqR8Zj92?=
 =?us-ascii?Q?8Pe2p5UHgeCYIE8GN10V3Ig2iGPrOlSijwzBBEDoAqHiZ31OXrrUfGeWgb2H?=
 =?us-ascii?Q?kb1bLQrV9qxsW6mFm7n6z8Z4k9uc4i4R7DAviHCDwlCq18RlFdSQh70o799H?=
 =?us-ascii?Q?Ijc+sNuQ7FZS4HKMwv9ItLr0ha/1+KqkpLJBx99XsZI63TPZcsQW+OYp4S5U?=
 =?us-ascii?Q?llNgm1UZJ8i1MXHTCnGGUiGEhnpM9DtIg5J1PTXOUhzLcJcVCNfzlY2j7S2P?=
 =?us-ascii?Q?nbOiTj0HjcrwYcFWtfPYG4bS7kvRwH6r8JvlMxLVd+7KIJ1ZNQ+PbkBb7K5b?=
 =?us-ascii?Q?F5BCF34QYF898b/Eh3NmjWtx+YDhUKYOxfLeQVzSkqnWYS9loUPDj91iarqb?=
 =?us-ascii?Q?35ivca9pMeBr1hdQy8PKrKHDhmwdYwO0Jfj7BLz9K+vhhuFZZHzSgIeP9s/h?=
 =?us-ascii?Q?q8opt7mJ6ZRW75qlvbtW4iIwyHAxUWS11Q4VplEdZ4n7aREkbEFVsb7ddf8b?=
 =?us-ascii?Q?BnNyVqJeWoFvxZ2r2UNMDBrZpIzkRzzn0J5mGXaGkmQNML9zMwbk9i5IFL7t?=
 =?us-ascii?Q?Aa3icB56LpsNxsxtqdiB5pVHyV87LoqVBhZ8hvaZFJHH2HTCxR2v1KvEP7y8?=
 =?us-ascii?Q?IKHDtEVUtOtwRHMf5BLxzsWQUbqcgE6L52mkiCsqP0Y99xU2v2EsUEZdwBWx?=
 =?us-ascii?Q?28ct5nKZBJoe/Q4m7UCi0eCEuRthbRa1V7X5/VhX1FxwK14Ok4g7V/yTOCxz?=
 =?us-ascii?Q?bhBpXjtSxIiSpH1GsHXi6NkOovv8nds+Pb3wg6luY8ZIhKZ7+VlGkaekxBTx?=
 =?us-ascii?Q?ufUTidKW5lmM9iYj52TZHZl9mgAJXd2aZdR1cbZ6z+DRp7rZYUmSBZe94lmG?=
 =?us-ascii?Q?GRf0aj+nY+DrZjaZ/bHdZDholdqvg25l5RtEMAjRWK3X3mGzPi2g/DVODXn2?=
 =?us-ascii?Q?mUrrj3uRLm4BHltrJ1gDl7p7xyH/I47nc82la4qfDIHxpRrWx9OccWx0jljd?=
 =?us-ascii?Q?WqnfBFsdVePBanX/W0esNMl6BbTPVLNM9PHrB7uKn4GPKI1CCH1yFPl+3ll4?=
 =?us-ascii?Q?amP8vogfqLq85RTL1putbzIphHPvfwlemDMkQ3BdNO8+jWIDj3KoPhgDD9w1?=
 =?us-ascii?Q?reCrxepyPWM8+AwWbWDqXIyE/7cHwKzbgiyaKhqpEEmaFv/28arE3+k9jvk5?=
 =?us-ascii?Q?T7DnH7GKXNRVTOcgsoe2SUQCtqlmdOD9rGpDIuwe6zkOQIBDB88pgZimc56l?=
 =?us-ascii?Q?wMNrmJh7lX5Q0ATlN+GKglo3exapclYhaEBH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9SPRMB0022.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B0m2+kjSw+kKz8THUsENogWfmZvcCqwt2mo3zWCGvHfgw5ZVcHnY76RX9mR8?=
 =?us-ascii?Q?We7YNrJ6H+ttBzjQRhcw/uHZkct/88fHYKMMaebnA4rr05e6BMOjfEdZ14F8?=
 =?us-ascii?Q?/Zh3DybrrSo0fEH7FnhfGeCJDXclSw7ndE4Vp24Ywf9FomLb41hqBz6dZtb2?=
 =?us-ascii?Q?BQ+vhfnmGHy8S7DAF/ZMZgiPhx5zuRCYYpdAiyBhN5fWHpGn9hw/cgH0kSnt?=
 =?us-ascii?Q?iDxkm1DjYxcRSzTsP/VCnZr1KghSbqdTxDmLPDmTVgbMeC0p+4xnbKPSEwdJ?=
 =?us-ascii?Q?ms9N2AN8wY3Bgcl7sGO2/kOx/Tqf9mIqobOMvKkD+bQ46UH0AYFgamPF88Yh?=
 =?us-ascii?Q?BEuEtZK1Qcsotigd26XSe0EFKGDAVlGapcca6TeUeklRai2n4bMWx3PEz18J?=
 =?us-ascii?Q?0ykmvIdeaLBCqxRr90Avpdyy6SycDNsc53IjToQIbosT7wvr2OMa2r39y03H?=
 =?us-ascii?Q?HO6Gv4r0uvZY7Ik4x5q7QQq8MqyfV0PUoTU7Ykh5iiaYLUNwkGbJnSzHSdqj?=
 =?us-ascii?Q?5PTr7EueWNyxnBCc/eOr1ff4aXfcn2Z+2ryBtxtvenXUjFsRGlK6j9harhj4?=
 =?us-ascii?Q?wVwb2iUERS2r/lDCTADyRfABT72tEq8DSkBZULD3MxT700iY8D3Ib+wNWwGa?=
 =?us-ascii?Q?MiLm+c2olDBMEHH6Vr0G9147KdAyFWaAhKbunw9SlQva1yu084zqEBGmjTwu?=
 =?us-ascii?Q?XLXYdCyakmDPHcaqWsOLJmQ/qQiy7b3ngSIr31IR65JwvJb0sbSXqbF/LGpr?=
 =?us-ascii?Q?RhTEz9M2JlMihds654o+lL8V6YiBIS116L6i6lZg2PpMr2kCh7eydLucLvaI?=
 =?us-ascii?Q?z6qgNUAktXH9zljKpTyUCzG6oZATE5o8UL4pCYnEE6livruFZubuhOpQr5bc?=
 =?us-ascii?Q?7JGver4H49OU4Jd0u/FVWErqiivcZoR6ezLOfX5nXhj6YzIu5a6AFPNpAmHt?=
 =?us-ascii?Q?dR5zQgM3RqFyRRYC65xvPs9JlEkYYZw3NEXN7X8M6sYj76TiyfzlOefhx6m8?=
 =?us-ascii?Q?rn1H8I2+HeSLKgczKIWzKc71jtYFglAFaw0ISgEDbpA8N/HIXTN7MnZnvGXu?=
 =?us-ascii?Q?oGFbLHAnKaRimJbg/TVyhnkk1RRFugBV8fo+CDu+oO5HrW2wPsOqPD/LN+vE?=
 =?us-ascii?Q?oLd5jsnWgH8qIhFQDxPeCf66Oyl/AYch3L5MB+L3nGPZqGypvWUboeM03o5U?=
 =?us-ascii?Q?VE1FhqaxKPhDRkRbywCEnUNUgExesxLA1sZBLbTwr6eSGvO7nxKM3rDKu/Kc?=
 =?us-ascii?Q?KAhP7zKgwGLgbOECAGVoBhrXg5t9yBqEhGqLUjLOomVBEscVtRiQebJdzsql?=
 =?us-ascii?Q?8Od3ZK5sZUBljsnko1UtAj5fAmZMuRXoWwNaaVy9Oe3z4+gj8rq+P0wczd3L?=
 =?us-ascii?Q?vKRUT3qWVMpJheg2Bruur3TnbWwzkRym1/kXCXoqvjIyk7frIe6IIkWvv7Ki?=
 =?us-ascii?Q?ndqJVxVwgh7CQcJ1317TCrB/MFv/l+frA6dXw9rICmRjT74WznoIl+ncvm47?=
 =?us-ascii?Q?bDBATtSqDWZEn0QssjDHl934Frwj3cNHNkbgnvkxkvP9wTFh10a6isQYSMJH?=
 =?us-ascii?Q?6Gg9cA20Nes7vk6s9sAtDNyBddbKUcW29QtSEfUT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54561292-04ce-4b95-9e27-08de33a8c72d
X-MS-Exchange-CrossTenant-AuthSource: DB9SPRMB0022.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 02:48:33.2002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XjnABECZsoqkbMayIlMiv8nDjBQ+HiENgltYMcsCKkas2M09hwd6RRj7GELFfvIXwMv9vj4eBegkCaHsqpenhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8841

On Tue, Dec 02, 2025 at 12:00:16AM +0000, Thinh Nguyen wrote:
> On Tue, Nov 25, 2025, Xu Yang wrote:
> > On Fri, Nov 21, 2025 at 12:37:47AM +0000, Thinh Nguyen wrote:
> > > On Mon, Nov 17, 2025, Xu Yang wrote:
> > > > On Thu, Nov 13, 2025 at 11:05:43PM +0000, Thinh Nguyen wrote:
> > > > > On Wed, Nov 05, 2025, Xu Yang wrote:
> > > > > > Do dwc3 core auto suspend enable for device and disable for host
> > > > > > , this can make sure dwc3 core device auto suspend setting is
> > > > > > correct all the time, the background of disable dwc3 core device
> > > > > > auto suspend is to make its parent device suspend immediately
> > > > > > (so wakeup enable can be enabled) after xhci-plat device suspended,
> > > > > > for device mode, we keep the dwc3 core device auto suspend is to
> > > > > > give some wait for gadget to be enumerated.
> > > > > > 
> > > > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > > > ---
> > > > > >  drivers/usb/dwc3/dwc3-imx8mp.c | 31 +++++++++++++++++++++++++++++++
> > > > > >  1 file changed, 31 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
> > > > > > index bce6af82f54c..80a431cb6fed 100644
> > > > > > --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> > > > > > +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> > > > > > @@ -158,11 +158,31 @@ static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
> > > > > >  	return IRQ_HANDLED;
> > > > > >  }
> > > > > >  
> > > > > > +static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
> > > > > > +{
> > > > > > +	if (role == USB_ROLE_HOST)
> > > > > > +		/*
> > > > > > +		 * For xhci host, we need disable dwc core auto
> > > > > > +		 * suspend, because during this auto suspend delay(5s),
> > > > > > +		 * xhci host RUN_STOP is cleared and wakeup is not
> > > > > > +		 * enabled, if device is inserted, xhci host can't
> > > > > > +		 * response the connection.
> > > > > > +		 */
> > > > > > +		pm_runtime_dont_use_autosuspend(dwc->dev);
> > > > > > +	else
> > > > > > +		pm_runtime_use_autosuspend(dwc->dev);
> > > > > 
> > > > > Would this override the user setting everytime there's a role switch?
> > > > 
> > > > From what I know, the user can't control whether to enable or disable
> > > > autosuspend feature. So there should be no overriding problem. When
> > > > user change autosuspend_delay_ms, the delay setting will be kept
> > > > everytime there's a role switch.
> > > 
> > > Should we set pm_runtime_mark_last_busy()?
> > 
> > I think we needn't explicitly call pm_runtime_mark_last_busy().
> > Since commit "08071e64cb64 PM: runtime: Mark last busy stamp in pm_runtime_autosuspend()",
> > pm_runtime_autosuspend() will do that thing automatically once dwc3 device is idle.
> 
> Ok.
> 
> > 
> > > 
> > > Also, if pm_runtime_use_autosuspend() is set, make sure to unwind with
> > > pm_runtime_dont_use_autosuspend() on remove.
> > > 
> > > > 
> > > > > 
> > > > > > +}
> > > > > > +
> > > > > > +struct dwc3_glue_ops dwc3_imx_glue_ops = {
> > > > > > +	.pre_set_role   = dwc3_imx_pre_set_role,
> > > > > > +};
> > > > > > +
> > > > > >  static int dwc3_imx8mp_probe(struct platform_device *pdev)
> > > > > >  {
> > > > > >  	struct device		*dev = &pdev->dev;
> > > > > >  	struct device_node	*node = dev->of_node;
> > > > > >  	struct dwc3_imx8mp	*dwc3_imx;
> > > > > > +	struct dwc3		*dwc3;
> > > > > >  	struct resource		*res;
> > > > > >  	int			err, irq;
> > > > > >  
> > > > > > @@ -240,6 +260,17 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
> > > > > >  		goto depopulate;
> > > > > >  	}
> > > > > >  
> > > > > > +	dwc3 = platform_get_drvdata(dwc3_imx->dwc3);
> > > > > 
> > > > > It's confusing how dwc3_imx->dwc3 is also named dwc3...
> > > > 
> > > > I will rename it later.
> > > > 
> > > > > 
> > > > > > +	if (!dwc3) {
> > > > > > +		err = dev_err_probe(dev, -EPROBE_DEFER, "failed to get dwc3 platform data\n");
> > > > > > +		goto depopulate;
> > > > > > +	}
> > > > > > +
> > > > > > +	dwc3->glue_ops = &dwc3_imx_glue_ops;
> > > > > 
> > > > > If you want to use glue_ops, please use the new flatten model. I
> > > > > don't want dwc3 to be initialized again after of_platform_populate().
> > > > 
> > > > I understand the new flatten model is a more suitable way. Considering that
> > > > many i.MX devices are using this legacy unflatten model, do you mind allow
> > > > this change firstly and we will switch to the new flatten model in the future?
> > > > 
> > > 
> > > Do you have plans for this transition? Perhaps this is a good time to
> > > initiate the process so to avoid having and maintaining this improper
> > > code while we still don't have it yet.
> > 
> > OK. It's a trend to use new flatten model. I do have plan for it. I'll
> > prepare for it later.
> > 
> 
> Ok. Can we add a note that this is a temporary solution until we switch
> to using the new model in the commit message.

Ok. Will do. Thank you!

Thanks,
Xu Yang

> 
> Thanks,
> Thinh

