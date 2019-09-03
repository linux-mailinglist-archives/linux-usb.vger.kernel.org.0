Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1AD9A6A48
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2019 15:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729137AbfICNpd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Sep 2019 09:45:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:42452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727624AbfICNpd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Sep 2019 09:45:33 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 387392087E;
        Tue,  3 Sep 2019 13:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567518332;
        bh=LiCgWmCxB7gDmdmh9sjPfzD1lYsS42E91pp+/LURO7o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L1MwF6uPKiUCnloFvY8eP8z+344bAlFMZImw3Zj3+r54rUKlQ7aIVEMh5nbwpfw36
         XbXO2uuH0Sg2sEnFW6m+b4eimXBgQS6yQXHewrUFeUIQhG5GW6O0kwBEoPXq+rTZ7Z
         zXF+HqVViS/iy266lkUJaL/WGr6A7FVl2fqU6j2o=
Date:   Tue, 3 Sep 2019 15:45:29 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Bill Kuzeja <William.Kuzeja@stratus.com>
Cc:     linux-usb@vger.kernel.org, torez@redhat.com
Subject: Re: [PATCH RESEND] xhci: Prevent deadlock when xhci adapter breaks
 during init
Message-ID: <20190903134529.GC9435@kroah.com>
References: <1567102335-5231-1-git-send-email-William.Kuzeja@stratus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567102335-5231-1-git-send-email-William.Kuzeja@stratus.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 29, 2019 at 02:12:15PM -0400, Bill Kuzeja wrote:
> The system can hit a deadlock if xhci adapter breaks while initializing. 
> The deadlock is between two threads: thread 1 is tearing down the 
> adapter and is stuck in usb_unlocked_disable_lpm waiting to lock the 
> hcd->handwidth_mutex. Thread 2 is holding this mutex (while still trying 
> to add a usb device), but is stuck in xhci_endpoint_reset waiting for a 
> stop or config command to complete. A reboot is required to resolve. 
> 
> It turns out when calling xhci_queue_stop_endpoint and 
> xhci_queue_configure_endpoint in xhci_endpoint_reset, the return code is
> not checked for errors. If the timing is right and the adapter dies just
> before either of these commands get issued, we hang indefinitely waiting 
> for a completion on a command that didn't get issued.
> 
> This wasn't a problem before the following fix because we didn't send 
> commands in xhci_endpoint_reset:
> 
> commit f5249461b504 ("xhci: Clear the host side toggle manually when endpoint is soft reset")
> 
> With the patch I am submitting, a duration test which breaks adapters 
> during initialization (and which deadlocks with the standard kernel) runs 
> without issue.
> 
> Fixes: f5249461b504 ("xhci: Clear the host side toggle manually when endpoint is soft reset")
> Signed-off-by: Bill Kuzeja <william.kuzeja@stratus.com>
> ---
>  drivers/usb/host/xhci.c | 22 +++++++++++++++++++---

$ ./scripts/get_maintainer.pl --file drivers/usb/host/xhci.c
Mathias Nyman <mathias.nyman@intel.com> (supporter:USB XHCI DRIVER)
Greg Kroah-Hartman <gregkh@linuxfoundation.org> (supporter:USB SUBSYSTEM)
linux-usb@vger.kernel.org (open list:USB XHCI DRIVER)
linux-kernel@vger.kernel.org (open list)

I think you forgot to send this to the xhci driver maintainer for review
:(

