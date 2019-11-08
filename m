Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67C24F5A5A
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2019 22:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731097AbfKHVph (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Nov 2019 16:45:37 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:57220 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727768AbfKHVph (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Nov 2019 16:45:37 -0500
Received: (qmail 6968 invoked by uid 2102); 8 Nov 2019 16:45:36 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 8 Nov 2019 16:45:36 -0500
Date:   Fri, 8 Nov 2019 16:45:36 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     linux-usb@vger.kernel.org, <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Felipe Balbi <balbi@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Subject: Re: [PATCH 0/1] usb: gadget: add raw-gadget interface
In-Reply-To: <cover.1573236684.git.andreyknvl@google.com>
Message-ID: <Pine.LNX.4.44L0.1911081642461.1498-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 8 Nov 2019, Andrey Konovalov wrote:

> This patchset (currently a single patch) adds a new userspace interface
> for the USB Gadget subsystem called USB Raw Gadget (I don't mind changing
> the name to something else if there are better ideas). This is what
> currently being used to enable coverage-buided USB fuzzing with syzkaller:
> 
> https://github.com/google/syzkaller/blob/master/docs/linux/external_fuzzing_usb.md
> 
> Initially I was using GadgetFS (together with the Dummy HCD/UDC module)
> to perform emulation of USB devices for fuzzing, but later switched to a
> custom written interface. The incentive to implement a different interface
> was to provide a somewhat raw and direct access to the USB Gadget layer
> for the userspace, where every USB request is passed to the userspace to
> get a response. See documentation for the list of differences between
> Raw Gadget and GadgetFS.
> 
> This patchset has been pushed to the public Linux kernel Gerrit instance:
> 
> https://linux-review.googlesource.com/c/linux/kernel/git/torvalds/linux/+/2144
> 
> Andrey Konovalov (1):
>   usb: gadget: add raw-gadget interface
> 
>  Documentation/usb/index.rst         |    1 +
>  Documentation/usb/raw-gadget.rst    |   60 ++
>  drivers/usb/gadget/Kconfig          |    9 +
>  drivers/usb/gadget/Makefile         |    2 +
>  drivers/usb/gadget/raw.c            | 1150 +++++++++++++++++++++++++++

As a general rule, gadget drivers don't go directly in
drivers/usb/gadget.  raw.c counts as a legacy driver (because it's not
written to use the composite gadget framework), so it belongs in
drivers/usb/gadget/legacy.  That's where the gadgetfs driver lives, for
example.

Alan Stern

>  include/uapi/linux/usb/raw_gadget.h |  164 ++++
>  6 files changed, 1386 insertions(+)
>  create mode 100644 Documentation/usb/raw-gadget.rst
>  create mode 100644 drivers/usb/gadget/raw.c
>  create mode 100644 include/uapi/linux/usb/raw_gadget.h

