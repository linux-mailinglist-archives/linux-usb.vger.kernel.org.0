Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8B67799EA9
	for <lists+linux-usb@lfdr.de>; Sun, 10 Sep 2023 16:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345753AbjIJOf4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 Sep 2023 10:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjIJOfy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 10 Sep 2023 10:35:54 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 8EFCDCCC
        for <linux-usb@vger.kernel.org>; Sun, 10 Sep 2023 07:35:50 -0700 (PDT)
Received: (qmail 849698 invoked by uid 1000); 10 Sep 2023 10:35:49 -0400
Date:   Sun, 10 Sep 2023 10:35:49 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Jonathan Woithe <jwoithe@just42.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Samsung T5 SSD: "Synchronize Cache(10) failed" on removal
Message-ID: <2d11948e-c809-4990-8ebd-e479cc282b90@rowland.harvard.edu>
References: <ZPwnmHV6rIV7Nsg9@marvin.atrad.com.au>
 <62aaef13-c782-4d18-a59e-f8c1b24b595f@rowland.harvard.edu>
 <ZP2IQxeiAZpC+578@marvin.atrad.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZP2IQxeiAZpC+578@marvin.atrad.com.au>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Sep 10, 2023 at 06:41:31PM +0930, Jonathan Woithe wrote:
> Hi Alan
> 
> On Sat, Sep 09, 2023 at 12:14:49PM -0400, Alan Stern wrote:
> > > If on the other hand it' is something best fixed, please let me know how I
> > > can assist with this.
> > 
> > The most likely situation where this would indicate a real problem would 
> > be if you had mounted a filesystem on the drive, written some data, and 
> > then unplugged it without unmounting first.  If you haven't done that 
> > then you don't have to worry about anything.
> 
> Thanks for confirming this.  The scenarios I've outlined all involve drives
> which have definitely been unmounted before they were unplugged.  Thus, so
> long as the unmount has been done then this error can be ignored.

In principle you can write to a drive without mounting it first.  
Perhaps the most common examples are creating/modifying a partition 
table, doing a filesystem repair, or copying an OS install image.  Then 
there wouldn't be an unmount to automatically synchronize the cache.

However, I believe the partitioning and repair utilities do their own 
cache synchronization, so again it's not an issue in those cases.  
Mostly it's just necessary to be careful about your own raw-disk 
accesses -- something most of us very rarely do.

> I guess what drew my attention to the message is that USB flash drives do
> not show the "Synchronize Cache(10) failed" error when unplugged.  I guess
> the different behaviour may be the result of varying caching arrangements
> (or other low level structural details) across the devices.

Yes.  Most likely the flash drives don't claim to have caches, so the 
kernel doesn't try to issue a SYNCHRONIZE CACHE command.

> > On the other hand, if you would like to get rid of those annoying error 
> > messages, you can do so by telling the kernel that the drive is about to 
> > be removed before you unplug it.  You do this by writing to the "remove" 
> > attribute file in the USB device's sysfs device directory; this is the 
> > equivalent of using the "Safely remove a device" button in Windows.  
> > Some GUIs may provide an easy-to-use mechanism for doing this, such as 
> > an "eject" selection on a device menu.
> 
> I've noticed separate "Eject" and "Unmount" items under various desktop
> environments and always wondered why they were separated.  Thanks for
> providing the missing information.  I personally run a very simple window
> manager (fvwm2) so don't get device menus.  If the message gets to me I'll
> look into arranging for the sysfs attribute write.  However, knowing now
> that it's essentially a quirk of the way the device interacts with the
> subsystem I will be happy to simply leave things as they are.
> 
> Thank you again for taking the time to respond.

You're welcome.

Alan Stern
