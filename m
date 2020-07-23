Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2F6622A530
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 04:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387625AbgGWCTV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 22:19:21 -0400
Received: from mail-eopbgr60087.outbound.protection.outlook.com ([40.107.6.87]:43653
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387433AbgGWCTV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Jul 2020 22:19:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gaAUuREMQVK9CRdSRrxR78d8L/7lYIcqTgerQcApbviO+kPbGUthl5g19uIxa8aGTKk/yDiqXh7n6t/IN0zYtMxz65nD+A2i9yGwX9u0L/7Aw95kEFSBwFXm1gkmZe54BdxLu3PEXPZ6llw4Lxwb5uzD+FM8fgzp/S+SuDRklDnynls/hbgcKydkzrkEeMBXm63IF/4hkU+dn8bMbfIUPIU9rfhcus4jg0sq5mO1Iu83cxWvC+6B+GtHJNsRHkLpHXC0STcG82DejsUGY02axKI+AJ9sy4skida1Bk4CVbGvGjVGeEVkhJiTPclH6kal9CzthdN9xbso9GF/W7AEmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbSYGYn9kPuw2JEQMQU15e9KreQ4lyWKpfWmdOakOnM=;
 b=PkYEj3oVhX/8bO+p9FDrn6Jdnmg/eicMKCF89R062Oe26qCXXb2vcUZg/RMcS1pVvkLYEV73rnuCQFvnzpWl3Jsxiw/zneQKI3vc2JbCLRFEQeW8MLzwD01Pe+m8psG6NqUHXGLD8pfzBmXxEHw9v671geFW5tUI1XyxNq+bv0VAPrlQbXlp8R35FbsISx6IiUvEtwjJ0EkHKbIeU/SVMlq8LdOI95jOS/fZGn4e2mLUcjJl/TSmG4SaLUlUJhotbwtEm8gr9F0HouoF0PbPtIYTTnGOzDj+5FrcKNV7ISyD9XviOl6u2bCnZj8GZ1zXdtdkg8ho/4P19l8/Zqj3hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbSYGYn9kPuw2JEQMQU15e9KreQ4lyWKpfWmdOakOnM=;
 b=UeS3OhqZqpXs2FCJ1Ue/h9nj8E2redwp3UbECOhuQ1pBN9b+iqIPhHY6RZyT+GA7VRMVLEQfgRtBpOX6g+SNW0in/PKxxK72+qHqYeIsS6jt5AS2HBRbNDdHm98BYRPmEQjvrYUF9vvO7GsYP6Qpjse5aYqwgYOYvo+kBpQxGrU=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5736.eurprd04.prod.outlook.com (2603:10a6:20b:a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Thu, 23 Jul
 2020 02:19:17 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::539:3d00:4c6:c4a0]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::539:3d00:4c6:c4a0%3]) with mapi id 15.20.3216.023; Thu, 23 Jul 2020
 02:19:17 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Bastien Nocera <hadess@hadess.net>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] USB: Fix device driver race
Thread-Topic: [PATCH 1/2] USB: Fix device driver race
Thread-Index: AQHWYA0AzAqBUavxXE2biSfq3fmPF6kTuOQAgAAHeYCAAK7OAA==
Date:   Thu, 23 Jul 2020 02:19:17 +0000
Message-ID: <20200723021904.GA5798@b29397-desktop>
References: <20200722094628.4236-1-hadess@hadess.net>
 <20200722152640.GC1310843@rowland.harvard.edu>
 <407a8732f7e124e623f8687729d4d4775dd8ab27.camel@hadess.net>
In-Reply-To: <407a8732f7e124e623f8687729d4d4775dd8ab27.camel@hadess.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: hadess.net; dkim=none (message not signed)
 header.d=none;hadess.net; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5c532ee4-e315-429f-2913-08d82eaecd2a
x-ms-traffictypediagnostic: AM6PR04MB5736:
x-microsoft-antispam-prvs: <AM6PR04MB5736F8C67DD3A673CB8621498B760@AM6PR04MB5736.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0Kc++GpKgskckvl6HrxmgoVBWcE7vlA8iGuRFOrTf5tbxGWaw/Cx4u1NCIGUh5fkbQwEp6GVXa9MuF8IrjQwrRsc5dP5RhbdfetCsS1jEsEJ5oDNaBoPZwRHrfT3vF0IxCUJulbdxDNYNVy+ZqQRUUGb4/YTn6bH86JO59kCfEEbwrt6XkgDXQUlAeSaTqjRpkA5+rv1ZDb+gjOHj8dIANewf4UnTDLLqK4Tfj675iMZQdcj0DPKMy5EbH4i4RjwSZ6SBDK0PjRIuR6hE8PlW24YGBLFbs4uxvDw0Ig+CMxJ+UFZAtG9OI82TqdPHuhlqEMp3N6VEP9K0w5jfgOVcQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(39860400002)(396003)(366004)(346002)(376002)(136003)(33656002)(33716001)(54906003)(26005)(316002)(1076003)(71200400001)(8936002)(2906002)(86362001)(5660300002)(4326008)(66556008)(64756008)(6486002)(478600001)(6916009)(6512007)(8676002)(9686003)(186003)(76116006)(91956017)(66946007)(83380400001)(66476007)(44832011)(6506007)(66446008)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: A2OQl5+qXOA5g9FiVG8UXZxcmigW3L3Fy0LQys+FKz3W9oiluOJd9rWsKxTWYFJRDWIkXllLFYjBie17fwOflMtVHMMx9F3/ClwuDVnING63/d/SgRHkKs12g6GQuv7YVZR6Tmg1QurF7p8h5++UIINHT3ZpaG0KACIyge16VGE/QWKyVu+blObYxi3/WWcP1x2oCm0RJPzaSQCKAGzWixeelT6EGvzEc1/REthLmaryHVrTBh9qiUKtCLj/LyXaXIycgcPvBh5pAImsgEUPAsr9dJQ4SbqmAmNivSLAZ6Vs43u0qlip8LAEI4pWnGVrWD7O5PdaBCd6PH6/P7jSYi31lmOIxKSzCNb+uGuSGX16YIFLSXs+Z14L8phcR6JF09/SKRPc7dVMNjuw1U2VykM9JzhoRdg0d9MH3EniK6qzzrxKeDBEUK9WD9bygJPX9wiXqcVP6e+JL/CKr8YCaa+HF9ipux+PzbqM8IoffOo=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E68DEB9A0429C84EB5F5F0FE8B2F9096@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c532ee4-e315-429f-2913-08d82eaecd2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2020 02:19:17.3438
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lnkCLMOBFpHWapqwCP3w1B2p7ameieakJzbVbKpZt9IOCP+h/bGpJOJOz9Ws90YiQhEeBMD00SepwoC68br2kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5736
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-07-22 17:53:25, Bastien Nocera wrote:
> On Wed, 2020-07-22 at 11:26 -0400, Alan Stern wrote:
> > On Wed, Jul 22, 2020 at 11:46:27AM +0200, Bastien Nocera wrote:
> > > When a new device with a specialised device driver is plugged in,
> > > the
> > > new driver will be modprobe()'d but the driver core will attach the
> > > "generic" driver to the device.
> > >=20
> > > After that, nothing will trigger a reprobe when the modprobe()'d
> > > device
> > > driver has finished initialising, as the device has the "generic"
> > > driver attached to it.
> > >=20
> > > Trigger a reprobe ourselves when new specialised drivers get
> > > registered.
> > >=20
> > > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > > ---
> > >  drivers/usb/core/driver.c | 31 +++++++++++++++++++++++++++++--
> > >  1 file changed, 29 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> > > index f81606c6a35b..a6187dd2186c 100644
> > > --- a/drivers/usb/core/driver.c
> > > +++ b/drivers/usb/core/driver.c
> > > @@ -905,6 +905,30 @@ static int usb_uevent(struct device *dev,
> > > struct kobj_uevent_env *env)
> > >  	return 0;
> > >  }
> > > =20
> > > +static int __usb_bus_reprobe_drivers(struct device *dev, void
> > > *data)
> > > +{
> > > +	struct usb_device_driver *udriver =3D to_usb_device_driver(dev-
> > > >driver);
> > > +	struct usb_device *udev =3D to_usb_device(dev);
> > > +
> > > +	if (udriver =3D=3D &usb_generic_driver &&
> > > +	    !udev->use_generic_driver)
> > > +		return device_reprobe(dev);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int __usb_device_driver_added(struct device_driver *drv,
> > > void *data)
> > > +{
> > > +	struct usb_device_driver *udrv =3D to_usb_device_driver(drv);
> > > +
> > > +	if (udrv->match) {
> > > +		bus_for_each_dev(&usb_bus_type, NULL, udrv,
> > > +				 __usb_bus_reprobe_drivers);
> >=20
> > What does udrv get used for here?
> >=20
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  /**
> > >   * usb_register_device_driver - register a USB device (not
> > > interface) driver
> > >   * @new_udriver: USB operations for the device driver
> > > @@ -934,13 +958,16 @@ int usb_register_device_driver(struct
> > > usb_device_driver *new_udriver,
> > > =20
> > >  	retval =3D driver_register(&new_udriver->drvwrap.driver);
> > > =20
> > > -	if (!retval)
> > > +	if (!retval) {
> > > +		bus_for_each_drv(&usb_bus_type, NULL, NULL,
> > > +				 __usb_device_driver_added);
> >=20
> > This looks funny.  You're calling both bus_for_each_drv() and=20
> > bus_for_each_dev().  Can't you skip this iterator and just call=20
> > bus_for_each_dev() directly?
>=20
> You're right, looks like this could be simplified somewhat. I'm
> building and testing a smaller patch.
>=20

What do you mean "reprobe" for your device? Do you mean the mfi_fc_probe
is not called? If it is, Would you please check why usb_device_match
at drivers/usb/core/driver.c does not return true for your device?

--=20

Thanks,
Peter Chen=
