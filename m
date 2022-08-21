Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDAB59B5D9
	for <lists+linux-usb@lfdr.de>; Sun, 21 Aug 2022 20:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231604AbiHUSNV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Aug 2022 14:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbiHUSL3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Aug 2022 14:11:29 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 7A151222B7
        for <linux-usb@vger.kernel.org>; Sun, 21 Aug 2022 11:11:28 -0700 (PDT)
Received: (qmail 286778 invoked by uid 1000); 21 Aug 2022 14:11:27 -0400
Date:   Sun, 21 Aug 2022 14:11:27 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     James Dutton <james.dutton@gmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: USB disk disconnect problems
Message-ID: <YwJ1T0ATgngaAEzg@rowland.harvard.edu>
References: <CAAMvbhFJ+jdFPh5dMV+_jjYUYYgWhCpv5E43Bh=Eoo6su80cUA@mail.gmail.com>
 <YwJFZNUob3BtEM2h@rowland.harvard.edu>
 <CAAMvbhFt+_x7a++n3MPPpTza4vfnSj0809pXtzkps9TEVLpDUA@mail.gmail.com>
 <CAAMvbhFaFF-wJmVLsWY5yTU+Q_NWT9NVTpwwgOe9-+RaCcBE1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAMvbhFaFF-wJmVLsWY5yTU+Q_NWT9NVTpwwgOe9-+RaCcBE1A@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Aug 21, 2022 at 05:40:23PM +0100, James Dutton wrote:
> On Sun, 21 Aug 2022 at 17:36, James Dutton <james.dutton@gmail.com> wrote:
> >
> > On Sun, 21 Aug 2022 at 15:47, Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > > The reason being, I have a system that boots from a USB disk.
> > > > Due to interference, the USB device disconnects for a second or two
> > > > and then comes back, but Linux does not see it and I have to reboot
> > > > Linux to recover. So, in this situation I wish Linux to be able to
> > > > recover immediately, without needing a reboot.
> > >
> > > There is no way to do this.  For example, consider all those failed
> > > writes that you get error messages about.  Once they have failed, the
> > > system does not try to remember them in case there's a possibility of
> > > trying them again later.  They're just lost.
> > I guess the solution would have to include a "retry in 1 second's
> > time" type failure mode, instead of just lost.

Maybe, in theory.  In your case, I think a better solution would be to 
eliminate the interference that causes the transient disconnects to 
occur in the first place.  USB isn't designed to operate reliably in an 
environment filled with that much noise.

> > I.e. differentiate between the disk responding that the media failed,
> > and the link being down to the disk so the write message could not be
> > sent.
> > For example, NFS waits around for the network to return, maybe we
> > could add that functionality between a filesystem and usb storage.

In theory it could be done.  I suspect the overall benefit would not be 
very large; I have not heard lots of reports from other people facing 
the problem you have.  Consider that neither Windows nor Mac OS-X does 
this.

Also, doing this would lead to other problems.  For instace, I'm sure 
some people want to know that a device has stopped working as soon as 
the problem begins; they would get upset if the system kept trying to 
reconnect for tens of seconds before finally deciding the device was 
gone for good.  (Consider the way people have complained a lot over the 
years about NFS and its extremely long uninterruptible waits.)

> As a side note, I have seen USB links failing. Normally just to
> something like a keyboard or mouse, so it just comes back without the
> user knowing anything was wrong.

That's different.  When the link to a USB mouse fails and then starts 
working again, the system doesn't think the mouse has recovered; it 
regards what happened as a new mouse being plugged in.  (Same with 
keyboards.)  The user doesn't notice anything because the system treats 
all mice the same.  In fact, you can even plug in two mice at the same 
time (that is, without bothering to wait for the first one to fail) and 
the system will accept input from both of them interchangeably.

> The problem is USB links to disks don't recover currently.

Well, you have to admit that treating disks like mice -- considering all 
of them to be the same -- would not be a good strategy.  :-)

(On the other hand, sometimes two disks really do get treated as though 
they are the same.  That's what happens in a RAID-1 (mirroring) setup.  
If you have mirrored USB disks, you can unplug one of them and the 
system will continue working.  And when you plug it back it later, the 
system will repair it as necessary and then go on using it normally 
without your noticing.  But obviously this isn't what you have in mind.)

Alan Stern
