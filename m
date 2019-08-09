Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6C9877DC
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 12:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbfHIKxy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 06:53:54 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:35224 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbfHIKxx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Aug 2019 06:53:53 -0400
Received: by mail-ed1-f67.google.com with SMTP id w20so94525630edd.2
        for <linux-usb@vger.kernel.org>; Fri, 09 Aug 2019 03:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qSg0S5CzZ+H+WW7DJJuVtjhf+EZ/w5pnJtfmd19+bYU=;
        b=Mw40vXreDeYqCdVp+D/6Eok/ja7MOj2zmUwG34HVeZWeR8unt4l/AhfcuNe/Sn8H7o
         FmaxzCqD1uO8yCNdd5topR7GJzOKUMTS3D1TQzD5eOnhcMUWUSpC5jd+pomPtW3HOIAm
         lD24TUZarZIEoUWzuSKbwdKQfAeQvZj2hP+qpM3JkUaNvdQg2BXbLjwJupqF62FcmZr8
         A7htGW00ujMd+717bu8FqJm7eGdm7P6NMtPGLt2YonDZwFXQX82BjRufhws+GozPvwrW
         3Chwki/4lgnFTFKPmCZtuA6u5TJuvXttAgMqtP7n7DI2v4+C67EJi82ml/K/hsmj1fFG
         p1iQ==
X-Gm-Message-State: APjAAAUFFMzAkASgUzBkiqvDZ/46Z1N3AkD67HJ1O1xO6k8mPmNX/WnA
        b2Wj4PqN6rXoPctqrvNk41yp3w==
X-Google-Smtp-Source: APXvYqwLSFJZAidtKazLCGAQEI7WAdkZiCrIuWV3jgPSDsUzaGkWMHF8IAUm3KFSF5tZZzq4e8laBQ==
X-Received: by 2002:a50:87d0:: with SMTP id 16mr20906218edz.133.1565348032439;
        Fri, 09 Aug 2019 03:53:52 -0700 (PDT)
Received: from localhost.localdomain ([62.140.137.140])
        by smtp.gmail.com with ESMTPSA id p3sm22286545eda.43.2019.08.09.03.53.51
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Aug 2019 03:53:51 -0700 (PDT)
Subject: Re: AW: AW: KASAN: use-after-free Read in usbhid_power
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9c955960-8b50-30dd-732a-92c62e5761cc@redhat.com>
Date:   Fri, 9 Aug 2019 12:53:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <86ef050c477841a6951fd984b38c9f04@SVR-IES-MBX-03.mgc.mentorg.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 8/9/19 12:47 PM, Schmid, Carsten wrote:
>>
>> We are talking memory-mapped io here, so it cannot just be "re-used", it
>> is wat it is. I guess the PCI BAR could be released and then the physical
>> address the resource was at could be re-used for another piece of MMIo,
>> but AFAIK outside of PI=CI hotplug we never release BARs.
>>
>> Maybe we need to ref-count resources and have the aprent free only be
>> a deref and not release the resource until the child resource also
>> is free-ed doing another deref?
>>
>> I must say that to me it sometimes just seems like always allowing unbind
>> is a bad idea. Another example of this is things like virtio, where
>> we can have a filesystem based on virtio-block, but the virtio interface
>> between the hypervisor and the guest-kernel is a PCI-device and in theory
>> the user could unbind the virtio driver from that PCI-device, after which
>> the whole house comes crashing down.
>>
>> I also know that the extcon framework in its current incarnaton
>> does not deal with unbind properly...
>>
>> Maybe it is time that we allow drivers to block unbind instead of
>> trying to support unbind in really complex situations where normal
>> use-cases will never need it ?
>>
>> I do realize unbind is very useful for driver developent without
>> rebooting.
>>
> 
> Hey, i did not want to trigger an eartquake in the basement of the kernel ;-)
> My intention was to prevent some crashes, and help developers to find their bugs.
> I think my patch exactly does this.

Hehe, actually drivers not being able to block unbind has been bugging me for
a while now, because there are cases where this would be really helpful.
>> 1) make resources refcounted, have child resources take a ref on the parent
>> 2) Disallow unbind on devices with bound child-devices?
>>
> 
> Exactly what i was thinking of in first attempts.
> But i fear that would break even more use cases.
> 
> Hans, directly regarding the driver:
> The problem i see is that the xhci_intel_unregister_pdev which is added
> as an action with devm_add_action_or_reset() is called late by the framework,
> later than the usb_hcd_pci_remove() in xhci_pci_remove.
> Is there any chance to trigger this before?
> This is what Greg meant with "right order".

Ah, I missed that part, sure that should be easy, just stop using
devm_add_action_or_reset() and do the xhci_intel_unregister_pdev()
manually at the right time. The downside of this is that you also
need to make sure it happens at the right time from probe error-paths
but given the bug you are hitting, I guess that is probably
already a problem.

Regards,

Hans

