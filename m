Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF0F44A5AA
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 17:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbfFRPnT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 11:43:19 -0400
Received: from mx2.suse.de ([195.135.220.15]:50764 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729272AbfFRPnT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Jun 2019 11:43:19 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 6F581AC84;
        Tue, 18 Jun 2019 15:43:18 +0000 (UTC)
Message-ID: <1560871774.3184.16.camel@suse.com>
Subject: Re: [RFC] deadlock with flush_work() in UAS
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Date:   Tue, 18 Jun 2019 17:29:34 +0200
In-Reply-To: <Pine.LNX.4.44L0.1906181120550.1659-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1906181120550.1659-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 18.06.2019, 11:29 -0400 schrieb Alan Stern:
> On Tue, 18 Jun 2019, Oliver Neukum wrote:
> 
> > Hi,
> > 
> > looking at those deadlocks it looks to me like UAS can
> > deadlock on itself. What do you think?
> > 
> >       Regards
> >               Oliver
> > 
> > From 2d497f662e6c03fe9e0a75e05b64d52514e890b3 Mon Sep 17 00:00:00 2001
> > From: Oliver Neukum <oneukum@suse.com>
> > Date: Tue, 18 Jun 2019 15:03:56 +0200
> > Subject: [PATCH] UAS: fix deadlock in error handling and PM flushing work
> > 
> > A SCSI error handler and block runtime PM must not allocate
> > memory with GFP_KERNEL. Furthermore they must not wait for
> > tasks allocating memory with GFP_KERNEL.
> > That means that they cannot share a workqueue with arbitrary tasks.
> > 
> > Fix this for UAS using a private workqueue.
> 
> I'm not so sure that one long-running task in a workqueue will block 
> other tasks.  Workqueues have variable numbers of threads, added and 
> removed on demand.  (On the other hand, when new threads need to be 
> added the workqueue manager probably uses GFP_KERNEL.)

Do we have a guarantee it will reschedule already scheduled works?
The deadlock would be something like

uas_pre_reset() -> uas_wait_for_pending_cmnds() ->
flush_work(&devinfo->work) -> kmalloc() -> DEADLOCK

You can also make this chain with uas_suspend()

> Even if you disagree, perhaps we should have a global workqueue with a
> permanently set noio flag.  It could be shared among multiple drivers
> such as uas and the hub driver for purposes like this.  (In fact, the 
> hub driver already has its own dedicated workqueue.)

That is a good idea. But does UAS need WQ_MEM_RECLAIM?

	Regards
		Oliver

