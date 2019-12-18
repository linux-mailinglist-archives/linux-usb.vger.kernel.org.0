Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44C941254A9
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2019 22:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfLRVbM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Dec 2019 16:31:12 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42070 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726212AbfLRVbM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Dec 2019 16:31:12 -0500
Received: by mail-lf1-f68.google.com with SMTP id y19so2752878lfl.9
        for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2019 13:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3vmqxpDoNWwM6EnFLwWsmGD31CKMkGS/dVBkIHojd28=;
        b=lkIz5/mXQ0uEcEyZeE9L33UtWbpYSyJSpV6O9y/qXYjzI2uiItYxWJ6vzq56EDCpfR
         PX/OyRgQ9boAEhppWXfFAnmHed0Xn1OMFWzl+P5VVjVQwWcuAN6DL1tXI1A0xl2eEGpo
         cANVFyTFeSnAhEtW03avjOHq14u2DmHy7AJK/Rp97pTkqDAHpmj+GjA85hVH+Hx72YZE
         bS+HSlTUkPT2dZH8lPQgnGUnGZfVBc1zVUoLURgE1LKHludlJzKZFWO4BzVDhKE1zxjb
         hvmKavFPY+tRduRCWfDyPCVKqbhKq3GAxUpWCS8g2PwAgQ/ZbGsM4y9q5W8WaNNsgc7G
         ociQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3vmqxpDoNWwM6EnFLwWsmGD31CKMkGS/dVBkIHojd28=;
        b=AYPk9nN5DpM7UL+WLsI1QRW0+GeR0XoMGOubd/dP0Tsy1LY9ZyBGkOJYeNfkXPOZNs
         EL/Q7/dCHKx12xwknAzuEy6V03lioagWjrKV/zxyPfwpYAfGI82Z9v0fQqXpUzaKPZ67
         /miEuNBS37F4H2wzYV2wCdsjR13BUZxdvEdT8VntRtZ1vPM4enFnry/4K/WOLhmiREta
         wLuDBD7O8gIn3eJbOy/nZ4oc+dqUEryk06jn7Ni3r28jwoJNHctS7tyqmtZJymqyqYkt
         Rjwb3Ky7q3EVSR5vqeUeXZzpCDQ7I0ayMIFP9C9ZgRq8qL7ALP/JgmaFcGW3DCIGJdso
         zL+g==
X-Gm-Message-State: APjAAAXtOdo5TXD1sTxyeNB5pwjEWyCmOuMgP1vSADWHrUSAOcjwC5sj
        4vl+wJIgCMUUEpDAYC8V6VNdvqjMHhTHuM4AJmtU4A==
X-Google-Smtp-Source: APXvYqx1niMPtqndmHYycGQCwz9BtrARTcRSYIaasEssltr/e77TvzkmT5erVR1Mf3UUJTXlS54oEBL+ynplphQACqg=
X-Received: by 2002:a19:c0b:: with SMTP id 11mr3196814lfm.135.1576704670903;
 Wed, 18 Dec 2019 13:31:10 -0800 (PST)
MIME-Version: 1.0
References: <20191218203450.71037-1-stephan@gerhold.net>
In-Reply-To: <20191218203450.71037-1-stephan@gerhold.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 18 Dec 2019 22:30:59 +0100
Message-ID: <CACRpkdZ_ECjsq+Ux0798gRxiTMgyPwiU0GC+rNSysms9tu98og@mail.gmail.com>
Subject: Re: [PATCH] usb: phy: ab8500-usb: Keep PHY turned on in UART mode
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Stephan,

On Wed, Dec 18, 2019 at 9:37 PM Stephan Gerhold <stephan@gerhold.net> wrote:

> AB8505 supports an "UART carkit mode" which makes UART accessible
> through the USB connector. Upon detection of the UART cable,
> this mode has to be manually enabled by:
>
>   1. Turning on the PHY in peripheral mode
>   2. Reconfiguring PHY/pins to route UART signals to USB pins
>
> At the moment, we do not handle the UART link statuses at all,
> which means that UART stops working as soon as phy-ab8500-usb is loaded
> (since we disable the PHY after initialization).
>
> Keeping UART working if the cable is inserted before turning on the device
> is quite simple: In this case, early boot firmware has already set up
> the necessary PHY/pin configuration. The presence of the UART cable
> is reported by a special value in the USB link status register.
>
> We can check for that value in ab8505_usb_link_status_update()
> and set the PHY back to peripheral mode to restore UART.
> (Note: This will result in some minor garbage since we still
>  temporarily disable the PHY during initialization...)
>
> Fully implementing this feature is more complicated:
> For some reason, AB8505 does not update UART link status after bootup.
> Regular USB cables work fine, but the link status register does not change
> its state if an UART cable is inserted/removed.
>
> It seems likely that the hardware is not actually capable of detecting
> UART cables autonomously. In addition to the USB link status register,
> implementations in the vendor kernel also manually measure
> the ID resistance to detect additional cable types. For UART cables,
> the USB link status register might simply reflect the PHY configuration
> instead of the actual link status.
>
> Implementing that functionality requires significant additions,
> so for now just implement the simple case. This allows using UART
> when inserting the cable before turning on the device.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

This is my understanding of how it works as well:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I am a bit allergic to using the word "manually" describing
anything a computer does (no man involved) but many people
use this way of describing things so who am I to tell.
I tend to try to write "directly", "iteratively", "imperatively" or
something, which is arguably harder to understand for some.

Yours,
Linus Walleij
