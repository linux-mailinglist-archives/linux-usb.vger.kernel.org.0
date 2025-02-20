Return-Path: <linux-usb+bounces-20856-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C139A3D686
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 11:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17835179119
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 10:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7761F151B;
	Thu, 20 Feb 2025 10:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VN7NdsOO"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2070.outbound.protection.outlook.com [40.107.247.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FB61F0E5D;
	Thu, 20 Feb 2025 10:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740047171; cv=fail; b=Gc1jjjymUgitsgUWNrZit2W5eeUkKRk/SPAcWHxfC/tXHpqMiZl/VxwEOr/O+NhHyN2IW5XhZ7c4QtyF47cjinuMMlcHTt3xyIjIQFluW9RgKwZc1N9I3jyOJWhgZG79jkDh9rDNgFz2XEsPNPIzVnWSc0ZTI5gX6916YQgv29Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740047171; c=relaxed/simple;
	bh=oag5FjhH+GTnC1Oopa/AgCwJYAk6WAk1XILq/yRDP2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fmHJ44w2QJOWzn5i/T+efJlxw7wugCWs01jFgFf2V+OmLW+L5O2iws6e4ksRlddecY69KV7znJW1EaDDiUe+Bvd+cuqAr0vCjqhcx9XGLJRLad0i4sqKujLJHlibGXLRm8gB+AkSs/h/4FQtzMPLnvUuMKoIcvVvZdiAqmZV7co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VN7NdsOO; arc=fail smtp.client-ip=40.107.247.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=El7c2iALGshqVgDQLhJjPo8iJnXA4ixfxzm0jtpO39swghrppX3moBOTwcx9XX5HjOVuuuyrO2J2IgFO7K3vixxOw4i/dwUHyKaN7zmyKLXleEDJ/GnrVijrLwOfhwCm7oN+BocuSC8t3FpG89tNLtmfi7IcPzLT5wI5SvDRArFK9ixQa0QlIN4UQVbFtEhsYy1q1Z9jlZ//lG6MFnmOhO1s17R5iaZo2Ih2nRuAZLD4fuGSxVF52vudU1O8xmwQFKI1RzZi65ViqpocjzRdGyYzJesbyDzmRnttjKNx1VfB4MdkEhyH4DovjCrp79o34fKvYCF/pxPjlx2bnVdeig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJfi73Jr0AEU2g8qCrCDuIrFDoa1dNmjHuoOXNJn8pk=;
 b=qfDYGz/uBVPHYRmpe9145dN1tt8Wqa2sCEQg5mQEV5+kQ38fa6nGE8oxaOqDEZPl6ZEMTyggjfAYFSQWsKNaINLPsTuvJm/Gsmpfc3My/dsGalG10AI8d8pE8k3slw1YghlvUIy4aZDSU9Kaf1OOEgKM20wzfvnco5Y6VlKgXPlKRIGB5hwnwt57hGr1OHwPTyJ3aCHoJR6oJfptYoJYZpJ8QCE1zUXIgWSnjjc9UcalhfFhPZR4ki/AW+M96x4Z5Kzarp/aVRwJP6IrKRqpYr3VctFbGUrwKkTsYh1NYXwZj8oEcbJGvYIOmx5NnAJefFrLLQbyRDF842KrXN9lcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJfi73Jr0AEU2g8qCrCDuIrFDoa1dNmjHuoOXNJn8pk=;
 b=VN7NdsOOCGWBY0G5wi+h+SGMeyqtKKeav1nnv6BspXquSworRn7kWldsKlJvCEI8VIyje8YhBDt3R17ndIrDDj6W7bDudB+idFnASemgAG5j+wA4nDtNy+c5iT67+Hyq/liA0qUKHnkNpfKLrksTuDtOEbSsrgRLUY37dCLA+AETK4V4W2r4bA6/7DELZoenYYrirR11I1veSdjaXlRibmfUgKrhs2KWagXRA03cFJPt7hI8id7ytQJ6qCH8kAbg1IoYzb8SgVwLHYKSrn3MaMBh2qDKymk9xjix6VZOq97kqC2zTwJ5OAH/MCtWXKRPwvGbv4M1bTuyyty7XzOV3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by PA4PR04MB7598.eurprd04.prod.outlook.com (2603:10a6:102:e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Thu, 20 Feb
 2025 10:26:07 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8445.016; Thu, 20 Feb 2025
 10:26:07 +0000
Date: Thu, 20 Feb 2025 18:22:42 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 1/6] dt-bindings: usb: chipidea: add compatible for
 i.MX95 platform
Message-ID: <20250220102242.g2sijuvh4wq56gq6@hippo>
References: <20250219093104.2589449-1-xu.yang_2@nxp.com>
 <20250219093104.2589449-2-xu.yang_2@nxp.com>
 <Z7YbsvFMb7ZP6xFu@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7YbsvFMb7ZP6xFu@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SG2PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:54::22) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|PA4PR04MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e17a581-6fdc-460d-cc25-08dd5198fc8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5aWfbtyTAKVEM3z/LeTtO64TOnZ128uBmxn3BIAJFiRBAQSrjzafV+JJlU9V?=
 =?us-ascii?Q?VXT0c4+PYyasO1lgoc+A0KvV4w4yP51TsCDHPi40h8aiVu/8R/N4IEBP0Bfn?=
 =?us-ascii?Q?WyOhbawPE58ZKqD6ztvyIFIbqcvlQ9hUxlPMnhyCqK9t9p7xGaxdWviMQFb0?=
 =?us-ascii?Q?1nzgpfEIcfOOlQktQWlq44uOEcO0ij/OB45WxvF84I0TmAs4NZ4+CjuumWeF?=
 =?us-ascii?Q?L8id1T3xoGBzreA+Kk+X/xR5z8Mopms+gKJcwwp1Wt7SOqq3J8SkzWV7sSbt?=
 =?us-ascii?Q?yEUz95kLoJ5UG7eyRilcl+LWXkGX4e0xnpFfk4LijwTgStXGOF77xggFlv6y?=
 =?us-ascii?Q?A+idcXL7sBdl0GxwOJCN2Jk9sxbyjgvw2HBnbo9nZLbnHIvGPmto0us/ejpU?=
 =?us-ascii?Q?TyJl2RreP36FlPRmwR6fY4LW6zNqjcmx3Qa61t3Izz78cQA6OrdoewBDQm/X?=
 =?us-ascii?Q?qLZci59VAkFMvyjFTSleVFaenYGy1PZ/DUY2DWaesJk45XQSPPBnlI1oHdlD?=
 =?us-ascii?Q?JL7ktO3883XpBRSxrLRQmKxpyZ6x5DBlvUY42d16fk44OIMIYDXIejuarTOV?=
 =?us-ascii?Q?aDwRdAQu/7pK6IyyleQruYp1hr46eXQyT324r85jwPyxUaqifcLHxqX705Ix?=
 =?us-ascii?Q?edk1m9nROdsIpb0gp4/p4TPWKC/dqFgegrQGUOUnHZyDb+JflGUjnSmZqBkt?=
 =?us-ascii?Q?IapPnHq3DIfiH6vlnDWif0GhvYmGRfq8C3+vjq1Lz/hBUNuATRZabzeOUlDR?=
 =?us-ascii?Q?/u2Dfux70XKWnCkCZ0rUhE7kYpPb9nZqxQbgnycVoiJYXFWcV1OMWUhRBWh0?=
 =?us-ascii?Q?BAkVQPpNDH7WF4GoDco0CBo6S9LHyBkTUFkMxnSdVv1U4EH1Uz5rSxx85uB+?=
 =?us-ascii?Q?SuVYjVmFVOUBn9hk2aeLxs6BISvcFxPORibCRfdT2XqmIJAzS17nyK/uEgoL?=
 =?us-ascii?Q?5l96BdfEFifacGsYAFUsP5y7OhiQa1B9aXzU7YKjoyh4EXRzpip/+GoQtpbG?=
 =?us-ascii?Q?vFQ+A6xpAyadbd7XeXMY9DzInPMlaVP1Q8ACHtGO/eSTV8O0K1AMgI7Yl5bQ?=
 =?us-ascii?Q?g4FP0+FJHNeU3D0xoWU4WlzD3SdQXnM19+Z9BYapq9Jyp8/D0691ccHnWPqa?=
 =?us-ascii?Q?uAY3Ho3vfG4jf6v1t0PEuCD3kEBVgLbumqZlF7NkF0WhSegYkR/B36D6St5M?=
 =?us-ascii?Q?bBw2Nz8/8+gmiupZokuL5LXnMXish7vH2VR75BXacunwpyBZbXrx7EjIzJlm?=
 =?us-ascii?Q?ISV+7P3lJ/W4EbKncExt2IEInPT3sn6SeG05ius6vBpOnpfpQ0Gl8cERC0YX?=
 =?us-ascii?Q?upGUfrhmW6qQBdR7/EQHx3hAR6vt8e2uN8Nmb8AWSYkMqPk8DE79GuW8Rbfm?=
 =?us-ascii?Q?czO5F/5XpOFsR3pL/NURVRUGF8Wzy8LRohKEilwSr1SsxjDyn6jmeL3bSkXz?=
 =?us-ascii?Q?m4tKPjP5fF9XQG6hcBA5EpCtyJ6pzjL1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xj1TDHV2X4SrAWlkkQTVWOvjM36reJr2Mywu5dcFzl+UD/aftY8W0sIffNja?=
 =?us-ascii?Q?bijJrpXt14c7ms1l0SxkPGHpuJnj8KTw2UlvIp9VSOpo1Wh/4b6PdomvIMQD?=
 =?us-ascii?Q?+gOGXpVAmqyUiswGeKZs2MqMxCyaN3mTRQ9i1dAICefIZLB32/n48VcY0lJs?=
 =?us-ascii?Q?TBJh/RZzYREkQ1fWKZ23wrj2lMcnXVuyDSctKxEInJg3bMAuYYzDM0d1qX1U?=
 =?us-ascii?Q?mctz6BP3B67G3YOHPm6XroQB0jNYpfiHVCQ2xAzaGqdiYWbrRJQ2gLIu6zZz?=
 =?us-ascii?Q?xB8puVpvOK3qR3jts6DLFbWbCkIvJcDK7Muz+SkIcqF0ozAVRYU2N1ndIkxu?=
 =?us-ascii?Q?OL+1p6OD+jvxwj7t9IRS9hPKbs2RwHf4mGozNcDuLx1i0jyldviDqYGhaSRL?=
 =?us-ascii?Q?5djgr+z7Lz13of1kEDSG2vsCm0rNk84YJTcDddy5QTHLewR2LMWBvKelfVRD?=
 =?us-ascii?Q?g15zLmydYWWfYF40jSlQ7Y7Y/kvT74X/GcBgb1lbbSObVfAtarJ6H8J503lE?=
 =?us-ascii?Q?YTWEpYHyfAXD0dF6JHlKZjnlsYoo160ZuzoZL0AVnSfmtssB0osvXCjtjJrM?=
 =?us-ascii?Q?Uo2wnYFr0Dn4ZP9GghGEqyrlzFvBhiuATn3KJpF7t7XvxS1JybQfbcnya/I6?=
 =?us-ascii?Q?Jj8kVF0aw2gMXpL0KtAQAdTEqbOyYIF4oOiPf2nAIGBP40MCe2r1NqLYQ0sm?=
 =?us-ascii?Q?uyeEYUMY9wobVIf5Yc6DAwDf80zK1wu2LoVmd0K5mc/i4i6jkG5vkpldTTW8?=
 =?us-ascii?Q?jxNOzaHLibTAbwmoegrPbAbXRiqRFikxsSITFZjApT+Mn53DKJ8+0RbE8j1A?=
 =?us-ascii?Q?cTkGnZ8stGaIsm6vuFMsF3NVmKFGLE5lkF9SarPmyO2xAN6vgrOp1GoP+67z?=
 =?us-ascii?Q?XoTXEE95jnA+N9SQJTF4CLsoVailq73+A1Uw9K+x+dNeWt5fysrjLYa89hKx?=
 =?us-ascii?Q?aPWXWm4j+MP9lOmnD4Pqcg6GgSs0Fz8RO0UlAm4CQJ866wHORTK6dTpiJ94p?=
 =?us-ascii?Q?xJuTwtrgvGO/aX5SUfhBDQ+tKpTBx3XAqPHb7qQ0HKEAMKoX4c4r98LYq+2F?=
 =?us-ascii?Q?HMS8OHXNzENThWU37zlhdixHbyVtHxvV+i2uC56TG2nmS5Az8SF20h6GJrBu?=
 =?us-ascii?Q?ZSl7FN3pSqYyTlb/XsbZnntAsRzZ9+xlHbu1HX2yEgLcZkoDOeNNY3B46+jv?=
 =?us-ascii?Q?GB4mkUlOVYB2Z40vIOtKZURi2u4l6zn9AMS75ZWEBHh6UrB+D02sE/G306Xr?=
 =?us-ascii?Q?CPl2EqYtUpFf59w323mjxLSA8x52AbYPXtSzRt5uMdtWsL+mn0SVaa4tFdi4?=
 =?us-ascii?Q?XLN/u0drUVcQV2iBeNiptEcsSvzdp/KE1Pg3Nq2Ci3bqZxho5Qpofa89VScR?=
 =?us-ascii?Q?pzug7aeZlznM74BsRPCrY9FNBc5r3cS8h1QBfgUoqHgDGB7j0JOMWvnsEa35?=
 =?us-ascii?Q?XTBij1oLXdkXwBAlWBHi1A4ZdnMvXnHoUUBY8G1ntxVKwwqz35SSI8quIC6W?=
 =?us-ascii?Q?nYHTk9EBs72xfstdfnw8SngpuDcAfSEAnadcBDrxgYMusw1vavmnM4V90RJG?=
 =?us-ascii?Q?TAtehrn7xELnYTNqz2xJpswFlnd3yKv1hRon3AlR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e17a581-6fdc-460d-cc25-08dd5198fc8c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 10:26:07.2023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VNmLf/gw6KN+q4D8L22Vf5JlF3MXxtSc+aGOF/8YN+UiuqzVfBvA2pQtEadHEjf/uLPca28JUHE7amNzQ2lf/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7598

On Wed, Feb 19, 2025 at 12:58:10PM -0500, Frank Li wrote:
> On Wed, Feb 19, 2025 at 05:30:59PM +0800, Xu Yang wrote:
> > The i.MX95 USB2.0 controller is basically compatible with i.MX7d, except
> > it needs a second interrupt for wakeup handling. This will add compatible
> > for i.MX95 platform and restriciton on interrupt property. Besides, this
>                           ^ typo,
> 
> run check-patch --code-spell
> 
> > will also add iommus property.
> 
> dt-bindings: usb: Add i.MX95 compatible string 'fsl,imx95-usb'
> 
> The i.MX95 USB2.0 controller is mostly compatible with i.MX7D, except it
> requires a second interrupt for wakeup handling. Add the compatible string
> for the i.MX95 platform, add the iommus property, and enforce the
> interrupt property restriction. Keep the same restriction for existing
> compatible strings.

Okay.

> 
> Fix below nit.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> Frank
> 
> 
> >

[...]

> > +    description:
> > +      One interrupt for USB controller and wakeup interrupt combined
> > +      case or two interrupts for individual USB controller and wakeup
> 
> Needn't descrition here. Items: descrption already provide enough
> informaiton.  Or you can change first
> 
> description: USB controller interrupt Or combine USB controller and wakeup
> interrupts.

Okay. will do.

Thanks,
Xu Yang

