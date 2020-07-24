Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAB2A22C585
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 14:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgGXMrP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 08:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbgGXMrO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 08:47:14 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD71C0619D3
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2020 05:47:14 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id h28so6953823edz.0
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2020 05:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :content-transfer-encoding;
        bh=6KkEZM8ql6sB3bfwlLRbZD9RO9Ohnjw37br8ZAYIP+E=;
        b=J5bKZ1ODDpMWwG695g0mbcrTK3X6nm1KgLxG+Gpj4W6nr/F1Q2J0Uoxc7yaj/ceBuC
         YYI6mvsYFoE7F+qeKvSYKuwqPOyJF7j/pQsfbznSkuZhG7ZBCczs29JxGRnQ5xKgCQBV
         1kxfs5/6KP06takLXuMuj34lm8sgawsNNZ7AX2dorsBgD3cNBgO+zEK2HAXkzG8vsggz
         puQt4JSiB00NHHog3MYaK3IF312oU5RTZjMK7uCc3UY1A7AHbi64kzo8z4N0Cn3eXhXf
         7RR4KYKAtz0JYqVroh/tKiyMWB/pZ0aawQBgPyp6Np3v5G4WrDfW+0MEN2/L8fjmOYP3
         D99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
         :cc:subject:content-transfer-encoding;
        bh=6KkEZM8ql6sB3bfwlLRbZD9RO9Ohnjw37br8ZAYIP+E=;
        b=FSYPQoUT/OfKfznmpEx+mMp+C2Re1+6c2SnHo/yPx90oxiryStmYyekHq0irSTeAKD
         izUPSPvVqghg3jnNY+/zhsV9S4pMqqK59ffbr98Kl60W75UWlG9OwQ/O+Z95rssPECVr
         H7w2TeUzoavvySRTRtv6UhDLn3fu+FgZk8NAefKb3wfGoB6rerhZdpYvmttsofRByRmU
         QvyDQG4WMseMKgen44j28W3qjLY6VMNSuULPrsRYN+pcs355GoNm6AY4Es6lv/Z0XInf
         uDrRNhdoGS6l5CafPWCtyT4KAAQh9DJnsS8LHEyO8s19UAJjc6FWn63F9i1XjMdcoZ+m
         HmLQ==
X-Gm-Message-State: AOAM5324XEnke19xqxzwW06u2l3Cuggks6N5IwnNUc5nQLJblGjGdu0I
        AuYI6oVW1cmgFB1RS1/DdvjaPN0oYYM=
X-Google-Smtp-Source: ABdhPJzWBKgKltiu4hfK6yPtmfSbCDFS+ePrvZ1M1+Xmv2p7AE/G7JCkXcCt55VqCysBWzur7wsvyQ==
X-Received: by 2002:a05:6402:337:: with SMTP id q23mr8944220edw.63.1595594832553;
        Fri, 24 Jul 2020 05:47:12 -0700 (PDT)
Received: from [93.173.113.71] (93-173-113-71.bb.netvision.net.il. [93.173.113.71])
        by smtp.gmail.com with ESMTPSA id rs5sm601919ejb.44.2020.07.24.05.47.10
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jul 2020 05:47:11 -0700 (PDT)
Message-ID: <5F1AD830.7050406@gmail.com>
Date:   Fri, 24 Jul 2020 15:46:40 +0300
From:   Eli Billauer <eli.billauer@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.12) Gecko/20100907 Fedora/3.0.7-1.fc12 Thunderbird/3.0.7
MIME-Version: 1.0
To:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Hans de Goede <hdegoede@redhat.com>,
        Ming Lei <ming.lei@canonical.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oliver@neukum.org>
Subject: usb: core: URB completer callback possibly called after usb_kill_anchored_urbs()
 returns
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

My understanding is it should be OK to assume that no calls to completer 
callbacks will be made after usb_kill_anchored_urbs() returns (for that 
anchor, of course). However __usb_hcd_giveback_urb() in 
drivers/usb/core/hcd.c doesn't seem to work that way. It unanchors 
first, then calls the complete method:

     usb_unanchor_urb(urb);
     if (likely(status == 0))
         usb_led_activity(USB_LED_EVENT_HOST);

     /* pass ownership to the completion handler */
     urb->status = status;
     kcov_remote_start_usb((u64)urb->dev->bus->busnum);
     urb->complete(urb);

So if usb_kill_anchored_urbs() is called while __usb_hcd_giveback_urb() 
is in the middle of this code passage, it will miss the URB that is 
being finished, and possibly return before the completer has been called.

It might sound like a theoretic race condition, but I actually got a 
kernel panic after yanking the USB plug in the middle of heavy traffic. 
The panic's call trace indicated that the driver's completer callback 
function attempted to access memory that had been freed previously. As 
this happened within an IRQ, it was a fullblown computer freeze.

The same driver's memory freeing mechanism indeed calls 
usb_kill_anchored_urbs() first, then frees the URBs' related data 
structure. So it seems like it freed the memory just before the 
completer callback was invoked.

I would love to submit a patch that moves the usb_unanchor_urb() call a 
few rows down, but something tells me it's not that simple.

As a side note, the comment along with commit 6ec4147, which added 
usb_anchor_{suspend,resume}_wakeups calls, said among others: "But 
__usb_hcd_giveback_urb() calls usb_unanchor_urb before calling the 
completion handler. This is necessary as the completion handler may 
re-submit and re-anchor the urb". Not sure I understood this part, though.

Any insights?

Thanks,
    Eli

