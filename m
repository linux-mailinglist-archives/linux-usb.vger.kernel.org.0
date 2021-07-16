Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3C403CB7F1
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jul 2021 15:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239719AbhGPNkR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Jul 2021 09:40:17 -0400
Received: from mga09.intel.com ([134.134.136.24]:54188 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237892AbhGPNkQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 16 Jul 2021 09:40:16 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="210719972"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; 
   d="scan'208";a="210719972"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2021 06:37:21 -0700
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; 
   d="scan'208";a="431209370"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2021 06:37:19 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1m4O1h-00EF8D-C1; Fri, 16 Jul 2021 16:37:13 +0300
Date:   Fri, 16 Jul 2021 16:37:13 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     David Jeffery <djeffery@redhat.com>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Laurence Oberman <loberman@redhat.com>,
        Ewan Milne <emilne@redhat.com>, apanagio@redhat.com,
        torez@redhat.com
Subject: Re: [PATCH V2] usb: ehci: Prevent missed ehci interrupts with
 edge-triggered MSI
Message-ID: <YPGLiRFiXCEWFiOe@smile.fi.intel.com>
References: <20210715213744.GA44506@redhat>
 <YPGLUgTTIDm0Qh5Q@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPGLUgTTIDm0Qh5Q@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 16, 2021 at 04:36:18PM +0300, Andy Shevchenko wrote:
> On Thu, Jul 15, 2021 at 05:37:44PM -0400, David Jeffery wrote:
> > When MSI is used by the ehci-hcd driver, it can cause lost interrupts which
> > results in EHCI only continuing to work due to a polling fallback. But the
> > reliance of polling drastically reduces performance of any I/O through EHCI.
> > 
> > Interrupts are lost as the EHCI interrupt handler does not safely handle
> > edge-triggered interrupts. It fails to ensure all interrupt status bits are
> > cleared, which works with level-triggered interrupts but not the
> > edge-triggered interrupts typical from using MSI.
> > 
> > To fix this problem, check if the driver may have raced with the hardware
> > setting additional interrupt status bits and clear status until it is in a
> > stable state.
> > 
> > Signed-off-by: David Jeffery <djeffery@redhat.com>
> > Tested-by: Laurence Oberman <loberman@redhat.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Acked-by: Alan Stern <stern@rowland.harvard.edu>
> 
> > Fixes: 306c54d0edb6 usb: hcd: Try MSI interrupts on PCI devices
> 
> Improper format.
> 
> Add to your .gitconfig the following:
> 
> [alias]
> 	one = show -s --pretty='format:%h (\"%s\")'
> 	c = show -s --pretty='format:https://git.kernel.org/torvalds/c/%h'

And this

[core]
	abbrev = 12

`git one $COMMIT` will give you a nice representation.

-- 
With Best Regards,
Andy Shevchenko


