Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5758B68F9F8
	for <lists+linux-usb@lfdr.de>; Wed,  8 Feb 2023 22:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232088AbjBHV5h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Feb 2023 16:57:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbjBHV5g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Feb 2023 16:57:36 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 720352885E
        for <linux-usb@vger.kernel.org>; Wed,  8 Feb 2023 13:57:35 -0800 (PST)
Received: (qmail 749800 invoked by uid 1000); 8 Feb 2023 16:57:34 -0500
Date:   Wed, 8 Feb 2023 16:57:34 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Troels Liebe Bentsen <troels@connectedcars.dk>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: All USB tools hang when one descriptor read fails and needs to
 timeout
Message-ID: <Y+QazpWKzrOXJxCx@rowland.harvard.edu>
References: <Y9KnnH+5O6MtO6kz@rowland.harvard.edu>
 <CAHHqYPNtVkHoiX1LrxUDa32BgVsgymcPtKVODcVGxEh2f=tYRw@mail.gmail.com>
 <Y9P2tvPkdwHrbPXd@rowland.harvard.edu>
 <CAHHqYPPWvxMvSU=HMS9C2aPk08j25MBKXS7XC6im5_oz_nXTuw@mail.gmail.com>
 <Y9l85PAcc/i/tgnS@rowland.harvard.edu>
 <Y9mAYH7L/CcTTSw6@kroah.com>
 <CAHHqYPOkj3oJseEwD3=66zck1LGJGo3DD77cG0E8_GNp3EEDUw@mail.gmail.com>
 <Y+KP0N73jE3PJVZ4@rowland.harvard.edu>
 <Y+PSQIiE5nhCZfoy@rowland.harvard.edu>
 <CAHHqYPM6qb5iXqYYuru_MQDT6J+aMFyY9t+3tvzMeEw_Y1-wvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHHqYPM6qb5iXqYYuru_MQDT6J+aMFyY9t+3tvzMeEw_Y1-wvA@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 08, 2023 at 09:46:01PM +0100, Troels Liebe Bentsen wrote:
> On Wed, 8 Feb 2023 at 17:48, Alan Stern <stern@rowland.harvard.edu> wrote:
> > Here's a patch.  It should fix most of these problems.
> >
> > Alan Stern
> >
> Thanks, it will give the patches a try.
> 
> But I guess it still means that "lsusb -v" or other tools that try to
> read the hub's usbfs file will block until the child device's descriptor read
> has timed out as something in that code path takes the hub's device lock.

That's right.  However, at least you'll be able to kill the process if 
you have to.

> I tried following the code path up from the read descriptors error and it
> looks like locking is done on port level with usb_lock_port until we hit
> hub_event where usb_lock_device(hdev) is taken, being new to this
> code base I'm not sure it's the same mutex we locked on in
> read_descriptors, but do we need to hold it until the end of the
> function or is the hub device lock taken somewhere else?

It is the same mutex.  And yes, it needs to be held until the end of the 
function.

Alan Stern
