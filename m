Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 350EF5F436
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jul 2019 10:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbfGDIDE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jul 2019 04:03:04 -0400
Received: from gate.crashing.org ([63.228.1.57]:60432 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726605AbfGDIDD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Jul 2019 04:03:03 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6482muW028913;
        Thu, 4 Jul 2019 03:02:49 -0500
Message-ID: <f6d0ca0d258fa69fdcd46c04b908ff4ff9205181.camel@kernel.crashing.org>
Subject: f_mass_storage configuration races (Was: Virtual hub, resets etc...)
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Michal Nazarewicz <mina86@mina86.com>
Date:   Thu, 04 Jul 2019 18:02:48 +1000
In-Reply-To: <617c4ba96b9664377c24444e8b82ffa75a8a5357.camel@kernel.crashing.org>
References: <617c4ba96b9664377c24444e8b82ffa75a8a5357.camel@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Sooo...

I think I found what's going on with some of the issues triggering
things like

	usb_composite_setup_continue: Unexpected call 

Or possibly

	gadget: common->fsg is NULL in fsg_setup at 489

But I mostly tracked down the former.

Fundamentally, it boils down to the storage going through multiple
attempts at FSG_STATE_CONFIG_CHANGE too quickly. In my case:

 - The hub port gets reset, this eventually calls fsg_disable

 - In the middle of handle_exception, we get a fsg_set_alt(), after
common->state is set back to FSG_STATE_NORMAL and before we get to
call do_set_interface (or inside it).

What happens is that not only new_fsg is indeterminate and possibly
racy (maybe not a huge deal per-se), but we end up in that
interesting situation where the handle_exception caused by fsg_disable
ends up applying "new_fsg" *and* calling usb_composite_setup_continue
because it sees new_fsg being set by fsg_set_alt.

But *then*, fsg_set_alt() also queues up a new exception. So we come
back a second time around. We call do_set_interface() again, which
resets everything for no reason, re-established the fsg and ... we call
usb_composite_setup_continue() again, this time completely at the wrong
time since there's nothing to continue.

I think the right fix is to replace that racy exception crap with a
little queue so we remove those races.

In the meantime however, I think the simpler patch that I'll send as
a reply to this works around it, provided the host doesn't do multiple
set_alt too quickly. The latter could be handled by setting new_fsg
with the lock used for the state, and reading it from that same lock.
But I haven't observed that problem in practice.

With this patch, I can now unplug & replug on my host solidly, this
wasn't the case before.

Cheers,
Ben.



