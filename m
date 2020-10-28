Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFD829E1F4
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 03:05:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727954AbgJ2CEt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Oct 2020 22:04:49 -0400
Received: from mail-am6eur05on2042.outbound.protection.outlook.com ([40.107.22.42]:24901
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727036AbgJ1Vso (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Oct 2020 17:48:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOglPgfhn2/GEggjysz4cqkfzN1fa8wGXSRYW8pW9S9T7j9obHmhAV1Mv2wUammg5ZUA2OPm5fls/KPWexoE08NhMfkXdXsWg2WX9glRBXDa72xXzPcD3Xy7j2hw2YQ6OEDI83Z5hvDQPwurtuNXVvyJmNjkegpZrPZdWwCGa73EQZ3vjHA0XjCscCYoqp6TnpGGLlel+jf+Ok5LLfFV+/bKZxB6u0ywR/3Ra/lhAce6ts5P5xS9uRdvSIhZoiS7A4h2hXEiBE/EQLU4hSQRujdBqlgwzjx8MQ6UG27glnxAZK7F5vpTnPkwI2Um/zucURSyQg26wwCXuhvh8lFp5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inqSQJRlJxkNKJwYrr17Pt9m9+IuDSQmQ+cwEF4YTRM=;
 b=bhC5iInmQ4HFEil2CxJFOVSR97Qq9rVAju09QXpZBISh7+faCI1TGxLCjIMX1rVkmnTEDbN9MU4YVCCmaaHpgI6/heSss0MtKrpdTjPLBkoydJJU9oOR+En2RbN26OfQMOhb3OLE17XugePcuKamtYr/vnjzW/yzJOpvxuXLqhgaKkrBpnhlS/YnRiRD3yfq7QE1Aq67bGyUrso8RJybpmtXRR1XghBrXNaoDoA00FNuvdSwIjm5oioTDybROruk5MdMg3zovr1zaXYA/0rHGNZvSG7H/7tdrQ/Ec0n8Mx4USWBRGH6m5Edpxb/AN6VJikPo8hQt9Am18K61EEBnuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inqSQJRlJxkNKJwYrr17Pt9m9+IuDSQmQ+cwEF4YTRM=;
 b=h3XPMyC5HjjbH82WNTA1YXYBHxeVU194BJCQPe4NREZ4F5SzQywa1DrKQbzPkgKq9tLS0+Dt0PxpH3rxGpQqD5VeKr5diYqgpmVnnA5WC7axgjyUFgCEoYm7olXhhXzIqqIuSD5tRkD2iIWZeL2uFPEr5PII0JBNG0K5m114Uws=
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB4420.eurprd04.prod.outlook.com (2603:10a6:208:72::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 28 Oct
 2020 07:15:31 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 07:15:31 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jack Pham <jackp@codeaurora.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH] usb: gadget: audio: Free requests only after callback
Thread-Topic: [PATCH] usb: gadget: audio: Free requests only after callback
Thread-Index: AQHWrMsQ48VJ2Jl0c0KvVAXUGskheamsmoWA
Date:   Wed, 28 Oct 2020 07:15:31 +0000
Message-ID: <20201028071503.GA21171@b29397-desktop>
References: <20201027233138.13712-1-jackp@codeaurora.org>
In-Reply-To: <20201027233138.13712-1-jackp@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 27344058-88e9-49b1-fe59-08d87b1141a1
x-ms-traffictypediagnostic: AM0PR04MB4420:
x-microsoft-antispam-prvs: <AM0PR04MB4420DEA064AC1803923448C28B170@AM0PR04MB4420.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wrcifJJBXdoxenZnv4z9H3HCHF0eJGbA1KBTv6tEDFLnTng+BgVhZiBqRZeSzT6sAc228j3WtzYoLBRAfL4QgBzSqsV1B2L4HkMw+8PSryeOEp6fHakuus30g3VDFhLe8uxcimdWjYWotRada+j8fAfQ0TxTqiX4tdTKd08WFk5dCv/RhmfADgA2DS6zKtMT5Q97DvA/qB4KbAb3Vu/+piaGpAYcNecNnMFX5p56vlMEEdqJvvTFCvQ2FXIKXMhema52QBB36H7KdeXUDbvZSBXl27Ts0d8HGAt1scJJELfODmgPtqO7wcYCk9HmAvMau5Xjm2JQOFmUwM47MFHixA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(478600001)(91956017)(8676002)(83380400001)(76116006)(2906002)(66446008)(64756008)(66556008)(66476007)(66946007)(33656002)(9686003)(6512007)(5660300002)(8936002)(6916009)(4326008)(6506007)(53546011)(1076003)(86362001)(186003)(26005)(71200400001)(33716001)(316002)(44832011)(54906003)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: BS7w/kUR/N5JfYMdXhVgvZADMhthgq2Q+m+dBFJJnwkT/SYOPsMQ/7SB9CPp/pozT8aSBGw7rmmwJB8womTjLandTdeGtVGCUCGu6hBGbaW5eZ3G6tprtGuQFm7+Sd2EfAYNHlHs74Yiswhcol//YrALGoKnMkkKnPoFrcwTOxKde/rZiiGcpEJSxYY72S6ShlhqWvLsgOHsYKirLdBkHlKJ/n9/fyl6z641/BuxCjzZleZp2mHiV/OPpBeUsrzcM4USL+EFbTgqtWJYYAOr+BRNF9wo4Jz30+y4oFTJFy0p7DEODWEr7rt4B93ucI9B4A14Y6FVhUYXNgqmLNDbNQ8AsE4oXIiXUX2/CP/QtQYW+3LuKIWTDhNsPh1DzkjOmwxKdEmAcynMiSZOmEmj1Bm8xH7TwOaVPB/DethtUM9nR1H0o7iYuflidHD18Bb4LhO0DfNS1CvVYAWQvROLVrn+P+qGAMqGTQb/QuxYi1IgFeLSSrTz65cNIw13XHSeIe5/oU2JfuBc3tPkNzwyC8ghFreUCe1WNbLjvOGqjyr06S7qXCuBeeZGOUaWC2afBRKocr6PcFwNxJzJLd1iFYXq3tZkfH7XTq+A3v9QLHCnxwRIcsNJNhbfNk8nSOePsdionIGCKxF872/IDRn+FQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9DAFE148D57952468C6BA629B694A708@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27344058-88e9-49b1-fe59-08d87b1141a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 07:15:31.7805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pknm1T6LiL1siKThVtNJ4auUOD4f8TaxeAdgjXQl56fB81GareyXtc8F2SmTKVW4I99bTR8Sxh0Z3+jFPdXEow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4420
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-10-27 16:31:38, Jack Pham wrote:
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
>  drivers/usb/gadget/function/u_audio.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/f=
unction/u_audio.c
> index e6d32c536781..a3b557fad1fd 100644
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
> @@ -337,7 +342,6 @@ static inline void free_ep(struct uac_rtd_params *prm=
, struct usb_ep *ep)
>  	for (i =3D 0; i < params->req_number; i++) {
>  		if (prm->ureq[i].req) {
>  			usb_ep_dequeue(ep, prm->ureq[i].req);
> -			usb_ep_free_request(ep, prm->ureq[i].req);

Then, for normal base, eg, there is no pending request before calling
free_ep, then, where these uac request will be freed?

--=20

Thanks,
Peter Chen=
