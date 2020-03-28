Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1E11966F2
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2020 16:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbgC1Pbd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Mar 2020 11:31:33 -0400
Received: from netrider.rowland.org ([192.131.102.5]:38053 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725807AbgC1Pbd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 Mar 2020 11:31:33 -0400
Received: (qmail 1590 invoked by uid 500); 28 Mar 2020 11:31:32 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 28 Mar 2020 11:31:32 -0400
Date:   Sat, 28 Mar 2020 11:31:32 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Kyungtae Kim <kt0755@gmail.com>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: Fwd: BUG: KASAN: use-after-free in usb_hcd_unlink_urb+0x5f/0x170
 drivers/usb/core/hcd.c
In-Reply-To: <CAEAjamuCnVEyRKDsTa-MiU_4eTnaD0d38dmSBPbbkmjd+MZxpQ@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2003281131060.1088-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 28 Mar 2020, Kyungtae Kim wrote:

> On Thu, Mar 26, 2020 at 10:49:40AM -0400, Alan Stern wrote:
> > On Tue, 24 Mar 2020, Kyungtae Kim wrote:
> >
> > > Thanks for the patch. Unfortunately, we don't have a repro program to
> > > test right now.
> >
> > Okay.  Can you at least try running your tests with the patch installed
> > to check that the patch doesn't actually break anything?
> >
> > Alan Stern
> >
> 
> I tested with that patch for more than 24 hours. It worked well
> without triggering the same bug.

Thanks for testing.  I'll write up the patch and submit it.

Alan Stern

