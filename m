Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8068920F3C4
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jun 2020 13:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731521AbgF3Lq4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 30 Jun 2020 07:46:56 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43155 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729866AbgF3Lqz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Jun 2020 07:46:55 -0400
Received: from mail-pj1-f72.google.com ([209.85.216.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jqEiw-0005Aj-U7
        for linux-usb@vger.kernel.org; Tue, 30 Jun 2020 11:46:52 +0000
Received: by mail-pj1-f72.google.com with SMTP id i24so9223825pjx.9
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2020 04:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=sbuSARSoydm/w1tLY3AxmNuAm0ttrH3xHuWTiSAIdhs=;
        b=TPs3O4CnkGYAlXVkxQXmaRuWYsZpyq0sko+5xdALflUSg1NyjwC4j7jX4Bh0d1L9sn
         lK2LWy8vXIfWAYLaX21NKR9r7f5lCELK2sjdnVIq8gZ2BHCo6hEFrYU6AEI6EfCghl2U
         GRdsMadTfTqsLGYgzwmryuUXWl1OerlzDkbNEGvbYK8rQihjsdR+bT9+ekyq7p+2aKvk
         yIuzoopWGQ6M/4G+Sns+SAf2wiaYYaxRdX0ZTUqCUhZ4KZtUj1cSzuEClJ+EGCyrFDhY
         8boZLyTTXofw8BqE8EW6XD2wr8nMt1hlmU+okGgljRirhslbqDtOOPGVH+c1yTJO6+gw
         imOw==
X-Gm-Message-State: AOAM530sUtWzIOQH4M/RUapBnZ317vySOoPFDG7KdmIR8xHza2rCzynm
        7ynsYWXFw0Hme56eFFpPAWdQ3XpfximM9l9hy5lA3+MhSalFuWzeQLAKr82amPw7pDzLHbJVrCv
        oJhZBTObqpZ/BA90wSygkkbcgZhJrXiDutBEl7w==
X-Received: by 2002:a63:7741:: with SMTP id s62mr14344467pgc.332.1593517609440;
        Tue, 30 Jun 2020 04:46:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDOQOH0Fg/5/jvkAJ3uPk+LCunRwlmDfZUqr3V6oarC9hx0OSnodB+Gd+bVuLpNzC0ER+fRA==
X-Received: by 2002:a63:7741:: with SMTP id s62mr14344437pgc.332.1593517608855;
        Tue, 30 Jun 2020 04:46:48 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id g7sm2349924pfh.210.2020.06.30.04.46.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jun 2020 04:46:48 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] xhci: Make debug message consistent with bus and port
 number
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <dd75ab92-cb02-4a7d-0a03-f105878f71cd@linux.intel.com>
Date:   Tue, 30 Jun 2020 19:46:45 +0800
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <2542B92A-9E0B-4907-BF29-EA244597CC7B@canonical.com>
References: <20200507061755.13280-1-kai.heng.feng@canonical.com>
 <20200507064510.GA787064@kroah.com>
 <C4A734C8-D1C6-45BC-9C0A-92364EAEE3C0@canonical.com>
 <20200507073119.GA876666@kroah.com>
 <90D5B23E-B037-49D2-BD44-7F9B0B2FC155@canonical.com>
 <20200507082149.GE1024567@kroah.com>
 <938b0ce5-cb56-a356-dec8-3a6adc502752@linux.intel.com>
 <E6AD21DC-A086-44B9-98F5-7FB320E9B457@canonical.com>
 <dd75ab92-cb02-4a7d-0a03-f105878f71cd@linux.intel.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Jun 8, 2020, at 17:29, Mathias Nyman <mathias.nyman@linux.intel.com> wrote:
> 
> On 8.6.2020 6.57, Kai-Heng Feng wrote:
>> 
>> 
>>> On May 7, 2020, at 18:35, Mathias Nyman <mathias.nyman@linux.intel.com> wrote:
>>> 
>>> On 7.5.2020 11.21, Greg Kroah-Hartman wrote:
>>>> On Thu, May 07, 2020 at 03:58:36PM +0800, Kai-Heng Feng wrote:
>>>>> 
>>>>> 
>>>>>> On May 7, 2020, at 15:31, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
>>>>>> 
>>>>>> On Thu, May 07, 2020 at 03:15:01PM +0800, Kai-Heng Feng wrote:
>>>>>>> 
>>>>>>> 
>>>>>>>> On May 7, 2020, at 14:45, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
>>>>>>>> 
>>>>>>>> On Thu, May 07, 2020 at 02:17:55PM +0800, Kai-Heng Feng wrote:
>>>>>>>>> Current xhci debug message doesn't always output bus number, so it's
>>>>>>>>> hard to figure out it's from USB2 or USB3 root hub.
>>>>>>>>> 
>>>>>>>>> In addition to that, some port numbers are offset to 0 and others are
>>>>>>>>> offset to 1. Use the latter to match the USB core.
>>>>>>>>> 
>>>>>>>>> So use "bus number - port index + 1" to make debug message consistent.
>>>>>>>>> 
>>>>>>>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>>>>>>>> ---
>>>>>>>>> drivers/usb/host/xhci-hub.c | 41 +++++++++++++++++++++----------------
>>>>>>>>> 1 file changed, 23 insertions(+), 18 deletions(-)
>>>>>>>>> 
>>>>>>>>> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
>>>>>>>>> index f37316d2c8fa..83088c262cc4 100644
>>>>>>>>> --- a/drivers/usb/host/xhci-hub.c
>>>>>>>>> +++ b/drivers/usb/host/xhci-hub.c
>>>>>>>>> @@ -1241,7 +1241,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>>>>>>>>> 			temp = readl(ports[wIndex]->addr);
>>>>>>>>> 			/* Disable port */
>>>>>>>>> 			if (link_state == USB_SS_PORT_LS_SS_DISABLED) {
>>>>>>>>> -				xhci_dbg(xhci, "Disable port %d\n", wIndex);
>>>>>>>>> +				xhci_dbg(xhci, "Disable port %d-%d\n",
>>>>>>>>> +					 hcd->self.busnum, wIndex + 1);
>>>>>>>> 
>>>>>>>> Shouldn't xhci_dbg() show the bus number already?  
>>>>>>> 
>>>>>>> It's the PCI bus number, different to USB2/USB3 root hub bus number...
>>>>>> 
>>>>>> But if this is using dev_dbg(), and it is, then you know how to look
>>>>>> that up by seeing where that device is in sysfs at that point in time.
>>>>>> 
>>>>>> So why add this again?
>>>>> 
>>>>> xHCI has two HCD, one for USB2 and one for USB3.
>>>>> If both of their port with same number are in use, for instance, port 1, then they are port 1-1 and port 2-1.
>>>>> Right now the debug message only show "Port 1", we still can't find the corresponding port via sysfs with insufficient info.
>>>> 
>>>> Look at the full kernel log line, the xhci hcd device should be showing
>>>> you unique information.  If not, something else is wrong.
>>>> 
>>> 
>>> What Kai-Heng suggest here makes sense, and is useful.
>>> We use similar style debugging in other places, and it is helpful as it matches
>>> usb core debugging style.
>>> 
>>> This might seem odd but reason is that the xHC controller is one device which
>>> doesn't really separate USB2 and USB3.
>>> All ports are for example in one long array.
>>> 
>>> On the xhci driver side things look very different. We register two HCD's,
>>> one for usb 2 and one for USB 3. In many cases the debugging is not tied to a HCD
>>> in any way,  (starting, stopping controller, command completion interrupts etc),
>>> other cases the debugging is very much tied to a specific hcd,
>>> for example when we are handling a port requsts for the roothub.
>> 
>> A gentle ping...
>> 
> 
> Added to my for-usb-next branch, (which I'll need to rebase on 5.8-rc1 once released)

Hmm, not seeing this patch from mainline, next or xhci tree..

Kai-Heng
> 
> -Mathias
> 

