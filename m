Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B70FD437D
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 16:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727500AbfJKOxt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 10:53:49 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:41922 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726827AbfJKOxs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 10:53:48 -0400
Received: (qmail 3769 invoked by uid 2102); 11 Oct 2019 10:53:47 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 11 Oct 2019 10:53:47 -0400
Date:   Fri, 11 Oct 2019 10:53:47 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     Jaskaran Singh <jaskaransingh7654321@gmail.com>,
        syzbot <syzbot+e7d46eb426883fb97efd@syzkaller.appspotmail.com>,
        Alexander Potapenko <glider@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        <usb-storage@lists.one-eyed-alien.net>
Subject: Re: KMSAN: uninit-value in alauda_check_media
In-Reply-To: <CAAeHK+zR=S1cyaYfehyUDrpMGMXvxgLEeS8V2ze2HkwYUp6bjg@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1910111039380.1529-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 11 Oct 2019, Andrey Konovalov wrote:

> On Fri, Oct 11, 2019 at 4:08 PM Alan Stern <stern@rowland.harvard.edu> wrote:

> > Now yes, it's true that defining status as an array on the stack is
> > also a bug, since USB transfer buffers are not allowed to be stack
> > variables.
> 
> Hi Alan,
> 
> I'm curious, what is the reason for disallowing that? Should we try to
> somehow detect such cases automatically?

Transfer buffers are read and written by DMA.  On systems that don't
have cache-coherent DMA controllers, it is essential that the CPU does
not access any cache line involved in a DMA transfer while the transfer
is in progress.  Otherwise the data in the cache would be different
from the data in the buffer, leading to corruption.

(In theory it would be okay for the CPU to read (not write!) a cache
line assigned to a buffer for a DMA write (not read!) transfer.  But
even doing that isn't really a good idea.)

(Also, this isn't an issue for x86 architectures, because x86 has 
cache-coherent DMA.  But it is an issue on other architectures.)

In practice, this means transfer buffers have to be allocated by
something like kmalloc, so that they occupies their own separate set of
cache lines.  Buffers on the stack obviously don't satisfy this
requirement.

At some point there was a discussion about automatically detecting when
on-stack (or otherwise invalid) buffers are used for DMA transfers.  I
don't recall what the outcome was.

Alan Stern

