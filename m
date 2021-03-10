Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8982334A06
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 22:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231994AbhCJVrF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 16:47:05 -0500
Received: from netrider.rowland.org ([192.131.102.5]:55473 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231759AbhCJVqt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 16:46:49 -0500
Received: (qmail 236684 invoked by uid 1000); 10 Mar 2021 16:46:48 -0500
Date:   Wed, 10 Mar 2021 16:46:48 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Matthias Schwarzott <zzam@gentoo.org>
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        hirofumi@mail.parknet.co.jp
Subject: Re: [usb-storage] Re: Amazon Kindle disconnect after Synchronize
 Cache
Message-ID: <20210310214648.GA236329@rowland.harvard.edu>
References: <9f57532f-1fb7-0fdd-b91c-2dfecef5aff3@gentoo.org>
 <20210305191437.GC48113@rowland.harvard.edu>
 <2a1f6636-6b57-ccc5-76b3-7eae5e80e7d3@gentoo.org>
 <20210307155236.GB103559@rowland.harvard.edu>
 <9c3121a9-3d0c-60b3-ef17-993b7d2e9149@gentoo.org>
 <20210307165856.GA104554@rowland.harvard.edu>
 <268e646f-d4ea-3190-f1b9-8e69bfc1b019@gentoo.org>
 <20210309155046.GA176674@rowland.harvard.edu>
 <dfd2b281-3beb-9869-37b6-8bd48a6cf40f@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfd2b281-3beb-9869-37b6-8bd48a6cf40f@gentoo.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 10, 2021 at 09:56:04PM +0100, Matthias Schwarzott wrote:
> > What happens if you set the value to 1000 before running the test?
> > 
> I tested different values. At 1000 it still disconnects. At lower values it
> no longer does this.
> I tested 200 up to 900. Even 900 ms is good enough to keep it connected.
> 
> Btw. it is not a USB disconnect, but it just seems to plays medium ejected.
> 
> Out of interest I called "sg_start -v -l /dev/sde" after one of the failing
> experiments. That made the Kindle go back to connected state.
> 
> To me the above experiments show that enough TEST UNIT READY commands are
> needed in the 2 s after a SYNCHRONIZE CACHE.

So you have found the solution to your problem.  Congratulations!

Alan Stern
