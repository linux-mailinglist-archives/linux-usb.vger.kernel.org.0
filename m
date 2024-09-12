Return-Path: <linux-usb+bounces-14975-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A281976042
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 07:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2C2CB222DD
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 05:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD8A188910;
	Thu, 12 Sep 2024 05:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PBfJEWeT"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB961714CC
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 05:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726118046; cv=fail; b=EKrSp+QNzLEINXIQEoxcdxY9raY16v9F/k+QYn3qgxPldtJGcprsz0wY/tM9cpgPbOy7I0ftD+rtU671B57GFkeP9jsO+HHrfOsTBlspbnIZqHMCd2XscF4sBoqiNKQj4N1f4IMvSujIjbhVOykiVD2aZiLay+W8FTjw2vfobsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726118046; c=relaxed/simple;
	bh=8a/wM1he8CGbIpNtZDCMpoRlghMPJZSGzxEPachsKT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rQsTKFWFxP+9GXEn1OvsbJXDa02kTBjapM8lp6i177TXqnjbMAR8QlH+6Z5AW1a3GHwXora6CDmZw/9HCNjMJ0AhaMWLNaVqdhthBZSX9uxx2MUKvAPgnuoJi63oQHkjaGYVAUhWvkC2XOFO1RIVdXQ00ClZ1uWB5LLMdPoSl+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PBfJEWeT; arc=fail smtp.client-ip=40.107.20.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLozfh+YRbX5jLsxSr/4uReYxoCuTrT+s14Y+yPL8gE+zkwrMP9Ij/ZK0+7wnmFGlmhAW+Qrf3cpQzXZSItULJtv0OsajfzXYAUDtFqBNok0vPR1N412dBocDS1N1EhMgY5J0AkKqoqzJjcpub6ssQ84HEDVVbOpD3QZABGDvuSwx0/7VrBz96H2Samhl2kjQ4SvjOXxoJ/TQNsVQjAABP0CVuM7pRqM7J6pBDGsOJ/9ZW67Rm1hnKASWCRn20PlAsnn9CXxT4X1ODzLTjU2QxQm/wp43+I+6ylL4jvDfi1oGGBLmkBvwsVHO3xWU7HTRAZJuNWRPO0LU4q740v1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0l2XXhshKu5vflGwh1hYBvSVzDts2EJkEkIog4kl90U=;
 b=HaFrkKunYCyt7CwCJj+BB+CkOHNz+t4c1TpKUvbeIvvHOLB2zK+bsbdAEAr51WIMQWHhxD/PWpJftC5FDJXCuHlHlcWDG6d3fOtZxYr4kwcsfpaYyS4K8sjExK2VSdfKXaqW4OFNMTryW1iaMYkspUA3Baip9KzEYNX5Z3mLHYuEmcV2ljPKWIIHecN5BfHh60RFvoH4vqTPTZtcyVMf2/egv1355KE2Bhxff5ru5J7xS2Mi9HCDR1+UPbb8EKZzby0SwhBiqcqyp5NWI5JsHkSaKRkJL2sy58in6xnLb5+H07Qb8rqETAFL4UBI0ZzXHwnsn2cCUlerab6Uti30kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0l2XXhshKu5vflGwh1hYBvSVzDts2EJkEkIog4kl90U=;
 b=PBfJEWeTlEqvwFBGDNT6pwTHv0hVjQzzHZN6Gal/YAWalAzlSCN8GAKiTB7qZrPEWL51fhIJZ0sxc9NA4/XDEo6+63ebhBU+dnAftVJ4h6DcyYndZavhRntBwmsHMAP3RmQrdnvl+uC7J3UAIYf9iJmqwz7uK2khDrksVHr4KBgi6cDryGz4etAMgRGJ8Cm7bqAJ6v9vdmG8OF3IcpsypEZi0zDHsdi+uXO41Ap6mfAN5CvVwEVhkCadARniwTBwCSy5GetMWMH/rFHTvOTbpwMw871KfvM6qBFaQpkS5ImUqP+6vssfhLSkk6LNz4ZK2qzOTl/7DzofV+MJL1vXGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8538.eurprd04.prod.outlook.com (2603:10a6:20b:435::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 12 Sep
 2024 05:14:01 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 05:14:01 +0000
Date: Thu, 12 Sep 2024 01:13:54 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 3/3] usb: chipidea: udc: make isoc endpoint a bit error
 tolerant
Message-ID: <ZuJ4kr+Bc+LBlF1J@lizhi-Precision-Tower-5810>
References: <20240912033551.910337-1-xu.yang_2@nxp.com>
 <20240912033551.910337-3-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912033551.910337-3-xu.yang_2@nxp.com>
X-ClientProxiedBy: BY3PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8538:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e7e311d-d70c-4422-85c2-08dcd2e9b673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H/ZPIK78f0pqJuWI8N2RAB9otoB02HvlaGgtjjjCba+JQuIYOuycahkSBHDT?=
 =?us-ascii?Q?PjYYZ8znFBrubpDE9PFlRUXpgBB//ECtF0NUhF0r1VM+wxo5RGhhHM1vrE5P?=
 =?us-ascii?Q?8Wg1aeVAR2LVfDbJdCgBdZvNQVyJKZZmfxGN528Q3Jm1oIgLrc9HL4Kh3Qic?=
 =?us-ascii?Q?5IGkZhK4Aqqij5eagx+dZ4UgAcO0uqQoKuunqQPBo4Fg7ax7Ufayg0U2HHEb?=
 =?us-ascii?Q?lvJNdyAYsnq7yfSjynJbC1a92W2g3IgCDQBmFu7N/T0OcAYfaKnI5gx5N7O5?=
 =?us-ascii?Q?z0Hei2RolO4NzKvr3i7Dk8gsklOJMWm9bGnHb3kA4x84I/10FJ/l6vkXz7VF?=
 =?us-ascii?Q?1IVlUhplkoyvRN5reZVePhrzVxVWqYIRf6UBUzCacEcwCbP0vfpx5V7qrDnB?=
 =?us-ascii?Q?/w+fbB9tZzJNqPnhumcGIubOcmdJsZpqcHRODWyW8w2FUUlRDFbPAu5pw7dw?=
 =?us-ascii?Q?6bcWJnBqMxq0bCHyYJowrB4cx4O5q6x0OyubsIAdEt+FrmiOArtoZrSZMLDu?=
 =?us-ascii?Q?IAsEolCZyYoAgLJGPsyze9p8Fm/JEXhDyafG+QXPgVeQf0myM+TU3tUbW/Jr?=
 =?us-ascii?Q?M9XJqXNHU2RWK5DoKr2Vt+BvLYrZaDX2JrZQ3hlQ6xbR5kadSOGqIWzldCYl?=
 =?us-ascii?Q?tWxjV5sXqkqJIWqAibqZaSPItAdt4cM1pTSSnYS3JHDf+hDNYLzTToqMRHv8?=
 =?us-ascii?Q?sa4LfrRKbbnPU7mwaWyw1UhaGCQ+6ur2pCMf5IAU4CrEC3Z6p/6ncPFsqQqc?=
 =?us-ascii?Q?MkcSPlVrEj+fQZRpTp0NfUJwFFtUAYyNKJGacrNgSy46Kgo/7XQovl2qPbD9?=
 =?us-ascii?Q?b+UX+VCgFqLx+R94AHTAn2bxirJL4CMgN8gw/JQ/2HxvhTvkgY49F3T+XhQc?=
 =?us-ascii?Q?9EvtaqPMxh91SMuWlnhEMWUXCW7+WPiXcFF9x59KHlO/aO8LXNDHgtLlMQTi?=
 =?us-ascii?Q?6xEH2fh2PVrQiC6rU2W1/Msjkx12CvDPY03egjOi9W1xp2rSRTqjJlBvYLOA?=
 =?us-ascii?Q?SF9PulvWbmfcVYWIPI+3mx0tRf3ef7RjPNMoDSbhdHQhq3Kl+FfhQfCC+1RG?=
 =?us-ascii?Q?ieJ2h+ipVHMEdUV+cEs5Hrn/t624/TXDU1c7Ddv+zhklN1yHAidEBadBj8Hm?=
 =?us-ascii?Q?3jkJe33Km4Ws6rVFJID68xoC1cTNvXYIID/5vdaZgicEixTWa8tlxVwM1BCc?=
 =?us-ascii?Q?Dgwb7gAJHk0YyC5xdhTuz/CX3pDINroyYoy3JixoT2oHeonCo8FwIQEvM4sx?=
 =?us-ascii?Q?qpGa1NfhNWTAYRQnR8wnsfIIV4vZaafyfLDakR5PueUYTmESfjZ0a80uOthr?=
 =?us-ascii?Q?ggb/cHgM0m9jTotIWf9UYpnWLI1dTUSkkxUNQuxc+jo30Yedrl9oUR2l9g0U?=
 =?us-ascii?Q?U30a+mKcDuzHaWcVYOZdBFJoCKwJf/st1drnJm3yIKgZ3sWmNQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4lmFbysFg0gaFjaoZYde3qFL/8vqmbSRn55d9UcMQxmIG4Gy67vjjpOkXwRy?=
 =?us-ascii?Q?Wo8/ilXeF/3vZ9zbI39402h63AIQ4rEcchrdGIubfmD4wmQdLGJnY+1qUClu?=
 =?us-ascii?Q?Fn67eiOm9FbhCBAbR4FxXyOtN8xGJCHzpeJqUzo/pgbIKcxqot78HB4AbMFL?=
 =?us-ascii?Q?z/AbYOj65O5pWUmkkswE5SSeFgrvhnwEZv1dAKP8joyLcFXuvk1g4oQxGXkd?=
 =?us-ascii?Q?2Xk2AehfqCTYcYjsnB0oEscjQenTrv388KAAFBpxBiZzqIi0BFEvOGWgY30L?=
 =?us-ascii?Q?PNcrZUOtsVQrvgznDwZRR4gi8yijMLNnlOJNANYrmcCej1lQZ69Va/kA/JvO?=
 =?us-ascii?Q?2ZeFNqgZeR9yGstwmUqt0z705qenyWno8qZNdWh/ISukUkx5QWjt6EQUp8DU?=
 =?us-ascii?Q?4J6dCG1G7xAZoYdW77t7Ee8ssdkHlB9cx77x0pAx8BA+g88CXfSOZkjasDPs?=
 =?us-ascii?Q?vQAmp2pxOaJq3rR0L22kMpAnNq2CmGZi+Y2VaWg6IuOWiTYQbHyhjgCUbK+o?=
 =?us-ascii?Q?lCTk94XU5tlsrymdGARPkSOEdIcgFY2A3RlbshxLI/i8vspTxzOddA6dNb/c?=
 =?us-ascii?Q?ZV3djnA5lhThtwjo2BZ+5BP+HF3bo348U8WpdKoC6TB70vQS3qrR+rtiVeRa?=
 =?us-ascii?Q?pc0me2sDiUGz6xclXrQeRpNsUUKA95lHzrSkB6uhuxw0nmKSeGR8eMPD+8vu?=
 =?us-ascii?Q?93ScD7xv3qt+pkonG5Idvn3l1Z6rqt+llQYv6pItOiFK1mCC5BhE5Ng+SjSf?=
 =?us-ascii?Q?fgLMoNxwYpLwiXB6NkoCt82ZD1JuSdBufeZDngORTiTWLMUURi6jhg958Kua?=
 =?us-ascii?Q?LKtdsHSqQBq//g5zcmoKcuag0owknuTF1RI7rmIKOC4kxwvbO4AdeGjj5ixQ?=
 =?us-ascii?Q?mM+ruINJwm2iSk8JW+Cf3hn4531+d25WbDt8AwJVVhTSH7nL+EgCsMuySztk?=
 =?us-ascii?Q?v0epgFIKcRM+QsP1P1B9VoFi6S48eitOuXDhzSHrbODvcQfCO6U4Jm2+KPo9?=
 =?us-ascii?Q?N/IhDsWCg6Qm4kgtvdbSBViDtChiJX07WfViN0fuK6GcIg+so0PjBJ97Rqi7?=
 =?us-ascii?Q?Ns7mRrxQi14XOaDl8A5VFYx21Ju3wBesT4+uCNaFpCzilr+8dczzuLWz39jT?=
 =?us-ascii?Q?sMIlUDA2le4/XlgYwZi7qQtg1AinNiO165ihXhN0JPLU9C8IQ2Fdsad07qnI?=
 =?us-ascii?Q?pmCrpdorG4It65zRwznvYkuacL0aQ4Tf/ybk2jYK5iOguMjmn7m3WZ7stoJp?=
 =?us-ascii?Q?YyT4PpoGMnOBML9dTqFRfdJ1bBgySBpf+k6MpOEgMWpjPlPD//xZHgdqFZga?=
 =?us-ascii?Q?pBEioIVmOMexV/rUUYSUw13GvpAmVkQ1CUUiFK2W6meG+ZSm9dchiDsG7Bfl?=
 =?us-ascii?Q?EoyPiRpHVgL3vgHQmk9A7Asr+f5VkkPpWGrCvOUD5hEWJ509Xgpd2ujQ27/A?=
 =?us-ascii?Q?3xvONU+20ZS3zdowWzfHvdErBGDUTmbEpE1ReCnjMPGISgs+DOX9OFmFIpKh?=
 =?us-ascii?Q?mj5s3btRA6rExi+Y+HUcewQtkpHNCm4rr3r7EeUj6ME1+vGJnioMBrdSKqsQ?=
 =?us-ascii?Q?Zf90GbHCp7EjC5EIcZ91crf8WG4Ol8VImA3vFh4D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7e311d-d70c-4422-85c2-08dcd2e9b673
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 05:14:01.1733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpR90dPgoIQo0IhlYYhImcKKqboO65C9e+p02IXoHpNKqjdzhXZ7BkMPw1dUIGPpnfVlNnQrG5JnLEELF0eAyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8538

On Thu, Sep 12, 2024 at 11:35:51AM +0800, Xu Yang wrote:

usb: chipidea: udc: improve error recovery for ISO transfer

> When a endpoint met errors, the usb controller will firstly assert
> related error bit in status filed of dTD, then ENDPTCOMPLETE will be
> asserted. Finally, USBSTS.UEI will be set.

Look like this information is not related with this patch.

>
> Due to isoc transfers are error-tolerant transfers, we can make isoc
> endpoint a bit error tolerant on device mode too. In case of error,
> it's possilbe to resume the endpoint by reprime the corresponding
> endpoint.

Impove device mode ISO transfer error tolerant by reprime the corresponding
endpont.

>
> When error occurs, this will allow error dTD be deleted from dQH and
> giveback request to user. Then, a reprime/prime operation is executed
> depends on whether dQH is empty or not. If dQH is not empty, reprime
> will be done during dequeue process. If dQH is empty, prime will be
> done when new dTD is linked. In this way, isoc transfer can be recovered
> from a small number of errors.

The recovery steps when error occurs:
- Delete the error dTD from dQH and giveback request to user.
- Do reprime if dQH is not empty.
- Do prime when new dTD is queued if dQH is empty

>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/chipidea/udc.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 0ab57b87b07b..b1a1be6439b6 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -683,6 +683,7 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
>  	unsigned remaining_length;
>  	unsigned actual = hwreq->req.length;
>  	struct ci_hdrc *ci = hwep->ci;
> +	bool is_isoc = hwep->type == USB_ENDPOINT_XFER_ISOC;
>
>  	if (hwreq->req.status != -EALREADY)
>  		return -EINVAL;
> @@ -696,7 +697,7 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
>  			int n = hw_ep_bit(hwep->num, hwep->dir);
>
>  			if (ci->rev == CI_REVISION_24 ||
> -			    ci->rev == CI_REVISION_22)
> +			    ci->rev == CI_REVISION_22 || is_isoc)
>  				if (!hw_read(ci, OP_ENDPTSTAT, BIT(n)))
>  					reprime_dtd(ci, hwep, node);
>  			hwreq->req.status = -EALREADY;
> @@ -707,7 +708,6 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
>  		remaining_length >>= __ffs(TD_TOTAL_BYTES);
>  		actual -= remaining_length;
>
> -		hwreq->req.status = tmptoken & TD_STATUS;
>  		if ((TD_STATUS_HALTED & hwreq->req.status)) {
>  			hwreq->req.status = -EPIPE;
>  			break;
> @@ -715,11 +715,13 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
>  			hwreq->req.status = -EPROTO;
>  			break;
>  		} else if ((TD_STATUS_TR_ERR & hwreq->req.status)) {
> -			hwreq->req.status = -EILSEQ;
> -			break;
> +			if (!is_isoc) {
> +				hwreq->req.status = -EILSEQ;
> +				break;
> +			}
>  		}
>
> -		if (remaining_length) {
> +		if (remaining_length && !is_isoc) {
>  			if (hwep->dir == TX) {
>  				hwreq->req.status = -EPROTO;
>  				break;
> --
> 2.34.1
>

