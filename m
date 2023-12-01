Return-Path: <linux-usb+bounces-3582-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F48801360
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 20:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01EDA1C2121A
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 19:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4264E60C;
	Fri,  1 Dec 2023 19:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Da28TGI8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E0DF7
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 11:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701457703; x=1732993703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bogV2NkbfKKsOVVIjAS8HlVB0PMoT9SHcqnvqAJgTPg=;
  b=Da28TGI88WS/XCWfBvC/T8oZou2cPok0rH7YjEjLw1T8ziN4fvmETqD/
   p1BWlgMIgB7/I4dgch7n4QiKYexzipwL9xlYNfLNkfLo2LX51WixWxgbl
   Fhzf76FLiC/4PowW9HLUqOPN6VvoPS7xdio6LxaxTZELqk015FKVEB4sC
   SK6mqIY7xrll1SAPy6BJ8Cp03f2Y0jAo0sjwQXY6r/w06JHI9wrLrsxq2
   vVx3AJcqvyYeg/XmC/+pKh2XhJMHIdNBaVpf1ZK1BLkPi/vGQ9nXKLUzb
   WleRAkgW0q5XyfvBeI4q3YXA4MwU+2cRjdc7iHWEYqvYionLg8a6XU2FO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="15085144"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="15085144"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 11:08:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="798828783"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="798828783"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 11:08:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r98s6-000000015OZ-2Fu8;
	Fri, 01 Dec 2023 21:08:18 +0200
Date: Fri, 1 Dec 2023 21:08:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: David Laight <David.Laight@aculab.com>
Cc: 'Mathias Nyman' <mathias.nyman@linux.intel.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 08/19] xhci: dbc: Use sizeof_field() where it makes sense
Message-ID: <ZWovIn0V95c-T74n@smile.fi.intel.com>
References: <20231201150647.1307406-1-mathias.nyman@linux.intel.com>
 <20231201150647.1307406-9-mathias.nyman@linux.intel.com>
 <e98fd89faf4446e594ca3b7c3cc627fc@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e98fd89faf4446e594ca3b7c3cc627fc@AcuMS.aculab.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Dec 01, 2023 at 05:31:52PM +0000, David Laight wrote:
> From: Mathias Nyman
> > Sent: 01 December 2023 15:07

...

> > -	memset(dbc->eps, 0, sizeof(struct dbc_ep) * ARRAY_SIZE(dbc->eps));
> > +	memset(dbc->eps, 0, sizeof_field(struct xhci_dbc, eps));
> 
> Isn't that just:
> 	memset(dpc->eps, 0, sizeof (dpc->eps));
> perhaps better written as:
> 	memset(&dpc->epc, 0, sizeof (dpc->eps);

Maybe...
You can send a patch, so it gets tested for regressions!

> Otherwise the existing code wouldn't make sense at all.

-- 
With Best Regards,
Andy Shevchenko



