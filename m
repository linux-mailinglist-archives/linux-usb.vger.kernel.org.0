Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F75136F83E
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 12:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbhD3KBI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 06:01:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:54194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229543AbhD3KBH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Apr 2021 06:01:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C110613DA;
        Fri, 30 Apr 2021 10:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619776819;
        bh=y3jeitBBv3wjX6U64WOdxLKaYN1Ljh3VMueE39E7clk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=VYCEqaLevPhHFDt+PqZbXDEOsimQbGZoEW6ZiC/0EgnK5ZAfuKOSPGaMCEPQgJVxb
         6bHEyTEmYQPZaQ6CyXxWBbq0X6voAGKPYIOaxpGmUQ3uAKbyST+A1ZWrpR2kgnBTmI
         WXLiYtBTPqYfGgWpIYObu9dKIj63EZFa1LbWw3nnlTTHaFi0RfgBFQxS6CN7coDBOj
         Uxf9wrG0fmeDfTUh3xOkCCFivc2f7Ldewz149JNHQJGjbFm4JI4tG1MxepxdaNKR/+
         D/IINdMAe2ZMM743+CyNHFLKjC2a49J2Gef92XDkOQYaH/pvWAMKN4WI1LxHVyZ+pi
         MfFWoffY8FqDg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Jun Li <jun.li@nxp.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "thunder.leizhen@huawei.com" <thunder.leizhen@huawei.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compatible
 string
In-Reply-To: <VI1PR04MB5935F1D26E1F281B7273993F895E9@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <1619765836-20387-1-git-send-email-jun.li@nxp.com>
 <8735v8ji31.fsf@kernel.org>
 <VI1PR04MB5935F1D26E1F281B7273993F895E9@VI1PR04MB5935.eurprd04.prod.outlook.com>
Date:   Fri, 30 Apr 2021 13:00:10 +0300
Message-ID: <87r1ishz2t.fsf@kernel.org>
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
>> -----Original Message-----
>> From: Felipe Balbi <balbi@kernel.org>
>> Sent: Friday, April 30, 2021 4:24 PM
>> To: Jun Li <jun.li@nxp.com>; gregkh@linuxfoundation.org
>> Cc: shawnguo@kernel.org; dl-linux-imx <linux-imx@nxp.com>;
>> thunder.leizhen@huawei.com; linux-usb@vger.kernel.org
>> Subject: Re: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compat=
ible
>> string
>>=20
>> Li Jun <jun.li@nxp.com> writes:
>>=20
>> > New schema of usb controller DT-node should be named with prefix
>> > "^usb(@.*)?", dt changed the node name, but missed counter part change
>> > in driver, fix it by switching to use compatible string as the dwc3
>> > core compatible string keeps "snps,dwc3" in all dt.
>> >
>> > Fixes: d1689cd3c0f4 ("arm64: dts: imx8mp: Use the correct name for
>> > child node "snps, dwc3"")
>> > Signed-off-by: Li Jun <jun.li@nxp.com>
>>=20
>>=20
>> Nice fix :-) It may break down if we have two dwc3 nodes as child of a s=
ingle
>> parent, but I guess that's very unlikely anyway.
>>=20
>> Acked-by: Felipe Balbi <balbi@kernel.org>
>>=20
>> That being said, why do need to keep a pointer to the child? I had a qui=
ck
>> look at the driver and it doesn't seem like the pointer is necessary at =
all.
>
> I need keep the child pointer(dwc3 core platform device) to find the dwc3=
 core
> instance struct(struct dwc3), the wakeup setting need check the dwc3 core=
's
> current_dr_role and do runtime resume based on the child's dev.=20

Right, you're talking about the code below. Some suggestions inline:

> static void dwc3_imx8mp_wakeup_enable(struct dwc3_imx8mp *dwc3_imx)
> {
> 	struct dwc3	*dwc3 =3D platform_get_drvdata(dwc3_imx->dwc3);
> 	u32		val;
>
> 	if (!dwc3)
> 		return;

I don't think you need to care if dwc3 has probed or not here.

> 	val =3D readl(dwc3_imx->glue_base + USB_WAKEUP_CTRL);
>
> 	if ((dwc3->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_HOST) && dwc3->xhci)
> 		val |=3D USB_WAKEUP_EN | USB_WAKEUP_SS_CONN |
> 		       USB_WAKEUP_U3_EN | USB_WAKEUP_DPDM_EN;
> 	else if (dwc3->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_DEVICE)
> 		val |=3D USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
> 		       USB_WAKEUP_VBUS_SRC_SESS_VAL;

for this, you could register a listener to the extcon notifier and
update these bits accordingly. With that, you would already *know* that
dwc3 is probed.

> static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
> {
> 	struct dwc3_imx8mp	*dwc3_imx =3D _dwc3_imx;
> 	struct dwc3		*dwc =3D platform_get_drvdata(dwc3_imx->dwc3);
>
> 	if (!dwc3_imx->pm_suspended)
> 		return IRQ_HANDLED;
>
> 	disable_irq_nosync(dwc3_imx->irq);
> 	dwc3_imx->wakeup_pending =3D true;
>
> 	if ((dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_HOST) && dwc->xhci)
> 		pm_runtime_resume(&dwc->xhci->dev);
> 	else if (dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_DEVICE)
> 		pm_runtime_get(dwc->dev);
>
> 	return IRQ_HANDLED;
> }

for this, maybe you need to teach dwc3 core about wakeup irqs
instead. Have a look dev_pm_set_dedicated_wake_irq().

That would clean things up, I think ;)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCL1SoRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUgvHAf/dw7pFIkR6L+qC8SbJ2W0MosWjbE7gNDT
j/BQ47xysWFbchJau9R7JYChkZc9ra2qIORxMMhF0to9KL50eJzXPx+enVcDQwA8
5aHvc3fErjmkyOZPOzUwBN/yDZ2azJi8amEXUjDq/XxFTuvERqEjNKPcqNqJDec5
6QxoM35lP8Kd50QcOgGnir2Qj0SHcHm70QJm23AiTrxvGXO1o+N6HVuDxz0aHe1E
rSYyYqDqJWgcDE3JP0beShs3diWXfAKvhseYO+tLPE9Czw/pggXvU3XRCf/2fUJI
qZSt/WtNJj74sanShyTs2OHrga+SQbpRmBA8bnx7lBZVfqcgVbWzKQ==
=l2Sw
-----END PGP SIGNATURE-----
--=-=-=--
