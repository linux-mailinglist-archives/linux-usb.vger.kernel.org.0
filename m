Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD8D7799991
	for <lists+linux-usb@lfdr.de>; Sat,  9 Sep 2023 18:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbjIIQZT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Sep 2023 12:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjIIQOy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 Sep 2023 12:14:54 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 1FC59197
        for <linux-usb@vger.kernel.org>; Sat,  9 Sep 2023 09:14:50 -0700 (PDT)
Received: (qmail 820116 invoked by uid 1000); 9 Sep 2023 12:14:49 -0400
Date:   Sat, 9 Sep 2023 12:14:49 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Jonathan Woithe <jwoithe@just42.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Samsung T5 SSD: "Synchronize Cache(10) failed" on removal
Message-ID: <62aaef13-c782-4d18-a59e-f8c1b24b595f@rowland.harvard.edu>
References: <ZPwnmHV6rIV7Nsg9@marvin.atrad.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPwnmHV6rIV7Nsg9@marvin.atrad.com.au>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 09, 2023 at 05:36:48PM +0930, Jonathan Woithe wrote:
> Hi all
> 
> Recently I became aware that my system reports a "Synchronize Cache(10)
> failed" error whenever a Samsung T5 500 GB SSD is unplugged:
> 
>      sd 11:0:0:0: [sdg] Synchronizing SCSI cache
>      sd 11:0:0:0: [sdg] Synchronize Cache(10) failed: Result: hostbyte=0x07
>                   driverbyte=DRIVER_OK
> 
> Occasionally the "hostbyte" is 0x01 instead of 0x07.  I don't think this is
> a new problem since it's been occuring possibly since I started using the T5
> in early 2021.  A second Samsung T5 (a 250 GB model) triggers the
> same messages when removed.
> 
> To produce the failure message it is necessary to simply connect the drive
> and then remove it.  Mounting a filesystem from the drive is not required. 
> The Linux system does not auto-mount these drives.
> 
> I have seen the problem under kernels 5.15.38, 5.15.72, 5.15.117 and 6.1.52.
> 
> The T5 uses uas by default.  I have tried forcing the use of usb-storage
> with
> 
>   options usb-storage quirks=04e8:61f5:u
> 
> This binds the device to usb-storage instead of uas (according to dmesg) but
> the error is still reported on removal.
> 
> I guess the fundamental question is whether this error is significant in any
> way.  If it's of no consequence then I'll happily ignore it and move on.

The significance is this: When you remove a drive from the system, the 
kernel tries to make sure that any data sent to the drive and still in 
the drive's cache gets safely written out to permanent storage.  It does 
this by sending a SYNCHRONIZE CACHE command to the drive.  Of course, if 
you haven't written anything to the drive then there will be no data to 
synchronize.  Also, if you unmounted a filesystem on the drive just 
before removing it then there will be no data to synchronize, because 
unmounting automatically performs a SYNCHRONIZE CACHE.  In either case, 
failure of the command will have no bad effects.

The reason the error message shows up at all is that the kernel doesn't 
know you're removing the drive until the USB cable gets unplugged.  And 
by then, it's too late to send anything to the drive -- the attempted 
command fails because the computer obviously can't communicate with a 
device that has been unplugged.

> If on the other hand it' is something best fixed, please let me know how I
> can assist with this.

The most likely situation where this would indicate a real problem would 
be if you had mounted a filesystem on the drive, written some data, and 
then unplugged it without unmounting first.  If you haven't done that 
then you don't have to worry about anything.

On the other hand, if you would like to get rid of those annoying error 
messages, you can do so by telling the kernel that the drive is about to 
be removed before you unplug it.  You do this by writing to the "remove" 
attribute file in the USB device's sysfs device directory; this is the 
equivalent of using the "Safely remove a device" button in Windows.  
Some GUIs may provide an easy-to-use mechanism for doing this, such as 
an "eject" selection on a device menu.

Alan Stern
