Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF572C0F31
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 16:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388106AbgKWPqP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 10:46:15 -0500
Received: from mga09.intel.com ([134.134.136.24]:35118 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388010AbgKWPqP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Nov 2020 10:46:15 -0500
IronPort-SDR: uc1jA36vKVa2LxqWJ+PMtgFyk8c6lF8+ewQcxxVbyg8wuINBe9ar4aag3gQO8LSWBXVNJq7p0F
 23SIhEzcNMdw==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="171946697"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="171946697"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:46:14 -0800
IronPort-SDR: ASVXL/+NkRdarDAN+N6vGRjRyAX/QdSG6Cmdp5teS1znTYOot3lKNvgqFV5c8Y25NOzq1X1sFV
 mI47zA6uGobw==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="361489017"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:46:11 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 23 Nov 2020 17:46:09 +0200
Date:   Mon, 23 Nov 2020 17:46:09 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] xhci-pci: Allow host runtime PM as default for Intel
 Alpine LP
Message-ID: <20201123154609.GB2532@lahna.fi.intel.com>
References: <20201123151140.5324-1-hdegoede@redhat.com>
 <20201123154519.GA2532@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123154519.GA2532@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Forgot to say, $subject also should say "Alpine Ridge LP".

On Mon, Nov 23, 2020 at 05:45:24PM +0200, Mika Westerberg wrote:
> Hi Hans,
> 
> Few minor comments below :)
> 
> On Mon, Nov 23, 2020 at 04:11:40PM +0100, Hans de Goede wrote:
> > The xhci controller on Alpine Ridge LP keeps the whole thunderbolt
>       ^^^^                                               ^^^^^^^^^^^
> xHCI                                                     Thunderbolt
> 
> 
> > controller awake if the host controller is not allowed to sleep.
> > This is the case even if no USB devices are connected to the host.
> > 
> > Add the Intel Alpine LP product-id to the list of product-ids
>                       ^
> 		      Ridge
> 
> > for which we allow runtime PM by default.
> > 
> > Fixes: 2815ef7fe4d4 ("xhci-pci: allow host runtime PM as default for Intel Alpine and Titan Ridge")
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
