Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD9D6247172
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 20:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390984AbgHQS1k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 14:27:40 -0400
Received: from mga02.intel.com ([134.134.136.20]:33087 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390705AbgHQS12 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 14:27:28 -0400
IronPort-SDR: IGL7tA3TlBFRC1g0Mkh3fl9x8yycQgkVQHTxzTcXNJgTknJHConB5ayVZXSTTxjEcsrqeWz9sy
 EzXpwnb/Zwhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="142599808"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="142599808"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 11:27:25 -0700
IronPort-SDR: +02gm7QEuBAyZi/4zu0N3IB7//AF132LLThVJx2NKIzweRt0KrVRIjKxemna9vTH4p0cPDCwMG
 qTZ+w+SPDGww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="326488075"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2020 11:27:24 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k7jqs-009U8m-Uz; Mon, 17 Aug 2020 21:27:22 +0300
Date:   Mon, 17 Aug 2020 21:27:22 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH v1 2/3] usb: early: xhci-dbc: Move cpu_to_le16_array() to
 core
Message-ID: <20200817182722.GU1891694@smile.fi.intel.com>
References: <20200817164226.49119-1-andriy.shevchenko@linux.intel.com>
 <20200817164226.49119-2-andriy.shevchenko@linux.intel.com>
 <20200817165103.GC721399@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817165103.GC721399@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 17, 2020 at 06:51:03PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Aug 17, 2020 at 07:42:25PM +0300, Andy Shevchenko wrote:
> > It's used in USB but it might be useful for other drivers as well.
> 
> Don't move it unless someone actually needs it.
> 
> > While at it, introduce a counterpart helper, i.e. le16_to_cpu_array().
> 
> Don't add something that no one uses, otherwise it will just be removed.

I will address both by converting real users of them besides this driver.

-- 
With Best Regards,
Andy Shevchenko


