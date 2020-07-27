Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77BF322E9D1
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 12:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgG0KOK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 06:14:10 -0400
Received: from mx2.suse.de ([195.135.220.15]:52260 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726451AbgG0KOK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Jul 2020 06:14:10 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 6B20AB1A3;
        Mon, 27 Jul 2020 10:14:19 +0000 (UTC)
Message-ID: <1595844840.13408.17.camel@suse.de>
Subject: Re: [PATCH] usb: core: Solve race condition in
 usb_kill_anchored_urbs
From:   Oliver Neukum <oneukum@suse.de>
To:     eli.billauer@gmail.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     hdegoede@redhat.com, stern@rowland.harvard.edu
Date:   Mon, 27 Jul 2020 12:14:00 +0200
In-Reply-To: <20200727072225.25195-1-eli.billauer@gmail.com>
References: <20200727072225.25195-1-eli.billauer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 27.07.2020, 10:22 +0300 schrieb eli.billauer@gmail.com:
> From: Eli Billauer <eli.billauer@gmail.com>
> 
> usb_kill_anchored_urbs() is commonly used to cancel all URBs on an
> anchor just before releasing resources which the URBs rely on. By doing
> so, users of this function rely on that no completer callbacks will take
> place from any URB on the anchor after it returns.

Right, this is a use case that must work.

> However if this function is called in parallel with __usb_hcd_giveback_urb
> processing a URB on the anchor, the latter may call the completer
> callback after usb_kill_anchored_urbs() returns. This can lead to a
> kernel panic due to use after release of memory in interrupt context.
> 
> The race condition is that __usb_hcd_giveback_urb() first unanchors the URB
> and then makes the completer callback. Such URB is hence invisible to
> usb_kill_anchored_urbs(), allowing it to return before the completer has
> been called, since the anchor's urb_list is empty.

Well, the URB must be unachored because the callback may anchor the URB
again. What could we do? The refcount on the URB does not help, because
it guards only the URB itself.
It looks to me like I misdesigned the API a bit. What people really
need is an anchor that is not weighed by calling the callback.
Should I introduce such an API?

> This patch adds a call to usb_wait_anchor_empty_timeout() prior to
> returning. This function waits until urb_list is empty (it should
> already be), but more importantly, until @suspend_wakeups is zero.

That however is really a kludge we cannot have in usbcore.
I am afraid as is the patch should _not_ be applied.

	Regards
		Oliver

