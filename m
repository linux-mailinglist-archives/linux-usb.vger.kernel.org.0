Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D85233386
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2019 17:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727588AbfFCP3I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jun 2019 11:29:08 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:46536 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726889AbfFCP3H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Jun 2019 11:29:07 -0400
Received: (qmail 4115 invoked by uid 2102); 3 Jun 2019 11:29:06 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 3 Jun 2019 11:29:06 -0400
Date:   Mon, 3 Jun 2019 11:29:06 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Geoff Winkless <geoff@defgeoff.co.uk>
cc:     Greg KH <greg@kroah.com>, Linux-USB <linux-usb@vger.kernel.org>
Subject: Re: ehci support on old VIA vt82xxx disappeared around kernel 3.8.
In-Reply-To: <CAEzk6feqwwW9=9Wun0MjqLk09m7Qiuh4D=884Z70nSOgXX7VcA@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1906031125380.1547-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 3 Jun 2019, Geoff Winkless wrote:

> On Fri, 31 May 2019 at 20:11, Greg KH <greg@kroah.com> wrote:
> 
> > Can you run 'git bisect' to determine the exact commit that caused this
> > problem?  That would be most helpful.
> 
> Oh for goodness sake. Sorry, I was being an idiot. After half a day of
> building bisect scripts and another 3 hours of waiting for
> compile-reboot-test I finally get to
> 
> [adfa79d1c06a32650332930ca4c488ca570b3407] USB: EHCI: make ehci-pci a
> separate driver
> 
> I guess that should have been fairly obvious, really.
> 
> modprobe ehci-pci and the bus entry reappears.
> 
> Thanks (and also to Alan) for the help, apologies for wasting your time.
> 
> Geoff (going to hide his blushes in a corner somewhere)

Just goes to show we all have our blind spots.  I didn't realize what 
was going on either, and I should have.

On the other hand, you mentioned that it was getting some errors even
under earlier kernels such as 3.7.10 (before ehci-pci was split off
into a separate module, or it would have failed completely).  Any idea
about that?

Alan Stern

