Return-Path: <linux-usb+bounces-33282-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Iy9GnZdjGmWlwAAu9opvQ
	(envelope-from <linux-usb+bounces-33282-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 11:44:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EF41238B0
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 11:44:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE0863048B1D
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 10:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C62369969;
	Wed, 11 Feb 2026 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PlCr0iPO"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013013.outbound.protection.outlook.com [40.107.159.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E88F331A5C;
	Wed, 11 Feb 2026 10:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770806465; cv=fail; b=Wk4VXhz/Yd2WfQ04fd6M8v0i6i+L/rDccST2Z07DEVu3O3OulYD4hLUvtZk9b3CuDbMfk/gIj+bLV+6dhOA5dD3EXM+tsEPEueirf7BwUvbRh5bptf7Hn1R2IrKHt2vR3YNknukwhpomTlbOGaMJMl84/ODAAbZDe0+e30opJqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770806465; c=relaxed/simple;
	bh=/yeQCr4DGdjcwsFKu9XFaCXUwBfszw7MskC4wgcxSLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bUlR7fXQ2CLbDzZMIW7L9B3+rxPe8p5nLpMPfDEfdZKH0GhRiFl0r81cVxpb1ILHuypxcFfuDvllzoD7aaCfWvuYw+Z5mOQ0auLzM3EIzYZ2DHvLx4pJVozXROsd/2T0s771utjy900ij34nqOMdIHvcE/lh4L6CF8ArprxnboM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PlCr0iPO; arc=fail smtp.client-ip=40.107.159.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dsbUunHAGv4nK84yOTLzpY0DMkclQcjdMCMc2LM9C8LVOz2gk8n7rzB+XryL1drpZMG9RHwNeij06Z7Thm+sE02/WdS+B1gp7fbgFSL0f46bL6kFuroYcMl6FeYOn4Sy2+okqX023HLawM2kJ9q9aWq+11B2CW7N9M1bdhHbaXs7D5UaMCbWQ/CbBIzDy/OYSUeX5iS/1z5z5qZEHohP9jaEhF5vGN0/ARWgEnwDxPMT59hZHuVNJoZLFaGVLY2jPhcfRQfY3CQDN2FmG+Vallac46WMuIXGw1L2ZJTKx4cLAsZjYBnPxzfLyeg9cW6ca70mkFwmwQfjLzlaPkR7yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsvqHH+m6f8TqwwIev9dcZFqU3kekhEVO3Ah6mTj0ng=;
 b=Zv1Da4HUaodtIgEU48udyzciWQ0zkF4JKRFj4Oxj89kMbkeVCFV68/u+paX5qbTTX+oEp8pyIUbQlve8OjE9ro5tArI+OAh6yZTEC7QsOrx38Q7W0RBV44KsmstoGYU5zSjtNLdfd0ySunrV6n1zBMJja6+ottC4PQ9s2LJXZOcZ0/Mhbwql4HEs2aLYhSBAHn3X5RBRXw/SG8DvdimQj4Aio8lVK6Y/Dti7DF7ii0mj6NaF9XPJFJbfaJTnt6BYigB1JDSexSOO75sVZrRtoL/8LhC+KRyiCsc+YOzD8xCeaSTd4RxxIt5AgAdrtrHij6KcoB2oIuZYeStYf6ywig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsvqHH+m6f8TqwwIev9dcZFqU3kekhEVO3Ah6mTj0ng=;
 b=PlCr0iPO1wBmFkKplq652RIsbFKjam7X8D2GFSVintaxMdLQH8fpJ40CAGy6rVW9k05YMqbTDxYaEYHjQqx7HfTi7kxfi0GH0f2jMvB0Mpty/845uwIPD3hGyElxFIBuYIudon2vyjOk7vy9DTDfXwyX1eUsoqOO6F72SQZR8PJSBHKYsAx23cVCt8xHUWp+dW0VUAvghNl7XgpUXbzxbqAuOT+RwWCtzI6kde5ohqXMvpm7G5i/ffbGzPwqbfCBuzvWfz3mojRy0PEn8Tk+prPSqkUylY3zI9emq8OZwY9o3QsA3ZrkEd1lKNStLJMCh1o1jldRlCzl8RYyCFBCKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
 by AM0PR04MB12074.eurprd04.prod.outlook.com (2603:10a6:20b:745::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 10:41:00 +0000
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781]) by AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 10:41:00 +0000
Date: Wed, 11 Feb 2026 18:33:30 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, Li Jun <jun.li@nxp.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] usb: dwc3: introduce flatten model driver of i.MX
 Soc
Message-ID: <e7esebdau6ebhym7m5ce5r6eraobgto4chklvmoezaw2b4wp56@svv73ahucaqo>
References: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-0-ebd9b9b77049@nxp.com>
 <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-3-ebd9b9b77049@nxp.com>
 <20260210023448.t626fz4xezpcoile@synopsys.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210023448.t626fz4xezpcoile@synopsys.com>
X-ClientProxiedBy: AS4P189CA0019.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::10) To AM9PR04MB8825.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8825:EE_|AM0PR04MB12074:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f664bd-8356-4806-9703-08de695a0c43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6XnCXKUHxnqAwrCq5q7PHm8QoyeqgBGPCartztyj7CCYcvmMXPWt/vEWFcmy?=
 =?us-ascii?Q?kw2+LBMHNCJiPJHod3lYx84BsxaLd+COZqW3qhux0G0DUDnfFEhfGuLkaRvs?=
 =?us-ascii?Q?RMNCXWkgzq87essbHkNV11dj3IFMioHSlaDq61SXtp2W9FtCHrg5b9SQ3ZdH?=
 =?us-ascii?Q?OyakOHO6UZVpmDhCO+bf40NYMZ+Z6HvlSWRhof1nMe7vxJkr81VNWdLWL90d?=
 =?us-ascii?Q?8CxLLSYzbQwPKPrCrprduUdhvFUMV/D3FP7VLFKCRAx6zWZLGqouDITN8A+X?=
 =?us-ascii?Q?zfxLpd8PPj3m2DydFJp7mI9YEj4r6M8zm+uqCr9i172nO/XH3HEghvgIKm98?=
 =?us-ascii?Q?ldJ8SXWIu5/CBTZocSnV1xtGkLOGRp/f5NcXN/By0g/GG/rBbYnKgj2IJm5I?=
 =?us-ascii?Q?rBS3JaLpEStU9sbjyHt7Gyitj2uTEkHaMTaw32VHD9O3y+vStK14jR5jQJnz?=
 =?us-ascii?Q?10jqim76Xuq8NDo+MRKkiGwdXx5UHFFTOQcidmBMGNa1J2THsAGK/lN1V2G6?=
 =?us-ascii?Q?NpE5bn6+JZ7jPlwAIohm0e4IjAofILvntHJbf74ihnxDXUATB0ipQT3u/uML?=
 =?us-ascii?Q?of3ANWErCMiHf4yDzsnHQ6aai2iv9uMkCp2RXGwq5VApceu4mtJ46w/BUskn?=
 =?us-ascii?Q?DmY7DdXowW284xPobenTdm/QaXk5V0URvMX8+Oi8FNConhQV80ag3WAZdtXY?=
 =?us-ascii?Q?K5HTFiCx/dgnxYhp9iZ5A8qM1vzCkR0oerHGQ2G6Lhlse/j4pgut0RtSIDRu?=
 =?us-ascii?Q?BWNuBFEGcvqIHsBs8+F5Sh14R3jC07dB/Up++ttLmNXnBf56IhzYeRIYmtzM?=
 =?us-ascii?Q?rYzVKknkCaJy5ONKyAsaofxJoe0ahGGPilgPa8UOeMiWGS2DdUSFqHcKKsi/?=
 =?us-ascii?Q?JpaM3CMqb/LMAEsdl5qdb101R+rv8I/lKiZEgZm1TLyZw+5iHnsHCv4DiK+4?=
 =?us-ascii?Q?AttvvtddO87MWDEPXL2eGMGhpMaBF4eiUOUt6zZkEWS/PSCwdjBo0MUZSXSQ?=
 =?us-ascii?Q?xJFD01XhAxRNI/b+GjngQxRY6BodnjHoXFqxse0SzGMkiLhc+MuvvHVNe5lc?=
 =?us-ascii?Q?m4Lg3sVN1bQoE40poSfAxF0whi6feZhK5qzcV46Yhuf8NNpoI/Y0LXDa3uT7?=
 =?us-ascii?Q?RrgEFrx45A1uCvbSYdYF9/XLZQB4PSWfHJ0gXj2L6ZWT94Oy8XzrvTHBmPeB?=
 =?us-ascii?Q?RfoQLfWIIES7juzB9uUcSrdQZGjbewPgIYEjSTL06t5xVui2wpDLWjrY10gE?=
 =?us-ascii?Q?6BM7zeOpmhWptHl+XJUQ4cxu5SlUtLQ+KjukqzxTKJotvfosfpQ52Io9NmlS?=
 =?us-ascii?Q?Q3vYAxLFFnyMHa5tuK0IOcoi1MQZ5Aj38Ukt/Ul4WbVafX892Cl0qdKGavQL?=
 =?us-ascii?Q?Q6DIBZxVslrPQzl6r2BCmiJJ9Q5cdlsZaO2p40Za1IJGHN8F/lo3AZ7dAI2i?=
 =?us-ascii?Q?tArpPRp9ETkBE+J3vXNaX64HHcC3fj70UtNdoVCR8hns1fPHYvkXQQ5mxDG9?=
 =?us-ascii?Q?a+86pbYrtaSPsQ/ZvAWkJBTiY/gRxBnE7EWPXc0uBKp+k3IiHBZgyqWlN4F6?=
 =?us-ascii?Q?iagnzQYvJGge0C80JWFV+qKKP2vH4aXZIm5M+eWNWDHA2A4rsJ22es0MQyJA?=
 =?us-ascii?Q?vzRq5Cdljxz0nD3O/UaiLgg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8825.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rsu0A6ospfYjjWtvFzLZHQTZTPdNxszmRuH54KK+c2D8luzaDPx7GvRjix9m?=
 =?us-ascii?Q?v8ivtSidnwuDxCYlU66iG0scXz/8tolrpKwzmtCOO7TjcZAasfdzBYJM6mtA?=
 =?us-ascii?Q?/DwBUOlKCTlO/qH/d9iWv909jNZTRTsLrIFe4w6mGqyrHvHxzdDrmWUiShKR?=
 =?us-ascii?Q?u52TKjFdacMtz6t1shnudexhmeFBMDqaZoQeATopnAGbFQg7FH50JPQH69WC?=
 =?us-ascii?Q?Yp18/gFuIIyKYdSnl3fYRfpfKo1sg/+anH/UrjlLqrNF+WMDKfY6spkwiKT5?=
 =?us-ascii?Q?c2Q6jUmqy9zAH10gaqoktyqpzPIvoqLDnGv8TT8BWqZT8YfJRVxPor2wRAgE?=
 =?us-ascii?Q?CoT6bdpionngCmjW24Ydagmqzr96ZLGSpGzI7EAvHxqJKLd/ou5KNt8bpi5c?=
 =?us-ascii?Q?qvukIfK38pxdEM3X4Ia1XKfLcLWtu5yKZaFSYYhRhX/9hwAgzWP+NZXiCaOP?=
 =?us-ascii?Q?2KnOt4ueKM/hqjNu5ajLfGGWIHD1HhM/odnI2UTfk4MCZpqq1eAvBkDkFHX9?=
 =?us-ascii?Q?A6yVLJIJpu2wmwD9Fuv5U1/FfvWmByRUNsjle8CJ+oKgE0FB/Vz38nBfsjJB?=
 =?us-ascii?Q?4SLAQowU4uYYR6vClhn7CdIyi/EYwqfS8TqJ4l0fBncv7wv4zRSCVJi0DdRU?=
 =?us-ascii?Q?PGElmtpKG7KGh/DiznP+/2ls6CIfZ33lkJqjUZ+LKQtUyUhyJBDfCXWG7mfH?=
 =?us-ascii?Q?6V7tv7Dw4ahfUj3jdzdRsCJZDnkfNvIzzogR4F/sfkuZUx+8rXkC1w2lm2g2?=
 =?us-ascii?Q?IbjIzBxHzZGtj7TiPsxK9BZxyVnQzbkBfSDClwuijVWfY7OV5+kXWGRVBx23?=
 =?us-ascii?Q?DZx2hxmXMGCCYacYmPbJxEfqXZClA78n3eXewRuw8IsVVgyr9RgNoLdRYkDm?=
 =?us-ascii?Q?hjaqamNvDsbPIP+g+Ygx73vVqOLLd3BgAlWytOViK8C6CTgXL9C9q3rYiMcX?=
 =?us-ascii?Q?N88QsNU36DU9dhSVQ5mwMEiKDLTAQ7Rex+FBEBQnrqvqZq4qWpzwVAx0pcbM?=
 =?us-ascii?Q?+xg1GImhzzZQE3rwOdsfKGiEJiyZt7xePN2AIGbF12Z2S1AlNvYWuVMXWSbE?=
 =?us-ascii?Q?do84mc0boaEgbkY2phSY+Bj7XXeye+Iq455EK9bk04sBkmWcMjCcH9SI/l/X?=
 =?us-ascii?Q?8ukbSPHsPAk5XNh0Vntgyl1Ok4owhkcjocBt6c5SlcdphROsPmRwFwehwLV0?=
 =?us-ascii?Q?So0j8sONzg5rBOhqmU7SzEqcolDev/Stl3NUZ7J1X1yQqIUo9iCUt/HOx9DJ?=
 =?us-ascii?Q?okqPmrIR6QH+zOlWTsqYw86vtUR+He+/tfRzFqc9Zw8Kdt3GwGpnME7wOjOv?=
 =?us-ascii?Q?sMXbkcAYofQVyUi/ALnRJx/qxDxRRIATkNzWlkoCo1HMYaHItvo8s+phEdu/?=
 =?us-ascii?Q?/Q+9Uq7JDrWzSZG0LJprI/vNfDBkR0cD/FX17TFvyQKnGrEZcDZYBcqSHDbI?=
 =?us-ascii?Q?IIGwzHJD82nXYjZGx7eH7w0r2TKerw1whb6XGu8UoI+zTRnYqtsWY8/9HvWN?=
 =?us-ascii?Q?L8iV46BoQDClpN/NQjBSwWCnmlq6hHNNi2/ROapHLRtAeMvQx5CidruFXqYP?=
 =?us-ascii?Q?5atuDf+fxdFJ5EAATUN45Kvmz2RO64X1BcuX3NNo8jU3JXOjpVXSj4OUo0jZ?=
 =?us-ascii?Q?PCN6j67nKhx+BSzKg3FVkWBKzPKdjUKR63kGKO/4lCigWIKuoxiZX88zs14B?=
 =?us-ascii?Q?/OFMD1oaCoo+7CxhM7zrjoAyPEvzh2jL1sZ2bgVF4wnZv6hMZ+FBV9avhHbP?=
 =?us-ascii?Q?hYIBQxT1pA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f664bd-8356-4806-9703-08de695a0c43
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8825.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:41:00.8365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmZBiDHEQHFtDcn7DwJ+Q8tm6Bi0S492mLthKmF1ViOys5r7K9EkSu1S/3291hC8wpHS3GHD69zuwTRGfOKwWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33282-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,probe_data.properties:url]
X-Rspamd-Queue-Id: 09EF41238B0
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 02:34:50AM +0000, Thinh Nguyen wrote:
> On Fri, Feb 06, 2026, Xu Yang wrote:
> > The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
> > USB block in a single block will bring more benefits than a parent-
> > child relation. To support the flatten model devicetree, DWC3 USB core
> > driver already support to directly register and initialize the core in
> > glue layer using one device. And many notification can be received in
> > glue layer timely and proper actions can be executed accordingly.
> > 
> > To align with mainstream, introduce a new driver to support flatten dwc3
> > devicetree model for i.MX Soc. Besides this driver disabling wakeup irq
> > when system is active, no other function change in this version compared
> > to dwc3-imx8mp.c
> 
> Going forward, what will happen to the legacy driver? Can we only expect
> maintenance fixes rather than new feature development? Should we
> document this transition policy in the commit message?

OK, I'll add more such information in the commit message.

> 
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v3:
> >  - update compatible as nxp,imx8mp-dwc3
> > Changes in v2:
> >  - improve commit message
> >  - fix code style
> >  - add IRQF_NO_AUTOEN
> >  - remove pm_runtime_* in dwc3_imx_remove(), dwc3_core_remove()
> >    will do that
> > ---
> >  drivers/usb/dwc3/Kconfig    |  12 ++
> >  drivers/usb/dwc3/Makefile   |   1 +
> >  drivers/usb/dwc3/dwc3-imx.c | 429 ++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 442 insertions(+)
> > 
> > diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> > index 240b15bc52cb..18169727a413 100644
> > --- a/drivers/usb/dwc3/Kconfig
> > +++ b/drivers/usb/dwc3/Kconfig
> > @@ -150,6 +150,18 @@ config USB_DWC3_IMX8MP
> >  	  functionality.
> >  	  Say 'Y' or 'M' if you have one such device.
> >  
> > +config USB_DWC3_IMX
> > +	tristate "NXP iMX Platform"
> > +	depends on OF && COMMON_CLK
> > +	depends on (ARCH_MXC && ARM64) || COMPILE_TEST
> > +	default USB_DWC3
> > +	help
> > +	  NXP iMX SoC use DesignWare Core IP for USB2/3
> > +	  functionality.
> > +	  This driver also handles the wakeup feature outside
> > +	  of DesignWare Core.
> > +	  Say 'Y' or 'M' if you have one such device.
> > +
> >  config USB_DWC3_XILINX
> >  	tristate "Xilinx Platforms"
> >  	depends on (ARCH_ZYNQMP || COMPILE_TEST) && OF
> > diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> > index 073bef5309b5..f37971197203 100644
> > --- a/drivers/usb/dwc3/Makefile
> > +++ b/drivers/usb/dwc3/Makefile
> > @@ -55,6 +55,7 @@ obj-$(CONFIG_USB_DWC3_ST)		+= dwc3-st.o
> >  obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom.o
> >  obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom-legacy.o
> >  obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
> > +obj-$(CONFIG_USB_DWC3_IMX)		+= dwc3-imx.o
> >  obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
> >  obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
> >  obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
> > diff --git a/drivers/usb/dwc3/dwc3-imx.c b/drivers/usb/dwc3/dwc3-imx.c
> > new file mode 100644
> > index 000000000000..3b154d075bcf
> > --- /dev/null
> > +++ b/drivers/usb/dwc3/dwc3-imx.c
> > @@ -0,0 +1,429 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * dwc3-imx.c - NXP i.MX Soc USB3 Specific Glue layer
> > + *
> > + * Copyright 2026 NXP
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +
> > +#include "core.h"
> > +#include "glue.h"
> > +
> > +/* USB wakeup registers */
> > +#define USB_WAKEUP_CTRL			0x00
> > +
> > +/* Global wakeup interrupt enable, also used to clear interrupt */
> > +#define USB_WAKEUP_EN			BIT(31)
> > +/* Wakeup from connect or disconnect, only for superspeed */
> > +#define USB_WAKEUP_SS_CONN		BIT(5)
> > +/* 0 select vbus_valid, 1 select sessvld */
> > +#define USB_WAKEUP_VBUS_SRC_SESS_VAL	BIT(4)
> > +/* Enable signal for wake up from u3 state */
> > +#define USB_WAKEUP_U3_EN		BIT(3)
> > +/* Enable signal for wake up from id change */
> > +#define USB_WAKEUP_ID_EN		BIT(2)
> > +/* Enable signal for wake up from vbus change */
> > +#define	USB_WAKEUP_VBUS_EN		BIT(1)
> > +/* Enable signal for wake up from dp/dm change */
> > +#define USB_WAKEUP_DPDM_EN		BIT(0)
> > +
> > +#define USB_WAKEUP_EN_MASK		GENMASK(5, 0)
> > +
> > +/* USB glue registers */
> > +#define USB_CTRL0		0x00
> > +#define USB_CTRL1		0x04
> > +
> > +#define USB_CTRL0_PORTPWR_EN	BIT(12) /* 1 - PPC enabled (default) */
> > +#define USB_CTRL0_USB3_FIXED	BIT(22) /* 1 - USB3 permanent attached */
> > +#define USB_CTRL0_USB2_FIXED	BIT(23) /* 1 - USB2 permanent attached */
> > +
> > +#define USB_CTRL1_OC_POLARITY	BIT(16) /* 0 - HIGH / 1 - LOW */
> > +#define USB_CTRL1_PWR_POLARITY	BIT(17) /* 0 - HIGH / 1 - LOW */
> > +
> > +struct dwc3_imx {
> > +	struct dwc3	dwc;
> > +	struct device	*dev;
> > +	void __iomem	*blkctl_base;
> > +	void __iomem	*glue_base;
> > +	struct clk	*hsio_clk;
> > +	struct clk	*suspend_clk;
> > +	int		irq;
> > +	bool		pm_suspended;
> > +	bool		wakeup_pending;
> > +};
> > +
> > +#define to_dwc3_imx(d) container_of((d), struct dwc3_imx, dwc)
> > +
> > +static void dwc3_imx_configure_glue(struct dwc3_imx *dwc_imx)
> > +{
> > +	struct device	*dev = dwc_imx->dev;
> > +	u32		value;
> > +
> > +	if (!dwc_imx->glue_base)
> > +		return;
> > +
> > +	value = readl(dwc_imx->glue_base + USB_CTRL0);
> > +
> > +	if (device_property_read_bool(dev, "fsl,permanently-attached"))
> > +		value |= USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED;
> > +	else
> > +		value &= ~(USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);
> > +
> > +	if (device_property_read_bool(dev, "fsl,disable-port-power-control"))
> > +		value &= ~USB_CTRL0_PORTPWR_EN;
> > +	else
> > +		value |= USB_CTRL0_PORTPWR_EN;
> > +
> > +	writel(value, dwc_imx->glue_base + USB_CTRL0);
> > +
> > +	value = readl(dwc_imx->glue_base + USB_CTRL1);
> > +	if (device_property_read_bool(dev, "fsl,over-current-active-low"))
> > +		value |= USB_CTRL1_OC_POLARITY;
> > +	else
> > +		value &= ~USB_CTRL1_OC_POLARITY;
> > +
> > +	if (device_property_read_bool(dev, "fsl,power-active-low"))
> > +		value |= USB_CTRL1_PWR_POLARITY;
> > +	else
> > +		value &= ~USB_CTRL1_PWR_POLARITY;
> > +
> > +	writel(value, dwc_imx->glue_base + USB_CTRL1);
> > +}
> > +
> > +static void dwc3_imx_wakeup_enable(struct dwc3_imx *dwc_imx, pm_message_t msg)
> > +{
> > +	struct dwc3	*dwc = &dwc_imx->dwc;
> > +	u32		val;
> > +
> > +	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
> > +
> > +	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST && dwc->xhci) {
> > +		val |= USB_WAKEUP_EN | USB_WAKEUP_DPDM_EN;
> > +		if (PMSG_IS_AUTO(msg))
> > +			val |= USB_WAKEUP_SS_CONN | USB_WAKEUP_U3_EN;
> > +	} else {
> > +		val |= USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
> > +		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
> > +	}
> > +
> > +	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
> > +}
> > +
> > +static void dwc3_imx_wakeup_disable(struct dwc3_imx *dwc_imx)
> > +{
> > +	u32	val;
> > +
> > +	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
> > +	val &= ~(USB_WAKEUP_EN | USB_WAKEUP_EN_MASK);
> > +	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
> > +}
> > +
> > +static irqreturn_t dwc3_imx_interrupt(int irq, void *data)
> > +{
> > +	struct dwc3_imx	*dwc_imx = data;
> > +	struct dwc3	*dwc = &dwc_imx->dwc;
> > +
> > +	if (!dwc_imx->pm_suspended)
> > +		return IRQ_HANDLED;
> > +
> > +	disable_irq_nosync(dwc_imx->irq);
> > +	dwc_imx->wakeup_pending = true;
> > +
> > +	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST && dwc->xhci)
> > +		pm_runtime_resume(&dwc->xhci->dev);
> > +	else if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
> > +		pm_runtime_get(dwc->dev);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
> > +{
> > +	if (role == USB_ROLE_HOST)
> > +		/*
> > +		 * For xhci host, we need disable dwc core auto
> > +		 * suspend, because during this auto suspend delay(5s),
> > +		 * xhci host RUN_STOP is cleared and wakeup is not
> > +		 * enabled, if device is inserted, xhci host can't
> > +		 * response the connection.
> > +		 */
> > +		pm_runtime_dont_use_autosuspend(dwc->dev);
> > +	else
> > +		pm_runtime_use_autosuspend(dwc->dev);
> > +}
> > +
> > +static struct dwc3_glue_ops dwc3_imx_glue_ops = {
> > +	.pre_set_role = dwc3_imx_pre_set_role,
> > +};
> > +
> > +static const struct property_entry dwc3_imx_properties[] = {
> > +	PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk"),
> > +	PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk"),
> > +	{},
> > +};
> > +
> > +static const struct software_node dwc3_imx_swnode = {
> > +	.properties = dwc3_imx_properties,
> > +};
> > +
> > +static int dwc3_imx_probe(struct platform_device *pdev)
> > +{
> > +	struct device		*dev = &pdev->dev;
> > +	struct dwc3_imx		*dwc_imx;
> > +	struct dwc3		*dwc;
> > +	struct resource		*res;
> > +	const char		*irq_name;
> > +	struct dwc3_probe_data	probe_data = {};
> > +	int			ret, irq;
> > +
> > +	dwc_imx = devm_kzalloc(dev, sizeof(*dwc_imx), GFP_KERNEL);
> > +	if (!dwc_imx)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, dwc_imx);
> > +	dwc_imx->dev = dev;
> > +
> > +	dwc_imx->blkctl_base = devm_platform_ioremap_resource_byname(pdev, "blkctl");
> > +	if (IS_ERR(dwc_imx->blkctl_base))
> > +		return PTR_ERR(dwc_imx->blkctl_base);
> > +
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "glue");
> > +	if (!res) {
> > +		dev_warn(dev, "Base address for glue layer missing\n");
> > +	} else {
> > +		dwc_imx->glue_base = devm_ioremap_resource(dev, res);
> > +		if (IS_ERR(dwc_imx->glue_base))
> > +			return PTR_ERR(dwc_imx->glue_base);
> > +	}
> > +
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
> > +	if (!res)
> > +		return dev_err_probe(dev, -ENODEV, "missing core memory resource\n");
> > +
> > +	dwc_imx->hsio_clk = devm_clk_get_enabled(dev, "hsio");
> > +	if (IS_ERR(dwc_imx->hsio_clk))
> > +		return dev_err_probe(dev, PTR_ERR(dwc_imx->hsio_clk),
> > +				     "Failed to get hsio clk\n");
> > +
> > +	dwc_imx->suspend_clk = devm_clk_get_enabled(dev, "suspend");
> > +	if (IS_ERR(dwc_imx->suspend_clk))
> > +		return dev_err_probe(dev, PTR_ERR(dwc_imx->suspend_clk),
> > +				     "Failed to get suspend clk\n");
> > +
> > +	irq = platform_get_irq_byname(pdev, "wakeup");
> > +	if (irq < 0)
> > +		return irq;
> > +	dwc_imx->irq = irq;
> > +
> > +	irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", dev_name(dev));
> > +	if (!irq_name)
> > +		return dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
> > +
> > +	ret = devm_request_threaded_irq(dev, irq, NULL, dwc3_imx_interrupt,
> > +					IRQF_ONESHOT | IRQF_NO_AUTOEN,
> > +					irq_name, dwc_imx);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to request IRQ #%d\n", irq);
> > +
> > +	ret = device_add_software_node(dev, &dwc3_imx_swnode);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to add software node\n");
> > +
> > +	dwc = &dwc_imx->dwc;
> > +	dwc->dev = dev;
> > +	dwc->glue_ops = &dwc3_imx_glue_ops;
> > +
> > +	probe_data.res = res;
> > +	probe_data.dwc = dwc;
> > +	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
> > +	probe_data.properties.core_may_lose_power = true;
> > +
> > +	ret = dwc3_core_probe(&probe_data);
> > +	if (ret) {
> > +		device_remove_software_node(dev);
> > +		return ret;
> > +	}
> > +
> > +	device_set_wakeup_capable(dev, true);
> > +	return 0;
> > +}
> > +
> > +static void dwc3_imx_remove(struct platform_device *pdev)
> > +{
> > +	struct device	*dev = &pdev->dev;
> > +	struct dwc3	*dwc = dev_get_drvdata(dev);
> > +
> > +	dwc3_core_remove(dwc);
> > +	device_remove_software_node(dev);
> > +}
> > +
> > +static void dwc3_imx_suspend(struct dwc3_imx *dwc_imx, pm_message_t msg)
> > +{
> > +	if (PMSG_IS_AUTO(msg) || device_may_wakeup(dwc_imx->dev))
> > +		dwc3_imx_wakeup_enable(dwc_imx, msg);
> > +
> > +	enable_irq(dwc_imx->irq);
> > +	dwc_imx->pm_suspended = true;
> > +}
> > +
> > +static void dwc3_imx_resume(struct dwc3_imx *dwc_imx, pm_message_t msg)
> > +{
> > +	struct dwc3	*dwc = &dwc_imx->dwc;
> > +
> > +	dwc_imx->pm_suspended = false;
> > +	if (!dwc_imx->wakeup_pending)
> > +		disable_irq_nosync(dwc_imx->irq);
> > +
> > +	dwc3_imx_wakeup_disable(dwc_imx);
> > +
> > +	/* Upon power loss any previous configuration is lost, restore it */
> > +	dwc3_imx_configure_glue(dwc_imx);
> > +
> > +	if (dwc_imx->wakeup_pending) {
> > +		dwc_imx->wakeup_pending = false;
> > +		if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
> > +			pm_runtime_put_autosuspend(dwc->dev);
> > +		else
> > +			/*
> > +			 * Add wait for xhci switch from suspend
> > +			 * clock to normal clock to detect connection.
> > +			 */
> > +			usleep_range(9000, 10000);
> > +	}
> > +}
> > +
> > +static int dwc3_imx_runtime_suspend(struct device *dev)
> > +{
> > +	struct dwc3	*dwc = dev_get_drvdata(dev);
> > +	struct dwc3_imx	*dwc_imx = to_dwc3_imx(dwc);
> > +	int		ret;
> > +
> > +	dev_dbg(dev, "at %s\n", __func__);
> 
> This debug message doesn't fit here. It should only belongs during
> development.

OK. I will remove them.

Thanks,
Xu Yang

