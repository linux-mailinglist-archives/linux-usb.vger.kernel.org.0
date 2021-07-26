Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 957483D5706
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jul 2021 12:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233231AbhGZJYk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jul 2021 05:24:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:56946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232156AbhGZJYf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Jul 2021 05:24:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A0CA760524;
        Mon, 26 Jul 2021 10:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627293903;
        bh=PhsYRTZH6MRxMMWMRm8MkNCs2FvRjgmFAHMdvWQo6D0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B05AnRq8jxJajlJ43NJ35sZO5dEYSwWhlGy30BEBlUcFd1YF6eBmO70fpdTg/r2b3
         9xBtJlqJr/2Z+pGMSY+nw9LScMckCoPqrJehvzSp5s4WQ1SNuw+Uzs6MOeHUGVf/yw
         ktJz2wDFVFL5IsKZkHo300jbEjC4KTkReeDh9Obk=
Date:   Mon, 26 Jul 2021 12:05:00 +0200
From:   "Greg KH (gregkh@linuxfoundation.org)" <gregkh@linuxfoundation.org>
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH for 4.14] xhci: add xhci_get_virt_ep() helper
Message-ID: <YP6IzGT6gZNgudI6@kroah.com>
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
> ---
>  drivers/usb/host/xhci-ring.c | 58 ++++++++++++++++++++++++++++--------
>  drivers/usb/host/xhci.h      |  3 +-
>  2 files changed, 47 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 9828c1eff9a5..ce5deac93418 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -444,6 +444,26 @@ static void ring_doorbell_for_active_rings(struct xhci_hcd *xhci,
>  }
>  }
> 
> +static struct xhci_virt_ep *xhci_get_virt_ep(struct xhci_hcd *xhci,
> +     unsigned int slot_id,
> +     unsigned int ep_index)
> +{
> +if (slot_id == 0 || slot_id >= MAX_HC_SLOTS) {
> +xhci_warn(xhci, "Invalid slot_id %u\n", slot_id);
> +return NULL;
> +}
> +if (ep_index >= EP_CTX_PER_DEV) {
> +xhci_warn(xhci, "Invalid endpoint index %u\n", ep_index);
> +return NULL;
> +}
> +if (!xhci->devs[slot_id]) {
> +xhci_warn(xhci, "No xhci virt device for slot_id %u\n", slot_id);
> +return NULL;
> +}
> +
> +return &xhci->devs[slot_id]->eps[ep_index];
> +}
> +

Also, the patch is corrupted and can not be applied, even if I wanted to
:(

So can you fix that up when you resend all of the other versions too?

thanks,

greg k-h
