Return-Path: <linux-usb+bounces-24165-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF49ABF2F7
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 13:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6B258C0ACC
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 11:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A598525EF8B;
	Wed, 21 May 2025 11:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q3fsLOYy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B216E262FC3
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 11:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747827411; cv=none; b=Afuhsb6N0vDe1/1K82PD9UMqCHmyJMmEbfGGthN/7WQyxsdVvreGZBZHi6RnrqeSkWEzEaVUM0TTnYDE8h7Qwx7w+bEFUdPDXtxstd79oC4YD5blDgf3/v9KABrLEbr9cODxJkVgfqDlFNXfceoKhFHsCLCk4UXYedtnS5/FdNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747827411; c=relaxed/simple;
	bh=fcXgeC+r3iIbjsAW0kESyJagNBWSYRUmV9AgVW8ceDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C35jm9DQRfKJJqAEtLeYoz/0wJD6Kmj3P1NEWLvnSBEjxx521GWoRtN+wRgO1UWjVGwrEtj64deh2NhoihACCCKLpW90Waunit46rYms1I5B/Zr24z1rZBm02YxC+0e8h+uP5C2bVkKVdQpuV+ZWC4b1ndewvuVNK+KnlEuf4JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q3fsLOYy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747827409; x=1779363409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fcXgeC+r3iIbjsAW0kESyJagNBWSYRUmV9AgVW8ceDU=;
  b=Q3fsLOYyUsgq75PW0lB0P6Z9Nk+z3S/CYrV1cqYd2oIqOaAYSasdVOkf
   HaGUIPYbk1jNNl1xcQ5JkdBuZFYmBxQrkqQPXE6zPEIKQefz/nCi4Y+xg
   gWTYRB1+X9IJhgIYtx/u1UHlCnvvQZioAp1LJkoVOKI+W9quAeD4U45YV
   eZYElE2kZFm418UA7pzaO5Bnd8wJDVe3FntPfooxpxfzkpIbqmvbiMwoq
   oHl6bE/wnFx56jGeirnsCLww3fNQsF3jdCKXbLlvvcMa+huNt87WLIdo7
   9gl9A1dNHtuIg1abAw45QmmPExfFS7FFfaoZhs+1JZGki98JocNloGWN6
   w==;
X-CSE-ConnectionGUID: DzFmJ/FKRM6JVcXGJyNccA==
X-CSE-MsgGUID: Qo4u7qWiQsSr+7y1GONE3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="53607827"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="53607827"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 04:36:49 -0700
X-CSE-ConnectionGUID: /QS9LsPMReu+Kbow8eAQag==
X-CSE-MsgGUID: yJspxjYPRU25hrLWLf/uxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="141093043"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 21 May 2025 04:36:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 39933376; Wed, 21 May 2025 14:36:46 +0300 (EEST)
Date: Wed, 21 May 2025 14:36:46 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fix for v6.15-rc7
Message-ID: <20250521113646.GI88033@black.fi.intel.com>
References: <20250513145638.GM88033@black.fi.intel.com>
 <2025052127-supermom-radish-5b37@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2025052127-supermom-radish-5b37@gregkh>

On Wed, May 21, 2025 at 12:28:04PM +0200, Greg Kroah-Hartman wrote:
> On Tue, May 13, 2025 at 05:56:38PM +0300, Mika Westerberg wrote:
> > Hi Greg,
> > 
> > The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:
> > 
> >   Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.15-rc7
> > 
> > for you to fetch changes up to 0f73628e9da1ee39daf5f188190cdbaee5e0c98c:
> > 
> >   thunderbolt: Do not double dequeue a configuration request (2025-05-09 12:14:25 +0300)
> 
> It's too late for my branch to get stuff into -final, sorry, I was
> traveling last week.  I'll take this now and get it into -rc1 and then
> backport to the needed stable trees.

Sure, thanks!

