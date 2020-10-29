Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3583729E656
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 09:24:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbgJ2IY6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 04:24:58 -0400
Received: from mail-eopbgr150083.outbound.protection.outlook.com ([40.107.15.83]:8623
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727146AbgJ2IY5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Oct 2020 04:24:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRHCpHCePSRjBKWH94MBKRIRoajfbA901GqzJntcNb+5wM9Wtk64U/Hkk6YN6E2ew6OoYh2ZqoGoaxOlvs7TVkBQXpAgEsv+Yac8buUqsI1JiLG0+C6RtKMUjfdeYtfiI/v6uEPV27I174+ZoJZMPv6rl9r5SeFoIbp/ljMkNUNnxYA5OUhweXYytQYZncPnGT4yJqQ8WTYhqCsEBZhcEg6JNHd5OqUYgtr5pcHCJGmivw7wXSdU0ghYPYrTyZCkTu/27+zpg1nZBRaSMueDB+01kDbsuSxXIoUZy4aA8eC44ASYxQ4F4N/9dnDCXZ/HGhAaFOJ8zUdMQ2DcZb4inw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEC4PGfPr9iPslQVSbmW6Z5kWj+Jny/NSrghNm9rEr4=;
 b=DfFJ18hpyD9p7SlDOTXKYhXnKXH91KoSMOUbcS71jAOI6Hp4f3yxgsMIFkkS/thoZ+klC0Cngmz5bzOxE4QTBOzKf44h1Rge3Fg04K6/1JjIIiNT5d5EyTerCUKZsFZo8EEccXJ/7KatV0vyv5FVkB8pFF9J70aq+RdlzkRCBYdSW7I1uhkwz/mRFl30NDBMf1Xdo/uvclalA+ecu3mMBuux0MPRFYWs2cTWowxRvXq+zpHgnZPvSCcjhEMLXtzZpxFoyFKWoGE+DTxfW6p2HVcupaW95w6Z3gkD+cUvidwtUUq2HJNwMYsr5UMUkFwDor5TiDVQcwOBJiNYEPJzrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEC4PGfPr9iPslQVSbmW6Z5kWj+Jny/NSrghNm9rEr4=;
 b=K2EmD9zHHofLTPaJbd2V9ilBj4jtUxcOUbvslor5IWUPQznSY4cBCLt81yz7BnkZWKXdk9PhGC0dNdlEEb4Ceoy/RKDlgoKxy1YlAAMQhY0zmmoastTgPxak1pMEssc2E66BK1YlIMHpsGBLCZ3rBWX5VQrYHZhAhylIHlhGkPo=
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB5443.eurprd04.prod.outlook.com (2603:10a6:208:119::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 29 Oct
 2020 08:24:52 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3499.027; Thu, 29 Oct 2020
 08:24:52 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jack Pham <jackp@codeaurora.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v2] usb: gadget: audio: Free requests only after callback
Thread-Topic: [PATCH v2] usb: gadget: audio: Free requests only after callback
Thread-Index: AQHWrbvRMya5juDvzkGW04+TP7BL+6muPlkA
Date:   Thu, 29 Oct 2020 08:24:52 +0000
Message-ID: <20201029082424.GA30677@b29397-desktop>
References: <20201029062144.3574-1-jackp@codeaurora.org>
In-Reply-To: <20201029062144.3574-1-jackp@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7454bfe2-8d56-40a9-ee96-08d87be41c14
x-ms-traffictypediagnostic: AM0PR04MB5443:
x-microsoft-antispam-prvs: <AM0PR04MB54439F3F7FFCFFAEAFF452B08B140@AM0PR04MB5443.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: evUDQqRN86xoInc4OQKBXwtYLOP8wnopCYcQiPLnC4pSi6259hlAHwRnP+gugrWNwudsbMW5fjfy9uUi9Qs3UGRWI3pJq+cWGAn9jsy++vkkiNnWBl3XKdSPcO+3jZSTfNCxgSnNfLMUZNayc6rTFwWGunTABsT89VMkMvyNoPX9q3uhgaqKSkbNFUkK5pk4amS6ErmlVPSoAbvfINQug2Uq9E+izl9JaTdzlxJW6GRE6ZZt87c02E6aSTkpxiJbZUNNgKIXfUxhA1WTIRBYKs6YyC4/Un/haqJrHbrF5lzqhv2P3YUTELLw0RewpcMMz/q3X7aBFd2oMyuggPnibQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(136003)(39840400004)(366004)(376002)(396003)(64756008)(66556008)(2906002)(1076003)(6916009)(4326008)(66476007)(9686003)(8676002)(33656002)(478600001)(66946007)(44832011)(6512007)(5660300002)(26005)(91956017)(76116006)(66446008)(33716001)(53546011)(54906003)(6506007)(86362001)(71200400001)(83380400001)(8936002)(316002)(6486002)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: sqvYQVKXrii5IxFAOyRxPxhq+r8mu8TlMiT7Da3RWMol4x6bhwZR2+DQcWyfQKKCQAlR7b+rR4q4Yc0LRDJuGdkpOc6kd9aBnz6rlJuJ+d/e1EFHbEn6zMa2fOaQXADznPPrahGwfU+rO8ZHrwgEaUcTpluexl49ethptyGTMFi2BrKnNpqhibY+18H4PcIaA4sYjosUcKJYGAh8owGZzs13S8urlEx7QkNupTYrHJDLnOg627cjAjn5Ej1ya0CaogrUQ/IKs2IefW7nlmjkZclrnkUDzR8bOBY0L7D6et19G3jai5dQ0qIeyaMX89Cy4/wlac04LhogfkRUFMDxb+TMHOweXoS26/OANk60DGWzyeB0nnuHAWGQaeZbVT9J3rtXYd4cdqvSeMBI4WcpdGBomozuP++MjkCfiIGCXt25G66HkVaok9dW64jEpilbq0ZsVU0m+eZg2gFf6267VxduqJ+acJY8clGZHEeDQhHZwph/Av/AvFVRR4tGR7bZmsBEoKElAW6XUzeDyA1cqbZ7KmAA8bTmmIlf4cacZue3gkBC2cgDoXkxZTifpfI6s0r3cQjKuknzbKcnPSPoBfE9u0ERxoZeM8OAVAShEQ2Dkn3Ku/Z3Y0/L7ey4Jzp/8ot71+I8V3tqLZ4OdyMd+A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2610712B8E9F1F45AA7697E7D7CA50AC@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7454bfe2-8d56-40a9-ee96-08d87be41c14
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 08:24:52.6221
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ncYftCQIOV6gWnq9uXWC1GS43K9a5kV1zWFeYRzJz2+p3CL3mKXOr6cq5jYCpUuCCUsDunKYFpUlU18Mkp7Syw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5443
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-10-28 23:21:44, Jack Pham wrote:
> As per the kernel doc for usb_ep_dequeue(), it states that "this
> routine is asynchronous, that is, it may return before the completion
> routine runs". And indeed since v5.0 the dwc3 gadget driver updated
> its behavior to place dequeued requests on to a cancelled list to be
> given back later after the endpoint is stopped.
>=20
> The free_ep() was incorrectly assuming that a request was ready to
> be freed after calling dequeue which results in a use-after-free
> in dwc3 when it traverses its cancelled list. Fix this by moving
> the usb_ep_free_request() call to the callback itself in case the
> ep is disabled.
>=20
> Fixes: eb9fecb9e69b0 ("usb: gadget: f_uac2: split out audio core")
> Reported-and-tested-by: Ferry Toth <fntoth@gmail.com>
> Signed-off-by: Jack Pham <jackp@codeaurora.org>
> ---
> v2: call free_request() in case of ep_dequeue() failure
>=20
>  drivers/usb/gadget/function/u_audio.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/f=
unction/u_audio.c
> index e6d32c536781..6e69ccf02c95 100644
> --- a/drivers/usb/gadget/function/u_audio.c
> +++ b/drivers/usb/gadget/function/u_audio.c
> @@ -89,7 +89,12 @@ static void u_audio_iso_complete(struct usb_ep *ep, st=
ruct usb_request *req)
>  	struct snd_uac_chip *uac =3D prm->uac;
> =20
>  	/* i/f shutting down */
> -	if (!prm->ep_enabled || req->status =3D=3D -ESHUTDOWN)
> +	if (!prm->ep_enabled) {
> +		usb_ep_free_request(ep, req);
> +		return;
> +	}
> +
> +	if (req->status =3D=3D -ESHUTDOWN)
>  		return;
> =20
>  	/*
> @@ -336,8 +341,9 @@ static inline void free_ep(struct uac_rtd_params *prm=
, struct usb_ep *ep)
> =20
>  	for (i =3D 0; i < params->req_number; i++) {
>  		if (prm->ureq[i].req) {
> -			usb_ep_dequeue(ep, prm->ureq[i].req);
> -			usb_ep_free_request(ep, prm->ureq[i].req);
> +			if (usb_ep_dequeue(ep, prm->ureq[i].req))
> +				usb_ep_free_request(ep, req);

There is a build error for "req", otherwise:

Reviewed-and-tested-by: Peter Chen <peter.chen@nxp.com>

> +			/* else will be freed in u_audio_iso_complete() */
>  			prm->ureq[i].req =3D NULL;
>  		}
>  	}
> --=20
> 2.24.0
>=20

--=20

Thanks,
Peter Chen=
