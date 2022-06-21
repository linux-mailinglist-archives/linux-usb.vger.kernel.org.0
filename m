Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A654F552E32
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jun 2022 11:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348328AbiFUJYm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jun 2022 05:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348291AbiFUJYj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jun 2022 05:24:39 -0400
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2102.outbound.protection.outlook.com [40.107.255.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 508542409C;
        Tue, 21 Jun 2022 02:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icAfp6tB2Utw8GtKeSfjuDay+83WOkW2sepMZXP5vig4UBLsZ7Tl1u0h5uz+tyIp/YbGeq5dAjMSHU3fillINxYHFE9iqtPmHIAmbTMMlVp5Fu7aWOR7NOGKUky8wIaqFlw0+9gw5A0GzbcrInFQpv5g2LQfnblIm8DHRxHFiYHHDGYwtqaTyENzNXuu/dtLFy3BDVcKxabwRde55FRVhAKAP9VsKCQmL9wRjpwWvdgsYt+wAjOjXJ3Xhnzl3/hp8uAFi2AL6gYZzqB+iedx4DeZqfbZ/wk7oYzCfGdiwQ+NuVGlVAkTTeRSEHCVjsIKCzpsu9bVMw60H7E7JCmkbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYvTCDfhG6IaHWTX5yY54qGJelPENRKuKgznNR4ZaHk=;
 b=E4iQP/zJWwqebk+l0GpKO9+en5ot3aSZWmeX2IGGfxHQv3g6Xf7Z+rihWYfTU6jjAtd2ODc4pQ/RugskgrsQ0fDWVeCahEKjfW6JGBqQRy0da/ojFC13tHhOZMg1qDjPcpR+35Klngm3pwF8jDUOiLm/LWgu0HaRReJ79GoEwSZ9VYqZ/W/fLQpy9GVbcISg6y2dc+DYedNRBVqEortZC1V5647UzrN7hgg72SG9IxmfxiMk6LV4+r/1XPtpvIc4d5mmxn5oZzkPcpNTS4A2z0lpHVNLynOjWDZHnZ3CrZlx2Ggr7seE+/mUGxdkfxosXpV5XBMUm07q+yK7lZdHwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYvTCDfhG6IaHWTX5yY54qGJelPENRKuKgznNR4ZaHk=;
 b=P/ip4CI2JuCER7BwrtYYI86lXqwpfv1myUK7fn1TMySs+SKUnASiYGmGLA3uZnTq2u/NIbUxXeNpgbPlEeWOYsesCKpqxTxYj3QDc4lNELVTxD+yqAzoGFYXUMvCUuyYRHZVKJuOK7isAhS36c9I87KQKUNmxwmBIdvfUS/LK5+s3WrCitOXp+cweaWRpsRMafZqBJF3MKVgAZdVee0dGMHaxzT8AkDSGe4Upt687rxSpjebYhN8JC2qX/RnqH1RcnAgyeOV0vGPiSPOQ0VFkh4GeAgVBiVBaFVq70kKed6RyUaDKVbHn+Kb49aPXdKY94xZOkFzX5qIjFeR3EMZeA==
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com (2603:1096:203:87::17)
 by SG2PR06MB2874.apcprd06.prod.outlook.com (2603:1096:4:26::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.17; Tue, 21 Jun
 2022 09:24:30 +0000
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::46d:a7a:f047:e9bf]) by HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::46d:a7a:f047:e9bf%5]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 09:24:30 +0000
From:   Neal Liu <neal_liu@aspeedtech.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH 2/2] usb: gadget: aspeed_udc: unlock on error in
 ast_udc_ep_queue()
Thread-Topic: [PATCH 2/2] usb: gadget: aspeed_udc: unlock on error in
 ast_udc_ep_queue()
Thread-Index: AQHYgvEgbT7tqAEApkSndAaAkFAQpK1ZmuJg
Date:   Tue, 21 Jun 2022 09:24:30 +0000
Message-ID: <HK0PR06MB32026961C00960BE3789D92180B39@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <Yq2SvM2bbrtSd1H9@kili> <Yq2S3aF0MPChLD/e@kili>
In-Reply-To: <Yq2S3aF0MPChLD/e@kili>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4eb89a20-ff2b-48ab-e351-08da5367d870
x-ms-traffictypediagnostic: SG2PR06MB2874:EE_
x-microsoft-antispam-prvs: <SG2PR06MB2874AA49636ED117D8D9F37780B39@SG2PR06MB2874.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4L7uMre1WPEtb7J0xIyeP7l5+/mSflvSMm9yA15XDnuPLXnGwt9PsZnJa97iwlAUkM1JmwYHGaXgrtfXbbCpvN48ofpuIgdYvQpeqhNEBLwEdbRcqj50Hh2EfWHcNZ7kk48gvjJ1XMa8b3NARfDQS6IxSr3UWWRhEK4U6Qtgo/LiuTQZN4XDnsNHEawtexA89IMPny9xXUBf3DfrPz/cJxfhu/PUzaG0L8j7WacbNfkPXBhsNZswX0Q7uMjR9AfblquFzP7KJTuEnDhgziF2XdjaBMRUq+wkKB/2a8cdZuUioyqK3zTz/YeDK5qphkomAOH2dfsBJaGlAhEIVhxUo4+ShKt83EyRKE5WvPKY1CkTiYBtyGtA5pEYi6aV36WmkB8XOCfWyzZJDfQtaJuMvCEBS6+WAtZJYN2PapSAKwGLOXvLML8B3H04em0R7cGGzBXeGDHTxQbzeS72EjnVRrAm978nj9jSR64svMPzI3zbiY4izKjCijpEaJsCDAhpwdvs3UaB16EURRkBFeN3cVAHQpG1QUPJwye03ZJR759LXM3u0XAikSvIyFcy+1L6FP4wPmvAtlX1IEwvlnGSAnV78cmK8yMLano1mZPViIeU5BnmPsiEvUL+LJcLxl+xcv1+GhPMJgoWh02pcpbjz3ep0HeHCxlEoG5DMrv47aOGMpykhOByGeN1JBjzurOsX9ClVrIS0jM2/93DszI6qzv50lkv6HXLHUmuXAK3NtoiuO0tZarwmbgwF0Fg6TV/L5V4sVqWHC5lFQL5BDMx79hHnIADdQUxR+lkOLgLlhQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR06MB3202.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(136003)(366004)(39850400004)(376002)(2906002)(122000001)(5660300002)(4744005)(38070700005)(83380400001)(86362001)(38100700002)(7696005)(26005)(9686003)(6506007)(76116006)(66946007)(66556008)(66446008)(6916009)(186003)(41300700001)(316002)(52536014)(54906003)(8676002)(71200400001)(478600001)(966005)(45080400002)(4326008)(66476007)(64756008)(8936002)(55016003)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2hoj4tFDubrf5m0UbjvHUhIuvHbMSW8vZPpGgb/1Su9OoaGjCubZ2/aYVPs8?=
 =?us-ascii?Q?1hjd5HPlHd7tvnUWdU9+g5FUUvwS07Z8qar2hhE/BY+X0qlzcMKIv5Td5/BO?=
 =?us-ascii?Q?V5oIIwUCnHEpEL7kjaF5CkoCCUcnriV4fzxEzSRzg4hhnAadOIi271UH44pN?=
 =?us-ascii?Q?259UyGQXBQauV2p3IPDWnv2iN6l855Cyx4tyfCWGj3RCeNjdOSD+uplufWgw?=
 =?us-ascii?Q?IN0XcBHy6GYeUll9m9bS6q1bTL60Q/nmkSK4VSPufksWM26G6Gr1F36sUzwG?=
 =?us-ascii?Q?635vASj3LGoggGMKm1jg3eP2XzW9B3iuDRQoSPcpJnyzR3+4ryRucgrQH+3p?=
 =?us-ascii?Q?pAjDtYVQl5p8aQH9Lz0q9sUaoItyZlWDiRvLeXTGN5QLKrljHpfdJC4/0W1k?=
 =?us-ascii?Q?Z7XPvQAiV5a2NAqKhy4Y3Y2koazxMpcHSjO9uLfxn2rUoVDRGUvhQlHAEj1B?=
 =?us-ascii?Q?Xa5l+MtdNJ/DiI6Xzec9mC/z3ah+mrrAjZpDg/Dr+W3lRk1PU47rIhbMc9Ef?=
 =?us-ascii?Q?aeXKVaDZVmI1+2BUXcwzYtKDD9DzOitSnoXkkC6eTksKh86BzE1Ls/+RCgX0?=
 =?us-ascii?Q?RB6hoKdmp3TnfsiZeDdPBVKTDIITWQnIfPuxYfGWLYIPoZ3LwtZ942ctFiiu?=
 =?us-ascii?Q?Z+pVc0Y76resCDhipXFI53N4S3EzqcDwW242ky9MbyaSCMFVptsTVvwkKYB0?=
 =?us-ascii?Q?iggbqj8jjmcxs6e7YxxsUjIbKuoEeeXRtsMkU2QFX4gesxf/JUp/qQ8AAnWJ?=
 =?us-ascii?Q?2nUvixQoim4fgW5AnnAMGdVxaoAyCfu8GurkLcNJ86DOIdzmGyaB49a3shLv?=
 =?us-ascii?Q?IDZJ6IBw8cEfQZWEQ/SvNE6VBJH0+y8E8LvFAk8PpeuzrK/b4FUyP1kdz48J?=
 =?us-ascii?Q?Fe6/cwYZCvr+3vdmpU8757DGLpgEGAUIMi8DL0jKTDHpR0tYAkqeIvzjAxgu?=
 =?us-ascii?Q?/TOk4UACTHpZIMMqgD55uBZHmGa+N9pC92AXQ/tntcP1VoNoBoQHDOeW3oFy?=
 =?us-ascii?Q?3nxFhXUVFlU/4GpzeUcDunamHZYhFWTyhKtJHr4DlLXqrSxTv50EuOfSwbiF?=
 =?us-ascii?Q?tRmtjuGU3K2GqgPRx5yBRE/wmMfppf4S1rCFmAlASJ51ftbDoatlN7hqkKHD?=
 =?us-ascii?Q?ZSSU9KGBIarlZN7p6g399g9DunrujAfJr0VQVWmllvQ0fXrZWhm7c1O+kcEZ?=
 =?us-ascii?Q?uOprktZxOcxdmIRwidXLG+z8qZOYCrVx5Ky3wQ2T6iXcI2XF5BJokYbZzgJT?=
 =?us-ascii?Q?AlGKdBmTnTAu0t9f4WuPZX+g6I8gGfB9ri2Fkc+2GCKm5CLfGj8wWjNs1sSa?=
 =?us-ascii?Q?K9nb1tevVR/szNgalDUSGD7D7iqleeD0pNGJeeUA0kj6EEdYQuzJo6kFGO8g?=
 =?us-ascii?Q?n2GGK0VX8+QAxOQL09qcLRWQbA5Xt+5I9Olyo+++PLnWG4zdsYpfTei4Y9ZY?=
 =?us-ascii?Q?fE0CtZ95EbP87srAKnL19FYXMk3fFbHl6WAqciX2h377O6fJLesWxwGqoeIK?=
 =?us-ascii?Q?E7nXTxiJpTbKOwpPpbSH/jxtAYRYhrcFRslkVf09PT+WnfcyHx0d1TtmSH1+?=
 =?us-ascii?Q?wVEHAA1QrudZBl+U9oQYBWTopfrvDtxdUsc7I2UlhnJmA54OPzN0Io6LOkUb?=
 =?us-ascii?Q?fJXsnuTptb7+ugWAKC8oTgqSS2X3jnFL+s1w1GqAdgyIuM8HncBFmIJ8VdsY?=
 =?us-ascii?Q?/Ph/fcdivlo9NkGkldZ+fsNgS+sHFELaREaxGDsj04NMbVrrapIGhUWqB3aD?=
 =?us-ascii?Q?nU0mi0GpYg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3202.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb89a20-ff2b-48ab-e351-08da5367d870
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2022 09:24:30.3891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c3yxvb7mz+u8DWXnkixQMEOmncq4s5dpvhhtTVFXtkftuLrW0i402hFt4MbpSi+lKPRq56u0x6DTa2wen9cXGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2874
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Call spin_unlock_irqrestore(&udc->lock, flags); before returning an error=
 code.
>=20
> Fixes: 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/usb/gadget/udc/aspeed_udc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/gadget/udc/aspeed_udc.c
> b/drivers/usb/gadget/udc/aspeed_udc.c
> index 77376ae04224..4dead40895dd 100644
> --- a/drivers/usb/gadget/udc/aspeed_udc.c
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> @@ -663,7 +663,8 @@ static int ast_udc_ep_queue(struct usb_ep *_ep, struc=
t
> usb_request *_req,
>  	if (ep->ep.desc =3D=3D NULL) {
>  		if ((req->req.dma % 4) !=3D 0) {
>  			dev_warn(dev, "EP0 req dma alignment error\n");
> -			return -ESHUTDOWN;
> +			rc =3D -ESHUTDOWN;
> +			goto end;
>  		}

One step late, thanks for the patch anyway.
https://lore.kernel.org/lkml/HK0PR06MB3202958ED74CD706458B85CE80AF9@HK0PR06=
MB3202.apcprd06.prod.outlook.com/

>=20
>  		ast_udc_ep0_queue(ep, req);
> --
> 2.35.1

