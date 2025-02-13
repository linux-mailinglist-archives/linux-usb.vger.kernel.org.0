Return-Path: <linux-usb+bounces-20625-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1260BA34F1A
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2025 21:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C291F3AB9C5
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2025 20:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FEB1266182;
	Thu, 13 Feb 2025 20:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lQOGYEoK"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2081.outbound.protection.outlook.com [40.107.22.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF9424A07B;
	Thu, 13 Feb 2025 20:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739477479; cv=fail; b=iiQNYqapqvBu2RIqy0pNg3/sJhxSXH/axoNr3okQJJeJo/qTVLzx61V980uciKTbbKxKKqoF9qEzsD47GdWWEQ+GPtyZgkOMncQBZBO9rqKRZSkbTQ4uJBlZ0GHxpiRo3IBd/pVkV+tNJvQ/nLRo/TShteAQ9cxUJGz3LW/owZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739477479; c=relaxed/simple;
	bh=UrIgswQyDLkNA1eKMtlYGK570tyMtaM4DRjWhZJhQKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ATbmW9W72xXr/j66w4EgaEZTpgcSuhWg6rVnt7NIsCX+gkDSxqyvmZaO1vG6geNdQa1R1y0gFoMxbCltTEMIx3kSugxW/SNVPhBXpilARPjLoDXWclAO5Gf1eYYXjAPtbC99ulnC33QdPA4Bny+Yw8QVsvvxNRzuFzKG95t01fU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lQOGYEoK; arc=fail smtp.client-ip=40.107.22.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ec+4K9+lhck5S8h3YYGFpHRfg3lU5il3RtiKpop0H2aWQFqqOzYrWCuUxjLts6cgruVg1NJ6UCAeuWbc71oVT5HsP4gdJCSWaI1GFxsD0ArBR6WplHFytzCYZFKsxpMSZ7+1HeIJLT/YABI74Pd9tlW5F4A3si0gwZrB/3qunMHpL41k/OYb+B91TD6yCpIbNwMYq+IubFvhUCWjo7YTg5cUFXrfLECqECe6x9MmIiQDradxbBw2lya9JZqRnuDctQ16u+QnsHsuV25jFSRDmmtXBGnI6OhvNH7uZ5k/ZH2faFRuEnOqT7M7OLQeXudYG+hoAB318RJ5Bo2G+3VWrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMsNJbXDmbn9bvBovMzh4lFrFt3QUEvLlSCwhEvLXF0=;
 b=yb0s43SWU2pScBsM2Cjzn5IkTQUIcalAPNz/Hh9RNy0pePDAPTQZd8/wU93YWaST0lUF7q78RNnObMTM1+TGn432BRGqWRJxsVMOTRiEOtg/nvqvtxZREnkoGffSNeRk+9QM0uI8PpKAJbCqq8SPRfg3gqVtDtMdlIdBpMvyKE1zFQ9UHIc2yxjMpEFzFTDKIFajcfj7+uDlrLqzWMkP+HNbohG5NOaO5MnjxegSs2IJ79q089XebQOce1KNVvufFwZMi5V2snQTwkv9/DyTCGbo/0nF+NsdrMAcMaXuvsJQiRm8Q79lkGU3h4oxB8MWg7m0UP/omPQg6wNA+kPxwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMsNJbXDmbn9bvBovMzh4lFrFt3QUEvLlSCwhEvLXF0=;
 b=lQOGYEoKRzWOBbHoylUfzd0LEOxJwff7zZRDDINNJxs0b+GQHHrRJOsaxr9A82zTLbb9QoBF8unGvWCQm3140UTHk0Nxzu7YEdfikftz+aTrm66D5ypFeNQXADLkJRQsZ21h+A+xz7mO+WY35HiDgatBIhdOJV5EYiQrvNRopQwiCdDL7/zCXJgQ6JSCNq4u6JjmGtlGkdvjmzAqo0yan7CjmKinhpmBNja7wY0y1b8iZ5WRFzaBQEnfZEG9Ea/3E2HZMtk2RS4Xi8P6O2w8PzdbmODEn+jn+cZKYU1KQghLlo6K1wG83b929k2/geIIbQcHwD+04wmNzuNtrGCdNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9397.eurprd04.prod.outlook.com (2603:10a6:102:2b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Thu, 13 Feb
 2025 20:11:13 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8445.015; Thu, 13 Feb 2025
 20:11:12 +0000
Date: Thu, 13 Feb 2025 15:11:03 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>, vkoul@kernel.org
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, jun.li@nxp.com,
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v11 1/3] phy: fsl-imx8mq-usb: add tca function driver for
 imx95
Message-ID: <Z65R1972huOPbkaT@lizhi-Precision-Tower-5810>
References: <20241204050907.1081781-1-xu.yang_2@nxp.com>
 <20250106020303.xrpo2pfv4knqszx7@hippo>
 <20250116034623.ig44yqxzptujhwql@hippo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116034623.ig44yqxzptujhwql@hippo>
X-ClientProxiedBy: SJ0PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e3ecb28-cd33-4443-6da7-08dd4c6a903b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?USZ4Mdd6Xrww9LVDlq7qNE9BaYnhS9PLRKeo875G52azG7G95eS6S6kOnHU9?=
 =?us-ascii?Q?CsPhsxG0isnstySHCDzhC4x9EbhQgnxT3xQsMhNiiJBUuZQvvX24aOCaVod3?=
 =?us-ascii?Q?2SKL90DUhB0M1JNxG8q+SCSUG2Ow1cRmbxa9yZa1yOfKe3rBU7nq7ntKCjEb?=
 =?us-ascii?Q?V58JdF9rvp4L0qBzyax5oJr+jAenEBEqAQ8UUCOs3bfxbVVQIRziG6AMF+Gz?=
 =?us-ascii?Q?wKQ8bnVCFqNcqzhGlKDejruuGbzg6UIrtsDr/pk82yzERCHgawEBXUXV5MOa?=
 =?us-ascii?Q?0B77VfSdMTQzGn27LGWE1NBine1Wz72Nkzo0BjU7WAkYRbtJDq+1fEgN5rAv?=
 =?us-ascii?Q?ZxEVgxmUKVzt5+7uX9yBRyFQ79UoTeDMUWExvQiNn0jOeJpUbDOutqr2ZoFe?=
 =?us-ascii?Q?ugzukM6IObyxz39QQ5TwjgjLKhcrGs0Vaj9leFOtWxUHEk7gExggLSAFPjBy?=
 =?us-ascii?Q?jc9MUlTunzVc1M8A5gSv4z9Zsnk6ZbQuTbOTXoZ4Y8pEOrIeAUVWaQ7dC5dA?=
 =?us-ascii?Q?+/oEIYG2qCHqInb7LRHGcH0BTWbc6hpZQth05j0yOPRspM0nzAu8slhuzL2W?=
 =?us-ascii?Q?euS7KY9r6htTD6Q29wgnBriZawAG6b7WzJomKGLoqTOifTanTyRjTm9iDDM7?=
 =?us-ascii?Q?kzoZFYa3NZLK52vxuetBAOKZ6lBOGsdwXZ0BXGfbb/0WqcJNNF8T07B1rpM4?=
 =?us-ascii?Q?1DgbDqkg9YtjFZWSAB/gD5ng7rEA1pjZ4A3SNuyxsDhjb1pITtzVByGKvbaR?=
 =?us-ascii?Q?TvNkbhAbFC80LIeYxoan+90JOgB2ifLrKNqET3nuMmUNX+STeZ01A1JoY5RA?=
 =?us-ascii?Q?c5KALPsrczoXXs4xxbNO+10u64J36oD6iU6RyT9FqUsUxJPNJsrKoLGfadP1?=
 =?us-ascii?Q?oZHAG/e2bZqw0H10yORCM1OazJn9AIomAyYTI1iY6/UCWi1SbkV/QepNAicI?=
 =?us-ascii?Q?90rju9eJ5QPi/BloBzuvanDG3SQe1WFpWgDj8i3Sq2pNF3f05zBVBE2omd3X?=
 =?us-ascii?Q?XXzYm3bnonnedELK9YLGtxuK5CpKxNnLXumLh+Meq6OIVUW1Jq0TGx0h/ScG?=
 =?us-ascii?Q?lSfCcBvlAQgOkDQ+JvxLVP8qzlzhZFI3NrJfMhdLB1Muj3a7wC+SPjKHXCbF?=
 =?us-ascii?Q?A0g/guiubgUmluPvnIt8lRlBRigf9jQP1pB/3VSDpgpPulpJsotP7rk6ycJo?=
 =?us-ascii?Q?7pmw7SnbG1ipf0uBR/GyuCi63JCAMjaBQXmI3fI9xGZXc+rMN5k9uRuw6lTL?=
 =?us-ascii?Q?DsBLiB4X9krwMIpIUPhhtaLXU6lonEQS3580JRHeYCg/0v78mGwELqo6oF7V?=
 =?us-ascii?Q?JxfCraHWwjZoJuLQRhdS4jTOor3HzvywJorOwi5FOCKUKOgpTAli2IN5XV6i?=
 =?us-ascii?Q?PVxdTGfoPT3pjHA0wSLaqOwevK8TONQ5c9XJOY97DDt/ICrBqMWGmb8Tl23H?=
 =?us-ascii?Q?9+9O7TENmYlQznYL26GzOSTKjva2ZekZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4SDir2/Uu2bQjiW5Rqhm+eF79EgMfR3Is2zJa0Wn6wlrx4bkrH4zEe6BpGJ1?=
 =?us-ascii?Q?ftwJqHX5OZgNugbxIBsJJkElNsV5sRXmIRx2B2OtHpQPW8isG2YE3JNumW1Q?=
 =?us-ascii?Q?IP0eI1I1weBe9IEJyl8zClzeGcd7hce9fyiEDiHRZ4G5JTRJSelMoVKu/2so?=
 =?us-ascii?Q?e2CaDb6DLNqhXZB2hb1kJuLHYb5i30Zlx0dC1sd5iRbdwsaGXJ4nCdXOnQma?=
 =?us-ascii?Q?obuhpnOrHF0GBOVHbUVr6QU6x1dfSV6YB4nqTz9WMK3yRk7ks2eeECg+3lfm?=
 =?us-ascii?Q?yLJYrzxZGy9pCkCEcGzwdP6gP0D4M+H81ldd3zt4O5+nLjJ/4l5quCXKtRuh?=
 =?us-ascii?Q?TqbNIdqAusYJF9q+aDzmqBIkbWHhHLUsV1fxo6Q3IACdT928oDj9o5USiAFR?=
 =?us-ascii?Q?ZKZ2tg9i3i4o6gTy5zVFPjPxvXyhr3x9vTKIGLZqV2PyCFluzLkRkfJGphIM?=
 =?us-ascii?Q?7tDyCSqBRjv3pEWSkHS/mnDhSvwtPEFhg+yz7ynspSVW+NTgucfbzKsZI4Ak?=
 =?us-ascii?Q?catXZklTBvsBW3LjL3uzxeM+aJEfKqK5N6PYWJcBefk/snP0qnv9BoSdMx0o?=
 =?us-ascii?Q?Uos4fCJEmDVe6cjIDlXlBvZ1oY+aiR+O/PSC500jJ4CwYxl23LP4eh0Ia9RO?=
 =?us-ascii?Q?jTiHc2C5nF6NmtgnZI+C5cdCaZCmwyYHlu24xqIY5BDVm85hyNBpByb8Zqxi?=
 =?us-ascii?Q?5OszeLec3aXu5iCaa2r/464R6MXPd5pGH+rh+od8FNZUMxkpfllAXseQvfg4?=
 =?us-ascii?Q?Jdrb+KZxNtbhMqCrEqLrcghU7a1mk6OnOQUfyY/MEbdqkCyjk/AhsDLPotW7?=
 =?us-ascii?Q?+RmvT4gngD8qV8XtJaHf8dz5We158lZlaw5NUn4d+JjE2Nmaipv4VVGLFDAz?=
 =?us-ascii?Q?BS1WXPXgtHUEWdgLsmyLah7g7Nv95xMB5Haxk/a0skNbjbPU5LOWpLyg9lsI?=
 =?us-ascii?Q?8axPGdaPOnbs8Xz9LB1A2x+f6FMQgVMGuEXmuNdg1F3Oyt6eqpUON448tKfn?=
 =?us-ascii?Q?OM7NrHQ8jJPEjzBOiPxUpNSbfBqMj4lQAY62y70aib+s3CM9Q17grMXNqrxo?=
 =?us-ascii?Q?19CBE8VwXCcEmoRWisqbW3+tpXHR9hA2wFk+DDWcRn0eKygQpTsOMtU8KB5d?=
 =?us-ascii?Q?X5iUWcdo6TeeJ1v/zIk7DgWZqJqBHF5GqgMTC2jAZIMqWKzk2+HAbqMQhctb?=
 =?us-ascii?Q?ALXRRH7Hw4at9qcFrPaUQXgjbAYKhNMZg7Q8fqxfl1hrtmCElvYRhRkFsO6s?=
 =?us-ascii?Q?5i5mOrsh6C0CeSWSBX1teHuRwxumf3yggE8ZhvJg2T4RdNj/4AT2AgHvUTku?=
 =?us-ascii?Q?wDUUhAvWFP31KCp4e56PLQx5JjMXUFiSsj6ZSSs+KD1pvJ0Jz4ZAMgi+p6c8?=
 =?us-ascii?Q?fFCJUijbZNPDxO+oRSRGlx3dHfU/GpFdGIlikI6FEedET9+2G7V8+APBwsx8?=
 =?us-ascii?Q?voMiz/odU/W1ec5BLi2UHBKBefLdC4scKEdNsd/W4CBFu7FW1VslWfiq9CoZ?=
 =?us-ascii?Q?G4pI5uMkpdzxslnT+Sj/umL2Pgr9sEH5EExBhII5H1d8xHAII17PE8dePLaS?=
 =?us-ascii?Q?0CWAFgwuL8pc4muJS7/WiueL7yMJIu66XJQW+U1b?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e3ecb28-cd33-4443-6da7-08dd4c6a903b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 20:11:12.8466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vDqG4v6gKBBEZYWUfby7+wiuebm7iKisHHHl0ryZaCvrY/JfDS+YL1l/U0T7PCDdx0nn3xMIaE/7DRbw5cz+Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9397

On Thu, Jan 16, 2025 at 11:46:23AM +0800, Xu Yang wrote:
> Hi Vinod,

Vinod:

	Do you have chance to check these patch? The whole i.mx95 usb
depend on this!

Frank

>
> On Mon, Jan 06, 2025 at 10:03:03AM +0800, Xu Yang wrote:
> > Hi,
> >
> > On Wed, Dec 04, 2024 at 01:09:05PM +0800, Xu Yang wrote:
> > > The i.MX95 USB3 phy has a Type-C Assist block (TCA). This block consists
> > > two functional blocks (XBar assist and VBus assist) and one system
> > > access interface using APB.
> > >
> > > The primary functionality of XBar assist is:
> > >  - switching lane for flip
> > >  - moving unused lanes into lower power states.
> > >
> > > This info can be get from:
> > > i.MX95 RM Chapter 163.3.8 Type-C assist (TCA) block.
> > >
> > > This will add support for TCA block to achieve lane switching and tca
> > > lower power functionality.
> > >
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > Reviewed-by: Jun Li <jun.li@nxp.com>
> > >
> > > ---
> > > Changes in v2:
> > >  - return the value of imx95_usb_phy_get_tca()
> > > Changes in v3:
> > >  - no changes
> > > Changes in v4:
> > >  - remove compatible check for imx95
> > >  - check whether tca register region exist or not, yes means has tca,
> > >    otherwise skip tca setup
> > > Changes in v5:
> > >  - no changes
> > > Changes in v6:
> > >  - no changes
> > > Changes in v7:
> > >  - fix sparse warnings in imx95_usb_phy_get_tca()
> > > Changes in v8:
> > >  - #define TCA_INFO 0xFC -> 0xfc
> > > Changes in v9:
> > >  - no changes
> > > Changes in v10:
> > >  - no changes
> > > Changes in v11:
> > >  - remove some unnecessary readl() as suggested by Amit Singh Tomar
> > > ---
> > >  drivers/phy/freescale/Kconfig              |   1 +
> > >  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 240 +++++++++++++++++++++
> > >  2 files changed, 241 insertions(+)
> > >
> > > diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
> > > index dcd9acff6d01..81f53564ee15 100644
> > > --- a/drivers/phy/freescale/Kconfig
> > > +++ b/drivers/phy/freescale/Kconfig
> > > @@ -5,6 +5,7 @@ if (ARCH_MXC && ARM64) || COMPILE_TEST
> > >  config PHY_FSL_IMX8MQ_USB
> > >  	tristate "Freescale i.MX8M USB3 PHY"
> > >  	depends on OF && HAS_IOMEM
> > > +	depends on TYPEC || TYPEC=n
> > >  	select GENERIC_PHY
> > >  	default ARCH_MXC && ARM64
> > >
> > > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > > index adc6394626ce..a974ef94de9a 100644
> > > --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > > @@ -10,6 +10,7 @@
> > >  #include <linux/phy/phy.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/regulator/consumer.h>
> > > +#include <linux/usb/typec_mux.h>
> > >
> > >  #define PHY_CTRL0			0x0
> > >  #define PHY_CTRL0_REF_SSP_EN		BIT(2)
> > > @@ -50,11 +51,66 @@
> > >
> > >  #define PHY_TUNE_DEFAULT		0xffffffff
> > >
> > > +#define TCA_CLK_RST			0x00
> > > +#define TCA_CLK_RST_SW			BIT(9)
> > > +#define TCA_CLK_RST_REF_CLK_EN		BIT(1)
> > > +#define TCA_CLK_RST_SUSPEND_CLK_EN	BIT(0)
> > > +
> > > +#define TCA_INTR_EN			0x04
> > > +#define TCA_INTR_STS			0x08
> > > +
> > > +#define TCA_GCFG			0x10
> > > +#define TCA_GCFG_ROLE_HSTDEV		BIT(4)
> > > +#define TCA_GCFG_OP_MODE		GENMASK(1, 0)
> > > +#define TCA_GCFG_OP_MODE_SYSMODE	0
> > > +#define TCA_GCFG_OP_MODE_SYNCMODE	1
> > > +
> > > +#define TCA_TCPC			0x14
> > > +#define TCA_TCPC_VALID			BIT(4)
> > > +#define TCA_TCPC_LOW_POWER_EN		BIT(3)
> > > +#define TCA_TCPC_ORIENTATION_NORMAL	BIT(2)
> > > +#define TCA_TCPC_MUX_CONTRL		GENMASK(1, 0)
> > > +#define TCA_TCPC_MUX_CONTRL_NO_CONN	0
> > > +#define TCA_TCPC_MUX_CONTRL_USB_CONN	1
> > > +
> > > +#define TCA_SYSMODE_CFG			0x18
> > > +#define TCA_SYSMODE_TCPC_DISABLE	BIT(3)
> > > +#define TCA_SYSMODE_TCPC_FLIP		BIT(2)
> > > +
> > > +#define TCA_CTRLSYNCMODE_CFG0		0x20
> > > +#define TCA_CTRLSYNCMODE_CFG1           0x20
> > > +
> > > +#define TCA_PSTATE			0x30
> > > +#define TCA_PSTATE_CM_STS		BIT(4)
> > > +#define TCA_PSTATE_TX_STS		BIT(3)
> > > +#define TCA_PSTATE_RX_PLL_STS		BIT(2)
> > > +#define TCA_PSTATE_PIPE0_POWER_DOWN	GENMASK(1, 0)
> > > +
> > > +#define TCA_GEN_STATUS			0x34
> > > +#define TCA_GEN_DEV_POR			BIT(12)
> > > +#define TCA_GEN_REF_CLK_SEL		BIT(8)
> > > +#define TCA_GEN_TYPEC_FLIP_INVERT	BIT(4)
> > > +#define TCA_GEN_PHY_TYPEC_DISABLE	BIT(3)
> > > +#define TCA_GEN_PHY_TYPEC_FLIP		BIT(2)
> > > +
> > > +#define TCA_VBUS_CTRL			0x40
> > > +#define TCA_VBUS_STATUS			0x44
> > > +
> > > +#define TCA_INFO			0xfc
> > > +
> > > +struct tca_blk {
> > > +	struct typec_switch_dev *sw;
> > > +	void __iomem *base;
> > > +	struct mutex mutex;
> > > +	enum typec_orientation orientation;
> > > +};
> > > +
> > >  struct imx8mq_usb_phy {
> > >  	struct phy *phy;
> > >  	struct clk *clk;
> > >  	void __iomem *base;
> > >  	struct regulator *vbus;
> > > +	struct tca_blk *tca;
> > >  	u32 pcs_tx_swing_full;
> > >  	u32 pcs_tx_deemph_3p5db;
> > >  	u32 tx_vref_tune;
> > > @@ -64,6 +120,172 @@ struct imx8mq_usb_phy {
> > >  	u32 comp_dis_tune;
> > >  };
> > >
> > > +
> > > +static void tca_blk_orientation_set(struct tca_blk *tca,
> > > +				enum typec_orientation orientation);
> > > +
> > > +#ifdef CONFIG_TYPEC
> > > +
> > > +static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
> > > +				enum typec_orientation orientation)
> > > +{
> > > +	struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
> > > +	struct tca_blk *tca = imx_phy->tca;
> > > +	int ret;
> > > +
> > > +	if (tca->orientation == orientation)
> > > +		return 0;
> > > +
> > > +	ret = clk_prepare_enable(imx_phy->clk);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	tca_blk_orientation_set(tca, orientation);
> > > +	clk_disable_unprepare(imx_phy->clk);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device *pdev,
> > > +					struct imx8mq_usb_phy *imx_phy)
> > > +{
> > > +	struct device *dev = &pdev->dev;
> > > +	struct typec_switch_dev *sw;
> > > +	struct typec_switch_desc sw_desc = { };
> > > +
> > > +	sw_desc.drvdata = imx_phy;
> > > +	sw_desc.fwnode = dev->fwnode;
> > > +	sw_desc.set = tca_blk_typec_switch_set;
> > > +	sw_desc.name = NULL;
> > > +
> > > +	sw = typec_switch_register(dev, &sw_desc);
> > > +	if (IS_ERR(sw)) {
> > > +		dev_err(dev, "Error register tca orientation switch: %ld",
> > > +				PTR_ERR(sw));
> > > +		return NULL;
> > > +	}
> > > +
> > > +	return sw;
> > > +}
> > > +
> > > +static void tca_blk_put_typec_switch(struct typec_switch_dev *sw)
> > > +{
> > > +	typec_switch_unregister(sw);
> > > +}
> > > +
> > > +#else
> > > +
> > > +static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device *pdev,
> > > +			struct imx8mq_usb_phy *imx_phy)
> > > +{
> > > +	return NULL;
> > > +}
> > > +
> > > +static void tca_blk_put_typec_switch(struct typec_switch_dev *sw) {}
> > > +
> > > +#endif /* CONFIG_TYPEC */
> > > +
> > > +static void tca_blk_orientation_set(struct tca_blk *tca,
> > > +				enum typec_orientation orientation)
> > > +{
> > > +	u32 val;
> > > +
> > > +	mutex_lock(&tca->mutex);
> > > +
> > > +	if (orientation == TYPEC_ORIENTATION_NONE) {
> > > +		/*
> > > +		 * use Controller Synced Mode for TCA low power enable and
> > > +		 * put PHY to USB safe state.
> > > +		 */
> > > +		val = FIELD_PREP(TCA_GCFG_OP_MODE, TCA_GCFG_OP_MODE_SYNCMODE);
> > > +		writel(val, tca->base + TCA_GCFG);
> > > +
> > > +		val = TCA_TCPC_VALID | TCA_TCPC_LOW_POWER_EN;
> > > +		writel(val, tca->base + TCA_TCPC);
> > > +
> > > +		goto out;
> > > +	}
> > > +
> > > +	/* use System Configuration Mode for TCA mux control. */
> > > +	val = FIELD_PREP(TCA_GCFG_OP_MODE, TCA_GCFG_OP_MODE_SYSMODE);
> > > +	writel(val, tca->base + TCA_GCFG);
> > > +
> > > +	/* Disable TCA module */
> > > +	val = readl(tca->base + TCA_SYSMODE_CFG);
> > > +	val |= TCA_SYSMODE_TCPC_DISABLE;
> > > +	writel(val, tca->base + TCA_SYSMODE_CFG);
> > > +
> > > +	if (orientation == TYPEC_ORIENTATION_REVERSE)
> > > +		val |= TCA_SYSMODE_TCPC_FLIP;
> > > +	else if (orientation == TYPEC_ORIENTATION_NORMAL)
> > > +		val &= ~TCA_SYSMODE_TCPC_FLIP;
> > > +
> > > +	writel(val, tca->base + TCA_SYSMODE_CFG);
> > > +
> > > +	/* Enable TCA module */
> > > +	val &= ~TCA_SYSMODE_TCPC_DISABLE;
> > > +	writel(val, tca->base + TCA_SYSMODE_CFG);
> > > +
> > > +out:
> > > +	tca->orientation = orientation;
> > > +	mutex_unlock(&tca->mutex);
> > > +}
> > > +
> > > +static void tca_blk_init(struct tca_blk *tca)
> > > +{
> > > +	u32 val;
> > > +
> > > +	/* reset XBar block */
> > > +	val = readl(tca->base + TCA_CLK_RST);
> > > +	val &= ~TCA_CLK_RST_SW;
> > > +	writel(val, tca->base + TCA_CLK_RST);
> > > +
> > > +	udelay(100);
> > > +
> > > +	/* clear reset */
> > > +	val |= TCA_CLK_RST_SW;
> > > +	writel(val, tca->base + TCA_CLK_RST);
> > > +
> > > +	tca_blk_orientation_set(tca, tca->orientation);
> > > +}
> > > +
> > > +static struct tca_blk *imx95_usb_phy_get_tca(struct platform_device *pdev,
> > > +				struct imx8mq_usb_phy *imx_phy)
> > > +{
> > > +	struct device *dev = &pdev->dev;
> > > +	struct resource *res;
> > > +	struct tca_blk *tca;
> > > +
> > > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > > +	if (!res)
> > > +		return NULL;
> > > +
> > > +	tca = devm_kzalloc(dev, sizeof(*tca), GFP_KERNEL);
> > > +	if (!tca)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	tca->base = devm_ioremap_resource(&pdev->dev, res);
> > > +	if (IS_ERR(tca->base))
> > > +		return ERR_CAST(tca->base);
> > > +
> > > +	mutex_init(&tca->mutex);
> > > +
> > > +	tca->orientation = TYPEC_ORIENTATION_NORMAL;
> > > +	tca->sw = tca_blk_get_typec_switch(pdev, imx_phy);
> > > +
> > > +	return tca;
> > > +}
> > > +
> > > +static void imx95_usb_phy_put_tca(struct imx8mq_usb_phy *imx_phy)
> > > +{
> > > +	struct tca_blk *tca = imx_phy->tca;
> > > +
> > > +	if (!tca)
> > > +		return;
> > > +
> > > +	tca_blk_put_typec_switch(tca->sw);
> > > +}
> > > +
> > >  static u32 phy_tx_vref_tune_from_property(u32 percent)
> > >  {
> > >  	percent = clamp(percent, 94U, 124U);
> > > @@ -315,6 +537,9 @@ static int imx8mp_usb_phy_init(struct phy *phy)
> > >
> > >  	imx8m_phy_tune(imx_phy);
> > >
> > > +	if (imx_phy->tca)
> > > +		tca_blk_init(imx_phy->tca);
> > > +
> > >  	return 0;
> > >  }
> > >
> > > @@ -359,6 +584,8 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
> > >  	 .data = &imx8mq_usb_phy_ops,},
> > >  	{.compatible = "fsl,imx8mp-usb-phy",
> > >  	 .data = &imx8mp_usb_phy_ops,},
> > > +	{.compatible = "fsl,imx95-usb-phy",
> > > +	 .data = &imx8mp_usb_phy_ops,},
> > >  	{ }
> > >  };
> > >  MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
> > > @@ -398,6 +625,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> > >
> > >  	phy_set_drvdata(imx_phy->phy, imx_phy);
> > >
> > > +	imx_phy->tca = imx95_usb_phy_get_tca(pdev, imx_phy);
> > > +	if (IS_ERR(imx_phy->tca))
> > > +		return dev_err_probe(dev, PTR_ERR(imx_phy->tca),
> > > +					"failed to get tca\n");
> > > +
> > >  	imx8m_get_phy_tuning_data(imx_phy);
> > >
> > >  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> > > @@ -405,8 +637,16 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> > >  	return PTR_ERR_OR_ZERO(phy_provider);
> > >  }
> > >
> > > +static void imx8mq_usb_phy_remove(struct platform_device *pdev)
> > > +{
> > > +	struct imx8mq_usb_phy *imx_phy = platform_get_drvdata(pdev);
> > > +
> > > +	imx95_usb_phy_put_tca(imx_phy);
> > > +}
> > > +
> > >  static struct platform_driver imx8mq_usb_phy_driver = {
> > >  	.probe	= imx8mq_usb_phy_probe,
> > > +	.remove = imx8mq_usb_phy_remove,
> > >  	.driver = {
> > >  		.name	= "imx8mq-usb-phy",
> > >  		.of_match_table	= imx8mq_usb_phy_of_match,
> > > --
> > > 2.34.1
> > >
> >
> > Happy New Year!
> > And a gentle ping.
>
> A gentle ping!
> If no other concerns, please help pick up them since many users are
> waiting for it. And v6.13 is almost coming.
>
> Thanks,
> Xu Yang

