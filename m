Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAC38455ED3
	for <lists+linux-usb@lfdr.de>; Thu, 18 Nov 2021 16:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbhKRPDX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Nov 2021 10:03:23 -0500
Received: from mail-db8eur05on2060.outbound.protection.outlook.com ([40.107.20.60]:41707
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229490AbhKRPDW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Nov 2021 10:03:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUqPfODh5LcKytUA+wR1dhys5i3+nyV1EnFWn4XZE4idD/6jGlUnIK5N2f7l8u6H8qlJvgdxw200+SttDfV30PEGA3GKAWqwjRPlScLBLmylPQKUV9d1DUFV6zv5D0k6pEB0ixLs2/EREMombQYnOMKGxiNncw5PoEOYATdz6nff5O8pBSbPXdOyEG+gb+4cYchlRsmJFiOqMeQaQMrdQN99WzY/ORw3/iGFx0X8zJctmT543yojP8nDjRQSgUBeiy8vMol41lUx0IkCEOl0i1lwfFs8jLKtA6KsD6R/jaTQNCI2gJPMHDF3wG7o1r5aEYgTE35VT6RGrOve/nF8Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nekCg31m2LUEi0ShSsVMNY07G4oX05HSJMC0QZyHsfg=;
 b=GCf7/oUDaGRPghxJzvZGpHg2qi7rFmRyOB/ztjI5pnxNG6UOnIS+7jFh0wjGZNA6X8G8ZrqOavVjY3XEO+RUJBEXtxyUizLx0M0Cc70JVdpt67YelrD853Omma99Zx9r3x1P+oSBJ+1KYqypzG/pu1WqFvakkvmCX9stbEmhI6UnElpAHZ6OUQTmOowVtFVp6okqqUbcEav+290CQ8fB8RtH3yzKB4sewOSdJSCbQKLblh2QEau+6oBN+ELIJ+xIG/XS99teKg1wPTs6GBwatBT76tqzTXjlP0s8Ppev092pobZI9eBsLxLPfkjIMOXOxwr2rvwLL+AWOqAL5qh/+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nekCg31m2LUEi0ShSsVMNY07G4oX05HSJMC0QZyHsfg=;
 b=QL4vdNzvp1Z+kfidR8hhEWGGNbzEnWznCfMnDckxizJWAPnQpbpxVo6LQDWZwKiMSfJSePfx640TAgITy0Rxvoa416estwNe/abU00vFeJ0H+j5GBuXcwJHTsot3YfDblzPknmz9+iuWcNCMwfAW5cE4gY8NED0TQCFXkAsVNGc=
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com (2603:10a6:10:11b::14)
 by DBBPR04MB6266.eurprd04.prod.outlook.com (2603:10a6:10:ce::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 15:00:16 +0000
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::2102:b9f6:1221:edef]) by DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::2102:b9f6:1221:edef%4]) with mapi id 15.20.4713.021; Thu, 18 Nov 2021
 15:00:16 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>, dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: typec: tcpm: fix tcpm unregister port but
 leave a pending timer
Thread-Topic: [EXT] Re: [PATCH] usb: typec: tcpm: fix tcpm unregister port but
 leave a pending timer
Thread-Index: AQHX3F4sXI340/5CakaWP/g7hHWQE6wJRNGAgAAXqmA=
Date:   Thu, 18 Nov 2021 15:00:16 +0000
Message-ID: <DB8PR04MB68433EAC3FDD82834FDC0E768C9B9@DB8PR04MB6843.eurprd04.prod.outlook.com>
References: <20211118092352.259748-1-xu.yang_2@nxp.com>
 <YZZSpffDfPd/CJDX@kuha.fi.intel.com>
In-Reply-To: <YZZSpffDfPd/CJDX@kuha.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76f7558e-fee9-4db4-c602-08d9aaa421c9
x-ms-traffictypediagnostic: DBBPR04MB6266:
x-microsoft-antispam-prvs: <DBBPR04MB6266165A1E2AF3B65B0E0E638C9B9@DBBPR04MB6266.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EmZ/35Pfvx5CHX2OmMBb3l4yKNJG1IaG2zIfoeAW6nFaz3s0QTsjLaVdZzjiipuqJ51S92w4lFMI1L5+hFOfFyhVGzqz74Xr7bBPEUw7fuJJN56OyVhEDXaEni+SH42u8Ebf9+3nZCXpPyGxrPPrOxXlXEaEmMoRwEniVZpBt+m8oJ1dDTSgdfX7Y0md53Q4SfH8UDjKwfUVWyz/dYFHBec+qRFJ9I9blK2eqxffwoRX8qQV91FpB4U4PvKtAeEK6dKECLrl0bvwlTRFJdot2GOhMnQM+1VxzB80cXJWXggjSkOnUE6TcYNyXt3mPHzDXik+kLEzx6BV19NqYqAEX++wV9c6o634bsoYZz7dX45DmGqb4ZEpA3F2vTPsPQiv562dUeMDepLQs2cCLlQjC2Sb/EuMZME1vJdMXtcJGPEXasNdTOrx52Zi6X/7OL1zs/FugjLEl0JJEIHcA4T7QKybTcw5xcwJvaAazXb05PspmMvVeU6iYAsIkJ0pojVD4ZT0Cpxh9UJn/twRsVVaFM3h346tedBWb2qfsanXTmenlAK2LK+y6j/6Sf3//UJiNpwvSA/hU+mxAvMixDDbsCySsujsXa8WEYu6Hbny8cYfUomGqUvTZc2WkoUNGTsY6cFZs9Nk9ktYlHefMUHLum6GGZuINJgQhoL8ExWWPLKX7U31mwxcxdV/BTYYRHnyPqqT4LH6yQFEsjAMWCBWNw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6843.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(7696005)(54906003)(86362001)(26005)(55016002)(66446008)(53546011)(316002)(6916009)(83380400001)(38100700002)(8676002)(6506007)(122000001)(5660300002)(2906002)(508600001)(4326008)(38070700005)(71200400001)(76116006)(66556008)(66476007)(33656002)(9686003)(52536014)(186003)(66946007)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9GDhY3NsPPvornBMydmRnS/zpYsG0fXOaYuH7belEQKsGAMaBJQtI/a4ISsf?=
 =?us-ascii?Q?g6Z9xR162I/+iq0hwjnnMoQtKfAuMqKm/ndmatSYP3fBfWdtZi+YJeEs4yO1?=
 =?us-ascii?Q?ZjtMbfllz7Zrw/xXEjO64mOS7lP8w7r/C/2C+0jo4lBdvkazVhpW68Qkt6ml?=
 =?us-ascii?Q?IMR+KGNgKVKvMjMtrzoNgRc6gRx9KjlXb3ezRdpebenDoec4oJIhkOl35iHJ?=
 =?us-ascii?Q?P+Der47PNj4MCFJBu1straMuEOUAZrJq/DYxKyeOWB4hvnxXCGi/vBr0VWA4?=
 =?us-ascii?Q?ZtIrM9vIrWU/AciZv1iyMrhn1WxZbE6+B0mrf+CeRlgixL3NvFBxazkrvoXu?=
 =?us-ascii?Q?gT6QSWq+F1c6P+g93MjR6TSSKFmxqMH26hLxgLGyFHmuQhyc3gdzPWZE7H8G?=
 =?us-ascii?Q?w1ZO/W3ZUmNxAYqS5FWVMEqzVcxKZvwvXE6/CLiipWzmdevy3Ds9CMptv19z?=
 =?us-ascii?Q?z2XaHl1bQwtycBjZ8srZpMAzzDhAgRm9PrTMjabehHHsC//k2LM30lpQzMh5?=
 =?us-ascii?Q?1ezXqzGnkAJmGrmNh5F27TLdlhZWNHifTbhCEG+9Wh9b0O2S1jb8rDIUTPgF?=
 =?us-ascii?Q?DLsbiEJFyDlY3nddcrp8JkYB2JCX0GN8cd7AH7AHab5bc3MidWzJ8wFnl6s3?=
 =?us-ascii?Q?U588Zcrf0W0qy1HhoSjGZKrgYr85sCyC3nHvbTAVPxz+c1Nqt2LPdVI47xCX?=
 =?us-ascii?Q?itOoYyb96dr1vv8LwsECV88kjZnmiLUrvADszRoOL8KgZq46d6v8JO2wpub7?=
 =?us-ascii?Q?K9/OQROMSQvJhyxc8Ud4KpnbsgmFVrCzHTyCW4pp2N1yyj2ZIDbOvAtO66Fe?=
 =?us-ascii?Q?A10K74q8MIDgAgIM1plQslgUtlAcXoAHtW/w672Cne6ehzIovQtVxYFpOySo?=
 =?us-ascii?Q?8/jDAOPVdhL+REkzUOGfBmhnBvZFZorS02kIK/Koh89Hn5sT+qHlJ15fG5u7?=
 =?us-ascii?Q?8LiPBHRNYTIQmQq+HzleT0EAqS5NVA5UOaOkMflpTbUCosKtxo2HT4Gf+EhA?=
 =?us-ascii?Q?SXWF6370rs/HVQoem2hU7y0qGz1zVtQs5SoHpMmmRdVRivXS22FFe9F9jf/2?=
 =?us-ascii?Q?Am0mj7DU3FWNeTmJv4Md13UvYAD81+VV/6FCq6GPSaAf13Aew4AJZ3JtRSxT?=
 =?us-ascii?Q?NDZItbsugRoxwKQ56hNPusqxgYzBy2MlJkE9LH3uxyeEjphRXWoznPFEQUtT?=
 =?us-ascii?Q?l2YB9sGWWT85bDTNsy8QfTTNhw+3lkZ+DtpXEdEzuQoX03uvp2DWEhY1H4/f?=
 =?us-ascii?Q?yIX9zInZE4J3wLbYgCYTVhQSE+E9h5a5us6bmYzHlEjgPVrTSFHL2xzlXdZs?=
 =?us-ascii?Q?SzoIAUfMJll9wqcf20a1FfnCDAuCoUs/ff9zClYlenpSkQmhIlaBL+4gJc5k?=
 =?us-ascii?Q?dwMdydyCpvRGtSe+1u9XojhfsxxCBCECLmhL743W8tc2CeIxERhzKN9rrpN6?=
 =?us-ascii?Q?SnupuUZMb9/wrcJphBfHrvkHub4z3wXHbUm/MzfvloBv4Q3GdQKTo12UHwQN?=
 =?us-ascii?Q?Lim0d3ntcMr7q6yIqHvmRnT2axGWNNKQ62I/cthxn/s2cROPAaulA+c4GadQ?=
 =?us-ascii?Q?8Iy+pnUBogElFzx3i7ZVZR2TLhK7Azm98XnvzbeJDL5ZrJTu276bJSvZ5yZD?=
 =?us-ascii?Q?kw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6843.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f7558e-fee9-4db4-c602-08d9aaa421c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 15:00:16.6402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wDItl5O4piTjkST8k3+goG63sj+bAA8t7U5kNixczNE838ajaesS/rlTgxhNDmzAElTzIy2zLIO/zBnhjGy1Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6266
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

> -----Original Message-----
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Thursday, November 18, 2021 9:18 PM
> To: Xu Yang <xu.yang_2@nxp.com>
> Cc: linux@roeck-us.net; gregkh@linuxfoundation.org; linux-
> usb@vger.kernel.org; Jun Li <jun.li@nxp.com>; dl-linux-imx <linux-
> imx@nxp.com>
> Subject: [EXT] Re: [PATCH] usb: typec: tcpm: fix tcpm unregister port but
> leave a pending timer
>=20
> Caution: EXT Email
>=20
> Hi,
>=20
> On Thu, Nov 18, 2021 at 05:23:52PM +0800, Xu Yang wrote:
> > @@ -6428,6 +6432,9 @@ void tcpm_unregister_port(struct tcpm_port
> > *port)  {
> >       int i;
>=20
> You need to take the port lock here, no?
>=20
>         mutex_lock(&port->lock);
>=20
> > +     kthread_destroy_worker(port->wq);
> > +     port->wq =3D NULL;
>=20
>         mutex_unlock(&port->lock);

I think we should not take the port lock before kthread_destroy_worker() si=
nce a deadlock might occur. Considering a work is pending and tcpm_unregist=
er_port is called at this time, the worker needs to flush all the works aft=
er taking the port lock in tcpm_unregister_port(). However, the work can't =
take the port lock anymore.

Xu Yang

>=20
> >       hrtimer_cancel(&port->send_discover_timer);
> >       hrtimer_cancel(&port->enable_frs_timer);
> >       hrtimer_cancel(&port->vdm_state_machine_timer);
> > @@ -6439,7 +6446,6 @@ void tcpm_unregister_port(struct tcpm_port
> *port)
> >       typec_unregister_port(port->typec_port);
> >       usb_role_switch_put(port->role_sw);
> >       tcpm_debugfs_exit(port);
> > -     kthread_destroy_worker(port->wq);
> >  }
> >  EXPORT_SYMBOL_GPL(tcpm_unregister_port);
>=20
> thanks,
>=20
> --
> heikki
