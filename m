Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E50584612
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 09:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727428AbfHGHht (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 03:37:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:60174 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727190AbfHGHht (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 7 Aug 2019 03:37:49 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id DE110AFCF;
        Wed,  7 Aug 2019 07:37:47 +0000 (UTC)
Message-ID: <1565163465.8136.36.camel@suse.com>
Subject: Re: [PATCH] usbfs: Add ioctls for runtime power management
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>, Greg KH <greg@kroah.com>,
        Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
Cc:     USB list <linux-usb@vger.kernel.org>
Date:   Wed, 07 Aug 2019 09:37:45 +0200
In-Reply-To: <Pine.LNX.4.44L0.1908061542140.1571-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1908061542140.1571-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 06.08.2019, 15:46 -0400 schrieb Alan Stern:
> +static int proc_wait_for_resume(struct usb_dev_state *ps)
> +{
> +       int ret;
> +
> +       usb_unlock_device(ps->dev);
> +       ret = wait_event_interruptible(ps->wait_for_resume,
> +                       READ_ONCE(ps->not_yet_resumed) == 0);
> +       usb_lock_device(ps->dev);
> +
> +       if (ret != 0)
> +               return ret;
> +       return proc_forbid_suspend(ps);

One nitpick, this seems to return raw -ERESTARTSYS in the interrupt
case. Should it?

	Regards
		Oliver

