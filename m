Return-Path: <linux-usb+bounces-10726-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DB68D5F57
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2024 12:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E23051F245B6
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2024 10:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E6D1420A8;
	Fri, 31 May 2024 10:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CB4KfDoL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B7F17554
	for <linux-usb@vger.kernel.org>; Fri, 31 May 2024 10:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717150528; cv=none; b=JLjyQ9JcAlLJEWPag3vz4s/aLkKsvOJm2rm4o/SpMJT4QFx+M6Coqehb9RdeDnyXXZ5kImZtHR8qhCm9U6OPhSzc5C7EOdU1375Ck3XfGTZj9C1kXcl8+yaOvAqx+qQcMyFDrhQctvH+mO4alBeii+5g2fxXOzWea4a30gEpyS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717150528; c=relaxed/simple;
	bh=+0/CXgf0E0PyGOLTOBgd9YAb48Ol02z8x1nwgQ0Vnfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJu4xDzFhg2xfw8KzE/3k0q36/AwtOkT4AFMxMwkUyFA3+qfxTFmeynUyPWe0g/HwwiErlERKgsehfXi/9weeNs0HFcq9943scE9ppmLJ/cUkfJNBskLsEdC2KRY7QW3Np/HKdvS94lCvojwp86JIuKnz5SHa2AZVdDhGd2T1SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CB4KfDoL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717150527; x=1748686527;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+0/CXgf0E0PyGOLTOBgd9YAb48Ol02z8x1nwgQ0Vnfw=;
  b=CB4KfDoLBTHVOybt9IBUrRYbZS5e243Tlajv7YHi525FlkrMKanTV6Ig
   6eK5Ztn/Ea/pTcnsl1mwH53IWHCJh8fX+pSshpahWEJDi9iul7Uzu3kJ8
   z0ebFvbb+9+8wHv+uzNkR7h9HfB0RH8TKXwAjy+gAaxzdNBFjLGrH8PaG
   iDAn6n3VkHEfZzNhHfVveVbg0TVy/ZJ/e1HCK2wPPHm+zjiISOS9vewex
   1/QiVdo0+uJFLJ6dIyJGSDy9i2VI9gffJh7lI3iLJTE3zVlcqohvTfTou
   iYB8vXFiG83J/3xg1E2b4hVkYCN2HEXjr+i2nsrugljwljo1XST/Mhoyn
   Q==;
X-CSE-ConnectionGUID: mHTeoYjySDefem/NKcjoFg==
X-CSE-MsgGUID: o4Vj2mGqSLey5MYNb5R1Xw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24249629"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="24249629"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 03:15:26 -0700
X-CSE-ConnectionGUID: w2AYfrrESDubqkLH5txezA==
X-CSE-MsgGUID: JLl599JQTZmO4VNjsrPWxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="36055105"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 31 May 2024 03:15:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 0C5341A3; Fri, 31 May 2024 13:15:22 +0300 (EEST)
Date: Fri, 31 May 2024 13:15:22 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Aapo Vienamo <aapo.vienamo@linux.intel.com>
Subject: Re: [PATCH] thunderbolt: debugfs: Fix margin debugfs node creation
 condition
Message-ID: <20240531101522.GB1421138@black.fi.intel.com>
References: <20240529123647.1051160-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240529123647.1051160-1-mika.westerberg@linux.intel.com>

On Wed, May 29, 2024 at 03:36:47PM +0300, Mika Westerberg wrote:
> From: Aapo Vienamo <aapo.vienamo@linux.intel.com>
> 
> The margin debugfs node controls the "Enable Margin Test" field of the
> lane margining operations. This field selects between either low or high
> voltage margin values for voltage margin test or left or right timing
> margin values for timing margin test.
> 
> According to the USB4 specification, whether or not the "Enable Margin
> Test" control applies, depends on the values of the "Independent
> High/Low Voltage Margin" or "Independent Left/Right Timing Margin"
> capability fields for voltage and timing margin tests respectively. The
> pre-existing condition enabled the debugfs node also in the case where
> both low/high or left/right margins are returned, which is incorrect.
> This change only enables the debugfs node in question, if the specific
> required capability values are met.
> 
> Signed-off-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
> Fixes: d0f1e0c2a699 ("thunderbolt: Add support for receiver lane margining")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/fixes.

