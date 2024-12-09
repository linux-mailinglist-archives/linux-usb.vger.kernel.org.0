Return-Path: <linux-usb+bounces-18245-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CC39E909B
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2024 11:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C012E1630E6
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2024 10:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FEF215071;
	Mon,  9 Dec 2024 10:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DgNNOrTI"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2089.outbound.protection.outlook.com [40.107.20.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DCE216E39
	for <linux-usb@vger.kernel.org>; Mon,  9 Dec 2024 10:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733740781; cv=fail; b=c8gCwhFFc8S4WLT8CM/Z/9WuDkOdL74AhvJ4PvGY/nXZZ98sGa75jZFCwhE2Yb9p9jgeDMHthoKKtpJDjGT/7zvg9eSBm6ypR+wknbl+OmnWWjgGLeX1YCN0gfGYIKy8Ea5DpSh0l5t3m1afR1SWT0Yd87ozwbUnFL4KIOqPmvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733740781; c=relaxed/simple;
	bh=gmTn5fQ21NgwNXoy7kgFZqi8IxCw3tKeZOD0SoCkwkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RJ7+XZveZteusaE1LgUUBhyrFlRYxQZEJ5JiVqBBc7NWs5DOJcY/zGjAzUVFcgMjF7Jme3ZbnJCkF/GXiK0Arr0Rr7PVqWffnNt4xJSObiUztCjWI+iMFanEzWhhb+dZp8yLgrY+JX+VHZgfGtjSJi3ijnNnr7hB88eFevHHqLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DgNNOrTI; arc=fail smtp.client-ip=40.107.20.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJNMS8PmLZejyY84a6AJkcdyLsDzwf/izVZfIM7DD4dw6wja5q8K4aFKc6ifBhZRGLZZEbbeQDj/tClmAy8W9UH/5Y/5pDGByThlpuRxdc3kYoXYyBhM6TJiu/GUziIaRE+aRUhq9lU6jMyxqtgykurFVzq0NItvcxmbbWGUKx4MQenlS5Sf46ZgpEmvdwnmtgw/6DC4iBLRZcAzLvobF7MkiSpK4j4TPJl6PU1KTvfSxB0si654wkLPgaanpn8T2P8dJaAY0sTMsYy04VqYb6LFDtFKTA6yM7RPr3Y0WfOtujGwSKFlOrXivjr3U/X1nezt+iW2azaAN6TM6l3prg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cylEXwFit9oXQwFcTJdhAo6o+UJOsGfZhJIG4fmG7L4=;
 b=yoZ3bHY9/UELTepisc710X3Ch53lnPDXUc2LwG1vXVuk0PdCyn66M0UHgNDeBXAo9xleJTnbgFSnsjJr508DKYpW+A60d9yuMoZ53dmERNAA6R6XN75+2TIBopo3uucholreMIoixEPSat6okeWnBZDtFYYQPdRe99VMfEdiD09ucmi9cCfiXoj55nqsb3HfEWgt6TKj6DAUDDt6Y+VxF+V3bsHke4xRNbAygaJqT80OWoGbR5o/7d8I7UUEanP1+KHG/k1WMfjLPAmB3JtkNRwsGhYWuxYdUUfMIgpUI36KyPGJZnaq/KnJVvO/UT2Jh4eNHuJJSVEPFyPZeImYdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cylEXwFit9oXQwFcTJdhAo6o+UJOsGfZhJIG4fmG7L4=;
 b=DgNNOrTImMmMlrSMDkDWBVr3ydX1igVQeoz2LiGh+LvA/2HE7RG1uc5MxFfRyWoRkKh48t/Wah870AbWw7KVAMy9dUJvxvgcmC4rcZOPTYQPRop5gJ5co7YDgTOHFeGXMQdscwcY3zz5RT2H9Y3Uv6qH93OKuRWdVY5pQhLcLxX5uyAXw1AJUwu5h91V7a5fWDtMvF3hmAZ2EooqoCPLg0fuaBPk/GNWoG36CHdek1cEtjJoE9DV3pLarDxqjdRRAJy3HRkea/2Aok5TyOU9/OoBT+XQPhfupa7cGBJzTYS9KIlGqDsaMqPBQ5HfZ/2JhqWn9rVCdiJUuJ0v3UrHUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10103.eurprd04.prod.outlook.com (2603:10a6:800:24c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Mon, 9 Dec
 2024 10:39:32 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 10:39:32 +0000
Date: Mon, 9 Dec 2024 18:36:49 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thinh.Nguyen@synopsys.com, mathias.nyman@intel.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: host: xhci-plat: set skip_phy_initialization if
 software node has XHCI_SKIP_PHY_INIT property
Message-ID: <20241209103609.zdwdkkjcoww2gvpz@hippo>
References: <20241105073904.2416057-1-xu.yang_2@nxp.com>
 <2024120402-applause-perky-223c@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024120402-applause-perky-223c@gregkh>
X-ClientProxiedBy: AM9P192CA0005.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::10) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10103:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c8e2168-4fbe-4d2e-a073-08dd183dc430
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Dx37HGBHbd7NpAxSGm4VCKBt/lUypB/nm/ZDLzpFET98OnKtGlxIgu/98jMn?=
 =?us-ascii?Q?MIM0OPpYz/tYijQQ4V4LlcwBT+JBUxQz56e+b9+7zHXnwzE62aRHFanMZgEK?=
 =?us-ascii?Q?BfpQzHSXq/KqeIt+wTRTny7bFMq92ekWOH4nu9Zyg83I7So0sBQyBX0T2NZ1?=
 =?us-ascii?Q?Lc4oBkwXyXguj31wotkDFv6sWUAkQEMEr9bPPE5bYqbaEfqD3cH+7VTJToNd?=
 =?us-ascii?Q?0L5pT1RWqHbnEWjUJJxdUjNFqyjrSoZ2EvatC8EW8/8gokNIvKjdAXI0qxV7?=
 =?us-ascii?Q?3gehnQqdZqK3VdR+oyngtJ2M/ceS5lXS7iMq4OfSFkKJr3ls9RbQQMQozl6O?=
 =?us-ascii?Q?nmUHnw4uKqJpv2U5OTKQsmrcIu1CCiHKHHuOyHRfr0pK7Ze1oLu16/UntQQ5?=
 =?us-ascii?Q?N65SUEJ9KIFU0UM6d/OU/Fghx6sAmNOJIyWT+9mjdKXQaI+jjW1JUAYrljuI?=
 =?us-ascii?Q?YpP3iI+mOTTIrnYjynkv+qSRPkERieiUdw6ZdbSWVXK4A9dAqEnyUpI2mZfw?=
 =?us-ascii?Q?4uU7TRQcqjGr4dB33cnKIzi7R7Sg8bzK37Ha/hSyQSGYXm1yeH/jaac3RVZ8?=
 =?us-ascii?Q?fJG64IuYYuu0kbg38yTWaz6LjqYPqEBStKYulDB9g5ekH3FJpneh3633+/q5?=
 =?us-ascii?Q?utw0DHdOuO4hahKPaEogykKMsRu7NtFkMAh9iRNMTGZNnJ1i5BqoXl5f5CWR?=
 =?us-ascii?Q?3yEaKhx+0+bi/e7drtQeKefG0TvEB2tso7v5MlLl+2+rc5jZXyIIWabkJCtg?=
 =?us-ascii?Q?1ak8L/QwLy+Nh9zWgxRLQUNq7Y9IqhAPkoWRHjsU9V4YzOb7+RHshUr+2Q0R?=
 =?us-ascii?Q?4MyrFk6HArOErrV0LQRsGLCXBm4uYeOiUJP74qpL5/9LmtQ6MFuNrH+4aG06?=
 =?us-ascii?Q?QhKY+ictTdxdOhFK7ZMEfC/PIpRWoMb27GVVcuYmKBFq4aKYKK0Z4qCKBPBy?=
 =?us-ascii?Q?MTDCuUPD0CTaz8H/QdIm8+nf1MGKf5YH6Yn4wyN4KzPCbQRo77gus0P3UoMy?=
 =?us-ascii?Q?mmI2n3pHSAs2CmecYnnnPyiRAfTy110zORK+NcZxYSUGLJqYYee0YK/+JKE5?=
 =?us-ascii?Q?j8JEs4nPAxyFK+R1H6B7tNcm/wktZ6vGZOmTpHWyIRxDeCZ//ED5zj0999Af?=
 =?us-ascii?Q?wiYX0RcVN0dKAKmsDXxtzRf3/r0sGKaacu5ibOyyiuej6hsjzooxQqoB7om+?=
 =?us-ascii?Q?oNMEyzJXThPKvtzqwoywoJY0EXx5gtn6vAcwzKPytxnE61aI+eiPZoT4ywWm?=
 =?us-ascii?Q?1E4f5Ou3ST7XiXRN2+AyTeDdi8PGQM7uACukVl75SsxxMhW3Gsm9fxh58ZvS?=
 =?us-ascii?Q?+hcmpFLRzp4c1zF2PHJCJLqZxTMA8FFm/cUL5SCjLQ5Cak23On24bVMIbRNP?=
 =?us-ascii?Q?nQg3W/RMdRAi3z9g5AcS5HAIh1SHbuW7oqev8aN9tyNHVpYBLQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ikNYPaBw/xu9uvllMzVQeFwBzWVEEVV78rPsGnApy+iUjued7QL/9mvOt4cY?=
 =?us-ascii?Q?iItX/8ZD+gt0eQSzGy6jRCqkI7W4JSw8d6JBBNx6IHrGBDRL7Apm4ng1u/p/?=
 =?us-ascii?Q?0a1oTzBeeVDBCLn7eb/BBVOfBXk3rbA1Hs/SyXTQjopSUSdgbUrgKSeSgG5a?=
 =?us-ascii?Q?PMK8WWGHCJuC/sU+3BI3h3zs4Gxl1s1vPTVWksCiSE+KzZffl03ZVhqp3wrU?=
 =?us-ascii?Q?UF0YFbZdwcIFZzppBYUc57e8PNAYd51gO8UDy5dfvpEYz04fifbBHlJi5Jis?=
 =?us-ascii?Q?1rT56chJSWwKxPIBbmnwISj9uLekE3Zsj41AfT3dEm0o/izPXElarn0qaFKS?=
 =?us-ascii?Q?STF2Tz9pUEFCc9FEgf8zafuc1OPaVgXgJhvMxl8dEz6HTin5zEjRY+Z0CwmH?=
 =?us-ascii?Q?J34WViqtiEd1S7tId6oN/eUffdgw2dvH1SS+3E6q3gsQrQfOCBMy13kzkfWj?=
 =?us-ascii?Q?Aiyd6Voi0/nrDplHvkY7OMA5cKuRpRezxCD5HM6GvArqKBjIbKrLZH82rTs9?=
 =?us-ascii?Q?Q/L5nNXsaoV8Hab4sySlzkmTCynaOfLe1KolL4bhqHu5Gel/6pDmfvC9L+4W?=
 =?us-ascii?Q?g08Ybun1zn5mySHwryztDkatYAAn+LQylvFNWVtT3V7Ipecz9dqhEqFndM+F?=
 =?us-ascii?Q?EHw+BhOJb2wAkWcwI/rKtFKmBYz/FHySfQW4F2Yhs2CASAEDsRzBfuruyO0N?=
 =?us-ascii?Q?aA5e2Z3OSCmYcfXccDZaAOgTu0FUCoSVNreZ+a1T5BSz1T2VD0qa7ZUKeiG0?=
 =?us-ascii?Q?Qm4RwZbeFFHgbisK3QNTk82h13kQczGCsY+rHNiPTxGiw70HSqdCFzOvYOCu?=
 =?us-ascii?Q?tHHzd7CaGlGtFyuljKASEb3Zr7F4PZppNMhn1RUAK9sXOHBmP8lG1RHB+U1J?=
 =?us-ascii?Q?aZvSAMxKGLWVQS9sMUrKrtOIiARvbLMkdCE6pWeBpkD3rxHU/FQb6BACrTPE?=
 =?us-ascii?Q?iVOvDiDT5MQv6z01uPggSWsIqmCaxhcyUzGEbJKEjZeeWa2oAu9DzUEtKQsG?=
 =?us-ascii?Q?pV7Aity6o/1BBdqZnQM4Fb1agqijeq3UckBEL0FTPH5ODpWiWDblpLE9J4BS?=
 =?us-ascii?Q?4M9jd1xx+X13gOlrMVV6GCQgvNebMvfYN64SymVcoREmwOGd5sCXx8mPgwlt?=
 =?us-ascii?Q?VTMrnrj5E4Okt7SbeLEcoSmK4d537WUF6cpho/JyhvJijJs58ajn7XXdWiLO?=
 =?us-ascii?Q?Vi3XyZsP2YTFfOOqI6nQ96jwqgQFBYol3h77J8j26+1+mmDFp1TnB2o8e1gu?=
 =?us-ascii?Q?ju1WnSMCo9EkY0kv5nEjCcm3pfwM7hXcn5PvwiNhBoyzs8q3Uhg8nxmX+yHw?=
 =?us-ascii?Q?zzBMmxFA7AHuoNrE1/RbjUg3Bbw1NWeX5e2Nj38mKe/6pdAzNqv3mycmJBQH?=
 =?us-ascii?Q?kyTKlKjDWFx7EbywszGiYxSRgsm8nelNorX6OvAORcRn3l8Qs2zwgucOViJ0?=
 =?us-ascii?Q?vEOOM5NvC1kenoQvkdiTBtgnwTMhS7qhR/MeStComTaoDsjuM+Moeu5G8Djo?=
 =?us-ascii?Q?qSLVV71czDNLtQ6n3HIxOVLppeVKA/wsnPOyzOiubO73f/Xg9lKrHFpjLtd/?=
 =?us-ascii?Q?7F/VvAqUe98VNMUk3oMhwjHVJ1mbu59KJl7f3JzE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8e2168-4fbe-4d2e-a073-08dd183dc430
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 10:39:32.3901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7btOgyrFNWIDhnjskDruW9il3LFZCUbld6vEOxu7RlSB/7p+P9CW8f8foFjmzDFcLR3wM00Nn53kmduCw2JTiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10103

On Wed, Dec 04, 2024 at 03:56:30PM +0100, Greg KH wrote:
> On Tue, Nov 05, 2024 at 03:39:04PM +0800, Xu Yang wrote:
> > The source of quirk XHCI_SKIP_PHY_INIT comes from xhci_plat_priv.quirks or
> > software node property. This will set skip_phy_initialization if software
> > node also has XHCI_SKIP_PHY_INIT property.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/host/xhci-plat.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> > index e6c9006bd568..77853b86794a 100644
> > --- a/drivers/usb/host/xhci-plat.c
> > +++ b/drivers/usb/host/xhci-plat.c
> > @@ -290,7 +290,8 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
> >  
> >  	hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
> >  
> > -	if (priv && (priv->quirks & XHCI_SKIP_PHY_INIT))
> > +	if ((priv && (priv->quirks & XHCI_SKIP_PHY_INIT)) ||
> > +		(xhci->quirks & XHCI_SKIP_PHY_INIT))
> 
> Wrong indentation :(

Will fix.

> 
> Also, what commit id does this fix?  Should it go to stable kernels, and
> if so, how far back?  And if not, why not?

Checked the patch again, fix tag is needed and I will send v2 soon.

Thanks,
Xu Yang

> 
> thanks,
> 
> greg k-h

