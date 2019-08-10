Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6280D88AF4
	for <lists+linux-usb@lfdr.de>; Sat, 10 Aug 2019 13:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbfHJLMx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Aug 2019 07:12:53 -0400
Received: from mail-ed1-f54.google.com ([209.85.208.54]:39117 "EHLO
        mail-ed1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbfHJLMx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 10 Aug 2019 07:12:53 -0400
Received: by mail-ed1-f54.google.com with SMTP id e16so5073100edv.6
        for <linux-usb@vger.kernel.org>; Sat, 10 Aug 2019 04:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K7YFSWgRz1mwAybrRgXiky4TtUREGJr6R7xIcORRy0U=;
        b=JXleIPdyZTNMBiBQc8Ka10qsPwX5hnXEFNaZrllfPWVsdCJreCHis8c6dpXJOAHvnC
         77o6d9UC08cm5vY9EAqKfSF4Z4mDQ+tOE2zMcob4aER3RvxLdUu9SvvPNhYWorSMKarZ
         /fdFP2Zrt9F8DQq4wB/JWXL6lO+vcmdFc78iEnxuyYLFt6gG+N1HLHUK2Z0VvlQSlkxo
         qVUtV91psNJxRCYGRSJzFGxSdwmG9rOc/f9DnNd7y5EP/DtKkvzcw6TqCDCM/TAQuHst
         1e9eJCfZcoTiVkTvgELca9OdliINjHhbwhp1yg7i2gkRv+TkmQ+ZtBi0mcIyjZa3nYBO
         eDAw==
X-Gm-Message-State: APjAAAXxNV2S0Umr0Vr37ewcEw4nyXqXsOKz3pm5znO3npRahNiURgMV
        H5pBIUQU4nxPhu7ocxZ89Eog4w==
X-Google-Smtp-Source: APXvYqzs4JGZVgiE4EAblKDR0ucqYsXjw6NUq2s/o2YpS1vv3GNfP3YwplIsIZ6L2Y+3EddEGGGddQ==
X-Received: by 2002:a50:bb23:: with SMTP id y32mr8669514ede.145.1565435571610;
        Sat, 10 Aug 2019 04:12:51 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id f6sm300202edn.63.2019.08.10.04.12.50
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sat, 10 Aug 2019 04:12:50 -0700 (PDT)
Subject: Re: AW: AW: AW: KASAN: use-after-free Read in usbhid_power
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Andrey Konovalov <andreyknvl@google.com>,
        Oliver Neukum <oneukum@suse.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot <syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Hillf Danton <hdanton@sina.com>
References: <CAAeHK+wb8=Z65_1CGcj0ShT6+NiQSDKhEkBVx+8vPe3kJF8+6g@mail.gmail.com>
 <Pine.LNX.4.44L0.1908081522290.1319-100000@iolanthe.rowland.org>
 <caf422aebd314ab8a5dd96ac2d9bb198@SVR-IES-MBX-03.mgc.mentorg.com>
 <20190809075555.GA20409@kroah.com>
 <8e43085507b849e49e858e5388f3e13c@SVR-IES-MBX-03.mgc.mentorg.com>
 <d7f1f3dc-03b3-34b8-657b-13c7b91ee361@redhat.com>
 <86ef050c477841a6951fd984b38c9f04@SVR-IES-MBX-03.mgc.mentorg.com>
 <9c955960-8b50-30dd-732a-92c62e5761cc@redhat.com>
 <932dbc769a80416eb736e6397c126ce9@SVR-IES-MBX-03.mgc.mentorg.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <95148f7e-1883-0129-091f-802136596bf6@redhat.com>
Date:   Sat, 10 Aug 2019 13:12:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <932dbc769a80416eb736e6397c126ce9@SVR-IES-MBX-03.mgc.mentorg.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 09-08-19 14:38, Schmid, Carsten wrote:
> Hi again,
> 
>>>
>>> Hey, i did not want to trigger an eartquake in the basement of the kernel ;-)
>>> My intention was to prevent some crashes, and help developers to find their bugs.
>>> I think my patch exactly does this.
>>
>> Hehe, actually drivers not being able to block unbind has been bugging me
>> for
>> a while now, because there are cases where this would be really helpful.
>>>> 1) make resources refcounted, have child resources take a ref on the parent
>>>> 2) Disallow unbind on devices with bound child-devices?
>>>>
>>> Exactly what i was thinking of in first attempts.
>>> But i fear that would break even more use cases.
>>>
>>> Hans, directly regarding the driver:
>>> The problem i see is that the xhci_intel_unregister_pdev which is added
>>> as an action with devm_add_action_or_reset() is called late by the framework,
>>> later than the usb_hcd_pci_remove() in xhci_pci_remove.
>>> Is there any chance to trigger this before?
>>> This is what Greg meant with "right order".
>>
>> Ah, I missed that part, sure that should be easy, just stop using
>> devm_add_action_or_reset() and do the xhci_intel_unregister_pdev()
>> manually at the right time. The downside of this is that you also
>> need to make sure it happens at the right time from probe error-paths
>> but given the bug you are hitting, I guess that is probably
>> already a problem.
>>
> @Hans:
> Sure, will have a look at this. I think i have found where to do that,
> but need to check how to get the pdev pointer there ....

You probably need to store the pdev pointer in one of the xhci driver's
private data structs.

Regards,

Hans
