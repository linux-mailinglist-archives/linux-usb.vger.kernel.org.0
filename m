Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF4126A77A
	for <lists+linux-usb@lfdr.de>; Tue, 15 Sep 2020 16:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbgIOOq3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Sep 2020 10:46:29 -0400
Received: from netrider.rowland.org ([192.131.102.5]:56145 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726902AbgIOOqB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Sep 2020 10:46:01 -0400
Received: (qmail 1003810 invoked by uid 1000); 15 Sep 2020 10:45:48 -0400
Date:   Tue, 15 Sep 2020 10:45:48 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sid Spry <sid@aeam.us>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB Hardware Power Control, IOCTL_USB_HUB_CYCLE_PORT Equivalent
Message-ID: <20200915144548.GA1002979@rowland.harvard.edu>
References: <33a6b755-f1ba-4c9c-9320-601365afbd67@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33a6b755-f1ba-4c9c-9320-601365afbd67@www.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 14, 2020 at 09:14:44PM -0500, Sid Spry wrote:
> Hi, after a fair bit of looking I do not see a way to do a hard reset of
> a device. Windows seems to expose some functionality that hints these things
> are possible. Does anyone know if it is and is implemented in the Linux
> drivers?

As Greg mentioned, on many systems it is not possible.  On systems where 
it is possible, it can be performed by running a utility program.

> I only find reference to automatic power management in /sys.
> 
> The ioctl in the title (IOCTL_USB_HUB_CYCLE_PORT) is joined by others that seem
> to actually control the power to the port.

I don't understand this sentence.  What do you mean when you say that 
IOCTL_USB_HUB_CYCLE_PORT is joined by others?

And I don't see how there can be any ioctls that control power to a USB 
port when the hardware itself doesn't permit power to be turned off.

> I recently saw patches that would control hub power state via additional
> hardware.

URLs for these patches?

>  It would be good to have a uniform way for userspace to take
> advantage of this power control. Userspace may have further hints that can be
> applied to power consumption, and may need to decide to undertake device
> recovery.
> 
> What originally made me investigate this issue was a series of MCU development
> boards that crash needing power removed to recover. This seems to be impossible
> to do on most hardware. Why?

Indeed, it is impossible on a lot of hardware.  But how come you are 
asking us why?  You should be asking the hardware designers.

>  There's no good reason to remove a complete power
> down from the spec. There are also instances where a hard reset for PCIe, e.g.
> cards malfunctioning when used with VFIO-VGA would have saved hardware from
> being hopelessly broken. So if you are involved in hardware design please
> consider these things.

We are involved in software design, not hardware design.

Alan Stern
