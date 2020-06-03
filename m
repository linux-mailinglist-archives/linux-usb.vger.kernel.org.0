Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3AE1ECC93
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jun 2020 11:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgFCJ1O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jun 2020 05:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgFCJ1O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Jun 2020 05:27:14 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0B29C05BD43
        for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2020 02:27:13 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id c21so873604lfb.3
        for <linux-usb@vger.kernel.org>; Wed, 03 Jun 2020 02:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vLHGvoEca7+d546E0zoaQLjsBT2fBfDNH2FAI/kI640=;
        b=T+CQdkU9V4h6BEPP0VwSjIeRTR25CSgH7p+/xzNmCFkyq+xk65W+BjijuwsnVbBi+y
         Cfd7GmWP+AzJntwVj1sSrFx3qEaJUJAMufRNxH2d1ewnmUy7Xru8SjPM1QdCyHeb4n2c
         9ThS4QvebtJ9LEjq1ZlaHlBdjArGFGbHWajRHVfLXo4DnftPJDKPB5HTlWwM0//VYkab
         jqk80UH2/SgfimnmmdJWgSY3RV8HaZw581ycbFfhFIdMalJst0m4nhi81xOqbGbI+evw
         sc1Rm8z7aTpLOT5gmpv5K3RtYcmZr7DFaIn6P0p9pZc9DIu8mT/y5wLtY1vNq0wvGEOl
         fdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vLHGvoEca7+d546E0zoaQLjsBT2fBfDNH2FAI/kI640=;
        b=TxhhDnzjRdbowPAEtawwcKt5aVqe/tP+rkHjKOl0nRkH0xudg/yo0q/nqrOmnY1LOj
         hmTEEoI2+gT1S2x8dFu2AbPXA3sAEeRezEgAh2GSfgBAFOSseKN0FaxTdMMfE8tozm4v
         Wh9SSc385q/KDz9R7E46g4EZoCSKKCjG03Ctrp7py1hyQzKSFsv4vj2BgEFBnsR23jnQ
         imnQn9d4t7VhpCN1Klnql255lTBo/IaGXf6atBQOJ/TzlifeSeoyGNNpUux/pf9rtlv0
         /kVeRlNw41xI2iadT5xyHsnA4M8wSginwi4BPLn5KxFvbAiTqaq+SvhQahhOGRUBeAm8
         dUMQ==
X-Gm-Message-State: AOAM5308ML2yF9UOavzc9BSU8bu082wjMAB7rYk6J8cFO+qP1vuFhwea
        S8XUFn4v3W2o7OXl3W7/ELv6dBq9Juq3SiwTN+Q=
X-Google-Smtp-Source: ABdhPJxUhZnCYRVW/4QMAekHSmkLxjE2PTg4V5rdJa41vpVJ8FHLVLXBzQygMxGA+LNDkxXCECszB2w469j0lWDLOdM=
X-Received: by 2002:a19:c187:: with SMTP id r129mr1971488lff.35.1591176432357;
 Wed, 03 Jun 2020 02:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200523232304.23976-1-peter.chen@nxp.com> <20200523232304.23976-3-peter.chen@nxp.com>
 <1591174278.15527.6.camel@mhfsdcap03>
In-Reply-To: <1591174278.15527.6.camel@mhfsdcap03>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Wed, 3 Jun 2020 17:27:00 +0800
Message-ID: <CAL411-qedvd0fWiBt7WixeND03ZMYLeiqSxVmsKFCyZwsDz8YQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] usb: cdns3: add runtime PM support
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Peter Chen <peter.chen@nxp.com>, balbi@kernel.org,
        mathias.nyman@intel.com, USB list <linux-usb@vger.kernel.org>,
        linux-imx@nxp.com, pawell@cadence.com, rogerq@ti.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> > Introduce runtime PM and wakeup interrupt handler for cdns3,
> > the runtime PM is default off since other cdns3 has not implemented
> > glue layer support for runtime PM.
> >
> > When the controller is in low power mode, the lpm flag will be set.
> > The interrupt triggered later than lpm flag is set considers as
> > wakeup interrupt and handled at cdns_drd_irq.
> Wonder to know that CPUs may be powered off in this case?

Yes

> Do you consider the case when usb controller is in low power mode, and
> also power off CPUs, then how to wakeup usb controller?
>

About USB wakeup for system suspend, there are still some works need
to do for this driver, will do later.

For system wakeup, it is platform specific. If the main cores are
powered off totally,
and do not respond any wakeup events, it needs the other core to get this wakeup
event, and power on main cores. After main cores are powered on, the
wakeup interrupt
status are there (if controller is not powered off), the controller
driver could handle
this wakeup event.

Peter

> Thanks
>
> > Once the wakeup
> > occurs, it first disables interrupt to avoid later interrupt
> > occurrence since the controller is in low power mode at that
> > time, and access registers may be invalid at that time. At wakeup
> > handler, it will call pm_runtime_get to wakeup controller, and
> > at runtime resume handler, it will enable interrupt again.
> >
> > The API platform_suspend is introduced for glue layer to implement
> > platform specific PM sequence.
> >
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> >  drivers/usb/cdns3/core.c   | 119 +++++++++++++++++++++++++++++++------
> >  drivers/usb/cdns3/core.h   |  14 +++++
> >  drivers/usb/cdns3/drd.c    |   7 +++
> >  drivers/usb/cdns3/gadget.c |   4 ++
> >  drivers/usb/cdns3/host.c   |   7 +++
> >  5 files changed, 134 insertions(+), 17 deletions(-)
>
