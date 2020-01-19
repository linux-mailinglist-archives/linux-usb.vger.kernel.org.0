Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17BBA141EE7
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jan 2020 16:45:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbgASPpO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jan 2020 10:45:14 -0500
Received: from netrider.rowland.org ([192.131.102.5]:43463 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727060AbgASPpN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jan 2020 10:45:13 -0500
Received: (qmail 29031 invoked by uid 500); 19 Jan 2020 10:45:12 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 19 Jan 2020 10:45:12 -0500
Date:   Sun, 19 Jan 2020 10:45:12 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Ansuel Smith <ansuelsmth@gmail.com>
cc:     mathias.nyman@intel.com, <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: host: fix implicit declaration error
In-Reply-To: <20200118235828.14131-1-ansuelsmth@gmail.com>
Message-ID: <Pine.LNX.4.44L0.2001191040560.28587-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 19 Jan 2020, Ansuel Smith wrote:

> If USB_PCI is not enabled, this error is triggered.
> drivers/usb/host/ehci-pci.c:152:7:
> error: implicit declaration of function 'usb_amd_quirk_pll_check';
>   152 |   if (usb_amd_quirk_pll_check())
>       |       ^~~~~~~~~~~~~~~~~~~~~~~
>       |       usb_amd_quirk_pll_enable
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

I'm a little confused by this.  ehci-pci.c doesn't get compiled 
unless CONFIG_USB_EHCI_PCI is set, and that symbol depends on 
CONFIG_USB_PCI.  So how can this situation ever occur?

Alan Stern

