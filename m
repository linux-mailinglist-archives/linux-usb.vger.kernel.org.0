Return-Path: <linux-usb+bounces-15907-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E94996307
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 10:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6897A1F25598
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 08:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98A518EFEB;
	Wed,  9 Oct 2024 08:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aL/aeRHr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF26918E05C
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 08:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728462882; cv=none; b=R2CRYm/di6u0pVbWYEn/A6F+yJUR6Rx0C0UdCF5usK4sapXbf4oXh2PZN+Sj2SOf7Vgtp/wIzDTgUMSjLVvnkLFvuBII68ZF9cSe2XZdBoYRSpV7TruIv80HDfrjJX9phJOHCS82aG4DrPbY8mgAW7m74WZsfXXfdQ80QUt7K54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728462882; c=relaxed/simple;
	bh=VjqjANdnWb9XHbMfVbaIxeA05EVekq4twqSd8NMHtwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INg+te9KRkifvEhUIt30u3hxXHaU7rsymhpWmfOgs+x73h1Q2sFsT2oTjV8R9GfVrH4S8/aK6W1xj2/QdD5yBZhsjdN8s/A0bWMudLPq9ojYpS9oIvsCLQ+2aisxYjskbC/HihNQqL5/Cj6r114+fwfDF+frWC2gCMinh+3Ikro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aL/aeRHr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728462880; x=1759998880;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VjqjANdnWb9XHbMfVbaIxeA05EVekq4twqSd8NMHtwY=;
  b=aL/aeRHrsNTW7yiAF+ttxb6DhP2LAZRw34WYjjlgUlzc0fqP6GCVIH53
   vWDdNdX2RiJJooDlfe3FUGZNAUL4to0e7RJiKG53AHOjco2JlftG9FJx6
   djg0/QECpFCLMxTHt/Vut80DfdRq17t1ooMFAIutblAei0CkB50bAPN1Y
   TgF8xoMP/5O748gz4rrbudI9xf7tecVIdstehzPZGVTnhGGXPqffaBZEJ
   hp4ra4EGPdNukHqZDvgcXJStwE24zhwThy9gruTRSYdiqi6XnLXmpkvBj
   NPMrubLlP2NuxBqP2cP8Y9IsKogGXd1W7EOzibn3y7DnMXtt4W6JIJMkA
   g==;
X-CSE-ConnectionGUID: NnFwPHmmTweP2cnHiqocDw==
X-CSE-MsgGUID: 6voPG2rpSISoMZX7MhVCcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27226809"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="27226809"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 01:34:40 -0700
X-CSE-ConnectionGUID: YrzbEK49QUqmUO1gPdZU9A==
X-CSE-MsgGUID: FoIglA0UT8CeTQuPHPJWsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="76405432"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa006.jf.intel.com with SMTP; 09 Oct 2024 01:34:37 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 09 Oct 2024 11:34:36 +0300
Date: Wed, 9 Oct 2024 11:34:36 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v1 2/4] usb: typec: Add attribute file showing the USB
 Modes of the partner
Message-ID: <ZwZAHE9q9IGYOa80@kuha.fi.intel.com>
References: <20241004140440.1882311-1-heikki.krogerus@linux.intel.com>
 <20241004140440.1882311-3-heikki.krogerus@linux.intel.com>
 <quqy7fpn4e5hrikekfjirnid2joskyezzj72jgfkz2t6th7z7o@tknlic5vlywq>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <quqy7fpn4e5hrikekfjirnid2joskyezzj72jgfkz2t6th7z7o@tknlic5vlywq>

On Sun, Oct 06, 2024 at 07:22:42PM +0300, Dmitry Baryshkov wrote:
> On Fri, Oct 04, 2024 at 05:04:37PM GMT, Heikki Krogerus wrote:
> > This attribute file shows the supported USB modes (USB 2.0,
> > USB 3.0 and USB4) of the partner, and the currently active
> > mode.
> > 
> > The active mode is determined primarily by checking the
> > speed of the enumerated USB device. When USB Power Delivery
> > is supported, the active USB mode should be always the mode
> > that was used with the Enter_USB Message, regardless of the
> > result of the USB enumeration. The port drivers can
> > separately assign the mode with a dedicated API.
> > 
> > If USB Power Delivery Identity is supplied for the partner
> > device, the supported modes are extracted from it.
> > 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >  Documentation/ABI/testing/sysfs-class-typec |  14 +++
> >  drivers/usb/typec/class.c                   | 123 +++++++++++++++++++-
> >  drivers/usb/typec/class.h                   |   2 +
> >  include/linux/usb/typec.h                   |   5 +
> >  4 files changed, 140 insertions(+), 4 deletions(-)
> 
> I think the use of port->usbN_dev is racy and not always obviouos.
> For example  on Qualcomm devices I ended up with no partner's
> usb_capability and just 'usb2' in usb_mode even though the partner uses
> USB3 mode. Maybe it's better to hide usb_mode completely if we can not
> properly determine the actual mode?
> 
> (On Qualcomm devices there is no working ACPI, so there is no USB <->
> typec correlationship (yet)).

Sure. Let's keep it hidden in that case.

thanks,

-- 
heikki

