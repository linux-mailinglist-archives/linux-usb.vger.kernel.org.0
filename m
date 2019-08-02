Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9C2D7FE95
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2019 18:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391218AbfHBQ11 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Aug 2019 12:27:27 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:41580 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1732543AbfHBQ11 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Aug 2019 12:27:27 -0400
Received: (qmail 4276 invoked by uid 2102); 2 Aug 2019 12:27:26 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 2 Aug 2019 12:27:26 -0400
Date:   Fri, 2 Aug 2019 12:27:26 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: About usb_new_device() API
In-Reply-To: <1564760625.15747.9.camel@opensource.cirrus.com>
Message-ID: <Pine.LNX.4.44L0.1908021221120.1645-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2 Aug 2019, Mayuresh Kulkarni wrote:

> Hi Alan,
> 
> Thanks a lot for clearing out the confusion.
> 
> Our USB device can operate in 2 mutually exclusive modes: one is normal
> composite USB audio mode and other is vendor specific HID device mode.
> 
> On the same platform (Android based):
> - When the device is in normal composite USB audio mode,
> "cat /sys/bus/usb/devices/.../power/control" show "auto".
> - When the device is in vendor specific HID device mode,
> "cat /sys/bus/usb/devices/.../power/control" show "on".
> 
> And hence as per your comment, I am unable to see USB-2.0 L2 for vendor
> specific HID device mode.
> 
> I guess I need to find out "who" is setting the /power/control = "auto"
> when composite USB audio device is detected. And explore if it could be
> moved to a more generic place.

I'm pretty sure this is done by some program, not automatically done by 
the kernel.

> Is there any module parameter (or some other means) by which,
> power/control (or deprecated power/level) will always be "auto", by
> default?

No, there isn't.  The power/control (or power/level) attribute has to 
be set by the user or a program.

Alan Stern

