Return-Path: <linux-usb+bounces-22908-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8555A8448E
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 15:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76DBD4C5D0C
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 13:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2919A284B48;
	Thu, 10 Apr 2025 13:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBh8u9al"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C78F1372
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 13:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290837; cv=none; b=laiwEkadQqUqQix2IoSkGMGKe/dJ212n19QNS1FT44CYlzi/5U2R+d3+eNo/yWzoDI1WAgTUQKlSjooUCBU57s3N66qhalNleEpB9mEGIRuFV101YwZEBTo7mbrXC7BsFbw1/hoj8VjMig19TJe/x1mNJXC42Q5QN0tqhDbY9q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290837; c=relaxed/simple;
	bh=SPqi+iWlhqf9iKZVB3/qQnSMZgQ044lW7nntsmN1kuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Abn9rhyab34GQYJFWofieTwSYIJzdgjn+HkbXNnL/s6OBbkJuhb4/GkkiDnH85/t8mZNwGImezQ/JsTWzdPZuMHBMynZaDUcV9yCHz2zSRePj9sfi57VbSuYsIpdQv8lAo13ynfDAJvu9SHhh7Vn54i/LQzjmpn1nHWyhUhM+CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBh8u9al; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744290836; x=1775826836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SPqi+iWlhqf9iKZVB3/qQnSMZgQ044lW7nntsmN1kuQ=;
  b=dBh8u9allK+WwMQqWq2aTCi+7I+pZV/JX6yxJlvHofGWfPi5gCftKNru
   ygmoWXiy4hZpKsWaQ1oxSayDzsjAkWkJtROdYAazI/xtiPQZc0FO+C/NN
   hN/I4AmF/yvFaQaM/xQTOPJQUglIfFDTNOTZMPmCueQCvItBN71MsvDnO
   bbg6osH4Ydpo4V30kR1fMRaAW00+6gdw998MPrLbN1J1NKqaZr6IBUYvj
   7pwXlKga+SblPtqSb/bPlBId3jNFDebx5wREvdPc+RoN7PLuIHjP4CGFc
   55B7HjRHl3c7B9irwdm3dsgjbC05vP5M/HDHP+oUoLGgSS/ysEkjSEC6P
   w==;
X-CSE-ConnectionGUID: 4ZsMNMQdRtaHy6JBLVgPiQ==
X-CSE-MsgGUID: 0JLFDwOzT12nCi5iZWMo6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56447082"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="56447082"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 06:13:54 -0700
X-CSE-ConnectionGUID: YY3aNKlqTVmkQczp3idu7g==
X-CSE-MsgGUID: kWzB0SywR06mK41JmAa8aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="128767818"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 10 Apr 2025 06:13:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 689B620B; Thu, 10 Apr 2025 16:13:50 +0300 (EEST)
Date: Thu, 10 Apr 2025 16:13:50 +0300
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
Message-ID: <20250410131350.GW3152277@black.fi.intel.com>
References: <20250410125600.3074417-1-mika.westerberg@linux.intel.com>
 <20250410125600.3074417-3-mika.westerberg@linux.intel.com>
 <2025041035-jailbird-washed-c866@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2025041035-jailbird-washed-c866@gregkh>

On Thu, Apr 10, 2025 at 03:01:54PM +0200, Greg KH wrote:
> On Thu, Apr 10, 2025 at 03:55:59PM +0300, Mika Westerberg wrote:
> > From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> > 
> > This adds notification whenever software connection manager activates,
> > changes or deactivates a tunnel, and also if there is limitation in
> > bandwidth.
> > 
> > The notification looks like below:
> > 
> >   TUNNEL_EVENT=activated|changed|deactivated|low bandwidth|
> >   	       insufficient bandwidth
> >   TUNNEL_DETAILS=0:12 <-> 1:20 (USB3)
> > 
> > Userspace can then listen these and inform user if needed. For example
> > if there is not enough bandwidth, it can show warning dialog to the user.
> > 
> > Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> 
> You didn't sign off on this?  :(

Oops, sorry missed it completely. I'll fix this in v2.

> Also, you are adding a new user/kernel api here, where is it documented?

Hm, where uevent documentation lives? I know for sysfs is under
Documentation/ABI/* but not sure for uevents.

