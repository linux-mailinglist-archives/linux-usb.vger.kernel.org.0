Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CBCD253836
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 21:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgHZTWV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 15:22:21 -0400
Received: from mga06.intel.com ([134.134.136.31]:53299 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726790AbgHZTWU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Aug 2020 15:22:20 -0400
IronPort-SDR: rpmdnCsE9db2aG9X0Pv4ZKyqjiOAO0MRgu3rFtH0AmmPtm2wvxxSIsC3C9HBVmfD5AXh8zw4re
 9SpLDCuA9/Vg==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="217923155"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; 
   d="scan'208";a="217923155"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 12:22:19 -0700
IronPort-SDR: e9bBnOfzqo0j5WfuDx5vW4BicNJpMuHnd+yjeU7F4Y/fBEwFPRZZV/kpNEYEv00/DTeK8RhEJO
 5aF0GJ+Dmi7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; 
   d="scan'208";a="329331245"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 26 Aug 2020 12:22:18 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kB0zw-00Bdad-4V; Wed, 26 Aug 2020 22:22:16 +0300
Date:   Wed, 26 Aug 2020 22:22:16 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Brooke Basile <brookebasile@gmail.com>,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v1] USB: gadget: u_f: Unbreak offset calculation in VLAs
Message-ID: <20200826192216.GY1891694@smile.fi.intel.com>
References: <20200826162413.21637-1-andriy.shevchenko@linux.intel.com>
 <CGME20200826162826eucas1p1417db546c681842d450c17cde42c9420@eucas1p1.samsung.com>
 <20200826162837.GA28466@kroah.com>
 <8371560f-c766-2fcf-25f1-bc05a8c53e6d@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8371560f-c766-2fcf-25f1-bc05a8c53e6d@samsung.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 26, 2020 at 06:31:01PM +0200, Marek Szyprowski wrote:
> On 26.08.2020 18:28, Greg Kroah-Hartman wrote:
> > On Wed, Aug 26, 2020 at 07:24:13PM +0300, Andy Shevchenko wrote:

> That's why I said that I've moved offset assignment in the first part of 
> the patch after size_t size = array_size(n, sizeof(type));

v2 has been sent.

-- 
With Best Regards,
Andy Shevchenko


