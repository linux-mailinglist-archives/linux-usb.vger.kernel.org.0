Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85280F5E3B
	for <lists+linux-usb@lfdr.de>; Sat,  9 Nov 2019 10:23:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbfKIJXu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Nov 2019 04:23:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:53760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726143AbfKIJXu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 9 Nov 2019 04:23:50 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0F99A21848;
        Sat,  9 Nov 2019 09:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573291429;
        bh=1uZNhCJco3iSw4+Yp3Lu1MZSy6NQ42JT8dH/17Rw4OQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dkptnO0sGN6m8yGX4Q4wOMqK8hYm51vaLG8T2DruDrdaz7WUVL46ZdGxdALBlqaX2
         J7XWqYJc/PF1vcZkHpwZpeSnBUk5WV1BFemiTuWMiN8LWYdB+vWscuEQNOvUCWGW5E
         HipPaejh86XtFh0+xHJPar4GBzG5G4Ffza+75Eos=
Date:   Sat, 9 Nov 2019 10:23:46 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Feeding bugzilla.kernel.org USB component to the linux-usb list
Message-ID: <20191109092346.GF1293712@kroah.com>
References: <20191106210455.hpe63idbcz3yw54z@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106210455.hpe63idbcz3yw54z@chatter.i7.local>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 06, 2019 at 04:04:55PM -0500, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> I noticed that Greg has an auto-reply for any new bugs opened on
> bugzilla.kernel.org for the USB component:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=205449
> 
> Would it make more sense to feed those into the mailing list instead of
> asking bug submitters to send a new email? Anyone responding to the bugmail
> sent to the list will be properly recorded in the bug comments (and if they
> don't have an account on bugzilla.kernel.org, a stub account will be
> automatically created).
> 
> It seems like that would be a friendlier setup that doesn't require bug
> submitters to do any more work, but I leave it up to you. This scheme is
> already used by other projects, e.g.:
> https://lore.kernel.org/linux-xfs/bug-202349-201763@https.bugzilla.kernel.org%2F/
> 
> You can see Dave Chinner replying to bugmail directly and it being recorded
> in the bug entry:
> https://lore.kernel.org/linux-xfs/20190124233132.GO4205@dastard/
> https://bugzilla.kernel.org/show_bug.cgi?id=202349#c7
> 
> Please let me know if that's something you would like.

Yeah, I guess it's about time to just set up the feed to do that, thanks
for bringing it up again, I had forgotten about it.

thanks,

greg k-h
