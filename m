Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72DB055423E
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jun 2022 07:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356915AbiFVFZh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jun 2022 01:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239573AbiFVFZh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jun 2022 01:25:37 -0400
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2101.outbound.protection.outlook.com [40.107.255.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DFDC3617C;
        Tue, 21 Jun 2022 22:25:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LrzXci8PKU7/mSUVEJIBu+rPX0Ij2x/V9T7KaaUGhBuFSNiM7HQKXIqFFKmZLB2KsFxsXY65LPlNVuqO5zal43sM/PJm4Q4eIqfek8498XuMNq/t/X9HXHIvH80SZb+4PRvUw85zbeGYqlJ6YKRZmli00/iTjj+zIJzqmwTuzP2+ilGJAVizAj1zPuQwO/XHkdsq/mI0cvJEsVw2Aros2dGiwamcIWgqPUpk5MKKTmlKP2cDirxMwrsJufhwxwoGZtW20zrB2hgAGMIKi9RMwVPlO9rcmigV7knM9vVlnR0zWy/oxAfTRF4kSJmLxaXyy5tap9KgW2ZOYX5r+qxqhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=co0dOGtNGwuO8p6wuHQk/yddvvAIwS6eEpOWNXNQ7hs=;
 b=Rj2U0sTK+XPsAOBD2Evz0D06EpETQnASr0inJSRnS3Kd2PXliyAfY/d3r9meFE/3EGebHZ3kGBcwkkhkVOOpvFclMfjmsrTCfbGCxtyDF6mPL6a7KdUIZTS56GR3RRemHLxqx18ze10YMa9hk4/TYmAPFsNamFqpUt9fPpUxeMC0YG8gZqitXbuj26o53YgShzWTapIxNqbzD2I6aAhx5jxZOoZoKEzw66mCu7sR0Bv48S6hgomox8nAcC9tvz/ay5R2Q5tk+o/CmFn6Mn/p0Uj94YWR7WA9Gn3/cn1ibGxjkgCX91reZcsMADSYJ3uLTuOjhrGbvL1ztYfl6EEWVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=co0dOGtNGwuO8p6wuHQk/yddvvAIwS6eEpOWNXNQ7hs=;
 b=zg43mMJYsYN+PTRjacdWpmKauQeJsCQNke99E+ujePr9KA/dspp4Ei/EqUolpM/YV/33I0L4smxervQ8wx4+45PrGw3iuaMWCz1BUxPLE8KYr4O786VDiIQiRPSKj+ZOSmdgQjMDFXQvJEq7T8li2zMd54VckagJ29GVT2T5Y14kz8bYa+TvgCb/ATwKZPGfRsn7MoGZu+G16EdzLl/5GF/qqROkH7bYJwSyIE4YDlvRB6PkbZt6lvFOQd/GTIDwBBwAkf833IUQQcSPFPQota1BL2+uK8vTeNOHjkqA0tdmU0XLOkr4dm58D+/FCyhn62Hq7PdFeiFicIckrVViLA==
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com (2603:1096:203:87::17)
 by SG2PR06MB2968.apcprd06.prod.outlook.com (2603:1096:4:77::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Wed, 22 Jun
 2022 05:25:21 +0000
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::46d:a7a:f047:e9bf]) by HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::46d:a7a:f047:e9bf%5]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 05:25:20 +0000
From:   Neal Liu <neal_liu@aspeedtech.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH 1/2] usb: gadget: aspeed_udc: cleanup loop in
 ast_dma_descriptor_setup()
Thread-Topic: [PATCH 1/2] usb: gadget: aspeed_udc: cleanup loop in
 ast_dma_descriptor_setup()
Thread-Index: AQHYgvEPzKxWRM9gzUqjPBsYNjc+I61a6mpQ
Date:   Wed, 22 Jun 2022 05:25:20 +0000
Message-ID: <HK0PR06MB3202376E1119C0CF1658656580B29@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <Yq2SvM2bbrtSd1H9@kili>
In-Reply-To: <Yq2SvM2bbrtSd1H9@kili>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b670ff3-7c7e-4ab0-fe75-08da540f99ba
x-ms-traffictypediagnostic: SG2PR06MB2968:EE_
x-microsoft-antispam-prvs: <SG2PR06MB2968D3562D4D41860299EE8680B29@SG2PR06MB2968.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RSpVSEdCscW6r8HxGhkbzMidKH++b3zp6/IJvViemEOsw88UcG2sn9iQzYN7XYXNchBG42OTPFY9RhPbh4Ztcf0G16OEeYUNR9V2xelTAKWTnSJCj7SMBG1IhIVwrHdDZ3CoWQvqkLjmcUXkpWKzlfuAHhcBgV7Q5qQUe/RGXr8iyceb5oya/3zjq7QQJFJnXFyGV8B0eIop7Nd6C0wAol1cUOz0nI9zc5AnPnpnbqPDfCUpuWSkQgzz5kr2yH7AqNH7tQUiQn3hXLNMoY0BdJ3SNB9MnmClxVUi3o/uO/hNpvHuBbAF+OkoPlzJf+3zpTzlHA/q/wfeE87zzRfj4lck8p2AuLG6BI0y3ZGsrJ87U4mAEONOiAmtF8TslFumLMPKW74Tf8XkgVUSl00UBx8Ga8YZHbTzJL4cGKTCFjuRq/fMVwINAj1/InVOhsDpmavgUCLXURhLTd1hk8z5eey+HEU8MdgrUisXiLqYFU3BIFHL2KYpjA+n6bwAgarRQEvtdfBZBRGaagGGUcgqpd2htm3QXH0L+xqHEufFwr9DZT+CxSA3Kwu/MLjKsiUF2g77AWXPrDWwf+2gPAq3+M+nZKXhXFvRNBIL2dUYmYTT4G5yxhQSK8p9lPOQe7JSxfOPM/rFJWHqIKBBHKtFsssqN6xnZElcyZCm7KFpIvzdIFNlyYN5szkZZbCZkHDr43cB0BJOATtXEj5nzmzzCQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR06MB3202.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39850400004)(376002)(136003)(396003)(346002)(8676002)(7696005)(64756008)(54906003)(33656002)(41300700001)(186003)(26005)(66476007)(6916009)(71200400001)(38100700002)(316002)(478600001)(52536014)(122000001)(83380400001)(38070700005)(8936002)(66946007)(86362001)(76116006)(55016003)(5660300002)(6506007)(66446008)(4326008)(9686003)(66556008)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KqviFEuWYu4u+4uQuie19T0eTfox0fw/oybCWKOYndUcj/yWPah08uaIdWyB?=
 =?us-ascii?Q?8yjscKKGcfQSSEJ8ff9GUCtCkiysuJQGxo3o3++D42IfRaIWXjHafpI2NVXO?=
 =?us-ascii?Q?RXRXNDmHOgFxcDmYZtNWpNOY95JmE7WMN26G2/G9wvKJSs/AGfPgncQejU3H?=
 =?us-ascii?Q?HEmUidVRjo4IoPsHQ8WmIvbJ3tcphoC4Qb/auu2RSZn16RpBM1Fr2jIAiENh?=
 =?us-ascii?Q?8GtqyKetZWN56AQ1eyHUjQkoWd6XpLZGzkSIP8gRfOjUeYYdecMhABrXpybk?=
 =?us-ascii?Q?7HPCXResuqs/Pb8a+8XUbAyVGkayLnNwYhs2RTytJZoTeYbjlmK1REll8mFn?=
 =?us-ascii?Q?K7eVU62PXvNfNfLWD1lwFb/VyEV8QhgamdVZ6jb7aHcfvHmyexDiOtdj9rJE?=
 =?us-ascii?Q?SWCDuTZAAxNVNhF5ILUPgvKH6WIn9Sm6otyTnAdGJh3EoLAExIl726tCPuqC?=
 =?us-ascii?Q?iTqK19Yw4s8W37jYUtc7pgUUHs+UE5tQSHGKlpD+24tLMLmu/uyQxMw8jKo7?=
 =?us-ascii?Q?7Utt2em/CP4d+jgbH+Wx5Wk5P/k9xsri0DUpqfAb0Edue8ay7W+bMu47qnr/?=
 =?us-ascii?Q?fJVrH/LqN4rMxe+ek88shbtt4KAj9L98BQYk7BEKUvn8H9HKGCU4/9TNedOX?=
 =?us-ascii?Q?+OxeT0DcJKElCcRnP2CTZ2/cqQW5YXU0JVysGTqRsn2gsQjrNCAcjcfUWqat?=
 =?us-ascii?Q?9Gs3mc/o8x/itjeuW1Lb1oUBj8qLsaULYanTojXS6QVuY584ZeInLQUL2n57?=
 =?us-ascii?Q?J038IovdlTUXtvn44LrJFlMAq/Hywi0qfcLOqw/tJsZlFtKABe/5TR0wn3E+?=
 =?us-ascii?Q?R/G2Qa7XR4kayQ705kqBxxATzWqbJd+XVb8rvjyBbgv6Wrp63570JmyGK8E0?=
 =?us-ascii?Q?4a5Au++0w+D42eVh60n8w70alsFguw7KZ7F/Y2wCLCPz89kMA+kob7IU0Wzd?=
 =?us-ascii?Q?X0OKqPx0o+fqhCnib7iFY7LBED1+41a7y1q+VpU5DbQqXkVsKMFlI2kI/48F?=
 =?us-ascii?Q?nOJHyvPTfh+MRiFIsCah9dnCnPsrmIY8KUUYYZ1PjD+L3qmHALEhqRsQ+CEd?=
 =?us-ascii?Q?Ev+rm+xDsqnh9wbRUmbSC6y+HUtchE3soCZx/COCmuDJTuTfY36sRddespth?=
 =?us-ascii?Q?ALXRL2sKtTwsB11A6qNE1p4Uz9QNWJowf/ffB5esO8/rSeCTvc1eKzfHT3Qb?=
 =?us-ascii?Q?NcaELn8ahoNj7v1Uxd9n3nPME6nyZtYXGP3FaEnjW9AK9Ss0n/FCuh7CdM90?=
 =?us-ascii?Q?OtPOMXOE+GyzN7D+26Au3/ym1OXMqLaU0w1XufpsuaFdkBb6Kv0ukOoMEfOP?=
 =?us-ascii?Q?KKabbcK8Z6DTxKs6NVSjhMlgKbMzR/G1wWTux+Z9gTfJHwy1VYoMXDsFoXPN?=
 =?us-ascii?Q?ysPAxoqnto9s+JmF2+j+msxZpA75sfkJBklrrJkwZpsHv+mqZNyE9g4oa57i?=
 =?us-ascii?Q?Dn/p6t4xmT1MuZr9REW4Bl0ug763/kpmfl3PZjbdixgQIJHIcz7pbs23wnAt?=
 =?us-ascii?Q?NRLQL63DOSLIHKJ1isHM8wLMQF1YqXB5Tm7IQGt6Dvkc7kQcpx3QXZVF9R2O?=
 =?us-ascii?Q?0mLAm2sf1GKsQu3ibV3bs0QKLoyio4v4UByLT5dYUu07dpbYHO24paCuUg4v?=
 =?us-ascii?Q?7IYMfU0U/tNACwQFhqs5T1WY6NVN1L4d+cGlG2I1xDoCEtsWEEZ+zGrUaOoQ?=
 =?us-ascii?Q?RS4YHwn8Wi5n3GmQ+ZeFyLlwJpEMVqGKYregtLKKKaIlxQidP7f4IO/XcatB?=
 =?us-ascii?Q?gTwsOnfCsQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3202.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b670ff3-7c7e-4ab0-fe75-08da540f99ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2022 05:25:20.6133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iPnjxnpycQtg52U5S+Qg+MlXM77rrZSSM1FYmTPewtWKdZLFv56rWP88nQgS8qtnA9XKupqMxe9syuZHegrLng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2968
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> The "chunk >=3D 0" condition does not work because count is a u32.
> Also, really we shouldn't enter the loop when "chunk" is zero.
>=20
> Once that condition is fixed then there is no need for the "last"
> variable.  I reversed the "if (chunk <=3D ep->chunk_max)" as well.
> The new loop is much simpler.
>=20
> Fixes: 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/usb/gadget/udc/aspeed_udc.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/udc/aspeed_udc.c
> b/drivers/usb/gadget/udc/aspeed_udc.c
> index 1fc15228ff15..77376ae04224 100644
> --- a/drivers/usb/gadget/udc/aspeed_udc.c
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> @@ -476,8 +476,8 @@ static int ast_dma_descriptor_setup(struct ast_udc_ep
> *ep, u32 dma_buf,  {
>  	struct ast_udc_dev *udc =3D ep->udc;
>  	struct device *dev =3D &udc->pdev->dev;
> -	u32 offset, chunk;
> -	int count, last;
> +	int chunk, count;
> +	u32 offset;
>=20
>  	if (!ep->descs) {
>  		dev_warn(dev, "%s: Empty DMA descs list failure\n", @@ -486,30
> +486,28 @@ static int ast_dma_descriptor_setup(struct ast_udc_ep *ep, u32
> dma_buf,
>  	}
>=20
>  	chunk =3D tx_len;
> -	offset =3D count =3D last =3D 0;
> +	offset =3D count =3D 0;
>=20
>  	EP_DBG(ep, "req @%p, %s:%d, %s:0x%x, %s:0x%x\n", req,
>  	       "wptr", ep->descs_wptr, "dma_buf", dma_buf,
>  	       "tx_len", tx_len);
>=20
>  	/* Create Descriptor Lists */
> -	while (chunk >=3D 0 && !last && count < AST_UDC_DESCS_COUNT) {
> +	while (chunk > 0 && count < AST_UDC_DESCS_COUNT) {
>=20

Simpler loop looks good to me. But short packet need to be considered also.=
 (chunk =3D=3D 0)

>  		ep->descs[ep->descs_wptr].des_0 =3D dma_buf + offset;
>=20
> -		if (chunk <=3D ep->chunk_max) {
> -			ep->descs[ep->descs_wptr].des_1 =3D chunk;
> -			last =3D 1;
> -		} else {
> +		if (chunk > ep->chunk_max)
>  			ep->descs[ep->descs_wptr].des_1 =3D ep->chunk_max;
> -			chunk -=3D ep->chunk_max;
> -		}
> +		else
> +			ep->descs[ep->descs_wptr].des_1 =3D chunk;
> +
> +		chunk -=3D ep->chunk_max;
>=20
> -		EP_DBG(ep, "descs[%d]: 0x%x 0x%x, last:%d\n",
> +		EP_DBG(ep, "descs[%d]: 0x%x 0x%x\n",
>  		       ep->descs_wptr,
>  		       ep->descs[ep->descs_wptr].des_0,
> -		       ep->descs[ep->descs_wptr].des_1,
> -		       last);
> +		       ep->descs[ep->descs_wptr].des_1);
>=20
>  		if (count =3D=3D 0)
>  			req->saved_dma_wptr =3D ep->descs_wptr;
> --
> 2.35.1

