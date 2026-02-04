Return-Path: <linux-usb+bounces-33081-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKOQM9DmgmlTegMAu9opvQ
	(envelope-from <linux-usb+bounces-33081-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 07:27:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFC1E24FF
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 07:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9C413048DC6
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 06:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DCA037F8AE;
	Wed,  4 Feb 2026 06:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hZmHHSZM"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012053.outbound.protection.outlook.com [52.101.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5646C37F72C;
	Wed,  4 Feb 2026 06:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770186434; cv=fail; b=jyjMqex7XYWPoJzh8SmZtt0B6QbVwZgQxCYY2nEC8oHcezq0GCidnGsuLt5A/BTYyejzV7mSt55CgAeC8gI9TKEfhUjE+9A+/ggG+WKdtdgWSVCjhM3tzICLay94SCVGHpEVmsNwopJnzDuzbXq+XkajxJsAMQvOd9sLV1JTf+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770186434; c=relaxed/simple;
	bh=AogPiZ4d4Jp96LQrqo7JWJAFXcH6J5PpIDVjg0BsEXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YVZpqkNgCFsH2X0CB7nrP+anjzvaUSLPX7Z4ZmqFZlwf0K8dRwRdenNCdvCG7IL0emNyeYISmg5Ftmx3txwzcwKPYb1GuiyVdDWNJ4zuADb8cXr5nWlyAA7QV52TngGtzzICUEqrcd9e4g8cX7iCEZPyLK53DBWVWrvSuxVeKnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hZmHHSZM; arc=fail smtp.client-ip=52.101.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfm00y5TUdPQyuzx+I68MS25n8hVS38RNHMqSvVWFnvehoIjn0CAvw9UOftNcacxkv8ISTW0uu7d4kGcZSS/kCpNNefFySvTOirPnNoLviPSeS8y+mUDG8MMZ+L1Tbqp13TydVs2vYwmMKsPJEcl8leOl/DOPm5F/RtcwDNgX1n4h+8qxTmD/itHJA5Rza227cugQfZ+/qMR4etK/tPTqHCBOsvl8sVNZXK4xxkty/4kuQo0PUiF7j9bR5dOK2GnPZWNeSIeVJ3sv3EkrhWykWDHWQ1MC+lDDgSTZh4WUSwrzEfCs0LrVK4Ff4QPzuC7AApqDrDQ0ppGS1jb6wPzgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyzt1wbZeERWmGXundswQH2KcpbVeQxVqXCGt3OJPmI=;
 b=unV/lL+aPqc/yQvOaJ+qaYaIqM9whFZ8NKB2OZr31b2X3w3w62Nr7XpaLhiL/mHppn0MWj62OrvV6Wr/8Bt47IoNeqY0PeP8J7JqkO5UDM3wAKFiFmchGWhUCe4K2KdOGTIpDj+MGiU5vNZ6p62/ESHmFdcB2rrEXITjHim8hMRzawFi611FVneedG5Yk3Q6BiJS6gI5x1OLmzZzFj/8NUzVdym6oc/L92T/pO7i4w3AAzHbVsFDdRcdrm3Vqj5mrZ600Unigvzmvdr1mIwL3jWpsoAUYOqvcyYWgwR3Skh1iUzjsl035hB9bE6rFYsH4WgPm6uJswUbBHBUvcIdHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyzt1wbZeERWmGXundswQH2KcpbVeQxVqXCGt3OJPmI=;
 b=hZmHHSZMmMZ+1eAvv2LEOrmHN1qMGnfcJzmPoQN86LEzzxH8dRFjxy7XAPnA6RYITvclPOeUbh/lTDC8VSUidM2z86dhd++IgHM0t/7DSPYkY3LogzDyRW4dSazyG49onhY7BWY0iZxjQqe67atLZcxdU5J4+H/7zsCfZ1lgbem8qEK3/pp/TcbvznK5pESVESYY7foNoAiL2oyEb0uLP3IRwNPQ4NBtULdnBQRJURZPFUqqIdsswKmKwLbNvxIZnBYlbSMBSLYeng0LIJDmiv8LrtAmX0QH/IifVWxAYi6n9DWh62pzbYGGzi/hOEcQEnNd8YLaW4YmF6qKHToDqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by PA1PR04MB10964.eurprd04.prod.outlook.com (2603:10a6:102:490::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 06:27:11 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 06:27:11 +0000
Date: Wed, 4 Feb 2026 14:19:42 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Frank Li <Frank.li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] usb: dwc3: introduce flatten model driver of i.MX Soc
Message-ID: <q7g6ssporjzbhtmnhbruu545vi7jh7qkmrirx6ncqbz7ltujj5@fqzs6tbntgyn>
References: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-3-c44a5e919380@nxp.com>
 <aYDF6UkzX+GkuN9r@lizhi-Precision-Tower-5810>
 <20260203004453.rez3u2oiltciccfp@synopsys.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203004453.rez3u2oiltciccfp@synopsys.com>
X-ClientProxiedBy: SG2PR01CA0140.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::20) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|PA1PR04MB10964:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dc9b166-9b3b-4347-ba19-08de63b66d40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wzrEt1Ls1KRsgiv6emOjNj1/DjcRt6fjUXwSneAsXCNEuQiRPHy/PRv1GIfy?=
 =?us-ascii?Q?xlCfglpyin3ORPhG7V1T5UHa+vNpOl7Hz6FXwGJzLSZFot/x1etquin3Qw1Y?=
 =?us-ascii?Q?na3380oYoeLbwvnkU7QWLkCn7Tvnk2z3Z1YnvEPY491iHgRmK7/hrFYPiwko?=
 =?us-ascii?Q?z/HaHEoXRWj5SPUN/sqCreyCBYCxwT4zQF1ruWlPhgLljPreOUFmjsnwDWC0?=
 =?us-ascii?Q?UY/V5keOnR9cEHd+MM9aLJ+fxXkXq0oPfkkXWsd/MAPtb97oS290E7haQiqM?=
 =?us-ascii?Q?jn+86AcqH324Ye/LmqrCxkX90OcQZK+kU5mbAlMV0hvf4Cmvj3Dija8jfaOz?=
 =?us-ascii?Q?fY8uNWdzFbHc5akl8dii8eHtNF48avxVWWbXDYYhpE6Bdx+R3KfVeyOA3tBM?=
 =?us-ascii?Q?iozARBsgEpCaKDcdVom+NPF/tRfYaF9Qu/qis18axsLDRbc+nIjBFOXHssB9?=
 =?us-ascii?Q?FVi175Rbe52ZqBz7xYDzp/NfzK0CVqLC0UwwigYEK/UozSR7Q32IOyVzrojg?=
 =?us-ascii?Q?C+bI6EHqESJlwa4xuDg/j0rOuUBSQwu2yjA2H3QRxY8vIxyQacNUA6bcwS+f?=
 =?us-ascii?Q?2J5sqUwpqtZ5odeayc4qOSgg96z3+ua3AeuXpemqTmkHCYZ2BRFnKdR5UfSQ?=
 =?us-ascii?Q?HX0e21QCx8rIyNwtdYomTsvbm2w8OLmdyG6+XrmIlLTB1vssc+0PYVULHVAZ?=
 =?us-ascii?Q?RuVAkvU4bT5Hg9Ppr0eAHTQKMfVcbJgygsJFAaVRAWQG8/pdGzBXXQlaFjo4?=
 =?us-ascii?Q?4G8gyvrXR7rlUO9LmKtzaXXVP9sVU7xx/MOvWhplHINgOvxfvjRdcymI2uMc?=
 =?us-ascii?Q?6n64cS0ru3ijRf4MqW3DitODqcgKe4hoFtA9f9boqhcFXmifrLgmSSPeSUho?=
 =?us-ascii?Q?0bWpRS0+ZyFhztXEJN+nMzfirXag/PBXepbOyl0cEt2FdpGDm5UmRtnYubLt?=
 =?us-ascii?Q?gENGrusi6COg+KNiTPLQ1vgFjiwA2Vpzt4RKA2HBce6tWbX5WR2Wh00qHpLe?=
 =?us-ascii?Q?+EvQON4nRS9hSwVI4I2xoQWZlcEJ+O6MIbjPuw/Fk60SYfji2FMsWCpAalmx?=
 =?us-ascii?Q?UEk1oO7p6pqSHXOCgu5oLHp9HNocbgV24byav2ZpbC+6obHGx7p7+d7ZLGIs?=
 =?us-ascii?Q?OllxzjefXiGsWLigIyJeQcfEj+p47z+5TiUREWvlhvzRxC/ox7eBm0wTge0e?=
 =?us-ascii?Q?YK3Ph0MfRpxU4dXf+NLxAbJ9iqyqWkG9o8Pm1qumzSunetqAwfuyE7jq3ENk?=
 =?us-ascii?Q?3uaHvpSML2hLj//AqtfiRmwRtMHDqgarD2Qx4UuEJEdLbrQb9ylBdxzY9RM7?=
 =?us-ascii?Q?58B5+CsIn1qhCMyWpXVV97rxy4JXb5GFGy3t7NsEnyLEVGh6OB/yHGhkrARB?=
 =?us-ascii?Q?wgE4bxRE3W8q2Wr/vD07biKCRI8A0c4e0FS76lIhyNGz83rWHnwo81Tg6EdZ?=
 =?us-ascii?Q?TuJ7sZfEawbCyM12eArzABCwHjM6OhCLplrxpxoy6NYM0ObFBZNlvA3+LuKU?=
 =?us-ascii?Q?bNtB5uMwbwbi5m8MMhU40EtY5wjavPMMt03ddpdp1L+Kn/jHQFthGL1ZZ87T?=
 =?us-ascii?Q?xGxYWkrDiVI1W/P0Ocs431euYelInQmAp/K0tyhgfOlu7bRq2RG8vRbQYFeq?=
 =?us-ascii?Q?Akom2beJjNiMomt8nsH9puA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dywsp28VzWNlwi+GecmOZ8YArdDYQGv2E4RsEKynf916WQ+5Z1vblCx1fgCJ?=
 =?us-ascii?Q?mrGu4ZLBO5/hKXADmOPMCiioTwwRX16k0LjWoDuJpy3mBO6rtWyChEaSHcNZ?=
 =?us-ascii?Q?XYSGR+GecrDJqnxBDN4WQsMxgj+ZCijetU7p/1J9bjnYBmIXC/4V1BuV2eBb?=
 =?us-ascii?Q?6LgCkD7KfaTTtHBD/uKEQNWzwQ/PeMsBvh/JT47zfE+3R5w5s4N+qgdeoiHx?=
 =?us-ascii?Q?fwiS/eaA4Fh9lq0e0cQwiwz+if+hb/bEWPwikvxlxJxWh3qULWg1hDREHfnb?=
 =?us-ascii?Q?qz9jn1uBGDSabIZ7Dv1eyOPXvaqtWaDbjGqTPj13wab5c1tkynLx1Hl/q8Z7?=
 =?us-ascii?Q?597W1PyaTYkeQSI6QUWTuoOG0HlSa6QkMgMMBqQ6dZJ0VzhtHDIkFm8Of4/v?=
 =?us-ascii?Q?sP5xT2cbH+llfJwuwd75ipsv7ta7LU7jG/oAm2LMtcubq+rDScpSJgjOWd3j?=
 =?us-ascii?Q?2VXG72E0x6vf99sqjMlMJ/mcBsR8oTJdWFw5PU/AJy/9B8QJzzbDJ5Je/GOI?=
 =?us-ascii?Q?ap98mHeDj8Trw/7sCN3Okt44+G9OHv72IwFynEmhepHnhXVzfFdIzDqkl0Z8?=
 =?us-ascii?Q?+ul45HcUAV76qFg3sdJxR65Z1S4VjOsZa+wzLgWOS21Buh8kKKxPhGzpybkT?=
 =?us-ascii?Q?kV4GSJwoLSOq71u1hzUVq4QydWf1ccYX5BeyU5cp9NEZtYpolckhjX+oRZVn?=
 =?us-ascii?Q?++1T+GonHBpfNzj415sy2RhyQfIQe8OMuK24gCueJQa6wlSxbKKDoOHsSXk7?=
 =?us-ascii?Q?joOUddqHM9QePtNcDYpxJyE9ZQMSUBOmWJJtQIXC27kNU4U/zaZrpjSOyyzo?=
 =?us-ascii?Q?62eYKsxeuiCaBImWH+tPp82uwkuQ8B9dHVif/yRc+t5bEe3krPyB/zikle6d?=
 =?us-ascii?Q?6eSeqPSQa9bxsyy/ZVGFxd7pPxnEGUM0EC88lFHcEmLBmVp6J4fblf6SnSsV?=
 =?us-ascii?Q?TqxC8NpliSxK1He4gtG9tFvK9GykoV2u1I87UcnOLbOb72RKG/im7gQjqNgt?=
 =?us-ascii?Q?owrJWpya2NsF55cmWBrSp9SeKs7PMRZEKFOTtdbQXFwHhoHNDknj/W08bWSo?=
 =?us-ascii?Q?Q9qROkPbKw3yMisCaGVkkcjoMLkZ++9u31IZEOMrDU53nMkJZEMd1eRoQEhU?=
 =?us-ascii?Q?XyxfVjjxrDgspoHe4NHlzcnecPDMyWl65jf17durtQrYuu9YKWhXtCS+AUXU?=
 =?us-ascii?Q?N0+XuLUBxzA+pnsgRMg3pJH9LVDB6pOQEMwvoa4BdfZj7Mf/InSIz795tNIB?=
 =?us-ascii?Q?Rovs+YiMdZqoH2AuLWNXuNZSbLYLWkM2N1RcRSPLfxuQ0XVzDRP1xVB3K8b3?=
 =?us-ascii?Q?zXWXkzDjX/ZpnjaxW31LC8VGfKW80POu8PTi/0tzm66dMHj2M/gGAUv1Izdg?=
 =?us-ascii?Q?kqySr/1KnSmJAPaJ+bre28sTZpXuKRNRY+G/6546YNBEjFS3bMczkU2TDqcT?=
 =?us-ascii?Q?c2xltH6fpwiOla6EqM9/SeDLx0v0Q505dGqwa6O4TtWINizn75d0vFJ1041L?=
 =?us-ascii?Q?aCllZ7V5mJjUfpUY7NEx70vdjvpWoqdFi5+LtX8xQlLsGlMxP47Obu2OndOY?=
 =?us-ascii?Q?XCCw0c677E/RNtidskIT8tHp7RDjJML5bGnNo3CpGI4zjcIbSQw7wbbyeCgX?=
 =?us-ascii?Q?DiqJOwVLWTbf5FJ01tRjqtCtjZWHXc299tzHYJnmkH/Lz9oOT4s4gCwy6p1w?=
 =?us-ascii?Q?Lk79K90Ka0NnTkQfZZt0iWg8rRJgmClIkRgsqSNPrLDa8E1i8pL0rlVgqZN5?=
 =?us-ascii?Q?YxK8xVNlbw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc9b166-9b3b-4347-ba19-08de63b66d40
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 06:27:11.0486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZo53G4WN5b/tNm0b1cy/SvBe8pGM4NAEBx9LfzAF43T7hHXnn7MX0bVvf+9Qi7Q7yvrqFp8UH8p2D7lPANAiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10964
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[nxp.com,linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-33081-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7EFC1E24FF
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 12:44:57AM +0000, Thinh Nguyen wrote:
> On Mon, Feb 02, 2026, Frank Li wrote:
> > On Mon, Feb 02, 2026 at 06:27:47PM +0800, Xu Yang wrote:
> > > To support flatten dwc3 devicetree model, introduce a new driver.
> > >
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> Can you include additional info to describe why this was needed
> (written in your cover letter).

Sure.

> 
> Also note any new feature supported by this glue that's not currently
> available in the old driver.

OK. No new feature in this driver.

> 
> Thanks,
> Thinh
> 
> (ps. I'm thinking of creating a legacy_glues directory to start moving
> all the legacy glue drivers there)

Got it. Thanks for sharing the info.

Thanks,
Xu Yang

