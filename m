Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 987F53B9CC8
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jul 2021 09:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhGBHOX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jul 2021 03:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbhGBHOW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jul 2021 03:14:22 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2585C061764
        for <linux-usb@vger.kernel.org>; Fri,  2 Jul 2021 00:11:50 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id x9-20020a0cda090000b029029c1775bef3so5573724qvj.17
        for <linux-usb@vger.kernel.org>; Fri, 02 Jul 2021 00:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=HBjx96dRvIYpvLm9bDce2WQF6RaXhOM1qkXEjF3chQI=;
        b=vqiqhchLV2gT4U8J5tgFK6IYRNU7yAhHftRlqQdbbKrd1a0Dah7U7nbSEW4Ib34+Q+
         e5ggChBQeS9T4rZi9vXd7PpWhtWstB+7OGSGpSq5Luy9a2XsJreHA8dPpvM74ZrE5HPO
         8jQEMhGCcP6d/Oq/sVdWushjB6jzxzl6I1JQzSqALfACNHhmWk+H57WxsPRnhoEPi03E
         lCStBDLFIGG45xCjbqnmMMKy++0cwNxzZV+n6IfmG1EVS998zYwciGSx3lgrhZ0mWKSQ
         3atYvgpKueteQbEoFpIVqwCTbFdfIED63q09L45NCUT7C2qODDW14OopAFY8qNxMpm5N
         9Brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=HBjx96dRvIYpvLm9bDce2WQF6RaXhOM1qkXEjF3chQI=;
        b=M9dyMbAdySuqtkWOOSJHgoDRl8inyJHJFmdN1jRQEhJOOo7Htq3pSKLU9g+ovihekx
         WNDHPPxMntZKku53ozd4ugg2bD53RkzFyjjpPVM8fK1WVnpSoTb/7686Kk3ssMENkcwa
         Mo6cqFzpV0LXv+KucPzNKDpSAW6ew0hXOq1jdz6tWeE3Jq39VlATv4r0TrBdE+3dCzqc
         aVrX4XQ137tHV/T2I4rhotNCGxzmRAghWG2Upn8C2bC8GAzWHYAB//AXThkK70fv/+o8
         vwahQcb78P34KCDwdGBkGBKqTS520Ow47nc1+csJwB4c57iYb7m5EfVFBgB9sXHKJa55
         Bubw==
X-Gm-Message-State: AOAM530uALyVZVA+fFnjJNZkfgeFrVwtACXM/aM8wjnN8bkqc3qzponI
        dIwUqZ9kv/4kZqXdH5p6geFY9mH3hHge
X-Google-Smtp-Source: ABdhPJw3/J4TdhG5Zpt5/mAeePK+GXLjosZvQn5DY6EGnZ1QYFmEAXyDqDmIcAaDPmUxfVwMdhAEotKrWfDN
X-Received: from gthelen2.svl.corp.google.com ([2620:15c:2cd:202:81c6:dd12:da9f:dd72])
 (user=gthelen job=sendgmr) by 2002:a0c:f78a:: with SMTP id
 s10mr3743938qvn.61.1625209910018; Fri, 02 Jul 2021 00:11:50 -0700 (PDT)
Date:   Fri, 02 Jul 2021 00:11:48 -0700
In-Reply-To: <YN6qf51XfkHFsDx/@kroah.com>
Message-Id: <xr93czs1p4uj.fsf@gthelen2.svl.corp.google.com>
Mime-Version: 1.0
References: <20210702054754.2056918-1-gthelen@google.com> <YN6qf51XfkHFsDx/@kroah.com>
Subject: Re: [PATCH] usb: xhci: avoid renesas_usb_fw.mem when it's unusable
From:   Greg Thelen <gthelen@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Thu, Jul 01, 2021 at 10:47:54PM -0700, Greg Thelen wrote:
>> Commit a66d21d7dba8 ("usb: xhci: Add support for Renesas controller with
>> memory") added renesas_usb_fw.mem firmware reference to xhci-pci.  Thus
>> modinfo indicates xhci-pci.ko has "firmware: renesas_usb_fw.mem".  But
>> the firmware is only actually used with CONFIG_USB_XHCI_PCI_RENESAS.  An
>> unusable firmware reference can trigger safety checkers which look for
>> drivers with unmet firmware dependencies.
>> 
>> Avoid referring to renesas_usb_fw.mem in circumstances when it cannot be
>> loaded (when CONFIG_USB_XHCI_PCI_RENESAS isn't set).
>> 
>> Signed-off-by: Greg Thelen <gthelen@google.com>
>> ---
>>  drivers/usb/host/xhci-pci.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>> 
>> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
>> index 18c2bbddf080..cb148da7a789 100644
>> --- a/drivers/usb/host/xhci-pci.c
>> +++ b/drivers/usb/host/xhci-pci.c
>> @@ -618,8 +618,10 @@ static void xhci_pci_shutdown(struct usb_hcd *hcd)
>>  /*-------------------------------------------------------------------------*/
>>  
>>  static const struct xhci_driver_data reneses_data = {
>> +#if IS_ENABLED(CONFIG_USB_XHCI_PCI_RENESAS)
>
> If this is not enabled, why is the whole structure needed?

Removing the struct meant 2 more #if guards needed below to initialize
pci_ids, which exceeded my taste.

>>  	.quirks  = XHCI_RENESAS_FW_QUIRK,
>>  	.firmware = "renesas_usb_fw.mem",
>> +#endif
>>  };
>>  
>>  /* PCI driver selection metadata; PCI hotplugging uses this */
>> @@ -636,7 +638,13 @@ static const struct pci_device_id pci_ids[] = {
>>  	{ /* end: all zeroes */ }
>>  };
>>  MODULE_DEVICE_TABLE(pci, pci_ids);
>> +/*
>> + * Without CONFIG_USB_XHCI_PCI_RENESAS renesas_xhci_check_request_fw() won't
>> + * load firmware, so don't encumber the xhci-pci driver with it.
>> + */
>> +#if IS_ENABLED(CONFIG_USB_XHCI_PCI_RENESAS)
>>  MODULE_FIRMWARE("renesas_usb_fw.mem");
>> +#endif
>
> Why not just have this one chunk, why is the first chunk needed?

It seemed cleaner to remove both renesas_usb_fw.mem references rather
than leave one unusable one in reneses_data above.  But a simpler patch
is appealing, especially given the number of #if guards needed to remove
reneses_data.  Patch V2 will just go with this 1-hunk approach.

> And a blank line please before your comment?

Will do.

> And can you add a Fixes: line to the changelog text when you resend?

Will do.

> thanks,
>
> greg k-h
