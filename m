Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBA2D23A11F
	for <lists+linux-usb@lfdr.de>; Mon,  3 Aug 2020 10:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgHCIia (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Aug 2020 04:38:30 -0400
Received: from mx2.suse.de ([195.135.220.15]:52582 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725806AbgHCIi3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 Aug 2020 04:38:29 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 55FCBAFC0;
        Mon,  3 Aug 2020 08:38:43 +0000 (UTC)
Message-ID: <1596443906.19923.2.camel@suse.com>
Subject: Re: [PATCH v5] usb: core: Solve race condition in anchor cleanup
 functions
From:   Oliver Neukum <oneukum@suse.com>
To:     eli.billauer@gmail.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     hdegoede@redhat.com, stern@rowland.harvard.edu
Date:   Mon, 03 Aug 2020 10:38:26 +0200
In-Reply-To: <20200731054650.30644-1-eli.billauer@gmail.com>
References: <20200731054650.30644-1-eli.billauer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Freitag, den 31.07.2020, 08:46 +0300 schrieb eli.billauer@gmail.com:
> From: Eli Billauer <eli.billauer@gmail.com>
> 
> usb_kill_anchored_urbs() is commonly used to cancel all URBs on an
> anchor just before releasing resources which the URBs rely on. By doing
> so, users of this function rely on that no completer callbacks will take
> place from any URB on the anchor after it returns.
> 
> However if this function is called in parallel with __usb_hcd_giveback_urb
> processing a URB on the anchor, the latter may call the completer
> callback after usb_kill_anchored_urbs() returns. This can lead to a
> kernel panic due to use after release of memory in interrupt context.
> 
> The race condition is that __usb_hcd_giveback_urb() first unanchors the URB
> and then makes the completer callback. Such URB is hence invisible to
> usb_kill_anchored_urbs(), allowing it to return before the completer has
> been called, since the anchor's urb_list is empty.
> 
> Even worse, if the racing completer callback resubmits the URB, it may
> remain in the system long after usb_kill_anchored_urbs() returns.
> 
> Hence list_empty(&anchor->urb_list), which is used in the existing
> while-loop, doesn't reliably ensure that all URBs of the anchor are gone.
> 
> A similar problem exists with usb_poison_anchored_urbs() and
> usb_scuttle_anchored_urbs().
> 
> This patch adds an external do-while loop, which ensures that all URBs
> are indeed handled before these three functions return. This change has
> no effect at all unless the race condition occurs, in which case the
> loop will busy-wait until the racing completer callback has finished.
> This is a rare condition, so the CPU waste of this spinning is
> negligible.
> 
> The additional do-while loop relies on usb_anchor_check_wakeup(), which
> returns true iff the anchor list is empty, and there is no
> __usb_hcd_giveback_urb() in the system that is in the middle of the
> unanchor-before-complete phase. The @suspend_wakeups member of
> struct usb_anchor is used for this purpose, which was introduced to solve
> another problem which the same race condition causes, in commit
> 6ec4147e7bdb ("usb-anchor: Delay usb_wait_anchor_empty_timeout wake up
> till completion is done").
> 
> The surely_empty variable is necessary, because usb_anchor_check_wakeup()
> must be called with the lock held to prevent races. However the spinlock
> must be released and reacquired if the outer loop spins with an empty
> URB list while waiting for the unanchor-before-complete passage to finish:
> The completer callback may very well attempt to take the very same lock.
> 
> To summarize, using usb_anchor_check_wakeup() means that the patched
> functions can return only when the anchor's list is empty, and there is
> no invisible URB being processed. Since the inner while loop finishes on
> the empty list condition, the new do-while loop will terminate as well,
> except for when the said race condition occurs.
> 
> Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
Acked-by: Oliver Neukum <oneukum@suse.com>
