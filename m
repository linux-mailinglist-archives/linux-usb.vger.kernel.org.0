Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA381D195A
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 17:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389240AbgEMP0O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 11:26:14 -0400
Received: from mga12.intel.com ([192.55.52.136]:5095 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732300AbgEMP0O (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 May 2020 11:26:14 -0400
IronPort-SDR: 10LHBv/gr9H30UxboA5GwFTYwIqF34ZvabE/C6gG9gfW9qgmxwbqU1P0l2gY63YOpHOmqpyB4/
 dutQpTq9ip4Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 08:26:13 -0700
IronPort-SDR: lpwA1behfMK+YoTYrewJdqYqqwJnbTOvkihSrV8etO4S7L7OrLHQ5L8WJd8nkhoMvqurgnnLd8
 ugv8/0/nSPbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,388,1583222400"; 
   d="scan'208";a="253223172"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 13 May 2020 08:26:11 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1jYtGv-006Rs4-KZ; Wed, 13 May 2020 18:26:13 +0300
Date:   Wed, 13 May 2020 18:26:13 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v10 1/5] usb: xhci: Change the XHCI link order in the
 Makefile
Message-ID: <20200513152613.GR185537@smile.fi.intel.com>
References: <20200512150019.25903-1-alcooperx@gmail.com>
 <20200512150019.25903-2-alcooperx@gmail.com>
 <20200513122613.GA1023594@kroah.com>
 <7acc2a4c-caab-11e7-7b3f-4176f19c58cf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7acc2a4c-caab-11e7-7b3f-4176f19c58cf@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 13, 2020 at 08:08:07AM -0700, Florian Fainelli wrote:
> On 5/13/2020 5:26 AM, Greg Kroah-Hartman wrote:
> > On Tue, May 12, 2020 at 11:00:15AM -0400, Al Cooper wrote:
> >> Some BRCMSTB USB chips have an XHCI, EHCI and OHCI controller
> >> on the same port where XHCI handles 3.0 devices, EHCI handles 2.0
> >> devices and OHCI handles <2.0 devices. Currently the Makefile
> >> has XHCI linking at the bottom which will result in the XHIC driver
> >> initalizing after the EHCI and OHCI drivers and any installed 3.0
> >> device will be seen as a 2.0 device. Moving the XHCI linking
> >> above the EHCI and OHCI linking fixes the issue.
> > 
> > What happens if all of these are modules and they are loaded in a
> > different order?  This makefile change will not help with that, you need
> > to have logic in the code in order to properly coordinate this type of
> > mess, sorry.
> 
> I believe we should be using module soft dependencies to instruct the
> module loaders to load the modules in the correct order, so something
> like this would do (not tested) for xhci-plat-hcd.c:
> 
> MODULE_SOFTDEP("post: ehci-hcd ohci-hcd");
> 
> and I am not sure whether we need to add the opposite for ehci-hcd and
> ohci-hcd:
> 
> MODULE_SOFTDEP("pre: xhci-plat-hcd");

JFYI: not all user space support this (alas, but that's current state of
affairs), OTOH I don't really care about those which do not support it
(Busybox).

-- 
With Best Regards,
Andy Shevchenko


