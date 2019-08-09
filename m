Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF9F6876F6
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 12:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405641AbfHIKL0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 06:11:26 -0400
Received: from mail-eopbgr00077.outbound.protection.outlook.com ([40.107.0.77]:40601
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726152AbfHIKL0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Aug 2019 06:11:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9hpBytpZ6hKdMq/sWPMnSl9uSQx6qbNYwY/JQ7T2DIAh+i2pIfjXTfovq3Jc6XCwBkbYeYcipPTSjvDt4hbU9jDyldRIzmOZgIhAfmy2b089bunfYEDjaDEQd5sA5OXyuvxw+1r1Q/JmXoDOjmHKgx8Ep9v+6+qXo20kuXtpcZwWNwM5vsY++Z7n2UIY+HVObAtBmZNswCRBpYJutnHxKodyhtuD2kN+AFW3aPUZ6D8a/IHFgA0lnR9r4xjNs7lcnVOUHgjJLCvrHVg98z+zfWYJUWZpANK4Lb90GaNRbPsakX4W2bMrJ1cgMaA5XYw4QQj76aprpGjRoaN8fILzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdKUy1mPvbjs+qmiUzeVNQfXXzAPzZwDrmUXk6pWAsg=;
 b=m8tKqyJXtDMiRhLw/fJgDy82n3q4AKQqzG1nrD73H+HOlJTIdGHQkn2RHBAhcfVOjIqnlWEvCqrBzemOc6umG9COfPStXc/2emhcmFpc88sJSTUoMAVTcQoWSLiyvsZsGOMe7656koGKt8LkoVUfm+Y3tszp5gDvhN/rFeU59z8e5wjcIrqpY4RTiVqN2gY1Jz2cpjR7t7EDmggw2YNUJJWPNUFwWaVWZH8QJl0xFqC4dTG+GuhnUKVHahjwvizeeBEHGeRZGQ+rTbMgiaxBBKNx1Pk7xtSRFylejBBIU4uIeIZ/yNVkQmoh1rjH962qlcuAAJ3Rqr8tiqUASgTFDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdKUy1mPvbjs+qmiUzeVNQfXXzAPzZwDrmUXk6pWAsg=;
 b=l7/I+R0E2idqDNYxjrF2S3bEfInT1wICsaYM/rsMYqnJ7NsbewgCh9AN2TFpVpCu6STV0d5OxhkWirG+2CpaEzGc5nBq5k8Kr9LXDTfSByl8lo3sWVRTPeYP/MKC1hVjmK6QTFxaQ6NAOfws0dKQWLnuEJzJNItJYVh/fK/w3mA=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB7103.eurprd04.prod.outlook.com (10.186.156.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Fri, 9 Aug 2019 10:11:21 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::81ec:c8ec:54d9:5dc5]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::81ec:c8ec:54d9:5dc5%2]) with mapi id 15.20.2136.018; Fri, 9 Aug 2019
 10:11:21 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jun Li <jun.li@nxp.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] usb: chipidea: add role switch class support
Thread-Topic: [PATCH v2 2/2] usb: chipidea: add role switch class support
Thread-Index: AQHVTPJjXqP2r2y4kUylXokWc1V0wqbw8aPwgAF89YCAACk4sA==
Date:   Fri, 9 Aug 2019 10:11:21 +0000
Message-ID: <VI1PR04MB53273F9BF23D54B1AC94439B8BD60@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20190807072342.9700-1-jun.li@nxp.com>
 <20190807072342.9700-2-jun.li@nxp.com>
 <VI1PR04MB5327D34EE7561F16C4FE168D8BD70@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <VE1PR04MB65283C481B16F8AA45C2D53D89D60@VE1PR04MB6528.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB65283C481B16F8AA45C2D53D89D60@VE1PR04MB6528.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc60926c-b35f-4336-da4a-08d71cb1edb7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB7103;
x-ms-traffictypediagnostic: VI1PR04MB7103:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB7103457434F543D390C9A8668BD60@VI1PR04MB7103.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(136003)(39860400002)(346002)(396003)(189003)(199004)(25786009)(7696005)(76176011)(6862004)(6506007)(102836004)(5660300002)(966005)(7736002)(305945005)(66066001)(14444005)(256004)(8936002)(71200400001)(71190400001)(55016002)(6246003)(53936002)(478600001)(44832011)(4326008)(66946007)(316002)(76116006)(81156014)(66446008)(6116002)(446003)(11346002)(26005)(64756008)(66556008)(66476007)(81166006)(476003)(186003)(54906003)(6306002)(52536014)(9686003)(14454004)(229853002)(6436002)(74316002)(6636002)(2906002)(486006)(33656002)(99286004)(3846002)(86362001)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB7103;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6wSMr1P1SSZ3+ghHBcpfz3PZb1P5FCJBjizJ9kVDNHl0ZtP4rpp8LlmcmsoDr7i8ZcgOMdQTGJIxEPJVd9DhLeYjoiUrM+5sv+KtholCfVHUrm98yErxkN5HqvqZ05ZAQywUmc/aBokOmWmxLZkHNIWA3zR6tL26dFL/Uqyls4f2lfkwWrZtmZ6smpEr6fD1NUYmjMG0IARrTRm5wUWJRsnZawIFgRw0pvsMVUgRXNxtjJ9uwyJliqTil2bujAlVYS9lV35kQO+MWcbfLOwvsOJto9MQn+9Nk4wS8bwSPUT0mOjTRLTzLRORrrosysBQvl1pkCdPuxD23boHzswaMjuqA2y3+4kJIIxH51EdKOdB9hARBm0TFgX+QHtL0NcOyq1gV9V/MT9ugXgnpuYnmIHOt9SwlXtV+rNHZDWU/6M=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc60926c-b35f-4336-da4a-08d71cb1edb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 10:11:21.8163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peter.chen@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7103
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> > > USB role is fully controlled by usb role switch consumer(e.g.
> > > typec), usb port can be at host mode(USB_ROLE_HOST), device mode
> > > connected to host(USB_ROLE_DEVICE), or not connecting any
> parter(USB_ROLE_NONE).
> > >
> >
> > %s/parter/partner ?
>=20
> Yes, I will update.
>=20
> >
> > Are there any ways you could get external cable status from usb-switch
> > or type-c like external connector? If there are, you could update
> > otgsc value for otgsc_read, or change cable status, and avoid changing =
common
> handling, like ci_hdrc_probe and  ci_otg_work.
> > And it could benefit for other use cases, like booting with cable
> > connected and switch role through /sys.
>=20
> The new role switch class has nothing to do with extcon, it's using graph=
 bindings to
> link the connection, so there is no extcon_dev, change for ci_hdrc_probe(=
) is
> required as property usb-role-switch has to be specified, there may be so=
me code
> reuse if still touch the external cable even no extcon dev, but that will=
 make existing
> external cable complicated and not clean.
>=20

I don't mean using extcon directly.

At ci_usb_role_switch_set, you could know current "id" and "vbus" status.
as well as if "id" and "vbus" has changed. So, you could update ci->id_even=
t
or ci->vbus_event. And at otgsc_read, you could return correct vbus and id =
value.

So, you may not need to change main function for ci_otg_work, for ci_hdrc_p=
robe,
you could only need to register usb-switch class.

Surely, you may need to introduce some structures or variables for usb swit=
ch, but
it could keep main structure not changing, and just differentiate the way t=
o get
id and vbus.


> On the other hand, a new GPIO based role switch driver is on review:
> https://patchwork.kernel.org/patch/11056379/
> Seems this is the direction to move out from extcon.
>=20

If external connector is given up, we need to use that.

When you update the v3, please fix the build error reported by kbuild test =
robot.

Peter=09

> Li Jun
> >
> > Peter
> >
> > > Signed-off-by: Li Jun <jun.li@nxp.com>
> > > ---
> > >
> > > Change for v2:
> > > - Support USB_ROLE_NONE, which for usb port not connecting any
> > >   device or host, and will be in low power mode.
> > >
> > >  drivers/usb/chipidea/ci.h   |   3 ++
> > >  drivers/usb/chipidea/core.c | 120
> > > +++++++++++++++++++++++++++++++++-------
> > > ----
> > >  drivers/usb/chipidea/otg.c  |  20 ++++++++
> > >  3 files changed, 114 insertions(+), 29 deletions(-)
> > >
> > > diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
> > > index 82b86cd..f0aec1d 100644
> > > --- a/drivers/usb/chipidea/ci.h
> > > +++ b/drivers/usb/chipidea/ci.h
> > > @@ -205,6 +205,7 @@ struct ci_hdrc {
> > >  	int				irq;
> > >  	struct ci_role_driver		*roles[USB_ROLE_DEVICE + 1];
> > >  	enum usb_role			role;
> > > +	enum usb_role			target_role;
> > >  	bool				is_otg;
> > >  	struct usb_otg			otg;
> > >  	struct otg_fsm			fsm;
> > > @@ -212,6 +213,7 @@ struct ci_hdrc {
> > >  	ktime_t
> > > 	hr_timeouts[NUM_OTG_FSM_TIMERS];
> > >  	unsigned			enabled_otg_timer_bits;
> > >  	enum otg_fsm_timer		next_otg_timer;
> > > +	struct usb_role_switch		*role_switch;
> > >  	struct work_struct		work;
> > >  	struct workqueue_struct		*wq;
> > >
> > > @@ -244,6 +246,7 @@ struct ci_hdrc {
> > >  	struct dentry			*debugfs;
> > >  	bool				id_event;
> > >  	bool				b_sess_valid_event;
> > > +	bool				role_switch_event;
> > >  	bool				imx28_write_fix;
> > >  	bool				supports_runtime_pm;
> > >  	bool				in_lpm;
> > > diff --git a/drivers/usb/chipidea/core.c
> > > b/drivers/usb/chipidea/core.c index
> > > bc24c5b..965ce17 100644
> > > --- a/drivers/usb/chipidea/core.c
> > > +++ b/drivers/usb/chipidea/core.c
> > > @@ -587,6 +587,42 @@ static irqreturn_t ci_irq(int irq, void *data)
> > >  	return ret;
> > >  }
> > >
> > > +static int ci_usb_role_switch_set(struct device *dev, enum usb_role
> > > +role) {
> > > +	struct ci_hdrc *ci =3D dev_get_drvdata(dev);
> > > +	unsigned long flags;
> > > +
> > > +	if (ci->role =3D=3D role)
> > > +		return 0;
> > > +
> > > +	spin_lock_irqsave(&ci->lock, flags);
> > > +	ci->role_switch_event =3D true;
> > > +	ci->target_role =3D role;
> > > +	spin_unlock_irqrestore(&ci->lock, flags);
> > > +
> > > +	ci_otg_queue_work(ci);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static enum usb_role ci_usb_role_switch_get(struct device *dev) {
> > > +	struct ci_hdrc *ci =3D dev_get_drvdata(dev);
> > > +	unsigned long flags;
> > > +	enum usb_role role;
> > > +
> > > +	spin_lock_irqsave(&ci->lock, flags);
> > > +	role =3D ci->role;
> > > +	spin_unlock_irqrestore(&ci->lock, flags);
> > > +
> > > +	return role;
> > > +}
> > > +
> > > +static struct usb_role_switch_desc ci_role_switch =3D {
> > > +	.set =3D ci_usb_role_switch_set,
> > > +	.get =3D ci_usb_role_switch_get,
> > > +};
> > > +
> > >  static int ci_cable_notifier(struct notifier_block *nb, unsigned lon=
g event,
> > >  			     void *ptr)
> > >  {
> > > @@ -689,6 +725,9 @@ static int ci_get_platdata(struct device *dev,
> > >  	if (of_find_property(dev->of_node, "non-zero-ttctrl-ttha", NULL))
> > >  		platdata->flags |=3D CI_HDRC_SET_NON_ZERO_TTHA;
> > >
> > > +	if (device_property_read_bool(dev, "usb-role-switch"))
> > > +		ci_role_switch.fwnode =3D dev->fwnode;
> > > +
> > >  	ext_id =3D ERR_PTR(-ENODEV);
> > >  	ext_vbus =3D ERR_PTR(-ENODEV);
> > >  	if (of_property_read_bool(dev->of_node, "extcon")) { @@ -908,6
> > > +947,43 @@ static const struct attribute_group ci_attr_group =3D {
> > >  	.attrs =3D ci_attrs,
> > >  };
> > >
> > > +static int ci_start_initial_role(struct ci_hdrc *ci) {
> > > +	int ret =3D 0;
> > > +
> > > +	if (ci->roles[USB_ROLE_HOST] && ci->roles[USB_ROLE_DEVICE]) {
> > > +		if (ci->is_otg) {
> > > +			ci->role =3D ci_otg_role(ci);
> > > +			/* Enable ID change irq */
> > > +			hw_write_otgsc(ci, OTGSC_IDIE, OTGSC_IDIE);
> > > +		} else {
> > > +			/*
> > > +			 * If the controller is not OTG capable, but support
> > > +			 * role switch, the defalt role is gadget, and the
> > > +			 * user can switch it through debugfs.
> > > +			 */
> > > +			ci->role =3D USB_ROLE_DEVICE;
> > > +		}
> > > +	} else {
> > > +		ci->role =3D ci->roles[USB_ROLE_HOST]
> > > +			? USB_ROLE_HOST
> > > +			: USB_ROLE_DEVICE;
> > > +	}
> > > +
> > > +	if (!ci_otg_is_fsm_mode(ci)) {
> > > +		/* only update vbus status for peripheral */
> > > +		if (ci->role =3D=3D USB_ROLE_DEVICE)
> > > +			ci_handle_vbus_change(ci);
> > > +
> > > +		ret =3D ci_role_start(ci, ci->role);
> > > +		if (ret)
> > > +			dev_err(ci->dev, "can't start %s role\n",
> > > +						ci_role(ci)->name);
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > >  static int ci_hdrc_probe(struct platform_device *pdev)  {
> > >  	struct device	*dev =3D &pdev->dev;
> > > @@ -1051,36 +1127,10 @@ static int ci_hdrc_probe(struct platform_devi=
ce
> *pdev)
> > >  		}
> > >  	}
> > >
> > > -	if (ci->roles[USB_ROLE_HOST] && ci->roles[USB_ROLE_DEVICE]) {
> > > -		if (ci->is_otg) {
> > > -			ci->role =3D ci_otg_role(ci);
> > > -			/* Enable ID change irq */
> > > -			hw_write_otgsc(ci, OTGSC_IDIE, OTGSC_IDIE);
> > > -		} else {
> > > -			/*
> > > -			 * If the controller is not OTG capable, but support
> > > -			 * role switch, the defalt role is gadget, and the
> > > -			 * user can switch it through debugfs.
> > > -			 */
> > > -			ci->role =3D USB_ROLE_DEVICE;
> > > -		}
> > > -	} else {
> > > -		ci->role =3D ci->roles[USB_ROLE_HOST]
> > > -			? USB_ROLE_HOST
> > > -			: USB_ROLE_DEVICE;
> > > -	}
> > > -
> > > -	if (!ci_otg_is_fsm_mode(ci)) {
> > > -		/* only update vbus status for peripheral */
> > > -		if (ci->role =3D=3D USB_ROLE_DEVICE)
> > > -			ci_handle_vbus_change(ci);
> > > -
> > > -		ret =3D ci_role_start(ci, ci->role);
> > > -		if (ret) {
> > > -			dev_err(dev, "can't start %s role\n",
> > > -						ci_role(ci)->name);
> > > +	if (!ci_role_switch.fwnode) {
> > > +		ret =3D ci_start_initial_role(ci);
> > > +		if (ret)
> > >  			goto stop;
> > > -		}
> > >  	}
> > >
> > >  	ret =3D devm_request_irq(dev, ci->irq, ci_irq, IRQF_SHARED, @@
> > > -1092,6
> > > +1142,15 @@ static int ci_hdrc_probe(struct platform_device *pdev)
> > >  	if (ret)
> > >  		goto stop;
> > >
> > > +	if (ci_role_switch.fwnode) {
> > > +		ci->role_switch =3D usb_role_switch_register(dev,
> > > +					&ci_role_switch);
> > > +		if (IS_ERR(ci->role_switch)) {
> > > +			ret =3D PTR_ERR(ci->role_switch);
> > > +			goto stop;
> > > +		}
> > > +	}
> > > +
> > >  	if (ci->supports_runtime_pm) {
> > >  		pm_runtime_set_active(&pdev->dev);
> > >  		pm_runtime_enable(&pdev->dev);
> > > @@ -1133,6 +1192,9 @@ static int ci_hdrc_remove(struct
> > > platform_device
> > > *pdev) {
> > >  	struct ci_hdrc *ci =3D platform_get_drvdata(pdev);
> > >
> > > +	if (ci->role_switch)
> > > +		usb_role_switch_unregister(ci->role_switch);
> > > +
> > >  	if (ci->supports_runtime_pm) {
> > >  		pm_runtime_get_sync(&pdev->dev);
> > >  		pm_runtime_disable(&pdev->dev);
> > > diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> > > index
> > > 5bde0b5..03675b6 100644
> > > --- a/drivers/usb/chipidea/otg.c
> > > +++ b/drivers/usb/chipidea/otg.c
> > > @@ -214,6 +214,26 @@ static void ci_otg_work(struct work_struct *work=
)
> > >  		ci_handle_vbus_change(ci);
> > >  	}
> > >
> > > +	if (ci->role_switch_event) {
> > > +		ci->role_switch_event =3D false;
> > > +
> > > +		/* Stop current role */
> > > +		if (ci->role =3D=3D USB_ROLE_DEVICE) {
> > > +			usb_gadget_vbus_disconnect(&ci->gadget);
> > > +			ci->role =3D USB_ROLE_NONE;
> > > +		} else if (ci->role =3D=3D USB_ROLE_HOST) {
> > > +			ci_role_stop(ci);
> > > +		}
> > > +
> > > +		/* Start target role */
> > > +		if (ci->target_role =3D=3D USB_ROLE_DEVICE) {
> > > +			usb_gadget_vbus_connect(&ci->gadget);
> > > +			ci->role =3D USB_ROLE_DEVICE;
> > > +		} else if (ci->target_role =3D=3D USB_ROLE_HOST) {
> > > +			ci_role_start(ci, USB_ROLE_HOST);
> > > +		}
> > > +	}
> > > +
> > >  	pm_runtime_put_sync(ci->dev);
> > >
> > >  	enable_irq(ci->irq);
> > > --
> > > 2.7.4

