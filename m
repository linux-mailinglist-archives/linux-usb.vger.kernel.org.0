Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76C3125F474
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 09:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbgIGH5k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 03:57:40 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:35037 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726948AbgIGH5c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Sep 2020 03:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599465450;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nqV1U+iS/wbSvsWZCti7KwttLFYUAZFvIRf4r8wREZg=;
        b=au9kl1W1/bwNmc4pSnjT2Nsy9RtqA1IE2fhyeWbYHo4pVhzzaifYf6GwC02UFIOmhhyS3c
        6nnzHoKuYyoT/PIyIrSZYpycAOXx+XLKL2uvG3pn5lFyyRmh7yGOQun5LuF2qMAezS28EF
        ThhVFlmHtPCgYbHMINqBl88BZEd25d8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-BxS_t4dtPEqkTKQU3vweXg-1; Mon, 07 Sep 2020 03:57:29 -0400
X-MC-Unique: BxS_t4dtPEqkTKQU3vweXg-1
Received: by mail-ed1-f70.google.com with SMTP id b12so4595347edw.15
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2020 00:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nqV1U+iS/wbSvsWZCti7KwttLFYUAZFvIRf4r8wREZg=;
        b=Kuohy914TZhST0UeZJnKD8XNYOafjKuWBpavgew5tcDlKFMxIEkfCMHPXZQxFh1+U0
         4zCAyYQe7ql+Rh3CdSXvgrwiB2plIHNOa3a0mbjdLtRskgXq19J8a6ctVOOVpOLqR7eO
         JycCOso7CHjvLxXZH1jcWd79l5qPE2L4gpPk0KJ62pHw1Y3xobCjs8DNUApYHuEu70St
         2s3SRWDBF0pSLZgmPYTfjXYQIM3kWvzZOzx42smyg0jwhmz2nquolSeKW6vDE1oftGhI
         F63GEiofDFYVWsFQMVtT+3Mlxkf0SZOtRMD2reP3ySKq5dejWZsm05TOnfywxCGwE7kg
         PaEQ==
X-Gm-Message-State: AOAM532pi7Kdn3NerY79i3uEO6LldX9y2cWQY7ZsEx/e00KaIVpoHXph
        WrSxUVadonhN+yguXl9QJLqxuw0bh0Evc4FgRjjKKUVPvoRqT2/CDm28U3DoVEsKM+N+kMR59Cd
        wQ+NrbI8xr57KNNl1pclP
X-Received: by 2002:aa7:d697:: with SMTP id d23mr21010980edr.13.1599465447685;
        Mon, 07 Sep 2020 00:57:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxv6Irpt2TMR3kGMRsfq9xQkoAMlFtXg7yrsTO1bgCHmM34T4fy3at4GOsxP+pl1bDlV7HiRg==
X-Received: by 2002:aa7:d697:: with SMTP id d23mr21010968edr.13.1599465447474;
        Mon, 07 Sep 2020 00:57:27 -0700 (PDT)
Received: from x1.localdomain ([78.108.130.193])
        by smtp.gmail.com with ESMTPSA id j14sm14061078edr.91.2020.09.07.00.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 00:57:26 -0700 (PDT)
Subject: Re: 5.8 regression: Low-speed interrupt transfers not working on
 (some?) 9 Series Chipset xHCI Controllers
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <428aa83d-ab2e-d391-3449-770d108bb087@redhat.com>
 <9b1b1f17-83a8-2e4d-ee73-f28eedac2777@linux.intel.com>
 <4e95ce6c-2e45-2c55-507d-02d5a9fed631@redhat.com>
Message-ID: <e1113796-6407-40db-babd-493418c2a22c@redhat.com>
Date:   Mon, 7 Sep 2020 09:57:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4e95ce6c-2e45-2c55-507d-02d5a9fed631@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 9/2/20 5:17 PM, Hans de Goede wrote:
> Hi,
> 
> On 9/2/20 2:17 PM, Mathias Nyman wrote:
>> Hi
>>
>> On 2.9.2020 12.07, Hans de Goede wrote:
>>> Hi,
>>>
>>> I've been working with 2 Fedora users who both report that there
>>> keyboard and mouse has stopped working after upgrading to
>>> 5.7.17 -> 5.8.4 .
>>>
>>> After some back and forth I have found the following common pattern:
>>>
>>> 1. Both reporters have a "9 Series Chipset Family USB xHCI Controller"
>>> 2. Both reporters have a lo-speed (1.5M) keyboard and mouse connected to
>>>     that XHCI controller
>>> 3. The kbd/mouse gets detected but does not send events.
>>>
>>> So there seems to be an issue with lo-speed USB interrupt-transfers
>>> not working on the "9 Series Chipset Family USB xHCI Controller".
>>>
>>> One reporter is using a DELL Precicion T5610 laptop, the PCI id
>>> of the XHCI controller there is 8086:8cb1 and both 5.7 and 5.8 dmesg say:
>>>
>>> [    3.324639] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x0000000000009810
>>> [    3.324643] xhci_hcd 0000:00:14.0: cache line size of 64 is not supported
>>
>> Are there any logs of this?
> 
> Yes, sorry I should have included a bugzilla link, the bugzilla has
> lsusb -t and dmesg out from both users with both kernels:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1874300
> 
> But it seems that at least part of the problem is the xhci driver
> being built as a module with the Fedora 5.8 kernels where as 5.7
> had it builtin, so first let me investigate that angle further before
> you spend more time on this.

Ok, so having the xhci driver moved to being builtin again (it became a
module by accident because of the new XHCI_RENESAS Kconfig option)
resolves the issue for both users reporting this issue.

For 1 user this makes sense, because he needed the kbd in the initrd
and the xhci module was not being included.

For the other user, the original reporter of:
https://bugzilla.redhat.com/show_bug.cgi?id=1874300

this is not expected though, he does not need his kbd/mouse to boot,
and once at the gdm login screen then if xhci is a module or not
should not matter.

Upon re-reading his comments I think I got one part of this bug-report
wrong. He ran "lsusb -t" with his mouse + kbd in the non-working XHCI
ports, but he did so with a working kernel (if I'm reading the report
correctly this second reading). So I think that his mouse/kbd might
actually be not detected at all when plugged into xhci ports and
xhci is build as a module. To me that seems to make more sense
then interrupt-transfers not working.

My theory is that the ports are being turned off by the kernel when it
turns of unused ACPI power-resources before switching to the initrd;
and that for some reason they are not turned back-on when the XHCI
module loads.

Anyways for now building in the xhci module worksaround this, but
IMHO it would be good to get to the bottom of this issue.

Regards,

Hans

