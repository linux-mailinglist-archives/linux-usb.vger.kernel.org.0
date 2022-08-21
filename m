Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D79C59B616
	for <lists+linux-usb@lfdr.de>; Sun, 21 Aug 2022 21:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbiHUTDq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Aug 2022 15:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiHUTDo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Aug 2022 15:03:44 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id ED11A11C21
        for <linux-usb@vger.kernel.org>; Sun, 21 Aug 2022 12:03:43 -0700 (PDT)
Received: (qmail 287631 invoked by uid 1000); 21 Aug 2022 15:03:43 -0400
Date:   Sun, 21 Aug 2022 15:03:43 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Matthew Dharm <mdharm-usb@one-eyed-alien.net>
Cc:     James Dutton <james.dutton@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: USB disk disconnect problems
Message-ID: <YwKBj94XtgU70crx@rowland.harvard.edu>
References: <CAAMvbhFJ+jdFPh5dMV+_jjYUYYgWhCpv5E43Bh=Eoo6su80cUA@mail.gmail.com>
 <YwJFZNUob3BtEM2h@rowland.harvard.edu>
 <CAA6KcBC2wEc78fgrMLBfbyEinR3rVUY6z8HeUbE=wtv0c4BP2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA6KcBC2wEc78fgrMLBfbyEinR3rVUY6z8HeUbE=wtv0c4BP2Q@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Aug 21, 2022 at 11:42:00AM -0700, Matthew Dharm wrote:
> On Sun, Aug 21, 2022 at 7:47 AM Alan Stern <stern@rowland.harvard.edu>
> wrote:
> 
> > On Sun, Aug 21, 2022 at 12:17:30PM +0100, James Dutton wrote:
> > > I know my suggested behaviour might be detrimental for some users, in
> > > case one modifies the usb disk in another computer and then comes
> > > back, but I would like an option that assumes it has not been plugged
> > > into anything else.
> 
> 
> In the “old days” (that is, my original design for use-storage) it used to
> do exactly what you are looking for - based on VID, DID, and SerialNumber
> it would “remember” devices. The SCSI host would never be destroyed, and
> when a device re-appeared it would be re-connected to the existing host.

Ah yes...  I do remember those days, but not very often.  :-)

> That caused all sorts of problems. The SCSI and block layers just couldn’t
> handle it well. A clean umount / mount cycle worked fine, but if you
> unexpectedly disconnected the device all hell broke loose and there was no
> way to recover.
> 
> I did it this way because, way back when, there were issues dynamically
> destroying SCSI hosts. The people who worked on those other layers found it
> much, much easier to fix that problem than try to make it possible to
> recover from an unexpected disconnect.
> 
> Honestly, I’m not even sure where you would need to begin to make this
> work. It would require pretty radical changes is the block I/O layers to
> differentiate different failure modes, keep a lot more data around after
> certain types of failures, allow for specifying which devices this new
> policy (which is assuming reconnected devices really haven’t been altered)
> applies to, etc — it’s a big lift.

Provided you don't mind giving up after 30 seconds (the default SCSI 
timeout), you wouldn't need to change the block or other layers.  All 
you would have to do is avoid reporting a command failure if the reason 
for the failure is disconnection, wait for the device to reappear, and 
then retry the command.  (Yes, there would be a few extra complications 
but that's the basic idea.)  As far as the SCSI or block layers are 
concerned, it would look like the I/O succeeded but took an unusually 
long time to complete.

Alan Stern
