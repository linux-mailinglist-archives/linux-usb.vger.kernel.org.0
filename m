Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9C2A6516C1
	for <lists+linux-usb@lfdr.de>; Tue, 20 Dec 2022 00:36:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbiLSXgy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 18:36:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbiLSXgv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 18:36:51 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 94FDCEE37
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 15:36:47 -0800 (PST)
Received: (qmail 39912 invoked by uid 1000); 19 Dec 2022 18:36:47 -0500
Date:   Mon, 19 Dec 2022 18:36:47 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     dima.pasechnik@cs.ox.ac.uk
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: usb 1-3: Product: BBC micro:bit CMSIS-DAP not recognised
Message-ID: <Y6D1j+AVp8YTJjCd@rowland.harvard.edu>
References: <Y6Bfx+Ksm/Qz3N8y@hilbert>
 <Y6B8jd7dHsa85Wny@kroah.com>
 <Y6CRbgwHzjr2KNxK@hilbert>
 <Y6CpKxZ4KsiYttbL@hilbert>
 <Y6Csfzqvy6GExhVB@kroah.com>
 <Y6DjwFAp4M8I+T4P@hilbert>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6DjwFAp4M8I+T4P@hilbert>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 19, 2022 at 10:20:48PM +0000, dima.pasechnik@cs.ox.ac.uk wrote:
> On Mon, Dec 19, 2022 at 07:25:03PM +0100, Greg KH wrote:
> [...]
> > 
> > That is only if you want to manually bind the generic driver to this
> > device.  The kernel takes this and says "are you sure you want to do
> > this, if so, email this address and talk to these developers" :)
> 
> One does need a dedicated /dev/ttyUSB. It is similar, but not
> identical, to /dev/ttyACM. Cf. e.g.
> https://rfc1149.net/blog/2013/03/05/what-is-the-difference-between-devttyusbx-and-devttyacmx/
> 
> And the board makes an effort to establish
> a dedicated /dev/ttyUSB. Indeed, after I plugged the board in 21:35
> and did "ls -l /dev/tty*" I saw
> 
> crw--w---- 1 root tty       4,  0 Dec 19 21:28 /dev/tty0
> crw------- 1 dima tty       4,  1 Dec 19 21:35 /dev/tty1
> crw--w---- 1 root tty       4, 10 Dec 19 21:28 /dev/tty10
> crw--w---- 1 root tty       4, 11 Dec 19 21:28 /dev/tty11
> ...
> 
> - it's the Linux host that doesn't recognise this fact.
> (it's not even seen in dmesg that something happened on /dev/tty1 -
> probably a premature termination of something in the kernel)
> 
> Needless to say, there is also /dev/ttyACM0 popping up - so this part
> of the communication is OK.
> 
> I think it's prudent that the kernel understands that it's a
> a proper ttyUSB device, apparing as /dev/ttyUSB, and advertises it as
> such. Without it, it's hard to detect it, and indeed, the only way I see
> this,  without an active usbserial driver, is by the time shown next to 
> /dev/tty*

It might help if you post the output of "lsusb -v" for this device.

Alan Stern
