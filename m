Return-Path: <linux-usb+bounces-11417-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBB190E263
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 06:41:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1E301C22419
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 04:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EABF381BD;
	Wed, 19 Jun 2024 04:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TWWvPMz/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C7A208A0
	for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2024 04:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718772083; cv=none; b=TfgfK5XV6kT1XopkAba7oANIkwE9P2ZT+tRHHsKU3QEBJv7tukRIF11mS5YwQn9mafdoIyK7PZ5uyXOZElXbhzb8CUT+l3pRJ97ybqLhMJtgk4AoVNmn3Tu6agVYTqwV1hfFS1cAxl1WGNsPaTr09mYyjMF2QzR1Lx04tfrfENg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718772083; c=relaxed/simple;
	bh=Cg6wcDZQBLICtmKe+6CnmEYi5sWNx5aRme6GLJT9l6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZI5m2h3jwbuu7wrhrctuU/iy57p8Br+DbAqSeJc7mjJaf+ghC/ar08hB1uk1cErcmuxZXQhjNgSlXOlCVdD3kWo76SeNeo4Prv8SDls/sde5U2DlqWT6PA8SNzK1mcXlrMGndCdDsaXNX7EOOSOnx1BwN66ZX8y/qNdLfp9GWcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TWWvPMz/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718772082; x=1750308082;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Cg6wcDZQBLICtmKe+6CnmEYi5sWNx5aRme6GLJT9l6U=;
  b=TWWvPMz/eTUWLs7SPnXgAsRctw9ln2yZN/3zUaNauYVwKIdfjqrnZzks
   +iT5M3gCUhwdu2ywOeus80GW8a8IqsaXeKLu3/KwRRSvJIqYp1oavvAtC
   M+y/KtYewpHKQnJ2Y2b78CSpu/M+dlJ00jHV6rsNkAkrqBmf8Lx/DyWqX
   Xqsg0HEAIuEDIZP8540lr4crZtFF7O55+bF9oxpiMwkNGtVlER+xVm6/m
   eis10v30eazqMS8cidVQ2WHcaSx+ZYm7rjbIV5JddeEXuqHx8hHZoFp7/
   hIQ7001N/wEix3eDyvvMpFAIFTPV/+sMVgHpDAi+/YgkfivMAh9Eqn93a
   w==;
X-CSE-ConnectionGUID: n8trO8mNQ1mChkiDvGF2kg==
X-CSE-MsgGUID: FkEmK540TRK+bMgcpo5CVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="27106607"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="27106607"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 21:41:21 -0700
X-CSE-ConnectionGUID: DkphGimLRUaB5UVJKuvu2g==
X-CSE-MsgGUID: 784RatODRHaidtTz+TjPCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="72529212"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 18 Jun 2024 21:41:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 6486A1A3; Wed, 19 Jun 2024 07:41:18 +0300 (EEST)
Date: Wed, 19 Jun 2024 07:41:18 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <yehezkelshb@gmail.com>
Cc: Michael Jamet <michael.jamet@intel.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Aapo Vienamo <aapo.vienamo@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: debugfs: Use FIELD_GET()
Message-ID: <20240619044118.GE1532424@black.fi.intel.com>
References: <20240617100100.1628147-1-mika.westerberg@linux.intel.com>
 <CA+CmpXsdHVbyp=jb2zfYbUssmNR=W88AN1B=_8H5WJNqeiY4kw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+CmpXsdHVbyp=jb2zfYbUssmNR=W88AN1B=_8H5WJNqeiY4kw@mail.gmail.com>

On Tue, Jun 18, 2024 at 06:11:51PM +0300, Yehezkel Bernat wrote:
> On Mon, Jun 17, 2024 at 1:01 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > From: Aapo Vienamo <aapo.vienamo@linux.intel.com>
> >
> > Use the FIELD_GET() macro instead of open coding the masks and shifts.
> > This makes the code more compact and improves readability as the this
> 
> the this => this, probably?
>
> > avoids the need to wrap excessively long lines.
> >
> 
> Reviewed-by: Yehezkel Bernat <YehezkelShB@gmail.com>

Fixed the typo and applied to thunderbolt.git/next with your tag,
thanks!

