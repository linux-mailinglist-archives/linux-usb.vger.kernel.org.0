Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E72F6547D4
	for <lists+linux-usb@lfdr.de>; Thu, 22 Dec 2022 22:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbiLVVZD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Dec 2022 16:25:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbiLVVY5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Dec 2022 16:24:57 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 5FB0F13F2F
        for <linux-usb@vger.kernel.org>; Thu, 22 Dec 2022 13:24:56 -0800 (PST)
Received: (qmail 131630 invoked by uid 1000); 22 Dec 2022 16:24:55 -0500
Date:   Thu, 22 Dec 2022 16:24:55 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Dima Pasechnik <dimpase@cs.ox.ac.uk>
Cc:     dima.pasechnik@cs.ox.ac.uk, Greg KH <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: usb 1-3: Product: BBC micro:bit CMSIS-DAP not recognised
Message-ID: <Y6TLJ94ubE4tOTev@rowland.harvard.edu>
References: <Y6Bfx+Ksm/Qz3N8y@hilbert>
 <Y6B8jd7dHsa85Wny@kroah.com>
 <Y6CRbgwHzjr2KNxK@hilbert>
 <Y6CpKxZ4KsiYttbL@hilbert>
 <Y6Csfzqvy6GExhVB@kroah.com>
 <Y6DjwFAp4M8I+T4P@hilbert>
 <Y6Fc2Fz8w4KoX952@kroah.com>
 <Y6HLqYpxwT+v3BgX@hilbert>
 <Y6ITkWEb25Si4zts@rowland.harvard.edu>
 <35B854FE-1F32-47FD-8ED1-CDE033327531@cs.ox.ac.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35B854FE-1F32-47FD-8ED1-CDE033327531@cs.ox.ac.uk>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A bit off to the side from the main point of this thread, but...

On Thu, Dec 22, 2022 at 10:32:09AM +0000, Dima Pasechnik wrote:
> 
> 
> On 20 December 2022 19:57:05 WET, Alan Stern <stern@rowland.harvard.edu> wrote:
> >> USB Interfaces: MSD, CDC, HID, WebUSB
> >
> >Which agrees with the information on the web site.  I have no idea what 
> >WebUSB is supposed to be.
> 
> WebUSB is a JavaScript API, supported by Chromium -derived browsers (Firefox not there yet)
> 
> https://en.wikipedia.org/wiki/WebUSB

The Wikipedia article agrees with you that WebUSB is a JavaScript API.  
As such, it is used for communication between web browsers and 
JavaScript programs.  Not for communication between programs and USB 
devices.  So I don't understand why a USB device needs to be concerned 
about it.

Alan Stern
