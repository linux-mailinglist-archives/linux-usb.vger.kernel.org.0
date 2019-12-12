Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBEF311C3D7
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 04:23:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfLLDXj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 22:23:39 -0500
Received: from mail-pj1-f42.google.com ([209.85.216.42]:35036 "EHLO
        mail-pj1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbfLLDXi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 22:23:38 -0500
Received: by mail-pj1-f42.google.com with SMTP id w23so418518pjd.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 19:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=8N0rnTsAC58W38GYqn2HffsbmXvaiWZYNnH+q9+1H1Q=;
        b=s4iFP1uAatKUHAdXwSgZ7RyZT6Q/F7USIFUXyTpBBz4hXPGsDiSvUP3uRp/BsQenK0
         h+52VENLHatX4NJVzdosASR+r7t8bqA8Or/5+feTfcBgU2WVwWYXzAuKpsHUT5DeV7iL
         +VEk7+Flj2kDymphQYQQYT6WA2eEVfjSY1gKHRF5t33nHkGZw++ueYBvwMItyIV7uPzv
         jzcLYkuygvyY+i7BIAPOnwlw3vyxe+yAXAWoHAWouiz/Z14hn3OzCMYKgPcyqAZwCsDB
         830ZaoCkh1I0ubIOVgJ6o7PDQqjKSIUE7APuSpW89KY8wRm4nuQGFhlA2eaGCGcowU8p
         1s3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8N0rnTsAC58W38GYqn2HffsbmXvaiWZYNnH+q9+1H1Q=;
        b=gf+jazeFZfhpYJaeyi3VEa4I1osTy1JDFKsB5oF0D2dpn5UsA67v/xTEpalFYRbIjL
         tp/VbgTpLB3jH4RNusMTh0/YzatK8vUbUAeeCKcA9WjgRKDMfutREgUM/yLWaILOTfVw
         pDo3ohVCTc2uwyPUU0PQA0bFDFclyDOyeCudgKKeaP/uVELiY1AWRK4uX9xkEGIY88LX
         DkURGhrrtvUeX3tYiRU1AscHp0MtZZ78RllNqhhIqsSXcb6K8MdNLG8OKWR3nvMJVFvD
         KwyRLkrhEZ2kGvdGI9MqjlmBXggVT8koe9jZx0zjCqFMh/hRpMsE4DMTR2/KdGjK4I8F
         +A0Q==
X-Gm-Message-State: APjAAAVxwNWlvkpgROOX41bCmFtOW3IHl14hrvaw14GrUu22F3izZcnp
        GJPji0zyRzuZCoVAUUNaZWaO79w5I/AQe/TX
X-Google-Smtp-Source: APXvYqxEief8/b7ATmW0r81Lc+tNv53RGgYe/lV0Uc+dOIUtiD/Lw3G0/CBr70bBRSTvPuf9WR6pVw==
X-Received: by 2002:a17:902:7597:: with SMTP id j23mr7135207pll.21.1576121017554;
        Wed, 11 Dec 2019 19:23:37 -0800 (PST)
Received: from [0.0.0.0] (vps.kxuan.tech. [67.216.207.230])
        by smtp.gmail.com with ESMTPSA id e12sm4066381pjs.3.2019.12.11.19.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 19:23:37 -0800 (PST)
Subject: Re: [issue] usbip: vhci-hcd: Device unable to get work after reset
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     linux-usb@vger.kernel.org
References: <9b961779-abe7-f6a4-3f2b-f9303ef39c5b@gmail.com>
 <804f452e-e724-b508-80e7-cfd05da2ff84@linuxfoundation.org>
From:   Zhai Zhaoxuan <kxuanobj@gmail.com>
Message-ID: <364d871d-7869-4146-233f-bd71f74a3dfa@gmail.com>
Date:   Thu, 12 Dec 2019 11:23:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <804f452e-e724-b508-80e7-cfd05da2ff84@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Shuah,

For me, I want to let the remote control software passing some virtual 
device (e.g. ethernet device) to the remote computer.

More specifically, the remote computer is connected to a private 
network, and the local computer is connected to the Internet. And the 
local can only connect to the remote computer using RDP/SPICE protocols, 
some other softwares such as vmware client, or even remote management cards.

All these protocols or softwares support USB redirection. So I can 
create a virtual ethernet device with usbip, let them redirect the USB 
ethernet device to the remote computer, and enable NAT forward.

Then I am able to access the private network with local computer.


Currently, I am writing a user-space program. It runs usbip protocol, 
and can be connected and attached to the vhci.

But the USB redirection will always reset the USB device before it 
passing the device to the remote computer.

And now, this "reset" results the device be disabled and never be 
enabled again. So the redirection fails.


In addition to this, I think usbip is a great module to allow the user 
emulate some other devices and passing them to the remote computer 
easily. For example, the virtual serial port can be emulated in 
user-space, and communicate with the remote computer over SPICE. And 
then, I can get the console output from the remote computer or send 
console command to it.


Thanks,

Zhai Zhaoxuan


On 12/12/19 12:00 AM, Shuah Khan wrote:
> On 12/10/19 4:43 AM, Zhai Zhaoxuan wrote:
>> Hi,
>>
>> I am trying to implement a virtual USB device using usbip. But I get 
>> a trouble.
>>
>
> Can you give me more details on why you are planning to add virtual USB
> to usbip? How does it work with conjunction with the usbip server side?
>
>> When a running port on vhci_hcd is resetted (by setting 
>> USB_PORT_FEAT_RESET), it will never be enabled again.
>>
>> The kernel version is 5.5.0-rc1-00012-g6794862a16ef.
>> In the source file drivers/usb/usbip/vhci_hcd.c:
>>
>>   565         case USB_PORT_FEAT_RESET:
>> ...
>>   572             /* if it's already enabled, disable */
>>   573             if (hcd->speed == HCD_USB3) {
>>   574                 vhci_hcd->port_status[rhport] = 0;
>>   575                 vhci_hcd->port_status[rhport] =
>>   576                     (USB_SS_PORT_STAT_POWER |
>>   577                      USB_PORT_STAT_CONNECTION |
>>   578                      USB_PORT_STAT_RESET);
>>   579             } else if (vhci_hcd->port_status[rhport] & 
>> USB_PORT_STAT_ENABLE) {
>>   580                 vhci_hcd->port_status[rhport] &= 
>> ~(USB_PORT_STAT_ENABLE
>>   581                     | USB_PORT_STAT_LOW_SPEED
>>   582                     | USB_PORT_STAT_HIGH_SPEED);
>>   583             }
>>   584
>>
>> The USB_PORT_STAT_ENABLE is cleard. And it should be set later.
>> But, the GetPortStatus only set the USB_PORT_STAT_ENABLE for 
>> not-assigned ports.
>>
>>   430     case GetPortStatus:
>> ...
>>   456             if (vhci_hcd->vdev[rhport].ud.status ==
>>   457                 VDEV_ST_NOTASSIGNED) {
>>   458                 usbip_dbg_vhci_rh(
>>   459                     " enable rhport %d (status %u)\n",
>>   460                     rhport,
>>   461                     vhci_hcd->vdev[rhport].ud.status);
>>   462                 vhci_hcd->port_status[rhport] |=
>>   463                     USB_PORT_STAT_ENABLE;
>>   464             }
>>
>> The used port (status == VDEV_ST_USED) will be disabled after 
>> USB_PORT_FEAT_RESET, and unable to be enabled again.
>>
>> Should VDEV_ST_USED be added to line 457?
>> And if it shouldn't, how can I enable a port after USB_PORT_FEAT_RESET?
>>
>>
>
> I would like to see server and client side patches and a use-case for
> adding virtual device.
>
> thanks,
> -- Shuah
>
>
