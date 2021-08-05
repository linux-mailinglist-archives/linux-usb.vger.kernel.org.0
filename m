Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7183E1741
	for <lists+linux-usb@lfdr.de>; Thu,  5 Aug 2021 16:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242088AbhHEOqv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Aug 2021 10:46:51 -0400
Received: from mga04.intel.com ([192.55.52.120]:60518 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241976AbhHEOqh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Aug 2021 10:46:37 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="212310258"
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="212310258"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 07:46:21 -0700
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="459034598"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 07:46:18 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 05 Aug 2021 17:46:15 +0300
Date:   Thu, 5 Aug 2021 17:46:15 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <sanmehta@amd.com>
Cc:     Sanjay R Mehta <Sanju.Mehta@amd.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        Basavaraj.Natikar@amd.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/4] thunderbolt: Handle ring interrupt by reading
 intr status
Message-ID: <YQv5t3OlaMxT/w0o@lahna>
References: <1627994096-99972-1-git-send-email-Sanju.Mehta@amd.com>
 <1627994096-99972-3-git-send-email-Sanju.Mehta@amd.com>
 <YQq21heIOiSeHqJ1@lahna>
 <36665ca4-a999-39c2-2401-8dab282145fa@amd.com>
 <YQvzdkXzOwUcLnBd@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQvzdkXzOwUcLnBd@lahna>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 05, 2021 at 05:19:39PM +0300, Mika Westerberg wrote:
> On Thu, Aug 05, 2021 at 06:29:36PM +0530, Sanjay R Mehta wrote:
> > 
> > 
> > On 8/4/2021 9:18 PM, Mika Westerberg wrote:
> > > [CAUTION: External Email]
> > > 
> > > Hi,
> > > 
> > > On Tue, Aug 03, 2021 at 07:34:54AM -0500, Sanjay R Mehta wrote:
> > >> From: Sanjay R Mehta <sanju.mehta@amd.com>
> > >>
> > >> As per USB4 spec by default "Disable ISR Auto-Clear" bit is set to 0,
> > >> and the Tx/Rx ring interrupt status is needs to be cleared.
> > >>
> > >> Hence handling it by reading the "Interrupt status" register in the ISR.
> > >>
> > >> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> > >> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
> > >> ---
> > >>  drivers/thunderbolt/nhi.c | 14 ++++++++++++++
> > >>  1 file changed, 14 insertions(+)
> > >>
> > >> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> > >> index ef01aa6..7ad2202 100644
> > >> --- a/drivers/thunderbolt/nhi.c
> > >> +++ b/drivers/thunderbolt/nhi.c
> > >> @@ -373,11 +373,25 @@ void tb_ring_poll_complete(struct tb_ring *ring)
> > >>  }
> > >>  EXPORT_SYMBOL_GPL(tb_ring_poll_complete);
> > >>
> > >> +static void check_and_clear_intr_status(struct tb_ring *ring)
> > >> +{
> > >> +     if (!(ring->nhi->pdev->vendor == PCI_VENDOR_ID_INTEL)) {
> > >> +             if (ring->is_tx)
> > >> +                     ioread32(ring->nhi->iobase
> > >> +                              + REG_RING_NOTIFY_BASE);
> > >> +             else
> > >> +                     ioread32(ring->nhi->iobase
> > >> +                              + REG_RING_NOTIFY_BASE
> > >> +                              + 4 * (ring->nhi->hop_count / 32));
> > >> +     }
> > >> +}
> > > 
> > > I'm now playing with this series on Intel hardware. I wanted to check
> > > from you whether the AMD controller implements the Auto-Clear feature? I
> > > mean if we always clear bit 17 of the Host Interface Control register do
> > > you still need to call the above or it is cleared automatically?
> > > 
> > Yes, AMD implements Auto-Clear and a read operation is required to clear
> > the interrupt status.
> > 
> > It is explicitly described in the Spec, Section "12.6.3.4.1 -> "Table
> > 12-27. Interrupt Status" as below
> > 
> > "If the Disable ISR Auto-Clear bit is set to 0b, then a read operation
> > returns the current value and then clears the register to 0."
> 
> D'oh, right. It is about auto clear of the ISS register on read or not.
> I misunderstood the whole bit.
> 
> > 
> > > I'm hoping that we could make this work on all controllers without too
> > > many special cases ;-)
> > 
> > Will it be good idea to have a separate variable in "struct tb_nhi" as
> > "nhi->is_intr_autoclr" so that we can set in the
> > "quirk_enable_intr_auto_clr()" as required which can be used in above
> > check_and_clear_intr_status() function instead of vendor check.
> 
> Probably that would work better. Let me try to figure out if we can
> somehow do the same in Intel controller too so we would only have single
> path here.

Looks like we cannot get it working without quirk of some kind :( I
think we can do this:

  1. Add nhi_check_quirks() to nhi.c and that one checks for
     PCI_VENDOR_ID_INTEL and sets nhi->quirks |= DMA_MISC_INT_AUTO_CLEAR.
  2. Then check it in both ring_interrupt_active() and in
     ring_clear_msix(ring) and if set handle the case accordingly.

Let's add nhi->quirks directly now because I have a feeling that we may
need additional flags in the future ;-)

Would you like to update this series with the above changes or you want
me to do that?
