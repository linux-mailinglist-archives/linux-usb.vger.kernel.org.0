Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18C4F60EF97
	for <lists+linux-usb@lfdr.de>; Thu, 27 Oct 2022 07:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233702AbiJ0Fm2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Oct 2022 01:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233403AbiJ0Fm1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Oct 2022 01:42:27 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC40E197B
        for <linux-usb@vger.kernel.org>; Wed, 26 Oct 2022 22:42:26 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id a67so886579edf.12
        for <linux-usb@vger.kernel.org>; Wed, 26 Oct 2022 22:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JJq0nvZKDUNBPSUKjWgnRw7Tzl9bUHsviyM+E8ZIXs8=;
        b=o13ospHAeM9eNkx+skLdBDC8TsK0kjPhzlNDATdW93A/tjV1xf514NwdkfnbhON5zb
         xY/dppEK44gIpNGFuVCADVEEP9pZLtIC3duDkfE8ovhtPX0fIQ00mNFHNeR3TtE8Bufa
         W/TEZZJCfTNjfZtn1OZqvlYI3wxRoK74xxD0e6ouINVCPFMtzNA2WFm0o3sSw76/2Bhd
         Clt390PEMI/w+HBBTHGJnjDjgY6WNTPRk0HqAWiLtPAZmS7MgoUURrBU9N7/lep+JT16
         2Zrxvnl3CTU6wXwTnuHbQfavIlRXJ0htMGaj3/vWxxvsL95pBuMBtiPzXYjanW+iW9B9
         7CDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJq0nvZKDUNBPSUKjWgnRw7Tzl9bUHsviyM+E8ZIXs8=;
        b=Yxc5plaKYzxzf2WHd9zEBlxE9hAV7Is6hqmiCiSHRL4iXSmoFV1xA5qHHSFxGt7Lho
         Eh/tRIHQXDs+aYhtkv4k/fBCHfq8/Qv1HJWP4BKZvwuZs1UMh2anu+zwf8d2EW+F6xUl
         HR0F2+TkSk0dRZ6X/NsH33K7OBJQPsk0FRwpEHEDDN3upYwSpRVOb+atfklAzhhTkvrw
         sUOqMmWHme8RB5Xqgc+o+k9om7F6H9ldupBatnNULFKK3iQkyH5lQkiza5+t+wxzYk47
         cDI2hZCftOHn2VK1ojHzrr/XfEc8cpQaFyB831l3D4YaztBojLo6wnFG76ijI0jBLsp+
         KONQ==
X-Gm-Message-State: ACrzQf2IMfnij0XZJpaMEAgB/pFRlZWZvYlTIvUH2b4472z2dJHjOgTe
        lH3z8eSw0L/9DXZpQORfosEoLtWmqR7/2SNDU6SxwQ==
X-Google-Smtp-Source: AMsMyM6dfz8utngjy94AuxnTcRnJRHrmB2u8T6BQyhZ2f7czOMyNNq2xgoPsEp4/++y65g8FXT8kq5rPTZyU8o1JqeE=
X-Received: by 2002:a05:6402:2486:b0:460:8f86:1fca with SMTP id
 q6-20020a056402248600b004608f861fcamr33761399eda.70.1666849344815; Wed, 26
 Oct 2022 22:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221024142720.4122053-1-mathias.nyman@intel.com>
 <20221024142720.4122053-3-mathias.nyman@intel.com> <CAEmPcwsBDwFoXOcXKXkx1aebnq3CV036Ygz_oXOobcyKoQQNnQ@mail.gmail.com>
 <Y1ja9cqkD32cEO0L@kroah.com>
In-Reply-To: <Y1ja9cqkD32cEO0L@kroah.com>
From:   Reka Norman <rekanorman@google.com>
Date:   Thu, 27 Oct 2022 16:42:08 +1100
Message-ID: <CAEDELA8Qp-PbB2GjXd_NcpuyFdJxSveHe-rQQ6z_0JKNQ3TiyQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] xhci: Add quirk to reset host back to default state
 at shutdown
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Reka Norman <rekanorman@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 26, 2022 at 5:59 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Oct 26, 2022 at 05:40:10PM +1100, Reka Norman wrote:
> > On Wed, Oct 26, 2022 at 5:01 PM Mathias Nyman <mathias.nyman@intel.com> wrote:
> > >
> > > From: Mathias Nyman <mathias.nyman@linux.intel.com>
> > >
> > > Systems based on Alder Lake P see significant boot time delay if
> > > boot firmware tries to control usb ports in unexpected link states.
> > >
> > > This is seen with self-powered usb devices that survive in U3 link
> > > suspended state over S5.
> > >
> > > A more generic solution to power off ports at shutdown was attempted in
> > > commit 83810f84ecf1 ("xhci: turn off port power in shutdown")
> > > but it caused regression.
> > >
> > > Add host specific XHCI_RESET_TO_DEFAULT quirk which will reset host and
> > > ports back to default state in shutdown.
> > >
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > ---
> > >  drivers/usb/host/xhci-pci.c |  4 ++++
> > >  drivers/usb/host/xhci.c     | 10 ++++++++--
> > >  drivers/usb/host/xhci.h     |  1 +
> > >  3 files changed, 13 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> > > index 6dd3102749b7..fbbd547ba12a 100644
> > > --- a/drivers/usb/host/xhci-pci.c
> > > +++ b/drivers/usb/host/xhci-pci.c
> > > @@ -257,6 +257,10 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
> > >              pdev->device == PCI_DEVICE_ID_INTEL_DNV_XHCI))
> > >                 xhci->quirks |= XHCI_MISSING_CAS;
> > >
> > > +       if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
> > > +           pdev->device == PCI_DEVICE_ID_INTEL_ALDER_LAKE_PCH_XHCI)
> >
> > We need this quirk for ADL-N too (device ID 0x54ed). Would you mind
> > updating the patch? Or I can send a separate patch if you prefer.
>
> A separate patch is required, please submit it.

Done, thanks.
https://lore.kernel.org/linux-usb/20221027053407.421783-1-rekanorman@chromium.org

>
> thanks,
>
> greg k-h
