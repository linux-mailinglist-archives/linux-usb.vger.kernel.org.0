Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69C1B1C8347
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 09:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgEGHPI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 7 May 2020 03:15:08 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:40587 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbgEGHPI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 May 2020 03:15:08 -0400
Received: from mail-pg1-f200.google.com ([209.85.215.200])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jWakL-00019D-KC
        for linux-usb@vger.kernel.org; Thu, 07 May 2020 07:15:05 +0000
Received: by mail-pg1-f200.google.com with SMTP id j21so3635714pgh.12
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2020 00:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=QxD6a8Q1LwdmN+/x3ssG6/MZTccaR3rqc0dMBZe7Goc=;
        b=MRsI+Ab2Gejt78OjKxEq0g1IFb4EhOvhQVvNHFcRDZM775tfYDuXoIb3tGmNR0931j
         dPM9AU4ThqWMe4cFguwQ1HgWXjJfflt4koFV96YiuRHLe1JOQnFSA3pt2OiTIxKsJb0u
         3Je6Qr81qcbibvHpTsQA8WsxF1Q6xNAwOJfI88Wyw/Urzz4iEP0azLOLS+rUxxdROPyK
         1Nv1yJ2UNnCaos7Vt9nd/Xe22sx/yRZZYnbv+u9fEa9a+HGfb4jTgQy4DijsXg9SMNwZ
         e6iW5eoKK5//UyVBboc86/3dvrl1k5EWKnM5ZiJW6lH5ApGPCtnrP5CB/CYFSh+MDJW6
         AfjA==
X-Gm-Message-State: AGi0PuZvRBMn0arA41e6RjJxU3a7pa1DkmfYQtx4iYDTgBIiJEiOJrlm
        CAOBVBVU2ONw5iw5smKCbhcSM8op/SW8RRzfCNdmA7BnSM+wyqY27LwjFQSgutwo4EbLEoZpKgs
        zo2PlMQdZ6IRlAmeqzWtGX6/pLSkJsDqKf6bEfQ==
X-Received: by 2002:a63:1863:: with SMTP id 35mr8629312pgy.295.1588835704055;
        Thu, 07 May 2020 00:15:04 -0700 (PDT)
X-Google-Smtp-Source: APiQypLYfWuXR6dPyDKUtg1Rc3gHIRtbWerxTBlaZ6Oyhio9FhiV8yFZcG738ApZz2eSRPzRFqx6Zw==
X-Received: by 2002:a63:1863:: with SMTP id 35mr8629293pgy.295.1588835703651;
        Thu, 07 May 2020 00:15:03 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id e4sm3155383pge.45.2020.05.07.00.15.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 May 2020 00:15:03 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] xhci: Make debug message consistent with bus and port
 number
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20200507064510.GA787064@kroah.com>
Date:   Thu, 7 May 2020 15:15:01 +0800
Cc:     mathias.nyman@intel.com,
        "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <C4A734C8-D1C6-45BC-9C0A-92364EAEE3C0@canonical.com>
References: <20200507061755.13280-1-kai.heng.feng@canonical.com>
 <20200507064510.GA787064@kroah.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On May 7, 2020, at 14:45, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> On Thu, May 07, 2020 at 02:17:55PM +0800, Kai-Heng Feng wrote:
>> Current xhci debug message doesn't always output bus number, so it's
>> hard to figure out it's from USB2 or USB3 root hub.
>> 
>> In addition to that, some port numbers are offset to 0 and others are
>> offset to 1. Use the latter to match the USB core.
>> 
>> So use "bus number - port index + 1" to make debug message consistent.
>> 
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> ---
>> drivers/usb/host/xhci-hub.c | 41 +++++++++++++++++++++----------------
>> 1 file changed, 23 insertions(+), 18 deletions(-)
>> 
>> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
>> index f37316d2c8fa..83088c262cc4 100644
>> --- a/drivers/usb/host/xhci-hub.c
>> +++ b/drivers/usb/host/xhci-hub.c
>> @@ -1241,7 +1241,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>> 			temp = readl(ports[wIndex]->addr);
>> 			/* Disable port */
>> 			if (link_state == USB_SS_PORT_LS_SS_DISABLED) {
>> -				xhci_dbg(xhci, "Disable port %d\n", wIndex);
>> +				xhci_dbg(xhci, "Disable port %d-%d\n",
>> +					 hcd->self.busnum, wIndex + 1);
> 
> Shouldn't xhci_dbg() show the bus number already?  

It's the PCI bus number, different to USB2/USB3 root hub bus number...

> If not, please fix
> that up there instead of having to add it to all messages "by hand".

Not all xhci debug messages need roothub number in it.

Kai-Heng

> 
> thanks,
> 
> greg k-h

