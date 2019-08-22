Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D100699819
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2019 17:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730842AbfHVPZh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Aug 2019 11:25:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50690 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730818AbfHVPZh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Aug 2019 11:25:37 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 4D69486663
        for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2019 15:25:37 +0000 (UTC)
Received: by mail-ed1-f72.google.com with SMTP id m30so3572614eda.11
        for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2019 08:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0YmCDXLjUz5zh8BC6Hv3a8TKt4N5MLHDRVnBxkpodPg=;
        b=jd7MZK/CfN+KdPdx3YcutMjMAMt1v/djoylN0MsXBIQG6PoalCBPBI6pQ8QpF+I7UN
         FdOtUMQKgVJ88tKsUzlky8+aBLgvZpDGvdIWwnUofQWdZTU464SjXGYX39FZVJwT1NWr
         PlUHUmXmJbEAwtJjv8wafxnyxOCIPvRoLBPzzLsOFcQGzel1QZcyQfymw0C0UhwvRjuR
         rK6Y+2Vpr4ETJsd43NTW1slaR00wvErkj576+hFXB7UEb9d8hm2r/vI8aPU9dRlWIlct
         DBj7gjmpg9EQ+EL79hP2YC4djo4Rgax3x+6Xa/yxoI6HTEqEseVafRKaGS346euH48uh
         KJUQ==
X-Gm-Message-State: APjAAAUTbWDTNqo+164QujUUB1frKSXg71kVJfLb9ut0+/Q88LODESR2
        f5kt46iDcQzbJbYS9RiONgYDnVYDI8/8pNnJppJSQcX//hi1RXxciyfJdF1/aR9IaJxkB4GJTBR
        22G0s1usdG8ndBVcL52/E
X-Received: by 2002:a50:ac1a:: with SMTP id v26mr42792308edc.131.1566487535710;
        Thu, 22 Aug 2019 08:25:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz9mcow7J/U18pvGMNyoZ9TWNRLKzFkVQY94C6hXP/0FvI/fadLhyXCggolEX4btbQPQHEUTw==
X-Received: by 2002:a50:ac1a:: with SMTP id v26mr42792295edc.131.1566487535583;
        Thu, 22 Aug 2019 08:25:35 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id bq19sm3708458ejb.33.2019.08.22.08.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2019 08:25:05 -0700 (PDT)
Subject: Re: [Resend] [PATCH v3] usb: xhci-pci: reorder removal to avoid
 use-after-free
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <1565946200239.8897@mentor.com>
 <fbbf1ed3-c0c0-9b34-aeec-32a6f3645d7b@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6d245699-b7d6-2b40-62df-366c88cba7dc@redhat.com>
Date:   Thu, 22 Aug 2019 17:25:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fbbf1ed3-c0c0-9b34-aeec-32a6f3645d7b@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 22-08-19 17:23, Mathias Nyman wrote:
> On 16.8.2019 12.03, Schmid, Carsten wrote:
>> On driver removal, the platform_device_unregister call
>> attached through devm_add_action_or_reset was executed
>> after usb_hcd_pci_remove.
>> This lead to a use-after-free for the iomem resource of
>> the xhci-ext-caps driver in the platform removal
>> because the parent of the resource was freed earlier.
>>
>> Fix this by reordering of the removal sequence.
>>
> 
> Could all this be avoided if usb_hcd_pci_probe()
> used managed device resources as well?
> (using devm_request_mem_region(), and devm_ioremap_nocache())
> 
> This way the iomem resource would be added to the same devres list
> as the platform_unregister_call, and the iomem resource should be
> released after the platform_device_unregister as devres_release_all()
> releases the resources in reverse order.

Yes I believe that that would work.

Regards,

Hans

