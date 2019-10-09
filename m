Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC9FD0969
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 10:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbfJIIRg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 04:17:36 -0400
Received: from mail-eopbgr60048.outbound.protection.outlook.com ([40.107.6.48]:31487
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725776AbfJIIRg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Oct 2019 04:17:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZGb9iRceyZzJP72BLyFJmrDSQBhUCIk477WfNwpTNYIKuHBh5tPwN0DwtNT/57qGXp5DdXLaCPYCJFab1Q6scXpDTj2vxi0FrwUUK2yZNCXfd276+JFKCYIjcTSEngIdgThx0WtWca/YYz3k5Dqq+e6HRxlba+lr61N7r2iXpvDFHJEmiGpeowdfG3ygoA0nhuoRA69IM7dq3U1HCkw0fBtArF4AU6v888VFff6lz5LHioGHWX/Pr1O78m/t6h4trmrUnhfBbC945YTuxNbdjCtizsk2cDsCeH6lsAa4RNHN9MyJ/CKuJIVGjVZKnpyQPfAHAPeRqwXcLaGiyyO+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lf8Ohq/vEJanjLTgP9NpbNFInZIKj7TyujDUsNFNyuI=;
 b=JXaRVtmgCFQS6OW2d/4nlydNJEL020hoTxccZ8beQ5L2/IX48bfHV7TJ+FWD7gbsk3001+vFGSRBd171pHOoi91duVA6Q3Tp6RX3ZE1vsrYjvvDESRJBRfSIvpbHn2v9s4jgBtG6zba0I03Jy8Xn3SA6OwdHKlacgsMbzuA91fYGkuNsE8MLFPr8U4OTRlfT5lwW164Zxqwivl+5BNAw5X1dFWKqiC0EeNj/JGoZNJVn4uwZTI346uQRLauC+1vfG/C3H12gx+tQ8X80Q8b5oeWOimVz6kQa51J7oNkcqIDgMRPECM1HhQEDXgbzJfxQP4npcrybUUsVWV4Qq3aCpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lf8Ohq/vEJanjLTgP9NpbNFInZIKj7TyujDUsNFNyuI=;
 b=k69STBk0gbbSb/2oP5Bd3y47OpPGrlFEI0hoTm5bprVIaHMbWeS/PDTG5lOgT9tBNCYQFDw1vQyDPcKqOuzDS+Z18y9uoYMRMlZejbPUJCF8L4FsK3UcPDi69Ea61b88C+9SiCLO4VRoA0HLPNC7KcOAz4+l+6EKXXNKQMvRnfk=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB7150.eurprd04.prod.outlook.com (10.186.158.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 9 Oct 2019 08:17:32 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::1da:26dc:6373:4ab0]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::1da:26dc:6373:4ab0%3]) with mapi id 15.20.2327.026; Wed, 9 Oct 2019
 08:17:32 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jun Li <jun.li@nxp.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Subject: Re: [PATCH] usb: chipidea: imx: check data->usbmisc_data against NULL
 before access
Thread-Topic: [PATCH] usb: chipidea: imx: check data->usbmisc_data against
 NULL before access
Thread-Index: AQHVfk4YpOm8/MlAk0KrRyynCkAGIqdR92AA
Date:   Wed, 9 Oct 2019 08:17:32 +0000
Message-ID: <20191009081729.GA4774@b29397-desktop>
References: <20191009025228.16595-1-jun.li@nxp.com>
In-Reply-To: <20191009025228.16595-1-jun.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64dba1e5-c4da-44a8-d301-08d74c912282
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR04MB7150:|VI1PR04MB7150:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB7150C4DF017A60A75C11412D8B950@VI1PR04MB7150.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(396003)(376002)(346002)(39860400002)(136003)(366004)(199004)(189003)(4326008)(6246003)(478600001)(14444005)(256004)(99286004)(14454004)(33656002)(71200400001)(71190400001)(66066001)(8936002)(6636002)(33716001)(6506007)(5660300002)(6862004)(6436002)(25786009)(53546011)(8676002)(316002)(229853002)(81166006)(76176011)(81156014)(7736002)(44832011)(86362001)(446003)(76116006)(54906003)(2906002)(11346002)(66476007)(26005)(64756008)(66446008)(66556008)(102836004)(6486002)(305945005)(1076003)(186003)(3846002)(91956017)(6116002)(6512007)(66946007)(476003)(9686003)(486006);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB7150;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VdxTC/emVa9c+p1SkVwZkJ5sWjyHqw5vGMSQYM3w4amtpVX8Q/XkgJpejf/18VW0UDelZHwRq9112f9v8dvCx3CnEfuE8xa+oQz09q9+5yltXVNS342brj6FlxjNTW1u43q5MqG6QbfDWNIYUCbMcAe4YkMRl24ULsPrdOVMoCHApRx8uMz8lMCJjJSDPKownLGPWsqRUIqFu2W/37PJOaC1AAuEdv4lSCT2FwhG9AsezDU+S1abHIm9a2ISwOXgLGACHgMXcLRxK3C/Gl0ODVtoYCflHVu5mL9trvGeSESifeN9gje7F+J3Z2zVZpCNbhgNP2XtyYzJIkD2TBi7h1a/t4xtBied9i79I2NHxoJqaBU7VB3wdvqlFUE2TzXUqBiTYolS+RtRz6ZQ6NfwvRErzX0+15cY86SkNWlAv60=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AB7142AB2EDF434DA5E1F5638FCD6D1E@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64dba1e5-c4da-44a8-d301-08d74c912282
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 08:17:32.8352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aBk0T1GcF+JLXS/mvLtqazrjrZZ8IcR/9OPtySk5aniN3rmLEz3qPopxBieOBJ2AkkG7tx2FbeghaXBTPDPXIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19-10-09 10:52:28, jun.li@nxp.com wrote:
> From: Li Jun <jun.li@nxp.com>
>=20
> As usbmisc_data is optional, so add the check before access its member,
> this fix below static checker warning:
> drivers/usb/chipidea/ci_hdrc_imx.c:438 ci_hdrc_imx_probe()
> warn: 'data->usbmisc_data' can also be NULL
> which is introduced by Patch 15b80f7c3a7f:
> "usb: chipidea: imx: enable vbus and id wakeup only for OTG events"
>=20
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci=
_hdrc_imx.c
> index b11d70f..0498210 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -433,13 +433,15 @@ static int ci_hdrc_imx_probe(struct platform_device=
 *pdev)
>  		goto err_clk;
>  	}
> =20
> -	if (!IS_ERR(pdata.id_extcon.edev) ||
> -	    of_property_read_bool(np, "usb-role-switch"))
> -		data->usbmisc_data->ext_id =3D 1;
> -
> -	if (!IS_ERR(pdata.vbus_extcon.edev) ||
> -	    of_property_read_bool(np, "usb-role-switch"))
> -		data->usbmisc_data->ext_vbus =3D 1;
> +	if (data->usbmisc_data) {
> +		if (!IS_ERR(pdata.id_extcon.edev) ||
> +		    of_property_read_bool(np, "usb-role-switch"))
> +			data->usbmisc_data->ext_id =3D 1;
> +
> +		if (!IS_ERR(pdata.vbus_extcon.edev) ||
> +		    of_property_read_bool(np, "usb-role-switch"))
> +			data->usbmisc_data->ext_vbus =3D 1;
> +	}
> =20
>  	ret =3D imx_usbmisc_init_post(data->usbmisc_data);
>  	if (ret) {

Applied, thanks.

--=20

Thanks,
Peter Chen=
