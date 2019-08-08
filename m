Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F343D85E4A
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 11:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732214AbfHHJbK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 05:31:10 -0400
Received: from mail-eopbgr80059.outbound.protection.outlook.com ([40.107.8.59]:15168
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731122AbfHHJbK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Aug 2019 05:31:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyD14vaQYCIjri4Tx8/giGuMJVuXCKhlhOO9n9O03ykvvc4AB4oJc9uQIYSpLAIqXgsaDMpSLGyX6tecLW4zjdkJVBECDR1rsUQqxWZWHswrx5IK8BlFFnhXMvHi+karoFbo3kDFqzFPXV7K5ii/K+Jb43tBkHMKp/sRvKhklGliyjZlGBgXmL+GNv8Nihk0CJZAOfBV3lXIU6xAn69LSlrhbGeB2njOY30ZtJqfR8pTpZuBWiMx1cHFcZd6RAOVXHJsepwTo5h52C0joYQqMxZHEyvK1awpj23K0pjOW+Y6wtqRzr1VWenLFC+A2nD29HhA+MYnD+2iVo2e48Uwwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7vRk8h0FYZqMpDQlhz9A9YHM+WF6tCOPJNVsXYtzF0=;
 b=mpdfAd1WSJsApiST/0zibnu4a7KZuVaWE9INrPKlX8T7tcDLfQoAgWji6r56UItYFZHbLZdODbLctFrueKsNnA/Zn9KMlZQb3X6Kkrz1KLYGDVAyJHkq0Y7HXfOuKO+u/grdQ/prMBX6YbJXcSGdyeDwX/9ryAORl1itqNzQTWb3Hg0okywY+LjTCf077sqFpziEU7yW2tr2Y/58txl5l86n7aPir96cjZ6d10Ey28SlruxzEmr4WlOCOdDA4b8iViPT4oNNCjn0OxYuWnRa236wwcZxIqyDckDMtgpSyw67C3mLTEbh3fqoVAE7oGu7atRxWYsT8n3wOR9xrtYUxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7vRk8h0FYZqMpDQlhz9A9YHM+WF6tCOPJNVsXYtzF0=;
 b=Hb3MupkvYDkuelb4QGBw6K4TZw1SQBR1blUPpPs+7Y4mULj/O4S6k2C3h6tcZ6yCFUPrff88dOWzuRJBS7x5b4WGC1rN9VFyrhhQad8mOjiKpTe/1cbZgpkCX1FvfG9h4UFxtIHEVnEti+OnI/0VDFn3ua7kRRYsfLR67+Brob0=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB4558.eurprd04.prod.outlook.com (20.177.55.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Thu, 8 Aug 2019 09:30:57 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::81ec:c8ec:54d9:5dc5]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::81ec:c8ec:54d9:5dc5%2]) with mapi id 15.20.2136.018; Thu, 8 Aug 2019
 09:30:57 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jun Li <jun.li@nxp.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>, dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] usb: chipidea: add role switch class support
Thread-Topic: [PATCH v2 2/2] usb: chipidea: add role switch class support
Thread-Index: AQHVTPJjXqP2r2y4kUylXokWc1V0wqbw8aPw
Date:   Thu, 8 Aug 2019 09:30:57 +0000
Message-ID: <VI1PR04MB5327D34EE7561F16C4FE168D8BD70@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20190807072342.9700-1-jun.li@nxp.com>
 <20190807072342.9700-2-jun.li@nxp.com>
In-Reply-To: <20190807072342.9700-2-jun.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09b6d5fd-b3e3-4eac-6869-08d71be31e6d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB4558;
x-ms-traffictypediagnostic: VI1PR04MB4558:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB4558A43B976EC49C442D4B628BD70@VI1PR04MB4558.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(199004)(189003)(6116002)(6862004)(81166006)(486006)(66946007)(81156014)(6246003)(476003)(3846002)(11346002)(446003)(229853002)(305945005)(7736002)(8936002)(55016002)(66446008)(53936002)(66476007)(9686003)(64756008)(66556008)(14444005)(256004)(52536014)(4326008)(76116006)(6636002)(8676002)(25786009)(5660300002)(44832011)(2906002)(54906003)(316002)(66066001)(6436002)(86362001)(71200400001)(71190400001)(478600001)(74316002)(14454004)(7696005)(33656002)(99286004)(6506007)(102836004)(76176011)(26005)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4558;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KVP5nextHuPD9TjSgyBQCM4TQcE+sdPLQ7DnYBWVXlV4cH/IlKeeusj4cbgIucpq0o1RRMnPXWAROLTKO0SLAClcDgfZAyse+dYk2xTflqsGUkh9XANWWZPye+kzCSgSnQH/tNPhztEwOYp1dCtgm/6sf3w2r9YNOr0cj1TVb/SIaKP21qrQE07bpK6Ul07+5p9c1PZNmhdPBqpIkabT29WA0tkLC+Kc2t755raA9PbMIDA/73TGQvXyLXEOkJoI3oX3DXgIopC09YUqnf/Ge31ItGIoHchfdtXTbx0S4XCHjeRgMNh513eds9hbRteMMvWJHLxSu37GYsN7pjPZn41EfIbHDWpj7ICc4RhGJCbf4sHt2X3OgHeEecoZHijHTbmY+/HRcJl6UxgjXdqNmATb2UlxvOSPPQU/mzgoUk8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b6d5fd-b3e3-4eac-6869-08d71be31e6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 09:30:57.6018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peter.chen@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4558
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> USB role is fully controlled by usb role switch consumer(e.g. typec), usb=
 port can be
> at host mode(USB_ROLE_HOST), device mode connected to
> host(USB_ROLE_DEVICE), or not connecting any parter(USB_ROLE_NONE).
>=20

%s/parter/partner ?

Are there any ways you could get external cable status from usb-switch or t=
ype-c like external
connector? If there are, you could update otgsc value for otgsc_read, or ch=
ange cable status,
and avoid changing common handling, like ci_hdrc_probe and  ci_otg_work. An=
d it could
benefit for other use cases, like booting with cable connected and switch r=
ole through /sys.

Peter

> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>=20
> Change for v2:
> - Support USB_ROLE_NONE, which for usb port not connecting any
>   device or host, and will be in low power mode.
>=20
>  drivers/usb/chipidea/ci.h   |   3 ++
>  drivers/usb/chipidea/core.c | 120 +++++++++++++++++++++++++++++++++-----=
--
> ----
>  drivers/usb/chipidea/otg.c  |  20 ++++++++
>  3 files changed, 114 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h index
> 82b86cd..f0aec1d 100644
> --- a/drivers/usb/chipidea/ci.h
> +++ b/drivers/usb/chipidea/ci.h
> @@ -205,6 +205,7 @@ struct ci_hdrc {
>  	int				irq;
>  	struct ci_role_driver		*roles[USB_ROLE_DEVICE + 1];
>  	enum usb_role			role;
> +	enum usb_role			target_role;
>  	bool				is_otg;
>  	struct usb_otg			otg;
>  	struct otg_fsm			fsm;
> @@ -212,6 +213,7 @@ struct ci_hdrc {
>  	ktime_t
> 	hr_timeouts[NUM_OTG_FSM_TIMERS];
>  	unsigned			enabled_otg_timer_bits;
>  	enum otg_fsm_timer		next_otg_timer;
> +	struct usb_role_switch		*role_switch;
>  	struct work_struct		work;
>  	struct workqueue_struct		*wq;
>=20
> @@ -244,6 +246,7 @@ struct ci_hdrc {
>  	struct dentry			*debugfs;
>  	bool				id_event;
>  	bool				b_sess_valid_event;
> +	bool				role_switch_event;
>  	bool				imx28_write_fix;
>  	bool				supports_runtime_pm;
>  	bool				in_lpm;
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c in=
dex
> bc24c5b..965ce17 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -587,6 +587,42 @@ static irqreturn_t ci_irq(int irq, void *data)
>  	return ret;
>  }
>=20
> +static int ci_usb_role_switch_set(struct device *dev, enum usb_role
> +role) {
> +	struct ci_hdrc *ci =3D dev_get_drvdata(dev);
> +	unsigned long flags;
> +
> +	if (ci->role =3D=3D role)
> +		return 0;
> +
> +	spin_lock_irqsave(&ci->lock, flags);
> +	ci->role_switch_event =3D true;
> +	ci->target_role =3D role;
> +	spin_unlock_irqrestore(&ci->lock, flags);
> +
> +	ci_otg_queue_work(ci);
> +
> +	return 0;
> +}
> +
> +static enum usb_role ci_usb_role_switch_get(struct device *dev) {
> +	struct ci_hdrc *ci =3D dev_get_drvdata(dev);
> +	unsigned long flags;
> +	enum usb_role role;
> +
> +	spin_lock_irqsave(&ci->lock, flags);
> +	role =3D ci->role;
> +	spin_unlock_irqrestore(&ci->lock, flags);
> +
> +	return role;
> +}
> +
> +static struct usb_role_switch_desc ci_role_switch =3D {
> +	.set =3D ci_usb_role_switch_set,
> +	.get =3D ci_usb_role_switch_get,
> +};
> +
>  static int ci_cable_notifier(struct notifier_block *nb, unsigned long ev=
ent,
>  			     void *ptr)
>  {
> @@ -689,6 +725,9 @@ static int ci_get_platdata(struct device *dev,
>  	if (of_find_property(dev->of_node, "non-zero-ttctrl-ttha", NULL))
>  		platdata->flags |=3D CI_HDRC_SET_NON_ZERO_TTHA;
>=20
> +	if (device_property_read_bool(dev, "usb-role-switch"))
> +		ci_role_switch.fwnode =3D dev->fwnode;
> +
>  	ext_id =3D ERR_PTR(-ENODEV);
>  	ext_vbus =3D ERR_PTR(-ENODEV);
>  	if (of_property_read_bool(dev->of_node, "extcon")) { @@ -908,6 +947,43
> @@ static const struct attribute_group ci_attr_group =3D {
>  	.attrs =3D ci_attrs,
>  };
>=20
> +static int ci_start_initial_role(struct ci_hdrc *ci) {
> +	int ret =3D 0;
> +
> +	if (ci->roles[USB_ROLE_HOST] && ci->roles[USB_ROLE_DEVICE]) {
> +		if (ci->is_otg) {
> +			ci->role =3D ci_otg_role(ci);
> +			/* Enable ID change irq */
> +			hw_write_otgsc(ci, OTGSC_IDIE, OTGSC_IDIE);
> +		} else {
> +			/*
> +			 * If the controller is not OTG capable, but support
> +			 * role switch, the defalt role is gadget, and the
> +			 * user can switch it through debugfs.
> +			 */
> +			ci->role =3D USB_ROLE_DEVICE;
> +		}
> +	} else {
> +		ci->role =3D ci->roles[USB_ROLE_HOST]
> +			? USB_ROLE_HOST
> +			: USB_ROLE_DEVICE;
> +	}
> +
> +	if (!ci_otg_is_fsm_mode(ci)) {
> +		/* only update vbus status for peripheral */
> +		if (ci->role =3D=3D USB_ROLE_DEVICE)
> +			ci_handle_vbus_change(ci);
> +
> +		ret =3D ci_role_start(ci, ci->role);
> +		if (ret)
> +			dev_err(ci->dev, "can't start %s role\n",
> +						ci_role(ci)->name);
> +	}
> +
> +	return ret;
> +}
> +
>  static int ci_hdrc_probe(struct platform_device *pdev)  {
>  	struct device	*dev =3D &pdev->dev;
> @@ -1051,36 +1127,10 @@ static int ci_hdrc_probe(struct platform_device *=
pdev)
>  		}
>  	}
>=20
> -	if (ci->roles[USB_ROLE_HOST] && ci->roles[USB_ROLE_DEVICE]) {
> -		if (ci->is_otg) {
> -			ci->role =3D ci_otg_role(ci);
> -			/* Enable ID change irq */
> -			hw_write_otgsc(ci, OTGSC_IDIE, OTGSC_IDIE);
> -		} else {
> -			/*
> -			 * If the controller is not OTG capable, but support
> -			 * role switch, the defalt role is gadget, and the
> -			 * user can switch it through debugfs.
> -			 */
> -			ci->role =3D USB_ROLE_DEVICE;
> -		}
> -	} else {
> -		ci->role =3D ci->roles[USB_ROLE_HOST]
> -			? USB_ROLE_HOST
> -			: USB_ROLE_DEVICE;
> -	}
> -
> -	if (!ci_otg_is_fsm_mode(ci)) {
> -		/* only update vbus status for peripheral */
> -		if (ci->role =3D=3D USB_ROLE_DEVICE)
> -			ci_handle_vbus_change(ci);
> -
> -		ret =3D ci_role_start(ci, ci->role);
> -		if (ret) {
> -			dev_err(dev, "can't start %s role\n",
> -						ci_role(ci)->name);
> +	if (!ci_role_switch.fwnode) {
> +		ret =3D ci_start_initial_role(ci);
> +		if (ret)
>  			goto stop;
> -		}
>  	}
>=20
>  	ret =3D devm_request_irq(dev, ci->irq, ci_irq, IRQF_SHARED, @@ -1092,6
> +1142,15 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto stop;
>=20
> +	if (ci_role_switch.fwnode) {
> +		ci->role_switch =3D usb_role_switch_register(dev,
> +					&ci_role_switch);
> +		if (IS_ERR(ci->role_switch)) {
> +			ret =3D PTR_ERR(ci->role_switch);
> +			goto stop;
> +		}
> +	}
> +
>  	if (ci->supports_runtime_pm) {
>  		pm_runtime_set_active(&pdev->dev);
>  		pm_runtime_enable(&pdev->dev);
> @@ -1133,6 +1192,9 @@ static int ci_hdrc_remove(struct platform_device *p=
dev)
> {
>  	struct ci_hdrc *ci =3D platform_get_drvdata(pdev);
>=20
> +	if (ci->role_switch)
> +		usb_role_switch_unregister(ci->role_switch);
> +
>  	if (ci->supports_runtime_pm) {
>  		pm_runtime_get_sync(&pdev->dev);
>  		pm_runtime_disable(&pdev->dev);
> diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c inde=
x
> 5bde0b5..03675b6 100644
> --- a/drivers/usb/chipidea/otg.c
> +++ b/drivers/usb/chipidea/otg.c
> @@ -214,6 +214,26 @@ static void ci_otg_work(struct work_struct *work)
>  		ci_handle_vbus_change(ci);
>  	}
>=20
> +	if (ci->role_switch_event) {
> +		ci->role_switch_event =3D false;
> +
> +		/* Stop current role */
> +		if (ci->role =3D=3D USB_ROLE_DEVICE) {
> +			usb_gadget_vbus_disconnect(&ci->gadget);
> +			ci->role =3D USB_ROLE_NONE;
> +		} else if (ci->role =3D=3D USB_ROLE_HOST) {
> +			ci_role_stop(ci);
> +		}
> +
> +		/* Start target role */
> +		if (ci->target_role =3D=3D USB_ROLE_DEVICE) {
> +			usb_gadget_vbus_connect(&ci->gadget);
> +			ci->role =3D USB_ROLE_DEVICE;
> +		} else if (ci->target_role =3D=3D USB_ROLE_HOST) {
> +			ci_role_start(ci, USB_ROLE_HOST);
> +		}
> +	}
> +
>  	pm_runtime_put_sync(ci->dev);
>=20
>  	enable_irq(ci->irq);
> --
> 2.7.4

