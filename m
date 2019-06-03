Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4C733625
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2019 19:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728189AbfFCRJX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jun 2019 13:09:23 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:46688 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726410AbfFCRJX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Jun 2019 13:09:23 -0400
Received: (qmail 5346 invoked by uid 2102); 3 Jun 2019 13:09:22 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 3 Jun 2019 13:09:22 -0400
Date:   Mon, 3 Jun 2019 13:09:22 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Geoff Winkless <geoff@defgeoff.co.uk>
cc:     Greg KH <greg@kroah.com>, Linux-USB <linux-usb@vger.kernel.org>
Subject: Re: ehci support on old VIA vt82xxx disappeared around kernel 3.8.
In-Reply-To: <CAEzk6fc_ZpM9izzRH+Q3uMPzV1voC3GjmJ3GHoGsXgtpYSXfMw@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1906031308060.1547-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 3 Jun 2019, Geoff Winkless wrote:

> On Mon, 3 Jun 2019 at 16:29, Alan Stern <stern@rowland.harvard.edu> wrote:
> > On Mon, 3 Jun 2019, Geoff Winkless wrote:
> >
> > > Thanks (and also to Alan) for the help, apologies for wasting your time.
> >
> > Just goes to show we all have our blind spots.  I didn't realize what
> > was going on either, and I should have.
> 
> You're too kind :)
> 
> > On the other hand, you mentioned that it was getting some errors even
> > under earlier kernels such as 3.7.10 (before ehci-pci was split off
> > into a separate module, or it would have failed completely).  Any idea
> > about that?
> 
> Well I was going to go after that next (test script would be a bit
> more complicated), but given that those errors don't seem to be
> showing up on 4.x I'll probably just drop it, unless you care.

No, occasional errors don't seem to be worth tracking down, given that 
they don't occur with later kernels.

Alan Stern

