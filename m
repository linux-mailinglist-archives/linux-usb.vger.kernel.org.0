Return-Path: <linux-usb+bounces-15071-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A1C977735
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 05:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 472B5284A68
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 03:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F111AAE0A;
	Fri, 13 Sep 2024 03:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Eh7KUVJq"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012041.outbound.protection.outlook.com [52.101.66.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AA01A76C3
	for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2024 03:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726197245; cv=fail; b=krAbkzFAvEq2JrkHj/dmAh4fxpDOYnO86xbOvCv3r5boaDd4obz0ZInhPIMVr9PvW+Lh0dqMIS5m6MjndjqGkG+wzGcVV7cpt2e1f1QlzOUrW3lEPyO+zpvDV2eJz5ohmzKIjsR0TssLJLFzbOMh0BfZG0pgyqtq0WfNq/LPPZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726197245; c=relaxed/simple;
	bh=5dByOvcXNCi2SpGjazR89rZU6elpZp84YJ2N2/Xktk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rzlXvlqzEb+J54kUiKFSJOxralrAHn7N4S/JQ8QxTkDvlsR4dVCmX76L0V9qJhMXUBnuiFxyy+zYwpKWMMwoRB1YEma6fzphPJwpsBt1J8tYPOs040wiBJsieUEAKkiCL6YGAiQTM+j63uLdtVLfrY9768GIZdotb9zRcNJishg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Eh7KUVJq; arc=fail smtp.client-ip=52.101.66.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLqauyZGWy7NALBT0aX4yV0EFnmDfeSH3XfY7dDUAQs5y8grVXD6qQz6aauArLT2xN7IkEQLQWqeHeRfH9GAZB+Ik8+i7DKTnOfZnx48DmypzEIohzrlj89hFzfhpZXhGBkL7IEO+kYg1go8JnWnCQWkGxjHVe4Inu9oFCceYQj6eZiAmR5som/YT2mKJSCslRjEwtiswL4CL8wpDVz7bSebRm158686Y6RLubYKE6qlnYuXCnApWD6W0TJjofVnOvoFGDBgy/PQSAF66/YSozKpeWsthcbSWBPwc9n+g7T1QclEtb8om36hZMEDNfQ8Gu7a0jhIGP2YdbB7BVW7qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRak/wc1tDVoi6rOgPK8w0fYY35/qkwHVq5FbNLhkkM=;
 b=qx7SHlKKAJyGaKsKNYZFw6s/LbSP/suT950ZsvPQVejdygTyHmyqy0AAivYnktGicuYYVm8rRllFealCr2y0ccNcQ+9KSEhiTivfk0s9/dhx9BoiRBzcDhBHG+yK+JNCdCpPLPxe7i0EuEGREAcMolZZ07F1RNB/RVl28tjgdKxlWB6ULiklDRrSjPVTYv9Z2fXB/4T6GvP5wxz5uDPHdkUVj9y1Uhf0LpqvUp3IuNJCfyJv6q7O8mO/+cVeHJyBUclZY3mkeMkZUPFuaw8tFdNMTdgcLowb9MBJuCOX0yevdm+J7CjUsICOR51R2cGBr7v9R04SSTb2NGMR6Qztgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRak/wc1tDVoi6rOgPK8w0fYY35/qkwHVq5FbNLhkkM=;
 b=Eh7KUVJq7RZv5FVQheyIXdxzou0nZ9rQEjFAExckIpMjOhebeBubJWHT0lQ4KMra6eiyTsLQhDyW19jqOt3kH6xrZfaeAIlzGu0m6Dj+NmHgFae8FBoexJzbHwenRUUbHo3Y2B6wHypgI0phN0TaKHSg+VQCRq2Wm5L5w33csPT0/dKzvpfl3vj74Y7zkF2w6wkQNAyZSzDHWBLHoCpzhlnPalrrfRRfwgfrzacKzsBBGBDbo0Yg/OpASmj976pWOMOocSC0pSc7XnThhamrL9K8N3zULrd61idBR8Ueq5/a8S2UbgjdYMWjmoIe6Rl9trBM/eVM+tXiKNMhyOXjiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB9733.eurprd04.prod.outlook.com (2603:10a6:150:119::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Fri, 13 Sep
 2024 03:14:00 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Fri, 13 Sep 2024
 03:14:00 +0000
Date: Fri, 13 Sep 2024 11:12:32 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Peter Chen <peter.chen@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 3/3] usb: chipidea: udc: make isoc endpoint a bit error
 tolerant
Message-ID: <20240913030847.gknxrjgjn2wwi7de@hippo>
References: <20240912033551.910337-1-xu.yang_2@nxp.com>
 <20240912033551.910337-3-xu.yang_2@nxp.com>
 <20240913014940.GD320526@nchen-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913014940.GD320526@nchen-desktop>
X-ClientProxiedBy: AS4P195CA0025.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB9733:EE_
X-MS-Office365-Filtering-Correlation-Id: cdfd43b7-d6d5-415b-0999-08dcd3a21ca3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/tv3g80CgqXdTX9Nvt5S6KMKgEEppOtFsfdfJKosDCM16Vv0IdNj6awKszrQ?=
 =?us-ascii?Q?ifu6dQTLT9k8dndbX+jJMc7UvGzPAuOnLcwkb8v1dVyg2XBAheOISMIjB4ry?=
 =?us-ascii?Q?3E/ThfpbyGyUZBCWnpQF8ZyMakGJ/Mg9Cn0OIjZ7whjkekOHOWSe7wXKqie9?=
 =?us-ascii?Q?Yadv2fxL0ao/WoKA6TZXD1GrHa24GKbqZwiNyEBsQPNpWoX2lBR3j/mcXSp8?=
 =?us-ascii?Q?ABD0x0blg8oHaewIP7Z5M/y+agjAA8JIHtMAxWxhMdp7nl9vYS5Tz6dCwrvy?=
 =?us-ascii?Q?5BAdzdIlGnnQCFDYh8C7APSk/40iWNiUIfllvKEUyzgqYUN54WVHzREn83C4?=
 =?us-ascii?Q?nickw5xLtrRNMAWHxnWBIokJWAsOU34T53b+9sBlL2tq4lrG1PtFYfeuH1iM?=
 =?us-ascii?Q?ibiNoLXahBpnKUIyfBS7aaUMwkEFz0AVqcuUEBIcOvqDiP7s9SjYkavU+Qv2?=
 =?us-ascii?Q?7dJnY3pwQ46ghuL0C/t+KKjsN3lLELE97PU67p3PnFwQ3bphaKSSboS+vCvQ?=
 =?us-ascii?Q?iHa7euiPUDEUXRDtdZA8ZTkbBEOZ6vl7E3mjXi0NSFIl6G3ujX/zfQKYW72E?=
 =?us-ascii?Q?Ymea8y6lhE18zGNyn/T5QF/qo3nMqRlzLX/9PYzUkma3dFxZMnqUXaM0KGgW?=
 =?us-ascii?Q?L8L+XxewmNYQ6MsSYwzU3HPc2yQAXUxOb9keL9kf1ah6678X6qWObcotcbtM?=
 =?us-ascii?Q?iVVXA7BKM45kThDlklBs9jvXgpdawhGKrXRj+L6Va3B/Sut94P2xmtNWJebc?=
 =?us-ascii?Q?K6+S/SH95Fbi1ZymRPLhtBQ7qAWKz4Vcr4yQCinRGBnv++fFlAfQNoWeGkgv?=
 =?us-ascii?Q?PDK+KgIkGGOg3p5JjQN0b/KCZbR8cwEQc6b+P9XX2v4cUAd9GfJwr1tB+utv?=
 =?us-ascii?Q?ASLW+Uoiuti42YXGS20DZWXGIMkicwlT42YyIh068Y2eO9asK5D/SvrlIl44?=
 =?us-ascii?Q?QHSf/t8+H0+VQJYu/HzFQqbazWsR1ThW770ZzAMeDGaR5EaRYwWyNjQNGAvW?=
 =?us-ascii?Q?YGSoNYxPKoTmuRMbBOCbs0scw4OrSkSKZ/LXfY/1myUyanXIABrrL4knAx66?=
 =?us-ascii?Q?L85b6Bnp5Rthvsuo+OhgxOiHNH2SHVUYaG7sOwpFk2ZyW9/iv2RMkpDNSZKG?=
 =?us-ascii?Q?hiq0PtholpMFK7ukDcOK7JwFVKIZQcJSELESBxNoJEmU7KejZAAdPLIDIYJj?=
 =?us-ascii?Q?uiMofyYMtXfW+qji0PlGBv6OyZnxHu6sBAZgdc+p6bzu1potGrJAoZN5k+gY?=
 =?us-ascii?Q?iKG7EceQQs2GKm11X9rDmw5Nc9/pJVsRsAHQNtSOQ8QeRY20JbgdkkEGXRGP?=
 =?us-ascii?Q?oKdlcq/7uyTpbrixyIEA4MLFi/xud0I0zH8k0ky7asulDRSzh18zUWW2l+Sl?=
 =?us-ascii?Q?HxoWMJz4DdGDINWKh1qTFVT0JVqsaxLa+bmlo5KLUb9+eA++Gg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lp5koYNZimX1oFaN65gDr1ZaUfZuXf0dUs4WVa9EOQZ6siwCDz9MLN+32seO?=
 =?us-ascii?Q?1XhidjweZUo7tc4ShW7rzXyKo3W0HT+gtFyNMkTBeqB9RGCL3+QEHKhYMeIf?=
 =?us-ascii?Q?zJ0Z7tlkn8IgiP7i+G31v3pTpuCywJmOgTuW+8OVmFfkauAoeMwVnUd8KtQl?=
 =?us-ascii?Q?4GFpuuqorqJQShAOF5IZzvi7X9wmBW8VkzgXL/1gOjAsYwIu7eEU+mrr9zKc?=
 =?us-ascii?Q?UwkSQRUEazpV2AFx4d+7fvFLqql0Rq85aDBN/pDtXZd8z5rF931zgyJCKSlb?=
 =?us-ascii?Q?EfLgBPkFYLscoswjgb36aDaOifEYF7+kjE4rntQTV7+BKfVfnXBSUJIvUh6W?=
 =?us-ascii?Q?B70TiZQ+BUOdi70l6Bxnn7JcAZCMLgK/oDNiZ2PaNiz3lG4bTsW9ycZCPoCs?=
 =?us-ascii?Q?kN0j8DtuQqBNGoh4RquMOI53Ar6ZteJlTT8mO4cbEiCEi5y2MZFb6lU9s88r?=
 =?us-ascii?Q?DneN3IzjgiACTf8/Oc2QF+vBVXBpJEwgNnGzlNSinwX74kQsRmFXq6+JE+te?=
 =?us-ascii?Q?hTFpQyaHiNanHhuIPauVK7O6T1DnWo9L+IljhcAIgW2aaBerZIhp/cL3RInO?=
 =?us-ascii?Q?Xi5Wu39Di5oyLC8qDfsB+rDypExheVbhK1AhV9i8h4NhsaTQwl96Y/fL5SeD?=
 =?us-ascii?Q?qsXGIc1jMWiUD7p6KzgARFUzSwgRz5U+0gzDGYP+ccKi9+ksiWsif9kl77ny?=
 =?us-ascii?Q?QASwpiHDViUtZchaQrTxAllcEqx+e1UwuIBZyMQMFCF2dMP9dsidVDW6HKl+?=
 =?us-ascii?Q?fIOVvGvZVcEFQDu6FU4/Dk4faD2zZZbgbBQpQHVkU2Bpu1DK81Dz4bqB5nEA?=
 =?us-ascii?Q?eewu5ieKFfqWbHQCHunO5mPMaDjbAgNTErXhnRTYyOCzcryHzJSBfB8qbp1V?=
 =?us-ascii?Q?wlgL2FQ/5FRdFwhCKPdE5jRD8oAL0msZ2J3h8Dj5OEkwi0o2gzJqbFDJyORQ?=
 =?us-ascii?Q?Mrt++ROd0TZmPeBF6BCvZev2oZKQZ7sIJOBTU2D/oYmRfnjwc4j4F2f3ETDL?=
 =?us-ascii?Q?7uhjJf3oFzacyEJ2NfxFj+K+n4numeaDxA724kuQP05BZ9z7qx7fkUkWY9Rj?=
 =?us-ascii?Q?D8rssJAHCyPuIm+hvDPA+Qb2dTpkrsXby+XFqHr0+IgLdBuAnKyXIKH0mGjX?=
 =?us-ascii?Q?ua9NkZRV07eOpb5FunuwS/3Cfsk+tnk8gbckdXghMZWHho3k8qk6F8PLS2TE?=
 =?us-ascii?Q?RKQpKrWhiQiUkX9oDZtge/7QdzjEnaZIyRu6vm/2vp8rWzTDloJnJlrCCgTq?=
 =?us-ascii?Q?dgJXd0t5rddr1SlGIqODSRKMZS98X+HXaDLKpXAuYnjKNlRBpk1l9jQ2pJo+?=
 =?us-ascii?Q?JN4haskPOcFcC1sWRS8iUSgWzH3QAIov5l5iGbS9ILE9HO2MO/FH4aElFo3+?=
 =?us-ascii?Q?G9J1hhuNgOk3H5OsD2CHLp/NpcoPb3VHQnEWv1ezYt9QSi/r1sQ//A9+tTpg?=
 =?us-ascii?Q?5XHHePPS3P4+WxbsD6VyTAy+x4U+o8dDQ+vnwrJSjhq6GklUBE5uZHZYzfkz?=
 =?us-ascii?Q?DaA0ghTPLeiTph3YRy58d3zWm33te/SWfWPL4rjdvxeF0qAWF9f0ZY0mtEwV?=
 =?us-ascii?Q?vX03cYpachZc37FizrOaOFpehAYQ9ZmEUw0ySTkK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdfd43b7-d6d5-415b-0999-08dcd3a21ca3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 03:13:59.9308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBeOZL2lRkCoMEQgQAObGfc/BCJ6ooCW6Rf0VBds66wLDf7o9Us0j1nM12Wpdj5dlvm+rhxXY8JDNb3qn8rpGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9733

On Fri, Sep 13, 2024 at 09:49:40AM +0800, Peter Chen wrote:
> On 24-09-12 11:35:51, Xu Yang wrote:
> > When a endpoint met errors, the usb controller will firstly assert
> > related error bit in status filed of dTD, then ENDPTCOMPLETE will be
> > asserted. Finally, USBSTS.UEI will be set.
> > 
> > Due to isoc transfers are error-tolerant transfers, we can make isoc
> > endpoint a bit error tolerant on device mode too. In case of error,
> > it's possilbe to resume the endpoint by reprime the corresponding
> > endpoint.
> > 
> > When error occurs, this will allow error dTD be deleted from dQH and
> > giveback request to user. Then, a reprime/prime operation is executed
> > depends on whether dQH is empty or not. If dQH is not empty, reprime
> > will be done during dequeue process. If dQH is empty, prime will be
> > done when new dTD is linked. In this way, isoc transfer can be recovered
> > from a small number of errors.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/chipidea/udc.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > index 0ab57b87b07b..b1a1be6439b6 100644
> > --- a/drivers/usb/chipidea/udc.c
> > +++ b/drivers/usb/chipidea/udc.c
> > @@ -683,6 +683,7 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
> >  	unsigned remaining_length;
> >  	unsigned actual = hwreq->req.length;
> >  	struct ci_hdrc *ci = hwep->ci;
> > +	bool is_isoc = hwep->type == USB_ENDPOINT_XFER_ISOC;
> >  
> >  	if (hwreq->req.status != -EALREADY)
> >  		return -EINVAL;
> > @@ -696,7 +697,7 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
> >  			int n = hw_ep_bit(hwep->num, hwep->dir);
> >  
> >  			if (ci->rev == CI_REVISION_24 ||
> > -			    ci->rev == CI_REVISION_22)
> > +			    ci->rev == CI_REVISION_22 || is_isoc)
> >  				if (!hw_read(ci, OP_ENDPTSTAT, BIT(n)))
> >  					reprime_dtd(ci, hwep, node);
> >  			hwreq->req.status = -EALREADY;
> > @@ -707,7 +708,6 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
> >  		remaining_length >>= __ffs(TD_TOTAL_BYTES);
> >  		actual -= remaining_length;
> >  
> > -		hwreq->req.status = tmptoken & TD_STATUS;
> 
> Non-ISO dTD may need error status? You may refine code by ISO and
> non-ISOC.

Oh, I have checked this line again, I indeed wrongly remove it.
I have no idea how to refine the code since they will go through
almost same path, otherwise, the code may be a bit duplicated.

Thanks,
Xu Yang

> 
> Peter
> 
> >  		if ((TD_STATUS_HALTED & hwreq->req.status)) {
> >  			hwreq->req.status = -EPIPE;
> >  			break;
> > @@ -715,11 +715,13 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
> >  			hwreq->req.status = -EPROTO;
> >  			break;
> >  		} else if ((TD_STATUS_TR_ERR & hwreq->req.status)) {
> > -			hwreq->req.status = -EILSEQ;
> > -			break;
> > +			if (!is_isoc) {
> > +				hwreq->req.status = -EILSEQ;
> > +				break;
> > +			}
> >  		}
> >  
> > -		if (remaining_length) {
> > +		if (remaining_length && !is_isoc) {
> >  			if (hwep->dir == TX) {
> >  				hwreq->req.status = -EPROTO;
> >  				break;
> > -- 
> > 2.34.1
> > 

