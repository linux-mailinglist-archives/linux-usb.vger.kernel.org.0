Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AABD21B9F52
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2020 11:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgD0JFz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 27 Apr 2020 05:05:55 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50570 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726904AbgD0JFy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Apr 2020 05:05:54 -0400
Received: from mail-pj1-f69.google.com ([209.85.216.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jSzi4-0004tW-6E
        for linux-usb@vger.kernel.org; Mon, 27 Apr 2020 09:05:52 +0000
Received: by mail-pj1-f69.google.com with SMTP id 9so15546738pjz.6
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2020 02:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Pcx2g83PP8toBMlcdLpMEWh36tsA4Z6uQa84z6BSWpY=;
        b=h9Tmc2nNxZeSQ5XOoztM0FUsjoNekg9iPafQMPFGqvrEP2M+XJ/LOW3NeNuHroYO9y
         BwabdL/vgPXfUXpYIhghxSWkShF5b78C1cimr5dr13Qf91ynbMV984aUSRI+c3eqW2lO
         B8AncUsgHk/0/AOUoXKec6TXj29ezHNv2FBCgFVgv5RfWg0hfM+xMw2TgCr4M3fF24aN
         0An2ucyaE+WN9QwaIXCyRJ6PLmft213fz0QubAKMcWOwcwlL7+zSx3suuD+O17wcIw8Q
         bQsbS8jAulSrfvZ02qhmT7glL7tR2fCeYFyv8wbKf3pSB31Nq0k1+HXPSt/H/V+4rMG7
         YXsg==
X-Gm-Message-State: AGi0Pub5OlFV+xjV3F9xwsXPa7z4kVmrr/jwrDcFspMmuzVaZu0/HhNd
        HaFKY697Ne894sOmQTDTD+quDrmCAGVUk1hbgFPro8pIqJn1SrsAOqrX4xN7QnX77NMwzf4LRxK
        WAt6tpSkP7qKwydxmThpNuesV7RQ2WaY9Z2wEsw==
X-Received: by 2002:a63:c70e:: with SMTP id n14mr21796946pgg.249.1587978350672;
        Mon, 27 Apr 2020 02:05:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypKUWbLARUev3B+OQzVjnKpJOk/nurIAQzMrbxQaIM0l8YOxsM1fmDqXICkKWqGpShc4fPRziA==
X-Received: by 2002:a63:c70e:: with SMTP id n14mr21796924pgg.249.1587978350291;
        Mon, 27 Apr 2020 02:05:50 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id b7sm11726907pft.147.2020.04.27.02.05.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Apr 2020 02:05:49 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2] xhci: Set port link to RxDetect if port is not enabled
 after resume
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <35fbb517-31b1-7bba-8e07-795ab18af1ff@linux.intel.com>
Date:   Mon, 27 Apr 2020 17:05:47 +0800
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <47BCEDDA-2E91-4CE3-AA45-B2EEB1DA111D@canonical.com>
References: <20200311040456.25851-1-kai.heng.feng@canonical.com>
 <B4E44BDC-5AFE-4F8A-8498-0EEE9CDAC0E1@canonical.com>
 <635B3350-F064-4B45-B194-40F793423049@canonical.com>
 <35fbb517-31b1-7bba-8e07-795ab18af1ff@linux.intel.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Apr 23, 2020, at 19:25, Mathias Nyman <mathias.nyman@linux.intel.com> wrote:
> 
> On 22.4.2020 16.21, Kai-Heng Feng wrote:
>> 
>> 
>>> On Mar 26, 2020, at 19:33, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
>>> 
>>> Hi Mathias,
>>> 
>>>> On Mar 11, 2020, at 12:04, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
>>>> 
>>>> On Dell TB16, Realtek USB ethernet (r8152) connects to an SMSC hub which
>>>> then connects to ASMedia xHCI's root hub:
>>>> 
>>>> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 5000M
>>>>  |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/7p, 5000M
>>>>          |__ Port 2: Dev 3, If 0, Class=Vendor Specific Class, Driver=r8152, 5000M
>>>> 
>>>> Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>>>> Bus 004 Device 002: ID 0424:5537 Standard Microsystems Corp. USB5537B
>>>> Bus 004 Device 003: ID 0bda:8153 Realtek Semiconductor Corp. RTL8153 Gigabit Ethernet Adapter
>>>> 
>>>> The port is disabled after resume:
>>>> xhci_hcd 0000:3f:00.0: Get port status 4-1 read: 0x280, return 0x280
> 
> That sound like the actual problem.
> Any idea how the port link ends up ends up in the disabled state?

Not really. The port link status just became SS.Disabled after S3 wakeup.

> Was there a request to set port feature, link state to SS.Disabled? 

No, it was correctly set to U3 prior to system S3.

> Or timeouts at resume from U3
> U3 -> Recovery  (timeout) -> Rx.Detect -> Polling (Timeout) ->  SS.Disabled

PLS is SS.Disabled, by reading portsc in xhci_bus_resume().

> 
>>>> 
>>>> According to xHCI 4.19.1.2.1, we should set link to RxDetect to transit
>>>> it from disabled state to disconnected state, which allows the port to
>>>> be set to U0 and completes the resume process.
>>>> 
>>>> My own test shows port can still resume when it's not enabled, as long
>>>> as its link is in U states. So constrain the new logic only when link is
>>>> not in any U state.
> 
> Sounds more like re-enumerate than proper resume if we go to RxDetect in between

Ok. So should we handle this case inside xhci_bus_resume() or somewhere else?

> 
>>>> 
>>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>> 
>>> Do you think this is a proper fix?
>> 
>> Another gentle ping...
>> 
>>> 
>>> Kai-Heng
>>> 
>>>> ---
>>>> drivers/usb/host/xhci-hub.c | 8 ++++++++
>>>> 1 file changed, 8 insertions(+)
>>>> 
>>>> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
>>>> index a9c87eb8951e..263f9a9237a1 100644
>>>> --- a/drivers/usb/host/xhci-hub.c
>>>> +++ b/drivers/usb/host/xhci-hub.c
>>>> @@ -1776,6 +1776,14 @@ int xhci_bus_resume(struct usb_hcd *hcd)
>>>> 			clear_bit(port_index, &bus_state->bus_suspended);
>>>> 			continue;
>>>> 		}
>>>> +
>>>> +		/* 4.19.1.2.1 */
>>>> +		if (!(portsc & PORT_PE) && (portsc & PORT_PLS_MASK) > XDEV_U3) {
>>>> +			portsc = xhci_port_state_to_neutral(portsc);
>>>> +			portsc &= ~PORT_PLS_MASK;
>>>> +			portsc |= PORT_LINK_STROBE | XDEV_RXDETECT;
>>>> +		}
>>>> + 
> This doesn't look like the right solution.
> This will set the link state to RxDetect for any USB3 roothub port
> that is currently not in U0/U1/U2/U3 or Recovery.
> 
> Was this roothub port forcefully suspended xhci_bus_suspend()?
> i.e. was a bit set in bus_state->bus_suspended for this port?

No, it's a USB3 device so it was set to U3 via USB_PORT_FEAT_LINK_STATE.

> 
> Any other logs or traces that could explan what's going on?

Read port status in  xhci_bus_resume():
diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index f37316d2c8fa..c2e9ac3dc227 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1778,7 +1778,7 @@ int xhci_bus_resume(struct usb_hcd *hcd)
        port_index = max_ports;
        while (port_index--) {
                portsc = readl(ports[port_index]->addr);
-
+               xhci_info(xhci, "DEBUG: port %d-%d, portsc 0x%0x pls %d\n", hcd->self.busnum, port_index + 1, portsc, (portsc & PORT_PLS_MASK) >> 5);
                /* warm reset CAS limited ports stuck in polling/compliance */
                if ((xhci->quirks & XHCI_MISSING_CAS) &&
                    (hcd->speed >= HCD_USB3) &&

Here's the log. The log is not full because it's too big to upload:
https://pastebin.ubuntu.com/p/24hzqx2nGD/

> Is the resume due to a wakeup (device initiated resume) from this device,
> or just a host initiated resume?

It's a host initiated resume.

> 
> Thanks
> -Mathias

