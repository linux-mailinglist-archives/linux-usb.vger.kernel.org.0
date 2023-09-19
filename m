Return-Path: <linux-usb+bounces-369-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7267A5C6A
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 10:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 844121C20CBC
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 08:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DEDD3D382;
	Tue, 19 Sep 2023 08:23:39 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A505B30F96
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 08:23:37 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 423A7114
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 01:23:36 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiW18-0005EM-2u; Tue, 19 Sep 2023 10:23:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiW14-007PaD-3Q; Tue, 19 Sep 2023 10:23:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiW13-002vrk-Q6; Tue, 19 Sep 2023 10:23:29 +0200
Date: Tue, 19 Sep 2023 10:23:27 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH v2] usb: mtu3: Convert to platform remove callback
 returning void
Message-ID: <20230919082327.pe32kmjuiqdkorn7@pengutronix.de>
References: <20230914200251.919584-1-u.kleine-koenig@pengutronix.de>
 <3cdb8de0223327b820b5344945ce53c0555f4882.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dgisloszaa65nqhb"
Content-Disposition: inline
In-Reply-To: <3cdb8de0223327b820b5344945ce53c0555f4882.camel@mediatek.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--dgisloszaa65nqhb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Sep 19, 2023 at 07:52:04AM +0000, Chunfeng Yun (=E4=BA=91=E6=98=A5=
=E5=B3=B0) wrote:
> On Thu, 2023-09-14 at 22:02 +0200, Uwe Kleine-K=C3=B6nig wrote:
> > @@ -469,8 +469,17 @@ static int mtu3_remove(struct platform_device
> > *pdev)
> >  ssusb_gadget_exit(ssusb);
> >  ssusb_host_exit(ssusb);
> >  break;
> > -default:
> > -return -EINVAL;
> > +case USB_DR_MODE_UNKNOWN:
> > +/*
> > + * This cannot happen because with dr_mode =3D=3D
> > + * USB_DR_MODE_UNKNOWN, .probe() doesn't succeed and so
> > + * .remove() wouldn't be called at all. However (little
> > + * surprising) the compiler isn't smart enough to see that, so
> > + * we explicitly have this case item to not make the compiler
> > + * wail about an unhandled enumeration value.
> > + */
> > +WARN_ON(1);
> > +break;
> How about changing as below:
>     defualt:
>        break;
> >  }

I think a warning is a good idea as today that case cannot happen
(unless I missed something) and if it still happened, you'd want to know
as the handling is insufficient then. And I also think that if the enum
usb_dr_mode should ever be expanded, this code location should be
revisited, so the explicit "case USB_DR_MODE_UNKNOWN" is better in my
opinion.

As you suggest this variant you seem to have some upside in mind, didn't
put it into your message though. Would you share your thoughts?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dgisloszaa65nqhb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUJWn8ACgkQj4D7WH0S
/k7KAAf6A/b5sNPF54k+Ma3oN7Fax1Z2w856jPyHME6jLc7u/AG9osjTHvunNeAA
EcI/eIN8DKaB/uxZefCKy9Ei9fV5E/1rnExa/4VwG2HMzTkGAbIK3hMxwKFm/fkt
BE0z61M6xMvxCj53r0SI/Zz6IlJtM1qsrzCEYJMyvsLafun/jUFHQS0mbYHtnts7
nor6AoG83yWWrc0vd0pfjV+QnjzYVl767H9ws1I5o+3Hlu/Nat6CfGs1a2ma8ArB
6p0tVnS1jiwzZY2R3TCOIFy2QKFJNb/vPSKvqy9MRrYrGZUIRPgDXWrkO7LLnac+
dFxjJfjs8z+QRCJpr51crY2sjjTKXQ==
=f/ok
-----END PGP SIGNATURE-----

--dgisloszaa65nqhb--

