Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21333260E0A
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 10:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730207AbgIHIvZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 04:51:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39597 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729999AbgIHIvY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Sep 2020 04:51:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599555082;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YvXXF2CNfS/3XNWoI4G1pxmyffWtkkYsbZaMYjeqWaE=;
        b=Dk7ItKl7geZRuTk/X/qxmES4WpFr6CymphKWDlZsGayH2xzhwPqSb8yzQrbyApDskLQJ69
        n+UltA+m+ZusvYYik8v3J2pry7xr2tXJze35pEGCdd9oIgxckiPwZEvVoHD6g6ntQjU6EU
        pZwWznHnovNui1mcpLP8vLtgHsgnKsc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-8cv88t7JMKWxk-UaTTMVaQ-1; Tue, 08 Sep 2020 04:51:20 -0400
X-MC-Unique: 8cv88t7JMKWxk-UaTTMVaQ-1
Received: by mail-ed1-f69.google.com with SMTP id f16so2238321edm.10
        for <linux-usb@vger.kernel.org>; Tue, 08 Sep 2020 01:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YvXXF2CNfS/3XNWoI4G1pxmyffWtkkYsbZaMYjeqWaE=;
        b=dGu1O/7MvXzH7/dF4ztF38SJTbEr6ZF1ZOji01+UVj5n9dTaH0OkytxTFqHdAMMcZv
         cUq3+7PnSUUxyQpzKuaFwzyTWmn4A6NprfVChycS0j2QPJ0ga7Gg/bLMxTH7LeM5BBHo
         wveVnUNCuoSqVeL6qEbXv9a1TwWU+8Cdarz2enp0lcA408I6dqfQ3YYwz332OfF6RCuI
         cU1gxRrsbZBYeq1Mc5H/Dp2YJSfWoxkyPWKpoYW3njaGkkzilMpcK1ttk3FnBxaDCfX5
         7JSE6gUhIYsSB3mJVsT9GZ92/e3FrMULBSMGPlYsH+Kepk5kDJhTAhHnzz/XkwNPyYyC
         EGdA==
X-Gm-Message-State: AOAM5336kI48UeghydP2MlTG95TgnbDSIpQL4oAIqDkPCl332PybPVLR
        BPrCQP2Obey1Bj6AtiQUWJRz65Lk/CVyZfcVy+ZgBekzoFQP3yd3IbNZSmuKZaHXPC4AIq4Iiqu
        kP7GXswfQ0VDGoWrxeNaw
X-Received: by 2002:a50:9d0a:: with SMTP id v10mr25377330ede.144.1599555079122;
        Tue, 08 Sep 2020 01:51:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXfEkRjWtFXzdGrUqMehZ2IYFsjb0JduZYQ6UlncEgRvWrm0bFg3ujg76OSWpLvA36xr0Qpg==
X-Received: by 2002:a50:9d0a:: with SMTP id v10mr25377313ede.144.1599555078847;
        Tue, 08 Sep 2020 01:51:18 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id g20sm14072376ejx.12.2020.09.08.01.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 01:51:18 -0700 (PDT)
Subject: Re: 5.8 regression: XHCI driver not binding to Renesas controllers
 (was Low-speed interrupt transfers not working on (some?) 9 Series Chipset
 xHCI Controllers)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <428aa83d-ab2e-d391-3449-770d108bb087@redhat.com>
 <9b1b1f17-83a8-2e4d-ee73-f28eedac2777@linux.intel.com>
 <4e95ce6c-2e45-2c55-507d-02d5a9fed631@redhat.com>
 <e1113796-6407-40db-babd-493418c2a22c@redhat.com>
Message-ID: <b9cab97f-75fc-ac4c-f81b-23dd6c3def5e@redhat.com>
Date:   Tue, 8 Sep 2020 10:51:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e1113796-6407-40db-babd-493418c2a22c@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 9/7/20 9:57 AM, Hans de Goede wrote:
<snip>

>>> Are there any logs of this?
>>
>> Yes, sorry I should have included a bugzilla link, the bugzilla has
>> lsusb -t and dmesg out from both users with both kernels:
>>
>> https://bugzilla.redhat.com/show_bug.cgi?id=1874300
>>
>> But it seems that at least part of the problem is the xhci driver
>> being built as a module with the Fedora 5.8 kernels where as 5.7
>> had it builtin, so first let me investigate that angle further before
>> you spend more time on this.
> 
> Ok, so having the xhci driver moved to being builtin again (it became a
> module by accident because of the new XHCI_RENESAS Kconfig option)
> resolves the issue for both users reporting this issue.
> 
> For 1 user this makes sense, because he needed the kbd in the initrd
> and the xhci module was not being included.
> 
> For the other user, the original reporter of:
> https://bugzilla.redhat.com/show_bug.cgi?id=1874300
> 
> this is not expected though, he does not need his kbd/mouse to boot,
> and once at the gdm login screen then if xhci is a module or not
> should not matter.
> 
> Upon re-reading his comments I think I got one part of this bug-report
> wrong. He ran "lsusb -t" with his mouse + kbd in the non-working XHCI
> ports, but he did so with a working kernel (if I'm reading the report
> correctly this second reading). So I think that his mouse/kbd might
> actually be not detected at all when plugged into xhci ports and
> xhci is build as a module. To me that seems to make more sense
> then interrupt-transfers not working.
> 
> My theory is that the ports are being turned off by the kernel when it
> turns of unused ACPI power-resources before switching to the initrd;
> and that for some reason they are not turned back-on when the XHCI
> module loads.
> 
> Anyways for now building in the xhci module worksaround this, but
> IMHO it would be good to get to the bottom of this issue.

Ok, so I got this bug completely wrong, their are 2 different issues:

1. xhci built as module, xhci module not available in initrd -> not a kernel bug

2. xhci built as module, while using a renesas xhci controller (these were
quite poplar for a while when Intel chipsets didn't have a builtin XHCI yet).
When this happens users (2 users so far) are seeing the following errors:

Sep 01 10:47:36 kernel: xhci_hcd 0000:05:00.0: FW has invalid version :8216
Sep 01 10:47:36 kernel: xhci_hcd 0000:05:00.0: Direct firmware load for renesas_usb_fw.mem failed with error -2
Sep 01 10:47:36 kernel: xhci_hcd 0000:05:00.0: request_firmware failed: -2
Sep 01 10:47:36 kernel: xhci_hcd: probe of 0000:05:00.0 failed with error -2

Which is fixed by this upstream commit:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d66a57be2f9a315fc10d0f524f670fec903e0fb4

Which has also been added to 5.8.6, so I believe that this is fully resolved now,
sorry for the wrong bug report.

Regards,

Hans

