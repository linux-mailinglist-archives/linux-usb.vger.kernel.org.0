Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08973248042
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 10:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgHRIOX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 04:14:23 -0400
Received: from mga14.intel.com ([192.55.52.115]:59087 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726341AbgHRIOW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Aug 2020 04:14:22 -0400
IronPort-SDR: mlhFGgaimL4et991zF/PUKJ1LScGQvLLNRDlTQ1jl3R8EoDSgOBkg7IQGwN4Jv1hj+zohUnUJC
 ettv9G+ZDTiA==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="154119614"
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; 
   d="scan'208";a="154119614"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 01:14:22 -0700
IronPort-SDR: 3zx13NX+RxrHvv2xsNOgNRvvtQCHUr6tx0EonPtsYGNH1A/tj+zTOLNro2iU4+C+gQPlVamDnl
 3YeGWDozdcWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; 
   d="scan'208";a="326661678"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 18 Aug 2020 01:14:18 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k7wYS-009bKE-F2; Tue, 18 Aug 2020 11:01:12 +0300
Date:   Tue, 18 Aug 2020 11:01:12 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Cc:     Anton Sviridenko <anton@corp.bluecherry.net>,
        Andrey Utkin <andrey.utkin@corp.bluecherry.net>,
        Ismael Luceno <ismael@iodev.co.uk>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jussi Kivilinna <jussi.kivilinna@iki.fi>,
        Kalle Valo <kvalo@codeaurora.org>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Sylwia Wnuczko <sylwia.wnuczko@intel.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>
Subject: Re: [PATCH v2 1/8] byteorder: Introduce cpu_to_le16_array() and
 le16_to_cpu_array()
Message-ID: <20200818080112.GZ1891694@smile.fi.intel.com>
References: <20200817184659.58419-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817184659.58419-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 17, 2020 at 09:46:52PM +0300, Andy Shevchenko wrote:
> Introduce cpu_to_le16_array() and le16_to_cpu_array() for existing and
> future users.

It appears that the series needs more work. Please, discard this and at some
point I'll send v3.

-- 
With Best Regards,
Andy Shevchenko


