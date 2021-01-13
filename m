Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08FD42F552C
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 00:24:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729338AbhAMXW5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 18:22:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729259AbhAMXWT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jan 2021 18:22:19 -0500
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE36C0617AB
        for <linux-usb@vger.kernel.org>; Wed, 13 Jan 2021 15:21:09 -0800 (PST)
Received: by mail-vk1-xa34.google.com with SMTP id p128so931177vkf.12
        for <linux-usb@vger.kernel.org>; Wed, 13 Jan 2021 15:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dNpul3TmNz217TlWaHrp655cA39WwM3OTc2qb1ao4wM=;
        b=EeWkeggv3kpf3wVa4+9KYipXjBKs3vj3zoCRJ6i1ClC8nN99P+Amx2t+UOy+5OVEZu
         xdCMocOGmk7YLVYAjUx1f1N2i6M82Piiuw2PybHXgHjg5WG3jpiYL2+Le0loq6zMwcRJ
         l5Pr7Vs3rIJ8zssw08oofEJspt8rTUjIIENuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dNpul3TmNz217TlWaHrp655cA39WwM3OTc2qb1ao4wM=;
        b=tHfwOTiBZCQETal6pxv98SdEFvHXng9T/i04Y56Eo2SATap8YLZA5UWWdK/WYkkT26
         N2UDdqcxsNOHa+IV8lK1WOUEcY78G3WzxlG8tCMbJv3GOiGRkakdFAWoiwcHqs6RysET
         51SlQtd7ZVxMBYOyLyJU/r8OMdqxYiqQcpYBYuN3/NhU1OsorlEyDOEAqn4pJJRdYQ4g
         oBf2CvVvzM1btGWcSLBhtabjOn9QFmrg4X0YEgfC3Vr3WV1UmVyJt1iPf863KbvveNBG
         oslO4HzZntmCRFkMizscdSu3lMuN9rYXL0Rh9tiZRih4jOuVWeW0FLlFVlK1e5R2x1OU
         lZng==
X-Gm-Message-State: AOAM5308f+tPDCmaPZURE8OgMBESUF88ZCDBRs27nJRAdNwA5nagrU4Y
        bEQYTLTrWP4q7OwxrkE+5vyfLGKs+J/4Yw==
X-Google-Smtp-Source: ABdhPJyh+eMr/hQ7+1jjWtjWBQ7kNSqsrfRN+h0W2DlDyOO6rpVgbemDuwNdjsOopYq/NAeU2nXHlQ==
X-Received: by 2002:ac5:cc75:: with SMTP id w21mr4213271vkm.14.1610580068502;
        Wed, 13 Jan 2021 15:21:08 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id i45sm417026uah.11.2021.01.13.15.21.07
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jan 2021 15:21:07 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id b23so2095185vsp.9
        for <linux-usb@vger.kernel.org>; Wed, 13 Jan 2021 15:21:07 -0800 (PST)
X-Received: by 2002:a67:ed09:: with SMTP id l9mr4227683vsp.4.1610580067037;
 Wed, 13 Jan 2021 15:21:07 -0800 (PST)
MIME-Version: 1.0
References: <20210113112052.17063-1-nsaenzjulienne@suse.de>
In-Reply-To: <20210113112052.17063-1-nsaenzjulienne@suse.de>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 13 Jan 2021 15:20:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VnsVgTGTkr9VYQHCkBSVVksT1UGfsmk+dqTyQ1sqF=Qw@mail.gmail.com>
Message-ID: <CAD=FV=VnsVgTGTkr9VYQHCkBSVVksT1UGfsmk+dqTyQ1sqF=Qw@mail.gmail.com>
Subject: Re: [PATCH 0/3] usb: dwc2: Fixes and improvements
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Paul Zimmerman <Paul.Zimmerman@synopsys.com>,
        Felipe Balbi <balbi@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nick Hudson <skrll@netbsd.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Minas Harutyunyan <hminas@synopsys.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, Jan 13, 2021 at 3:21 AM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> I'm picking up this series by Guenter Roeck as he stated he has no time
> for it ATM. It was found to solve some unaligned DMA access issues on
> Raspberry Pi 3. You can find the original discussion here:
> https://lore.kernel.org/linux-usb/20200226210414.28133-1-linux@roeck-us.net/
>
> I removed the fist patch from the original series as it turned out to be
> contententious and needs more in-depth testing. Following is the edited
> origin series description. Note that extra testing was performed on
> RPi3:
>
> "This series addresses the following problems:
>
> - Fix receive transfers with 0 byte transfer length
> - Abort transactions after unknown receive errors
>   if the receive buffer is full
> - Reduce "trimming xfer length" logging noise
>
> The problems fixed with this series were observed when connecting
> a DM9600 Ethernet adapter to Veyron Chromebooks such as the ASUS
> Chromebook C201PA. The series was tested extensively with this and
> other adapters.
>
> The observed problems are also reported when tethering various
> phones, so test coverage with such phones would be very appreciated."
>
> ---
>
> Guenter Roeck (3):
>   usb: dwc2: Do not update data length if it is 0 on inbound transfers
>   usb: dwc2: Abort transaction after errors with unknown reason
>   usb: dwc2: Make "trimming xfer length" a debug message
>
>  drivers/usb/dwc2/hcd.c      | 15 ++++++++-------
>  drivers/usb/dwc2/hcd_intr.c | 14 +++++++++++++-
>  2 files changed, 21 insertions(+), 8 deletions(-)

It's been long enough ago that I've forgotten where this was left off,
but IIRC the 3 patches that you have here are all fine to land (and
have my Reviewed-by tag).  However, I think Guenter was still tracking
down additional problems.  Guenter: does that match your recollection?

It looks like there are still bugs open for this on our public bug tracker:

https://issuetracker.google.com/issues/172208170
https://issuetracker.google.com/issues/172216241

...but, as Guenter said, I don't think there's anyone actively working on them.

I'm not really doing too much with dwc2 these days either and don't
currently have good HW setup for testing, so for the most part I'll
leave it to you.  I wanted to at least summarize what I remembered,
though!  :-)

-Doug
