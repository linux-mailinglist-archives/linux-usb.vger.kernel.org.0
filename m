Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1547F3D5674
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jul 2021 11:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232836AbhGZIqj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jul 2021 04:46:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:45632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232482AbhGZIqi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Jul 2021 04:46:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C94260E09;
        Mon, 26 Jul 2021 09:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627291627;
        bh=zDzbC++5wctFq+Q4iHwRGd75bz8+tmWMkROs8H4jymY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RdE+bpr+EZpHrAf4/Oh/oZKX3VaKci7YROlZWzW6oO3ZmzIrUIv2Hd6+HvSj11IYd
         vhUMqDsnVousguFjz6Vw5PsVP2iI8PpQMiTGmWbayFq8cc0mXE2Q1As3tOiUN++Z0j
         fUEVmDBFf0cJtdGfYE3W+pRVIK8RVPMf02zrKOQE=
Date:   Mon, 26 Jul 2021 11:19:53 +0200
From:   "Greg KH (gregkh@linuxfoundation.org)" <gregkh@linuxfoundation.org>
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH for 4.14] xhci: add xhci_get_virt_ep() helper
Message-ID: <YP5+ORjnkKnwWRrt@kroah.com>
References: <3c42fbd4599a4a3e8b065418592973d9@SVR-IES-MBX-03.mgc.mentorg.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c42fbd4599a4a3e8b065418592973d9@SVR-IES-MBX-03.mgc.mentorg.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 26, 2021 at 09:11:30AM +0000, Schmid, Carsten wrote:
> From 804d2db49c8db94ff4652f13826a2c74dac33941 Mon Sep 17 00:00:00 2001
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> Date: Fri, 29 Jan 2021 15:00:22 +0200
> Subject: [PATCH] xhci: add xhci_get_virt_ep() helper
> 
> [commit b1adc42d440df3233255e313a45ab7e9b2b74096 upstream]
> 
> In several event handlers we need to find the right endpoint
> structure from slot_id and ep_index in the event.
> 
> Add a helper for this, check that slot_id and ep_index are valid.
> 
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Link: https://lore.kernel.org/r/20210129130044.206855-6-mathias.nyman@linux.intel.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Carsten Schmid <carsten_schmid@mentor.com>
> ---
> Rationale:
> From mail thread " Possible race in 4.14 xhci stack"
> Searched for fix that Mathias Nyman mentioned.
> Fix didn't apply on 4.14 directly, needed some small adaption.
> Result provided here.
> @Greg: Patch is for 4.14, not tested if applies on other kernels.

I can not just apply this to 4.14, it also needs to go into 4.19 and 5.4
and 5.10 as you can not upgrade to a newer kernel and get a regression,
right?

Can you also provide patches for those kernels as well so that I can
take this one?

And also, you forgot to cc: the stable@vger.kernel.org mailing list :(

thanks,

greg k-h
