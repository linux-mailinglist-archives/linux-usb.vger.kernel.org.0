Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C35D44A562
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 17:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729308AbfFRP3h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 11:29:37 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:40196 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729209AbfFRP3h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jun 2019 11:29:37 -0400
Received: (qmail 5727 invoked by uid 2102); 18 Jun 2019 11:29:36 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 18 Jun 2019 11:29:36 -0400
Date:   Tue, 18 Jun 2019 11:29:36 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: [RFC] deadlock with flush_work() in UAS
In-Reply-To: <1560869625.3184.11.camel@suse.com>
Message-ID: <Pine.LNX.4.44L0.1906181120550.1659-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 18 Jun 2019, Oliver Neukum wrote:

> Hi,
> 
> looking at those deadlocks it looks to me like UAS can
> deadlock on itself. What do you think?
> 
> 	Regards
> 		Oliver
> 
> From 2d497f662e6c03fe9e0a75e05b64d52514e890b3 Mon Sep 17 00:00:00 2001
> From: Oliver Neukum <oneukum@suse.com>
> Date: Tue, 18 Jun 2019 15:03:56 +0200
> Subject: [PATCH] UAS: fix deadlock in error handling and PM flushing work
> 
> A SCSI error handler and block runtime PM must not allocate
> memory with GFP_KERNEL. Furthermore they must not wait for
> tasks allocating memory with GFP_KERNEL.
> That means that they cannot share a workqueue with arbitrary tasks.
> 
> Fix this for UAS using a private workqueue.

I'm not so sure that one long-running task in a workqueue will block 
other tasks.  Workqueues have variable numbers of threads, added and 
removed on demand.  (On the other hand, when new threads need to be 
added the workqueue manager probably uses GFP_KERNEL.)

Even if you disagree, perhaps we should have a global workqueue with a
permanently set noio flag.  It could be shared among multiple drivers
such as uas and the hub driver for purposes like this.  (In fact, the 
hub driver already has its own dedicated workqueue.)

Alan Stern


