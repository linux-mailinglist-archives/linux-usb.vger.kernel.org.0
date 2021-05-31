Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62EF83959F8
	for <lists+linux-usb@lfdr.de>; Mon, 31 May 2021 13:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231450AbhEaMAb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 May 2021 08:00:31 -0400
Received: from mail-vi1eur05on2081.outbound.protection.outlook.com ([40.107.21.81]:38332
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231289AbhEaMAa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 May 2021 08:00:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1PqCc4jFf3q/n1hRoS1l30tcPPS4blccVg1stJ1JpONx/5KQzsOHyhZMPU+XGE/Jr5Q0XrAvbo2BByn+y7dgmtIj39Rttn/T6pCVBa3bWNQQLdDY/kuBM/TWUGXTh3MxB6EixYP8X2s5h4lh8qYZ8L9Q+MC/UJBPINH1VPO85x2BrHiiuKyH5+AqSabwOXAtg82GdY3bsthkXGT69AB5C0BYhfNoc/j0QjDCyN/RtoyCjHpJP/Uyqz4c6UCeL9GiauzfT/vgW9PemKEzqipFHZf8CZ3U3tJqbH3znDh8+wnD/wSaDTqByxk+dHZ5bRSqxMJEKaNQh0ebGID3PEWnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zWu/QKMwxPBQ1OloS7nwz8MwAncrCVXGWggIOnosP8=;
 b=cIw+SoAOVvKlfu4iC1+3jMg21ynQBwdORbr3sA/9pChjgpTxLSR3DggS5Wr6nDGg1XGBahwWN/sCChT+59a3C+2lXbGCceLBkiMeGje+zEux4N98RguCPwKM34kINlvD1dVxBPGL1JkFwTJv1rUSxx4rt3j4/vMvlT/ZKKzhkzLw1bdQ95/NFQZwvXprH0imaMQT6rjJGrp5cSA3TFAVQdkQXjgb9DeCdqa+272b0mVQUZqVuE2o0C/mQGBUbW9vwM4zTQvrM4gYhAd6654/2gzOwlAtMgxUCDRUGZfAJOAMgbNlr4ReIMqHaFb1Gj1rW+lMV6yHFZM/iH6E8SRW/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zWu/QKMwxPBQ1OloS7nwz8MwAncrCVXGWggIOnosP8=;
 b=V3P2cPVJLDjdRRx7Fcolzb+/G8gSCf+LsNxb8NFoJp0nS4mB/AiJckLk8hn13Hk0gdz5/PkGHMYj5+2T1DovHbkMTpuh0ZArM8wJwzyeP/sf9H7Bfan7LEqMKjNrdpasrS1UatSz/KT+U4qYA9OpmF+1nC0KxFS8NtXuTSpEQa4=
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB6783.eurprd04.prod.outlook.com (2603:10a6:803:130::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Mon, 31 May
 2021 11:58:49 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::453c:f24d:af8e:f194]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::453c:f24d:af8e:f194%7]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 11:58:48 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "peda@axentia.se" <peda@axentia.se>,
        Hans de Goede <hdegoede@redhat.com>
Subject: RE: [PATCH 3/4] usb: typec: add typec orientation switch support via
 mux controller
Thread-Topic: [PATCH 3/4] usb: typec: add typec orientation switch support via
 mux controller
Thread-Index: AQHXTIEKNobfiQu7YEKZBxd9HIlDqqrsT64AgAFQdoCAA4FacIAEZREAgAALynA=
Date:   Mon, 31 May 2021 11:58:48 +0000
Message-ID: <VI1PR04MB5935CF87B5DB6BC62BD69B10893F9@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <1621408490-23811-1-git-send-email-jun.li@nxp.com>
 <1621408490-23811-4-git-send-email-jun.li@nxp.com>
 <YKZXHG7BSSZssiBg@kuha.fi.intel.com> <YKdxW8SFntFYcyv+@kuha.fi.intel.com>
 <VI1PR04MB593521FEBF947882E6A394D489259@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <YK4R4q1cZqQDS1qy@kuha.fi.intel.com>
In-Reply-To: <YK4R4q1cZqQDS1qy@kuha.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca827f4f-b7f5-4f3e-811c-08d9242b7376
x-ms-traffictypediagnostic: VI1PR04MB6783:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB678351D42179295FDE21207F893F9@VI1PR04MB6783.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u4dJvtxbjVtcq4IvENcTdqfdZhpkp7yFWI0+O8aqhNQKWCImea5kyACviqRgy1bEjN0LYHkFfetWeuGq6w4cOIVCA+V+ygSHE5UZgla6MfyGahHx+iGhWNhNIVBzRe/jzL+aAEdyPviGGqGejWE1QkQMKZr8dApXPIRFkaT/2dqSKUE0dBF/CE/1ZoudL9+aLA2Kbl4fwXm+R+dgWbKKbzP5kbnV2LG34M2n7iis32OjvNZs7XBhpUdH+7LhsebKGxfIK7Z92eRl26DBSkoeLkWpSoPzKrf+9Qgd967vfeBFxR6LBP0tUsvJFIcTPEfR4kBJwi+PR8pX6ovP1HFSd9kqDT+tQgKA9Uyj3KsvvG9rfes7mexZb7Q4ooJdtOP4B3H+UCs6dFMJxaE/t6uV+w713TPLfph+G7QJbkrTXsJ50ul9OsD3zoztmsUBnRO5/OepiygZ3bB2OyZXJQD0WUznmD2EvF4/bOq/+g/YHLJt3hQK+0eQ1nYEWK3El2ur2sxq7nFVKOlCht9t3FkGTAYNsyMADllBd7vcY/vqKVli+1XiKuXZpuzTMJP+UGWX61F9CuMyj/rKSLvYfDIRGBl9VKXVHGs8De9F5C2vBNg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39850400004)(53546011)(54906003)(7416002)(8936002)(76116006)(478600001)(64756008)(66476007)(66446008)(66556008)(2906002)(86362001)(8676002)(6506007)(71200400001)(316002)(122000001)(66946007)(4326008)(5660300002)(55016002)(26005)(44832011)(9686003)(6916009)(83380400001)(33656002)(186003)(7696005)(38100700002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?RmsR6Ph3XrwOACA7Djm2TwIGCHAw7+QBd6TQG4wqs3PGRRg9rhpuFckd/MJz?=
 =?us-ascii?Q?LUtep8lJyTBEUYQ6ulBOavmbLQPDTuNh5vairZyJqwpC0s6QAhVKRTIkvYYh?=
 =?us-ascii?Q?Ul98nV8eDQGrzNGZmiSNyDr2+nhs/xMzkRHuSHYVQVl1wpcG5Z0i/dnJaxZg?=
 =?us-ascii?Q?a7LWASlC+xHsB7P54b1vgZ6ZWB3wOZveSggxLYvmDmunZ/l7cajAGOvF0oEe?=
 =?us-ascii?Q?nzTOTZdP9eWTCMpUd5ctLZbnEVcRBB1hGACPDNYldMCNtO7s2aukuqAZgrC4?=
 =?us-ascii?Q?Ft+sH3lkxLezjRW7/tva4FW+PCAdJBEpcO00fIa23xh9rDbcAOGpUMt6XwlH?=
 =?us-ascii?Q?Rv03DnJo0DCssOmbA/FBO0Q+ryskYR2QH/xpe90aHEdltpi/NK56AokCgHH6?=
 =?us-ascii?Q?BeTySXvGCCD1Exb9X59vVGqczirSq77r/MJENjEk9AsxvCL5pwXSrFtdc3QK?=
 =?us-ascii?Q?xDS+5WGRg+e+7E6t5eRRf0RRwrA6y7rPW8E43pSnphmdCufYtmZsuCoi6yVx?=
 =?us-ascii?Q?iiPoriiW5DXYhwn4eM1Nwi6AHsAydu5/TKyzHTj4vSPJUJzY5lP0KYtqPn0S?=
 =?us-ascii?Q?NZ97gyvXS2gYNVHLrN4+rXUZ3D3HW/pBJP/NzrZ+mm7zYfuPK9HGrzCBrP6N?=
 =?us-ascii?Q?GjpEpZmWSjvBfCxfGqow0lh6TXsq8Bzm20LfQKUqvkUQf6ntpCet6LMeaCok?=
 =?us-ascii?Q?XKeKEeD3cMw7YnCBRdfWHBoPNyzjJjPauVMkUOkAcaK4rghyKadUWbzfZEBF?=
 =?us-ascii?Q?KOdj/BqK7t/KWTyiROj1R1qNUtUWR0qTg/0gOuF0ZHoEFy6GWSBDBfT4eg2y?=
 =?us-ascii?Q?onSum2/cJkpPCmoI4Beritkia6IIIAem0niHe/9x/2dwxrQaJT6w8eFI692m?=
 =?us-ascii?Q?jfsRx5EZWShf7aWdAz5saOCWDWwWD14tIetaylWFc81C/brjLDLYtsN2S9lE?=
 =?us-ascii?Q?SkgRET5twc2LC6ZbQNNnkMaJIfdjI6vrWQQqfbZZljTAUvUgbhBhyYYLYSe4?=
 =?us-ascii?Q?I+g7fpxl0+vkwBw6Edtsi/sMQcykMmKKwz40LZK8nCKotlkhpFr0wL+WwQnj?=
 =?us-ascii?Q?cBV0SuxKhNkVB5do0wdKJyaZLsjBrzKnc8m+CMZbp1yY2D80vFZrb+aArHlE?=
 =?us-ascii?Q?5AoxFfaG5JOyexpOFwyE0yyUJ/5ubSM9CIbWNzMEkubCSjYPIHjaMInXIHw/?=
 =?us-ascii?Q?dA9sI7ZTSTI6WH06Klb7Wrl1LSF3iusun0DV9bo2plvKvWZmRJb1LxJ+lEwB?=
 =?us-ascii?Q?IFUKkwi5U0pIS8YmaClfM4raaUQNoFjgrfXgJEbw7wSRdbnYMI6R/bEwy4LK?=
 =?us-ascii?Q?6T9Zdz50AtCdHa5OfpvQ/tyd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca827f4f-b7f5-4f3e-811c-08d9242b7376
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2021 11:58:48.7266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y1VC5qJad7ZCz7xG2RbQzOeXVxUu+yWaImZI6deZyYPMB/RG00y37vGfYyUkrVnM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6783
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Wednesday, May 26, 2021 5:16 PM
> To: Jun Li <jun.li@nxp.com>
> Cc: robh+dt@kernel.org; shawnguo@kernel.org; gregkh@linuxfoundation.org;
> linux@roeck-us.net; linux-usb@vger.kernel.org; dl-linux-imx
> <linux-imx@nxp.com>; devicetree@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH 3/4] usb: typec: add typec orientation switch support
> via mux controller
>=20
> On Tue, May 25, 2021 at 11:46:18AM +0000, Jun Li wrote:
> > Hi Heikki,
> >
> > > -----Original Message-----
> > > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > Sent: Friday, May 21, 2021 4:38 PM
> > > To: Jun Li <jun.li@nxp.com>
> > > Cc: robh+dt@kernel.org; shawnguo@kernel.org;
> > > gregkh@linuxfoundation.org; linux@roeck-us.net;
> > > linux-usb@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>;
> > > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > > Subject: Re: [PATCH 3/4] usb: typec: add typec orientation switch
> > > support via mux controller
> > >
> > > Hi,
> > >
> > > On Thu, May 20, 2021 at 03:33:36PM +0300, Heikki Krogerus wrote:
> > > > Why not just do that inside fwnode_typec_switch_get() and handle
> > > > the whole thing in drivers/usb/typec/mux.c (or in its own file if
> > > > you prefer)?
> > > >
> > > > You'll just need to register a "wrapper" Type-C switch object for
> > > > the OF mux controller, but that should not be a problem. That way
> > > > you don't need to export any new functions, touch this file or
> > > > anything else.
> > >
> > > I wrote a bit of code just to see how that would look. I'm attaching
> > > you the hack I made. I guess something like that would not be too bad=
.
> > > A wrapper is probable always a bit clumsy, but I'm not sure that in
> > > this case it's a huge problem. Of course if there are any better
> > > ideas, let's here them :-)
> >
> > Thanks for your patch, I am pasting the patch as below.
> >
> > seems we need consider more than that.
> >
> > diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
> > index a0adb8947a301..d85231b2fe10b 100644
> > --- a/drivers/usb/typec/Makefile
> > +++ b/drivers/usb/typec/Makefile
> > @@ -1,6 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  obj-$(CONFIG_TYPEC)		+=3D typec.o
> >  typec-y				:=3D class.o mux.o bus.o port-mapper.o
> > +typec-$(MULTIPLEXER)		+=3D of_mux.o
> >  obj-$(CONFIG_TYPEC)		+=3D altmodes/
> >  obj-$(CONFIG_TYPEC_TCPM)	+=3D tcpm/
> >  obj-$(CONFIG_TYPEC_UCSI)	+=3D ucsi/
> > diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c index
> > 9da22ae3006c9..282622276d97b 100644
> > --- a/drivers/usb/typec/mux.c
> > +++ b/drivers/usb/typec/mux.c
> > @@ -63,6 +63,9 @@ struct typec_switch *fwnode_typec_switch_get(struct
> > fwnode_handle *fwnode)
> >
> >  	sw =3D fwnode_connection_find_match(fwnode, "orientation-switch", NUL=
L,
> >  					  typec_switch_match);
> > +	if (!sw)
> > +		sw =3D of_switch_register(fwnode);
> > +
> >
> > How to support multiple typec_switch_get() for of_mux case?
> > the second call to fwnode_typec_switch_get() will get the switch via
> > fwnode_connection_find_match()? This means we still need a property
> > "orientation-switch" for mux controller node, this seems not the
> > expected way for a mux consumer, even with this property, we will get
> > a EPROBE_DEFER for the first call.
> >
> > If we use mux_control_get() for multiple caller/consumer, then we need
> > some other device as input.
> >
> > typec_switch object looks to me is a provider, if we create and
> > maintain it in consumer side, I have not come out a better way:-).
>=20
> Sorry, but can we rewind a bit: Why can't you just register the orientati=
on
> switch from your mux driver and be done with it? You should then be able
> to use OF graph, and no special bindings should be needed, no?

So we still need a special property for OF graph per discussion on another
thread(use device type other than device name for match), and this has
to be a mux controller core binding for possible different mux chips
(GPIO/MMIO...), register a typec switch if this property exist, but this
is the user specific thing from mux controller point view, I feed this
is again against DT binding's expectation.

>=20
> If you want to reuse a mux-controller driver, then you do need to modify
> it (but only a little), and what ever mux-controller specific bindings th=
ere
> are, you will not use those when the mux supplies the orientation switchi=
ng
> function, instead you'll use the OF graph for that. But surely that is no=
t
> a problem?
>=20
> The mux-controller framework expects the "consumers" of the muxes to
> understand the final function that the mux is used for. The Type-C "mux"
> framework (I should not even talk about muxes with those) works the other
> way around.=20

Fully agree.

> The driver for the component that supplies the orientation switch
> function must understand that it is handling that function, and there is
> a good reason for doing it that way with the USB Type-C switches.=20

I understand yes if the switch is only part function of the driver.
 =20
> The
> orientation switch for example quite simply is _not_ always a mux. In fac=
t,
> it's seems to be rarely a mux these days. With USB4 for example the orien=
tation
> is handled almost always by the first on-board retimer.

If the mux is only part function of a new driver, use the tyepc
"mux" framework and create new binding for the new driver is fine.

But if the typec switch control need a dedicated driver to handle,
on DT platforms, now mux-controller is the only proposed way to go
from binding point view. I am not sure if my case is a normal HW
design, but I guess I should not the only user of this kind of
situation.

>=20
> There are actually also some technical reasons why Hans failed to get the
> mux-controller thing to work, which is the original reason why we introdu=
ced
> the dedicated framework for the Type-C "muxes" (I really should stop talk=
ing
> about muxes), but I don't remember what was the reason.

I checked the patches Hans did, that was mainly to address non-DT
platform, I don't see a clear reason why it can't fit DT platform,
maybe I missed something.

+Hans, It would be great if you can comment on this, thanks.

>=20
> In any case, to summarise: the orientation switch is a function. A mux is
> a device that can supply that function, and if it does, then the driver f=
or
> it really needs to register the dedicated orientation switch.

Understand your point, if register the dedicated orientation switch is a mu=
st,
I feel using general mux control can't make much sense.

Thanks
Li Jun=20
>=20
> thanks,
>=20
> --
> heikki
