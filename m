Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03C6650CE42
	for <lists+linux-usb@lfdr.de>; Sun, 24 Apr 2022 03:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237260AbiDXBnS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Apr 2022 21:43:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232333AbiDXBnQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 23 Apr 2022 21:43:16 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 3C36F1021
        for <linux-usb@vger.kernel.org>; Sat, 23 Apr 2022 18:40:16 -0700 (PDT)
Received: (qmail 755867 invoked by uid 1000); 23 Apr 2022 21:40:15 -0400
Date:   Sat, 23 Apr 2022 21:40:15 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [RFC PATCH 0/4] USB: gadget: Create a bus for gadgets
Message-ID: <YmSqf+niNDsJ/yrB@rowland.harvard.edu>
References: <YjeEbHL8ITkW692W@rowland.harvard.edu>
 <YmKt3kH+85kjzdbL@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmKt3kH+85kjzdbL@kroah.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 22, 2022 at 03:30:06PM +0200, Greg KH wrote:
> On Sun, Mar 20, 2022 at 03:45:48PM -0400, Alan Stern wrote:
> > Everyone:
> > 
> > The following series of patches implements Greg's suggestion that 
> > gadgets should be registered on some sort of bus.  It turns out that the 
> > best way to do this is to create a new "gadget" bus, with specialized 
> > matching and probing routines, rather than using an existing bus.
> > 
> > Patches 1-3 are simple preparations for the big change.  They stand on 
> > their own, make useful little changes, and could be merged by themselves
> > without committing to adding the "gadget" bus.  Patch 4 is main one.
> > 
> > I'm posting this series for feedback from the Gadget/UDC maintainer and 
> > others.  If everything works out okay, the patches can be submitted for 
> > real once the upcoming merge window closes.
> 
> At first glance, this looks good to me, many thanks for working on this!

Okay, patches 1-4 have now been submitted officially.

Alan Stern
