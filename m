Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02D1A1BE6F6
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 21:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgD2TIt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 15:08:49 -0400
Received: from netrider.rowland.org ([192.131.102.5]:56023 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726774AbgD2TIs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Apr 2020 15:08:48 -0400
Received: (qmail 19996 invoked by uid 500); 29 Apr 2020 15:08:47 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 29 Apr 2020 15:08:47 -0400
Date:   Wed, 29 Apr 2020 15:08:47 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Al Cooper <alcooperx@gmail.com>
cc:     linux-kernel@vger.kernel.org,
        <bcm-kernel-feedback-list@broadcom.com>,
        <devicetree@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 3/4] usb: ehci: Add new EHCI driver for Broadcom STB
 SoC's
In-Reply-To: <20200429173112.38366-4-alcooperx@gmail.com>
Message-ID: <Pine.LNX.4.44L0.2004291500390.19187-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 29 Apr 2020, Al Cooper wrote:

> Add a new EHCI driver for Broadcom STB SoC's. A new EHCI driver
> was created instead of adding support to the existing ehci platform
> driver because of the code required to workaround bugs in the EHCI
> controller.
> 
> Signed-off-by: Al Cooper <alcooperx@gmail.com>
> ---

...

> +static int __maybe_unused ehci_brcm_resume(struct device *dev)
> +{
> +	struct usb_hcd *hcd = dev_get_drvdata(dev);
> +	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
> +	struct brcm_priv *priv = hcd_to_ehci_priv(hcd);
> +	int err;
> +
> +	err = clk_prepare_enable(priv->clk);
> +	if (err)
> +		return err;
> +	/*
> +	 * SWLINUX-1705: Avoid OUT packet underflows during high memory
> +	 *   bus usage
> +	 * port_status[0x0f] = Broadcom-proprietary USB_EHCI_INSNREG00
> +	 * @ 0x90
> +	 */
> +	ehci_writel(ehci, 0x00800040, &ehci->regs->port_status[0x10]);
> +	ehci_writel(ehci, 0x00000001, &ehci->regs->port_status[0x12]);
> +
> +	ehci_resume(hcd, false);
> +	return 0;
> +}

One extra thing that came to my attention recently...  Like all other
platform drivers, this has to set the runtime PM status of the
controller at the end of a system resume.  See

	https://marc.info/?l=linux-usb&m=158773611612885&w=2

for an example.

Alan Stern

