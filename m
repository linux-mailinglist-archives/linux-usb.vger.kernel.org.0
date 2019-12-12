Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51C0211C6C0
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 08:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbfLLH7C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 02:59:02 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37035 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728138AbfLLH7C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Dec 2019 02:59:02 -0500
Received: by mail-lj1-f193.google.com with SMTP id u17so1181824lja.4
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 23:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=er7DAcFICx0rKKOlnV9LfdL7A6Gk4GzCPZQpjtzGMDg=;
        b=H3zbmkfVegTVdP2vPKqSxbRZU3DalQQ956d88IXuBHFdzhGsKq3FHmbN49XtON/GY3
         P2rvtcYAuHUuetAss4YVqEN8j6XRKP8RcOqIO1D++uLKrzO9lVc3IpFvN2lFZ0m3cHEr
         LQK3Z+Ex2pl0VLelJnSB3XtiyXnCM9Cbn+bx5abRHp5Acb7Wk/xj86e38bv4OqV6KyAl
         MuijVRtsadMpz6IS5aL0hXOeImfUbf3PwRCwUyZFxI2iyoP4VBhNq0hMAhc0vV2nKTVc
         054HmcpopPelecVkpyb/ut/1Q2JEAs6tnnbBTVA4RGAJX/IdmPNPw7Zz2tioKywEI6BT
         iA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=er7DAcFICx0rKKOlnV9LfdL7A6Gk4GzCPZQpjtzGMDg=;
        b=QjqzY7r+FtkXneUEtIaMx6ftyXOqAXvZU952JkLrVQz6CCfyYXUQP4wyl0QQR+wL8X
         A3D6g5kLqRbXQe+kMPEBmUdLeQ2IpYaimWoL5Fma5FzKbDH/8rpq8eLRri4aJoMsBWxR
         Zvqgm6sm6WG51YzKYbf+BlV2iFQpVQdzFF+ZbHKnXkC9GHyn7e3Y0Qd4RGIrDQ5q+FY6
         e5DX5ulcRySQSmiEVrazZ4qK4cM7lscECfQgyLKbuXHNrpufCM1u+AjhN52DnYi96XO2
         IqgFYXsoA8luVUXT66vKtXJZVqDRe/E8xBCM3wRtg16fPMsvyM5TSPUClpVqtk2pez85
         9o3w==
X-Gm-Message-State: APjAAAV0GVSE2cub7r+2879kfc5Cc9w0pN2ySpSsbDOqllepmWRW5oI5
        E2hr2YZ41w0WyuTZOPmos8pZ4tJQLM4vfQ==
X-Google-Smtp-Source: APXvYqx287iLhR2F8UJ1yX1VxGIf93w02Q4ema6roArPvAM2QnyVQuOu5BWC0XH6UKT9IZK22AtR2A==
X-Received: by 2002:a2e:9e55:: with SMTP id g21mr4792102ljk.245.1576137540487;
        Wed, 11 Dec 2019 23:59:00 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id l7sm2415260lfc.80.2019.12.11.23.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 23:58:59 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 03/14] usb: composite: Properly report lsm
In-Reply-To: <0ff7d475567f10e2f5051554daaa41d2ce03aa35.1576118671.git.thinhn@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com> <0ff7d475567f10e2f5051554daaa41d2ce03aa35.1576118671.git.thinhn@synopsys.com>
Date:   Thu, 12 Dec 2019 09:59:45 +0200
Message-ID: <871rtax9ce.fsf@kernel.org>
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

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> Use the max lane speed mantisa value from the gadget and report to the
> device descriptor if available.
>
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> ---
>  drivers/usb/gadget/composite.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composit=
e.c
> index a4de5a8c0f19..cd38078d6a42 100644
> --- a/drivers/usb/gadget/composite.c
> +++ b/drivers/usb/gadget/composite.c
> @@ -682,6 +682,11 @@ static int bos_desc(struct usb_composite_dev *cdev)
>  	/* The SuperSpeedPlus USB Device Capability descriptor */
>  	if (gadget_is_superspeed_plus(cdev->gadget)) {
>  		struct usb_ssp_cap_descriptor *ssp_cap;
> +		int lsm =3D 10;
> +
> +		if (cdev->gadget->ops->udc_set_sublink_attr &&
> +		    cdev->gadget->max_lsm)
> +			lsm =3D cdev->gadget->max_lsm;
>=20=20
>  		ssp_cap =3D cdev->req->buf + le16_to_cpu(bos->wTotalLength);
>  		bos->bNumDeviceCaps++;
> @@ -709,20 +714,21 @@ static int bos_desc(struct usb_composite_dev *cdev)
>  		 *   ST  =3D Symmetric, RX
>  		 *   LSE =3D  3 (Gbps)
>  		 *   LP  =3D  1 (SuperSpeedPlus)
> -		 *   LSM =3D 10 (10 Gbps)
> +		 *   LSM =3D  5 or 10
>  		 */
>  		ssp_cap->bmSublinkSpeedAttr[0] =3D
> -			cpu_to_le32((3 << 4) | (1 << 14) | (0xa << 16));
> +			cpu_to_le32((3 << 4) | (1 << 14) | (lsm << 16));

while at that, can we get rid of the magic constants?

>  		ssp_cap->bmSublinkSpeedAttr[1] =3D
>  			cpu_to_le32((3 << 4) | (1 << 14) |
> -				    (0xa << 16) | (1 << 7));
> +				    (lsm << 16) | (1 << 7));

ditto.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl3x83EACgkQzL64meEa
mQaTXg/+N0tSsEXuOZnZ4ErlvHVmTgdjGwKg+fM1rB9Yrm2fKnfby1lU/imLI1yq
SmSI90xHU6/6iIt9KkzLZ1WuK153KWWxG/jlhx4dgv+RcqYyU6mDNx1kTAsb3aMk
rEGNLB9QVcGbzFh1v049e7uvMNOJgm2+X45TIRKKKPW/xYvZr1fmdh4wTfm6ADr9
z8Euona33NJyPRD7VofmEfy2NtdhpbQ7x2QMQPBSWDmDhgqF1Em/EBpY0ds67y5L
1Q44YE3fJ1eB3sev9bkrTrgHWm3X4CwZ5UP81zShAWjS2e8C7jTeJOt8IbBUiOZC
mhS8oO/YXRCkOPi+NobGM7TwSfpiVOF2Lgydl/k1afoyzDwD3RcWFnomYMWGxtMT
7Ur8k7Lh1zqLjiV2EDvHou/4x7sxDHEZ1Pmcm9fDDUxJ/RyYLWPAKIw5qObHgpyl
zA0qTSOlcnVXg4AeyuQlsiN2kCxX6doQr6hXnz6O/xDRXaesEEgZP+RkrHRp8R6x
hksWrLHgmuE6tiPfkAWTUibjBTH3gTK/TsoIKA/v4EGs6Fb1K0K6zrJQgRRahzJ/
+34tOUKxbGs++EJgVIaj5W+pDCQmb5XwXPmm3EOWq2Z+kuOmSqbATqP4+Xl/d7+V
IGTBjgdRd3NVmLNZV4GS2OEoLZ+HbzeleY0UfBjUo3noDB2iViw=
=q94D
-----END PGP SIGNATURE-----
--=-=-=--
