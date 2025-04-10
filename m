Return-Path: <linux-usb+bounces-22910-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F42A844D3
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 15:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 617623B1B44
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 13:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202B5285412;
	Thu, 10 Apr 2025 13:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKstC8Oe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94901F930
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 13:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291597; cv=none; b=kdC59eDPbdzyXdrcygoK4exGW08P2GCWf3GK44IIgWPnQZ7frvGNeiZBbC9FQPu1N8nH8q8Lhs/6dcLgN/uHGv4L4SvCTzULnjhQh/6x4y/BQkYbxDNZwE6h7lOCgc3wgPt3jxj0Be26rrHORtRzqAflNKtgXALLhKrwPZYobB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291597; c=relaxed/simple;
	bh=E/gRR37cYkD6SXRd/NvT3o0olx3oUy0xmNVb6sd8nZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdHOXqCWr8MV/39E893KeGAkxmlbRKTkMKy8VjfGHyroAquG4tB+b3fMXTeTfiQNREdtqRKLFuIZ5J3Q8WVSsk4l9+CczDZJ7UwM5CcwWo/o+pSUQ2ZO4OPNOkNvIDBeUlqPVv9TaFyFT9a5nK0pkmnMSc8ipTwWUwc3YkpXpvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKstC8Oe; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744291596; x=1775827596;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E/gRR37cYkD6SXRd/NvT3o0olx3oUy0xmNVb6sd8nZM=;
  b=UKstC8OeU9PSwFzxgpz30VIaGjNkIhWPEscxHyKIg5NjrwDl1pF7H53a
   hELET8dHQuc6UBKOS1gnOa1Uiazz2pgvLrmR5RNTmBUGhTTp4zLXuZyDx
   Df98Ig/KJ7rzb3lPhUHkyCMKVbNNjxvt83j94CRHdJ4X0PDqFQk002R+A
   byIY7X/UfZmvuxpTaweK452fbIO1c/jyKDA+UhsEsmkSIYzLeG78ngGyD
   cdkn2/NKvZZVlkra6uj9c8SNgz4tWNbzH2frfugAjlrR6KGOKFayNHDBo
   Y4zNJaU25+HmzgQlQBW8ob8pJYnWx6QeWq6eS6HdkoRKGSQf1Khv0pXVD
   w==;
X-CSE-ConnectionGUID: DasK5HYcREGYBB7Sx0TQgw==
X-CSE-MsgGUID: yXwLXIsuSqSeABorLMXjIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45698094"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45698094"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 06:26:35 -0700
X-CSE-ConnectionGUID: vdi8oAzMQZ6Xw92ijdcgBQ==
X-CSE-MsgGUID: Z1Jyxc0XQN6Lod77ume+KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="129438719"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 10 Apr 2025 06:26:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id BB87117B; Thu, 10 Apr 2025 16:26:31 +0300 (EEST)
Date: Thu, 10 Apr 2025 16:26:31 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Saranya Gopal <saranya.gopal@intel.com>
Subject: Re: [PATCH 2/3] thunderbolt: Notify userspace about software CM
 tunneling events
Message-ID: <20250410132631.GX3152277@black.fi.intel.com>
References: <20250410125600.3074417-1-mika.westerberg@linux.intel.com>
 <20250410125600.3074417-3-mika.westerberg@linux.intel.com>
 <2025041035-jailbird-washed-c866@gregkh>
 <20250410131350.GW3152277@black.fi.intel.com>
 <2025041001-baritone-flaccid-8306@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2025041001-baritone-flaccid-8306@gregkh>

On Thu, Apr 10, 2025 at 03:18:12PM +0200, Greg KH wrote:
> On Thu, Apr 10, 2025 at 04:13:50PM +0300, Mika Westerberg wrote:
> > On Thu, Apr 10, 2025 at 03:01:54PM +0200, Greg KH wrote:
> > > On Thu, Apr 10, 2025 at 03:55:59PM +0300, Mika Westerberg wrote:
> > > > From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> > > > 
> > > > This adds notification whenever software connection manager activates,
> > > > changes or deactivates a tunnel, and also if there is limitation in
> > > > bandwidth.
> > > > 
> > > > The notification looks like below:
> > > > 
> > > >   TUNNEL_EVENT=activated|changed|deactivated|low bandwidth|
> > > >   	       insufficient bandwidth
> > > >   TUNNEL_DETAILS=0:12 <-> 1:20 (USB3)
> > > > 
> > > > Userspace can then listen these and inform user if needed. For example
> > > > if there is not enough bandwidth, it can show warning dialog to the user.
> > > > 
> > > > Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> > > 
> > > You didn't sign off on this?  :(
> > 
> > Oops, sorry missed it completely. I'll fix this in v2.
> > 
> > > Also, you are adding a new user/kernel api here, where is it documented?
> > 
> > Hm, where uevent documentation lives? I know for sysfs is under
> > Documentation/ABI/* but not sure for uevents.
> 
> Maybe in your Documentation/admin-guide/thunderbolt.rst file?

Works for me. We'll add it there. Thanks!

