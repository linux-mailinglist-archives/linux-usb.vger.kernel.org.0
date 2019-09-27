Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 232BFC0BC1
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2019 20:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725980AbfI0StQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Sep 2019 14:49:16 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:44363 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfI0StP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Sep 2019 14:49:15 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 74984E0005;
        Fri, 27 Sep 2019 18:49:13 +0000 (UTC)
Message-ID: <7f25b01ceb1a3aa6bd213599474ceffc34a0054b.camel@hadess.net>
Subject: Re: Driver for something that's neither a device nor an interface
 driver?
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, benjamin.tissoires@redhat.com
Date:   Fri, 27 Sep 2019 20:49:12 +0200
In-Reply-To: <Pine.LNX.4.44L0.1909271351260.4732-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1909271351260.4732-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-09-27 at 13:56 -0400, Alan Stern wrote:
> 
<snip>
> Is there any reason this needs to be done in a kernel driver?

To offer a unified interface all the devices with similar needs.

>   Can it 
> be handled from userspace instead?

It could, at a great infrastructure cost, trying to get buy-in from
various distributions, at the very least.

> You said this was for a "power supply" class driver.  It's not clear 
> what that means -- the devices you want to communicate with are 
> iphones, ipads, etc., not power supplies.

There's tons of "device" scope "power_supply" devices in the kernel,
which don't power the Linux machine they're running on. Grep for
"POWER_SUPPLY_SCOPE_DEVICE" in the kernel, most wireless mice and
keyboards implement this already.

> Under what circumstances would these messages need to get sent?  

User-space would control it by changing the device's
POWER_SUPPLY_PROP_CHARGE_TYPE to "Fast", if available.

eg.
# echo "Fast" > /sys/devices/pci0000:00/0000:00:14.0/usb3/3-
1/power_supply/apple_mfi_fastcharge/charge_type

> What 
> piece of code is responsible for them?

In user-space? Hasn't been decided yet, but I can imagine a policy
daemon that cares about what devices charge from which other device,
and how fast. For example, a laptop in "low power mode" wouldn't want
to fast charge a phone, if the only reason the phone was plugged in was
to fetch some data off of it, for example.

> If necessary, you can modify the core/generic.c driver.  However
> that 
> might not be the right approach, considering that this is meant only 
> for devices manufactured by Apple.

It's also used by at least one Blackberry device, and I can imagine
other vendors having similar "APIs" to work-around USB 1.x charging
current limits.

I take it that by saying "modify core/generic.c" driver you mean that
it's not possible to inherit from it, right?

