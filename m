Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4111022AEBF
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 14:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728560AbgGWMMH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 08:12:07 -0400
Received: from mail-am6eur05on2048.outbound.protection.outlook.com ([40.107.22.48]:21164
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728521AbgGWMMH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 08:12:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K79WNWRYmEXbtxoeiBin9UjS+0qs/AxeJ5oG4t2gHiECyPdDVsvfZbJgKvTG2tyfqNj3NuYNprJhmBI4CHxvEq3QSrHOnpXVXQu0wqcOU+cuUfrATvOBijL5eduKvDja9/glFceU+TXh9O+CyDtK83BkdcwpXwQbyJwj/NLmyGB8hJsXi+b9QtU8yxjXfPnIYPLqXPAbPkWC7RXlCX3ubuSjQB/1ppasau7B7bhWX8qtwxgrJsiGBzKbdlXqAFGhHsfoHhNMzQwREwjhRKPNzHyxrSBwisUpj2TW9uO5Vr8lMW2okWlPAksqH6+YArO+4f5TOVMW4GKy6jzoHDN49g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=podMb7+P6FQXRRHQm29QSXhjCYyq1aUwoitGy+6nnVA=;
 b=I5MumjQ9dMmOsytsmeK1wZ0XtgtfxDwoHwxxLn5euF/nXPT2b7gOZSyC6PAF9o88NojodHLBF1VFWBk7fP82LhZo98b6rafKq6rWDYl9/N5ZVCcyD9Y8PNpAGp7hBno7GrX97F8s7x/dHraz1IzIIXVmze7UtifFFujWGKvvdtI5v+j/UkprJSmnzObBjJstxvWtMcznqXIpo0A069EYbcTPwmyo4g0OnlScaeXBfbF3QyPdG5HugYlP3CkkU+Yf+WQuobFyBSqFPa/oSxmTlM3s9VhBz2NCodiJng5/qvH0gkj0YraHxqBkn52PSf1zowZxV7zKuAd2MEroE+jwuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=podMb7+P6FQXRRHQm29QSXhjCYyq1aUwoitGy+6nnVA=;
 b=IfNYclSll22xKGEXmSFg0E4eezxxe6WeX8kk5sQBbNHzssLqmedpxEqgg++sfYZAWtzE7itAHXLD3LeSTIKdhtcP7T6IRbTN/ZWx3dqo8nHSJkUFw2GIz7iZf+GmEB/yXFPLa3gvkk50ngWXthv+HbYhgc7bUEe/h4/fqsKRAhs=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR0402MB3429.eurprd04.prod.outlook.com (2603:10a6:209:6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Thu, 23 Jul
 2020 12:12:02 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::539:3d00:4c6:c4a0]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::539:3d00:4c6:c4a0%3]) with mapi id 15.20.3216.023; Thu, 23 Jul 2020
 12:12:02 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Bastien Nocera <hadess@hadess.net>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] USB: Fix device driver race
Thread-Topic: [PATCH 1/2] USB: Fix device driver race
Thread-Index: AQHWYA0AzAqBUavxXE2biSfq3fmPF6kTuOQAgAAHeYCAAK7OAIAAcNQAgAAWgECAAAl3AIAAFNMA
Date:   Thu, 23 Jul 2020 12:12:02 +0000
Message-ID: <20200723121150.GA8206@b29397-desktop>
References: <20200722094628.4236-1-hadess@hadess.net>
 <20200722152640.GC1310843@rowland.harvard.edu>
 <407a8732f7e124e623f8687729d4d4775dd8ab27.camel@hadess.net>
 <20200723021904.GA5798@b29397-desktop>
 <bbc6bd03507d8ec3462f671f06587317f3fcbfca.camel@hadess.net>
 <AM7PR04MB71570D838FDDB467A302423E8B760@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <ee58286dd0f6e62c6ca95f094292893cf921fe21.camel@hadess.net>
In-Reply-To: <ee58286dd0f6e62c6ca95f094292893cf921fe21.camel@hadess.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: hadess.net; dkim=none (message not signed)
 header.d=none;hadess.net; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7826a95c-f28f-496c-2461-08d82f019bd7
x-ms-traffictypediagnostic: AM6PR0402MB3429:
x-microsoft-antispam-prvs: <AM6PR0402MB3429FF7A205A2B4761F02A388B760@AM6PR0402MB3429.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U9iDUDLBPeTfMFoQqH2cFJxzl4yS8Vlq/scSG3IXyrr+aLSXEt1Qw/iL3qgvp//M9Wytavt1GnX/Tu9JFZ55769nq7LpZD70njDLVzWbaozLICo0uwEeQ48f+65+JZUb5pJ6FcGTZ787heYkupB5kr6zdXNfUKndsY6b8vkGmDYGdHohJa6/ItRplyg2GZ0b3EK5wU66QmwqREoiXDlgyUyTwMqYzHgrTGWZyMWbDcVL2sNynxqxQWlyC278ttykhDd1TfYJB+efv/mVw5GQL5k8JIsq1RZYqRbpHP+vvAj8HuBQxjkhYaUPMhoO8sYsbRqv1aXs7K6wLhWUom3EGw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(366004)(33656002)(5660300002)(498600001)(2906002)(76116006)(54906003)(91956017)(66946007)(64756008)(66556008)(6486002)(66476007)(9686003)(6916009)(33716001)(6512007)(66446008)(71200400001)(4326008)(6506007)(53546011)(8676002)(1076003)(83380400001)(44832011)(8936002)(186003)(26005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 53jyrek16cW/1Za3ccgrcV5AYEXQXl/8455MpCu9jl/0FLnfA364t2r284yWb5ofhlFfzV8ikt2bd9454x4N9pIJC+89+c733lPpMbDGGkipTVKqChyJCJAdGmDCKb4OlJZvkJUGRtTupvd6jS2YtFfF+UQYraSTKnQwPZWgU8R4ZH85MuOsHQNlC09/v7uBXzT0MUecOzB3YLV9SGt7kKIolKaGCYhvzSFq60Rj6Sr/GE6o1F4DZFOym1W8mUUonzsJeVGyz/n+tC5S0hoDw6QlaFxf851Us1ujAPurEuwZDgm1VEtnlar2APn/pzTEg/OOoXvvM4bJb2rgIyj52P6CM5UeliV63B4W9D6XKkbz4ox9+/tF34pLCPlQYVSCkMz1TRhiBH+iN++DJ5avdmol32j9wahqrdXwzO2bInsYFQv1hO0zW+mrJaewArU11OMc8J7Gq5SlvTssX7ow3W5HDdrgU7UoFLwefNA5lXI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CB4590CC549C254AB3CB10D4A921E69C@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7826a95c-f28f-496c-2461-08d82f019bd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2020 12:12:02.7343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QJQLR/9rta/+YWCe+hfxq0zJCy0j9F94FdZXxgtxJTCMKWbTJrKRBhLWXMRydKxx7+ecHyvLnyusumxR6xDs2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3429
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-07-23 12:57:18, Bastien Nocera wrote:
> On Thu, 2020-07-23 at 10:35 +0000, Peter Chen wrote:
> > =20
> > > > > > > After that, nothing will trigger a reprobe when the
> > > > > > > modprobe()'d
> > > > > > > device driver has finished initialising, as the device has
> > > > > > > the
> > > > > > > "generic"
> > > > > > > driver attached to it.
> > > > > > >=20
> > > > > > > Trigger a reprobe ourselves when new specialised drivers
> > > > > > > get
> > > > > > > registered.
> > > > > > >=20
> > > > > > > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > > > > > > ---
> > > > > > >  drivers/usb/core/driver.c | 31
> > > > > > > +++++++++++++++++++++++++++++--
> > > > > > >  1 file changed, 29 insertions(+), 2 deletions(-)
> > > > > > >=20
> > > > > > > diff --git a/drivers/usb/core/driver.c
> > > > > > > b/drivers/usb/core/driver.c index
> > > > > > > f81606c6a35b..a6187dd2186c
> > > > > > > 100644
> > > > > > > --- a/drivers/usb/core/driver.c
> > > > > > > +++ b/drivers/usb/core/driver.c
> > > > > > > @@ -905,6 +905,30 @@ static int usb_uevent(struct device
> > > > > > > *dev,
> > > > > > > struct kobj_uevent_env *env)
> > > > > > >  	return 0;
> > > > > > >  }
> > > > > > >=20
> > > > > > > +static int __usb_bus_reprobe_drivers(struct device *dev,
> > > > > > > void
> > > > > > > *data)
> > > > > > > +{
> > > > > > > +	struct usb_device_driver *udriver =3D
> > > > > > > to_usb_device_driver(dev-
> > > > > > > > driver);
> > > > > > > +	struct usb_device *udev =3D to_usb_device(dev);
> > > > > > > +
> > > > > > > +	if (udriver =3D=3D &usb_generic_driver &&
> > > > > > > +	    !udev->use_generic_driver)
> > > > > > > +		return device_reprobe(dev);
> > > > > > > +
> > > > > > > +	return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int __usb_device_driver_added(struct device_driver
> > > > > > > *drv,
> > > > > > > void *data)
> > > > > > > +{
> > > > > > > +	struct usb_device_driver *udrv =3D
> > > > > > > to_usb_device_driver(drv);
> > > > > > > +
> > > > > > > +	if (udrv->match) {
> > > > > > > +		bus_for_each_dev(&usb_bus_type, NULL, udrv,
> > > > > > > +				 __usb_bus_reprobe_drivers);
> > > > > >=20
> > > > > > What does udrv get used for here?
> > > > > >=20
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > >  /**
> > > > > > >   * usb_register_device_driver - register a USB device (not
> > > > > > > interface) driver
> > > > > > >   * @new_udriver: USB operations for the device driver @@
> > > > > > > -934,13 +958,16 @@ int usb_register_device_driver(struct
> > > > > > > usb_device_driver *new_udriver,
> > > > > > >=20
> > > > > > >  	retval =3D driver_register(&new_udriver->drvwrap.driver);
> > > > > > >=20
> > > > > > > -	if (!retval)
> > > > > > > +	if (!retval) {
> > > > > > > +		bus_for_each_drv(&usb_bus_type, NULL, NULL,
> > > > > > > +				 __usb_device_driver_added);
> > > > > >=20
> > > > > > This looks funny.  You're calling both bus_for_each_drv() and
> > > > > > bus_for_each_dev().  Can't you skip this iterator and just
> > > > > > call
> > > > > > bus_for_each_dev() directly?
> > > > >=20
> > > > > You're right, looks like this could be simplified somewhat. I'm
> > > > > building and testing a smaller patch.
> > > > >=20
> > > >=20
> > > > What do you mean "reprobe" for your device? Do you mean the
> > > > mfi_fc_probe is not called? If it is, Would you please check why
> > > > usb_device_match at drivers/usb/core/driver.c does not return
> > > > true for
> > > > your device?
> > >=20
> > > mfi_fc_probe() isn't called because the device already has the
> > > generic driver
> > > attached by the time the apple-mfi-fastcharge driver is loaded.
> >=20
> > Would you please explain more, why only this driver has this issue?
> > Seem you
> > create a struct usb_device_driver, but not struct usb_driver, few
> > drivers do like
> > that. You may see drivers/usb/misc/ehset.c and
> > drivers/usb/misc/appledisplay.c
> > as an example.
>=20
> It's a _device_ driver, not an interface driver. It's the only driver
> that has the problem because it's the only non-generic device driver :)
>=20

I may clear now, thanks.

So, you mean your device has no interface descriptor, so you can't
create a USB interface driver, and have to create non-generic device
driver for it. I see there is __check_usb_generic function at generic.c
to check if it could use generic driver or not, you may add some
condition (eg, no interface descriptor) to avoid using generic driver
Is it feasible?

--=20

Thanks,
Peter Chen=
