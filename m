Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8A71B78C8
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2020 17:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbgDXPDt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Apr 2020 11:03:49 -0400
Received: from netrider.rowland.org ([192.131.102.5]:57403 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726698AbgDXPDs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Apr 2020 11:03:48 -0400
Received: (qmail 5128 invoked by uid 500); 24 Apr 2020 11:03:47 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 24 Apr 2020 11:03:47 -0400
Date:   Fri, 24 Apr 2020 11:03:47 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Qais Yousef <qais.yousef@arm.com>
cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Tony Prisk <linux@prisktech.co.nz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Oliver Neukum <oneukum@suse.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] usb/xhci-plat: Set PM runtime as active on resume
In-Reply-To: <20200424134800.4629-2-qais.yousef@arm.com>
Message-ID: <Pine.LNX.4.44L0.2004241102400.2596-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 24 Apr 2020, Qais Yousef wrote:

> Follow suit of ohci-platform.c and perform pm_runtime_set_active() on
> resume.
> 
> ohci-platform.c had a warning reported due to the missing
> pm_runtime_set_active() [1].
> 
> [1] https://lore.kernel.org/lkml/20200323143857.db5zphxhq4hz3hmd@e107158-lin.cambridge.arm.com/
> 
> Signed-off-by: Qais Yousef <qais.yousef@arm.com>
> CC: Tony Prisk <linux@prisktech.co.nz>
> CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> CC: Mathias Nyman <mathias.nyman@intel.com>
> CC: Oliver Neukum <oneukum@suse.de>
> CC: linux-arm-kernel@lists.infradead.org
> CC: linux-usb@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
> 
> xhci_resume() here could fail, I wasn't sure if we need to call
> pm_runtime_set_active() unconditionally. I assumed not.
> 
> There was another function xhci_plat_resume(), I think we just care about the
> PM runtime resume callback only.
> 
> Please have a closer look.

No, it's the other way around.  The function you want to change is the 
one used for system resume, not runtime resume.

Alan Stern

