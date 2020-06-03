Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6A01ECC21
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jun 2020 11:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbgFCJCc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jun 2020 05:02:32 -0400
Received: from mail-eopbgr80082.outbound.protection.outlook.com ([40.107.8.82]:56396
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725881AbgFCJCb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Jun 2020 05:02:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAyh8HaC3jvgLFIuGVC6iMfRpVVes2YolQmR5+gkDw98RdgE9Tfek1tBRGMKXSxJOHeTKrLWx/O/C6FwrJNaBNtvhb/9/cb8RRYuDl/75zPurrlv2CftWemcF8cYYV8NMJLAFpN7rYNjhC95RfGCOIV5k7JNQDGJwOXBUINVdIJzeaWY5dh92FwgQGvmX8fFjWkWfW4p/aDZ/ARlKNHbNHmTe5crcbukDrAn1yXRbIIcnWTlFgk7dHJ0oTeTpl5Ep9YJvoCEPfVTHz3kf6CEuNnA5Tv0W7lhUiDfnMkzqG+wl+ZKSJU/OYCWLUmuB05sjBYLkzj9JCkjmco/hgBHIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tm/4kULV6UzmAaPRCLYRuyNmd2+hAP0kVvNw/OO2uqU=;
 b=d1PLHRdaTG0VeWS006pyLe7fgTvE4m6SNoEdCSc2TY/tqC5XHVEtAgzr8vu31laA3dvK70O30qR0pdVpcxdbqM+oC+t6cOSZUxF/e5rnvHbkavihiwYlwqqqD2dCzLy3hJWrhblB6qg3j9dfNQvUH4aakXLJf9TogfKXLkc+4vkXH7o1KFdi6zFifYoNYCTTv727OCbg1riNQSyXaEgKL5y9TrVJ+sU49dzVv3d5vaq9wIdNmvcvAxQNMSQZh6GNWPXpjp+eKzjKIk0R7+IjndykqhsbF2V0C83KS5aUnXwXOECQqGo+dG8srC0ju8NadLSMoPiZoAFA6KB0ZPay0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tm/4kULV6UzmAaPRCLYRuyNmd2+hAP0kVvNw/OO2uqU=;
 b=ZXKiD0bt9P7Pw2G7En+jHD1kV67DYsfggHHwIMYR8/J0WiAtQJT1/PuhutnAs5x6R0vfp38mOXno5zYN14arZRWfMRdxoYxiLzjzg2FFZ9U15E6KMlgKxSnskpkLl9EluWpT83fyMhcWK0DfhRbmrBtP7243Gd7UDEDZWppWquM=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6934.eurprd04.prod.outlook.com (2603:10a6:20b:10a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 3 Jun
 2020 09:02:27 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3066.018; Wed, 3 Jun 2020
 09:02:27 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] Documentation: ABI: usb: chipidea: Update Li Jun's e-mail
Thread-Topic: [PATCH] Documentation: ABI: usb: chipidea: Update Li Jun's
 e-mail
Thread-Index: AQHWNaXkLnwtl02bc0KsmiYR+a8dnKjGoDoA
Date:   Wed, 3 Jun 2020 09:02:27 +0000
Message-ID: <20200603090252.GA11199@b29397-desktop>
References: <20200529104234.25136-1-festevam@gmail.com>
In-Reply-To: <20200529104234.25136-1-festevam@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c6f10a35-81fb-4dc5-fef8-08d8079cd706
x-ms-traffictypediagnostic: AM7PR04MB6934:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB693421DCE8CF7FA30680A4568B880@AM7PR04MB6934.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 04238CD941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UU2kEQGGAAFhgLFgBfDShS/Y+8FyLhdjMHVxiEURWKocq4opBRSb44DxP+gC8JpfqgDgEugxhUg7/uPnXj2rhX/RZw5hPmqEm6q9n0GcomSKOKpD/rNxMKKD60yHMtjpoDfNjepqs533dUK51EnPhLMrlHkSLHtflKm5QnrVPnNHhI/ZlntGhWMrgRDnaBt7GTa11tqmWJ2wgH4iinSkfhjCTB+KprX8EeNQ4anY124GPigvysnJ/nTRkZWpqDT6RYac1v9DKh3bLGSuOg/Y+U6mcsAGq891SVlSbJI2siVs34tZiRqGRkCpzL4Vv2Df
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(71200400001)(86362001)(186003)(33656002)(6916009)(5660300002)(6506007)(33716001)(6486002)(26005)(4326008)(53546011)(66446008)(2906002)(76116006)(91956017)(64756008)(83380400001)(8676002)(66556008)(54906003)(8936002)(1076003)(44832011)(478600001)(316002)(9686003)(6512007)(66476007)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: qy4910rvqK+p2I8ysRbjvmhln7y32omFLaC0SZnTHk9ZnBGtm9mXL58jfXOZIv7sJSnMY985YxExLZcUH4DcTstg5IAXRmhCz7s0ZKEKnUPFuhLFkmnsfpNYv/wdmcLv5TfUjqIVDTvxwg4Y16yphNF9jgRRHecvYRvZzsj1rrbE9yBbikxmVLy+TAaGHMl8aQX0q27W0g5qcArIYC1qmhaPkxpz1RENIiyXs0COYtkoO04IDwVXx97R2ZjCBZpQTOOe+ZXm+jtsSWjOwJ1jTxwUOtOzgHKyoxyuJDhC1pm4zHLbuAiC/kGefFdYVpysqd2u6qwq90A2PeDDr6EbPXaygYHPZD31EvMyMA1KM83zEIi2PQmCKGY5ounAsNLyjGmNPQi94fUsEyXgT00ttNAjEIB/feu2Ef1vhqXljV7v/7Fp/4fuWKZDcUzFK8cZ4e2JvDGWj2itjPKEKxqu8v4sa8wq26g5cszC8sxbMpg=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <64730699A4D8614CA6877B9A984880E2@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f10a35-81fb-4dc5-fef8-08d8079cd706
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2020 09:02:27.5752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pFe6CdWjGR/oHkLsHpNH+ARDOOQpC3Dw+qDMT4rIpQAZsWfVmqbgdK51XG/xRUtZfOncJ+xruko/Ss4VJYXGyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6934
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-05-29 07:42:34, Fabio Estevam wrote:
> The freescale.com e-mail domain is no longer active for quite some
> time. Switch Li Jun's e-mail address to the NXP domain.
>=20
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied, thanks.

Peter
> ---
>  Documentation/ABI/testing/sysfs-platform-chipidea-usb-otg | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/ABI/testing/sysfs-platform-chipidea-usb-otg b/=
Documentation/ABI/testing/sysfs-platform-chipidea-usb-otg
> index 151c59578db4..f58cfb06b160 100644
> --- a/Documentation/ABI/testing/sysfs-platform-chipidea-usb-otg
> +++ b/Documentation/ABI/testing/sysfs-platform-chipidea-usb-otg
> @@ -1,6 +1,6 @@
>  What:		/sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_req
>  Date:		Feb 2014
> -Contact:	Li Jun <b47624@freescale.com>
> +Contact:	Li Jun <jun.li@nxp.com>
>  Description:
>  		Can be set and read.
>  		Set a_bus_req(A-device bus request) input to be 1 if
> @@ -17,7 +17,7 @@ Description:
> =20
>  What:		/sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_drop
>  Date:		Feb 2014
> -Contact:	Li Jun <b47624@freescale.com>
> +Contact:	Li Jun <jun.li@nxp.com>
>  Description:
>  		Can be set and read
>  		The a_bus_drop(A-device bus drop) input is 1 when the
> @@ -32,7 +32,7 @@ Description:
> =20
>  What:		/sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req
>  Date:		Feb 2014
> -Contact:	Li Jun <b47624@freescale.com>
> +Contact:	Li Jun <jun.li@nxp.com>
>  Description:
>  		Can be set and read.
>  		The b_bus_req(B-device bus request) input is 1 during the time
> @@ -47,7 +47,7 @@ Description:
> =20
>  What:		/sys/bus/platform/devices/ci_hdrc.0/inputs/a_clr_err
>  Date:		Feb 2014
> -Contact:	Li Jun <b47624@freescale.com>
> +Contact:	Li Jun <jun.li@nxp.com>
>  Description:
>  		Only can be set.
>  		The a_clr_err(A-device Vbus error clear) input is used to clear
> --=20

--=20

Thanks,
Peter Chen=
