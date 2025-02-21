Return-Path: <linux-usb+bounces-20930-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBC6A3F852
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 16:23:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC7C2172E32
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 15:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA84D21127A;
	Fri, 21 Feb 2025 15:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NigH8Z8q"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E8E21018C;
	Fri, 21 Feb 2025 15:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740151421; cv=fail; b=fUfr8TnrxaASDg9c6LEDkCDuitZ1pvkD0SGsW+ZlLt+FLwx2C3FLc+pBzBkCA6BxS7hunS4rkbNc2wcrixXcp6HvGdjunuWXACU9hcC6lyNvFyffHTGV51d5Nr2aOC5aNHkNou50C7qjTXJ/qsKpr46qTOl9sW7mfiPtvGadN60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740151421; c=relaxed/simple;
	bh=oADUAKQ6rg1MbfDZoLxh4Pj/FRr5WeHbmXrX7FjCLiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d7Owvax600QZc/91VzNlTpycbJt/yDsvpf1dQ1zo1Bvb7s6hOa45J/Nyo/qBtqbqH/DaLzywpUwON+WchnBuB9M0ohdl8h/L7xx/WYkueGpXoY2wLf/6ruR6CJz50dPdKbky7F/dnr+E0czWAwkm2j/EVS9hmC/fgHaKYgsqM4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NigH8Z8q; arc=fail smtp.client-ip=40.107.20.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mq6tRcQuHdlx62oqGZMj8PegnkFjgeUtpkk+VkCmznTc8dbeEyznHV8I6sByK0a0yaioGvKzqxSitXfVrqBkJYH28rVV64H/3lXWQFSXdQHvBLPEg3WMh6nAbcBQ+bmw3+/4jitSSotRYu0xsNpS3isjXFQ1BiopB0SQfFEontGmXZN/Z1uDm6MYWu38bE6QwheN8fgpg0ujbrJDMgtpsEwl1nkG8X/mNLT2go3pWuanaBn4wAaJFrp2j9CaQ7hLxuG0/boZziLxP63swfX0iwV8h84b5WfCWe9jzOnYKbIQcof5afCccxtxpI8t5fqkHsgywfU0BnzXgEFWJtIj/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PaQIzoYwmSw6RkYT6rxi5ROZV0qBmKfDsPUWEhZ6djg=;
 b=MVkPd6OfDAv5s2aiHzzI3yWIedyShfTJcI1+Z6T1cRlHicr8S3oLGCduAhpfFEPaT0EPnHuTUlMJP4sQaFiAX8sN3mrI3JYcFEu81e140HPm9uYzF+KEZ12o0oqzHhMy9w/A4imjH0B/RLg+s3mboLG+FSaxH5OVH5O+9CmA9wlWhaSb35BYCL3deHIhFEH7JG5yOCoRGK4kY0gRBc5JKu7AefbodCvolUck7t3ipkhhJ50Yr+RuD+Cr5BnehL7C/ImwNrUX2XbEQDzWX9UYiVhT6eXPRk4iPYrVO5HWgGJTJqsbPssj9SiZyhlI+L6DT7bib7qzzpCcMEy2QHQLfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PaQIzoYwmSw6RkYT6rxi5ROZV0qBmKfDsPUWEhZ6djg=;
 b=NigH8Z8qASLPxAVTb3Qm644pggS2NOy/edK4syhC7LzPN+A0h6YqkmqmLhREtTI7yInN3UqLW5e5FBL3ySSPkbYHR3fMXVkgDRnY64x2KqoROGjA1QYndB6E/IyeXTehCJ+zzTgQEAICwUITJ3I8GM4OOpo4BWJujfyQejfY7GQq7r73kSHps+LBepajLZZTAgqUcxowVPKLr2n2feHKNwjtMxRAgm3vNWTjjAelJMg1iXdxNPGhNVYr5JKfaqxAPCwde2gTYn+ycnkZr36/gEsq4FhT6o/cKVv+0z+MhsYHWy3DLvuilc8vXwADw2pdybgAWr/X12PhH94MSu8yjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB8010.eurprd04.prod.outlook.com (2603:10a6:10:1f1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 15:23:34 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 15:23:34 +0000
Date: Fri, 21 Feb 2025 10:23:26 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 3/6] usb: chipidea: imx: add wakeup interrupt handling
Message-ID: <Z7iabsMl4ilQqrXN@lizhi-Precision-Tower-5810>
References: <20250219093104.2589449-1-xu.yang_2@nxp.com>
 <20250219093104.2589449-4-xu.yang_2@nxp.com>
 <Z7Y+gqu75xJyjy6n@lizhi-Precision-Tower-5810>
 <20250221032348.sncjhnldj6ecgeou@hippo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221032348.sncjhnldj6ecgeou@hippo>
X-ClientProxiedBy: SJ0PR03CA0151.namprd03.prod.outlook.com
 (2603:10b6:a03:338::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB8010:EE_
X-MS-Office365-Filtering-Correlation-Id: c912d667-8c06-41a2-7b45-08dd528bb4c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ifWsUKss8NCE/QfdUuxbNA5222ufSReRLfkJEyE1TyezGtEExeXm8HRolqoq?=
 =?us-ascii?Q?cfdm/NJhHs78zXAIEqXo6l7AtOW0DADovgwlbVtAqHnkETPUR/ba0z/xzjFD?=
 =?us-ascii?Q?xvFt0oyqODUIdoSxl/jr2vEGe3A9mDRCyOncIH29tdvqO6ivoZFqZTbt0KVw?=
 =?us-ascii?Q?zgOXhZutK2Nb2AXtohCHtMN8ZZDoff+09L27neYiRL51MCCy+oOE4Y4fUK6l?=
 =?us-ascii?Q?qornVuzR37QfZHxDM6Pgj4EbBugbvk/7YTiDj/l8O7DvpXdW3IwTM0q6JkUk?=
 =?us-ascii?Q?58IYHLb5VDbO8Da/rr5WiNFDBtr8OqqAdULCpRr5bQiLsPffXbYbFeDNVA0M?=
 =?us-ascii?Q?AcgBGwgGq0zMgXDDSILGm7NdSB2O8t6xaTUbpQe9jcP379PC5jXSX6kpUO3e?=
 =?us-ascii?Q?DrdkySF6RdZnm49tk5RlUxtiIQkoIFfOQ71DwhpeHmLYzot8fiPob4+PRHZz?=
 =?us-ascii?Q?BA3hTeWYfXnR2NRMd4LF4bkXFRT7yk1CFfCkJo4kqhy0UHVxztjdsKU+/0TU?=
 =?us-ascii?Q?U5w6LCYzWtWcHU4ZpkmAaG1EsmCkja0YAGY5PdIXxIDcy4iKQbFfpBgsAyH/?=
 =?us-ascii?Q?Xr8PnJMyKVq5Va9W4L+H3E9zBv8A5+1gJgHzczv5I8OL1c/b5+7zH8UKMC3H?=
 =?us-ascii?Q?Dxc95QumVBcy/5MA4OmeScxReI+CmDbBtXhHHZn6sSxxq6hCSDVRSFcFTikX?=
 =?us-ascii?Q?Af1P/MTM9cfujUr9yi517sMrgSu55FCbDz7m56Qa1+4GhwGS2+wT1SpRlz8U?=
 =?us-ascii?Q?hl+8JVGYbVqEv0vUnByCbsFWUj55tnr/Cr4sTCPyN2eXjcMTWlwVoAFAdlqL?=
 =?us-ascii?Q?YpY3FMpY8y9K/HgFTJlnJWSDL+cigubdh2aVoOW1FmDltgxNaY9HLBwcwgJl?=
 =?us-ascii?Q?cSoz9nOEUTWYPO+iYcyp7WYA6ML8o7Jv8hwZROrYJGETcxRBa8zLyzKlIZbh?=
 =?us-ascii?Q?XZ3WCuaw2Y/ujslm88/KI/PqOHpt7hb2fuYcAmnYUz/K0M0cyRcXAiq96VaE?=
 =?us-ascii?Q?DhCFEH04jVEw5SDex+EQWvFJ8ynvnY0/4tXaPo1cN3qmh6oc8nnHDryEgVPn?=
 =?us-ascii?Q?UCEH609G2ioHXGw/rKG/O3C4VSPs5CrymsF7hbM748LbrwQmJ2ib64VJtqGD?=
 =?us-ascii?Q?y4oRBc57AXcvAvbrvWY9oacoTPpGFtlolu6MMFJladtjXwcIQD+1rmIwY9ZP?=
 =?us-ascii?Q?pAPcC67bydHOHNQa5JhdunyU3xdfGgHnYdHZG1eKythRb7eE5IDE2WtqIshT?=
 =?us-ascii?Q?uMjKUHcQffFmrNlBr5rk4cVTH/6ZGzNjmOBaSEMNHNc4oMgH8yEAEMJ1lKeD?=
 =?us-ascii?Q?8ZPPWT//+DtQEa/wmn2elx3PDmUh98Dqy64WCRlzShek918LEFYnnjjXQRxU?=
 =?us-ascii?Q?iR696EcWXa1EhHXY/ezErQ57LfwxPYq7oYOHF/GgLXvVLI51RIOxnxjlbIub?=
 =?us-ascii?Q?IuZ3x5qW6xr7y2STKXCT/a4uPaITdKyJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kEa4+/W8jH/QiuH36ov4OiSC/gdmYBGFYr0zOlxg/8WHjJ7GCvllq1KqffkE?=
 =?us-ascii?Q?/ein63ftf5P/u2a3+HeNi7c89oY2R6b/7uPkZNpQbvzXJ9lSU3Jpxw8MGx5m?=
 =?us-ascii?Q?tmmn5SFh/BUo89LOQH7CSoKKmtQWLOWgQCSZBLlTihuw/5aFFcGXQD6WVZ6B?=
 =?us-ascii?Q?nDAsO9YN84E8vQ8ePU16Foy2oQz5BZBOCz8UJNJhYMx9bopEwR4xBvgyEZ7s?=
 =?us-ascii?Q?cZTGuFCMC6fdrfoaFwhU0ZITkivZz5SjrHlGxhzr9rimEqsWBDHFtGlf1u8d?=
 =?us-ascii?Q?lmvPAJdR12fItaFvpYtCENlfV0ne9FAw95cVLjn2stjcFwuIQdGURrkCvfKi?=
 =?us-ascii?Q?fWHxyteZpb5++nb/dAp2KeDl/M8mPQsKMq1c8mqwY4HvUG6XIKTdlccbqOfz?=
 =?us-ascii?Q?vXqAs96pdDGdK9zw2zj760BLvC2wVXg/uB0Fkzt14GgsCAeJ28NijYbRfJug?=
 =?us-ascii?Q?TLBIFllal0I5ddpcLUegf2Fru9BSldnZNbSlPaO8jRgTc2WUXz9Z7oi0uMdS?=
 =?us-ascii?Q?jCGsbNGRUH2FEazV/70aHLr40AkAlFNYvEtyplR8SUa3apGrF3HtGOOxgygE?=
 =?us-ascii?Q?aUu9CPSTGB8wavQX9/j2t+L8tWy7y5920PJZlJnLSQ0ZTv05CD7Pgpwf8jwF?=
 =?us-ascii?Q?5eMfjHyiFODCNtj2mPs3VgPscuzKTyhPrBLMNUATY00uiFY9ISmhwpRRHmBX?=
 =?us-ascii?Q?6U6ALvvQkubaRQD9J3t068ybeFKTGi0vpEkwQtVyX6MNybmzjd7pqfPmyYmY?=
 =?us-ascii?Q?5DQ/qmAEduDAnkWI1yXljs/COdUtIbfD+G0W1b7YYc3JIKIetKK60GWKs+RH?=
 =?us-ascii?Q?XLx+xhEIJpVBprNu03FqHFu9Dkx53vHQmbuFNaZTOJeb/5YgIsIHGTwixGck?=
 =?us-ascii?Q?pGievuVWb9NivHuOpu6cyHkI0+zlI2QYAeBPlsVbkjgjGfb93Frrcz4G5Qmv?=
 =?us-ascii?Q?0HcfPLb0EEdUFvmA4cu4OPAiE5rIEIvOkN6XVLf/zMbAADfO1fDHs3meztnH?=
 =?us-ascii?Q?jxEshKZ5eMN3AyhpQBW7QOKsLasYnkN5MLVSN2qQ+/Ssn/ph5j/E5DVLIbaM?=
 =?us-ascii?Q?zkuYtaR8XTy8Ssu34XHdo13dAuaEVWXh+28maDU84+yCd2CpKJDJoOJYd2qO?=
 =?us-ascii?Q?6UkZU4BV9XkCQ1PLQQdcw8vWgkRQZf2VrpQDHrF6mDXKIssFvI4v6k25Ae3Z?=
 =?us-ascii?Q?rB2Dssw0EYUNaL/1d2xmFfOtD++FlZdjjhEoZLUGTHx84mZKRPXr5PY6E/2T?=
 =?us-ascii?Q?8Z3zrP+P6YdQlcE41XS3NRfiPIU5UgmO7ejtlJRAv3kN7xGBWGFdCea9hjtQ?=
 =?us-ascii?Q?O8vKz6RKMXYAs9geivPvlKqObOcF4+OmEwq2ZnP5aVIwU2VRdWbkroLbWPUf?=
 =?us-ascii?Q?91+pF+rg3x6ij4Cu49OVStxIKiOfBv7QIlnZP+uo2tKr9DohdiCpMAkGNAq9?=
 =?us-ascii?Q?6SztwJNCplfAl+e9+wZ8vpw/lQfZn6HMGaz4m+3GCL6rrM0Fm5mh3zrILApF?=
 =?us-ascii?Q?ogcVrPSRBK5tP1fLewLf2Kus4Yh9gc7sn0TyJnzQgZDAOeBwgPmjTmwWzVAT?=
 =?us-ascii?Q?zZ14enx5NL10Btedfjg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c912d667-8c06-41a2-7b45-08dd528bb4c7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 15:23:34.4732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CudgGqUUS+Mvi85h81OptiE/qC4DJRofUmQtlt8bjxpZ7N0JNRVlN1A7c2sD/iMcNUxWlBhHfNy2StTaYzqyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8010

On Fri, Feb 21, 2025 at 11:23:48AM +0800, Xu Yang wrote:
> On Wed, Feb 19, 2025 at 03:26:42PM -0500, Frank Li wrote:
> > On Wed, Feb 19, 2025 at 05:31:01PM +0800, Xu Yang wrote:
> > > In previous imx platform, normal USB controller interrupt and wakeup
> > > interrupt are bound to one irq line. However, it changes on latest
> > > i.MX95 platform since it has a dedicated irq line for wakeup interrupt.
> > > This will add wakup interrupt handling for i.MX95 to support various
> > > wakeup events.
> > >
> > > Reviewed-by: Jun Li <jun.li@nxp.com>
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  drivers/usb/chipidea/ci_hdrc_imx.c | 42 ++++++++++++++++++++++++++++++
> > >  1 file changed, 42 insertions(+)
> > >
> > > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> > > index 1a7fc638213e..5779568ebcf6 100644
> > > --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> > > +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> > > @@ -98,9 +98,12 @@ struct ci_hdrc_imx_data {
> > >  	struct clk *clk;
> > >  	struct clk *clk_wakeup;
> > >  	struct imx_usbmisc_data *usbmisc_data;
> > > +	/* wakeup interrupt*/
> > > +	int irq;
> >
> > use "wakeup_irq" to avoid confuse with normal controller irq?
>
> It doesn't matter. It can't be confused since the driver is different. The
> controller driver is core.c. This glue driver is ci_hdrc_imx.c.
>
> >
> > >  	bool supports_runtime_pm;
> > >  	bool override_phy_control;
> > >  	bool in_lpm;
> > > +	bool wakeup_pending;
> > >  	struct pinctrl *pinctrl;
> > >  	struct pinctrl_state *pinctrl_hsic_active;
> > >  	struct regulator *hsic_pad_regulator;
> > > @@ -336,6 +339,24 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
> > >  	return ret;
> > >  }
> > >
> > > +static irqreturn_t ci_wakeup_irq_handler(int irq, void *data)
> > > +{
> > > +	struct ci_hdrc_imx_data *imx_data = data;
> > > +
> > > +	if (imx_data->in_lpm) {
> > > +		if (imx_data->wakeup_pending)
> > > +			return IRQ_HANDLED;
> > > +
> > > +		disable_irq_nosync(irq);
> > > +		imx_data->wakeup_pending = true;
> > > +		pm_runtime_resume(&imx_data->ci_pdev->dev);
> >
> > Not sure why need pm_runtime_resume here? There are not access register
> > here.
>
> It's needed for runtime resume case.
> When wakeup event happens, wakeup irq will be triggered. To let controller
> resume back, we need enable USB controller clock to trigger controller
> irq. So we call pm_runtime_resume() to resume controller's parent back
> and the parent device will enable clocks.

Please add comment here. why need in_lpm if we can make sure irq only
enable during suspend/resume pharse?

>
> >
> > > +
> > > +		return IRQ_HANDLED;
> > > +	}
> > > +
> > > +	return IRQ_NONE;
> > > +}
> > > +
> > >  static int ci_hdrc_imx_probe(struct platform_device *pdev)
> > >  {
> > >  	struct ci_hdrc_imx_data *data;
> > > @@ -476,6 +497,15 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
> > >  	if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
> > >  		data->supports_runtime_pm = true;
> > >
> > > +	data->irq = platform_get_irq_optional(pdev, 1);
> > > +	if (data->irq > 0) {
> > > +		ret = devm_request_threaded_irq(dev, data->irq,
> > > +				NULL, ci_wakeup_irq_handler,
> > > +				IRQF_ONESHOT, pdata.name, data);
> > > +		if (ret)
> > > +			goto err_clk;
> > > +	}
> > > +
> > >  	ret = imx_usbmisc_init(data->usbmisc_data);
> > >  	if (ret) {
> > >  		dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
> > > @@ -621,6 +651,11 @@ static int imx_controller_resume(struct device *dev,
> > >  		goto clk_disable;
> > >  	}
> > >
> > > +	if (data->wakeup_pending) {
> > > +		data->wakeup_pending = false;
> > > +		enable_irq(data->irq);
> > > +	}
> > > +
> > >  	return 0;
> > >
> > >  clk_disable:
> > > @@ -643,6 +678,10 @@ static int ci_hdrc_imx_suspend(struct device *dev)
> > >  		return ret;
> > >
> > >  	pinctrl_pm_select_sleep_state(dev);
> > > +
> > > +	if (device_may_wakeup(dev))
> > > +		enable_irq_wake(data->irq);
> > > +
> > >  	return ret;
> > >  }
> > >
> > > @@ -651,6 +690,9 @@ static int ci_hdrc_imx_resume(struct device *dev)
> > >  	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
> > >  	int ret;
> > >
> > > +	if (device_may_wakeup(dev))
> > > +		disable_irq_wake(data->irq);
> > > +
> >
> > Look like only want enable wakeup irq between suspend and resume. There are
> > some questions to understand hehavor.
> >
> > 1 driver probe --> 2. hdrc suspend -->3 hdrc resume --> 4 controller resume
> >
> > 1--2,  look like wakeup irq is enabled. maybe controller have some bit to
> > disable issue wakeup irq, otherwise flood irq will happen because you check
> > lpm in irq handler.
>
> It's not true.
>
> We has a bit WAKE_ENABLE to enable/disable wakeup irq. This bit will only be
> enabled when do suspend() and disabled when do resume(). So before suspend()
> called, the wakeup irq can't be triggered. No flood irq too.
>
> >
> > after 2. wakeup irq enable,  if wakeup irq happen, system resume.
> > ci_hdrc_imx_resume() only clear a flags, not any sync problem.
> >
> > But sequence imx_controller_resume() and ci_wakeup_irq_handler() may not
> > guaranteed.
> >
> > If ci_wakeup_irq_handler() call first, ci_wakeup_irq_handler() disable
> > itself. imx_controller_resume() will enable wakeup irq, which will be same
> > state 1--2. but if imx_controller_resume() run firstly,
>
> It's not true too. Because WAKE_ENABLE is disabled after resume().
>
> > ci_wakeup_irq_handler() will disable wakeup irq, which difference state
> > with 1--2.
> >
> > If there are a bit(WAKEUP_EN) in controller can control wakeup irq
> > enable/disable,
>
> Yes, WAKE_ENABLE bit. It's already used:
>
> ci_hdrc_imx_suspend()
>   imx_controller_suspend() -> enable WAKE_ENABLE
>
> ci_hdrc_imx_resume()
>   imx_controller_resume() -> disable WAKE_ENABLE

Okay,

I think wakeup_pending is not neccesary. ci_wakeup_irq_handler() can
simple disable WAKE_ENABLE.

Frank

>
> Thanks,
> Xu Yang
>
> >
> > will below logic be simple?
> >
> > ci_hdrc_imx_suspend()
> > {
> > 	writel(WAKEUP_EN, ...);
> > 	....
> > }
> >
> > ci_wakeup_irq_handler()
> > {
> > 	...
> > 	pm_runtime_resume(&imx_data->ci_pdev->dev);
> > 	writel(~WAKEUP_EN, ...);
> > 	...
> > }
> >
> > Frank
> >
> > >  	pinctrl_pm_select_default_state(dev);
> > >  	ret = imx_controller_resume(dev, PMSG_RESUME);
> > >  	if (!ret && data->supports_runtime_pm) {
> > > --
> > > 2.34.1
> > >

