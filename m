Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA32D9FA89
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2019 08:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbfH1Gau (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Aug 2019 02:30:50 -0400
Received: from mail-eopbgr50049.outbound.protection.outlook.com ([40.107.5.49]:62114
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725951AbfH1Gau (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Aug 2019 02:30:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QL5f/N3jGJ/k2WVgkd8ShTXR30xPwMhQAKmxVzuDYC0oCuRGzifzzS54o9MrVQFY6czF/VNeuqgSixEKQg7XEX8MMgGnLmwpdH9UT8H4DDJ9zrnvgFKXG1irYRWOHYS/rLPYTbCuCDJx13oMag13AjO6NEvUPSY0jH5c9tuV6RmczplEMxbPKV6wmDXE/UvG4SIkndy4EQVwfrEtWGFYIhrAeu1IbVkihHp6kIvnTYx6uNwNtmz3RTaY/y+0qlhbiKLc02Yt8yl1vX7Vs1ife5kksooZbFHR2EOViLNwAWZ8RL1WbFJZeuFllbl0pQVGEoAnKWkyvlnDNkMCqrp6pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkeYMaJ75pr6WWA2czJYfSBTizeE5GORgBhbwHX+If8=;
 b=Fw9WgfDrAZHdvWSSBM49vEJ60OOkXdO8/e/YFraEhz/UfTdDzRjg4iphNzkbQn2eBnb9hl9Bta5vBugnz38R6YptO4ISEFVfSYfIr7bzNnXb0Z5HZYDuDwdOuQblP83a4aJAWB+XXQduuJow9UemEPrqfkkCaD5uniXC619xbiY5bVZrZEjRa5bYrS4ilF4xdUCF3pIu59G6n7L00TEO77nLIMluEQErTBXmyEQuLDg36Qq176D4v0SwSifGiJCU1dOAzGtzBZ8klFGIexUtWhDnxiScTmSWJOXb8Ujjg5Q07DLPXGcSN7lmd8G8FgJiYrrULrRlX3I/eLNEAIIdag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkeYMaJ75pr6WWA2czJYfSBTizeE5GORgBhbwHX+If8=;
 b=gkmakzaKGENid3MSVcxmCLlAEFLlGASDITJSzUaXyaFT7WxUifhYEzaRedODz8HYOqSuOMk3Gw/6Nu4/8XCrfNYKL1A4aqMEm3LKJRH6Ky1Y5p0WvfA/j/urrZWOzRCglhEP/TE56xQY4ZB0xBzgMUTUTtBhPk/0NqQ50Bb3hJs=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB7085.eurprd04.prod.outlook.com (10.186.156.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 06:30:41 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::e039:172d:fe77:320a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::e039:172d:fe77:320a%4]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 06:30:41 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jun Li <jun.li@nxp.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4] usb: chipidea: add role switch class support
Thread-Topic: [PATCH v4] usb: chipidea: add role switch class support
Thread-Index: AQHVW/nxS7ZiKb6Dqk+f0YNpHHOga6cQHEOA
Date:   Wed, 28 Aug 2019 06:30:40 +0000
Message-ID: <20190828063039.GA3309@b29397-desktop>
References: <20190826102512.14829-1-jun.li@nxp.com>
In-Reply-To: <20190826102512.14829-1-jun.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a51f5445-f351-49ba-4dd5-08d72b813f80
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:VI1PR04MB7085;
x-ms-traffictypediagnostic: VI1PR04MB7085:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB70850DACB22216751A9BA9178BA30@VI1PR04MB7085.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(199004)(189003)(71190400001)(5660300002)(33656002)(66476007)(66446008)(64756008)(81156014)(54906003)(71200400001)(66946007)(81166006)(66556008)(14444005)(256004)(91956017)(76116006)(2906002)(305945005)(66066001)(478600001)(33716001)(7736002)(1076003)(26005)(6436002)(9686003)(86362001)(476003)(44832011)(11346002)(6486002)(6512007)(14454004)(446003)(4326008)(486006)(229853002)(25786009)(53546011)(99286004)(6116002)(76176011)(8936002)(6506007)(102836004)(6862004)(53936002)(8676002)(6246003)(316002)(186003)(3846002)(6636002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB7085;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xYo7Jxuae6i9PJ1oZhn8/mYQjt/xqDyBv3Dyjt+++cANcsCklBpmUAjvip6rk3NJ+njmk+y67sjiSj0y9nC4QZtwE44yS9t9c7W3suegOzQqIKglI0RnNtkBPI+GIgF1tOUoqAUDkrSoSFK6FHcVhCznQVdK/G2GEIRDXR61uGIrz9qPRV1KO0/Qc8teWttm/fxhwVzRfq3F6ACiDS+i+QAM7HIzPTFguGmcH4zWFktwVniXfMnSXTG6pTBKfMsIyJeoUVEpj1gkw2EAy1IEMcOFyF9I8pl/sErMNhxaOyezaWKnLr91vUCgQN+/BrCZwcOpbo53t2+uywkYQfHxCXxYApdW5WJuciSUvPtpsWLacKQLkajZ40+wpybGCuH9cQGiqBKI5USFmqlbGDxsAo0hcyHTvjmerPdZdwGhCL4=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CF2B4962F7E96C4F9E296EE5927B822D@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a51f5445-f351-49ba-4dd5-08d72b813f80
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 06:30:41.0384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XGwyDG0xB08Qticd7bYo2arzboPFyXU0lsJk17PC8f1yTzq6EfZ6kn9ccKEkY57qHm9k+6DJAfz53IFmtufGgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7085
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19-08-26 18:25:12, jun.li@nxp.com wrote:
> From: Li Jun <jun.li@nxp.com>
>=20
> USB role is fully controlled by usb role switch consumer(e.g. typec),
> usb port can be at host mode(USB_ROLE_HOST), device mode connected to
> host(USB_ROLE_DEVICE), or not connecting any partner(USB_ROLE_NONE).
>=20
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
> changes for v4:
> - Add spinlock for role set().
> - Select USB_ROLE_SWITCH to fix build break.
> - Add runtime PM for role set.=20
> - Do flash_workqueue only in case both stop and start required
>   for role set, means role change directly from device to host
>   or vice versa.
>=20
> Changes for v3:
> - Remove the patch usb: chipidea: replace ci_role with usb_role
>   as the existing ci->role usage can't map to usb_role.
> - Use the suggested ci_hdrc_cable for reuse current role change
>   handling.
> - Fix build robot warning by add usb_role head file.
>=20
> Change for v2:
> - Support USB_ROLE_NONE, which for usb port not connecting any
>   device or host, and will be in low power mode.
>=20
>  drivers/usb/chipidea/Kconfig |  1 +
>  drivers/usb/chipidea/ci.h    | 12 +++++++
>  drivers/usb/chipidea/core.c  | 83 ++++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/usb/chipidea/otg.c   |  8 ++---
>  4 files changed, 100 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
> index eb37ebf..ae850b3 100644
> --- a/drivers/usb/chipidea/Kconfig
> +++ b/drivers/usb/chipidea/Kconfig
> @@ -6,6 +6,7 @@ config USB_CHIPIDEA
>  	select EXTCON
>  	select RESET_CONTROLLER
>  	select USB_ULPI_BUS
> +	select USB_ROLE_SWITCH
>  	help
>  	  Say Y here if your system has a dual role high speed USB
>  	  controller based on ChipIdea silicon IP. It supports:
> diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
> index 6a2cc5c..6911aef 100644
> --- a/drivers/usb/chipidea/ci.h
> +++ b/drivers/usb/chipidea/ci.h
> @@ -16,6 +16,7 @@
>  #include <linux/usb/gadget.h>
>  #include <linux/usb/otg-fsm.h>
>  #include <linux/usb/otg.h>
> +#include <linux/usb/role.h>
>  #include <linux/ulpi/interface.h>
> =20
>  /***********************************************************************=
*******
> @@ -217,6 +218,7 @@ struct ci_hdrc {
>  	ktime_t				hr_timeouts[NUM_OTG_FSM_TIMERS];
>  	unsigned			enabled_otg_timer_bits;
>  	enum otg_fsm_timer		next_otg_timer;
> +	struct usb_role_switch		*role_switch;
>  	struct work_struct		work;
>  	struct workqueue_struct		*wq;
> =20
> @@ -290,6 +292,16 @@ static inline void ci_role_stop(struct ci_hdrc *ci)
>  	ci->roles[role]->stop(ci);
>  }
> =20
> +static inline enum usb_role ci_role_to_usb_role(struct ci_hdrc *ci)
> +{
> +	if (ci->role =3D=3D CI_ROLE_HOST)
> +		return USB_ROLE_HOST;
> +	else if (ci->role =3D=3D CI_ROLE_GADGET && ci->vbus_active)
> +		return USB_ROLE_DEVICE;
> +	else
> +		return USB_ROLE_NONE;
> +}
> +
>  /**
>   * hw_read_id_reg: reads from a identification register
>   * @ci: the controller
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 26062d6..bfc6a18 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -600,6 +600,71 @@ static int ci_cable_notifier(struct notifier_block *=
nb, unsigned long event,
>  	return NOTIFY_DONE;
>  }
> =20
> +static enum usb_role ci_usb_role_switch_get(struct device *dev)
> +{
> +	struct ci_hdrc *ci =3D dev_get_drvdata(dev);
> +	enum usb_role role;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ci->lock, flags);
> +	role =3D ci_role_to_usb_role(ci);
> +	spin_unlock_irqrestore(&ci->lock, flags);
> +
> +	return role;
> +}
> +
> +static int ci_usb_role_switch_set(struct device *dev, enum usb_role role=
)
> +{
> +	struct ci_hdrc *ci =3D dev_get_drvdata(dev);
> +	struct ci_hdrc_cable *cable =3D NULL;
> +	enum usb_role current_role =3D ci_role_to_usb_role(ci);
> +	unsigned long flags;
> +
> +	if (current_role =3D=3D role)
> +		return 0;
> +
> +	pm_runtime_get_sync(ci->dev);
> +	/* Stop current role */
> +	spin_lock_irqsave(&ci->lock, flags);
> +	if (current_role =3D=3D USB_ROLE_DEVICE)
> +		cable =3D &ci->platdata->vbus_extcon;
> +	else if (current_role =3D=3D USB_ROLE_HOST)
> +		cable =3D &ci->platdata->id_extcon;
> +
> +	if (cable) {
> +		cable->changed =3D true;
> +		cable->connected =3D false;
> +		ci_irq(ci->irq, ci);
> +		spin_unlock_irqrestore(&ci->lock, flags);
> +		if (ci->wq && role !=3D USB_ROLE_NONE)
> +			flush_workqueue(ci->wq);
> +		spin_lock_irqsave(&ci->lock, flags);
> +	}
> +
> +	cable =3D NULL;
> +
> +	/* Start target role */
> +	if (role =3D=3D USB_ROLE_DEVICE)
> +		cable =3D &ci->platdata->vbus_extcon;
> +	else if (role =3D=3D USB_ROLE_HOST)
> +		cable =3D &ci->platdata->id_extcon;
> +
> +	if (cable) {
> +		cable->changed =3D true;
> +		cable->connected =3D true;
> +		ci_irq(ci->irq, ci);
> +	}
> +	spin_unlock_irqrestore(&ci->lock, flags);
> +	pm_runtime_put_sync(ci->dev);
> +
> +	return 0;
> +}
> +
> +static struct usb_role_switch_desc ci_role_switch =3D {
> +	.set =3D ci_usb_role_switch_set,
> +	.get =3D ci_usb_role_switch_get,
> +};
> +
>  static int ci_get_platdata(struct device *dev,
>  		struct ci_hdrc_platform_data *platdata)
>  {
> @@ -726,6 +791,9 @@ static int ci_get_platdata(struct device *dev,
>  			cable->connected =3D false;
>  	}
> =20
> +	if (device_property_read_bool(dev, "usb-role-switch"))
> +		ci_role_switch.fwnode =3D dev->fwnode;
> +
>  	platdata->pctl =3D devm_pinctrl_get(dev);
>  	if (!IS_ERR(platdata->pctl)) {
>  		struct pinctrl_state *p;
> @@ -1051,6 +1119,15 @@ static int ci_hdrc_probe(struct platform_device *p=
dev)
>  		}
>  	}
> =20
> +	if (ci_role_switch.fwnode) {
> +		ci->role_switch =3D usb_role_switch_register(dev,
> +					&ci_role_switch);
> +		if (IS_ERR(ci->role_switch)) {
> +			ret =3D PTR_ERR(ci->role_switch);
> +			goto deinit_otg;
> +		}
> +	}
> +
>  	if (ci->roles[CI_ROLE_HOST] && ci->roles[CI_ROLE_GADGET]) {
>  		if (ci->is_otg) {
>  			ci->role =3D ci_otg_role(ci);
> @@ -1115,6 +1192,9 @@ static int ci_hdrc_probe(struct platform_device *pd=
ev)
>  remove_debug:
>  	dbg_remove_files(ci);
>  stop:
> +	if (ci->role_switch)
> +		usb_role_switch_unregister(ci->role_switch);
> +deinit_otg:
>  	if (ci->is_otg && ci->roles[CI_ROLE_GADGET])
>  		ci_hdrc_otg_destroy(ci);
>  deinit_gadget:
> @@ -1133,6 +1213,9 @@ static int ci_hdrc_remove(struct platform_device *p=
dev)
>  {
>  	struct ci_hdrc *ci =3D platform_get_drvdata(pdev);
> =20
> +	if (ci->role_switch)
> +		usb_role_switch_unregister(ci->role_switch);
> +
>  	if (ci->supports_runtime_pm) {
>  		pm_runtime_get_sync(&pdev->dev);
>  		pm_runtime_disable(&pdev->dev);
> diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> index f25d482..fbfb02e 100644
> --- a/drivers/usb/chipidea/otg.c
> +++ b/drivers/usb/chipidea/otg.c
> @@ -35,7 +35,7 @@ u32 hw_read_otgsc(struct ci_hdrc *ci, u32 mask)
>  	 * detection overwrite OTGSC register value
>  	 */
>  	cable =3D &ci->platdata->vbus_extcon;
> -	if (!IS_ERR(cable->edev)) {
> +	if (!IS_ERR(cable->edev) || ci->role_switch) {
>  		if (cable->changed)
>  			val |=3D OTGSC_BSVIS;
>  		else
> @@ -53,7 +53,7 @@ u32 hw_read_otgsc(struct ci_hdrc *ci, u32 mask)
>  	}
> =20
>  	cable =3D &ci->platdata->id_extcon;
> -	if (!IS_ERR(cable->edev)) {
> +	if (!IS_ERR(cable->edev) || ci->role_switch) {
>  		if (cable->changed)
>  			val |=3D OTGSC_IDIS;
>  		else
> @@ -83,7 +83,7 @@ void hw_write_otgsc(struct ci_hdrc *ci, u32 mask, u32 d=
ata)
>  	struct ci_hdrc_cable *cable;
> =20
>  	cable =3D &ci->platdata->vbus_extcon;
> -	if (!IS_ERR(cable->edev)) {
> +	if (!IS_ERR(cable->edev) || ci->role_switch) {
>  		if (data & mask & OTGSC_BSVIS)
>  			cable->changed =3D false;
> =20
> @@ -97,7 +97,7 @@ void hw_write_otgsc(struct ci_hdrc *ci, u32 mask, u32 d=
ata)
>  	}
> =20
>  	cable =3D &ci->platdata->id_extcon;
> -	if (!IS_ERR(cable->edev)) {
> +	if (!IS_ERR(cable->edev) || ci->role_switch) {
>  		if (data & mask & OTGSC_IDIS)
>  			cable->changed =3D false;
> =20
> --=20
> 2.7.4
>=20

Applied, thanks.

Peter=
