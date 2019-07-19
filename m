Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA876E44C
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jul 2019 12:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727594AbfGSK3e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jul 2019 06:29:34 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59210 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbfGSK3d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Jul 2019 06:29:33 -0400
Received: from mail-pg1-f200.google.com ([209.85.215.200])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1hoQ8p-00087E-GH
        for linux-usb@vger.kernel.org; Fri, 19 Jul 2019 10:29:31 +0000
Received: by mail-pg1-f200.google.com with SMTP id q9so18459724pgv.17
        for <linux-usb@vger.kernel.org>; Fri, 19 Jul 2019 03:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=1nVQ5vFde2Aax31pRq8PHRiApbcBLUlBIhMynsSm0nA=;
        b=PqrhgZQmRNfMxckuzGqTj958Xwg+mFo2IIzW5CtfjXk2GpRYy+NyYoAJkLiaO8+EWF
         Azoprn1x9z/ZUfJOHmcAtXaPeyIy0rDYwtvATnhP26WycskS1oWVIsD6NhgMKkT4rPgY
         6xNNowwBz7p47LqaqnhQqt2fut/gq9dE2zhBGplSsYNSsauvMjAatutgo0otCR5/JWRB
         dp572/0gV/IQW/oKW7Bz1C8o4944E8kCftHxMYpG89e8r86lm3pG6Dj8tJF43mqyEbn1
         nPggUmlz/pi1oNnYM5uetHXgedqmLb1HzdBjJtDynstJRISzj4G0czLzQWIjPZEKiaet
         ZnOw==
X-Gm-Message-State: APjAAAXJp3dNZ7aTTx8n+PPWLiWgWnegd4tO5GcHE1+XR52ic3Mcv/Xd
        BfzSk4Xo92rkIus0BiJfcwTJfyOcOx08OAoy2L1B+xJj2LBFQine7zCbpI5TMfU6yWbrMcGPnCW
        lTsNTl1/3oeGUtAp7NKDeo43X+ex7N1IYk5CAvQ==
X-Received: by 2002:a17:902:aa5:: with SMTP id 34mr58024747plp.166.1563532170213;
        Fri, 19 Jul 2019 03:29:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwbFc1dUzheH+nRR5epNd4C9KKH5tMi1xZofTpvGE3Z3+SATFnAUTWJKU1hoUXskZb7eEl8xA==
X-Received: by 2002:a17:902:aa5:: with SMTP id 34mr58024724plp.166.1563532169774;
        Fri, 19 Jul 2019 03:29:29 -0700 (PDT)
Received: from [10.101.46.45] (61-220-137-37.HINET-IP.hinet.net. [61.220.137.37])
        by smtp.gmail.com with ESMTPSA id p20sm47435747pgj.47.2019.07.19.03.29.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jul 2019 03:29:29 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8;
        delsp=yes;
        format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Titan Ridge xHCI may stop to working after re-plugging the dock
From:   Kai Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <87pnm6sd10.fsf@linux.intel.com>
Date:   Fri, 19 Jul 2019 18:29:26 +0800
Cc:     Oliver Neukum <oneukum@suse.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kent Lin <kent.lin@canonical.com>,
        Linux PCI <linux-pci@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>
Content-Transfer-Encoding: 8bit
Message-Id: <77580193-D67B-48B1-8528-03ED4E7E8D64@canonical.com>
References: <993E78A1-2A60-46D8-AA51-F4CB077E48D1@canonical.com>
 <1562759399.5312.6.camel@suse.com> <87pnm6sd10.fsf@linux.intel.com>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Felipe,

at 3:23 PM, Felipe Balbi <felipe.balbi@linux.intel.com> wrote:

>
> Hi,
>
> Oliver Neukum <oneukum@suse.com> writes:
>> Am Dienstag, den 09.07.2019, 21:10 +0800 schrieb Kai-Heng Feng:
>>> Hi Mika and Mathias,
>>>
>>> I’ve filed a bug [1] which renders docking station unusable.
>>>
>>> I am not sure it's a bug in PCI, Thunderbolt or xHCI so raise the issue  
>>> to
>>> you both.
>>>
>>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=203885
>>>
>>> Kai-Heng
>>
>> The issue starts before you unplug. In fact it starts before
>> the dock is even detected the first time:
>>
>> [   13.171167] rfkill: input handler disabled
>> [   19.781905] pcieport 0000:00:1c.0: PME: Spurious native interrupt!
>> [   19.781909] pcieport 0000:00:1c.0: PME: Spurious native interrupt!
>> [   20.109251] usb 4-1: new SuperSpeedPlus Gen 2 USB device number 2  
>> using xhci_hcd
>> [   20.136000] usb 4-1: New USB device found, idVendor=0bda,  
>> idProduct=0487, bcdDevice= 1.47
>> [   20.136004] usb 4-1: New USB device strings: Mfr=1, Product=2,  
>> SerialNumber=0
>> [   20.136007] usb 4-1: Product: Dell dock
>> [   20.136009] usb 4-1: Manufacturer: Dell Inc.
>> [   20.140607] hub 4-1:1.0: USB hub found
>> [   20.141004] hub 4-1:1.0: 4 ports detected
>> [   20.253025] usb 1-4: new high-speed USB device number 5 using xhci_hcd
>> [   20.403520] usb 1-4: New USB device found, idVendor=0bda,  
>> idProduct=5487, bcdDevice= 1.47
>> [   20.403521] usb 1-4: New USB device strings: Mfr=1, Product=2,  
>> SerialNumber=0
>> [   20.403522] usb 1-4: Product: Dell dock
>> [   20.403522] usb 1-4: Manufacturer: Dell Inc.
>> [   20.404348] hub 1-4:1.0: USB hub found
>>
>> This looks like a PCI issue.
>> In general, this kind of reporting sucks. We have to guess what you did  
>> at 19.781905
>
> It might be nice to know which device is generating that and why it's
> not found. This may help:
>
> diff --git a/drivers/pci/pcie/pme.c b/drivers/pci/pcie/pme.c
> index f38e6c19dd50..33285ef29362 100644
> --- a/drivers/pci/pcie/pme.c
> +++ b/drivers/pci/pcie/pme.c
> @@ -203,7 +203,7 @@ static void pcie_pme_handle_request(struct pci_dev  
> *port, u16 req_id)
>
>   out:
>  	if (!found)
> -		pci_info(port, "Spurious native interrupt!\n");
> +		pci_info(port, "Spurious native interrupt! (Bus# %d DevFn  
> %d)\n", busnr, devfn);
>  }
>
>  /**
>
>
> Also, according to what Kai-Heng said, xHCI stops working even after
> repluggin the Dock. We could be dealing with two bugs here:
>
> 1. Spurious PME event being generated by an unexistent device
> 2. xHCI not handling hot-plug very well
>
> Kai-Heng,
>
> please run your tests again and make note of when you unplugged the dock
> and when you replugged it so we can correlate the time stampts with what
> you have done otherwise we will never be able to pin-point what's going
> on.

I upgraded the system firmware, TBT firmware and docking station firmware  
to latest, and used latest mainline kernel.
Now the issue can be reproduced at the very first time I plugged the  
docking station.

Attach dmesg to BKO since there are lots of message after XHCI dyndbg is  
enabled.

Kai-Heng

>
> cheers
>
> -- 
> balbi


