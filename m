Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8024D65F5
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2019 17:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733276AbfJNPNT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Oct 2019 11:13:19 -0400
Received: from netrider.rowland.org ([192.131.102.5]:34521 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1733173AbfJNPNT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Oct 2019 11:13:19 -0400
Received: (qmail 31375 invoked by uid 500); 14 Oct 2019 11:13:18 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 14 Oct 2019 11:13:18 -0400
Date:   Mon, 14 Oct 2019 11:13:18 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     Steven Rostedt <rostedt@goodmis.org>, Jens Axboe <axboe@kernel.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-block@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
Subject: Re: Lockup on USB and block devices
In-Reply-To: <1571054381.19529.16.camel@suse.com>
Message-ID: <Pine.LNX.4.44L0.1910141112031.28937-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 14 Oct 2019, Oliver Neukum wrote:

> Am Dienstag, den 01.10.2019, 14:31 -0400 schrieb Alan Stern:
> > It looks like a problem with your xHCI USB host controller.  Normally a
> > usb-storage transfer would be aborted after 90 seconds.  But if the
> > host controller (or its driver) isn't working right, and the abort
> > never completes, you end up with a situation like this -- usb-storage
> > and the higher SCSI and block layers waiting indefinitely for an event
> > that won't occur.
> 
> Hi,
> 
> that would imply that usb_unlink_urb() is malfunctioning
> without taking down the whole bus. Is that likely?

Mathias is a better person to ask than me.  But yes, as far as I know,
something like that can happen.

Alan Stern

