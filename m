Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1979A1CF4
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2019 16:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727635AbfH2Ohv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Aug 2019 10:37:51 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:44800 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726739AbfH2Ohv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Aug 2019 10:37:51 -0400
Received: (qmail 1783 invoked by uid 2102); 29 Aug 2019 10:37:49 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 29 Aug 2019 10:37:49 -0400
Date:   Thu, 29 Aug 2019 10:37:49 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     sandeep krishnaswamy <sandeep.kris.2014@gmail.com>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: usb-storage: Set virt_boundary_mask to avoid SG overflows
In-Reply-To: <CAHS7XqPfo7kevyCWyAdf+3yg88z-+YWMhHQAPmkbLEaXg7W_PQ@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1908291030400.1306-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Questions like this should always be CC'ed to the appropriate mailing 
list.  (And note that the mailing list does not accept messages in HTML 
format.)

On Thu, 29 Aug 2019, sandeep krishnaswamy wrote:

> Hi Alan,
> 
> 
> 
> We are using the Android 8.x (i.e Android ‘O’) with Android kernel 4.9.182
> (derived from open source Linux kernel 4.9.182)
> 
> 
> 
> Since Android does not support the NTFS by default, we have enabled NTFS
> support in Kernel & added changes in user space to mount NTFS USB drives
> (as part of Android Vold).
> 
> 
> 
> With the integration of K4.9.182, we have seen regression in read speed
> from NTFS mounted USB drive. FAT32 mounted USB drives read speeds are fine
> without any regression.
> 
> 
> 
> By reverting the commit -
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/usb/storage/scsiglue.c?h=v4.9.190&id=c685caf6e5d896472c67b348d23936c6dc479749
> , I could see read speed of NTFS mounted USB drives are fine.
> 
> 
> 
> Could you please help me to understand the commit and help me, how this
> commit could impact only on NTFS mounted USB drive but not with FAT32
> mounted USB drive ?

I have no idea how that commit could have affected read speeds for NTFS 
volumes.  Possibly it might cause the system to use unnecessary bounce 
buffers, but that seems unlikely to make such a large difference.

Furthermore, I now believe that the commit isn't necessary at all.  
We'll probably get rid of the blk_queue_virt_boundary() call in the
not-too-distant future.  If you want to understand better how it works,
you should ask people involved in maintaining the block layer.

Alan Stern

