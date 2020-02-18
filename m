Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5CD162E9F
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 19:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgBRSdr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 13:33:47 -0500
Received: from mga02.intel.com ([134.134.136.20]:39454 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726225AbgBRSdr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Feb 2020 13:33:47 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2020 10:33:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; 
   d="scan'208";a="348741386"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001.fm.intel.com with ESMTP; 18 Feb 2020 10:33:45 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1j47gp-00382Y-Po; Tue, 18 Feb 2020 20:33:47 +0200
Date:   Tue, 18 Feb 2020 20:33:47 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v1] usb: core: Make use of acpi_evaluate_object() status
Message-ID: <20200218183347.GL10400@smile.fi.intel.com>
References: <20200218160954.42815-1-andriy.shevchenko@linux.intel.com>
 <511c8750-b188-82a1-e839-6b136e5c727c@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <511c8750-b188-82a1-e839-6b136e5c727c@cogentembedded.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 18, 2020 at 09:17:47PM +0300, Sergei Shtylyov wrote:
> On 02/18/2020 07:09 PM, Andy Shevchenko wrote:

...

> > +	if (!upc || (upc->type != ACPI_TYPE_PACKAGE) || upc->package.count != 4) {
> >  		goto out;
> >  	}
> 
>    I'd drop {} here, while at it.

Yep, makes sense, thanks!

-- 
With Best Regards,
Andy Shevchenko


