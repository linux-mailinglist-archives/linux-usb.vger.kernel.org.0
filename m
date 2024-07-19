Return-Path: <linux-usb+bounces-12282-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 151AA93742F
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jul 2024 09:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3720282AC9
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jul 2024 07:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D38B4DA13;
	Fri, 19 Jul 2024 07:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Hx/rRw8p"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011032.outbound.protection.outlook.com [52.101.65.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF8145003;
	Fri, 19 Jul 2024 07:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721372867; cv=fail; b=ckscuAPOVu02GRya5EPhI4nsgphEWE0fBF/Uo4ekuoBjQzkhLDxkEdWAgNgznnhhtsgK3iK41j6sgx2a75abJ6nxRKcC7ZCrYPzBGbVlWYwaJU9sDMF9Fi3RWoWNuFUhXF8ewTbIMibdOSytmSIjF52roNPmndF51YgRyKCePhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721372867; c=relaxed/simple;
	bh=lwc/L5FT6Wxe38R+GEQLivutU27gZtil6Gjc0QTeM3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Hhi2WFwicnaE+/RwT22zQEBKbdT8i1A0e5wXZTgruekQQdQKJgrfGeTDxQBch5WcW0gOJtyqAIEx0oq0XQIvtUYLOhx+8BLBx/Yj2t0OCOr4m048CwchzdWr9S3eGCxcLw7HaI+Nt24QXEEOztGXaaXZ7b6v3zWh9BXzX9ekSs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Hx/rRw8p; arc=fail smtp.client-ip=52.101.65.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+vVk0MZLRp10G4ujhwGAEprqWbCx1NI7mjDG3tGQmu3s2BbzEgvOCzO5WFTQc1ZVEKzUQqTvOMUUx87qzdy+Az9jXGi6EGWsUlcWKYTxE+YATkkcmEPA+3M5wADUCxLiQ4PZMQ0rGS9miMW40H/8krKzRfwzy+LHNdgVjcPmTdQyTDORRcpaToYxu1bBQ+cW1SeJAvMrijTd3oMmWGqTOTgtfmzOEgb+dgOkMINMfsTrqgPua6Xkdpb7u2fAb6tchGTKY9bsx8MqBj01kwWOWpbMRs06V/fDXS1Ga8agz690kYIVsNuzt96hbU+SRRvoV9d3+7WK4xihrTlc3NMdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrUOWm+YhdVGGiYBGcOR9AVG9+jtF3lhEfbIQNiW6n8=;
 b=Vvll1kU2UD/q2KAw47piDpDjFHZFhJwsAVGSOyAKVZnfSOAUHTT/aUrJSi/mwkGhqm+XwVYcVqfosul86lX+dUc9B5C34nC0splSST1rvaG6kGky9fcCcVHoZ/B8teswab8NSdJkrmkumYldi0a6iJGZiuSiPqA+TSn4gZ3UfJlkpwMLJYj0HUE7g+RtjiPPj34xKLsicGiU68u7WFKu5OmaMJ8mWRoItAPqGhlUYZDgm4wEUAf0BF1BHC+NvIFH4NWcULdiqXxwQAOaleTd+a+aQZhSFQjKN03S7E7UN85BGGi7mVFdZK1S3b8BR4Lwu4s0G68pdbgb1unEqafYxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrUOWm+YhdVGGiYBGcOR9AVG9+jtF3lhEfbIQNiW6n8=;
 b=Hx/rRw8pFH0p6EHIQeYAblZFAW91maafZKKGr/Vgm627tfZD53S20CQOxfG5f95JV76PINhmTcC3mSJAV5oKJaJwZz7HLgRxF9HhrhEuXf89nPogGggL6UcHzX43AYkJsdWQM/e0XNaX2Yrg14ROE/f2P+OhsBg6szeyGaj8+Dg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA1PR04MB10365.eurprd04.prod.outlook.com (2603:10a6:102:442::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Fri, 19 Jul
 2024 07:07:41 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Fri, 19 Jul 2024
 07:07:41 +0000
Date: Fri, 19 Jul 2024 15:05:16 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, peter.chen@kernel.org,
	herve.codina@bootlin.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH 1/6] usb: phy: mxs: Using regulator phy-3p0
Message-ID: <20240719070516.bhzt3wglwlu3q4po@hippo>
References: <20240718102637.3964232-1-xu.yang_2@nxp.com>
 <Zpkp2URtnfSdm0EL@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zpkp2URtnfSdm0EL@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI1PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::16) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA1PR04MB10365:EE_
X-MS-Office365-Filtering-Correlation-Id: d40808cc-9b0e-4114-9f83-08dca7c17afa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6ACCgSO9WuhhrpLm4vqO0TItygY+E6+151Yi7a1aEAI/DzcN2Y1RYxXVdQtc?=
 =?us-ascii?Q?oHSpmf2M4gLEQdF8iAjbQjRZsLGf2UNVRRZy9HLHLweDnEqKuJQ+J4YtBTmM?=
 =?us-ascii?Q?x2TkvbuZOXLkowWGvZMgxUnF7YM9vWqK3KSE0YnP9wK3KuyAzJyt8JDUDF7Y?=
 =?us-ascii?Q?ZENrvtQS46H+scMLScNJzOQo9VJCpZ4qcha8/LO3qF5p9DeOOy2D2iNucj5V?=
 =?us-ascii?Q?7GtDinGEpQiBZfT9DApoboMj1mDz2diqDqXB9vvr7IVYmeRJai7Iw2CFrcTu?=
 =?us-ascii?Q?ClcquZAjAx+3f03tEegB7pmjdPDKgYHiDTyGr83fhQ/kmqv9YhlMwAeAFBgm?=
 =?us-ascii?Q?ykTisVgOOGMGiCI1paRuNjGLtZAcLDw7RE74hzlz8lU8rC46+xMSBuZt4u+y?=
 =?us-ascii?Q?KlXSZVn6zWdCBZ+umgAbZRaRXfI78ScBAyMVQcwRzUR4FBaefPlrvFO7tkw4?=
 =?us-ascii?Q?4qlKaPVjBqLQc3Ii7baxb6FLDJUYlg2xXqx312gmkb5qfh/CxhNkS5fVVSVV?=
 =?us-ascii?Q?U+cHArYMlMI6CR3XbQ4fEciq/8lQWDIHLOAV2PBfQdRSatsLCSA8oy3dehzC?=
 =?us-ascii?Q?3DF+7yg3B1MN8ea74lte4hiigna6I1x6zr0iweadkBcxNunDupDmHKt3e1au?=
 =?us-ascii?Q?9UG1rGXrF+yl3l82TJ3rWZAr3zXQ822stZLePOVah0Pn/1kpQW+0hAte8dVh?=
 =?us-ascii?Q?8+hu+w+KYZI11osEggVtmPdx9ZMbi1K/hrH5CT7yiUuc78oSFcOw7RxNHqvs?=
 =?us-ascii?Q?5qzOEcS3cBpy8yOxjMGvLloYMPhlMOUKBLLCImIThLrYxmnSPjAD/bbSDZhL?=
 =?us-ascii?Q?/zxb6pdaR5yQq1lOcw1gBCcYPzM4uyZ6IxziADokeLLrR8GuUug+0D6rIw7W?=
 =?us-ascii?Q?/RL4pIwrpYF5TwxiDTklTYIRYNS9CNHNdLHtXpP7TyPbkd4kH5h//Rg+ps75?=
 =?us-ascii?Q?HpChWp/Rs8RP2rvH6OZ359Fp+CLBk14Fj+6HvYrw4cmMrEM2nCNcqAJyUbMx?=
 =?us-ascii?Q?OePxyjwCSxAVfW+TKN+tlib3TnOaddpLnVcnsa3FjxL/PTNE1Sc7YUVlzs6T?=
 =?us-ascii?Q?ZlRw43V1E+y10vs6dG5YZS1ZgugRBwXHAZXYcNU7Es9VloityuV9lEQAC73j?=
 =?us-ascii?Q?sz+l5Mj0I2Is9FxjCoWmf4h0QLSi9gUyPtVuSV2VCR1JTJmirn/28BsqLsc4?=
 =?us-ascii?Q?+IQLWGvG3E1++8QgjXHmazxLcu0KsXNUqiA+bdkppAOG9uzWDJihDiemftUg?=
 =?us-ascii?Q?yNvieNbueoyMMrbexkztGY7V0fQUBiDMZAnIN1EuOpunEpbQtfMwGVIhbDY9?=
 =?us-ascii?Q?l/TSoMlgjMo/FPUQSsRRkmbA9BBQ7uSUSxUM3tow0oABFiZk2htjukanWqUD?=
 =?us-ascii?Q?lKq4404AFFZ96ofTIv5NQb57j3daUiIjkKOsfbHo8rKTQZ40Xg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YvVZCWOD0l4kDNUp0CeLBbGp6GZEldfx1Mzn2gWGflsfGD0J+A2mB4kCcw6M?=
 =?us-ascii?Q?Q2JLgLu3CbMlUzsfRv7GPbdtRzbMXl6TjAa6TrxX3lQ8YX/8r5Hk/2JSpZRC?=
 =?us-ascii?Q?WnmidzufZVO+OBkmpI7i+ecp7wk4mp90K58Oknq6djq+lVmBJR1zW0DsLjbk?=
 =?us-ascii?Q?Eci+H+Zb+4gVrbwhpgrISXiZhdBL/KjvVLNjnzSVkMHveTRDas5ft19PZJqK?=
 =?us-ascii?Q?mYyEy9HDWsAxMoja4ARl64lKKbm8poE5mQ72nAAYmR+6q613pkJb2FWZUzN2?=
 =?us-ascii?Q?ZzH2dXPnWhthpQ4gD5r2ZSDhqJGsZndp3hOln4C4L/eAM3ugiknqssLX5suh?=
 =?us-ascii?Q?fR692vfCloeZp+LeaMoeLcVmZW8lMf+NChKhvl0rctUJlNPQ7gei9U+Eu4YY?=
 =?us-ascii?Q?rBdpP4irPCmkKFwiCEN05H328QLXOG32x62tWoyeH+pQ73iSQO1Z9dWwbSbh?=
 =?us-ascii?Q?ePfs+KPC3dKekd4KfBgqRtBh/NtBBR9lL/QEFXW9qYNkBXOF8ExO+CNFVOgM?=
 =?us-ascii?Q?wB/9Vwbj7a9onibp/CD3F+e7/PnGRwrkoS9KUZ7+ZBwYTW4IL4ZI3oABaNtn?=
 =?us-ascii?Q?tvj4X56Y0qNZ3VbdgKsSalj9uTJG7S4Z5WSZmxTNVAmANo4o37ShYGn0WGIN?=
 =?us-ascii?Q?tP/FvA3jThNNvZPcM2tVapWvNHrJv1aW+r1VbgA5Y7Rm9g3PVjR+VvnafMs0?=
 =?us-ascii?Q?Elm5tjJiUDaUQGB6/mvnm+kcrQ6a+rfDH0sj/GNUaUTde5fRTDNFTqX1dSDI?=
 =?us-ascii?Q?f9cuyaCfb7ZI+37LGOdLaRLRvpMd9idVOFKiBnuyhCtB1n6SD+DyTAA7CQrP?=
 =?us-ascii?Q?O/G/cDlyePb9+PAGzK4yP4qD5pyGoQfHHtLBAzKpQ9Lx3dWtJlHvssMiqt4a?=
 =?us-ascii?Q?32p1xiGfgBmDK71h6g2ZwJP5Q7oBNZFHmf20nBryJF4es6x+R8NCajfU+AW6?=
 =?us-ascii?Q?xxEOp5INo3+kCkYJjcnMvY8ldATu3VbSZYERPfNkI5TyFlRu/u+xvFc+GiC3?=
 =?us-ascii?Q?KD51B0KkTvNgoL5brGNC4vkf+FFg9c/F6tZQxahf1ixPVBmr658kxO7MKDed?=
 =?us-ascii?Q?ktIR121GyCGcLORky5pW7NgdyjfxMeiuVlzj1dZu3aonzH16nZIYtI4Oph1O?=
 =?us-ascii?Q?vbc3Kw62vI/yOAsj2HS1JjWi5nIK4aEx01Ly2Q/a4X5IXrQUG/hUaEa8b6C+?=
 =?us-ascii?Q?EthhDPD0CXSP3Sa9NqwTXidwgRC6ORKH/8csPZ3OHd51bw5vObTRVfNcFqK8?=
 =?us-ascii?Q?xmSy31oW1f6UYj4U6xAtc+f946uU0DHpFiMrC2Fl5EgbqfglPrRBUjaOb/eP?=
 =?us-ascii?Q?/8RWfqhwbjTsTSiRoOdB3s9q86sRsVDVJqlCJLrDGmcyu99nFljFy0xBFvx8?=
 =?us-ascii?Q?ouXic2NHYx2OYGJAX1DxEA2kIK5F5Kqmn9456wWZ/RdcW7FaKeZnugkC/ccz?=
 =?us-ascii?Q?OYVBR7m2CyEEoJblLNqP7gj61WwN22O+AgkBC9mbbBT5GNfyscm5hFUq9oV5?=
 =?us-ascii?Q?TgLm5t2unTeXQbkeXnx1ymkqfVT8tXVVI0iZWW0zrMQYap/99ahNOsdYmcJl?=
 =?us-ascii?Q?SaPeUZNZQ/1nSAWlZpPgdxmz7ZpERQ0bYNlMaicy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d40808cc-9b0e-4114-9f83-08dca7c17afa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 07:07:41.6182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4HNe2+4Ya45kj/YPLJUteC/R4wXvJSwNB8A8UzPMPH4bbwkvSO+97WeWgO3rTRpt/8D501SH9m1RDphy00N6TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10365

On Thu, Jul 18, 2024 at 10:42:33AM -0400, Frank Li wrote:
> On Thu, Jul 18, 2024 at 06:26:32PM +0800, Xu Yang wrote:
> > It is one of PHY's power, and we need to enable it to keep signal
> > quality good, and pass eye diagram test.
> 
> "Enable regulator 'phy-3p0' to pass eye diagram test since it improve signal
> qualilty."
> 
> My question is why it just improve signal quality instead of make it work.
> It should not work if no power supply. 

I'm cleaning up these old local patch and I'm not very clear about the history.

But I think this 3p0 is not the main power of phy, it's just one of phy's power.
I can only get below info about this reg-3p0:

37.6.2 Regulator 3P0 Register (PMU_REG_3P0)
  "This register defines the control and status bits for the 3.0V regulator
powered by the host USB VBUS pin."

I've just tested it works well without this phy-3p0. I'll rewrite the commit
message to avoid confusion.

> 
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/phy/phy-mxs-usb.c | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> > index 920a32cd094d..42fcc8ad9492 100644
> > --- a/drivers/usb/phy/phy-mxs-usb.c
> > +++ b/drivers/usb/phy/phy-mxs-usb.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/regmap.h>
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/iopoll.h>
> > +#include <linux/regulator/consumer.h>
> >  
> >  #define DRIVER_NAME "mxs_phy"
> >  
> > @@ -204,6 +205,7 @@ struct mxs_phy {
> >  	int port_id;
> >  	u32 tx_reg_set;
> >  	u32 tx_reg_mask;
> > +	struct regulator *phy_3p0;
> >  };
> >  
> >  static inline bool is_imx6q_phy(struct mxs_phy *mxs_phy)
> > @@ -288,6 +290,16 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
> >  	if (ret)
> >  		goto disable_pll;
> >  
> > +	if (mxs_phy->phy_3p0) {
> > +		ret = regulator_enable(mxs_phy->phy_3p0);
> > +		if (ret) {
> > +			dev_err(mxs_phy->phy.dev,
> > +				"Failed to enable 3p0 regulator, ret=%d\n",
> > +				ret);
> > +			return ret;
> > +		}
> > +	}
> > +
> >  	/* Power up the PHY */
> >  	writel(0, base + HW_USBPHY_PWD);
> >  
> > @@ -448,6 +460,9 @@ static void mxs_phy_shutdown(struct usb_phy *phy)
> >  	if (is_imx7ulp_phy(mxs_phy))
> >  		mxs_phy_pll_enable(phy->io_priv, false);
> >  
> > +	if (mxs_phy->phy_3p0)
> > +		regulator_disable(mxs_phy->phy_3p0);
> > +
> >  	clk_disable_unprepare(mxs_phy->clk);
> >  }
> >  
> > @@ -789,6 +804,21 @@ static int mxs_phy_probe(struct platform_device *pdev)
> >  	mxs_phy->clk = clk;
> >  	mxs_phy->data = of_device_get_match_data(&pdev->dev);
> >  
> > +	mxs_phy->phy_3p0 = devm_regulator_get(&pdev->dev, "phy-3p0");
> 
> Does binding doc update?

Yes.

> 
> > +	if (PTR_ERR(mxs_phy->phy_3p0) == -EPROBE_DEFER) {
> > +		return -EPROBE_DEFER;
> > +	} else if (PTR_ERR(mxs_phy->phy_3p0) == -ENODEV) {
> > +		/* not exist */
> > +		mxs_phy->phy_3p0 = NULL;
> > +	} else if (IS_ERR(mxs_phy->phy_3p0)) {
> > +		dev_err(&pdev->dev, "Getting regulator error: %ld\n",
> > +			PTR_ERR(mxs_phy->phy_3p0));
> > +		return PTR_ERR(mxs_phy->phy_3p0);
> > +	}
> 
> just need call dev_err_probe()

Ok. Will change it.

> 
> > +
> > +	if (mxs_phy->phy_3p0)
> > +		regulator_set_voltage(mxs_phy->phy_3p0, 3200000, 3200000);
> > +
> >  	platform_set_drvdata(pdev, mxs_phy);
> >  
> >  	device_set_wakeup_capable(&pdev->dev, true);
> > -- 
> > 2.34.1
> > 

