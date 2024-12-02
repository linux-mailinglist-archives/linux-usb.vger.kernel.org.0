Return-Path: <linux-usb+bounces-17988-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A169DF90B
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 03:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46A0BB2174D
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 02:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE02D26ADD;
	Mon,  2 Dec 2024 02:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="L/llp82S"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2076.outbound.protection.outlook.com [40.107.22.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CF033CA
	for <linux-usb@vger.kernel.org>; Mon,  2 Dec 2024 02:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733107897; cv=fail; b=T8nKZra75bR7xCYyrDE1YirIglVfdr68R+dWHscrncgUqW8z9U5DE9hqqazTTH2msfiGz1kzhNdvrsSMwKAt6UbeLTf78m2jJBShoyHyV5NWfzjCMQ2RIhptp+sP0db+JBYLseVEDO1SDOGEuOhQax46alWSFhKSsHe/g31CNR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733107897; c=relaxed/simple;
	bh=Cwv0kHv+rITATGP78IxIzG/Un3ti0ufGbUSGQeKKh0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZVgD1ZoSG7Zmc5TwIKwJCjXijcYSx51Gn6Q3cvE4Pn/a6RCW7zmcZq9tGdYbEwmc48e0s1VIKshp1DBx7mtQFqzHSjL44uE0ECHb/vMU94Lu38FbLT4THKgabcwwZwufO2ZWvv0kD45bFWqvNW6Il0cNeKh2SuwkAtWRrx6IWe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=L/llp82S; arc=fail smtp.client-ip=40.107.22.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imQnWNmdsyzWcsBB8uhuDMeuc91PpdQo3kGsmAHXQFE9wKp/z1puVCAttjCmK5pkGpBmtn0N4aram5djy5eQtiGUBC8pWmQndTH1KSsSobFl5k0p4/4boKFv6nSOjuiYTpMhdxw6SmY5tlXdnAEWUJT1aIr2Q+RrhAZzljWMiuKutFtlzNvkUtPv6BPKsQreKhkp7ZfO/8IWN0p+5mSdeLRmN5Pf1C7ky+W00DsT6TxXbbk7cDk6PYshr8O9uu18dSS8aAjl8zJR2NvtzT4JewZ0+rNvfPMa2wFU0loktdUSNPQ7ohgx8ycQHJGod4xs8OUF1Z0XdnlZF8S+6MsDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaHDP0Z+du0GvGkk9lCswH0jgD4GV8OjnVydQGnXOCk=;
 b=bqsnso/QuQA4sG+Jor/1FjAfj7f4eX6oowuxqy8O2rW6RIZWgzSTQeZi1Dcy9/zKBWsTZC9juL6oplvDO7JWf8DLQm/LBAhUVT/yBkTiB0Fsf9XxT/v8tTMszkwhxF+Y+AsMT7JD/tldsi5WKpxbxx1ViUWC6I9VqSEoVLbEpZGcaQh6hW97lWLwOTBsyjV6YUV9PJmKPVn4E+vykE/jN8XQL7GRc7azWIDZljMWanaCwP9Rfgo80/7Eu4heu9scm3Ja7KmAD8B1J+m8qqjecs6zK7nq/sFLpRl1jwfTcR7AfvRDtnTtFNwQWSu1QIYOQ1wfsikypZBPjM8jKkGtNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaHDP0Z+du0GvGkk9lCswH0jgD4GV8OjnVydQGnXOCk=;
 b=L/llp82Sz2I8/4s5W9SoBaE2oRYmkCbqNWmlddKdLXAgAE8Vpppizd7Q1hfVTNvrX9dAYKYihT4wqBzyQLc26qFFvN6BCXhCgzJAny/VVz+GyTimyBPHGLjk4wqMgv4thneoxgrMYwZAlckEzeIE0otgAN8413ntObqCTcfcrz06NsT6NNPI+kBjCJfwOsAWOSbgQhhfqJOS5NZK2Rq1jGt9M8ynFaheRFX/jajC4hA3/f8LYqS4ghmQCuakN7bOv7YwDnsSzeBCe1/qFk3rcSez53lonryXmwNzDVprbynmsWgDN8IepEGoOkmEz6+X/2xpRbC+n7qyXb7rwm3P1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10685.eurprd04.prod.outlook.com (2603:10a6:800:264::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 02:51:32 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8207.014; Mon, 2 Dec 2024
 02:51:32 +0000
Date: Mon, 2 Dec 2024 10:49:12 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh.Nguyen@synopsys.com, mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: host: xhci-plat: set skip_phy_initialization if
 software node has XHCI_SKIP_PHY_INIT property
Message-ID: <20241202024912.ch6yguwibg2zipbe@hippo>
References: <20241105073904.2416057-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105073904.2416057-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: SI2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:196::8) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10685:EE_
X-MS-Office365-Filtering-Correlation-Id: 55cfbfa4-bbb1-4f65-7743-08dd127c3aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6cWsRHJOxgWYrZP2/Iix4pYQBP4GEwn57+P/Df8oG91xAvyzgJ2bBfrrcEES?=
 =?us-ascii?Q?u6CikAD/FRt1njgqPJCjdBSs2glYscorTrtHqyXClCPIy4ENj0Jop1922yLq?=
 =?us-ascii?Q?HGcr3bbnvilnoWbhuEzGA2nMiRoH3J+2uR+I583OVDqPTDxAtibRQKPZYRNk?=
 =?us-ascii?Q?YFJbz9cuMkMaQcG2LWnSdSphHunQhRJGeEZi3DfclhK/1zNQmr+Y9vutES4w?=
 =?us-ascii?Q?7O41aex6ywMqLwhqqCeVo9ATovhNh46ND8AamzZpP5Fw6Go3AjCBTOk6O48s?=
 =?us-ascii?Q?wFmzt7BJ/xtxARFRzCk8OJbosu5i9Bm5jWYz7Fd7W0edJ1ZPkN4wc1kHMyM7?=
 =?us-ascii?Q?E3CgqEDvFjin+3ubfEe02gJvq9C+iOQ7UMULpIAk+poWzslW/PpfwNqf7EXK?=
 =?us-ascii?Q?neJQnChDT3QdydrFTqwUe85tgKPmoJcUBbFCSL/DkQnim2qSV5jvpoItCbtn?=
 =?us-ascii?Q?zO1j5gdbBBG2izeW3baYYJrMng4ZahwHId3V884HzA8m7Urg3ToVml7Fj2t/?=
 =?us-ascii?Q?vA09SVb/rSEVnpLDAkXfPT8+07GCtN1HWjI+ccOtVtn/M1s+V6hRTx5/KUIX?=
 =?us-ascii?Q?U6zrz4OKngCmuGnfyi2FPq3uWGnYNyiJ/L+ew6S2IbfwegKQ855t1ri1VR/K?=
 =?us-ascii?Q?9tHr7NuRZB0d0SczRTh679KrEzJjgc2vjM13efeSpDjucnJrmEzW6VZBLrXf?=
 =?us-ascii?Q?2wt3NIjwK+1Tu+SAGUWN9kWxBbKhmTZFEqp6JGG3Ha6bCYzJNDveR5vfh6Kn?=
 =?us-ascii?Q?I8tr4ilH6TX2IGXfYJhWHQsDd+BUFson/sBAGsfb1WnoWV8FRXev4MUy/8b5?=
 =?us-ascii?Q?qIkWtsEJXoKrFqBUZgylpE1xc49dGHU7RlNBeWQQFy0b6Xvx7eTV1cB3ZFeL?=
 =?us-ascii?Q?TpZN6AcyH84eQbiEY2Lyz/qluFBTFrCx8V3YQSu5aDni3t9vdcYGdqnH943A?=
 =?us-ascii?Q?SaziBte+2EuSlxST1rkJ2GXiyp7V8zLePzGfZJslQaBvOceNvTKCCqWbZO/C?=
 =?us-ascii?Q?bq0yZtwwieupMlnOaLwJIQhjqLBuwj5ngDRd8FfKYWH8dIDG3yNt5rIYDCbC?=
 =?us-ascii?Q?NZaHN/duiBzgi9pHUhVWkMrj0tAxwwqgZTkiRArtMlRs6v+Ng/LrFct9xpIm?=
 =?us-ascii?Q?ZIb8cZxQdzOu7nNHVdGoALsKRys0xqYZ8ry4peiHem7EPuX4Nkn+m6pe8w8O?=
 =?us-ascii?Q?Zc+KWLVx7HtVZS+m9SX1Hu11hErUvySWp1v/zPtUfAc2AjuBNxg/08YbsJwf?=
 =?us-ascii?Q?rCSRkn0hAa2PVSB+xg2F3D6faggdd+fJ5aapvc6Q0aLPzBY2E3HIFoYuV6Yu?=
 =?us-ascii?Q?UAk/67k7p5Va7BQcAgZ/84Q+gNCuTsoY+5sfyzcuBgJRrZVN9Klj3Mj2hTO6?=
 =?us-ascii?Q?W5WMrexWJifyBp9VL2r54j1CsrMTnj1M12e8Bt0knlmr4iMGjQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?08wmNOfrz1cjg/QHOT2WqOd3YDodLpHCX0d8jcw7qjR6U0zAO7tm8pw4w8a2?=
 =?us-ascii?Q?1PESIxurA4KSODp+EdJiaGWA+H4gJjbS5KHccDUNKufKMfcr8O86k1G4mdu/?=
 =?us-ascii?Q?jVdsudkNzUBlj1xnyppNnnsOOrnRIMGHj8Y0F7uoibTDTgZWA//Dd8GGVH0t?=
 =?us-ascii?Q?+MEsx3O9c/VuwX52iw6jZK0w9U6lQN8jtpbcHJ/MpESymXJ/FJpcLQ67kJWs?=
 =?us-ascii?Q?pIuTkFwWWijk5NXG0npsVJZI6JI48GV4ml73Ocs+PyfoeGrS/G7rJi6BIZ2h?=
 =?us-ascii?Q?6QPVJdqHH4YH2lNq53asqMLY15OCChWiINP3hesqVuaoEtAQ2zM+brIMeuGC?=
 =?us-ascii?Q?lsgZeKn0poJ4M7WDk3aTvm76C97lvTubGdAIZAUcroq5CBDZqcaioQAwSk7R?=
 =?us-ascii?Q?AsohzkPHAVelTwR1AnWn+FSeIBcs6LlnS1cAYzaOF0OEmx7BpozsQ6YinoYE?=
 =?us-ascii?Q?OuBvApuslLPbsbLhEhRroFzUAXOBOgijPE4oYVIAuyBuLU6L8L5J5zA8BseB?=
 =?us-ascii?Q?vjynZxOIlNi8deg721GAEx+flXRMZT1g2iFRVBd2b3FmOx+xXtfaHN05KiLx?=
 =?us-ascii?Q?F79k+A//oRYBVTRcPVgIa6tGPQBezE+bnwO2k1H7AeWqEMgsFnBi0GsyZVF0?=
 =?us-ascii?Q?v32ChS+WZ3LI8bIYkPtS2MGuN+Tmxfro2q88HXK9ljqe19U+dJyobtp9a3iH?=
 =?us-ascii?Q?qGb/8eyFEuqO6R2dpmTLPpu2E69eFiK2UyeOeMLZ/WVEEY8zA8D5ibElt5jQ?=
 =?us-ascii?Q?+ONg2SUwMVwUwxXBCRSrwFKwO2BbA6Er3CniANrBA+fJzJLdGgkkd+sy9yzD?=
 =?us-ascii?Q?Kusf1qB6tb+A7yPveCrovYNJ3QQiIakwUvA3/3iXwxflj3alUfffGcx7agVD?=
 =?us-ascii?Q?u8J/tdYQq4S6lbMtOdwPh8DSlmix8E5jdk+KSC36nqCQEFmBLSEsQruCZWg0?=
 =?us-ascii?Q?9+OGjaANtX6sO9GZ8erSaPepr6bRz3eI6LrsN86M7e40a6W0/9+yIYK4rDsT?=
 =?us-ascii?Q?FjnuuJ8rciJHNqI+mBPl4JUARe9I4X2CCHmFAwt4jiID+Wv3rN1OesH1Ey/6?=
 =?us-ascii?Q?HXAghspWZNvgJWEDYnp9javTwYyff3kqbCxzRO5KpDnNoEHX8d3Shi/aQdLJ?=
 =?us-ascii?Q?T8hH2eqDPmtGkpf7Nc54jBDSfaYpORf2MaY8qosqDNO2ApoUcZH66FUSAYW1?=
 =?us-ascii?Q?CfM3JFZGAaotDvTr5YQ1oimJxbC3iVDd7yO0FCw50Unaw5cupORgFpgxKTd6?=
 =?us-ascii?Q?XSJzsW7gqsGczIgdNk3FYEIDziLqbpMIlDYs6mGL5+ChTePgSCvH9KL+Ik+z?=
 =?us-ascii?Q?19NG+65xzkWUqWrIliv8iTcrXnV4FLv3hMoxx9lmhXmGgOXXuGsKhwY5+QNq?=
 =?us-ascii?Q?Mwk+QQMW58UVRw8lCvKsuWq0DmKuJFxUWVnqjpkzOuvG+q52wuoexeR+mmuk?=
 =?us-ascii?Q?FQ5oc2eITOs6U9IrEtEoIY1ECJ5/Rd6Lh+Wkk3UnzmCQTh8j+YpVq3FDtNVy?=
 =?us-ascii?Q?x6hokNOeNwJRR6RA3mMBAizKiOFMqPqHdPH/pUIivztFDlmleSKQmRKDXYLO?=
 =?us-ascii?Q?5pPV5EG+Q2mP5EAQDQzEJWQYhKfN3VJo5vumycpe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55cfbfa4-bbb1-4f65-7743-08dd127c3aa1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 02:51:32.6624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZJqXo/w2k7iV1K46SB+8WPrTaDOKcqeynb0qUjoKnlRDc6c7g1fG19dWG5T5qIld8RZBi/S/rBZK/R5gl/fag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10685

Hi,

On Tue, Nov 05, 2024 at 03:39:04PM +0800, Xu Yang wrote:
> The source of quirk XHCI_SKIP_PHY_INIT comes from xhci_plat_priv.quirks or
> software node property. This will set skip_phy_initialization if software
> node also has XHCI_SKIP_PHY_INIT property.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/host/xhci-plat.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index e6c9006bd568..77853b86794a 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -290,7 +290,8 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
>  
>  	hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
>  
> -	if (priv && (priv->quirks & XHCI_SKIP_PHY_INIT))
> +	if ((priv && (priv->quirks & XHCI_SKIP_PHY_INIT)) ||
> +		(xhci->quirks & XHCI_SKIP_PHY_INIT))
>  		hcd->skip_phy_initialization = 1;
>  
>  	if (priv && (priv->quirks & XHCI_SG_TRB_CACHE_SIZE_QUIRK))

A gentle ping.

> -- 
> 2.34.1
> 

