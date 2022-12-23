Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79BF5655498
	for <lists+linux-usb@lfdr.de>; Fri, 23 Dec 2022 21:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbiLWUwi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 23 Dec 2022 15:52:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbiLWUwh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Dec 2022 15:52:37 -0500
X-Greylist: delayed 28433 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 23 Dec 2022 12:52:36 PST
Received: from fallback4.mail.ox.ac.uk (fallback4.mail.ox.ac.uk [129.67.1.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8705F1DF2D
        for <linux-usb@vger.kernel.org>; Fri, 23 Dec 2022 12:52:36 -0800 (PST)
Received: from relay19.mail.ox.ac.uk ([129.67.1.170])
        by fallback4.mail.ox.ac.uk with esmtp (Exim 4.92)
        (envelope-from <Dmitrii.Pasechnik@cs.ox.ac.uk>)
        id 1p8hdM-0005UO-ID
        for linux-usb@vger.kernel.org; Fri, 23 Dec 2022 12:58:44 +0000
Received: from mail.cs.ox.ac.uk ([129.67.151.64])
        by relay19.mail.ox.ac.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <Dmitrii.Pasechnik@cs.ox.ac.uk>)
        id 1p8hdK-0004Ix-AS; Fri, 23 Dec 2022 12:58:42 +0000
Received: from clpc177.cs.ox.ac.uk ([129.67.150.177]:51528)
        by mail.cs.ox.ac.uk with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.92.3)
        (envelope-from <Dmitrii.Pasechnik@cs.ox.ac.uk>)
        id 1p8hdI-0007vS-5t; Fri, 23 Dec 2022 12:58:40 +0000
Received: (from dimpase@localhost)
        by clpc177.cs.ox.ac.uk (dcs5.1/8.16.1) id 2BNCwfNd512706;
        Fri, 23 Dec 2022 12:58:41 GMT
Date:   Fri, 23 Dec 2022 12:58:41 +0000
From:   Dmitrii Pasechnik <dima.pasechnik@cs.ox.ac.uk>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: usb 1-3: Product: BBC micro:bit CMSIS-DAP not recognised
Message-ID: <Y6WmAXzpCd7Jj3rS@cs.ox.ac.uk>
References: <Y6B8jd7dHsa85Wny@kroah.com>
 <Y6CRbgwHzjr2KNxK@hilbert>
 <Y6CpKxZ4KsiYttbL@hilbert>
 <Y6Csfzqvy6GExhVB@kroah.com>
 <Y6DjwFAp4M8I+T4P@hilbert>
 <Y6Fc2Fz8w4KoX952@kroah.com>
 <Y6HLqYpxwT+v3BgX@hilbert>
 <Y6ITkWEb25Si4zts@rowland.harvard.edu>
 <35B854FE-1F32-47FD-8ED1-CDE033327531@cs.ox.ac.uk>
 <Y6TLJ94ubE4tOTev@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <Y6TLJ94ubE4tOTev@rowland.harvard.edu>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 22, 2022 at 04:24:55PM -0500, Alan Stern wrote:
> A bit off to the side from the main point of this thread, but...
> 
> On Thu, Dec 22, 2022 at 10:32:09AM +0000, Dima Pasechnik wrote:
> > 
> > 
> > On 20 December 2022 19:57:05 WET, Alan Stern <stern@rowland.harvard.edu> wrote:
> > >> USB Interfaces: MSD, CDC, HID, WebUSB
> > >
> > >Which agrees with the information on the web site.  I have no idea what 
> > >WebUSB is supposed to be.
> > 
> > WebUSB is a JavaScript API, supported by Chromium -derived browsers (Firefox not there yet)
> > 
> > https://en.wikipedia.org/wiki/WebUSB
> 
> The Wikipedia article agrees with you that WebUSB is a JavaScript API.  
> As such, it is used for communication between web browsers and 
> JavaScript programs.

No, it's used by browsers (which  run JavaScript code in them) to
communicate with USB hardware. Or, if you like,
standalone JavaScript programs to communicate with USB hardware. 
Let me copy from the wiki here:

---------------------------------
A Universal Serial Bus, or a USB is an industry standard [...]
WebUSB is a set of API calls that enable access to these hardware
devices from web pages. WebUSB is developed by the World Wide Web
Consortium(W3C).[1] The webUSB API provides a safe, and developer
familiar means of communication to edges devices from web pages. The
webUSB API integrates into existing USB libraries and shortens the
development cycle for integrating new devices into the web environment
by not needing to wait for browser support for these devices.

Early versions of webUSB came out around as an alternative to Flash,
Chrome Serial, and other custom approaches to connecting browsers to
hardware. WebUSB aims to solve the four goals of any interface being;
fast to make, cross platform, look good, accessibility.

>  Not for communication between programs and USB 
> devices.  So I don't understand why a USB device needs to be concerned 
> about it.

I hope the above explains.

HTH
Dmitrii

> 
> Alan Stern
