Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7409211C6DC
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 09:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728176AbfLLIOQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 03:14:16 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43317 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728157AbfLLIOQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Dec 2019 03:14:16 -0500
Received: by mail-lj1-f194.google.com with SMTP id a13so1203592ljm.10
        for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2019 00:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=U8gtYhiw9ppnja1vQjo7ifdxzVjaYyo3qbg9wTKa3M0=;
        b=biTj/M7UU1+9VWQz4c9AaqO1D5cvHQfUF1RD4UblEq5kBKAW6qNIS19svzd+2KCrEM
         4E+ITooeCUrRv1oLoMN47nhp/DlKPJCeZtO3IzTN6QCRCNB4Q/9UKTv3QYhDDa0o1cxr
         mNwih0BgBeTRphL6CIrY1jp2wbQ7fHkuWKevEEJDe1jFcTl7+sbeQdAVstVEigEW/x0Y
         L+YPbx7VkJ/eaRH61GTtOS6dSBhKFoEvdIFpGrCOaqy2cdh2DoRalhk8xYBSGx/7C68H
         qViVP8ZtlMOWFRa7UKFCDjvsHe1qv/7coNEzQ1Hc3o5+I0efUbOgLZk605JUrt/fBRjj
         UtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=U8gtYhiw9ppnja1vQjo7ifdxzVjaYyo3qbg9wTKa3M0=;
        b=QveP1AxG5BhBIb4tHg/0hhGvHWhLtacK1TbXBVaCUERae02pSsIOD7eqVXZxS/t78K
         BFpfU/lL91isShFqsSqJ5Ho/d24CmsdxusD7KCTU8v2OSZlzmKvVS627d6B7MDMPhBeD
         I0CcRQyRnVrQSz4NMIKSBM6FAmmzTlT/qHtGgRI/JFYeayV91+Vc9tB9mjAzHIa3ejRX
         PmVUHrBSY3glhfYApq3Uxqf3CgZ0gg+N9wt+eJ5VA+gH5qYUMekCg0Nsz/zVHPrnQD5f
         zgkhUKYSy40v5Wgw4OSWMe3raNana1ztFx7ABCCEHG94rTPGUXiuqlKUaU1LSqecGZoc
         ZBqg==
X-Gm-Message-State: APjAAAWOApUbhhQ/cDYo7jsAr9eDAjqAdKWjRBNVxbvdomOyN9Z2eaqi
        DQvOxn9LSM49DI7UjosHRGcyZZM/46zWXQ==
X-Google-Smtp-Source: APXvYqxyC7JSTCyygnHjCstlEN208SXkESwdvjgRUmM4V6x2QiOD9LXMIUoutBfuhy53d36QZ3DFag==
X-Received: by 2002:a2e:9842:: with SMTP id e2mr5112718ljj.101.1576138453103;
        Thu, 12 Dec 2019 00:14:13 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id q27sm2526284ljm.25.2019.12.12.00.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 00:14:12 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 07/14] usb: dwc3: gadget: Set lane count and lsm
In-Reply-To: <808d8ad39fc584e2f85e20148d56bd49c50aebf6.1576118671.git.thinhn@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com> <808d8ad39fc584e2f85e20148d56bd49c50aebf6.1576118671.git.thinhn@synopsys.com>
Date:   Thu, 12 Dec 2019 10:14:57 +0200
Message-ID: <87sglqvu2m.fsf@kernel.org>
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

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:

> DWC_usb32 supports dual-lane at different transfer rate. This patch
> initializes the controller to use the maximum support transfer rate
> describes by the dwc3 device property of lane count and lane speed
> mantissa in Gbps.

Perhaps this should read as:

	"DWC_usb32 supports dual-lane at different transfer rate. This
	patch initializes the controller to use the maximum supported
	transfer rate described by the dwc3 device property of lane
	count and lane speed mantissa in Gbps."

> @@ -1424,6 +1428,38 @@ static void dwc3_check_params(struct dwc3 *dwc)
>=20=20
>  		break;
>  	}
> +
> +	switch (dwc->maximum_lsm) {
> +	case 5:
> +		break;
> +	case 10:
> +		if (dwc->maximum_speed =3D=3D USB_SPEED_SUPER)
> +			dev_err(dev, "invalid maximum_lsm parameter %d\n",
> +				dwc->maximum_lsm);
> +		/* Fall Through */
> +	default:
> +		if (dwc->maximum_speed =3D=3D USB_SPEED_SUPER)
> +			dwc->maximum_lsm =3D 5;
> +		else if (dwc->maximum_speed > USB_SPEED_SUPER)
> +			dwc->maximum_lsm =3D 10;
> +		break;
> +	}
> +
> +	switch (dwc->maximum_lanes) {
> +	case 1:
> +	case 2:
> +		break;
> +	default:
> +		if (dwc->maximum_lanes > 2)
> +			dev_err(dev, "invalid number of lanes %d\n",
> +				dwc->maximum_lanes);
> +
> +		if (dwc3_is_usb32(dwc) &&
> +		    dwc->maximum_speed =3D=3D USB_SPEED_SUPER_PLUS)
> +			dwc->maximum_lanes =3D 2;
> +		else
> +			dwc->maximum_lanes =3D 1;
> +	}
>  }
>=20=20
>  static int dwc3_probe(struct platform_device *pdev)
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 7fde3c7da543..8e729d4cd5bd 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -376,6 +376,8 @@
>  #define DWC3_GUCTL2_RST_ACTBITLATER		BIT(14)
>=20=20
>  /* Device Configuration Register */
> +#define DWC3_DCFG_NUMLANES(n)	(((n) & 0x3) << 30) /* DWC_usb32 only */
> +
>  #define DWC3_DCFG_DEVADDR(addr)	((addr) << 3)
>  #define DWC3_DCFG_DEVADDR_MASK	DWC3_DCFG_DEVADDR(0x7f)
>=20=20
> @@ -449,6 +451,8 @@
>  #define DWC3_DEVTEN_USBRSTEN		BIT(1)
>  #define DWC3_DEVTEN_DISCONNEVTEN	BIT(0)
>=20=20
> +#define DWC3_DSTS_CONNLANES(n)		(((n) >> 30) & 0x3) /* DWC_usb32 only */
> +
>  /* Device Status Register */
>  #define DWC3_DSTS_DCNRD			BIT(29)
>=20=20
> @@ -946,6 +950,8 @@ struct dwc3_scratchpad_array {
>   * @nr_scratch: number of scratch buffers
>   * @u1u2: only used on revisions <1.83a for workaround
>   * @maximum_speed: maximum speed requested (mainly for testing purposes)
> + * @maximum_lsm: maximum lane speed mantissa in Gbps
> + * @maximum_lanes: maximum lane count
>   * @ip: controller's ID
>   * @revision: controller's version of an IP
>   * @version_type: VERSIONTYPE register contents, a sub release of a revi=
sion
> @@ -973,6 +979,7 @@ struct dwc3_scratchpad_array {
>   * @ep0state: state of endpoint zero
>   * @link_state: link state
>   * @speed: device speed (super, high, full, low)
> + * @lane_count: number of connected lanes
>   * @hwparams: copy of hwparams registers
>   * @root: debugfs root folder pointer
>   * @regset: debugfs pointer to regdump file
> @@ -1100,6 +1107,8 @@ struct dwc3 {
>  	u32			nr_scratch;
>  	u32			u1u2;
>  	u32			maximum_speed;
> +	u8			maximum_lsm;
> +	u8			maximum_lanes;
>=20=20
>  	u32			ip;
>=20=20
> @@ -1159,6 +1168,7 @@ struct dwc3 {
>  	u8			u1pel;
>=20=20
>  	u8			speed;
> +	u8			lane_count;
>=20=20
>  	u8			num_eps;
>=20=20
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index a6d562e208a9..c31144af3261 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -2183,6 +2183,53 @@ static void dwc3_gadget_set_speed(struct usb_gadge=
t *g,
>  	spin_unlock_irqrestore(&dwc->lock, flags);
>  }
>=20=20
> +static void dwc3_gadget_set_sublink_attr(struct usb_gadget *g,
> +					 unsigned int lane_count,
> +					 unsigned int lsm)
> +{
> +	struct dwc3	*dwc =3D gadget_to_dwc(g);
> +	unsigned int	lanes;
> +	unsigned long	flags;
> +	u32		reg;
> +
> +	spin_lock_irqsave(&dwc->lock, flags);
> +	if (dwc->maximum_speed <=3D USB_SPEED_SUPER) {
> +		/* Fall back to maximum speed supported by HW */
> +		spin_unlock_irqrestore(&dwc->lock, flags);
> +		dwc3_gadget_set_speed(g, dwc->maximum_speed);
> +		spin_lock_irqsave(&dwc->lock, flags);

it looks like we should extract a __dwc3_gadget_set_speed() to avoid the
possible race here:

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index a9aba716bf80..e317b696029e 100644
=2D-- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2118,14 +2118,11 @@ static void dwc3_gadget_config_params(struct usb_ga=
dget *g,
 				cpu_to_le16(DWC3_DEFAULT_U2_DEV_EXIT_LAT);
 }
=20
=2Dstatic void dwc3_gadget_set_speed(struct usb_gadget *g,
+static void __dwc3_gadget_set_speed(struct dwc3 *dwc,
 				  enum usb_device_speed speed)
 {
=2D	struct dwc3		*dwc =3D gadget_to_dwc(g);
=2D	unsigned long		flags;
 	u32			reg;
=20
=2D	spin_lock_irqsave(&dwc->lock, flags);
 	reg =3D dwc3_readl(dwc->regs, DWC3_DCFG);
 	reg &=3D ~(DWC3_DCFG_SPEED_MASK);
=20
@@ -2175,7 +2172,16 @@ static void dwc3_gadget_set_speed(struct usb_gadget =
*g,
 		}
 	}
 	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
+}
+
+static void dwc3_gadget_set_speed(struct usb_gadget *g,
+				  enum usb_device_speed speed)
+{
+	struct dwc3		*dwc =3D gadget_to_dwc(g);
+	unsigned long		flags;
=20
+	spin_lock_irqsave(&dwc->lock, flags);
+	__dwc3_gadget_set_speed(dwc, speed);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 }
=20
Then your patch would look like:

static void dwc3_gadget_set_sublink_attr(struct usb_gadget *g,
					 unsigned int lane_count,
					 unsigned int lsm)
{
	struct dwc3	*dwc =3D gadget_to_dwc(g);
	unsigned int	lanes;
	unsigned long	flags;
	u32		reg;

	spin_lock_irqsave(&dwc->lock, flags);
	if (dwc->maximum_speed <=3D USB_SPEED_SUPER) {
		/* Fall back to maximum speed supported by HW */
		__dwc3_gadget_set_speed(dwc, dwc->maximum_speed);
		goto done;
	}

	[...]
}

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl3x9wEACgkQzL64meEa
mQbm2g//WOQ5lRpEv2B7P6BecABF7IZwzzAnepHUDsNfW8Kno1sp8DTSyBKtAkvJ
2juJ+6q5DVFFhVmVjtQw21FEBEJ6dMVB6KmwgtXvwG9MORY2mpZOc8cAz6BfZ9F0
p/i4HbZp4fzHiZL/MT9WXmT4oM/T+O45A1VzP0Kw+kMg7njQgLqOTZ/yx+rlIAXw
j0Ij45NNPFzRkk7CS0QhAA5e2WRp+ZuHfkcOl2s/RfCnDmq2FlHyTUXj6a+Nn9aD
A+z8erTm6Wno3eV4HsUTBkpSo/NMxAwbajUNyNqkdKQtFAirRYVq28dAnlDzvZG4
ApdKJ7GpsVDJVbjLaPDPeZr5ydloV31y7v6Qclg9d0f/SXQiP3qDqg4JpAEB39po
1X4hOqiDN4ZhbkJZmOHvi6cUWq4X25B9AapQ0a2fj2ydBuuM51FiQ7dCNS4Fsdl6
duLIlVQxOou9R95xDyDXEAxC2KYyP1Ua0nPXz9Ohzlag+vTGOJpNyS3r7jhE9J+a
r1hHnSgBpcRvD5lOAgGsOVKtEdnSOSAsIqa+SiSL/TTMwoa/QazSvzKYuVbMqoDj
v11Q3/pSdm6ZQDh8GZnwR3GIJsibQnVLF/UxxMaBWchNmbMhotFL5qH7osBGzUSk
/5cttCMutBYhERbaelZuGnuuMq/tg+T8u08yUldvqtTKEboT8Z8=
=asAz
-----END PGP SIGNATURE-----
--=-=-=--
