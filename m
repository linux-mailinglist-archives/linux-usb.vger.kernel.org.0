Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 157142EEB88
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jan 2021 03:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbhAHC4N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jan 2021 21:56:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbhAHC4N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Jan 2021 21:56:13 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA33CC0612F5
        for <linux-usb@vger.kernel.org>; Thu,  7 Jan 2021 18:55:32 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id q4so4921565plr.7
        for <linux-usb@vger.kernel.org>; Thu, 07 Jan 2021 18:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=R0blasZhwdMwc6nrzMH/OCyT8puA072sz2fcR9f9KjE=;
        b=uVExDgGaUABjY9+/LeZU4Uo1uUka5jgQtNx0b7bENpR9vUgBH0JLKxg8+zkWDbLypi
         mZVB0grwBcDlXJSAlfkPTSHj3u9sEqVgj0URVhhqbj/8AGPWYMdXPFeojN3XTSLvAfC1
         R+n6M6DmiNeJopN/4UTId95vUB7EmtEoyvfTUvtUtuLqxdNhhbQhliOA/BxQfV7+uC6T
         //gTVuBFmGL9eImXlyg+BW5ym/9Ij3DafT0Ru5VDWeQjeEuwjeGk0JEC1QeGUF6eFDn0
         IB6fuXqWtDKL7qs0twD4lrEDUDpvIyt+oa3SxgMGKHpTf8LPagDrwojQUGMmBQP+zjQ7
         XumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=R0blasZhwdMwc6nrzMH/OCyT8puA072sz2fcR9f9KjE=;
        b=X1/on/yKQ6l/SYfe+iKdDLLP644x8AdTPyKWKyq2585mvlAS8Yp6IhWyRo/ddi8zQ2
         QESi0NKAatik1MdVoBH68vfBXKfhdn+UCmD6YC62y6cJNZXcQJhKPYOEoPmCnik68xrS
         U1mto0E0RAFa382U48tXg9W7uqNKOOxqViYVloHeolBQokZxcQHoaxuvcOkKdDaX0PGM
         ddUOguVHOYcciOSappHHWtbwXe+K2i74/bKYjpyWJr7uqe0AzpxCKKjJ1QdgXGduUqSa
         QiLFobNygjzrRohAEdkVGPNQzRW3ocX9HhxFw+wyL63zkWo6QiAlHY2UK7xN1GfOMWyy
         88nQ==
X-Gm-Message-State: AOAM531xLoCnxIWe/QYogPbRwQ/mf81jXQ92vZp9NvbFZ/iEGqqhTmyl
        Nd90Os0f39LZBDiydmf8/ro=
X-Google-Smtp-Source: ABdhPJxlf5ZhepdebnD0rXisNo708id4DtiaQkjRFyGSlZGIHx1lUkFcaHgfCXwFOAZS68obnxfI6A==
X-Received: by 2002:a17:90b:e96:: with SMTP id fv22mr1500119pjb.92.1610074532397;
        Thu, 07 Jan 2021 18:55:32 -0800 (PST)
Received: from b29397-desktop ([84.17.34.154])
        by smtp.gmail.com with ESMTPSA id q35sm3172708pjh.38.2021.01.07.18.55.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 18:55:31 -0800 (PST)
Date:   Fri, 8 Jan 2021 10:55:22 +0800
From:   Peter Chen <hzpeterchen@gmail.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RESEND PATCH v6 3/3] usb: dwc3: Pass quirk as platform data
Message-ID: <20210108025521.GC4672@b29397-desktop>
References: <cover.1606149078.git.joglekar@synopsys.com>
 <0b96cb765bb154cf0e83a436e7fed8882f566cf9.1606149078.git.joglekar@synopsys.com>
 <X/LQ5ZWLUCGzC8vz@kroah.com>
 <090742a1-a9a1-b89a-e078-a960b5ca3064@synopsys.com>
 <X/M3nxyjiIN/R4MC@kroah.com>
 <2b63edec-f32c-ba80-0be4-53e894272395@synopsys.com>
 <a9217abb-7923-6a9a-0fed-a81480336730@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9217abb-7923-6a9a-0fed-a81480336730@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-01-06 00:35:04, Mathias Nyman wrote:
> On 5.1.2021 11.30, Tejas Joglekar wrote:
> > Hi Mathias,
> > On 1/4/2021 9:13 PM, Greg Kroah-Hartman wrote:
> >> On Mon, Jan 04, 2021 at 09:32:13AM +0000, Tejas Joglekar wrote:
> >>> Hi Greg,
> >>> On 1/4/2021 1:55 PM, Greg Kroah-Hartman wrote:
> >>>> On Mon, Jan 04, 2021 at 01:38:43PM +0530, Tejas Joglekar wrote:
> >>>>> This commit adds the platform device data to setup
> >>>>> the XHCI_SG_TRB_CACHE_SIZE_QUIRK quirk. DWC3 hosts
> >>>>> which are PCI devices does not use OF to create platform device
> >>>>> but create xhci-plat platform device at runtime. So
> >>>>> this patch allows parent device to supply the quirk
> >>>>> through platform data.
> >>>>>
> >>>>> Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
> >>>>> ---
> >>>>>  drivers/usb/dwc3/host.c | 10 ++++++++++
> >>>>>  1 file changed, 10 insertions(+)
> >>>> What changed from previous versions?
> >>> Resent the patch as it was missed for review by Felipe and I saw your mail
> >>>
> >>> to resend the patch if not reviewed. Other two patches from series are
> >>>
> >>> picked up by Mathias, this one is remaining for review.
> >> Ah, how was I supposed to guess that?  :)
> >>
> >>>>> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> >>>>> index e195176580de..0434bc8cec12 100644
> >>>>> --- a/drivers/usb/dwc3/host.c
> >>>>> +++ b/drivers/usb/dwc3/host.c
> >>>>> @@ -11,6 +11,11 @@
> >>>>>  #include <linux/platform_device.h>
> >>>>>  
> >>>>>  #include "core.h"
> >>>>> +#include "../host/xhci-plat.h"
> >>>> That feels really wrong.  Are you sure about that?
> >>> To use the struct xhci_plat_priv this was included, can you suggest alternative?
> >> If that is the "normal" way to do this with the xhci driver, ok, but I
> >> would like to get an ack from Mathias for this before taking it.
> >>
> > Can you please review this patch which is including the xhci-plat header?  Let me
> > 
> > know if anything should be modified. Ack if this patch looks ok so Greg can
> > 
> > take it.
> > 
> 
> This doesn't look right. 
> 
> dwc3 shouldn't need to know about xhci platform private structures,

Then, how dwc3 host let xhci know which xhci quirks it needs to use?

> besides, this patch now adds the quirk to all xhci platform devices created by dwc3.
> 
> I haven't touched dwc3 at all, but I'd guess you probably need to add a new entry to
> the dwc3_pci_id_table[] in dwc3-pci.c, add a device property, and then look for that
> property in xhci-plat.c, and set the quirk. 
> 

For non-PCI devices, it uses common platform bus, the specific platform
drivers use platform data to pass platform quirks to common driver, so
I added below patch.

46034a999c07 usb: host: xhci-plat: add platform data support

At platform data, the specific host driver could add xhci quirks and let
xhci handle later.

-- 

Thanks,
Peter Chen

