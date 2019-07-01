Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1E9E239B2
	for <lists+linux-usb@lfdr.de>; Mon, 20 May 2019 16:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388162AbfETOSo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 May 2019 10:18:44 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:58774 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730416AbfETOSn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 May 2019 10:18:43 -0400
Received: (qmail 1770 invoked by uid 2102); 20 May 2019 10:18:42 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 20 May 2019 10:18:42 -0400
Date:   Mon, 20 May 2019 10:18:42 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Marek Szyprowski <m.szyprowski@samsung.com>
cc:     linux-usb@vger.kernel.org, <linux-samsung-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Markus Reichl <m.reichl@fivetechno.de>,
        =?UTF-8?q?M=C3=A5ns=20Rullg=C3=A5rd?= <mans@mansr.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH v5] usb: exynos: add workaround for the USB device bindings
 conflict
In-Reply-To: <20190520090823.17189-1-m.szyprowski@samsung.com>
Message-ID: <Pine.LNX.4.44L0.1905201017340.1498-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 20 May 2019, Marek Szyprowski wrote:

> Commit 69bec7259853 ("USB: core: let USB device know device node") added
> support for attaching devicetree node for USB devices. Those nodes are
> children of their USB host controller. However Exynos EHCI and OHCI
> driver bindings already define child-nodes for each physical root hub
> port and assigns respective PHY controller and parameters to them. Those
> bindings predates support for USB device tree nodes.
> 
> To mitigate the side-effects of the conflict between those bindings,
> lets reset Exynos host controller of_node pointer before registering it
> to USB subsystem. This fixes the issue raised by the commit 01fdf179f4b0
> ("usb: core: skip interfaces disabled in devicetree"), which incorrectly
> disabled some devices on Exynos based boards.
> 
> Reported-by: Markus Reichl <m.reichl@fivetechno.de>
> Suggested-by: Måns Rullgård <mans@mansr.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v5:
> - fixed error path handling as pointed by Alan

Acked-by: Alan Stern <stern@rowland.harvard.edu>

This is assuming the whole approach makes sense in the first place --
I'll defer to other people's judgement on that.

Alan Stern

