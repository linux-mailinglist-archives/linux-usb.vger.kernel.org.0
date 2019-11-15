Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD3FFE1B6
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2019 16:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727608AbfKOPob (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Nov 2019 10:44:31 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:54236 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727505AbfKOPob (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Nov 2019 10:44:31 -0500
Received: (qmail 1788 invoked by uid 2102); 15 Nov 2019 10:44:30 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 15 Nov 2019 10:44:30 -0500
Date:   Fri, 15 Nov 2019 10:44:30 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Exporting USB device ids from the kernel
In-Reply-To: <CAAeHK+yyKeV8h6UO2-4zZM_ndUaHcG1Ex5GYHxdmh_GJxDOa4w@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1911151038480.1527-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 15 Nov 2019, Andrey Konovalov wrote:

> Hi Greg and Alan,
> 
> For USB fuzzing it would be nice to be able to export usb_device_id
> structs from the kernel to facilitate the fuzzer with generating USB
> descriptors that match to actual drivers. The same is required for
> hid_device_id structs, since those are matched separately by the
> usbhid driver (are there other cases like this?).
> 
> Currently I have a hacky patch [1] that walks all drivers for USB and
> HID buses and then prints all device ids for those drivers into the
> kernel log. Those are manually parsed and built into the fuzzer [2]
> and then used to generate USB descriptors [3].

There are so many different flags for those id structures, parsing and 
understanding them must be quite difficult.

> I'm thinking of making a proper patch that will add a debugfs entry
> like usb/drivers (and usb/hid_drivers?), that can be read to get
> USB/HID device ids for all loaded drivers. Would that be acceptable?
> Or should I use some other interface to do that?

I can't think of a better way to get the information from a running 
kernel.

There is another possibility, though.  If the drivers are built as 
modules, the information is already available to userspace tools via
depmod.  You could get it from the modules.dep.bin file.  This has the 
advantage that it will work even for drivers that aren't currently 
loaded.

Alan Stern

