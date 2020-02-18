Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6E6162910
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 16:08:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbgBRPIS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 10:08:18 -0500
Received: from mga01.intel.com ([192.55.52.88]:44091 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726634AbgBRPIR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Feb 2020 10:08:17 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2020 07:08:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; 
   d="scan'208";a="228756842"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 18 Feb 2020 07:08:15 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1j44Tx-0035UQ-If; Tue, 18 Feb 2020 17:08:17 +0200
Date:   Tue, 18 Feb 2020 17:08:17 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1] usb: dwc3: Add ACPI support for xHCI ports
Message-ID: <20200218150817.GI10400@smile.fi.intel.com>
References: <20200218124257.8734-1-andriy.shevchenko@linux.intel.com>
 <87zhdgezaf.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zhdgezaf.fsf@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 18, 2020 at 04:38:16PM +0200, Felipe Balbi wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> > -/**
> > +/*
> 
> trailing change, at least mention it in commit log ;-)

I will split to two. Thanks!

-- 
With Best Regards,
Andy Shevchenko


