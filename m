Return-Path: <linux-usb+bounces-17298-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D7E9C0119
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 10:27:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 707DA1F22436
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 09:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E178C1DF273;
	Thu,  7 Nov 2024 09:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQPt5t1v"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B7A196D8F
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 09:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730971651; cv=none; b=Mra6fY3HJr2CKc3ThFqqvU17hF12Ab/Gexm7ih7KvoiMKrZ9q+Tg7eakVMXKLWe7i8GGIpCl4OUf6jM2pDiF9aac506fEqZ26pCcZos9VI1pk+DS/RMqrNhrv9QY7Tf3jUtZdfitEXds44KXvufMiHc5Btk2KvZ/9OTv2ebZE7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730971651; c=relaxed/simple;
	bh=V9khQ1E7rWj5nI2UWo3kaKc9nV6T99bfyfLdaUNmP+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RAd4RbTCd0H8TPybCpN7hL6tsWlVWXmW/HieDm6M9E+M2TkXSXQzs7eyCYjw1jTCYwzpgrg7Xjfo3TQaoGMFDvq5OYzeomIwEMn8qCt/rhcW4ANM/O/gSUGrVBqyOuvWWt/Vrz8yzVnMmAurPlV7EzLQICZp4EsF7HrpIaqUH/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQPt5t1v; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730971650; x=1762507650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V9khQ1E7rWj5nI2UWo3kaKc9nV6T99bfyfLdaUNmP+8=;
  b=OQPt5t1vaLlaI4dzijIR//1AuAXsOdGlWrcznnNR4vsdNZVVG4ncIfAk
   WrqQdqwoCzULFBhgYZEvTptPtKMCsG7EiAiloc3Y3fjpA2q5GLQ2+ASg2
   OVD/5uFRHcC6zexPREPk4VGDt/snOCjW7XYiJNsmbZLTQ4StFj/qmSESr
   jh7KKoo8qEdnCwMhW/bjHkOGeU70I30FQGfqu9gZSRV8bdX16/VzLiUze
   JQFqzR7U+UDGH9bHJlsB1WbrI6XX4Yr3VeKaIhVPl4xvYfN9lEv+Hlf3J
   siNs3X29atJfbu6w1H7uIJNWJsDLnjIvdAOH3HKJOAmvqjwPEp1vwg8Dz
   A==;
X-CSE-ConnectionGUID: fpkjelQ0QW6L2WIQMH0zOA==
X-CSE-MsgGUID: YR3KW1MgSzaB7XLgSf4odw==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="33646653"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="33646653"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 01:27:29 -0800
X-CSE-ConnectionGUID: p3mdsjDnS22d+OGJ4hPWag==
X-CSE-MsgGUID: HR9FWMoZQ2SOwoq+bosRDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="84942182"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.83.36])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 01:27:28 -0800
Date: Thu, 7 Nov 2024 10:27:25 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 3/3] usb: misc: ljca: print firmware version
Message-ID: <ZyyH/S8j3nxu8yTl@linux.intel.com>
References: <20241107073718.405208-1-stanislaw.gruszka@linux.intel.com>
 <20241107073718.405208-3-stanislaw.gruszka@linux.intel.com>
 <2024110741-unfold-condense-6c54@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024110741-unfold-condense-6c54@gregkh>

On Thu, Nov 07, 2024 at 09:37:34AM +0100, Greg KH wrote:
> On Thu, Nov 07, 2024 at 08:37:18AM +0100, Stanislaw Gruszka wrote:
> > For diagnostics purposes read firmware version from device
> > and print it to dmesg during initialization.
> 
> This changelog text isn't correct anymore :(

I'll drop this one from the set.
 
Regards
Stanislaw

