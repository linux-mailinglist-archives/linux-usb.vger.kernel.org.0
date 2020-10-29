Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A0D29E95A
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 11:48:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbgJ2KqE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 06:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbgJ2KqD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Oct 2020 06:46:03 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8BE2C0613CF
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2020 03:46:02 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id x16so2587238ljh.2
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2020 03:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xiHfCffOCyIyuoQviGVjPYyBZGKXlLGUiHIMR4DC1pY=;
        b=LIzvOJMKi2D42fV8TK8AnRVDKA3u1xab7aGfn3isrwWnStOBGdujL5YSLNRl68VULp
         aW31X2S8p3lu6uzvChmJlhWniQsEOu1C5FkWQhHRi6XdPYt6ss3VRdpXQZciMhbQ3P8Z
         LkQ9W0pyAdGR+0EZspAQ8WKulsd1dZHGZwWjW00uyRqs8EG6yXnjgJtGZGjMPXkDKXO3
         UqhbkheEmMozxFYNzWvj6SQB4mYgAk1GG8aNb/VkUhDyndc83zCdxqnjc5pXqfkldHgE
         OWHdS4nnxx6SBWQWS7jAVcfdZRq8q74hu3QwZAlAyA1twlNxmYTlWWIlsW7QXk25vpnc
         dGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xiHfCffOCyIyuoQviGVjPYyBZGKXlLGUiHIMR4DC1pY=;
        b=iZ7RVxd0nXZ9TXNMshy6eIK6A8fgqL+lPH4Q3v3myNTWLUd0tME95BH7sRlCwBxgf0
         +kGH+UGvk9j83SWRvIK3NmxB40tifPyu9eH84YHLCiK/2EDABtE2jkFKvSLAxgcmQGGI
         nXxZFNrmVfOQNqaRpt4/QwT/mfQ7H6ShmoVKAV303G7FPeNKjOWPDwR7L7TBdE45DHsF
         4dfmsniDz17A2z7z9e4bpMuFvTwU467it4IEVGSow+OtTrhldlnp2Fs9zAyRNeXJI0mb
         pH8JNiWNesh/UsJ8O/6g9hy7ZMLYc2lofg1L3QhEGm7lrUpwi1fcLElSoOwfXOqcLXXT
         Fbpg==
X-Gm-Message-State: AOAM531HVSCtAUBQ+Wk7ycpJwvSPydIxhfondQtbjXWV2m9Z2htRBp+h
        8k3wuSf7Hh9HyAvDpCkTYaUSGQQ8C3SjvgL16C4=
X-Google-Smtp-Source: ABdhPJwISF3a5+E95KykwEN5ArDIZzUANErM+wA6Zo493PqRtpeI60SEu31uZ+DJOS39GqdEejiP3feydo93CTgVNh8=
X-Received: by 2002:a2e:b5d2:: with SMTP id g18mr1611648ljn.211.1603968361180;
 Thu, 29 Oct 2020 03:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201013092746.10602-1-peter.chen@nxp.com> <20201013092746.10602-2-peter.chen@nxp.com>
In-Reply-To: <20201013092746.10602-2-peter.chen@nxp.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Thu, 29 Oct 2020 18:45:49 +0800
Message-ID: <CAL411-rS0Fa4Z7emwAC6wcMnBGJ9+y8X_-64Q7XB_BOz_DGOgQ@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/2] usb: gadget: core: do not try to disconnect
 gadget if it is not connected
To:     Peter Chen <peter.chen@nxp.com>
Cc:     balbi@kernel.org, USB list <linux-usb@vger.kernel.org>,
        linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 13, 2020 at 8:01 PM Peter Chen <peter.chen@nxp.com> wrote:
>
> Current UDC core connects gadget during the loading gadget flow
> (udc_bind_to_driver->usb_udc_connect_control), but for
> platforms which do not connect gadget if the VBUS is not there,
> they call usb_gadget_disconnect, but the gadget is not connected
> at this time, notify disconnecton for the gadget driver is meaningless
> at this situation.
>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  drivers/usb/gadget/udc/core.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 215ecbe8b692..8ad4203dea8c 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -672,6 +672,9 @@ int usb_gadget_connect(struct usb_gadget *gadget)
>                 goto out;
>         }
>
> +       if (!gadget->connected)
> +               goto out;
> +
>         if (gadget->deactivated) {
>                 /*
>                  * If gadget is deactivated we only save new state.
> --
> 2.17.1
>

A gentle ping.

Peter
