Return-Path: <linux-usb+bounces-19389-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7B4A131CF
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 04:50:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE1193A5D83
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 03:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F69413635B;
	Thu, 16 Jan 2025 03:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dSw6u2+I"
X-Original-To: linux-usb@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013027.outbound.protection.outlook.com [40.107.162.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705BD2AEE3;
	Thu, 16 Jan 2025 03:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736999412; cv=fail; b=lic1Ozu4vpmHPMxfoYa46SXKObxpxr2xRMr9ZeX3B+bcYVWHc6mlEb8rPHU/b82UkxhjIQN8lqCxvx2lPWxHtzfwYB+o+700n7V+KtHyaPTXuMbMslTmx7kjesrDweFW7VFURPxTAkAJ76wAe2WZKepF2jqBMgvq6sVAAzNME+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736999412; c=relaxed/simple;
	bh=YMI9c8dPc0MwT4hn6eNZ8l1g0PX/D9zYSeJMA1q0rEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ry9EOcMMF/AFMNTjLj2BeqsUZedGRNxRfiqulAvU06X062KLgV3WOUui4ft4ecioinqp9MoR5bvNiCqRJEzlFx+9uqOYtyL4wHgTcnSXjrOTgFeQGA4/fVYuiyCAGLHTB8kYM6pUqZ/pJIMJVOj/A+vVTcUXtaAuId7BhpcWMNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dSw6u2+I; arc=fail smtp.client-ip=40.107.162.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/KssnDUlJut04+MBXEvwQEga5NFRbJTJIVHvxwkc4ReyzO1hylQlMd0sNN6KQFJcdJ30IlxLRPwL5bNqRaY08F32TUTkd18X7pyWWy9Q34sWSW7z/0xf4JhyHF1ryANsJVpWWFVzbM82jOh4+QskeQRCibdkrhvMW0A8hcbp68SNMJ0h0TU5DNLoleveXFAyQTGo64yp1EDmWZ3MIYNxFpPAqItKBujcAkfIHzYtS7mxnMM9MZOuMwviXAhBO4LxbzjDxqXeiqX7WgiYkIA7cffpJe+EcIZvuWsfxHuLRcUP4KqWZ8lPEITXj+djvxx9LyzPLFN3jwrF3XMMj14oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vn5lguTBC1B/66JIydbCPUtENqIf/jI/RrzNIwe3lk=;
 b=HjeoGBfJlmZkCyi8RW5NOc71KhWdK2qh28dU+nLC8WLfLGZofCQcPR+5nU+pQFJXQJQ6tak/2YHBzCXcpuOz+tpoxnfW9ktFqQInxjRi8476D5SJ4zzUFHMIDVtyT6mncJatVI3Xftb3Yh5WgfyUHY87vKYQGmqReGZLREcirwY6ToUtT4jkHv5ryAXd3LrwSZbdoKpGmS7+0/LmjdLmkvIRp4mbFbsyp+AkanN7A5J6CPCcsnlhRxeSggZpFuZs2e7NF6EWGs/SkI4QF6TujmyoSFffNE2RL9hrTyY9sEtfg1RFHKLIvAT8ljyQd9/J4YU1gbB71t+gd+sVCICdDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vn5lguTBC1B/66JIydbCPUtENqIf/jI/RrzNIwe3lk=;
 b=dSw6u2+I7zG0lVBrWKRLfVklVgyC5VVf6PhzKWmJkFz5exKzarqxmDnyT2IybA7XHfag3vt2LeyPWwwZ168xNyaHA0+cUWx5khv31U39bLfozHX8InljnImVpHqCmTUJp5yL/VxFG4YfSV/cro6jrYOPH3Fg2fi5BTGroK/oozDo29aJpd4e9qsUHc+QRc6DEHXcwK7lhWKL9+SUOgzF9U1a+aZM9+c38bHzVwryR5Sn7YVOzM4IFPeOf3HAS4X2XhMIf/jFabWtRCYp1B+O9b7xtZXWCB+B8Ogg4MxGk3hlRxdhCavQrD3GwyPtteJQGpCp0KKbu0i48YdVq6lj4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GV1PR04MB10703.eurprd04.prod.outlook.com (2603:10a6:150:202::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 03:50:05 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 03:50:05 +0000
Date: Thu, 16 Jan 2025 11:46:23 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, jun.li@nxp.com,
	alexander.stein@ew.tq-group.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v11 1/3] phy: fsl-imx8mq-usb: add tca function driver for
 imx95
Message-ID: <20250116034623.ig44yqxzptujhwql@hippo>
References: <20241204050907.1081781-1-xu.yang_2@nxp.com>
 <20250106020303.xrpo2pfv4knqszx7@hippo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106020303.xrpo2pfv4knqszx7@hippo>
X-ClientProxiedBy: AM0PR03CA0083.eurprd03.prod.outlook.com
 (2603:10a6:208:69::24) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|GV1PR04MB10703:EE_
X-MS-Office365-Filtering-Correlation-Id: f387432c-bbdd-4b8e-de87-08dd35e0dcdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|366016|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7e3osrCNsK3fX9l69tRsmwD7KfYSohcNv3S1IrZMSqdI8m4rAycXCdId8fDN?=
 =?us-ascii?Q?/m7X0gzXu3rrkbmH071Epx0cRAhGKK5MNHEIshbWbnLrhp4l1mMnUTBb5paJ?=
 =?us-ascii?Q?AxXRdieWiDKUGduI9yDZDOTEItxR/5hSXLIDP1NUGMpelyVP6t16jE8nYKbc?=
 =?us-ascii?Q?DJnoH3iDqOtpNSgJ5RUxPoH46BjWeJRKcnWRZzTY71KB0iVhNXL3722my0/i?=
 =?us-ascii?Q?w3bK0f5vFMAq6VE8pU/i9byk6IfYdyOiNNPVFZPOF3D7XJlgzAVgp+2/V6MW?=
 =?us-ascii?Q?ebbNdvKFO14NR+VreuUShJ0cY0+Ui6d4dTXxvC8VPui9jLd6HSP7H7P2sRtN?=
 =?us-ascii?Q?FC65PO44P+Y/3sB239i7+MuKtw7VEi3NLbF9f1lEUch7M0t1TTZl+bLhAjVh?=
 =?us-ascii?Q?YNTa5qauvW2ZtnPakb+FwhO75f1s3oKEgHJmTHf8cS1lu0mrP8nlS8aFllCA?=
 =?us-ascii?Q?VVJjOkZSO+vo2KalZ1Pn3nWqbWxdauxVOhkRHoa0y/PBuZkKUGqITAKpsDj5?=
 =?us-ascii?Q?k+rlKCPnUgPRFVvpyKsb51XduBAaOf4B6c8cGrlEX7OTFnvwUNqYlSD11d85?=
 =?us-ascii?Q?Zep1g0TThj+1jpDFKD+1sXlLhcVihc4u2PuVXP5+HnHVo8bHKikZ5vC30w/4?=
 =?us-ascii?Q?C2mxTfnWF7p+th31Vtkq5/9dr7H/XeVALB45q/cX8e/7ZErVSsJ+RghtVsWU?=
 =?us-ascii?Q?42bztouKqXsx1j/wwF71KcEQu9GvatIvq6oM2J8J5RhBuvmO0i2nWiZkyW34?=
 =?us-ascii?Q?sY8k6VB7kIlTGTNynPzTSOpMSlWqVEDj9hFiWGI/elZhvvJFAK+oIXW/hjEM?=
 =?us-ascii?Q?SbTEfaSuHexNRo/PligctEBdcOLUj6Jn8P3cBFFxx8nHcU1/iq2ORtLaoeFQ?=
 =?us-ascii?Q?rY8XDIcHzb6dIr2pppFwAQbuiOu8GoKqJaqSx05rn9eBEVv2Jw35WONGWIGU?=
 =?us-ascii?Q?bCNR3qd5U4U9wxcTfaFo6FHRq1s43/cVoGK3BASlEhqhAzBna0oYB03RSc5B?=
 =?us-ascii?Q?fvyD7m7FQfC6yR3tUvAxk13a1aJ5af9oTahgVZFIR8urDPgORqL6qLNTyiZq?=
 =?us-ascii?Q?+YNB3coq6mOZ8Gctey/ScFEfEZ/nklNP0LaZV/yNe2pMmewB2wwailllXiOX?=
 =?us-ascii?Q?6Dk1iYpdQPH66/8KCvdHEKGMRhsXZ+NYFiJ676DnufiKU/F9Pcz8GG1kOXfr?=
 =?us-ascii?Q?YYi+bfUnOP/q+hXOIEkF2WTKIJ1tX48kOyutQoqnCmh8vSK9GVrH79MnHcyE?=
 =?us-ascii?Q?rc2XfdrX+XRSJaxcVxRSESovzSZ/TjpOQE7G24aT5VPvpjnECVBodMo/fAEd?=
 =?us-ascii?Q?UCqXMt6J70Oaraj7i+YU4IkTnH1XL3oGm43Fye92IAcIZvsbDeqcCH37AiwP?=
 =?us-ascii?Q?5bsWvL1YermaFe63Z9D+XGGHQ558Nkq3B8r5GWXSgkJFD9+nDiVf6PXXJ9y7?=
 =?us-ascii?Q?dIMfamTVnBv1bwj0/D1Cn75Jf8fNw1YVn/zM3FYdLZPGwk/XXMWAPw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(366016)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PzvEc1aEyj6roZyIIRXZgFhUzJsuAKnazBT8iDQUx5hTavb+nOoBcT+Ttmm/?=
 =?us-ascii?Q?naI6Z6vgSrqIbHoWfRn4OBARFJMfeJdjFyOpL48sxLRMgIzlKkEyXoLa3Ftt?=
 =?us-ascii?Q?3uJI0zUpZYGE9RxP0VwZlgM8OisTUulhfnwADFBa9h73FotWYxcYdh5YHARH?=
 =?us-ascii?Q?7RSsHb8VvuIMD1Fcj3gL+AxGMWmw5YwM7uVoZpuXEe2g6GPaGOxmKt0ke9h7?=
 =?us-ascii?Q?TZJ/eUGUAGOZxWvC5DurevmgzTG1ij+MLldIGGgL83ZB/RKzSl1pRmTzPNPx?=
 =?us-ascii?Q?VsxPfrgcWBKwVgoC3qhR9b2yXETf0Ghq7ttymVQFWxSucZAbGh1t9ex9rdyl?=
 =?us-ascii?Q?Ed1WL5aFEe2xVDG59RVztUluC4cPmMJCFJijKXquH5REuVshDeNHb/ILuhkE?=
 =?us-ascii?Q?SBeOgl1jTsseXrbMCqw3fVx7ZkSFxStUl93uAQYHTniY2u3CyWAeUGEOyiWk?=
 =?us-ascii?Q?Sd6pOQYcABt36MwuSPb9Gsj/8ZksUO9iEahscP5eZdMpPcnsAccNIjkymkrH?=
 =?us-ascii?Q?06SHgOPlCLLYtXVan7Fc7QQ0ZsxE7QOhl3wZhaNHUt3s8wBY3gWC9NqaON78?=
 =?us-ascii?Q?AOX1EbQhzza/lwqLXQxqamwT3RtbG7qiap8i4RESExi0QKNxTV2NgCWLbJCn?=
 =?us-ascii?Q?A1xKHnXMiNeddfUeTG4ETin9/oUPyD13KdIuMPdIWvM1AznM9yiGiUhhj6xx?=
 =?us-ascii?Q?/CVyXgPzKefOq0F284KHseiwIX6MSGbZreIJyNQAtUDC3t5UU6znxkvOM6x/?=
 =?us-ascii?Q?OKQzqkYybbVWbqDAHi0VBg5e4VhSHy6sXzFoVKQVvFKOk+5h/CTtmyoKjjvr?=
 =?us-ascii?Q?b/CzjRk/yrPnEYZxof8aGcrR3Kz45UYuv3PgbunFT1ao30QPNXvVl5SBWCug?=
 =?us-ascii?Q?7EH6EwIA7Svie1bCVrPIq5aJWRPqeFje/41sjQBx8fB8uuN9TCiSoLZIOSEn?=
 =?us-ascii?Q?YNhudKPUASHtqy+7Y/eOsralmXUX3+FBNC4mWca5r03ZYibtgVMUtzKbagdR?=
 =?us-ascii?Q?3u8Y51VpWuoNcCZ2q8K40iQGubHTFhl4oiU7UMcrxaAo7dEDoAxTtaR9QcLF?=
 =?us-ascii?Q?LMcNnfjY8WEcIerDugY2MT3NS39xELsoZJ3SHhbRuR3vP/W/IBzQPZ8PXfHp?=
 =?us-ascii?Q?wu53tQudRzL3LqbzfTXg8umCUaSCfTHudryi2XaWzawIlagGtiYlNNo5fjhY?=
 =?us-ascii?Q?mWgVeNdTnoPPtlTO+Tx95VyQXlx6x1dyZlDmlNkx415Z8KOuvBHxjwnPBzW4?=
 =?us-ascii?Q?oo9pvizb/A3Wat5l7IEPVj0Op5ulrOLJA4BjjUhows7C9rFD7OAhmWI+51v2?=
 =?us-ascii?Q?ZuPsQ9QA/+BpcGvvvhCjETuCGbk1efTJIvDLrhse3SFGylL/TyCiX6QrGrkd?=
 =?us-ascii?Q?VgToM8DDdfH04IN+yBo5Iegz2xvX2f3+NEbQWPs29lkiQPLHLfcr9tRVIn8f?=
 =?us-ascii?Q?Rcwhausywr6jqTyPk42RCDyMymKNsyy3XMEg4DyQJSxtauM9M2iy6GMvOFXT?=
 =?us-ascii?Q?EqkQQZQm4fKUkTDPz8K3D0wTjBLfJoGR9hT65obkgQNMqmMiHn53rjwV2kgJ?=
 =?us-ascii?Q?gVuM7rj7LvWgQ4CVWClz7zDRP7tvxHEK1R5UTOz7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f387432c-bbdd-4b8e-de87-08dd35e0dcdf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 03:50:05.7489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OKoPp91YX8amPwxfZFrBPIXrHvUcrgxi8Pbv7/1l9wsKJP+uLDtSovOyXyg4yvOfD4+kGW1DKHkr7KSvL2lylA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10703

Hi Vinod,

On Mon, Jan 06, 2025 at 10:03:03AM +0800, Xu Yang wrote:
> Hi,
> 
> On Wed, Dec 04, 2024 at 01:09:05PM +0800, Xu Yang wrote:
> > The i.MX95 USB3 phy has a Type-C Assist block (TCA). This block consists
> > two functional blocks (XBar assist and VBus assist) and one system
> > access interface using APB.
> > 
> > The primary functionality of XBar assist is:
> >  - switching lane for flip
> >  - moving unused lanes into lower power states.
> > 
> > This info can be get from:
> > i.MX95 RM Chapter 163.3.8 Type-C assist (TCA) block.
> > 
> > This will add support for TCA block to achieve lane switching and tca
> > lower power functionality.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > Reviewed-by: Jun Li <jun.li@nxp.com>
> > 
> > ---
> > Changes in v2:
> >  - return the value of imx95_usb_phy_get_tca()
> > Changes in v3:
> >  - no changes
> > Changes in v4:
> >  - remove compatible check for imx95
> >  - check whether tca register region exist or not, yes means has tca,
> >    otherwise skip tca setup
> > Changes in v5:
> >  - no changes
> > Changes in v6:
> >  - no changes
> > Changes in v7:
> >  - fix sparse warnings in imx95_usb_phy_get_tca()
> > Changes in v8:
> >  - #define TCA_INFO 0xFC -> 0xfc
> > Changes in v9:
> >  - no changes
> > Changes in v10:
> >  - no changes
> > Changes in v11:
> >  - remove some unnecessary readl() as suggested by Amit Singh Tomar
> > ---
> >  drivers/phy/freescale/Kconfig              |   1 +
> >  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 240 +++++++++++++++++++++
> >  2 files changed, 241 insertions(+)
> > 
> > diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
> > index dcd9acff6d01..81f53564ee15 100644
> > --- a/drivers/phy/freescale/Kconfig
> > +++ b/drivers/phy/freescale/Kconfig
> > @@ -5,6 +5,7 @@ if (ARCH_MXC && ARM64) || COMPILE_TEST
> >  config PHY_FSL_IMX8MQ_USB
> >  	tristate "Freescale i.MX8M USB3 PHY"
> >  	depends on OF && HAS_IOMEM
> > +	depends on TYPEC || TYPEC=n
> >  	select GENERIC_PHY
> >  	default ARCH_MXC && ARM64
> >  
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > index adc6394626ce..a974ef94de9a 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regulator/consumer.h>
> > +#include <linux/usb/typec_mux.h>
> >  
> >  #define PHY_CTRL0			0x0
> >  #define PHY_CTRL0_REF_SSP_EN		BIT(2)
> > @@ -50,11 +51,66 @@
> >  
> >  #define PHY_TUNE_DEFAULT		0xffffffff
> >  
> > +#define TCA_CLK_RST			0x00
> > +#define TCA_CLK_RST_SW			BIT(9)
> > +#define TCA_CLK_RST_REF_CLK_EN		BIT(1)
> > +#define TCA_CLK_RST_SUSPEND_CLK_EN	BIT(0)
> > +
> > +#define TCA_INTR_EN			0x04
> > +#define TCA_INTR_STS			0x08
> > +
> > +#define TCA_GCFG			0x10
> > +#define TCA_GCFG_ROLE_HSTDEV		BIT(4)
> > +#define TCA_GCFG_OP_MODE		GENMASK(1, 0)
> > +#define TCA_GCFG_OP_MODE_SYSMODE	0
> > +#define TCA_GCFG_OP_MODE_SYNCMODE	1
> > +
> > +#define TCA_TCPC			0x14
> > +#define TCA_TCPC_VALID			BIT(4)
> > +#define TCA_TCPC_LOW_POWER_EN		BIT(3)
> > +#define TCA_TCPC_ORIENTATION_NORMAL	BIT(2)
> > +#define TCA_TCPC_MUX_CONTRL		GENMASK(1, 0)
> > +#define TCA_TCPC_MUX_CONTRL_NO_CONN	0
> > +#define TCA_TCPC_MUX_CONTRL_USB_CONN	1
> > +
> > +#define TCA_SYSMODE_CFG			0x18
> > +#define TCA_SYSMODE_TCPC_DISABLE	BIT(3)
> > +#define TCA_SYSMODE_TCPC_FLIP		BIT(2)
> > +
> > +#define TCA_CTRLSYNCMODE_CFG0		0x20
> > +#define TCA_CTRLSYNCMODE_CFG1           0x20
> > +
> > +#define TCA_PSTATE			0x30
> > +#define TCA_PSTATE_CM_STS		BIT(4)
> > +#define TCA_PSTATE_TX_STS		BIT(3)
> > +#define TCA_PSTATE_RX_PLL_STS		BIT(2)
> > +#define TCA_PSTATE_PIPE0_POWER_DOWN	GENMASK(1, 0)
> > +
> > +#define TCA_GEN_STATUS			0x34
> > +#define TCA_GEN_DEV_POR			BIT(12)
> > +#define TCA_GEN_REF_CLK_SEL		BIT(8)
> > +#define TCA_GEN_TYPEC_FLIP_INVERT	BIT(4)
> > +#define TCA_GEN_PHY_TYPEC_DISABLE	BIT(3)
> > +#define TCA_GEN_PHY_TYPEC_FLIP		BIT(2)
> > +
> > +#define TCA_VBUS_CTRL			0x40
> > +#define TCA_VBUS_STATUS			0x44
> > +
> > +#define TCA_INFO			0xfc
> > +
> > +struct tca_blk {
> > +	struct typec_switch_dev *sw;
> > +	void __iomem *base;
> > +	struct mutex mutex;
> > +	enum typec_orientation orientation;
> > +};
> > +
> >  struct imx8mq_usb_phy {
> >  	struct phy *phy;
> >  	struct clk *clk;
> >  	void __iomem *base;
> >  	struct regulator *vbus;
> > +	struct tca_blk *tca;
> >  	u32 pcs_tx_swing_full;
> >  	u32 pcs_tx_deemph_3p5db;
> >  	u32 tx_vref_tune;
> > @@ -64,6 +120,172 @@ struct imx8mq_usb_phy {
> >  	u32 comp_dis_tune;
> >  };
> >  
> > +
> > +static void tca_blk_orientation_set(struct tca_blk *tca,
> > +				enum typec_orientation orientation);
> > +
> > +#ifdef CONFIG_TYPEC
> > +
> > +static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
> > +				enum typec_orientation orientation)
> > +{
> > +	struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
> > +	struct tca_blk *tca = imx_phy->tca;
> > +	int ret;
> > +
> > +	if (tca->orientation == orientation)
> > +		return 0;
> > +
> > +	ret = clk_prepare_enable(imx_phy->clk);
> > +	if (ret)
> > +		return ret;
> > +
> > +	tca_blk_orientation_set(tca, orientation);
> > +	clk_disable_unprepare(imx_phy->clk);
> > +
> > +	return 0;
> > +}
> > +
> > +static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device *pdev,
> > +					struct imx8mq_usb_phy *imx_phy)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct typec_switch_dev *sw;
> > +	struct typec_switch_desc sw_desc = { };
> > +
> > +	sw_desc.drvdata = imx_phy;
> > +	sw_desc.fwnode = dev->fwnode;
> > +	sw_desc.set = tca_blk_typec_switch_set;
> > +	sw_desc.name = NULL;
> > +
> > +	sw = typec_switch_register(dev, &sw_desc);
> > +	if (IS_ERR(sw)) {
> > +		dev_err(dev, "Error register tca orientation switch: %ld",
> > +				PTR_ERR(sw));
> > +		return NULL;
> > +	}
> > +
> > +	return sw;
> > +}
> > +
> > +static void tca_blk_put_typec_switch(struct typec_switch_dev *sw)
> > +{
> > +	typec_switch_unregister(sw);
> > +}
> > +
> > +#else
> > +
> > +static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device *pdev,
> > +			struct imx8mq_usb_phy *imx_phy)
> > +{
> > +	return NULL;
> > +}
> > +
> > +static void tca_blk_put_typec_switch(struct typec_switch_dev *sw) {}
> > +
> > +#endif /* CONFIG_TYPEC */
> > +
> > +static void tca_blk_orientation_set(struct tca_blk *tca,
> > +				enum typec_orientation orientation)
> > +{
> > +	u32 val;
> > +
> > +	mutex_lock(&tca->mutex);
> > +
> > +	if (orientation == TYPEC_ORIENTATION_NONE) {
> > +		/*
> > +		 * use Controller Synced Mode for TCA low power enable and
> > +		 * put PHY to USB safe state.
> > +		 */
> > +		val = FIELD_PREP(TCA_GCFG_OP_MODE, TCA_GCFG_OP_MODE_SYNCMODE);
> > +		writel(val, tca->base + TCA_GCFG);
> > +
> > +		val = TCA_TCPC_VALID | TCA_TCPC_LOW_POWER_EN;
> > +		writel(val, tca->base + TCA_TCPC);
> > +
> > +		goto out;
> > +	}
> > +
> > +	/* use System Configuration Mode for TCA mux control. */
> > +	val = FIELD_PREP(TCA_GCFG_OP_MODE, TCA_GCFG_OP_MODE_SYSMODE);
> > +	writel(val, tca->base + TCA_GCFG);
> > +
> > +	/* Disable TCA module */
> > +	val = readl(tca->base + TCA_SYSMODE_CFG);
> > +	val |= TCA_SYSMODE_TCPC_DISABLE;
> > +	writel(val, tca->base + TCA_SYSMODE_CFG);
> > +
> > +	if (orientation == TYPEC_ORIENTATION_REVERSE)
> > +		val |= TCA_SYSMODE_TCPC_FLIP;
> > +	else if (orientation == TYPEC_ORIENTATION_NORMAL)
> > +		val &= ~TCA_SYSMODE_TCPC_FLIP;
> > +
> > +	writel(val, tca->base + TCA_SYSMODE_CFG);
> > +
> > +	/* Enable TCA module */
> > +	val &= ~TCA_SYSMODE_TCPC_DISABLE;
> > +	writel(val, tca->base + TCA_SYSMODE_CFG);
> > +
> > +out:
> > +	tca->orientation = orientation;
> > +	mutex_unlock(&tca->mutex);
> > +}
> > +
> > +static void tca_blk_init(struct tca_blk *tca)
> > +{
> > +	u32 val;
> > +
> > +	/* reset XBar block */
> > +	val = readl(tca->base + TCA_CLK_RST);
> > +	val &= ~TCA_CLK_RST_SW;
> > +	writel(val, tca->base + TCA_CLK_RST);
> > +
> > +	udelay(100);
> > +
> > +	/* clear reset */
> > +	val |= TCA_CLK_RST_SW;
> > +	writel(val, tca->base + TCA_CLK_RST);
> > +
> > +	tca_blk_orientation_set(tca, tca->orientation);
> > +}
> > +
> > +static struct tca_blk *imx95_usb_phy_get_tca(struct platform_device *pdev,
> > +				struct imx8mq_usb_phy *imx_phy)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct resource *res;
> > +	struct tca_blk *tca;
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > +	if (!res)
> > +		return NULL;
> > +
> > +	tca = devm_kzalloc(dev, sizeof(*tca), GFP_KERNEL);
> > +	if (!tca)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	tca->base = devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(tca->base))
> > +		return ERR_CAST(tca->base);
> > +
> > +	mutex_init(&tca->mutex);
> > +
> > +	tca->orientation = TYPEC_ORIENTATION_NORMAL;
> > +	tca->sw = tca_blk_get_typec_switch(pdev, imx_phy);
> > +
> > +	return tca;
> > +}
> > +
> > +static void imx95_usb_phy_put_tca(struct imx8mq_usb_phy *imx_phy)
> > +{
> > +	struct tca_blk *tca = imx_phy->tca;
> > +
> > +	if (!tca)
> > +		return;
> > +
> > +	tca_blk_put_typec_switch(tca->sw);
> > +}
> > +
> >  static u32 phy_tx_vref_tune_from_property(u32 percent)
> >  {
> >  	percent = clamp(percent, 94U, 124U);
> > @@ -315,6 +537,9 @@ static int imx8mp_usb_phy_init(struct phy *phy)
> >  
> >  	imx8m_phy_tune(imx_phy);
> >  
> > +	if (imx_phy->tca)
> > +		tca_blk_init(imx_phy->tca);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -359,6 +584,8 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
> >  	 .data = &imx8mq_usb_phy_ops,},
> >  	{.compatible = "fsl,imx8mp-usb-phy",
> >  	 .data = &imx8mp_usb_phy_ops,},
> > +	{.compatible = "fsl,imx95-usb-phy",
> > +	 .data = &imx8mp_usb_phy_ops,},
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
> > @@ -398,6 +625,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >  
> >  	phy_set_drvdata(imx_phy->phy, imx_phy);
> >  
> > +	imx_phy->tca = imx95_usb_phy_get_tca(pdev, imx_phy);
> > +	if (IS_ERR(imx_phy->tca))
> > +		return dev_err_probe(dev, PTR_ERR(imx_phy->tca),
> > +					"failed to get tca\n");
> > +
> >  	imx8m_get_phy_tuning_data(imx_phy);
> >  
> >  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> > @@ -405,8 +637,16 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >  	return PTR_ERR_OR_ZERO(phy_provider);
> >  }
> >  
> > +static void imx8mq_usb_phy_remove(struct platform_device *pdev)
> > +{
> > +	struct imx8mq_usb_phy *imx_phy = platform_get_drvdata(pdev);
> > +
> > +	imx95_usb_phy_put_tca(imx_phy);
> > +}
> > +
> >  static struct platform_driver imx8mq_usb_phy_driver = {
> >  	.probe	= imx8mq_usb_phy_probe,
> > +	.remove = imx8mq_usb_phy_remove,
> >  	.driver = {
> >  		.name	= "imx8mq-usb-phy",
> >  		.of_match_table	= imx8mq_usb_phy_of_match,
> > -- 
> > 2.34.1
> > 
> 
> Happy New Year!
> And a gentle ping.

A gentle ping!
If no other concerns, please help pick up them since many users are
waiting for it. And v6.13 is almost coming.

Thanks,
Xu Yang

