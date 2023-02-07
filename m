Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7A7668DF6D
	for <lists+linux-usb@lfdr.de>; Tue,  7 Feb 2023 18:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232447AbjBGRw6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Feb 2023 12:52:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232517AbjBGRwg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Feb 2023 12:52:36 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id AF89737F1C
        for <linux-usb@vger.kernel.org>; Tue,  7 Feb 2023 09:52:16 -0800 (PST)
Received: (qmail 703612 invoked by uid 1000); 7 Feb 2023 12:52:16 -0500
Date:   Tue, 7 Feb 2023 12:52:16 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Troels Liebe Bentsen <troels@connectedcars.dk>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: All USB tools hang when one descriptor read fails and needs to
 timeout
Message-ID: <Y+KP0N73jE3PJVZ4@rowland.harvard.edu>
References: <CAHHqYPONhyKrqMWiw29TRETtiBatNaej8+62Z40fvuj3LX4RWQ@mail.gmail.com>
 <Y9J8VncWSJdVURgB@kroah.com>
 <CAHHqYPO_A=7V_8Z-qrGy0-eOkPEpyv+vU_8Jpz-ABGg60t244w@mail.gmail.com>
 <Y9KnnH+5O6MtO6kz@rowland.harvard.edu>
 <CAHHqYPNtVkHoiX1LrxUDa32BgVsgymcPtKVODcVGxEh2f=tYRw@mail.gmail.com>
 <Y9P2tvPkdwHrbPXd@rowland.harvard.edu>
 <CAHHqYPPWvxMvSU=HMS9C2aPk08j25MBKXS7XC6im5_oz_nXTuw@mail.gmail.com>
 <Y9l85PAcc/i/tgnS@rowland.harvard.edu>
 <Y9mAYH7L/CcTTSw6@kroah.com>
 <CAHHqYPOkj3oJseEwD3=66zck1LGJGo3DD77cG0E8_GNp3EEDUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHHqYPOkj3oJseEwD3=66zck1LGJGo3DD77cG0E8_GNp3EEDUw@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 07, 2023 at 09:25:55AM +0100, Troels Liebe Bentsen wrote:
> Hi again,
> 
> Did a bit more testing and found another lock that would be nice to remove,
> the /dev/bus/usb/$BUS/$DEV file for the hub is also locked:
> 
> Bus 003 Device 016: ID 1a40:0201 Terminus Technology Inc. FE 2.1 7-port Hub
> 
> strace lsusb -v
> ...
> openat(AT_FDCWD, "/dev/bus/usb/003/016", O_RDWR|O_CLOEXEC...
> 
> The openat can not be canceled from userspace and even kill -9 won't stop
> the process until the descriptor read times out.

Yes, that really should be an interruptible lock.  In fact, all the 
locks connected with usbfs should be interruptible.

However, it can't be eliminated entirely.  This is a case where two 
things end up being mutually exclusive with each other because they both 
need to be mutually exclusive with a third thing.  In other words, 
opening a hub's usbfs file and probing a hub's children both have to be 
mutually exclusive with disconnecting the hub.  The three pathways all 
use the device lock for this purpose, so they are all mutually exclusive 
with each other.

> Also managed to get "lsusb -v" to hang in an unkillable way even after
> I unplugged the device and hub:
>
> ) = 1 ([{fd=5, revents=POLLIN}])
> ioctl(8, USBDEVFS_DISCARDURB

Making these lock calls interruptible should fix this problem, right?

Alan Stern
