Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A08AF12997C
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2019 18:38:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbfLWRi3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 23 Dec 2019 12:38:29 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:37261 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbfLWRi3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Dec 2019 12:38:29 -0500
Received: from mail-pg1-f197.google.com ([209.85.215.197])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1ijRf0-0006jt-Va
        for linux-usb@vger.kernel.org; Mon, 23 Dec 2019 17:38:27 +0000
Received: by mail-pg1-f197.google.com with SMTP id l13so11000283pgt.5
        for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2019 09:38:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=DxkImzWVfef1xCpc56sb8FA6DnZxPPdiLSLtxzu4Snk=;
        b=HCINTP94FcHEqUJFJKq7Yy8KgdEqF3BVcmZnIIHF9oQscaVZYrCGJ53WC8LXSGpXRH
         DXHi/0RfNjVhU0CqQn65gNdmcsIrsMKXZh+gI+P9PeQIZejDxk40JB9GWqsTbUFUalMh
         SF9LyTerhyF7P9JoePGTz7QAVwHo4YOjuuuft2Jd921ybl/qwMICPjRvgpnQdN4cPQjh
         Dm133kD9IjwIrasq5PQwB2uHhVIal+kZ8zp3rS9ncE3OBAREI1z6rkg0PUqKPmRkfI7K
         aMSTWU8cG656NXE0YcMabwWv/y8dMyNlS8I97yVMQfxF4y3U1BmlFDeJUK9r0lVTF1aI
         s7OQ==
X-Gm-Message-State: APjAAAVrZiuZpT9bh8RCKdlkIDbUj9CFH7VJLknlJz4048cJJHUNCerW
        8iB8GNQ7ejMWB3EItdW/DHOSIFlTiTYmeAZ0ga8Jy3jGuNCgqjMqHNQMWCh0pLWj9L8nXofTnLo
        rmBmf4ueRQXRTjjaQwmp1AfCSykJVrFXk4iTXQQ==
X-Received: by 2002:a17:90a:8902:: with SMTP id u2mr167892pjn.85.1577122324526;
        Mon, 23 Dec 2019 09:32:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqz95yQJjQxTt2znMb73aBoBh3sICPYV2Bs/djISQo4DnHkIWiWB5izrBxMRSwUF7z2lyuvb9g==
X-Received: by 2002:a17:90a:8902:: with SMTP id u2mr167845pjn.85.1577122324151;
        Mon, 23 Dec 2019 09:32:04 -0800 (PST)
Received: from 2001-b011-380f-35a3-a059-d6a4-0e9a-8360.dynamic-ip6.hinet.net (2001-b011-380f-35a3-a059-d6a4-0e9a-8360.dynamic-ip6.hinet.net. [2001:b011:380f:35a3:a059:d6a4:e9a:8360])
        by smtp.gmail.com with ESMTPSA id e10sm26233451pfj.7.2019.12.23.09.32.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Dec 2019 09:32:03 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH v2 2/2] USB: core: Attempt power cycle port when it's in
 eSS.Disabled state
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <c8fc54db-9037-3635-f6a7-d6220e5d02cb@linux.intel.com>
Date:   Tue, 24 Dec 2019 01:32:00 +0800
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Kernel development list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <9883D946-77E0-4645-89FB-0B61D9E84178@canonical.com>
References: <Pine.LNX.4.44L0.1912111006280.1549-100000@iolanthe.rowland.org>
 <c8fc54db-9037-3635-f6a7-d6220e5d02cb@linux.intel.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Dec 17, 2019, at 19:16, Mathias Nyman <mathias.nyman@linux.intel.com> wrote:
> 
> On 11.12.2019 17.08, Alan Stern wrote:
>> On Wed, 11 Dec 2019, Kai-Heng Feng wrote:
>>> 
>>> 
>>>> On Nov 30, 2019, at 01:41, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
>>>> 
>>>> On Dell TB16, Realtek USB ethernet (r8152) connects to an SMSC hub which
>>>> then connects to ASMedia xHCI's root hub:
>>>> 
>>>> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 5000M
>>>>    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/7p, 5000M
>>>>            |__ Port 2: Dev 3, If 0, Class=Vendor Specific Class, Driver=r8152, 5000M
>>>> 
>>>> Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>>>> Bus 004 Device 002: ID 0424:5537 Standard Microsystems Corp. USB5537B
>>>> Bus 004 Device 003: ID 0bda:8153 Realtek Semiconductor Corp. RTL8153 Gigabit Ethernet Adapter
>>>> 
>>>> The SMSC hub may disconnect after system resume from suspend. When this
>>>> happens, the reset resume attempt fails, and the last resort to disable
>>>> the port and see something comes up later, also fails.
>>>> 
>>>> When the issue occurs, the link state stays in eSS.Disabled state
>>>> despite the warm reset attempts. Accoding to spec this can be caused by
>>>> invalid VBus, after some expiremets, the SMSC hub can be brought back
>>>> after a powercycle.
> 
> Could you open up a bit more how this happens, mainly codepaths how the
> USB3 port ends up in eSS.Disabled state

It happens right after hub_resume(), the first get_port_status():
Dec 23 09:46:58 u-XPS-13-9370 kernel: usb usb4: usb resume
Dec 23 09:46:58 u-XPS-13-9370 kernel: hub 4-0:1.0: hub_resume
Dec 23 09:46:58 u-XPS-13-9370 kernel: xhci_hcd 0000:3f:00.0: Get port status 4-1 read: 0x280, return 0x280
Dec 23 09:46:58 u-XPS-13-9370 kernel: usb usb4-port1: status 0280 change 0000
Dec 23 09:46:58 u-XPS-13-9370 kernel: xhci_hcd 0000:3f:00.0: Get port status 4-2 read: 0x2a0, return 0x2a0
Dec 23 09:46:58 u-XPS-13-9370 kernel: xhci_hcd 0000:3f:00.0: Get port status 4-1 read: 0x280, return 0x280
Dec 23 09:46:58 u-XPS-13-9370 kernel: xhci_hcd 0000:3f:00.0: Get port status 4-1 read: 0x280, return 0x280
Dec 23 09:46:58 u-XPS-13-9370 kernel: xhci_hcd 0000:3f:00.0: Get port status 4-1 read: 0x280, return 0x280

And it keeps getting 0x280. It should mean PP = 1 and PLS = 4, so it's in Disabled state.

> 
> There might be something else wrong here.
> My impression is that port should only end up in eSS.Disabled when directed
> to with a Set_Port_Feature(PORT_LINK_STATE, eSS.Disabled) Request.
> After this we shouldn't attempt warm resets, they won't work for USB3 ports in
> ss.Disabled state.

Do you suggest that we should power cycle the port in xHCI instead of USB core?

Kai-Heng

> 
> -Mathias

