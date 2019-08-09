Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E07348771B
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 12:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406302AbfHIKUG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 06:20:06 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40343 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfHIKUG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Aug 2019 06:20:06 -0400
Received: by mail-ed1-f65.google.com with SMTP id h8so6305378edv.7
        for <linux-usb@vger.kernel.org>; Fri, 09 Aug 2019 03:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UJJGqTltuN0Qpvt/Epw3SSBVUjpjtcYQ0u1Oq3U4/UE=;
        b=g+pBrza9AYIu+BeColGZ7GI+ulM4cxweSf6lE12BHRhsKJXLKIiwYojH04zJw0KRBN
         ulq/NGXHQt+scCB1duxBFNxgXrGS2I5UnylbG6ceffpNaII+sOw/rNROUm8XUbdV/iOt
         Nmby4ZUn9L19rZzO5uyukRIFUMtvd3s5ZEZRGy9905tfWWY16MeqpSI8Ff5Hr4yEd9Uc
         dYDZ5IUBsRmnTgWw0SncKhAx8VWi5duj5lqeEoPAuVPItbqEzQSzbxTcxFb/mG5E2UEl
         cHSzt3B7cQaIT89FigF2ALojasjAoFC3I4ptu+VKxwtghuM4anZTdmyUCqS/5BN4JCqo
         MicA==
X-Gm-Message-State: APjAAAUI+JmT76WoQoTTo4DqbpwCGE47G8DWl+GynekDB82owPepc1Qf
        s5r465bCZA6xFWjS+Pjm1uDuDA==
X-Google-Smtp-Source: APXvYqzXiW/AvTbSLgb6fLpCfeK7Gd/xskGJGMitwTouBpp4QehUbGUvnLteESXkT39oQdoIz87kRA==
X-Received: by 2002:a17:906:80cc:: with SMTP id a12mr17491755ejx.132.1565346004125;
        Fri, 09 Aug 2019 03:20:04 -0700 (PDT)
Received: from localhost.localdomain ([62.140.137.140])
        by smtp.gmail.com with ESMTPSA id 11sm663494eje.81.2019.08.09.03.20.02
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Aug 2019 03:20:03 -0700 (PDT)
Subject: Re: AW: KASAN: use-after-free Read in usbhid_power
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d7f1f3dc-03b3-34b8-657b-13c7b91ee361@redhat.com>
Date:   Fri, 9 Aug 2019 12:20:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8e43085507b849e49e858e5388f3e13c@SVR-IES-MBX-03.mgc.mentorg.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 8/9/19 11:34 AM, Schmid, Carsten wrote:
>> -----Ursprüngliche Nachricht-----
>> Von: Greg KH [mailto:gregkh@linuxfoundation.org]
>> Gesendet: Freitag, 9. August 2019 09:56
>> An: Schmid, Carsten <Carsten_Schmid@mentor.com>
>> Cc: Alan Stern <stern@rowland.harvard.edu>; Andrey Konovalov
>> <andreyknvl@google.com>; Oliver Neukum <oneukum@suse.com>;
>> syzkaller-bugs <syzkaller-bugs@googlegroups.com>; syzbot
>> <syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com>; USB list
>> <linux-usb@vger.kernel.org>; Hillf Danton <hdanton@sina.com>
>> Betreff: Re: KASAN: use-after-free Read in usbhid_power
>>
>> On Fri, Aug 09, 2019 at 07:35:32AM +0000, Schmid, Carsten wrote:
>>> Hi all having use-after-free issues in USB shutdowns:
>>> I hunted for a similar case in the intel_xhci_usb_sw driver.
>>> What i have found and proposed is (from yesterday):
>>> ---
>>> [PATCH] kernel/resource.c: invalidate parent when freed resource has
>> childs
>>>
>>> When a resource is freed and has children, the childrens are
>>> left without any hint that their parent is no more valid.
>>> This caused at least one use-after-free in the xhci-hcd using
>>> ext-caps driver when platform code released platform devices.
>>>
>>> Fix this by setting child's parent to zero and warn.
>>>
>>> Signed-off-by: Carsten Schmid <carsten_schmid@mentor.com>
>>> ---
>>> Rationale:
>>> When hunting for the root cause of a crash on a 4.14.86 kernel, i
>>> have found the root cause and checked it being still present
>>> upstream. Our case:
>>> Having xhci-hcd and intel_xhci_usb_sw active we can see in
>>> /proc/meminfo: (exceirpt)
>>>    b3c00000-b3c0ffff : 0000:00:15.0
>>>      b3c00000-b3c0ffff : xhci-hcd
>>>        b3c08070-b3c0846f : intel_xhci_usb_sw
>>> intel_xhci_usb_sw being a child of xhci-hcd.
>>>
>>> Doing an unbind command
>>> echo 0000:00:15.0 > /sys/bus/pci/drivers/xhci_hcd/unbind
>>> leads to xhci-hcd being freed in __release_region.
>>> The intel_xhci_usb_sw resource is accessed in platform code
>>> in platform_device_del with
>>>                  for (i = 0; i < pdev->num_resources; i++) {
>>>                          struct resource *r = &pdev->resource[i];
>>>                          if (r->parent)
>>>                                  release_resource(r);
>>>                  }
>>> as the resource's parent has not been updated, the release_resource
>>> uses the parent:
>>>          p = &old->parent->child;
>>> which is now invalid.
>>> Fix this by marking the parent invalid in the child and give a warning
>>> in dmesg.
>>> ---
>>>   kernel/resource.c | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/kernel/resource.c b/kernel/resource.c
>>> index 158f04ec1d4f..95340cb0b1c2 100644
>>> --- a/kernel/resource.c
>>> +++ b/kernel/resource.c
>>> @@ -1200,6 +1200,15 @@ void __release_region(struct resource *parent,
>> resource_size_t start,
>>>                          write_unlock(&resource_lock);
>>>                          if (res->flags & IORESOURCE_MUXED)
>>>                                  wake_up(&muxed_resource_wait);
>>> +
>>> +                       write_lock(&resource_lock);
>>
>> Nit, should't this be written so that you only drop/get the lock if the
>> above if statement is true?
>>
> What if some other async part invalidates the child while accessing it?
> I wanted to make sure that the res->child is valid through the time it is accessed.
> 
>>> +                       if (res->child) {
>>> +                               printk(KERN_WARNING "__release_region: %s has child
>> %s,"
>>> +                                               "invalidating childs parent\n",
>>> +                                               res->name, res->child->name);
>>
>> What can userspace/anyone do about this if it triggers?
>>
> At least a platform driver developer can see he did something wrong.
> I had a look at the code of Hans and did not see anything weird.
> (platform driver is in drivers/usb/host/xhci-ext-caps.c)
> The issue is very racy - what happens when the platform code accesses the
> resource mainly depends on if the freed resource memory already has been
> reused by someone.

We are talking memory-mapped io here, so it cannot just be "re-used", it
is wat it is. I guess the PCI BAR could be released and then the physical
address the resource was at could be re-used for another piece of MMIo,
but AFAIK outside of PI=CI hotplug we never release BARs.

Maybe we need to ref-count resources and have the aprent free only be
a deref and not release the resource until the child resource also
is free-ed doing another deref?

I must say that to me it sometimes just seems like always allowing unbind
is a bad idea. Another example of this is things like virtio, where
we can have a filesystem based on virtio-block, but the virtio interface
between the hypervisor and the guest-kernel is a PCI-device and in theory
the user could unbind the virtio driver from that PCI-device, after which
the whole house comes crashing down.

I also know that the extcon framework in its current incarnaton
does not deal with unbind properly...

Maybe it is time that we allow drivers to block unbind instead of
trying to support unbind in really complex situations where normal
use-cases will never need it ?

I do realize unbind is very useful for driver developent without
rebooting.

> It was hard to find that, and only a single core dump enabled me to find it.
> A first attempt was to set resource count to 0 in Hans' driver in the unregister
> pdev before calling platform_device_unregister. That worked.
> But this is a dirty hack in my eyes. The framework should detect such issues,
> so i decided to find the best place where to insert the check - and
> found it is the place where the resource is freed and still has childrens.
> 
>> Can't we fix the root problem in the xhci driver to properly order how
>> it tears things down?  If it has intel_xhci_usb_driver as a "child"
>> shouldn't that be unbound/freed before the parent is?
>>
> Hans, any idea?

1) make resources refcounted, have child resources take a ref on the parent
2) Disallow unbind on devices with bound child-devices?

Regards,

Hans

