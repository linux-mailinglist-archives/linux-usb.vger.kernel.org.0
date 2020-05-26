Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C848F1CBBF9
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2020 02:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728469AbgEIArx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 May 2020 20:47:53 -0400
Received: from netrider.rowland.org ([192.131.102.5]:60783 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728421AbgEIArx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 May 2020 20:47:53 -0400
Received: (qmail 3733 invoked by uid 500); 8 May 2020 20:47:52 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 8 May 2020 20:47:52 -0400
Date:   Fri, 8 May 2020 20:47:52 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Al Cooper <alcooperx@gmail.com>
cc:     linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        <devicetree@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v8 4/5] usb: ehci: Add new EHCI driver for Broadcom STB
 SoC's
In-Reply-To: <20200508211929.39020-5-alcooperx@gmail.com>
Message-ID: <Pine.LNX.4.44L0.2005082035460.2445-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 8 May 2020, Al Cooper wrote:

A few minor typos in the patch description:

> Add a new EHCI driver for Broadcom STB SoC's. A new EHCI driver
> was created instead of adding support to the existing ehci platform
> driver because of the code required to workaround bugs in the EHCI
-----------------------------------------^

"workaround" is a noun; the verb form is "work around".

> controller. The primary workround is for a bug where the Core
-----------------------------^

Missing "a".

> violates the SOF interval between the first two SOFs transmitted after
> resume. This only happens if the resume occurs near the end of a
> microframe. The fix is to intercept the echi-hcd request to complete
-------------------------------------------^

ehci, not echi.

> RESUME and align it to the start of the next microframe.
> 
> Signed-off-by: Al Cooper <alcooperx@gmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---

Basically this new driver is fine.  However...

> +static inline void ehci_brcm_wait_for_sof(struct ehci_hcd *ehci, u32 delay)
> +{
> +	u32 frame_idx = ehci_readl(ehci, &ehci->regs->frame_index);
> +	u32 val;
> +	int res;
> +
> +	/* Wait for next microframe (every 125 usecs) */
> +	res = readl_relaxed_poll_timeout(&ehci->regs->frame_index, val,
> +					 val != frame_idx, 1, 130);
> +	if (res)
> +		dev_err(ehci_to_hcd(ehci)->self.controller,
> +			"Error waiting for SOF\n");

If this patch is going to be redone anyway, you might as well change
dev_err() to ehci_err() -- that's what it's for.  I should have noticed
this earlier, sorry.

> +static int ehci_brcm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res_mem;
> +	struct brcm_priv *priv;
> +	struct usb_hcd *hcd;
> +	int irq;
> +	int err;
> +
> +	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +	if (err)
> +		return err;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq <= 0)
> +		return irq;

I don't want to get involved in the question of whether or not 0 is a 
valid IRQ number.  The consensus has gone back and forth over the 
years, and it just doesn't seem important.

However, as Sergei points out, if 0 is going to be regarded as an 
invalid value then we shouldn't return 0 from the probe function here.

I'll leave the decision on how to handle this matter up to Greg.  :-)

Alan Stern


