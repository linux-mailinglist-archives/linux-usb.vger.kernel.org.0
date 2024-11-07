Return-Path: <linux-usb+bounces-17299-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 363B69C012A
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 10:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 681241C21496
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 09:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D6F1D5AC7;
	Thu,  7 Nov 2024 09:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ChjdRKp7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2FDBA2D
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 09:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730971968; cv=none; b=J2/ao43lzbrxK6s+K8Sw7E3wEdIRXCZHj6q0e2Bhja2OUkTbLsuN63wZ/elTEjF0EWduPdUfBRh+lXqpVAoxP814X+UIFvvJX3MtH6xCgoZe0A+OujdgW0KTmMEaYkfn+wYHYFmk56w13RPlZsBbJBpzzhnnd4Om6Rus8j/LUEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730971968; c=relaxed/simple;
	bh=YdeRu4qCayTIQe6uoGN8AMHuhaHW4h2jxa50Svo/FK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TI3S2D/XLS6FhAlBP3d00pGYytK0MPZhlT6GBOW0AITzSgskuFpxtOWGxCZq6tD/H9fCEQnyX+3xg2kj6Yua0wjr9l7T/QsHgdDb77lNKd2r85ImJSfaK22eW/ajnt1mJ/7LnhFL1wRnQ7oQROEFxsDkvhrd7A+fvaa+ex89+2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ChjdRKp7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730971967; x=1762507967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YdeRu4qCayTIQe6uoGN8AMHuhaHW4h2jxa50Svo/FK4=;
  b=ChjdRKp7ri1gUfYMIaPV4EK3vaviWvAKWmyGodOZx4mvQ9J6pv8HL4C7
   mltaeN8ASVYfjb/WfzdUsFBUPL2e6Ht/U32VbrzTrn+I/UfwpF+luj13o
   4Ts/HuZT7OZDWaK0vO38s1lmHUk8Uk227oRvjHD0iZOTEVic/Nj02bRAA
   VQlc5vfdYroB3czwRlDXTru/wCHOx0ezh/XATHQgsO+Mu4HPmzrxW+66V
   QjCf5JJYv7OJiBi7jHOAp9xtmHP4ohmDWWqqTVPKj5NYnHg7LLO015ZJW
   IbsWufJBUocEZfgrr/RilkT8VjcABG+CSzN1FYalBBkjxXePNYZWFkv1C
   w==;
X-CSE-ConnectionGUID: U2NAgN6kQuyEf6Fa7sx9BQ==
X-CSE-MsgGUID: XacpBOuvToC+SFjUhRLkvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30965231"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30965231"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 01:32:46 -0800
X-CSE-ConnectionGUID: OnsF47YlSqWDOMmyeLeoqA==
X-CSE-MsgGUID: LlFFZl2gQY2JdmnVzutbdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="122506145"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 01:32:45 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E9C3C11F9BF;
	Thu,  7 Nov 2024 11:32:38 +0200 (EET)
Date: Thu, 7 Nov 2024 09:32:38 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-usb@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v3 1/3] usb: misc: ljca: move usb_autopm_put_interface()
 after wait for response
Message-ID: <ZyyJNneC_jjoJIQw@kekkonen.localdomain>
References: <20241107073718.405208-1-stanislaw.gruszka@linux.intel.com>
 <2024110743-dragonish-jokingly-8459@gregkh>
 <ZyyAZaUNJ0kCEHG7@linux.intel.com>
 <2024110710-duckbill-commodity-d1b5@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024110710-duckbill-commodity-d1b5@gregkh>

Hi Greg,

On Thu, Nov 07, 2024 at 10:03:56AM +0100, Greg KH wrote:
> On Thu, Nov 07, 2024 at 09:55:01AM +0100, Stanislaw Gruszka wrote:
> > On Thu, Nov 07, 2024 at 09:16:01AM +0100, Greg KH wrote:
> > > On Thu, Nov 07, 2024 at 08:37:16AM +0100, Stanislaw Gruszka wrote:
> > > > Do not mark interface as ready to suspend when we are still waiting
> > > > for response messages from the device.
> > > > 
> > > > Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
> > > > Cc: stable@vger.kernel.org
> > > > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > > > Tested-by: Hans de Goede <hdegoede@redhat.com> # ThinkPad X1 Yoga Gen 8, ov2740
> > > > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > > > ---
> > > > v2: fix handing error of usb_autopm_get_interface(),
> > > >     add R-b, T-b tags from Hans
> > > > v3: add A-b tag from Sakari
> > > > 
> > > >  drivers/usb/misc/usb-ljca.c | 12 ++++++------
> > > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > 
> > > For some reason you aren't sending this to the usb maintainer to be
> > > applied, oh well...
> > 
> > Sorry, I thought sending patches to the mailing list is sufficient
> > to get them applied. 
> 
> Please work with the Intel internal group to get their approval and
> review before sending out your next round of patches for this, as they
> know how to catch trivial stuff like this before forcing others to point
> it out :)

Stanislaw's choses recipients are aligned with get_maintainer.pl output,
sauf some who posted occasional cleanups. If that list wasn't correct, then
there's something to fix in MAINTAINERS.

-- 
Kind regards,

Sakari Ailus

