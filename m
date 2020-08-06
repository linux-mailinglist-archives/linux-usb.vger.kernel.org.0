Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D841923DD12
	for <lists+linux-usb@lfdr.de>; Thu,  6 Aug 2020 19:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729775AbgHFQ7s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Aug 2020 12:59:48 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54286 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728976AbgHFQ7g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Aug 2020 12:59:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596733174;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OwZdMvGZm2Yq1gCrONDkRAIzV9hRmTR7rzT+1tvSWhM=;
        b=C/QlxNgyKq4aJjXcL9MsznCtBDhjZh3QdVZJCYyIYyOJBOdLlNqRqeCrBBw4jv9Abku4oy
        pmKe5Z2D93XjKxeHAsWM8l/rGaBsbB+9BjEbf9jPmPMopaFbZinUQGEkc2zKY9kw6NMpx+
        zwuLb8OcJ7cSwJ81DDnORyxrf36lOi4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-7an2AxLYPYKDSJTkpbd5ig-1; Thu, 06 Aug 2020 08:21:53 -0400
X-MC-Unique: 7an2AxLYPYKDSJTkpbd5ig-1
Received: by mail-ed1-f70.google.com with SMTP id v11so13419604edr.13
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2020 05:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OwZdMvGZm2Yq1gCrONDkRAIzV9hRmTR7rzT+1tvSWhM=;
        b=RFMfScoS5DvXOwtpKz/I3cUKOVtBAdVNYWiNntdBBlhcxNQSHSTZuZubRrXeBGnBv9
         SARQXeyDFBMJ6KBPYi+CIiPG1p1/s1hKQKtrh9B02bE9cg0lPnN6teWZ2Rq8k6WIzfOe
         rl4jooB0BGAuIjQ73IzRTgyHmbnlkLe0YyH1/yNl6+Vtdf99ud7QdHHjkf3jnzspByt0
         pZvF068nxVbu1+Gd3UiYPIEZBh8OcYEyeKFg1HylVBmh2PRmIOgkmrn+gHabAS35Afft
         xMS8qbUwqAcGjv5+I64IWjCuaoNPE+ZkioLujG86UIU2HD8Q5nSM7TcyQOG6S1fkpPZK
         yc1w==
X-Gm-Message-State: AOAM5314iYkUB479VmN8M8pdvbRk5XJnNfT1hq1SkYr1AUtx5PMrRsWU
        vl2Orn1eItwoWrdSl8FTPByQ8a7gJ9saSShZSXsv/gXD0UJlY8TclWHqblxpqU9LxbjpzI8J95f
        AhRduyvHsDhywgdeAolgl
X-Received: by 2002:a17:906:c310:: with SMTP id s16mr4098918ejz.466.1596716511805;
        Thu, 06 Aug 2020 05:21:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJ5JEXKmX+PfnYKg3VVFfr1O6oh8ix6A/1yfXlz2PtORtiqAoC0rojD5hxDpDEmvYajKl2KQ==
X-Received: by 2002:a17:906:c310:: with SMTP id s16mr4098899ejz.466.1596716511579;
        Thu, 06 Aug 2020 05:21:51 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id b18sm3683107ejc.41.2020.08.06.05.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2020 05:21:50 -0700 (PDT)
Subject: Re: XHCI-PCI: existing allowlist for enabling auto-suspend/runtime-pm
 in the kernel vs a userspace allowlist ?
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Christian Kellner <ckellner@redhat.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        Mark Pearson <mpearson@lenovo.com>
References: <b8b21ba3-0a8a-ff54-5e12-cf8960651086@redhat.com>
 <20200806121229.GA2852718@kroah.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2e9f2454-ad1b-5783-8418-4a4f38fb9ec1@redhat.com>
Date:   Thu, 6 Aug 2020 14:21:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806121229.GA2852718@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 8/6/20 2:12 PM, Greg Kroah-Hartman wrote:
> On Thu, Aug 06, 2020 at 01:55:55PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> ATM the kernel has a allowlist (coded as a big if) for XHCI-PCI controllers on
>> which to enable auto-suspend. This seems to consist solely of XHCI controllers
>> embedded inside Intel Thunderbolt controllers:
>>
>>          if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
>>              (pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_XHCI ||
>>               pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_XHCI ||
>>               pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_2C_XHCI ||
>>               pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_4C_XHCI ||
>>               pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_XHCI ||
>>               pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_XHCI ||
>>               pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_XHCI ||
>>               pdev->device == PCI_DEVICE_ID_INTEL_ICE_LAKE_XHCI ||
>>               pdev->device == PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI))
>>                  xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
>>
>> I noticed this because it seems that the product-id for the TB controller
>> in the Lenovo T14 gen 1 is missing: 8086:15c1
>>
>> At the same time we also have a more generic allowlist for enabling
>> auto-suspend/runtime-pm in userspace:
>>
>> https://github.com/systemd/systemd/blob/master/hwdb.d/60-autosuspend.hwdb
>>
>> ATM this only contains USB device ids, but there also is a second hwdb
>> file, auto-generated baed on info from ChromeOS (to avoid having to
>> duplicate this info):
>>
>> https://github.com/systemd/systemd/blob/master/tools/make-autosuspend-rules.py
>> https://github.com/systemd/systemd/blob/master/tools/chromiumos/gen_autosuspend_rules.py
>>
>> As you can see this second file already contains a whole bunch of
>> (mostly Intel vendor) PCI vid:pid pairs and udev will enable
>> runtime-pm on these based on the auto generated hwdb file.
>>
>> To me it seems better for future XHCI controllers on which we
>> want to auto-enable runtime-pm, such as the missing 8086:15c1
>> model in userspace, together with the allowlist for runtime-pm
>> on other PCI devices in userspace, rather then to add yet another
>> quirk for this to to xhci-pci.c code.
>>
>> The downside would be that this is somewhat inconsistent with
>> how we have done this before, still I believe that it would
>> be better / easier to maintain this in userspace (hwdb) in the
>> future.
>>
>> So I was wondering what other people think about this?
> 
> Whatever we do, it should all be done in just one place to unify it all
> please.

I agree. But we are going to be stuck (at least for a while)
with the current allowlist (hidden as a big if) in the kernel to
avoid regressions.

We could duplicate that list in hwdb now and then after some
to be decided time period we could consider removing the big if
from the xhci-pci.c code.

> I'd vote for the hwdb location, as all vendors contribute to it and it's
> easier to keep up to date than manually changing the kernel all the time
> when a new device is released.

Using hwdb has my preference too.

Regards,

Hans

