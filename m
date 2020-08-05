Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC1123D0CE
	for <lists+linux-usb@lfdr.de>; Wed,  5 Aug 2020 21:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbgHETxW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Aug 2020 15:53:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728165AbgHEQuU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Aug 2020 12:50:20 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71F0C061756
        for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2020 03:21:39 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id v15so19447842lfg.6
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2020 03:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Ah/ZcBSJEVAGBLrsCFOv/QBCbiZHuLjKCVPgQvscknA=;
        b=uxihh116LKVWROcMjtX2CNswjzT2IqXBD3iWKgPJYkHqFjFadN+gI+jjwQT2dIvncp
         TssPnFD5qy3tWoqkx/QHFtqVj9KMXXnGJrxlSe90r83kz2EvGQc/l26mmlHlIi9GM/e1
         59SDjfI0EfBDSAaqLzve9I7MkMKxM2Ls8ZxrKderzUeI3HxAa9qhTrC6zdDVkwbuD2OG
         fQRjLPy2wCX/prTO1J41bpIGzA6/5wMmQliXd6Tz4nSULSj8Ms2rIK63gLAb1SWrgGkA
         kespbo1ekNt/4BHMwqy9PtQ65V1xIRYtMG8+L9Awy5F/741X3Ta98zHqh91uiAUvfDA+
         jGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=Ah/ZcBSJEVAGBLrsCFOv/QBCbiZHuLjKCVPgQvscknA=;
        b=JIHNf/LaQVl84iaJ5k+XgaQJgBtYv1Q1BFSVMe6eRRDuox/aTuRNBokbcdZgZcGTpv
         VN1IKNXw12njFVvf4fU2jxb6Fso/P+6+TwEslMM7l95NS7tX5trmsTbuzHLxXU1fOXyT
         lqAN/knSwDNyTFsRYHLYFXUA5JTGdYgWesmBq02QM1hPPk8npOb3FzNuhSGuag3WMZ+F
         xZ4QNpbcIiW0lVcQC5lVhCOdjTtj5sxQGZzH67kbkKDyavKJWxjxHJWhOBFIZU83lyqC
         c7llWOs0Syf/g3BE/dOTAB9C3Hi2Ai61ueqJY2nmKch5a9xav6uyuE5pHkC4sQebXKqP
         ymzA==
X-Gm-Message-State: AOAM530nIi9MuxFxfRLxVfumPYZAVp6lpgemkWmeGrDA8qO+cJKqSEV4
        R13rvKvgYfN6GXuqAMnxh9nO9lfw
X-Google-Smtp-Source: ABdhPJyCRMIMI/DUgMf8ZsxY8BTONb8+7VenCNlKknXzvwpMBISrEYCfNyY/XU5QTROUKZiYURLKgg==
X-Received: by 2002:a19:ac02:: with SMTP id g2mr1246691lfc.155.1596622894802;
        Wed, 05 Aug 2020 03:21:34 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id b204sm911808lfd.48.2020.08.05.03.21.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Aug 2020 03:21:34 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Lorenzo Colitti <lorenzo@google.com>, linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, zenczykowski@gmail.com,
        Lorenzo Colitti <lorenzo@google.com>
Subject: Re: [PATCH] usb: gadget: f_ncm: allow using NCM in SuperSpeed Plus gadgets.
In-Reply-To: <20200805075810.604063-1-lorenzo@google.com>
References: <20200805075810.604063-1-lorenzo@google.com>
Date:   Wed, 05 Aug 2020 13:21:21 +0300
Message-ID: <87mu39tmu6.fsf@kernel.org>
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

Lorenzo Colitti <lorenzo@google.com> writes:

> Currently, using f_ncm in a SuperSpeed Plus gadget results in
> an oops in config_ep_by_speed because ncm_set_alt passes in NULL
> ssp_descriptors. Fix this by defining new descriptors for
> SuperSpeed Plus. (We cannot re-use the existing definitions for
> the SuperSpeed descriptors, even though they are mostly the same,
> because they are not fixed initializers).
>
> Also fix reported bandwidth to match bandwidth reported for
> SuperSpeed. This calculation is already incorrect, because it
> returns 851 Mbps and NCM can already reach speeds in excess of
> 1.7 Gbps on a 5 Gbps port. But it's better to return 851 Mbps
> than 9 Mbps for SuperSpeed Plus.
>
> Tested: enabled f_ncm on a dwc3 gadget and 10Gbps link, ran iperf
> Signed-off-by: Lorenzo Colitti <lorenzo@google.com>
> ---
>  drivers/usb/gadget/function/f_ncm.c | 79 ++++++++++++++++++++++++++++-
>  1 file changed, 77 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/fun=
ction/f_ncm.c
> index 1d900081b1..91f87165e7 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -85,7 +85,8 @@ static inline struct f_ncm *func_to_ncm(struct usb_func=
tion *f)
>  /* peak (theoretical) bulk transfer rate in bits-per-second */
>  static inline unsigned ncm_bitrate(struct usb_gadget *g)
>  {
> -	if (gadget_is_superspeed(g) && g->speed =3D=3D USB_SPEED_SUPER)
> +	if ((gadget_is_superspeed(g) && g->speed =3D=3D USB_SPEED_SUPER) ||
> +	    (gadget_is_superspeed_plus(g) && g->speed =3D=3D USB_SPEED_SUPER_PL=
US))
>  		return 13 * 1024 * 8 * 1000 * 8;

shouldn't this be 16 * 1024 * 8 * 1000 * 8? I mean, assuming we have
bMaxBurst set to 15. If I remember how this calculation was done it was:

	13 packets / uFrame
        1024 bytes per packet
        8000 uFrames / second
        8    bits / byte

But for SS and SSP what controls the number of packets in a uFrame is
bMaxBurst, which can go up to 16 (15 + 1). Seems like we should also
update ss_ncm_bulk_comp_desc to set a bMaxBurst of 15:

@@ -381,8 +381,8 @@ static struct usb_ss_ep_comp_descriptor ss_ncm_bulk_com=
p_desc =3D {
 	.bLength =3D		sizeof(ss_ncm_bulk_comp_desc),
 	.bDescriptorType =3D	USB_DT_SS_ENDPOINT_COMP,
=20
=2D	/* the following 2 values can be tweaked if necessary */
=2D	/* .bMaxBurst =3D		0, */
+	.bMaxBurst =3D		15,
+	/* the following value can be tweaked if necessary */
 	/* .bmAttributes =3D	0, */
 };
=20
But anyway, if we change 13 to 16, then we 1Gbps. How did you get
1.7Gbps? I think we should really update ncm_bitrate() to contain the
correct equations for bitrate on different speeds.

> @@ -400,6 +401,75 @@ static struct usb_descriptor_header *ncm_ss_function=
[] =3D {
>  	NULL,
>  };
>=20=20
> +/* super speed plus support: */
> +
> +static struct usb_endpoint_descriptor ssp_ncm_notify_desc =3D {
> +	.bLength =3D		USB_DT_ENDPOINT_SIZE,
> +	.bDescriptorType =3D	USB_DT_ENDPOINT,
> +
> +	.bEndpointAddress =3D	USB_DIR_IN,
> +	.bmAttributes =3D		USB_ENDPOINT_XFER_INT,
> +	.wMaxPacketSize =3D	cpu_to_le16(NCM_STATUS_BYTECOUNT),
> +	.bInterval =3D		USB_MS_TO_HS_INTERVAL(NCM_STATUS_INTERVAL_MS)
> +};
> +
> +static struct usb_ss_ep_comp_descriptor ssp_ncm_notify_comp_desc =3D {
> +	.bLength =3D		sizeof(ssp_ncm_notify_comp_desc),
> +	.bDescriptorType =3D	USB_DT_SS_ENDPOINT_COMP,
> +
> +	/* the following 3 values can be tweaked if necessary */
> +	/* .bMaxBurst =3D		0, */
> +	/* .bmAttributes =3D	0, */
> +	.wBytesPerInterval =3D	cpu_to_le16(NCM_STATUS_BYTECOUNT),
> +};
> +
> +static struct usb_endpoint_descriptor ssp_ncm_in_desc =3D {
> +	.bLength =3D		USB_DT_ENDPOINT_SIZE,
> +	.bDescriptorType =3D	USB_DT_ENDPOINT,
> +
> +	.bEndpointAddress =3D	USB_DIR_IN,
> +	.bmAttributes =3D		USB_ENDPOINT_XFER_BULK,
> +	.wMaxPacketSize =3D	cpu_to_le16(1024),
> +};
> +
> +static struct usb_endpoint_descriptor ssp_ncm_out_desc =3D {
> +	.bLength =3D		USB_DT_ENDPOINT_SIZE,
> +	.bDescriptorType =3D	USB_DT_ENDPOINT,
> +
> +	.bEndpointAddress =3D	USB_DIR_OUT,
> +	.bmAttributes =3D		USB_ENDPOINT_XFER_BULK,
> +	.wMaxPacketSize =3D	cpu_to_le16(1024),
> +};
> +
> +static struct usb_ss_ep_comp_descriptor ssp_ncm_bulk_comp_desc =3D {
> +	.bLength =3D		sizeof(ssp_ncm_bulk_comp_desc),
> +	.bDescriptorType =3D	USB_DT_SS_ENDPOINT_COMP,
> +
> +	/* the following 2 values can be tweaked if necessary */
> +	/* .bMaxBurst =3D		0, */

should you add bMaxBurst =3D 15 here?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8qiCMACgkQzL64meEa
mQb9Qg/+NPORONaGT4CIJsVR90vmmhbI8CXoU7L2M9hVnqRnW5nKjdnHrK4sEkG5
VCcDOBAc+OLr9juXiYTw6igBbqfi8SaziwYKtGvRxE3lE1WlHvlFDSrRbQ0zOmrD
noLtPdiEeECNO0effJJnbdzpPrr+V6K2/TQbDOd6hVD5ogAyL5J7HUB4r/N5QNC0
trcci4yTyYkiQXZ9Zqkd/iwaIPqLBcrvJ0irgg85+Asmf/dtSy/takrW0M/U9Fy8
o0XUuAjutY4PASUQvL6ALH3oecDDn6XUUifQIF9U1tSyk2QjoajHNRe6y3BDJWfd
JuDGHCz4gkGovDphGO2QYH+8oCjxajqnvwmu8gbvHNsQ3Ttx4wHI/79ldLBF6UJb
vN+IyyZ49KnuEHUzKR0n19rfagcRm6HW33CymX51uiJ6SKOVizJE6HMxfFh/Munr
6kIcPmVqVRAwCXoUYAB2NYkmjFCuj9F1y0tA9Oayyy9hryn72XazpBKZPmb2f+W7
Dfhfh7XpVxEzpC+f8nzyER3dWUkT46EFKPhN7eUuEvkb3r6b3hJjKHrD4EMm6fJ/
krSUzZS8gu95iRQW1uDe03MuOdrMN4qUKWAXcKq7McT/uAiOXKCL7KEK3p45hyz4
ojh5EUD2Ff88CrLEinPCX06kziSCj7wGf3fiV2pxKI52ZQm7qus=
=iJ1F
-----END PGP SIGNATURE-----
--=-=-=--
