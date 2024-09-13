Return-Path: <linux-usb+bounces-15068-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B40977697
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 03:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2119A1F210CB
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 01:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28858F5B;
	Fri, 13 Sep 2024 01:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NzuHySyu"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012036.outbound.protection.outlook.com [52.101.66.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7482A4A21
	for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2024 01:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726192445; cv=fail; b=akjYHxA+CDhNbTnQb+8SDgrS3eAR3KPOB1jCouK/vvvM7lEtP30zgLCWmTlhXh2n8prqlHjqEvmw5NFi3PDIwOUozqeCn7s6SnSjWS68J3NWAUG9HCGRZEe6oYXnmqPEazkz6LD4nyljfgRnvu3lw9VcudADHSiD7Vmj5I/rgIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726192445; c=relaxed/simple;
	bh=vZ8pEWabN/oWhe3Yd32YQD5+gg2BrMQosFAhzuw4lVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=B/s0pXOtewTjp85MPGzW5tchSUSf/CzkBcoWiI28XbqX913KI8sNx4i8o+E0xb7ye3MHqlHp8c+W9DpQi0MwHopkzsB1N70De3QvVjnYmKwg5QaxXyK3q3AFbXm6tKXYY2ii9PjeownAcisOtYnbR23Y/7oPQpjui9JW+ZB/J7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NzuHySyu; arc=fail smtp.client-ip=52.101.66.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vUdZ38Ut+iXl+/PvjNJlvQQDCwmmDSZx/ctmeBlE1WtiMNdN/hBNJ7HL5fYZ81BcmzwQaTn+hItwcezQ5bQe03ao7DW8xxAVoR9TU8/awPO0IrxCJ8nfuhi/FMcl8O8TjdO67HblP6oYZAyHqrYzjfhVZb5ykUuu82grMA6N7sWBUTVg+aeMVYZyxUJGPW18Dpe9oCc9yg7ju4GmOjnm0FZWuVdiBGPpFphFuAvpMrmkWAutFjFjNhn1DCCgvAt+MURhn+f3mc2IZrZ49YmmJmZQnDEMUnbUIfKFH10P0qUkzvk4HNuLDfuMJiHXqItcESfcI9ZYPYybSG5xeOJ/MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F73KAp2U6MIzUE1qebRPlAOn7nTUyaVmmxjJxH/XDws=;
 b=x557SiqWBn6riFfL1oiy5TdREgM/pv8b/egndejbat2JUQOMcoLOTR0e5Syx2aCsJQ8waA/XSuY26KLr4amCn4pCsRq7/BVwFcRFhXZHsPIwQ5ujb1oLFkZngawyxD3oCBPeNHwFXEZcaYn/gmkHJddR2iLVRgv029+MtH6464syEEh00TrCwS50vmYBDJdCLzeg7s/kLH5FskiLbBHIqxxni/adhLdbIzlpviLQl6Af63XNYAokcF0sttKjV4JeRODLT4UwcYxcrlbdbG/0plfZxa5Tqr+DskcKMI5/DeyWl/iIG+UUszzDpd4fFaCbJTa9ScnFeWijNXLLpafQUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F73KAp2U6MIzUE1qebRPlAOn7nTUyaVmmxjJxH/XDws=;
 b=NzuHySyulNsVVZdWFyS1ahScz3BRMApdHKT1upttVjATqfSctCuMfiQ0XTE7ZwDP1yV63w7/mmQUULUVK5s8LC2dDVVyLykxjhpXrw489XbatrSzUCTN5XgVtCmnaJNYF031vyIikAO1ksSoN/VMqifSLAA9UNFO1Ql3sbtVrMAGDf61Pg8FwkPvx2erbyU/IvK7PEWo0pbVCi4n+BECrFo8tFMTnj3jMjJLX0QCHACPx6CC2QQfTBnPeoQBBCKEInZJXIDoN2t89ONt5Pol3P2jVuzc6Ox13eIijQ1Esdx+270MXDxeEyUqJrALlL36mJcCpvp6WsrXOuxKovCdPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VE1PR04MB7278.eurprd04.prod.outlook.com (2603:10a6:800:1b1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Fri, 13 Sep
 2024 01:53:58 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Fri, 13 Sep 2024
 01:53:57 +0000
Date: Fri, 13 Sep 2024 09:52:34 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 2/3] usb: chipidea: udc: improve dTD link logic
Message-ID: <20240913015234.iucdnbvdlpri67p7@hippo>
References: <20240912033551.910337-1-xu.yang_2@nxp.com>
 <20240912033551.910337-2-xu.yang_2@nxp.com>
 <ZuJ0Hft97VA21utl@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuJ0Hft97VA21utl@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VE1PR04MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 16103f7a-b342-432f-03e8-08dcd396ee51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7f/CxdVyYOvYqDOLvxKXVuvn/ixp3VqymMo3GkhrOiyqM740yVQu/eA9lsRF?=
 =?us-ascii?Q?aQQe+9u+Z0UitSLkcYUMy0kgdhILcj8vkHBHtj063Xk3FusLqIOfMoXcbDjF?=
 =?us-ascii?Q?eOw2dxtyjnyTtbIENx1w6e497VqB5uhajkZhxoZrEWuxhxAGsZ7b6li0Ys+3?=
 =?us-ascii?Q?2Wli1Or80E4OrHhi3bm9ctUPPr2dqcKYlYIe5K986BsGbTNdtPjtPL5oACup?=
 =?us-ascii?Q?Iur++6Fpc0HOzXa52fXIOLzWMWAU/DkvH+ak39YIXf5f6/REvXKVyaDcGekE?=
 =?us-ascii?Q?I/FmkjcxhXdJSaH9lb/Q0DSHWFdZnskFEkBQT+DkcqH+KXgKt+klLPAt0K3x?=
 =?us-ascii?Q?WfvoXgBDZ7fO5GQQYeAOw6DfITlL7SRoFZjsifNb3DIVJuqoWjpXocTdzPhY?=
 =?us-ascii?Q?fCJyZpxl3qXxkG4p1RsLbkBRjzv+fX/CwMVdFM//E9ZJULBc4OIiwjP1AUIu?=
 =?us-ascii?Q?jUdr23N12oSJdozL2jnnJxew7wzQ1qjJikqDuD82HztLcU4W38J8LM3ulVIP?=
 =?us-ascii?Q?45t4aOJGyvFD1N5h75+3FFXNCaeDQld4a1FayJ8N05l1yx+d/goHlDUzOzYq?=
 =?us-ascii?Q?eVlqVYdqkcfPsF/poH/OgMiF2GXNVNdVjoSACHMfWxoY2Itp7MzHSUVf8wmM?=
 =?us-ascii?Q?4mXRbWs4n+VMXIjfG7o4chYNlHHtnxJz1jSP19Pcqd9k29mlMEF75OeG0Te6?=
 =?us-ascii?Q?6lAyGhwwXuxic3aTAuIQ3udC9uVHgcG71wD+S+XWjD6s/nBRY235goF3itwc?=
 =?us-ascii?Q?ZDQqdRqbL/hyyCdgLQup//EAs1qD/w17jpY/a4zk1gvacSkiYAN3NNsgDbQ4?=
 =?us-ascii?Q?GJZxD6hsBu0QczvMRY5T53GoyvOpx2Br9ZbyVrbdTWg9WuP8p6xIShtYH/2l?=
 =?us-ascii?Q?z83h2FVCJgh3OMQzbJN6/irCTg8bB2UfI6zjUel+FdvjnmlwwGqhyGWi4OKr?=
 =?us-ascii?Q?vBkDDUPALGuC4GUsv+DLjN0frZ2AnLw9ZYDqmZNI2eon7ftoQLU71J7X7Gfi?=
 =?us-ascii?Q?OJ69auIucWD/pht94IaMj4rD08Yf4XV+kq1haeU3t/QG6MH0FC96XP1fg5bU?=
 =?us-ascii?Q?OMzDUgLPJJuJqfXsQl/Fk7F7PJOCaPYF9nMN0s8DBDp7S8oePCnsIEIfWI+c?=
 =?us-ascii?Q?OFimcLdwfUgyRIowIfa1uC1/u8IzKVD/ta6jELSE83VgKFICFJ9D3N45lH/S?=
 =?us-ascii?Q?b5kNfAHAyFuihenvOKr9CB0r2lozKQaMiPvVBf2sFTuJDUMQuXcIpq8B19pI?=
 =?us-ascii?Q?AxFoVyCgfLMfAPkVA+vg3zEdWCcmNLfi4New3WGj7QcruZd2RcnJDqlOACCu?=
 =?us-ascii?Q?Wj5zWwnuWi1qTmlR4AWoQYst84kXLJq5VMYrblFqYlThNsICF4Q1FgSlRAwZ?=
 =?us-ascii?Q?ea0NjAacqniBNLElJ6yGvtYm2c+FD9d8dWbhaOJsREBr6Dzg4Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BHwYQBWiNYd2NRHNmLwzv52jpuA3x6rWUXiK0N1bZLxiXps2lNimlv6gjXg6?=
 =?us-ascii?Q?Dnh4UizWbNZjFTJCQAb0O93/8HKDSAXckao6zGTe+w0D4tGnO8k0MP0hiM0w?=
 =?us-ascii?Q?82La6jPMyqEoGSYHU5frzrEP6fXv8olkpl6FN1zpeS9e56WHn0aalMVOe9PW?=
 =?us-ascii?Q?1I8cwBSK5cYfVvdnMZ+2UFwNiBy5WEvoEB/M0UvKjtnVWK71xWAIhHWiG7hj?=
 =?us-ascii?Q?jITnTwv5rR/sHd4z+m1sjFJNrhG/ujWDUyukuj1u+7JG7n7rDNo4Dvu/7m6X?=
 =?us-ascii?Q?G7xJb0v0mygQ43x1/sM/fMa+0fdHz2RONPhGTcFl4lFs9idqgYM/DLqS2hFX?=
 =?us-ascii?Q?+GHk6Ut9j9L8BpoEBDUl7A/QgrZiABJmomKBxtJX5XTUiKXGSHg2XLDOWMWd?=
 =?us-ascii?Q?K0DS1QOgVOKhy7DSuRkiBluo7//DSxddu7YazNRNuG9FPqmuj5kpTi1kdMni?=
 =?us-ascii?Q?+v2zQjH+7gSd7+2KRji45knfXpq+uh+KQ4DPkezhowwub30BSaMGoy7wWAir?=
 =?us-ascii?Q?rJkwed0wzDat29WpZKp2hlifA0t2rBocWMvetc3xWcdlK3KMTOMtR54bPDGz?=
 =?us-ascii?Q?lCrBr7LCBBgMoVAgaHWP0vjZQ0wgtytgZKLUWry4X8Bp06E1Cf1xnsV1SiQB?=
 =?us-ascii?Q?QOTwOCJqF64nlQ6+nx93YgMSb3tvqPaXY2v6om1e58kOeET6kZBW17kxMp9A?=
 =?us-ascii?Q?vv1Z8u0EIzHTjP4vo9IsvGWE1jKoBnxdB+mRkfWqdEVLEz8OZZoEzdVdSPbl?=
 =?us-ascii?Q?buoVQf6sB5R9BBznWu7lXlFZzPz+U+TaVcQRpzKfi0ka5xBXfSLP7AS/oVao?=
 =?us-ascii?Q?61qet1ttRMMkqdPm6e5vHtkfKSxl089BUNDfFNx5tZeuWsbJU8EdQLTMKM3e?=
 =?us-ascii?Q?DfJxPNyKTiSxgsRmDbCjJ9JpEggmHdshU6cV+qzh1OR+a3ddkuVo+XdtXeM9?=
 =?us-ascii?Q?csHtUGGbNle+PoS3y2WT/CU/KP079BrqRMHkDOb9txD+2tO7KywWczJOcQXD?=
 =?us-ascii?Q?wr/35QIPNhd2+6Q5pPw9zgpaW5wK9kfdh2XryOKjc+p4O+N3BYnlm/4Go2o8?=
 =?us-ascii?Q?mwD3ip+amGs3ElidleaT9zgYNydm1aed0P5TMeW9yNwyBecX8Xb7nKHvpkI6?=
 =?us-ascii?Q?mqmccKCtSrWEirZLAZGWjWdgtksWqRn6yixrdM4fHx811lq+1YROKjXCtzln?=
 =?us-ascii?Q?G/CSMT+yJ2QhZ6OsLIEyMwq3H2MLbEPx9UTljmMrSyadwu01C6XtFe59w1hT?=
 =?us-ascii?Q?E3xHYOhu5DnMe8uAAKZ4ZKH7UU5R1taPGron6fhI6KKudVHl9nRoKF6oYvSm?=
 =?us-ascii?Q?vX79sPhTlRCRlwdKjUBYN8DMs4URnLYgP8C7eQZlbh/OF7+EFs1dUSPolWhR?=
 =?us-ascii?Q?n11XiWkuN4EJ2GIjrFAbwha2cTUrui/KoWXfc1HMxtjRgzkTxfhu4wAEu7rN?=
 =?us-ascii?Q?izBxXfGPiWMPAw1zCZzd9uyjymzgW6Vt1OaP+/+IcAz0Oqu4lZI8v9sO/Qw5?=
 =?us-ascii?Q?u8MkUzKO0Ln+2I0M0ZisQi7PM5/dNgln8qzazx/tRsZtCUl4wxNpvMwXqbOB?=
 =?us-ascii?Q?QJUQsswBIR7RqEw60npKXWZyf5srV4HDlB5n6aZ6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16103f7a-b342-432f-03e8-08dcd396ee51
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 01:53:57.7878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+ynirpo9cakyzXXeqxbR7lwhGg7dES3xcwZkfMtuk67T7vs9B7aFyBai5TFPdWeVZwGoRRkVvb2pXIU2BZVWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7278

On Thu, Sep 12, 2024 at 12:54:53AM -0400, Frank Li wrote:
> On Thu, Sep 12, 2024 at 11:35:50AM +0800, Xu Yang wrote:
> > Currently, ATDTW semaphore is used to safety link new dTD to dQH. But this
> > code has a bug when the endpoint is already in error before polling ATDTW
> > or just met error during polling ATDTW. In that cases, ATDTW will never
> > turn to 1 and the cpu will busy loop there.
> 
> It should be bug fixes, add fixes tag and cc stable.

Okay.

> 
> >
> > When the endpoint met error, ENDPTSTAT will be cleared by HW. Therefore,
> > ENDPTSTAT should also be considered during this process. In case of
> > endpoint error, the current dTD should not be pushed to the head of dQH
> > since some dTDs may be still not executed. Therefore, the link logic is
> > also improved accordingly.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/chipidea/udc.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > index b9ccf62e0a50..0ab57b87b07b 100644
> > --- a/drivers/usb/chipidea/udc.c
> > +++ b/drivers/usb/chipidea/udc.c
> > @@ -612,10 +612,17 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
> >  		do {
> >  			hw_write(ci, OP_USBCMD, USBCMD_ATDTW, USBCMD_ATDTW);
> >  			tmp_stat = hw_read(ci, OP_ENDPTSTAT, BIT(n));
> > -		} while (!hw_read(ci, OP_USBCMD, USBCMD_ATDTW));
> > +		} while (!hw_read(ci, OP_USBCMD, USBCMD_ATDTW) && tmp_stat);
> >  		hw_write(ci, OP_USBCMD, USBCMD_ATDTW, 0);
> >  		if (tmp_stat)
> >  			goto done;
> > +
> > +		/* In case of error, ENDPTSTAT will also turn into 0, then
> > +		 * don't push this dTD to dQH head if current dTD pointer
> > +		 * is not the last dTD in previous request.
> > +		 */
> 
> OP_ENDPTSTAT will be clear by HW when the endpoint met err. This dTD don't
> push to dQH if current dTD point is not the last one in previous request.

Okay, will replace with it.

Thanks,
Xu Yang

