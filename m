Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9517051DA9C
	for <lists+linux-usb@lfdr.de>; Fri,  6 May 2022 16:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442238AbiEFOiz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 May 2022 10:38:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234559AbiEFOiy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 May 2022 10:38:54 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 2576E692A1
        for <linux-usb@vger.kernel.org>; Fri,  6 May 2022 07:35:11 -0700 (PDT)
Received: (qmail 43931 invoked by uid 1000); 6 May 2022 10:35:10 -0400
Date:   Fri, 6 May 2022 10:35:10 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     James Dutton <james.dutton@gmail.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: usb disk drive disconnect making readonly
Message-ID: <YnUyHu7o7OPawXZG@rowland.harvard.edu>
References: <CAAMvbhGURWPbHUw5gOirJer7-+VwWFL4tTtiSYSJW=3y1G92mw@mail.gmail.com>
 <YnPcWuhpFrqjeIIs@rowland.harvard.edu>
 <CAAMvbhHsUL6gQ365wZW4J8RCbnhwEt0RDUc5NA4=RSS2bjnK_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAMvbhHsUL6gQ365wZW4J8RCbnhwEt0RDUc5NA4=RSS2bjnK_A@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Please use Reply-To-All so that your messages get sent to the mailing
list as well as to me.

On Thu, May 05, 2022 at 11:32:14PM +0100, James Dutton wrote:
> On Thu, 5 May 2022 at 15:16, Alan Stern <stern@rowland.harvard.edu> wrote:
> 
> >
> > There is no way to know what is going on unless you provide a lot more
> > information.  The dmesg log showing what happens during one of these
> > disconnect/reconnect events would be a good start (although it probably
> > won't be enough).
> >
> > Alan Stern
> 
> Hi Alan,
> 
> Here are some log messages. I suspect the storage device is going into
> some sort of sleep mode, and the kernel does not seem to be able to
> wake it up again.
> The device is a USB to NVME adapter. Using the chip: Realtek RTL9210
> The log is perfectly normal up until the 2nd line below onwards:
...

That log isn't sufficient.

It would be a big help if instead of sending your kernel log file, you send
the output of the "dmesg" program.  And don't send just the part
starting where the problem begins; we need to see what happened before
that as well.

In addition, it would help if you enable USB debugging before the
problem occurs:

	echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control

Alan Stern
