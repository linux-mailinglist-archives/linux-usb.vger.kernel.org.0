Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 416B34F02FF
	for <lists+linux-usb@lfdr.de>; Sat,  2 Apr 2022 15:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237851AbiDBNw3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 Apr 2022 09:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbiDBNw3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Apr 2022 09:52:29 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 1AE10315
        for <linux-usb@vger.kernel.org>; Sat,  2 Apr 2022 06:50:37 -0700 (PDT)
Received: (qmail 60854 invoked by uid 1000); 2 Apr 2022 09:50:36 -0400
Date:   Sat, 2 Apr 2022 09:50:36 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Petr Janecek <janecek@ucw.cz>
Cc:     alsa-devel@alsa-project.org, linux-usb@vger.kernel.org
Subject: Re: Apogee ONEv2 keeps resetting
Message-ID: <YkhUrG6aa7MtSXiw@rowland.harvard.edu>
References: <3f4d1bce-7459-9ea4-be73-9b51f569e526@ucw.cz>
 <YjoPVAxeKtY6aV1s@rowland.harvard.edu>
 <63b772ff-ef03-5f0a-c42c-ad9ec9770f16@ucw.cz>
 <YjyMkqk4zZWPJ6T0@rowland.harvard.edu>
 <20220402041824.GA26837@jkm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220402041824.GA26837@jkm>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Apr 02, 2022 at 06:18:26AM +0200, Petr Janecek wrote:
>   I've compared traces in linux to macos and windows, and
> the only thing linux does that the others don't is something
> like
> 
> usb_get_string(dev, 0, 0xee, &buf, 1024)
> 
> like it's getting the microsoft os descriptor.

Exactly so.

>   And the apogee does not like it: it's the only get
> descriptor string request with empty string response.  When
> the request is made the second time, it's the last request
> before reset.

That doesn't necessarily mean anything, of course.

>   This oddball request happens even with snd-usb-audio
> disabled.  And I'm totally unable to find where it comes
> from, I have not enabled anything like USB_GADGET.
> How to get rid of it?

It might not come from a kernel driver at all; it might come from a user 
program via usbfs.  Try turning on usbfs snooping before you plug in the 
device:

	echo 1 >/sys/module/usbcore/parameters/usbfs_snoop

and see what shows up in the kernel log.

Alan Stern
