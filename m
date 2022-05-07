Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 675AE51E83D
	for <lists+linux-usb@lfdr.de>; Sat,  7 May 2022 17:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385715AbiEGPm6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 7 May 2022 11:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385709AbiEGPm5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 7 May 2022 11:42:57 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id D860B27B2C
        for <linux-usb@vger.kernel.org>; Sat,  7 May 2022 08:39:10 -0700 (PDT)
Received: (qmail 74655 invoked by uid 1000); 7 May 2022 11:39:10 -0400
Date:   Sat, 7 May 2022 11:39:10 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     James Dutton <james.dutton@gmail.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: usb disk drive disconnect making readonly
Message-ID: <YnaSnm8PahLuQzvx@rowland.harvard.edu>
References: <CAAMvbhGURWPbHUw5gOirJer7-+VwWFL4tTtiSYSJW=3y1G92mw@mail.gmail.com>
 <YnPcWuhpFrqjeIIs@rowland.harvard.edu>
 <CAAMvbhHsUL6gQ365wZW4J8RCbnhwEt0RDUc5NA4=RSS2bjnK_A@mail.gmail.com>
 <YnUyHu7o7OPawXZG@rowland.harvard.edu>
 <CAAMvbhGqKF3gVE=MNJ6AXeJCe2F0u13_6W2akuJcP0bx_PSwWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAMvbhGqKF3gVE=MNJ6AXeJCe2F0u13_6W2akuJcP0bx_PSwWw@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 06, 2022 at 09:48:58PM +0100, James Dutton wrote:
> On Fri, 6 May 2022 at 15:35, Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > Hi Alan,
> > >
> > > Here are some log messages. I suspect the storage device is going into
> > > some sort of sleep mode, and the kernel does not seem to be able to
> > > wake it up again.
> > > The device is a USB to NVME adapter. Using the chip: Realtek RTL9210
> > > The log is perfectly normal up until the 2nd line below onwards:
> > ...
> >
> > That log isn't sufficient.
> >
> > It would be a big help if instead of sending your kernel log file, you send
> > the output of the "dmesg" program.  And don't send just the part
> > starting where the problem begins; we need to see what happened before
> > that as well.
> >
> > In addition, it would help if you enable USB debugging before the
> > problem occurs:
> >
> >         echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
> >
> 
> Hi,
> 
> I will try to get some more logs the next time it happens.
> dmesg is not available. As the disk has essentially failed at that
> point, nothing works (no keyboard input), so the only way I have got
> any useful output has been with rsyslog over the network, and then
> show the syslog output on that remote machine.

You can try booting with a network console and increasing the log level 
(so that debug messages are sent to the console).

Alan Stern
