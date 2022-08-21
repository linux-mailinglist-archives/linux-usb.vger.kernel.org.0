Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD9759B494
	for <lists+linux-usb@lfdr.de>; Sun, 21 Aug 2022 16:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbiHUOrD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Aug 2022 10:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiHUOrC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Aug 2022 10:47:02 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 1FC5820F7E
        for <linux-usb@vger.kernel.org>; Sun, 21 Aug 2022 07:47:00 -0700 (PDT)
Received: (qmail 283458 invoked by uid 1000); 21 Aug 2022 10:47:00 -0400
Date:   Sun, 21 Aug 2022 10:47:00 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     James Dutton <james.dutton@gmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: USB disk disconnect problems
Message-ID: <YwJFZNUob3BtEM2h@rowland.harvard.edu>
References: <CAAMvbhFJ+jdFPh5dMV+_jjYUYYgWhCpv5E43Bh=Eoo6su80cUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAMvbhFJ+jdFPh5dMV+_jjYUYYgWhCpv5E43Bh=Eoo6su80cUA@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Aug 21, 2022 at 12:17:30PM +0100, James Dutton wrote:
> Hi,
> 
> Say I have mounted a usb disk.
> I then disconnect the usb device
> Linux complains about failed writes etc.
> I then plug the usb device back in
> Linux still complains about failed writes, and does not recover.
> 
> How do I get Linux to recognise the reinserted usb disk and carry on as normal?

As far as I know, there's only way way to do it: Go into system suspend 
before disconnecting the USB drive, and plug the drive back in before 
waking the system up.

> I know my suggested behaviour might be detrimental for some users, in
> case one modifies the usb disk in another computer and then comes
> back, but I would like an option that assumes it has not been plugged
> into anything else.

The resume procedure makes this assumption, if it finds that something 
has been disconnected and reconnected.

> The reason being, I have a system that boots from a USB disk.
> Due to interference, the USB device disconnects for a second or two
> and then comes back, but Linux does not see it and I have to reboot
> Linux to recover. So, in this situation I wish Linux to be able to
> recover immediately, without needing a reboot.

There is no way to do this.  For example, consider all those failed 
writes that you get error messages about.  Once they have failed, the 
system does not try to remember them in case there's a possibility of 
trying them again later.  They're just lost.

Similarly with failed reads.  When a program tries to read something 
from a disk and the read fails, the program generally does not wait for 
a while and then retry the read, to see if the disk will magically start 
working again.

> The physical USB device removal then reinserting reproduces the
> problem I am seeing, so I thought it would be a good example to get
> working, if we could.
> 
> Can anyone give me any pointers as to where to start with fixing this?

Sorry I can't be of any more help.

Alan Stern
