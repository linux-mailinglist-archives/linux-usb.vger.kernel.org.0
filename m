Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6522C97A4
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 07:46:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgLAGqW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Dec 2020 01:46:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgLAGqW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Dec 2020 01:46:22 -0500
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34774C0613CF
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 22:45:42 -0800 (PST)
Received: by mail-ua1-x944.google.com with SMTP id q68so252478uaq.3
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 22:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lRnbctgYmkuCM+/Ja1BOhvcugp+qMnZnXf/Ffx0hhJo=;
        b=BIOIknLNRLqSg/700II4Vor6+Q4s7FLvMJc5OGRM3RLV70y+Jyptkhq2xXd7Nr//5K
         +5Xgk1qJANz4MEDzwILxqLrpTej30HsEC2FBTxZyJr+OrBR37GdMNMVD20U0N/swDGVP
         F6nwebaZ7YifTDHIIvx+5s0sI/4EPwKVPq4Sz0uXxHapomR3HfbQ+pPuz7KDYeawje3y
         B7xB/2yKe7e4sEfpgE6WvbuO1NfJDmINH8U1HW08zOsgjWamdgZKEsUpDtnHs3YgvDOh
         IFhDb5H0K7wOzahGsWzehNNbS2CnDpXtzqHSBWJIMrfSzL4o0jyZG4I/Q/DQINWlI4Fr
         Qytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lRnbctgYmkuCM+/Ja1BOhvcugp+qMnZnXf/Ffx0hhJo=;
        b=S/7OB0WAQG23BxtlBaJ5UVaz93RqfBXh1/mKd2/xJnA39u8Kysv70gTAn9DkwQQEqm
         gulAR9ZhuWACdOVHf1Pui47hwCDDxoCO65ORdIWoxymKlYFNvS6jQmCkPmUkg0sfFf62
         pyIxNZtB16F2XutPS+P9OljmeH2wpOxxtj1DwmPGcuharaQDc6HD1Vg3W3pBFVI1zdwl
         96HCBmZPyDcp5DouCBSyg56D/Z/uH/KclxoB7xmrBm9RXzYHKACO/sdY5E2PDGxXGxqA
         rFUpepg7711fsadYam4EhIZMS2WbOAh+aAYzFbCpPUveUXjbtfFZ5BWpnpI7UQPQRGUf
         JtmQ==
X-Gm-Message-State: AOAM530cfwQbdEe27Z5/N9BqmiusUigTuYt9EsbQcdAHXpJBqR6FCSLU
        662k5NvmzKhi80gcOWXraORTcnp2qOdJdsnpuj8=
X-Google-Smtp-Source: ABdhPJyCBeFu4nbdJBc4OyaJDOBi1C9ofx7G1HruYP9VmfqIHZDE6t8oRgoVdujCkTj+MdBfzY5xL82voaGLd+LMnCM=
X-Received: by 2002:ab0:1342:: with SMTP id h2mr1113480uae.73.1606805141501;
 Mon, 30 Nov 2020 22:45:41 -0800 (PST)
MIME-Version: 1.0
References: <20201013092746.10602-1-peter.chen@nxp.com> <20201013092746.10602-2-peter.chen@nxp.com>
 <CAL411-rS0Fa4Z7emwAC6wcMnBGJ9+y8X_-64Q7XB_BOz_DGOgQ@mail.gmail.com>
In-Reply-To: <CAL411-rS0Fa4Z7emwAC6wcMnBGJ9+y8X_-64Q7XB_BOz_DGOgQ@mail.gmail.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Tue, 1 Dec 2020 14:45:30 +0800
Message-ID: <CAL411-qOjz+Ut1de8VLS2miM7JEJ4s6x-AhYqhcSxDou6DU-jg@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/2] usb: gadget: core: do not try to disconnect
 gadget if it is not connected
To:     Peter Chen <peter.chen@nxp.com>
Cc:     balbi@kernel.org, USB list <linux-usb@vger.kernel.org>,
        linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

BR,
Peter Chen

On Thu, Oct 29, 2020 at 6:45 PM Peter Chen <hzpeterchen@gmail.com> wrote:
>
> On Tue, Oct 13, 2020 at 8:01 PM Peter Chen <peter.chen@nxp.com> wrote:
> >
> > Current UDC core connects gadget during the loading gadget flow
> > (udc_bind_to_driver->usb_udc_connect_control), but for
> > platforms which do not connect gadget if the VBUS is not there,
> > they call usb_gadget_disconnect, but the gadget is not connected
> > at this time, notify disconnecton for the gadget driver is meaningless
> > at this situation.
> >
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> >  drivers/usb/gadget/udc/core.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> > index 215ecbe8b692..8ad4203dea8c 100644
> > --- a/drivers/usb/gadget/udc/core.c
> > +++ b/drivers/usb/gadget/udc/core.c
> > @@ -672,6 +672,9 @@ int usb_gadget_connect(struct usb_gadget *gadget)
> >                 goto out;
> >         }
> >
> > +       if (!gadget->connected)
> > +               goto out;
> > +
> >         if (gadget->deactivated) {
> >                 /*
> >                  * If gadget is deactivated we only save new state.
> > --
> > 2.17.1
> >
>
> A gentle ping.
>

ping again.

Peter
