Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6EC3E04C1
	for <lists+linux-usb@lfdr.de>; Wed,  4 Aug 2021 17:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239448AbhHDPtE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Aug 2021 11:49:04 -0400
Received: from mga06.intel.com ([134.134.136.31]:4470 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239458AbhHDPs7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Aug 2021 11:48:59 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="275000477"
X-IronPort-AV: E=Sophos;i="5.84,294,1620716400"; 
   d="scan'208";a="275000477"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2021 08:48:45 -0700
X-IronPort-AV: E=Sophos;i="5.84,294,1620716400"; 
   d="scan'208";a="521951797"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2021 08:48:42 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 04 Aug 2021 18:48:38 +0300
Date:   Wed, 4 Aug 2021 18:48:38 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/4] thunderbolt: Handle ring interrupt by reading
 intr status
Message-ID: <YQq21heIOiSeHqJ1@lahna>
References: <1627994096-99972-1-git-send-email-Sanju.Mehta@amd.com>
 <1627994096-99972-3-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1627994096-99972-3-git-send-email-Sanju.Mehta@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, Aug 03, 2021 at 07:34:54AM -0500, Sanjay R Mehta wrote:
> From: Sanjay R Mehta <sanju.mehta@amd.com>
> 
> As per USB4 spec by default "Disable ISR Auto-Clear" bit is set to 0,
> and the Tx/Rx ring interrupt status is needs to be cleared.
> 
> Hence handling it by reading the "Interrupt status" register in the ISR.
> 
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
> ---
>  drivers/thunderbolt/nhi.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index ef01aa6..7ad2202 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -373,11 +373,25 @@ void tb_ring_poll_complete(struct tb_ring *ring)
>  }
>  EXPORT_SYMBOL_GPL(tb_ring_poll_complete);
>  
> +static void check_and_clear_intr_status(struct tb_ring *ring)
> +{
> +	if (!(ring->nhi->pdev->vendor == PCI_VENDOR_ID_INTEL)) {
> +		if (ring->is_tx)
> +			ioread32(ring->nhi->iobase
> +				 + REG_RING_NOTIFY_BASE);
> +		else
> +			ioread32(ring->nhi->iobase
> +				 + REG_RING_NOTIFY_BASE
> +				 + 4 * (ring->nhi->hop_count / 32));
> +	}
> +}

I'm now playing with this series on Intel hardware. I wanted to check
from you whether the AMD controller implements the Auto-Clear feature? I
mean if we always clear bit 17 of the Host Interface Control register do
you still need to call the above or it is cleared automatically?

I'm hoping that we could make this work on all controllers without too
many special cases ;-)
