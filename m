Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B34BCB7B68
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2019 16:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732332AbfISOBC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Sep 2019 10:01:02 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:46390 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1732283AbfISOBC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Sep 2019 10:01:02 -0400
Received: (qmail 1674 invoked by uid 2102); 19 Sep 2019 10:01:01 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 19 Sep 2019 10:01:01 -0400
Date:   Thu, 19 Sep 2019 10:01:01 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Damien Le Moal <Damien.LeMoal@wdc.com>
cc:     Andrea Vai <andrea.vai@unipv.it>,
        Johannes Thumshirn <jthumshirn@suse.de>,
        Jens Axboe <axboe@kernel.dk>,
        USB list <linux-usb@vger.kernel.org>,
        SCSI development list <linux-scsi@vger.kernel.org>,
        Himanshu Madhani <himanshu.madhani@cavium.com>,
        Hannes Reinecke <hare@suse.com>,
        Ming Lei <ming.lei@redhat.com>, Omar Sandoval <osandov@fb.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Hans Holmberg <Hans.Holmberg@wdc.com>
Subject: Re: Slow I/O on USB media after commit f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6
In-Reply-To: <BYAPR04MB58160E6FEBD92D04ECA7D303E7890@BYAPR04MB5816.namprd04.prod.outlook.com>
Message-ID: <Pine.LNX.4.44L0.1909190958140.1585-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 19 Sep 2019, Damien Le Moal wrote:

> > This is exactly the sort of difference one might expect to see from
> > the commit f664a3cc17b7 ("scsi: kill off the legacy IO path") you
> > identified as the cause of the problem.  With multiqueue I/O, it's not 
> > surprising to see multiple sequences of block numbers.
> > 
> > Add it's not at all surprising that a consumer-grade USB storage device 
> > might do a much worse job of handling non-sequential writes than 
> > sequential ones.
> > 
> > Which leads to a simple question for the SCSI or block-layer 
> > maintainers:  Is there a sysfs setting Andrea can tweak which will 
> > effectively restrict a particular disk device down to a single I/O
> > queue, forcing sequential access?
> 
> The scheduling inefficiency you are seeing may be coming from the fact that the
> block layer does a direct issue of requests, bypassing the elevator, under some
> conditions. One of these is sync requests on a multiqueue device. We hit this
> problem on Zoned disks which can easily return an error for write requests
> without the elevator throttling writes per zones (zone write locking). This
> problem was discovered by Hans (on CC).

Is there any way for Andrea to check whether this is the underlying
cause?

> I discussed this with Hannes yesterday and we think we have a fix, but we'll
> need to do a lot of testing as all block devices are potentially impacted by the
> change, including stacked drivers (DM). Performance regression is scary with any
> change in that area (see blk_mq_make_request() and use of
> blk_mq_try_issue_directly() vs blk_mq_sched_insert_request()).

No doubt Andrea will be happy to test your fix when it's ready.

Alan Stern

