Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECB89CCF6
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2019 12:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731202AbfHZKB3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Aug 2019 06:01:29 -0400
Received: from mga17.intel.com ([192.55.52.151]:21682 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726820AbfHZKB3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Aug 2019 06:01:29 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Aug 2019 03:01:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,431,1559545200"; 
   d="asc'?scan'208";a="331411937"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga004.jf.intel.com with ESMTP; 26 Aug 2019 03:01:16 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: NULL pointer issue due to .pullup timeout at dwc3
In-Reply-To: <VI1PR04MB5327779C65037389EB8400148BA10@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <VI1PR04MB5327779C65037389EB8400148BA10@VI1PR04MB5327.eurprd04.prod.outlook.com>
Date:   Mon, 26 Aug 2019 13:01:07 +0300
Message-ID: <87pnks1c0s.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Peter Chen <peter.chen@nxp.com> writes:

> Hi Balbi,
>
> When do configfs function add and remove stress test, I find dwc3
> gadget .pullup will timeout if there is a request on the way. Even I

what do you mean by "a request on the way"?

> enlarge the delay, there is still timeout for .pullup.
>
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index f13bef950951..e95955b6a225 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -1827,6 +1827,7 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, i=
nt is_on, int suspend)
>         do {
>                 reg =3D dwc3_readl(dwc->regs, DWC3_DSTS);
>                 reg &=3D DWC3_DSTS_DEVCTRLHLT;
> +               udelay(1);
>         } while (--timeout && !(!is_on ^ !reg));
>=20=20
>         if (!timeout)
> @@ -1861,6 +1862,8 @@ static int dwc3_gadget_pullup(struct usb_gadget *g,=
 int is_on)
>         spin_lock_irqsave(&dwc->lock, flags);
>         ret =3D dwc3_gadget_run_stop(dwc, is_on, false);
>         spin_unlock_irqrestore(&dwc->lock, flags);
> +       if (ret)
> +               dev_err(dwc->dev, "%s:ret =3D %d\n", __func__, ret);
>=20=20
>         return ret;
>  }
>
> This timeout causes the NULL pointer issue for ethernet gadget, eg. NCM, =
the reason
> is ncm->notify_req is NULL, but the ncm_notify_complete is not called bef=
ore .unbind is
> called. See below oops:

sounds like a bug in ncm. If we haven't connected to host side yet, we
can't really complete the request.

> It is very easy to reproduce it, just create ncm function,
> and sleep 1 second, then, remove it.
>
> I am not sure if it is the common issue for dwc3, there is no such
> requirement for chipidea and cadence3. Would you please have a check?

could you capture tracepoints of what's happening here?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl1jreMACgkQzL64meEa
mQaGUhAAsBmc1I8wO54s2fHEIyB9f7BtKRfr5hwP5LrNLVbKev0qdbwfqTO5XKCb
DJHv4KzHQaJxnxwTaM2ceFZ60S/zdfbHlkV+d44OWNcqunJzv6I+V0VhuMYoPWio
DLfDvQIQbF2nb2vFsxXqOOlmELT9qfiXEz6l3WqK/2u5KsXjGKNreAYFwbUlSY10
NyXvJqdd0mlsRFrI1d5OPQQzuvnYGBjtaQJFDBAtlTdGxRf6ASEK4wZSrsexDau7
YKF+dkk/lN2TrM2Mnf8xUJ0Y8bGWfgMFqimtmj9sHeK37sUxchYXlsBvJKTLT5FU
ZKpSC+06aov8QD0l6Lqx5hA43Yod+rSIT6ROWziaok3mzecH4b9LrFrULsxK9zls
QR4GyvUv4icmvk9SSkOk8kmRqyiYD1IxbyrR41Hh7Mxg4vKbjhV3H4p8LukzDnkq
EN5Sck/Dzd6uoAU6QxOp0AuZ0Jcp31Hyxp/2naVEdnV70mtRX1KusLbdsUF1N9kz
+CFdtI5qaXvBY7Fji+K3s0slIyF06kiZJFWDDUZI6djkFsoLw0emZDs9VDl8DqeR
WMPww12RalRSsBU+9a0M2puTvAr6R07bFukkA26Visl0GprV2MXOR571AruX2vF1
NfuURm2uWOgnvZfPCtiVCbbzLDoYUKlW6FPfhPRl8q0s5bmj5yU=
=LLbh
-----END PGP SIGNATURE-----
--=-=-=--
