Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 520E9B336C
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2019 04:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728026AbfIPCbV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Sep 2019 22:31:21 -0400
Received: from mail-eopbgr70089.outbound.protection.outlook.com ([40.107.7.89]:36686
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726316AbfIPCbV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 15 Sep 2019 22:31:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEOuwi4W0L2uYBbkQmC0kcCr+VDDij0NU4eUQPr2QJ4m0Mgz0u+NHh/kLSJQl/GVxTQh8Gi6ES9+dE2LHu+AGNKSOENw+rSIWQ+uj0/xWavX/5nxbv+Eaz3M+Lu/Xdcw+2UyKpCDY+VHDUwb28hlQfpCM8NA3TmAIos9OX3r0xRTC8WIm+XthJuo55Tkql1OHEzSJnC4R++jRGU2dLwSTxdpLlL/dSUslqPGRrxdl+a7CkJZ8YorTYua97QZmTn1GHpeLHiMfty2ZcSiX2/0Mr0BquuEtijHNo3kCoZzIobdyd6UgrzHigCs/XAnxHqKrE4JK7G/VAOgRZKVtmdbOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8w1dyRgRiinuTDj+02m38WX7FJmrctimCptEyXQgaI=;
 b=J91zkWJz5McugqMPvQKkan2JNAPbjNpnje31rEY7spyozRpk2u/+DMfsq7uGY2NJRKzTtvQZq6poXV0A1x0Q0V75Vrc7h0sDEt9Q4OpBbwE7MNVBTC1d8fpFA0GmU7GgF6plkMd2CBU4mbJ/O/mGQkH5MnIhe3ULkEKkuSGC2LqYY+LMQKthxvjhKp1FJw30SzWDC0CJ8B1WYLfRkBPau9+L2N1+yuEkycoQwICGJ+9Y+v+Ok0E/D04hL9UeB0dLU+a3LVVBJsIPY1v3azA0JX9muhh62sp1Cro4rU/PfasEnuZ+mEfmU+tXC7xFP+f+sOJiUQ21MjaLfzfGQHhdMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8w1dyRgRiinuTDj+02m38WX7FJmrctimCptEyXQgaI=;
 b=e0+176uuwTp6k9ohrElNjtbjCnzFlDyS3krUAfcC+CUt472eDm5PgQ6k1ZyZEa/7IOiBB8AW5bBECT3vWFGtA+8QxKrEAPiPt7QQLxvEsqbiWj4NeuGpgb/1MoAhd1I3FpvP1outEuqtUqOi3ZR4PAPJkGkP9rHzrqclODC3ADk=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB4336.eurprd04.prod.outlook.com (52.134.122.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.20; Mon, 16 Sep 2019 02:31:11 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::744a:c78e:b8:633a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::744a:c78e:b8:633a%7]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 02:31:10 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     =?iso-8859-1?Q?Andr=E9_Draszik?= <git@andred.net>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "frieder.schrempf@exceet.de" <frieder.schrempf@exceet.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [v5,2/4] usb: chipidea: imx: add HSIC support
Thread-Topic: [v5,2/4] usb: chipidea: imx: add HSIC support
Thread-Index: AQHVahhV3PVDXMo7hUKqyCkgYifa3KctmcKA
Date:   Mon, 16 Sep 2019 02:31:10 +0000
Message-ID: <20190916023113.GA21844@b29397-desktop>
References: <20181211020624.9433-3-peter.chen@nxp.com>
 <8b32b04dd746ac2e9afc07d49e824465697182de.camel@andred.net>
In-Reply-To: <8b32b04dd746ac2e9afc07d49e824465697182de.camel@andred.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3e5b2b9-7df2-4f4a-7532-08d73a4df004
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:VI1PR04MB4336;
x-ms-traffictypediagnostic: VI1PR04MB4336:|VI1PR04MB4336:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB43365F77286DE04164C52F0F8B8C0@VI1PR04MB4336.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(396003)(366004)(376002)(346002)(136003)(39860400002)(189003)(199004)(64756008)(6916009)(86362001)(66946007)(66556008)(76116006)(91956017)(486006)(7736002)(66446008)(66476007)(305945005)(478600001)(25786009)(71200400001)(71190400001)(5660300002)(66066001)(102836004)(6506007)(53546011)(316002)(81166006)(1076003)(81156014)(8676002)(6116002)(30864003)(14444005)(44832011)(256004)(4326008)(4001150100001)(76176011)(6246003)(8936002)(3846002)(26005)(476003)(14454004)(53936002)(229853002)(6512007)(99286004)(9686003)(186003)(6486002)(53946003)(33716001)(11346002)(2906002)(33656002)(6436002)(54906003)(446003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4336;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: f2ear2Ml1ZbDpT0x8CoOkel6+KAOaQ3ClR+Xq+bzFbnBDDqE0MY4hyrFd+9mNRpOZyjw+b3zlliPh3wuatknMSAvmTR4O0ATFMI0XLBMbxnGi0/x2o4fKoZqUMdyAKF8csr8vm7Zy+TlJzBeAK0y4ot0BQkWJVs3yVXJL6iSLGjueYKW14CrXU9oPGwx/NbqkXeNDo1Vx+HfYdIHcueXtxg5jGmyE8zKkV1wPhtPf2XgfPrpvUUvKC3YDtdarQd5jbE/CBY75uhmL/qM8urs1lXuOEKK9IQUHPMS5d3uNwYHSio8N9zpEfoUKAjP6F2qN7SyMgz6F19j4I/PA8RomJdYRBhFlgfrsrCySN4etZKNodjHnnfNXIt7HWS1g1x8UILH+FeMqtV6J0KJcdVLMq1JBqMycWLbk8mnNe9NHps=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4DA05E293058F34AA754B721D686F2AC@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e5b2b9-7df2-4f4a-7532-08d73a4df004
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 02:31:10.7982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WC2rcZQiHk/5chXZxBrSW4iIpg+Kfg3ZRbbyXXY5SYTIIF1Xz1wbyn2NmWnaXK0ZMgKuHi2pUYu4qOwIaL5Pyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4336
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19-09-13 10:47:58, Andr=E9 Draszik wrote:
> Hi Peter,
>=20
> On Tue, 2018-12-11 at 02:08 +0000, Peter Chen wrote:
> > To support imx HSIC, there are some special requirement:
> > - The HSIC pad is 1.2v, it may need to supply from external
> > - The data/strobe pin needs to be pulled down first, and after
> >   host mode is initialized, the strobe pin needs to be pulled up
> > - During the USB suspend/resume, special setting is needed
>=20
> I have an imx7d based board that is using the USBH/HSIC port.
>=20
> This USB-port isn't working with this commit because the pinctrl
> is non-optional (as opposed to the NXP kernel 4.19.35 where
> the pinctrl is optional and it appears to work fine for us
> without).
>=20
> Now, I'd like to make it work with your patch here, but I
> am not sure the relevant pinmux setting is documented in
> the IMX7D applications processor reference manual
> IMX7DRM.pdf that I have.

Hi Andre,

Thanks for reporting it. i.MX7D uses different HSIC controller
compares with imx6, and there are dedicated HSIC pins which
doesn't need configure pinmux. So the suitable solution is
getting pinmux optional, a patch to improve it is welcome.

Peter

>=20
> As far as I understand, I need to provide sth like the following:
>=20
> &usbh {
>         ...
>         pinctrl-names =3D "idle", "active";
>         pinctrl-0 =3D <&pinctrl_usbh_idle>;
>         pinctrl-1 =3D <&pinctrl_usbh_active>;
>         ...
> };
>=20
> pinctrl_usbh_idle: usbhgrp-idle {
>         fsl,pins =3D <
>                 MX7D_PAD_USB_H_DATA__USB_H_DATA         0x........
>                 MX7D_PAD_USB_H_STROBE__USB_H_STROBE     0x........
>         >;
> };
>=20
> pinctrl_usbh_active: usbhgrp-active {
>         fsl,pins =3D <
>                 MX7D_PAD_USB_H_DATA__USB_H_DATA         0x........
>                 MX7D_PAD_USB_H_STROBE__USB_H_STROBE     0x........
>          >;
> };
>=20
>=20
> Can you help or point me to the relevant documentation please for
> defining MX7D_PAD_USB_H_DATA__USB_H_DATA &
> MX7D_PAD_USB_H_STROBE__USB_H_STROBE and their register settings?
>=20
> Given USB_H_DATA and USB_H_STROBE don't appear to be board specific
> 'No muxing' is mentioned in IMX7DRM), should any such configuration
> really go into imx7s.dtsi?
>=20
> Alternatively, given that this works without the extra pinctrl
> dance in the i.MX specific kernel, is it really needed on i.MX7,
> or can the driver be changed to make this optional here as well?
> What is the right approach?
>=20
>=20
> Cheers,
> Andre'
>=20
>=20
>=20
>=20
> >=20
> > Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> > Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> >  drivers/usb/chipidea/ci_hdrc_imx.c | 140 +++++++++++++++++++++++++++++=
+++-----
> >  drivers/usb/chipidea/ci_hdrc_imx.h |   9 ++-
> >  drivers/usb/chipidea/usbmisc_imx.c | 140 +++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 270 insertions(+), 19 deletions(-)
> >=20
> > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/=
ci_hdrc_imx.c
> > index 09b37c0d075d..56781c329db0 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/usb/chipidea.h>
> >  #include <linux/usb/of.h>
> >  #include <linux/clk.h>
> > +#include <linux/pinctrl/consumer.h>
> > =20
> >  #include "ci.h"
> >  #include "ci_hdrc_imx.h"
> > @@ -85,6 +86,9 @@ struct ci_hdrc_imx_data {
> >  	bool supports_runtime_pm;
> >  	bool override_phy_control;
> >  	bool in_lpm;
> > +	struct pinctrl *pinctrl;
> > +	struct pinctrl_state *pinctrl_hsic_active;
> > +	struct regulator *hsic_pad_regulator;
> >  	/* SoC before i.mx6 (except imx23/imx28) needs three clks */
> >  	bool need_three_clks;
> >  	struct clk *clk_ipg;
> > @@ -245,19 +249,49 @@ static void imx_disable_unprepare_clks(struct dev=
ice *dev)
> >  	}
> >  }
> > =20
> > +static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int e=
vent)
> > +{
> > +	struct device *dev =3D ci->dev->parent;
> > +	struct ci_hdrc_imx_data *data =3D dev_get_drvdata(dev);
> > +	int ret =3D 0;
> > +
> > +	switch (event) {
> > +	case CI_HDRC_IMX_HSIC_ACTIVE_EVENT:
> > +		ret =3D pinctrl_select_state(data->pinctrl,
> > +				data->pinctrl_hsic_active);
> > +		if (ret)
> > +			dev_err(dev, "hsic_active select failed, err=3D%d\n",
> > +				ret);
> > +		break;
> > +	case CI_HDRC_IMX_HSIC_SUSPEND_EVENT:
> > +		ret =3D imx_usbmisc_hsic_set_connect(data->usbmisc_data);
> > +		if (ret)
> > +			dev_err(dev,
> > +				"hsic_set_connect failed, err=3D%d\n", ret);
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> >  static int ci_hdrc_imx_probe(struct platform_device *pdev)
> >  {
> >  	struct ci_hdrc_imx_data *data;
> >  	struct ci_hdrc_platform_data pdata =3D {
> >  		.name		=3D dev_name(&pdev->dev),
> >  		.capoffset	=3D DEF_CAPOFFSET,
> > +		.notify_event	=3D ci_hdrc_imx_notify_event,
> >  	};
> >  	int ret;
> >  	const struct of_device_id *of_id;
> >  	const struct ci_hdrc_imx_platform_flag *imx_platform_flag;
> >  	struct device_node *np =3D pdev->dev.of_node;
> > +	struct device *dev =3D &pdev->dev;
> > +	struct pinctrl_state *pinctrl_hsic_idle;
> > =20
> > -	of_id =3D of_match_device(ci_hdrc_imx_dt_ids, &pdev->dev);
> > +	of_id =3D of_match_device(ci_hdrc_imx_dt_ids, dev);
> >  	if (!of_id)
> >  		return -ENODEV;
> > =20
> > @@ -268,19 +302,73 @@ static int ci_hdrc_imx_probe(struct platform_devi=
ce *pdev)
> >  		return -ENOMEM;
> > =20
> >  	platform_set_drvdata(pdev, data);
> > -	data->usbmisc_data =3D usbmisc_get_init_data(&pdev->dev);
> > +	data->usbmisc_data =3D usbmisc_get_init_data(dev);
> >  	if (IS_ERR(data->usbmisc_data))
> >  		return PTR_ERR(data->usbmisc_data);
> > =20
> > -	ret =3D imx_get_clks(&pdev->dev);
> > +	if (of_usb_get_phy_mode(dev->of_node) =3D=3D USBPHY_INTERFACE_MODE_HS=
IC) {
> > +		pdata.flags |=3D CI_HDRC_IMX_IS_HSIC;
> > +		data->usbmisc_data->hsic =3D 1;
> > +		data->pinctrl =3D devm_pinctrl_get(dev);
> > +		if (IS_ERR(data->pinctrl)) {
> > +			dev_err(dev, "pinctrl get failed, err=3D%ld\n",
> > +					PTR_ERR(data->pinctrl));
> > +			return PTR_ERR(data->pinctrl);
> > +		}
> > +
> > +		pinctrl_hsic_idle =3D pinctrl_lookup_state(data->pinctrl, "idle");
> > +		if (IS_ERR(pinctrl_hsic_idle)) {
> > +			dev_err(dev,
> > +				"pinctrl_hsic_idle lookup failed, err=3D%ld\n",
> > +					PTR_ERR(pinctrl_hsic_idle));
> > +			return PTR_ERR(pinctrl_hsic_idle);
> > +		}
> > +
> > +		ret =3D pinctrl_select_state(data->pinctrl, pinctrl_hsic_idle);
> > +		if (ret) {
> > +			dev_err(dev, "hsic_idle select failed, err=3D%d\n", ret);
> > +			return ret;
> > +		}
> > +
> > +		data->pinctrl_hsic_active =3D pinctrl_lookup_state(data->pinctrl,
> > +								"active");
> > +		if (IS_ERR(data->pinctrl_hsic_active)) {
> > +			dev_err(dev,
> > +				"pinctrl_hsic_active lookup failed, err=3D%ld\n",
> > +					PTR_ERR(data->pinctrl_hsic_active));
> > +			return PTR_ERR(data->pinctrl_hsic_active);
> > +		}
> > +
> > +		data->hsic_pad_regulator =3D devm_regulator_get(dev, "hsic");
> > +		if (PTR_ERR(data->hsic_pad_regulator) =3D=3D -EPROBE_DEFER) {
> > +			return -EPROBE_DEFER;
> > +		} else if (PTR_ERR(data->hsic_pad_regulator) =3D=3D -ENODEV) {
> > +			/* no pad regualator is needed */
> > +			data->hsic_pad_regulator =3D NULL;
> > +		} else if (IS_ERR(data->hsic_pad_regulator)) {
> > +			dev_err(dev, "Get HSIC pad regulator error: %ld\n",
> > +					PTR_ERR(data->hsic_pad_regulator));
> > +			return PTR_ERR(data->hsic_pad_regulator);
> > +		}
> > +
> > +		if (data->hsic_pad_regulator) {
> > +			ret =3D regulator_enable(data->hsic_pad_regulator);
> > +			if (ret) {
> > +				dev_err(dev,
> > +					"Failed to enable HSIC pad regulator\n");
> > +				return ret;
> > +			}
> > +		}
> > +	}
> > +	ret =3D imx_get_clks(dev);
> >  	if (ret)
> > -		return ret;
> > +		goto disable_hsic_regulator;
> > =20
> > -	ret =3D imx_prepare_enable_clks(&pdev->dev);
> > +	ret =3D imx_prepare_enable_clks(dev);
> >  	if (ret)
> > -		return ret;
> > +		goto disable_hsic_regulator;
> > =20
> > -	data->phy =3D devm_usb_get_phy_by_phandle(&pdev->dev, "fsl,usbphy", 0=
);
> > +	data->phy =3D devm_usb_get_phy_by_phandle(dev, "fsl,usbphy", 0);
> >  	if (IS_ERR(data->phy)) {
> >  		ret =3D PTR_ERR(data->phy);
> >  		/* Return -EINVAL if no usbphy is available */
> > @@ -305,40 +393,43 @@ static int ci_hdrc_imx_probe(struct platform_devi=
ce *pdev)
> > =20
> >  	ret =3D imx_usbmisc_init(data->usbmisc_data);
> >  	if (ret) {
> > -		dev_err(&pdev->dev, "usbmisc init failed, ret=3D%d\n", ret);
> > +		dev_err(dev, "usbmisc init failed, ret=3D%d\n", ret);
> >  		goto err_clk;
> >  	}
> > =20
> > -	data->ci_pdev =3D ci_hdrc_add_device(&pdev->dev,
> > +	data->ci_pdev =3D ci_hdrc_add_device(dev,
> >  				pdev->resource, pdev->num_resources,
> >  				&pdata);
> >  	if (IS_ERR(data->ci_pdev)) {
> >  		ret =3D PTR_ERR(data->ci_pdev);
> >  		if (ret !=3D -EPROBE_DEFER)
> > -			dev_err(&pdev->dev,
> > -				"ci_hdrc_add_device failed, err=3D%d\n", ret);
> > +			dev_err(dev, "ci_hdrc_add_device failed, err=3D%d\n",
> > +					ret);
> >  		goto err_clk;
> >  	}
> > =20
> >  	ret =3D imx_usbmisc_init_post(data->usbmisc_data);
> >  	if (ret) {
> > -		dev_err(&pdev->dev, "usbmisc post failed, ret=3D%d\n", ret);
> > +		dev_err(dev, "usbmisc post failed, ret=3D%d\n", ret);
> >  		goto disable_device;
> >  	}
> > =20
> >  	if (data->supports_runtime_pm) {
> > -		pm_runtime_set_active(&pdev->dev);
> > -		pm_runtime_enable(&pdev->dev);
> > +		pm_runtime_set_active(dev);
> > +		pm_runtime_enable(dev);
> >  	}
> > =20
> > -	device_set_wakeup_capable(&pdev->dev, true);
> > +	device_set_wakeup_capable(dev, true);
> > =20
> >  	return 0;
> > =20
> >  disable_device:
> >  	ci_hdrc_remove_device(data->ci_pdev);
> >  err_clk:
> > -	imx_disable_unprepare_clks(&pdev->dev);
> > +	imx_disable_unprepare_clks(dev);
> > +disable_hsic_regulator:
> > +	if (data->hsic_pad_regulator)
> > +		ret =3D regulator_disable(data->hsic_pad_regulator);
> >  	return ret;
> >  }
> > =20
> > @@ -355,6 +446,8 @@ static int ci_hdrc_imx_remove(struct platform_devic=
e *pdev)
> >  	if (data->override_phy_control)
> >  		usb_phy_shutdown(data->phy);
> >  	imx_disable_unprepare_clks(&pdev->dev);
> > +	if (data->hsic_pad_regulator)
> > +		regulator_disable(data->hsic_pad_regulator);
> > =20
> >  	return 0;
> >  }
> > @@ -367,9 +460,16 @@ static void ci_hdrc_imx_shutdown(struct platform_d=
evice *pdev)
> >  static int __maybe_unused imx_controller_suspend(struct device *dev)
> >  {
> >  	struct ci_hdrc_imx_data *data =3D dev_get_drvdata(dev);
> > +	int ret =3D 0;
> > =20
> >  	dev_dbg(dev, "at %s\n", __func__);
> > =20
> > +	ret =3D imx_usbmisc_hsic_set_clk(data->usbmisc_data, false);
> > +	if (ret) {
> > +		dev_err(dev, "usbmisc hsic_set_clk failed, ret=3D%d\n", ret);
> > +		return ret;
> > +	}
> > +
> >  	imx_disable_unprepare_clks(dev);
> >  	data->in_lpm =3D true;
> > =20
> > @@ -400,8 +500,16 @@ static int __maybe_unused imx_controller_resume(st=
ruct device *dev)
> >  		goto clk_disable;
> >  	}
> > =20
> > +	ret =3D imx_usbmisc_hsic_set_clk(data->usbmisc_data, true);
> > +	if (ret) {
> > +		dev_err(dev, "usbmisc hsic_set_clk failed, ret=3D%d\n", ret);
> > +		goto hsic_set_clk_fail;
> > +	}
> > +
> >  	return 0;
> > =20
> > +hsic_set_clk_fail:
> > +	imx_usbmisc_set_wakeup(data->usbmisc_data, true);
> >  clk_disable:
> >  	imx_disable_unprepare_clks(dev);
> >  	return ret;
> > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.h b/drivers/usb/chipidea/=
ci_hdrc_imx.h
> > index 204275f47573..fcecab478934 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_imx.h
> > +++ b/drivers/usb/chipidea/ci_hdrc_imx.h
> > @@ -14,10 +14,13 @@ struct imx_usbmisc_data {
> >  	unsigned int oc_polarity:1; /* over current polarity if oc enabled */
> >  	unsigned int evdo:1; /* set external vbus divider option */
> >  	unsigned int ulpi:1; /* connected to an ULPI phy */
> > +	unsigned int hsic:1; /* HSIC controlller */
> >  };
> > =20
> > -int imx_usbmisc_init(struct imx_usbmisc_data *);
> > -int imx_usbmisc_init_post(struct imx_usbmisc_data *);
> > -int imx_usbmisc_set_wakeup(struct imx_usbmisc_data *, bool);
> > +int imx_usbmisc_init(struct imx_usbmisc_data *data);
> > +int imx_usbmisc_init_post(struct imx_usbmisc_data *data);
> > +int imx_usbmisc_set_wakeup(struct imx_usbmisc_data *data, bool enabled=
);
> > +int imx_usbmisc_hsic_set_connect(struct imx_usbmisc_data *data);
> > +int imx_usbmisc_hsic_set_clk(struct imx_usbmisc_data *data, bool on);
> > =20
> >  #endif /* __DRIVER_USB_CHIPIDEA_CI_HDRC_IMX_H */
> > diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/=
usbmisc_imx.c
> > index def80ff547e4..43a15a6e86f5 100644
> > --- a/drivers/usb/chipidea/usbmisc_imx.c
> > +++ b/drivers/usb/chipidea/usbmisc_imx.c
> > @@ -64,10 +64,22 @@
> >  #define MX6_BM_OVER_CUR_DIS		BIT(7)
> >  #define MX6_BM_OVER_CUR_POLARITY	BIT(8)
> >  #define MX6_BM_WAKEUP_ENABLE		BIT(10)
> > +#define MX6_BM_UTMI_ON_CLOCK		BIT(13)
> >  #define MX6_BM_ID_WAKEUP		BIT(16)
> >  #define MX6_BM_VBUS_WAKEUP		BIT(17)
> >  #define MX6SX_BM_DPDM_WAKEUP_EN		BIT(29)
> >  #define MX6_BM_WAKEUP_INTR		BIT(31)
> > +
> > +#define MX6_USB_HSIC_CTRL_OFFSET	0x10
> > +/* Send resume signal without 480Mhz PHY clock */
> > +#define MX6SX_BM_HSIC_AUTO_RESUME	BIT(23)
> > +/* set before portsc.suspendM =3D 1 */
> > +#define MX6_BM_HSIC_DEV_CONN		BIT(21)
> > +/* HSIC enable */
> > +#define MX6_BM_HSIC_EN			BIT(12)
> > +/* Force HSIC module 480M clock on, even when in Host is in suspend mo=
de */
> > +#define MX6_BM_HSIC_CLK_ON		BIT(11)
> > +
> >  #define MX6_USB_OTG1_PHY_CTRL		0x18
> >  /* For imx6dql, it is host-only controller, for later imx6, it is otg'=
s */
> >  #define MX6_USB_OTG2_PHY_CTRL		0x1c
> > @@ -94,6 +106,10 @@ struct usbmisc_ops {
> >  	int (*post)(struct imx_usbmisc_data *data);
> >  	/* It's called when we need to enable/disable usb wakeup */
> >  	int (*set_wakeup)(struct imx_usbmisc_data *data, bool enabled);
> > +	/* It's called before setting portsc.suspendM */
> > +	int (*hsic_set_connect)(struct imx_usbmisc_data *data);
> > +	/* It's called during suspend/resume */
> > +	int (*hsic_set_clk)(struct imx_usbmisc_data *data, bool enabled);
> >  };
> > =20
> >  struct imx_usbmisc {
> > @@ -353,6 +369,18 @@ static int usbmisc_imx6q_init(struct imx_usbmisc_d=
ata *data)
> >  	writel(reg | MX6_BM_NON_BURST_SETTING,
> >  			usbmisc->base + data->index * 4);
> > =20
> > +	/* For HSIC controller */
> > +	if (data->hsic) {
> > +		reg =3D readl(usbmisc->base + data->index * 4);
> > +		writel(reg | MX6_BM_UTMI_ON_CLOCK,
> > +			usbmisc->base + data->index * 4);
> > +		reg =3D readl(usbmisc->base + MX6_USB_HSIC_CTRL_OFFSET
> > +			+ (data->index - 2) * 4);
> > +		reg |=3D MX6_BM_HSIC_EN | MX6_BM_HSIC_CLK_ON;
> > +		writel(reg, usbmisc->base + MX6_USB_HSIC_CTRL_OFFSET
> > +			+ (data->index - 2) * 4);
> > +	}
> > +
> >  	spin_unlock_irqrestore(&usbmisc->lock, flags);
> > =20
> >  	usbmisc_imx6q_set_wakeup(data, false);
> > @@ -360,6 +388,79 @@ static int usbmisc_imx6q_init(struct imx_usbmisc_d=
ata *data)
> >  	return 0;
> >  }
> > =20
> > +static int usbmisc_imx6_hsic_get_reg_offset(struct imx_usbmisc_data *d=
ata)
> > +{
> > +	int offset, ret =3D 0;
> > +
> > +	if (data->index =3D=3D 2 || data->index =3D=3D 3) {
> > +		offset =3D (data->index - 2) * 4;
> > +	} else if (data->index =3D=3D 0) {
> > +		/*
> > +		 * For SoCs like i.MX7D and later, each USB controller has
> > +		 * its own non-core register region. For SoCs before i.MX7D,
> > +		 * the first two USB controllers are non-HSIC controllers.
> > +		 */
> > +		offset =3D 0;
> > +	} else {
> > +		dev_err(data->dev, "index is error for usbmisc\n");
> > +		ret =3D -EINVAL;
> > +	}
> > +
> > +	return ret ? ret : offset;
> > +}
> > +
> > +static int usbmisc_imx6_hsic_set_connect(struct imx_usbmisc_data *data=
)
> > +{
> > +	unsigned long flags;
> > +	u32 val;
> > +	struct imx_usbmisc *usbmisc =3D dev_get_drvdata(data->dev);
> > +	int offset;
> > +
> > +	spin_lock_irqsave(&usbmisc->lock, flags);
> > +	offset =3D usbmisc_imx6_hsic_get_reg_offset(data);
> > +	if (offset < 0) {
> > +		spin_unlock_irqrestore(&usbmisc->lock, flags);
> > +		return offset;
> > +	}
> > +
> > +	val =3D readl(usbmisc->base + MX6_USB_HSIC_CTRL_OFFSET + offset);
> > +	if (!(val & MX6_BM_HSIC_DEV_CONN))
> > +		writel(val | MX6_BM_HSIC_DEV_CONN,
> > +			usbmisc->base + MX6_USB_HSIC_CTRL_OFFSET + offset);
> > +
> > +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> > +
> > +	return 0;
> > +}
> > +
> > +static int usbmisc_imx6_hsic_set_clk(struct imx_usbmisc_data *data, bo=
ol on)
> > +{
> > +	unsigned long flags;
> > +	u32 val;
> > +	struct imx_usbmisc *usbmisc =3D dev_get_drvdata(data->dev);
> > +	int offset;
> > +
> > +	spin_lock_irqsave(&usbmisc->lock, flags);
> > +	offset =3D usbmisc_imx6_hsic_get_reg_offset(data);
> > +	if (offset < 0) {
> > +		spin_unlock_irqrestore(&usbmisc->lock, flags);
> > +		return offset;
> > +	}
> > +
> > +	val =3D readl(usbmisc->base + MX6_USB_HSIC_CTRL_OFFSET + offset);
> > +	val |=3D MX6_BM_HSIC_EN | MX6_BM_HSIC_CLK_ON;
> > +	if (on)
> > +		val |=3D MX6_BM_HSIC_CLK_ON;
> > +	else
> > +		val &=3D ~MX6_BM_HSIC_CLK_ON;
> > +
> > +	writel(val, usbmisc->base + MX6_USB_HSIC_CTRL_OFFSET + offset);
> > +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> > +
> > +	return 0;
> > +}
> > +
> > +
> >  static int usbmisc_imx6sx_init(struct imx_usbmisc_data *data)
> >  {
> >  	void __iomem *reg =3D NULL;
> > @@ -385,6 +486,13 @@ static int usbmisc_imx6sx_init(struct imx_usbmisc_=
data *data)
> >  		spin_unlock_irqrestore(&usbmisc->lock, flags);
> >  	}
> > =20
> > +	/* For HSIC controller */
> > +	if (data->hsic) {
> > +		val =3D readl(usbmisc->base + MX6_USB_HSIC_CTRL_OFFSET);
> > +		val |=3D MX6SX_BM_HSIC_AUTO_RESUME;
> > +		writel(val, usbmisc->base + MX6_USB_HSIC_CTRL_OFFSET);
> > +	}
> > +
> >  	return 0;
> >  }
> > =20
> > @@ -454,6 +562,7 @@ static int usbmisc_imx7d_init(struct imx_usbmisc_da=
ta *data)
> >  	reg &=3D ~MX7D_USB_VBUS_WAKEUP_SOURCE_MASK;
> >  	writel(reg | MX7D_USB_VBUS_WAKEUP_SOURCE_BVALID,
> >  		 usbmisc->base + MX7D_USBNC_USB_CTRL2);
> > +
> >  	spin_unlock_irqrestore(&usbmisc->lock, flags);
> > =20
> >  	usbmisc_imx7d_set_wakeup(data, false);
> > @@ -481,6 +590,8 @@ static const struct usbmisc_ops imx53_usbmisc_ops =
=3D {
> >  static const struct usbmisc_ops imx6q_usbmisc_ops =3D {
> >  	.set_wakeup =3D usbmisc_imx6q_set_wakeup,
> >  	.init =3D usbmisc_imx6q_init,
> > +	.hsic_set_connect =3D usbmisc_imx6_hsic_set_connect,
> > +	.hsic_set_clk   =3D usbmisc_imx6_hsic_set_clk,
> >  };
> > =20
> >  static const struct usbmisc_ops vf610_usbmisc_ops =3D {
> > @@ -490,6 +601,8 @@ static const struct usbmisc_ops vf610_usbmisc_ops =
=3D {
> >  static const struct usbmisc_ops imx6sx_usbmisc_ops =3D {
> >  	.set_wakeup =3D usbmisc_imx6q_set_wakeup,
> >  	.init =3D usbmisc_imx6sx_init,
> > +	.hsic_set_connect =3D usbmisc_imx6_hsic_set_connect,
> > +	.hsic_set_clk =3D usbmisc_imx6_hsic_set_clk,
> >  };
> > =20
> >  static const struct usbmisc_ops imx7d_usbmisc_ops =3D {
> > @@ -546,6 +659,33 @@ int imx_usbmisc_set_wakeup(struct imx_usbmisc_data=
 *data, bool enabled)
> >  }
> >  EXPORT_SYMBOL_GPL(imx_usbmisc_set_wakeup);
> > =20
> > +int imx_usbmisc_hsic_set_connect(struct imx_usbmisc_data *data)
> > +{
> > +	struct imx_usbmisc *usbmisc;
> > +
> > +	if (!data)
> > +		return 0;
> > +
> > +	usbmisc =3D dev_get_drvdata(data->dev);
> > +	if (!usbmisc->ops->hsic_set_connect || !data->hsic)
> > +		return 0;
> > +	return usbmisc->ops->hsic_set_connect(data);
> > +}
> > +EXPORT_SYMBOL_GPL(imx_usbmisc_hsic_set_connect);
> > +
> > +int imx_usbmisc_hsic_set_clk(struct imx_usbmisc_data *data, bool on)
> > +{
> > +	struct imx_usbmisc *usbmisc;
> > +
> > +	if (!data)
> > +		return 0;
> > +
> > +	usbmisc =3D dev_get_drvdata(data->dev);
> > +	if (!usbmisc->ops->hsic_set_clk || !data->hsic)
> > +		return 0;
> > +	return usbmisc->ops->hsic_set_clk(data, on);
> > +}
> > +EXPORT_SYMBOL_GPL(imx_usbmisc_hsic_set_clk);
> >  static const struct of_device_id usbmisc_imx_dt_ids[] =3D {
> >  	{
> >  		.compatible =3D "fsl,imx25-usbmisc",
>=20

--=20

Thanks,
Peter Chen=
