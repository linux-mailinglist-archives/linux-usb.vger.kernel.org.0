Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CAD4799D6C
	for <lists+linux-usb@lfdr.de>; Sun, 10 Sep 2023 11:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344083AbjIJJMF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 Sep 2023 05:12:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237286AbjIJJME (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 10 Sep 2023 05:12:04 -0400
Received: from server.atrad.com.au (server.atrad.com.au [150.101.241.2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0351C7
        for <linux-usb@vger.kernel.org>; Sun, 10 Sep 2023 02:11:56 -0700 (PDT)
Received: from marvin.atrad.com.au (marvin.atrad.com.au [192.168.0.2])
        by server.atrad.com.au (8.17.2/8.17.2) with ESMTPS id 38A9BVI5030628
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 10 Sep 2023 18:41:34 +0930
Date:   Sun, 10 Sep 2023 18:41:31 +0930
From:   Jonathan Woithe <jwoithe@just42.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Samsung T5 SSD: "Synchronize Cache(10) failed" on removal
Message-ID: <ZP2IQxeiAZpC+578@marvin.atrad.com.au>
References: <ZPwnmHV6rIV7Nsg9@marvin.atrad.com.au>
 <62aaef13-c782-4d18-a59e-f8c1b24b595f@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62aaef13-c782-4d18-a59e-f8c1b24b595f@rowland.harvard.edu>
X-MIMEDefang-action: accept
X-Scanned-By: MIMEDefang 2.86 on 192.168.0.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan

On Sat, Sep 09, 2023 at 12:14:49PM -0400, Alan Stern wrote:
> > If on the other hand it' is something best fixed, please let me know how I
> > can assist with this.
> 
> The most likely situation where this would indicate a real problem would 
> be if you had mounted a filesystem on the drive, written some data, and 
> then unplugged it without unmounting first.  If you haven't done that 
> then you don't have to worry about anything.

Thanks for confirming this.  The scenarios I've outlined all involve drives
which have definitely been unmounted before they were unplugged.  Thus, so
long as the unmount has been done then this error can be ignored.

I guess what drew my attention to the message is that USB flash drives do
not show the "Synchronize Cache(10) failed" error when unplugged.  I guess
the different behaviour may be the result of varying caching arrangements
(or other low level structural details) across the devices.

> On the other hand, if you would like to get rid of those annoying error 
> messages, you can do so by telling the kernel that the drive is about to 
> be removed before you unplug it.  You do this by writing to the "remove" 
> attribute file in the USB device's sysfs device directory; this is the 
> equivalent of using the "Safely remove a device" button in Windows.  
> Some GUIs may provide an easy-to-use mechanism for doing this, such as 
> an "eject" selection on a device menu.

I've noticed separate "Eject" and "Unmount" items under various desktop
environments and always wondered why they were separated.  Thanks for
providing the missing information.  I personally run a very simple window
manager (fvwm2) so don't get device menus.  If the message gets to me I'll
look into arranging for the sysfs attribute write.  However, knowing now
that it's essentially a quirk of the way the device interacts with the
subsystem I will be happy to simply leave things as they are.

Thank you again for taking the time to respond.

Regards
  jonathan
