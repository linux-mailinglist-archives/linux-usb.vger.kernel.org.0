Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A53C1C840B
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 09:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbgEGH6n convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 7 May 2020 03:58:43 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41468 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgEGH6n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 May 2020 03:58:43 -0400
Received: from mail-pf1-f198.google.com ([209.85.210.198])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jWbQW-0006UI-Tj
        for linux-usb@vger.kernel.org; Thu, 07 May 2020 07:58:41 +0000
Received: by mail-pf1-f198.google.com with SMTP id b13so3565565pfp.2
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2020 00:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=DNIHL4BvETSILFTzOQbZtGVTq1Rk6A0XJOGe7AjQ57M=;
        b=pk8FFcXvyeCFVSeNnJyButvz3r+txbJ8lyLNqy1kpnJG9Qm2bAeRkwGi2HhG2F287d
         U7rkdjaQ/ZfTKW50vOz8gHa8apMGoAAcE+ylcKMweHJVVNLi5t/u8idHViJsbQnBeP6g
         Q4/x7Kcq89rg8rVA0X2DGR7SHFQfnrAL+rOAPA9TtS1s6I7pAk0rR0S4Ywn8AB4KoAWI
         RDKIY6MhNhIBQURCxUNh5o3+81NVyPSwA6sAvFno0RUfb4I3T5tOedgpzFy9aqmKWDEs
         5VeYA8igua8d/c2m2C40lwBap92fyBdAzmcPqCY1XzExvcqRFHJv5I2Kef0yROdTXG8u
         L6bA==
X-Gm-Message-State: AGi0PubFP6lE8cYQY1JzkO78fx3kRV90ElAojX4GB88Ms7Q+KsUE/VlR
        siC4QUGC8Mr67vEYuaslV9GsnFTeCRj3OptP40a8VXPo3qQkSHPheMBAr2Ewk8Yf395e2ads24d
        bzEFaiGpERsRzY465z10qu/RRYL2U3GhkKBfR1A==
X-Received: by 2002:a63:d00d:: with SMTP id z13mr462902pgf.54.1588838319573;
        Thu, 07 May 2020 00:58:39 -0700 (PDT)
X-Google-Smtp-Source: APiQypJiX/vdClqh7KHfzxsqQaqvVcdsag38+vTi65xZIooATc2zD7Ct6+78cewvAk4NT+k+WjtBuQ==
X-Received: by 2002:a63:d00d:: with SMTP id z13mr462879pgf.54.1588838319157;
        Thu, 07 May 2020 00:58:39 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id p64sm6983683pjp.7.2020.05.07.00.58.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 May 2020 00:58:38 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] xhci: Make debug message consistent with bus and port
 number
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20200507073119.GA876666@kroah.com>
Date:   Thu, 7 May 2020 15:58:36 +0800
Cc:     mathias.nyman@intel.com,
        "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <90D5B23E-B037-49D2-BD44-7F9B0B2FC155@canonical.com>
References: <20200507061755.13280-1-kai.heng.feng@canonical.com>
 <20200507064510.GA787064@kroah.com>
 <C4A734C8-D1C6-45BC-9C0A-92364EAEE3C0@canonical.com>
 <20200507073119.GA876666@kroah.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On May 7, 2020, at 15:31, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> On Thu, May 07, 2020 at 03:15:01PM +0800, Kai-Heng Feng wrote:
>> 
>> 
>>> On May 7, 2020, at 14:45, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
>>> 
>>> On Thu, May 07, 2020 at 02:17:55PM +0800, Kai-Heng Feng wrote:
>>>> Current xhci debug message doesn't always output bus number, so it's
>>>> hard to figure out it's from USB2 or USB3 root hub.
>>>> 
>>>> In addition to that, some port numbers are offset to 0 and others are
>>>> offset to 1. Use the latter to match the USB core.
>>>> 
>>>> So use "bus number - port index + 1" to make debug message consistent.
>>>> 
>>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>>> ---
>>>> drivers/usb/host/xhci-hub.c | 41 +++++++++++++++++++++----------------
>>>> 1 file changed, 23 insertions(+), 18 deletions(-)
>>>> 
>>>> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
>>>> index f37316d2c8fa..83088c262cc4 100644
>>>> --- a/drivers/usb/host/xhci-hub.c
>>>> +++ b/drivers/usb/host/xhci-hub.c
>>>> @@ -1241,7 +1241,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>>>> 			temp = readl(ports[wIndex]->addr);
>>>> 			/* Disable port */
>>>> 			if (link_state == USB_SS_PORT_LS_SS_DISABLED) {
>>>> -				xhci_dbg(xhci, "Disable port %d\n", wIndex);
>>>> +				xhci_dbg(xhci, "Disable port %d-%d\n",
>>>> +					 hcd->self.busnum, wIndex + 1);
>>> 
>>> Shouldn't xhci_dbg() show the bus number already?  
>> 
>> It's the PCI bus number, different to USB2/USB3 root hub bus number...
> 
> But if this is using dev_dbg(), and it is, then you know how to look
> that up by seeing where that device is in sysfs at that point in time.
> 
> So why add this again?

xHCI has two HCD, one for USB2 and one for USB3.
If both of their port with same number are in use, for instance, port 1, then they are port 1-1 and port 2-1.
Right now the debug message only show "Port 1", we still can't find the corresponding port via sysfs with insufficient info.

> 
>>> If not, please fix
>>> that up there instead of having to add it to all messages "by hand".
>> 
>> Not all xhci debug messages need roothub number in it.
> 
> Why pick these random ones?  What makes these different?

It's not random. We do it when there's a port in message.
Being able to know the exact port like "port 1-1" or "port 2-1", instead of just "port 1", can be really helpful.

Kai-Heng

> 
> Either all or none, be consistant please.
> 
> greg k-h

