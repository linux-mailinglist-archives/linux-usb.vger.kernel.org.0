Return-Path: <linux-usb+bounces-13848-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 596F495AC9B
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 06:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13155283661
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 04:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9EE3AC0D;
	Thu, 22 Aug 2024 04:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bfgKqCmW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA168249F5
	for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2024 04:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724301295; cv=none; b=u1U+X0AMqWSTzxGmvwusbUnn4V1R5QtmQZyi93o1ZKrFbuNu1DoOS3rH9ovOAL+APc824R9FaJ4f+wI3W3ksLwV8OPDZgDyTl60PIDzO6+I3gY+4O61BunuDwOPW9R/NYio1W6XauAG7UQyjFna+lYUZQcQoIRE6F+qSgeNp/ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724301295; c=relaxed/simple;
	bh=GXgUa7k6IcQXd7FonEUtvXuF8vh5kAxjnsAnnsC9oS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gp0NhLpvKieiNuhPOqSkoGQFDA4B6YxGheg/4hT90jmp5hgHylOXIJkOyTX4I86+BGgkQnteJe6bP/may8DbfKhi8xJ4IWgOzN6wOM1ts6rYFJbCxQvllidONg/iI53HFOVeXIy1ciUkPrddAypuIxExM5OBfbrLcRcC2vTBCCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bfgKqCmW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724301294; x=1755837294;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GXgUa7k6IcQXd7FonEUtvXuF8vh5kAxjnsAnnsC9oS8=;
  b=bfgKqCmW0AiqSM/7XzSsWksCwvBBFUuggaHDS2b0zTHje+qKUd/2N9gX
   hU6wbV2wq/ykxYsgUn85s0kPdLrgQ0NtxefRi+pMPF2wPltG8YkkC30Gk
   nZzSRlLUXI0/yV/2s1LO4qISN9WJtKAmZSVmmtpoN2pAfVm70s7s76YkO
   BnAkGF/RLWmZcS8yOpZDcEQTnZmvbm3ws0TledpGvcD2sjQWnNt3VAGOm
   RHOozChi/6G5XHxFxJjdNrlTfSFqobhR7JrN2jzXmQ7b4ikOszWw5pS+q
   iPGSPJ4d+CtmoeLawWS1XUxO7+nleYNzCvbLEwX2DlCHocis0H296b/tK
   A==;
X-CSE-ConnectionGUID: Iy3gmEHXSfmTDFyTtKjgfg==
X-CSE-MsgGUID: DMh0uj+sQDuSpzP+bZK8sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22847759"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="22847759"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 21:34:53 -0700
X-CSE-ConnectionGUID: xfySZffFR7aof4YZYNDFvA==
X-CSE-MsgGUID: RtwkzWdCS+m7fBQX7xEwEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="98812342"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 21 Aug 2024 21:34:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 550CC268; Thu, 22 Aug 2024 07:34:49 +0300 (EEST)
Date: Thu, 22 Aug 2024 07:34:49 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org, Aapo Vienamo <aapo.vienamo@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	R Kannappan <r.kannappan@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2 0/4] thunderbolt: Improve software receiver lane
 margining
Message-ID: <20240822043449.GH1532424@black.fi.intel.com>
References: <20240819114054.4139941-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819114054.4139941-1-mika.westerberg@linux.intel.com>

On Mon, Aug 19, 2024 at 02:40:50PM +0300, Mika Westerberg wrote:
> Hi all,
> 
> This series improves the software receiver lane margining support in
> debugfs so that it should be more usable now.
> 
> Changes from the previous version:
> 
>   - Initialize 'errors' in margining_run_sw() as pointed out by Dan
>     Carpenter.
> 
> Previous version of the patch can be found:
> 
>   https://lore.kernel.org/linux-usb/20240813110135.2178900-2-mika.westerberg@linux.intel.com/
> 
> Aapo Vienamo (1):
>   thunderbolt: Add missing usb4_port_sb_read() to usb4_port_sw_margin()
> 
> R Kannappan (1):
>   thunderbolt: Improve software receiver lane margining
> 
> Rene Sapiens (2):
>   thunderbolt: Consolidate margining parameters into a structure
>   thunderbolt: Add optional voltage offset range for receiver lane margining

Applied to thunderbolt.git/next.

