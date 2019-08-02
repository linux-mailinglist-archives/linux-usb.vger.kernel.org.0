Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6796E7FDE5
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2019 17:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388417AbfHBP7i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Aug 2019 11:59:38 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:35790 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388260AbfHBP7h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Aug 2019 11:59:37 -0400
Received: by mail-qt1-f193.google.com with SMTP id d23so74420443qto.2
        for <linux-usb@vger.kernel.org>; Fri, 02 Aug 2019 08:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pIsJX2LHoorKgOTWWLAtugxG8wUBxcRrkIQVJZAnypY=;
        b=c1icoLdBewBdwex7z72rchkW++i9RudnaRl9EMCLX/tApJQps1rKwcOkAgTfCJ5kKs
         UxFzULy0f934atvgkm6vliKeVyJ0BA7MhzSpIuVJDG3ojjNmHCzlDApgNizFXduM5nD3
         iyfPhulmYnRG+bFo90Mk7Zs920rLSAIx5TKIxeXPGudPq0kkcsCAKtaA4B4hUHDeUIz+
         DrshSVCRPH6OBhG40w2/bsi7kUZosGyXjiVuV2vxDkBm0lS2b1x82MfL9d2ViOjYDUs5
         rWO4ZlV4x9qZDxhhuvjO4yTRbS8VCui7Q+HWHfDRPbCC5LYS0a0lAm7XL2c5HO0qO/hF
         Cp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pIsJX2LHoorKgOTWWLAtugxG8wUBxcRrkIQVJZAnypY=;
        b=ANG0u8dAWJgtHyn/d42CgMy7deBY3nU2rVM5N1Qe/oyJ6GuTw66eR6vuUcEctLEnFJ
         1VQIMw+qVoabglzGv6y2aTeRbuWUcuzk92AqQ2aT5vhdujfN31PR1D+v8s46vJ3i1YtJ
         k4XuVn/aUXB0kTEB9rQTBWl+EEsIDinkwgCPeLn/y2KN+q9A2INoF3ZfjMPGTmYRDmwK
         spChUXaldsz7FQA76Goq1TZv2/XM7byJbGpmXc54Y1pZSexb0Ns0ZUVwaely7e+HmVGV
         LJ/H1S6iWvH5FV6AUyjBaGC9PnnI4yPeVHgVT+hpDL354Z2hyjxnpkcYXhXSpUiWJAOK
         7m2Q==
X-Gm-Message-State: APjAAAVOBhR1ncVS/mssqHvLc0nKe+Na4jqqSoCSKA8WauR8XY4DYEPb
        Rjr7U9rNZygBMxH7ARFTmBHd/XMyum7KC1pkYb8=
X-Google-Smtp-Source: APXvYqwWTBnGyZKlyzSltcRUIDIZ4nq3/gIw0vb1OgkjF3w4Dgru2GFFsLpTQUnwFTusDJ1ACztQZPpSH3uBU0SwGUU=
X-Received: by 2002:aed:2a39:: with SMTP id c54mr96667558qtd.272.1564761576784;
 Fri, 02 Aug 2019 08:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <1564758044-24748-1-git-send-email-mathias.nyman@linux.intel.com>
In-Reply-To: <1564758044-24748-1-git-send-email-mathias.nyman@linux.intel.com>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Fri, 2 Aug 2019 17:59:25 +0200
Message-ID: <CAFqH_51c73B+Qp3hbHuw3q1gwbGV0zkkNgwKaAe9bF4X2WaZAw@mail.gmail.com>
Subject: Re: [PATCH] xhci: Fix NULL pointer dereference at endpoint zero reset.
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

Missatge de Mathias Nyman <mathias.nyman@linux.intel.com> del dia dv.,
2 d=E2=80=99ag. 2019 a les 16:59:
>
> Usb core will reset the default control endpoint "ep0" before resetting
> a device. if the endpoint has a valid pointer back to the usb device
> then the xhci driver reset callback will try to clear the toggle for
> the endpoint.
>
> ep0 didn't use to have this pointer set as ep0 was always allocated
> by default together with a xhci slot for the usb device. Other endpoints
> got their usb device pointer set in xhci_add_endpoint()
>
> This changed with commit ef513be0a905 ("usb: xhci: Add Clear_TT_Buffer")
> which sets the pointer for any endpoint on a FS/LS device behind a
> HS hub that halts, including ep0.
>
> If xHC controller needs to be reset at resume, then all the xhci slots
> will be lost. Slots will be reenabled and reallocated at device reset,
> but unlike other endpoints the ep0 is reset before device reset, while
> the xhci slot may still be invalid, causing NULL pointer dereference.
>
> Fix it by checking that the endpoint has both a usb device pointer and
> valid xhci slot before trying to clear the toggle.
>
> This issue was not seen earlier as ep0 didn't use to have a valid usb
> device pointer, and other endpoints were only reset after device reset
> when xhci slots were properly reenabled.
>
> Reported-by: Bob Gleitsmann <rjgleits@bellsouth.net>
> Reported-by: Enric Balletbo Serra <eballetbo@gmail.com>
> Fixes: ef513be0a905 ("usb: xhci: Add Clear_TT_Buffer")
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Thanks for spending time looking at this issue and for the clear
explanation. The patch fixes the issue for me, so

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  drivers/usb/host/xhci.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 248cd7a..03d1e55 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -3089,8 +3089,18 @@ static void xhci_endpoint_reset(struct usb_hcd *hc=
d,
>                 return;
>         udev =3D (struct usb_device *) host_ep->hcpriv;
>         vdev =3D xhci->devs[udev->slot_id];
> +
> +       /*
> +        * vdev may be lost due to xHC restore error and re-initializatio=
n
> +        * during S3/S4 resume. A new vdev will be allocated later by
> +        * xhci_discover_or_reset_device()
> +        */
> +       if (!udev->slot_id || !vdev)
> +               return;
>         ep_index =3D xhci_get_endpoint_index(&host_ep->desc);
>         ep =3D &vdev->eps[ep_index];
> +       if (!ep)
> +               return;
>
>         /* Bail out if toggle is already being cleared by a endpoint rese=
t */
>         if (ep->ep_state & EP_HARD_CLEAR_TOGGLE) {
> --
> 2.7.4
>
