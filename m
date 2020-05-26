Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5F51BE830
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 22:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgD2UNM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 16:13:12 -0400
Received: from netrider.rowland.org ([192.131.102.5]:50439 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726877AbgD2UNM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Apr 2020 16:13:12 -0400
Received: (qmail 25317 invoked by uid 500); 29 Apr 2020 16:13:11 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 29 Apr 2020 16:13:11 -0400
Date:   Wed, 29 Apr 2020 16:13:11 -0400 (EDT)
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
Subject: Re: [PATCH v5 3/4] usb: ehci: Add new EHCI driver for Broadcom STB
 SoC's
In-Reply-To: <20200429200826.20177-4-alcooperx@gmail.com>
Message-ID: <Pine.LNX.4.44L0.2004291612330.24784-100000@netrider.rowland.org>
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
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
>  drivers/usb/host/ehci-brcm.c | 290 +++++++++++++++++++++++++++++++++++
>  1 file changed, 290 insertions(+)
>  create mode 100644 drivers/usb/host/ehci-brcm.c

Acked-by: Alan Stern <stern@rowland.harvard.edu>

