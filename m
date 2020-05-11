Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DECB1CD4B1
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2020 11:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729302AbgEKJSe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 May 2020 05:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgEKJSd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 May 2020 05:18:33 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F149C061A0C
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2020 02:18:32 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id c4so3719919qvi.6
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2020 02:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jbfgjCIJCT731lsX+VnBCmkJyCHAocQc+0O+jnIBrdA=;
        b=W8GsoKBTh3eU7gK0hFlJ0SlnR4/zsOEdiEu38ZroK0AD/j0RkfeKchZBEqi62uiRc6
         URDF81n5X0ocDhATQJCsPzqQmANVVyixmbQnVl+EVmPhoxZnMzKIIdJLifoKd6qDSW7R
         g3/nx11QoXUNQSXk3ZbTaRZs5bDYZlnQKGcgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jbfgjCIJCT731lsX+VnBCmkJyCHAocQc+0O+jnIBrdA=;
        b=FFqWURe3vOqtUtpV+n7Y23JbjNrj1Jzq8VwPPY4gqWYQRir4DPh0cmhQQeCqP0XDnh
         xdP2gJ5DyPGGGHFMmBpfRm2yoS0hZpGc8VUrTwviwgOLWQPdG3zRWKuhKVTWsIKDenQ9
         zmoSq8oGKmZQFlWV+Dq+WEI9mucp7E92ZhEDGHhr3sE682sSQc4MkYPhFnGhNSJRcgmL
         y+GrqGU/L8/v0+8LB6qcyAwbJgjZFc1VQQ+3NzXK3wltUoA0QOsfP9IPafBNjjeFGTKD
         7ttz12dARRtbnbyeJjtVH5eWmkgrGKxq7pJt+Z8OaZIPf9OHBbnbiqK7iChH6Bg9SEgz
         PpUg==
X-Gm-Message-State: AGi0PuaCeMGOfyjXBysIhX5Eg5nCIs2djuKnfP7Ey2FWdpmHVDk8H1Nz
        gVoBlFUU0ZmYzORGy3VqVE1TNVfGId+us2zndvZPw3Ro
X-Google-Smtp-Source: APiQypKT98jJ+xFT05/I6LmJQeISERtWb2r4N0celT3NHNTNMdSnrXvpVHkM+TeXsrBCRZ3aCItbNo4jo662cXs8B6E=
X-Received: by 2002:a0c:90e7:: with SMTP id p94mr14956340qvp.219.1589188710998;
 Mon, 11 May 2020 02:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200510213934.146631-1-pmalani@chromium.org> <6921cb24-091b-1de3-5348-a1dd8a6803f5@gmail.com>
In-Reply-To: <6921cb24-091b-1de3-5348-a1dd8a6803f5@gmail.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Mon, 11 May 2020 02:18:19 -0700
Message-ID: <CACeCKaeohcaOt7sfWR0FWaSp8CLEa5_6afAZUdYYTn2S_wXOew@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: mux: intel: Fix DP_HPD_LVL bit field
To:     Lars Melin <larsm17@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Lars,

Thanks for reviewing the patch.

On Mon, May 11, 2020 at 1:49 AM Lars Melin <larsm17@gmail.com> wrote:
>
> On 5/11/2020 04:39, Prashant Malani wrote:
> > According to the PMC Type C Subsystem (TCSS) Mux programming guide rev
> > 0.6, the PMC HPD request LVL bit field is bit 4.
> > Fix the definition here to match the programming guide.
> >
> > Since this bit field is changing, explicitly define a field for the
> > HPD_HIGH mode data bit.
> >
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > Fixes: 6701adfa9693 ("usb: typec: driver for Intel PMC mux control")
> > Reviewed-by: Benson Leung <bleung@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Fixed bit error in commit message.
> >
> >   drivers/usb/typec/mux/intel_pmc_mux.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
> > index 67c5139cfa0d..15074aec94eb 100644
> > --- a/drivers/usb/typec/mux/intel_pmc_mux.c
> > +++ b/drivers/usb/typec/mux/intel_pmc_mux.c
> > @@ -63,6 +63,7 @@ enum {
> >   #define PMC_USB_ALTMODE_DP_MODE_SHIFT       8
> >
> >   /* TBT specific Mode Data bits */
> > +#define PMC_USB_ALTMODE_HPD_HIGH     BIT(14)
> >   #define PMC_USB_ALTMODE_TBT_TYPE    BIT(17)
> >   #define PMC_USB_ALTMODE_CABLE_TYPE  BIT(18)
> >   #define PMC_USB_ALTMODE_ACTIVE_LINK BIT(20)
> > @@ -75,7 +76,7 @@ enum {
> >
> >   /* Display HPD Request bits */
> >   #define PMC_USB_DP_HPD_IRQ          BIT(5)
> > -#define PMC_USB_DP_HPD_LVL           BIT(6)
> > +#define PMC_USB_DP_HPD_LVL           BIT(4)
> >
> Please keep the bits sorted
Sure. Will send a new version of the patch with this change.

Best regards,
>
> >   struct pmc_usb;
> >
> > @@ -158,8 +159,7 @@ pmc_usb_mux_dp(struct pmc_usb_port *port, struct typec_mux_state *state)
> >                        PMC_USB_ALTMODE_DP_MODE_SHIFT;
> >
> >       if (data->status & DP_STATUS_HPD_STATE)
> > -             req.mode_data |= PMC_USB_DP_HPD_LVL <<
> > -                              PMC_USB_ALTMODE_DP_MODE_SHIFT;
> > +             req.mode_data |= PMC_USB_ALTMODE_HPD_HIGH;
> >
> >       return pmc_usb_command(port, (void *)&req, sizeof(req));
> >   }
> >
>
> Thanks
> Lars
