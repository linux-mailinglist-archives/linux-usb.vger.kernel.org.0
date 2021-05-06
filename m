Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DBE83755B2
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 16:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234841AbhEFOdE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 10:33:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:60246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234002AbhEFOdC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 May 2021 10:33:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28A36610A0;
        Thu,  6 May 2021 14:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620311524;
        bh=X+d1W8aQWThuKSxnAvfRSZH6eIQqew9B4YS7eITyrkc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=jeAklUgj0SQYlTQsqPXXawHjxxcYd1a0VhAWAxKX/aLnO9rW8dDndFusF4qeXj+Vr
         fSszJEXtP4lQM68jnhwvWEEELRXx8KWCu3dl0w0nzFr2ccH38k4lq5Mmy6G+0WBvl8
         ixKwR+Q39G/ehFhGOV74xWZO699RQSEl4axwcP5mv56QIIXPZvW/3sIMiWyPHkA4ZO
         xsYqIbxn4EKaSbBA0ryYC2b4+c73sWQjk8AMddWajAwKn2z6iRs8xZzKAlmTESTj4y
         nb0712U5xqmkFdI9ajG0AYwvRUgVSUFjhYT0i66S8CmOgg1xJXcyUIbLjk0M5eNY5P
         eLvL0m7YPQARg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Jun Li <jun.li@nxp.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "thunder.leizhen@huawei.com" <thunder.leizhen@huawei.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compatible
 string
In-Reply-To: <VI1PR04MB5935825AD977B4180894541589589@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <1619765836-20387-1-git-send-email-jun.li@nxp.com>
 <8735v8ji31.fsf@kernel.org>
 <VI1PR04MB5935F1D26E1F281B7273993F895E9@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <87r1ishz2t.fsf@kernel.org>
 <VI1PR04MB5935825AD977B4180894541589589@VI1PR04MB5935.eurprd04.prod.outlook.com>
Date:   Thu, 06 May 2021 17:31:55 +0300
Message-ID: <87h7jggch0.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Jun Li <jun.li@nxp.com> writes:
>> > 	val =3D readl(dwc3_imx->glue_base + USB_WAKEUP_CTRL);
>> >
>> > 	if ((dwc3->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_HOST) && dwc3->xhc=
i)
>> > 		val |=3D USB_WAKEUP_EN | USB_WAKEUP_SS_CONN |
>> > 		       USB_WAKEUP_U3_EN | USB_WAKEUP_DPDM_EN;
>> > 	else if (dwc3->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_DEVICE)
>> > 		val |=3D USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
>> > 		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
>>=20
>> for this, you could register a listener to the extcon notifier and update
>> these bits accordingly. With that, you would already *know* that
>> dwc3 is probed.
>
> With usb role switch class, there no extcon provider, so I think this way
> can't work for me.

perhaps role switch class could learn about notifiers ;-)

>> > static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx) {
>> > 	struct dwc3_imx8mp	*dwc3_imx =3D _dwc3_imx;
>> > 	struct dwc3		*dwc =3D platform_get_drvdata(dwc3_imx->dwc3);
>> >
>> > 	if (!dwc3_imx->pm_suspended)
>> > 		return IRQ_HANDLED;
>> >
>> > 	disable_irq_nosync(dwc3_imx->irq);
>> > 	dwc3_imx->wakeup_pending =3D true;
>> >
>> > 	if ((dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_HOST) && dwc->xhci)
>> > 		pm_runtime_resume(&dwc->xhci->dev);
>> > 	else if (dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_DEVICE)
>> > 		pm_runtime_get(dwc->dev);
>> >
>> > 	return IRQ_HANDLED;
>> > }
>>=20
>> for this, maybe you need to teach dwc3 core about wakeup irqs instead. H=
ave
>> a look dev_pm_set_dedicated_wake_irq().
>
> Good suggestion, but if extcon notifier listener can't work for me,=20
> my understanding is this *teach* in glue layer driver still need
> access dwc3 core instance struct, right?

for now, maybe. But it may be better to implement a notifier method in
role switch class.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCT/dsRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUhTfgf+NIA9OJwFddmBnvxESTCpgwHB5VK25UYZ
1ezDVmIEHXVcT7zNayVKpMwYymB2sKDJXnk/dENSmhqhIuEe1Of2yFEiim31wSJH
qu4l900nPutcePiAGipE/6U5NRNEgz3pPn3z0F8pSEAICcXIi+skpL1ZhIN1xMAW
3eIx7HQfTEHNG9iKmCGrLC3INMdW7SxjS6fthHwZVpi6X2pXCYUFnBeqj+OOlQqb
RlsigJ8IO6Gw9/e8rnLpFJZYjM2vAAPtZRW1OAuIHAIbcvxfbN96V5tc2zsz1DSo
RhGRCGcU5PppciP1yKtCVxBB5q6HMFbwYsA1UHvLvjZN2Mz7NF/8GQ==
=yk02
-----END PGP SIGNATURE-----
--=-=-=--
