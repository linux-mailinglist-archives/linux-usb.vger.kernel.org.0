Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E5605B810
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jul 2019 11:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbfGAJcY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jul 2019 05:32:24 -0400
Received: from mx2.suse.de ([195.135.220.15]:51598 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728143AbfGAJcY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Jul 2019 05:32:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 5DE6EB035;
        Mon,  1 Jul 2019 09:32:23 +0000 (UTC)
Message-ID: <1561972691.10014.8.camel@suse.com>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        patches@opensource.cirrus.com, USB list <linux-usb@vger.kernel.org>
Date:   Mon, 01 Jul 2019 11:18:11 +0200
In-Reply-To: <Pine.LNX.4.44L0.1906270944150.1492-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1906270944150.1492-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 27.06.2019, 09:52 -0400 schrieb Alan Stern:

> 
> Or maybe the WAIT_FOR_RESUME ioctl returns because there was a remote 
> wakeup.  In this case also you would call FORBID_SUSPEND.
> 
> In fact, you should call FORBID_SUSPEND _whenever_ WAIT_FOR_RESUME

Well, this kind of indicates that the original syscall should bump
the counter.

> returns, unless your program has decided not to use the device any more
> (in which case you don't care whether the device is suspended or
> resumed).

Then you should close the device.

	Regards
		Oliver

