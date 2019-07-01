Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA575C349
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jul 2019 20:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbfGAS5B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jul 2019 14:57:01 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:51626 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726076AbfGAS5B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Jul 2019 14:57:01 -0400
Received: (qmail 4264 invoked by uid 2102); 1 Jul 2019 14:57:00 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 1 Jul 2019 14:57:00 -0400
Date:   Mon, 1 Jul 2019 14:57:00 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrea Vai <andrea.vai@unipv.it>
cc:     Greg KH <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>
Subject: Re: Slow I/O on USB media
In-Reply-To: <3e7662d1391346dd11a903e66e7a8936ca83dba9.camel@unipv.it>
Message-ID: <Pine.LNX.4.44L0.1907011453340.1536-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 1 Jul 2019, Andrea Vai wrote:

> > At any rate, you are some commits you could try (beginning with
> > "git 
> > checkout <commit>" and then running your scripts):
> > 
> >         c76cd634eb5b
> >         b1669432b355
> >         507413a5f88a
> >         a52fb43a5faa
> >         38fabca18fc4
> >         fc2fd5f0f1aa
> > 
> > These are all between 4.20 and 5.0-rc1.
> 
> Hi,
>   these were all "good".
> 
> Then I ran another bisect (the sixth (!), more carefully, starting
> from
> 
> git bisect good c76cd634eb5b
> git bisect bad 241e39004581
> 
> ), and it seems to give some consistent result.
> 
> I found that:
> 
> f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6 is the first bad commit
> commit f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6
> Author: Jens Axboe <axboe@kernel.dk>
> Date:   Thu Nov 1 16:36:27 2018 -0600
> 
>     scsi: kill off the legacy IO path
>     
>     This removes the legacy (non-mq) IO path for SCSI.
>     
>     Cc: linux-scsi@vger.kernel.org
>     Acked-by: Himanshu Madhani <himanshu.madhani@cavium.com>
>     Reviewed-by: Hannes Reinecke <hare@suse.com>
>     Tested-by: Ming Lei <ming.lei@redhat.com>
>     Reviewed-by: Omar Sandoval <osandov@fb.com>
>     Acked-by: Martin K. Petersen <martin.petersen@oracle.com>
>     Signed-off-by: Jens Axboe <axboe@kernel.dk>
> 
> :040000 040000 312373927bae1c6fd1da40ded2c12dfa5e4de71c 4eccbd2c84bf83cb2eb72a81514d59ebf12866b7 M	Documentation
> :040000 040000 98de24b4fe20b82095f53f56c9193c5537d70ed0 8e2092780100205ae1c3723a598a89794a50677f M	drivers
> :040000 040000 fbc10c84d3eb6b7933598018319f96767ee3a0f3 2523940c2819e8adb32758f5093e477da481ca65 M	include
> 
> I reverted it and the test succeeded.
> Then I made a double check: "git clone" again; git checkout
> 3a7ea2c483a53fc89e336f69c6ee1d7defe00811 (the last good), and the test
> succeded. Then git checkout f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6
> (the first bad) and the test failed; then reverted it and the test
> succeded again.
> 
> Does it make sense?

Yes, that does make sense.

What you should do next is report the problem to all the people
involved in that commit: Jens Axboe, Himanshu Madhani, and so on.  Be 
sure to CC: the USB mailing list and also linux-scsi@vger.kernel.org.

Given them a full description of the problem and explain how you
determined that this commit was the cause.  They should be able to help
figure out what's going wrong and fix it.

Alan Stern

