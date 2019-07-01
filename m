Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D14325BE02
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jul 2019 16:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729507AbfGAOUi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jul 2019 10:20:38 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:51328 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729453AbfGAOUh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Jul 2019 10:20:37 -0400
Received: (qmail 1634 invoked by uid 2102); 1 Jul 2019 10:20:36 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 1 Jul 2019 10:20:36 -0400
Date:   Mon, 1 Jul 2019 10:20:36 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     Tejun Heo <tj@kernel.org>,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [RFC] deadlock with flush_work() in UAS
In-Reply-To: <1561978947.10014.12.camel@suse.com>
Message-ID: <Pine.LNX.4.44L0.1907011017130.1536-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 1 Jul 2019, Oliver Neukum wrote:

> Am Mittwoch, den 26.06.2019, 10:38 -0400 schrieb Alan Stern:
> > On Wed, 26 Jun 2019, Oliver Neukum wrote:
> > 
> > > Am Montag, den 24.06.2019, 10:22 -0400 schrieb Alan Stern:
> > > > But that pattern makes no sense; a driver would never use it.  The 
> > > > driver would just do the reset itself.
> > > 
> > > Correct. But UAS and storage themselves still need to use
> > > WQ_MEM_RECLAIM for their workqueues, don't they?
> > 
> > Perhaps so for uas.  usb-storage uses a work queue only for scanning 
> > targets, which doesn't interfere with the block I/O pathway.
> 
> Are you sure? What about hub_tt_work?

Technically speaking, hub_tt_work is used by the hub driver, not by 
usb-storage.  :-)

> As far as I can tell, hub_quiesce
> will flush it, hence it is used in error handling.

Yes, it needs to use a work queue with WQ_MEM_RECLAIM set.  
Unfortunately, I don't think we can use hub_wq for this purpose (we
could end up with a work item waiting for another work item later on in
the same queue, not good).

Alan Stern

