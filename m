Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E101112346
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2019 08:06:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbfLDHGx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Dec 2019 02:06:53 -0500
Received: from mail-eopbgr50087.outbound.protection.outlook.com ([40.107.5.87]:36577
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726053AbfLDHGw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Dec 2019 02:06:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYNPfxA9PNyvi3pygfikS7GkvhH/BTsEgIDXvCC5hxYA2z7h2RaWGKuaRU+AzIrP1zjo982u1WBgYGlPbuu0YWpzKfzVDwnz50eurLClMLRAUbRF7+zbWs0lY/wzSTWWEH+zJsGBDe+cQ3mo6p/Epamtw21YNiRp29YTMDqH3GQusL4K8ZKueuUmwqMzl57twVsOOKfdEqJ9Qnfz8tufiUAFcQGX+DiT5na4iEOYmWgbNAAY2M/CGav2hX76ZYJ+g1Bc01/CFsIsNqw87sKSr1QHhGnU7kRKnDp2P7OdQDwuKiXtXqMi93Lrz/nVC0YtBO50Jy2fvxSngRrpEV5osA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtgrNO9A0WkQmpw5xpKJ5Fy7Ds85VtE72hHku3Iry9k=;
 b=oIcMTdizRv7/4TE9jSomcClLBsbNAI7K7bqZ9svmiBtt0xR+JxRxtnuZlSFPZRYhEqXcZYWInd7U9GApDeipZ6r06/6d9CLIMR5pwrqMxl2F6+HJaZzecgoLeV0PlgOdzaXQt1ZGn4WcO1qig0mfCdvmZiQktUjgMQtww37Y0qPJt0cCJ4CCPbYkH3Uzvr0BmSIZe2XgJ3WsTQ6h1c2Ge3+ikx7x6D6qNn7W6efTJcwMV0WZK0p5oNIFpbvqNDWNyFmdAS1K/t3P55IqjtJne0cqZ6Y21QhLHKplJHve8jEzBFI1XZl5V0ztvcxKBhfWAjS2swKqlQamVxsSfexOQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtgrNO9A0WkQmpw5xpKJ5Fy7Ds85VtE72hHku3Iry9k=;
 b=efKddBAYDmkmYPPlPQLLOdpCeJBAnj5On6aquhKdM/NHoWcYnROPYAzOvsIoEV3Jhw6v/CiRQwFLmIbL7n3y892CipGP0+nGG3xSJ/6ElZqZExJTZxITmkZbELhv46FN6b3ldJ/Fntm6GxKKMBjqcCETUuGNHzVhp128MtXeFOU=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4272.eurprd04.prod.outlook.com (10.171.182.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Wed, 4 Dec 2019 07:06:49 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::cd33:501f:b25:51a9]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::cd33:501f:b25:51a9%7]) with mapi id 15.20.2516.013; Wed, 4 Dec 2019
 07:06:49 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     EJ Hsu <ejh@nvidia.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usb: gadget: fix wrong endpoint desc
Thread-Topic: [PATCH v2] usb: gadget: fix wrong endpoint desc
Thread-Index: AQHVqmRjLMvtmsW5AUGcmwtQARW6E6epjf4A
Date:   Wed, 4 Dec 2019 07:06:49 +0000
Message-ID: <20191204070646.GA25122@b29397-desktop>
References: <20191204053322.35776-1-ejh@nvidia.com>
In-Reply-To: <20191204053322.35776-1-ejh@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9ccf4dc0-684a-4433-b414-08d778888849
x-ms-traffictypediagnostic: VI1PR04MB4272:
x-microsoft-antispam-prvs: <VI1PR04MB4272619ED83491E8927817328B5D0@VI1PR04MB4272.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0241D5F98C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(199004)(189003)(25786009)(7736002)(6116002)(6512007)(9686003)(6916009)(305945005)(6246003)(229853002)(6486002)(33716001)(6506007)(102836004)(8676002)(76176011)(186003)(53546011)(2906002)(66946007)(91956017)(81166006)(26005)(5660300002)(3846002)(76116006)(81156014)(71190400001)(316002)(256004)(11346002)(64756008)(14454004)(66556008)(478600001)(99286004)(44832011)(71200400001)(1076003)(14444005)(66446008)(8936002)(86362001)(66476007)(33656002)(4326008)(54906003)(6436002)(446003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4272;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k7FCBEg82XwEv46aPZs31PS8GjMEYRucUnQriWm3DodzrU8RRIGgMLncCSTIZLTQ3m8w8BD5Mk4SaHQ54SQA99d7JQqLLDiSB72NlQD9Ft8zfXqbXkFlbJCPwsdslohAcgSA1Ujsnzm+mO49VnIE94wTLXX5uDWHfHLWSI1meaPlhjF/ycnZGob/K20fr3yNRAnjF09Ec6ZXaGuImySpcEeVUsf4PIoyond8bKm6g3+dek0BSgnSCUkN9y0IMQlIz8o0NsRnQmGQcHs5sVpmSl+RaC0fzlBnqMJ0w6ZHQQGw6ob7P3T6b80KNxEwIEQyZ5zFVYn7ha2pthGpOee2IPVW5h6uiYIi3GqYIywvBPf40g/xzoXpHy/e2MdCl8z/3ucVpKuEzMk195wKDVE6gYEoxBALhBYLaN5I+ebEpNhD1x2HW59EU77ZfVEtQ8ST
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <735CAEB48E23C14E80FA2D6A1FE0ABBD@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ccf4dc0-684a-4433-b414-08d778888849
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2019 07:06:49.2602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1w/nUncCHoT+qQOPSFJBTfX8BdWQRMJFC6a+fWT5EhKx94YzQzfTs9wgEyvDC4o1uakA7nOS4JIwGiemFwtW+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4272
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19-12-03 21:33:22, EJ Hsu wrote:
> Gadget driver should always use config_ep_by_speed() to initialize
> usb_ep struct according to usb device's operating speed. Otherwise,
> usb_ep struct may be wrong if usb devcie's operating speed is changed.
>=20
> The key point in this patch is that we want to make sure the descpointer

Typo

Otherwise:
Reviewed-by: Peter Chen <peter.chen@nxp.com>

> in usb_ep struct will be set to NULL when gadget is disconnected.
> This will force it to call config_ep_by_speed() to correctly initialize
> usb_ep struct based on the new operating speed when gadget is
> re-connected later.
>=20
> Signed-off-by: EJ Hsu <ejh@nvidia.com>
> ---
> v2: fix the coding style
> ---
>  drivers/usb/gadget/function/f_ecm.c   | 6 +++++-
>  drivers/usb/gadget/function/f_rndis.c | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/fun=
ction/f_ecm.c
> index 6ce044008cf6..460d5d7c984f 100644
> --- a/drivers/usb/gadget/function/f_ecm.c
> +++ b/drivers/usb/gadget/function/f_ecm.c
> @@ -621,8 +621,12 @@ static void ecm_disable(struct usb_function *f)
> =20
>  	DBG(cdev, "ecm deactivated\n");
> =20
> -	if (ecm->port.in_ep->enabled)
> +	if (ecm->port.in_ep->enabled) {
>  		gether_disconnect(&ecm->port);
> +	} else {
> +		ecm->port.in_ep->desc =3D NULL;
> +		ecm->port.out_ep->desc =3D NULL;
> +	}
> =20
>  	usb_ep_disable(ecm->notify);
>  	ecm->notify->desc =3D NULL;
> diff --git a/drivers/usb/gadget/function/f_rndis.c b/drivers/usb/gadget/f=
unction/f_rndis.c
> index d48df36622b7..0d8e4a364ca6 100644
> --- a/drivers/usb/gadget/function/f_rndis.c
> +++ b/drivers/usb/gadget/function/f_rndis.c
> @@ -618,6 +618,7 @@ static void rndis_disable(struct usb_function *f)
>  	gether_disconnect(&rndis->port);
> =20
>  	usb_ep_disable(rndis->notify);
> +	rndis->notify->desc =3D NULL;
>  }
> =20
>  /*----------------------------------------------------------------------=
---*/
> --=20
> 2.17.1
>=20

--=20

Thanks,
Peter Chen=
