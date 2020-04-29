Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE6941BD678
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 09:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbgD2HsX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 03:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726401AbgD2HsX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Apr 2020 03:48:23 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D48C03C1AD
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2020 00:48:22 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id j14so808872lfg.9
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2020 00:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=2nZjp2HAqzRudFQygNuRF/KnS6oXebF3qSL/RGZ7bWM=;
        b=eh+omnHpcKpAIPRH44Cd9p+x6FDfhQ8bm4R0HhanNEXjtlur950O1HvkxJ/esrr9Xg
         KHRwl7ujKR2YfyNqnjJXp1P7batnJBl7JXTg1r7Q083Qi3W1aP0LJuvLWgKlEHODCiOU
         0GqjmIYd+mdeW6FWDIdD1NBz4mW5IGkuWE7hmsXwbmn90y1cJ2casn8t7Q63sntz8olH
         hkqppxySI2Df3oxEbhDLKi0kfB3hhHvZWRpDO67SvRnSqRLyxAOlXT9yecn9NWOETj9w
         bavTapPV/3lXZTn1tEqObd7Q5iXBp2fsgcFGTWtst/+v/0o2XFsTmgUi4ctR7Gahe0s0
         X/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=2nZjp2HAqzRudFQygNuRF/KnS6oXebF3qSL/RGZ7bWM=;
        b=HgjMz+9KCy/+zSnCRjpa4HMpGhrXKm1mz1fVPapUprjw+MzQouLnQ1EU/PjH6L5qiY
         ZeyaMXUrloSRD3NbOzVisGXZINqXD4YkKcRaYO1XYZj1CMkbDR8YFq5wFxHHryP5bCp2
         9gazu4JoBVZ+cDiji9eg+l4g5DdRCxKh0AnnrmjcRSQwK+mfuFUDElzD4dVUfkv3kSte
         Yx5yPzd8d+ZSnOyyYZ0Q9Wbu9cdKul6goiokhnuRgiGYzTehKuYACbKjFyrY1sVLE/TE
         qN6D/RnmjmFw+TyjgOMd4hJGHosaaNp68vCU5dFUH1NeIDVlJX6G4lDswkQ4BwNFGqK9
         U6oQ==
X-Gm-Message-State: AGi0PubtrgGiYOR6cMbmTAY+3CaIW7wbW6zZOe61wOO1Ks6nuHNo5Qpo
        I6bpju7FdbFW5AOjj/jsKO1RZ8iQWEg=
X-Google-Smtp-Source: APiQypKUofsyXgEm2TFCaYrL4qUzq+eN58VBsJquoLnla2fL7+G9M1Ecfi+p/Zd2rQxFF/6VP8IydA==
X-Received: by 2002:a19:2286:: with SMTP id i128mr5058324lfi.109.1588146501138;
        Wed, 29 Apr 2020 00:48:21 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id j22sm1650536ljh.107.2020.04.29.00.48.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Apr 2020 00:48:20 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 4/5] usb: dwc3: gadget: Handle transfer completion
In-Reply-To: <70555c2202529c6e0bdd23124003d0d4bc637cdc.1588025916.git.thinhn@synopsys.com>
References: <cover.1588025916.git.thinhn@synopsys.com> <70555c2202529c6e0bdd23124003d0d4bc637cdc.1588025916.git.thinhn@synopsys.com>
Date:   Wed, 29 Apr 2020 10:48:16 +0300
Message-ID: <87blna20n3.fsf@kernel.org>
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

> With the new usb_request->is_last field, now the function drivers can
> inform which request is the end of a transfer, dwc3 can program its TRBs
> to let the controller know when to free its resources when a transfer
> completes. This is required for stream transfers. The controller needs
> to know where one stream starts and ends to properly allocate resources
> for different streams.
>
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>

from a quick read, it looks like this can be broken down into smaller
patches.

> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 7204a838ec06..b11183a715a7 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -701,6 +701,7 @@ struct dwc3_ep {
>  #define DWC3_EP_END_TRANSFER_PENDING BIT(4)
>  #define DWC3_EP_PENDING_REQUEST	BIT(5)
>  #define DWC3_EP_DELAY_START	BIT(6)
> +#define DWC3_EP_WAIT_TRANSFER_COMPLETE	BIT(7)

this could be its own patch with proper description (and usage)

>=20=20
>  	/* This last one is specific to EP0 */
>  #define DWC3_EP0_DIR_IN		BIT(31)
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 865e6fbb7360..628f9d142876 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -579,6 +579,7 @@ static int dwc3_gadget_set_ep_config(struct dwc3_ep *=
dep, unsigned int action)
>=20=20
>  	if (usb_ss_max_streams(comp_desc) && usb_endpoint_xfer_bulk(desc)) {
>  		params.param1 |=3D DWC3_DEPCFG_STREAM_CAPABLE
> +			| DWC3_DEPCFG_XFER_COMPLETE_EN

adding this bit for stream endpoints could be a separate commit.

>  			| DWC3_DEPCFG_STREAM_EVENT_EN;
>  		dep->stream_capable =3D true;
>  	}
> @@ -917,8 +918,9 @@ static u32 dwc3_calc_trbs_left(struct dwc3_ep *dep)
>  }
>=20=20
>  static void __dwc3_prepare_one_trb(struct dwc3_ep *dep, struct dwc3_trb =
*trb,
> -		dma_addr_t dma, unsigned length, unsigned chain, unsigned node,
> -		unsigned stream_id, unsigned short_not_ok, unsigned no_interrupt)
> +		dma_addr_t dma, unsigned length, unsigned chain,
> +		unsigned is_last, unsigned node, unsigned stream_id,
> +		unsigned short_not_ok, unsigned no_interrupt)

if you add "is_last" as the last argument, this hunk will look
smaller. Nitpicking, I know.

> @@ -1223,6 +1231,10 @@ static void dwc3_prepare_trbs(struct dwc3_ep *dep)
>=20=20
>  		if (!dwc3_calc_trbs_left(dep))
>  			return;
> +
> +		/* Don't prepare ahead. This is not an option for DWC_usb32. */
> +		if (req->request.is_last)
> +			return;

this requires some better description. Why isn't it an option for dwc_usb32?

> @@ -2648,37 +2666,22 @@ static bool dwc3_gadget_ep_should_continue(struct=
 dwc3_ep *dep)
>  	return !dwc3_gadget_ep_request_completed(req);
>  }
>=20=20
> -static void dwc3_gadget_endpoint_frame_from_event(struct dwc3_ep *dep,
> -		const struct dwc3_event_depevt *event)
> -{
> -	dep->frame_number =3D event->parameters;
> -}

moving these functions around could be a separate patch. The way it's
done now takes away from review.

> @@ -2704,6 +2707,45 @@ static void dwc3_gadget_endpoint_transfer_in_progr=
ess(struct dwc3_ep *dep,
>=20=20
>  		dwc->u1u2 =3D 0;
>  	}
> +
> +	return no_started_trb;
> +}
> +
> +static void dwc3_gadget_endpoint_frame_from_event(struct dwc3_ep *dep,
> +		const struct dwc3_event_depevt *event)
> +{
> +	dep->frame_number =3D event->parameters;
> +}
> +
> +static void dwc3_gadget_endpoint_transfer_in_progress(struct dwc3_ep *de=
p,
> +		const struct dwc3_event_depevt *event)
> +{
> +	int status =3D 0;
> +
> +	if (usb_endpoint_xfer_isoc(dep->endpoint.desc))
> +		dwc3_gadget_endpoint_frame_from_event(dep, event);
> +
> +	if (event->status & DEPEVT_STATUS_BUSERR)
> +		status =3D -ECONNRESET;
> +
> +	if (event->status & DEPEVT_STATUS_MISSED_ISOC)
> +		status =3D -EXDEV;
> +
> +	dwc3_gadget_endpoint_trbs_complete(dep, event, status);
> +}
> +
> +static void dwc3_gadget_endpoint_transfer_complete(struct dwc3_ep *dep,
> +		const struct dwc3_event_depevt *event)
> +{
> +	int status =3D 0;
> +
> +	dep->flags &=3D ~DWC3_EP_TRANSFER_STARTED;
> +
> +	if (event->status & DEPEVT_STATUS_BUSERR)
> +		status =3D -ECONNRESET;
> +
> +	if (dwc3_gadget_endpoint_trbs_complete(dep, event, status))
> +		dep->flags &=3D ~DWC3_EP_WAIT_TRANSFER_COMPLETE;
>  }
>=20=20
>  static void dwc3_gadget_endpoint_transfer_not_ready(struct dwc3_ep *dep,
> @@ -2770,7 +2812,10 @@ static void dwc3_endpoint_interrupt(struct dwc3 *d=
wc,
>  		}
>  		break;
>  	case DWC3_DEPEVT_STREAMEVT:
> +		break;

Swap these around. Keep all the "nothing to do here" cases
together.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6pMUAACgkQzL64meEa
mQZWuxAAu84ZdgNsmRoatLw0VB6STiWIkLgFGFdkvNUVoQhV98AcpOKwaJWHtID+
OhyIZ4aLEv5fIwTjkJBaQejaVadQGgBCEze14wa/oUuvz1JyKmi/8XivnA6NxxUT
t3LITE2tz1VGVg+SBav68lXr2kAbNYPSo2EeHebqEK6eYW+Z1jH8iLMeCG7dQ+0s
5TwfW6jznfK9RqLrjVIBrC/GGheiSmMk/3p77uO1ul5huvkHMFuD1UcsMuMEHKx4
3liuDH2sL+yoHNQpwKeSp6rtQI/EgVdNiMbcGW67oU3uTgozaKLtUbxR61uQi73+
sOkW28TZjJyuw5UxMt00g2CsqkOg1fD7+TSjZ+bBVlRDggJQEMzLP2GAMNj0kmVg
G0nlAOK/vTHw4xXCq7n4z3vJ2pkJrs+W7lVYviThv+lehoCxBmlppQV+zLA4dnP7
BPkLjk+JlQzZ0/m6O5S0MgjF0XCtY9ddo8tDTRHyBk/fZPLJeNbMt52xtgaev0vK
xBLLHo1Xt8/oS/NSJPngZBdGAhb/o94btxIsTnqyftI4cYj6jsnl6I+KBegv+ZOZ
d72tI7dzoMfkUjALrpV2LLfX8rVRvgvCxFlxFxwe0eBqOKOw9G9MrK8Zo87TGQiB
DIwBRHEGMVLqPlPRUSLDmj3bDOB7cIeerAnPpHgcC9MWSJ0IoxE=
=huHd
-----END PGP SIGNATURE-----
--=-=-=--
