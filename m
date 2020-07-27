Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC1222EE1E
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 15:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgG0N6P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 09:58:15 -0400
Received: from mx2.suse.de ([195.135.220.15]:39616 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726298AbgG0N6P (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Jul 2020 09:58:15 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 613D2AF57;
        Mon, 27 Jul 2020 13:58:24 +0000 (UTC)
Message-ID: <1595858285.13408.36.camel@suse.de>
Subject: Re: [PATCH] usb: core: Solve race condition in
 usb_kill_anchored_urbs
From:   Oliver Neukum <oneukum@suse.de>
To:     Eli Billauer <eli.billauer@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        hdegoede@redhat.com, stern@rowland.harvard.edu
Date:   Mon, 27 Jul 2020 15:58:05 +0200
In-Reply-To: <5F1EBA04.5050109@gmail.com>
References: <20200727072225.25195-1-eli.billauer@gmail.com>
         <1595844840.13408.17.camel@suse.de> <5F1EBA04.5050109@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 27.07.2020, 14:27 +0300 schrieb Eli Billauer:
> Hello, Oliver.
> 
> On 27/07/20 13:14, Oliver Neukum wrote:
> > That however is really a kludge we cannot have in usbcore.
> > I am afraid as is the patch should_not_  be applied.
> >    
> 
> Could you please explain further why the suggested patch is unsuitable?

Hi,

certainly.

1. timeouts are generally a bad idea, especially if the timeout does
not come out of a spec.

2. That involves quoting you:

Alternatively, if the driver submits URBs to the same anchor while 
usb_kill_anchored_urbs() is called, this timeout might be reached. This 
could happen, for example, if the completer function that ran in the 
racy situation resubmits the URB. If that situation isn't cleared within 
1000ms, it means that there's a URB in the system that the driver isn't 
aware of. Maybe that situation is worth more than a WARN.

That is an entirely valid use case. And a bulk URB may take a potentially
unbounded time to complete.

My failure in this case is simply overengineering.
If this line:

        usb_unanchor_urb(urb);

In __usb_hcd_giveback_urb(struct urb *urb) weren't there, the issue
would not exist. I misdesigned the API in automatically unanchoring
a completing URB.
Simply removing it now is no longer possible, so we need to come up with
a more complex solution.

	Regards
		Oliver

