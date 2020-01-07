Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D324B132D43
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2020 18:41:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728325AbgAGRlx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jan 2020 12:41:53 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:46882 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728266AbgAGRlx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jan 2020 12:41:53 -0500
Received: (qmail 5139 invoked by uid 2102); 7 Jan 2020 12:41:52 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 7 Jan 2020 12:41:52 -0500
Date:   Tue, 7 Jan 2020 12:41:52 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     =?UTF-8?Q?Tomasz_Mo=C5=84?= <desowin@gmail.com>
cc:     linux-usb@vger.kernel.org, Pete Zaitcev <zaitcev@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: Use of address 0 in usbmon
In-Reply-To: <CAOHtt39wC1RzRWPi2hb6vS7EZWoVxGGHqeten=3a6M-jYGWkcA@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2001071234330.1567-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 7 Jan 2020, Tomasz Moń wrote:

> Hello,
> 
> Linux kernel allows submitting URBs directed at Root Hub. These
> include, but are not limited to, the hub port control requests
> (CLEAR_FEATURE, GET_STATUS). While it works fine and simplifies the
> code, such requests gets reported by usbmon as directed to device
> address 0, which is not quite true.

Before the patch you sent in yesterday, usbmon reported these requests
as directed to device number 1 (which is the number assigned to root
hubs since they are the first devices registered on their USB buses),
not 0.

With the change you made, things aren't so simple any more.  The kernel 
does not control the addresses assigned by the xHCI controller, and 
there's no guarantee that the controller won't use all the addresses 
from 1 to 127 for plugged-in devices, leaving no number available to 
represent the root hub.

> The device address 0 is assigned to device after reset. When capturing
> (in hardware) on the USB bus, there are only two requests sent to
> address 0:
>   * GET DESCRIPTOR
>   * SET ADDRESS
> 
> The genuine "address 0" requests can be differentiated from the "Root
> Hub" requests in usbmon by checking if is_root_hub(urb->dev) is true.
> Unfortunately, this information is not available to user-space and
> thus the tools like Wireshark cannot mark the URBs as directed to Root
> Hub.
> 
> Would it be possible to modify the usbmon format, so the
> is_root_hub(urb->dev) flag would be somehow available to the
> user-space tools?

How about using address 255 in the usbmon output to represent root
hubs?  That wouldn't require any format change at all.

By the way, there is one bad aspect to your patch.  Although the device
addresses output by usbmon will now correspond exactly to the physical
addresses on the bus, they will not correspond to the device numbers
used everywhere else in the kernel.  For example, someone monitoring
communcations with /dev/bus/usb/001/005 won't know what device address
to look for in the usbmon output -- it might not be 005.

Alan Stern

