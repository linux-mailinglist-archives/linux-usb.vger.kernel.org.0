Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC2312CBEE
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 03:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbfL3C1H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 Dec 2019 21:27:07 -0500
Received: from mail-eopbgr70088.outbound.protection.outlook.com ([40.107.7.88]:42597
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726726AbfL3C1H (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 29 Dec 2019 21:27:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=et4KEosSb+NU5X4NbDnE7EwTtexu5DWymc8CjdIoQXzvAuC7iGSYIWJZagdc0EXz4lTGpbIJzhIixUGHWbBRTb0S3/k55Tm1Q7N1xL0UkzTjWqtfoUeNuVlU/vRyrQNG/4WYBQsGViJ9ihstw9bwrTg5I46JpoO+R9zd+VjX6cbJ0heOgy3QuxR9gfwM1egGos6jd696R1lYtlmYJWpcKm87Z5PFMQx6ragKMUAmG1RfRLJ4Hsk/JnqbFfUEx5210GXiGbZ3PQVFKpNJzLwJI5FtCFYFeiu+uCdGNgHllp6ARVXPcqA2kYr7XelWeIdCGbPTya1FPE1qohdZp52Mjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WH2WAdrD+nXXR02Dh3DYdxaQVAQrS4tEzK453EJq6fk=;
 b=MfYuIbWf75Lk/R50lLYUqKPTtqAPH2AYneZpZgMgukD/i6fk0sS8sQot8FniciPqwCOnNcLtPyLCmRjRSi6VP0R12riHSuBrPEmtt9rz44a181GnBq5LgziH/X4y/gzNxFj+sBH7rG9/8jmovkisifL05RE3lCHfft9PPoCW9U7r4w513sB76QZkSqIgEsK5cP1yy9YLveUqXnL96fbqK+KNo3gxX9UC56xnxnrnH5kSsna6qYhtW61L3VzcpWRFbvM4eTUbZY9983vOLwqykAWWys/PB7BNWRpA5AkEogBP9lzAygi54g00hWFzgRcvEAOG5V0HgPoqUiFHlog3bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WH2WAdrD+nXXR02Dh3DYdxaQVAQrS4tEzK453EJq6fk=;
 b=rRoAVSLgVQfr9YYbZFb1kCoRLN3z+OA41r9T566sobcXytzTRQnp1h+s9jwMLimvDc2bYwq7ipWHE+rMD6IGMO6tJ1EwRATjhojsH5kaEk/d7VxEoxc5IAdtpxsEngJgkc3I8Ehf4h9/e6/RF7vmaGNWJS49Uwetaq//YV7e/gY=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB2975.eurprd04.prod.outlook.com (10.170.228.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.12; Mon, 30 Dec 2019 02:27:03 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2581.007; Mon, 30 Dec 2019
 02:27:03 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jun Li <jun.li@nxp.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/2] usb: chipidea: handle single role for usb role class
Thread-Topic: [PATCH 1/2] usb: chipidea: handle single role for usb role class
Thread-Index: AQHVvKFNRg8RkjFKY0+13/boonDL96fR9/gA
Date:   Mon, 30 Dec 2019 02:27:03 +0000
Message-ID: <20191230022700.GE5283@b29397-desktop>
References: <1577442705-6873-1-git-send-email-jun.li@nxp.com>
In-Reply-To: <1577442705-6873-1-git-send-email-jun.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4cad2d66-dc9a-452c-6e8f-08d78ccfc1fd
x-ms-traffictypediagnostic: VI1PR04MB2975:|VI1PR04MB2975:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB297521C2C69783CD3F7C4A9F8B270@VI1PR04MB2975.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0267E514F9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(199004)(189003)(66556008)(66446008)(8676002)(33716001)(1076003)(76116006)(64756008)(66946007)(81156014)(81166006)(8936002)(26005)(66476007)(478600001)(53546011)(6506007)(91956017)(33656002)(6486002)(186003)(5660300002)(44832011)(71200400001)(86362001)(6512007)(9686003)(6862004)(6636002)(2906002)(54906003)(4326008)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB2975;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CtlZYY80Ki2bRXSMEyDwmEmNOSdyE11lWpdOPRJT13N3BcHGuANlzVmrKOzn0JuhEK7L3Tn+CKKUSUO2zwW8w8lmBtXMEdtqvUCnUZMT2BRKkiYjZ7AHgHtK9nUGqARcM4a+resx8CAH4LfsPpwgIrcpXGfLYlgP4HjEqJrByoqszS90zfijSHPW7vH3QF/65ezKM4g0PPJgoOTMq6QWi9VYE07ap5O50yhvF3cOM+5/1nggnlkuCsrerxDdA8oVMGKcSqcTI3sSm9yZNH8c9xF3n9seqoUFZyp8x0ST1No/pb8iaKDtRPxPMQQevgS/jlKXDAp+D32KY8WlOB9m1T48NjUYEs208K289xMb5oUrtIPtVU7RT3Pwx6uCYA8gcJobt2E1U5ARkCyEVP0+oPbIWm4TxkFVgURsytBHBJkhzw3c0m/krGWekhNuPuCi
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C0B0AADB8AF4964189E9385ABFDB1E55@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cad2d66-dc9a-452c-6e8f-08d78ccfc1fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2019 02:27:03.5785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OR7zsxMW5DnEvUsOzjWdv+gL/qbiw3X0B37AArYxxx5s/CGvEmcZcTx/Ai/f8Fkqd2UJS+4rJjZaFLBCWqz4HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2975
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19-12-27 10:35:05, Jun Li wrote:
> From: Li Jun <jun.li@nxp.com>
>=20
> If usb port is configed to be single role, but usb role class

%s/configed/configured

I will add above change, and apply it.

Peter

> is trying to set unavailable role, don't try to do role change.
>=20
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/usb/chipidea/ci.h   | 10 ++++++++++
>  drivers/usb/chipidea/core.c |  4 +++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
> index 6911aef..d49d5e1 100644
> --- a/drivers/usb/chipidea/ci.h
> +++ b/drivers/usb/chipidea/ci.h
> @@ -302,6 +302,16 @@ static inline enum usb_role ci_role_to_usb_role(stru=
ct ci_hdrc *ci)
>  		return USB_ROLE_NONE;
>  }
> =20
> +static inline enum ci_role usb_role_to_ci_role(enum usb_role role)
> +{
> +	if (role =3D=3D USB_ROLE_HOST)
> +		return CI_ROLE_HOST;
> +	else if (role =3D=3D USB_ROLE_DEVICE)
> +		return CI_ROLE_GADGET;
> +	else
> +		return CI_ROLE_END;
> +}
> +
>  /**
>   * hw_read_id_reg: reads from a identification register
>   * @ci: the controller
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index dce5db4..52139c2 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -618,9 +618,11 @@ static int ci_usb_role_switch_set(struct device *dev=
, enum usb_role role)
>  	struct ci_hdrc *ci =3D dev_get_drvdata(dev);
>  	struct ci_hdrc_cable *cable =3D NULL;
>  	enum usb_role current_role =3D ci_role_to_usb_role(ci);
> +	enum ci_role ci_role =3D usb_role_to_ci_role(role);
>  	unsigned long flags;
> =20
> -	if (current_role =3D=3D role)
> +	if ((ci_role !=3D CI_ROLE_END && !ci->roles[ci_role]) ||
> +	    (current_role =3D=3D role))
>  		return 0;
> =20
>  	pm_runtime_get_sync(ci->dev);
> --=20
> 2.7.4
>=20

--=20

Thanks,
Peter Chen=
