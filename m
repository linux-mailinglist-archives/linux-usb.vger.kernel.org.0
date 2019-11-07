Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7950AF3C10
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2019 00:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbfKGXUk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Nov 2019 18:20:40 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36511 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbfKGXUk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Nov 2019 18:20:40 -0500
Received: by mail-ot1-f68.google.com with SMTP id f10so3604361oto.3
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2019 15:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NS7feVt5w3NPfO8o7V/ur97hazfd2nvR1Ztlec6IMqE=;
        b=bpAbWNp8Ik7dCVdfdlSuLGR6UKy3/oB4H9cdjLxeB4crinwOrgwvZBeU7qEL14OLk9
         rzZ7ThTlBunuN/BmyjvmC3udjKoc22ETw2NV5tQPfrL447A8v5ai/G5QEtl0oR6d3nVX
         wLsYz7uXcZIbpssTuu42VBJ2Lhw0LHvs/bmS9fhZZq13BtVrBU47tObgHw4Dex55hPzu
         VJfz0p7p2dyHwqKhJtbsXvOJOAR4YvuNnZhOG+tTEM7pwVd0MGQ0G3c1j7ktHm6ZKdf9
         ZJhGzpx5aEUQfC0KEsP069/imQsp7o2Gv8hbNOHmOGp0nfpBYd+t8FkzBW+4E3JBwXbk
         QvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NS7feVt5w3NPfO8o7V/ur97hazfd2nvR1Ztlec6IMqE=;
        b=XgO+g3LiEZiSQV9pYmWqbVBTI7SrDkkSN1o3Egwjac3PBm+m8dw4E2eUmG9YAeu0TF
         w479pEGvmsRDQDKU8gf86wznZWm6lIVvda7nN+hiWG782ZXQlIbCziN4BfV1sRi1f2/x
         Xy+9b60ZDpo8vQu60febttp+uqGdMVjf12Aw2PdKPOs9sR4lk7dnEm/qX8ZAFytGvzY2
         xnCz/LuobGbb4R3fm0u4qSeaJetNZ35STFBqclJ6Rr/Z9musc9ZGGRric7b1hWiq80JJ
         ryAsjT/GNA9WjSxqg+nGrYcYn0hloFDO4792DXbO586URhde5JgLOqm5atag/Kb2l5ja
         lJvg==
X-Gm-Message-State: APjAAAUpYo5PrkDhFcJyqj2/meF1GvwldkPNidVTjYsaIqquYJv9YZVo
        VQap4EuJYSSAKYw+cVeygJDGETEm2CIMTumMmDlApA==
X-Google-Smtp-Source: APXvYqwPjmyAUfPfDU2EZJzkVpxXFihq36HmVJPR3K2NQHp7CbL5AV1OwMhhDBf5S1vSuj40aBvOApbCVEQGk/4Ts9U=
X-Received: by 2002:a9d:7f12:: with SMTP id j18mr5071188otq.221.1573168838640;
 Thu, 07 Nov 2019 15:20:38 -0800 (PST)
MIME-Version: 1.0
References: <20191028215919.83697-1-john.stultz@linaro.org>
 <20191028215919.83697-8-john.stultz@linaro.org> <87eeyvj49e.fsf@gmail.com>
In-Reply-To: <87eeyvj49e.fsf@gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 7 Nov 2019 15:20:27 -0800
Message-ID: <CALAqxLV_PS6rh21wE5Je2gktANmr7Yurhb=teic7YMb01n5T7Q@mail.gmail.com>
Subject: Re: [PATCH v4 7/9] usb: dwc3: Registering a role switch in the DRD code.
To:     Felipe Balbi <balbi@kernel.org>
Cc:     lkml <linux-kernel@vger.kernel.org>, Yu Chen <chenyu56@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Jack Pham <jackp@codeaurora.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 29, 2019 at 2:21 AM Felipe Balbi <balbi@kernel.org> wrote:
> John Stultz <john.stultz@linaro.org> writes:
> > From: Yu Chen <chenyu56@huawei.com>
> >
> > The Type-C drivers use USB role switch API to inform the
> > system about the negotiated data role, so registering a role
> > switch in the DRD code in order to support platforms with
> > USB Type-C connectors.
> >
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > CC: ShuFan Lee <shufan_lee@richtek.com>
> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> > Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > Cc: Yu Chen <chenyu56@huawei.com>
> > Cc: Felipe Balbi <balbi@kernel.org>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Cc: Jun Li <lijun.kernel@gmail.com>
> > Cc: Valentin Schneider <valentin.schneider@arm.com>
> > Cc: Jack Pham <jackp@codeaurora.org>
> > Cc: linux-usb@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Yu Chen <chenyu56@huawei.com>
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > ---
> > v2: Fix role_sw and role_switch_default_mode descriptions as
> >     reported by kbuild test robot <lkp@intel.com>
> >
> > v3: Split out the role-switch-default-host logic into its own
> >     patch
> > ---
> >  drivers/usb/dwc3/Kconfig |  1 +
> >  drivers/usb/dwc3/core.h  |  3 ++
> >  drivers/usb/dwc3/drd.c   | 66 +++++++++++++++++++++++++++++++++++++++-
> >  3 files changed, 69 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> > index 89abc6078703..1104745c41a9 100644
> > --- a/drivers/usb/dwc3/Kconfig
> > +++ b/drivers/usb/dwc3/Kconfig
> > @@ -44,6 +44,7 @@ config USB_DWC3_DUAL_ROLE
> >       bool "Dual Role mode"
> >       depends on ((USB=y || USB=USB_DWC3) && (USB_GADGET=y || USB_GADGET=USB_DWC3))
> >       depends on (EXTCON=y || EXTCON=USB_DWC3)
> > +     select USB_ROLE_SWITCH
>
> so even those using DWC3 as a peripheral-only or host-only driver will
> need role switch?

So, just to clarify, the select is added to the
CONFIG_USB_DWC3_DUAL_ROLE, wouldn't peripheral-only or host-only
drivers select USB_DWC3_GADGET or USB_DWC3_HOST instead?

Even so, if you'd prefer I can avoid the select, and add more #ifdef
CONFIG_USB_ROLE_SWITCH around the logic added in this patch. I just
worry it makes getting a valid config for some devices more complex
and clutters the logic a touch.

> > +static int dwc3_usb_role_switch_set(struct device *dev, enum usb_role role)
> > +{
> > +     struct dwc3 *dwc = dev_get_drvdata(dev);
> > +     u32 mode;
> > +
> > +     switch (role) {
> > +     case USB_ROLE_HOST:
> > +             mode = DWC3_GCTL_PRTCAP_HOST;
> > +             break;
> > +     case USB_ROLE_DEVICE:
> > +             mode = DWC3_GCTL_PRTCAP_DEVICE;
> > +             break;
> > +     default:
> > +             mode = DWC3_GCTL_PRTCAP_DEVICE;
> > +             break;
> > +     }
> > +
> > +     dwc3_set_mode(dwc, mode);
> > +     return 0;
> > +}
>
> role switching is starting to get way too complicated in DWC3. We now
> have a function that queues a work on the system_freezable_wq that will
> configure PHY and change PRTCAP. Is there a way we can simplify some of
> this a little?

I'm sorry, could you expand a bit on this point? I'm not sure I quite
see what you are envisioning as a simpler role_switch set handler? Is
the objection that I'm calling dwc3_set_mode() and instead should be
calling some non-static variant of __dwc3_set_mode() directly?
