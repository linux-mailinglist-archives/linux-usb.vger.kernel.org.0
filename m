Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8228A232C87
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jul 2020 09:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbgG3H22 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jul 2020 03:28:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:34398 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726194AbgG3H22 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Jul 2020 03:28:28 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 6B15DAD46;
        Thu, 30 Jul 2020 07:28:39 +0000 (UTC)
Message-ID: <1596094105.2508.1.camel@suse.de>
Subject: Re: [PATCH v2] usb: core: Solve race condition in anchor cleanup
 functions
From:   Oliver Neukum <oneukum@suse.de>
To:     Alan Stern <stern@rowland.harvard.edu>, eli.billauer@gmail.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        hdegoede@redhat.com
Date:   Thu, 30 Jul 2020 09:28:25 +0200
In-Reply-To: <20200729133846.GA1530967@rowland.harvard.edu>
References: <20200729103139.49229-1-eli.billauer@gmail.com>
         <20200729133846.GA1530967@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 29.07.2020, 09:38 -0400 schrieb Alan Stern:
 
> > -     spin_lock_irq(&anchor->lock);
> > -     while (!list_empty(&anchor->urb_list)) {
> > -             victim = list_entry(anchor->urb_list.prev, struct urb,
> > -                                 anchor_list);
> > -             /* we must make sure the URB isn't freed before we kill it*/
> > -             usb_get_urb(victim);
> > -             spin_unlock_irq(&anchor->lock);
> > -             /* this will unanchor the URB */
> > -             usb_kill_urb(victim);
> > -             usb_put_urb(victim);
> > +     do {
> >                spin_lock_irq(&anchor->lock);
> 
> All you have to do is move this spin_lock_irq() above the start of the 
> outer loop...

usb_kill_urb() is unfortunately an operation that can sleep.

	Regards
		Oliver

