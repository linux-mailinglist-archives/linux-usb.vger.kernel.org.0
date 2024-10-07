Return-Path: <linux-usb+bounces-15796-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E73992708
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 10:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAADD1C224E1
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 08:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2C718B49B;
	Mon,  7 Oct 2024 08:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zmb+JFKl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF61E189BAA
	for <linux-usb@vger.kernel.org>; Mon,  7 Oct 2024 08:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728289996; cv=none; b=Zg9QiLYsHm02Llmy0pfxY5z2Qnxyi223Sveb8/kse+U+6gWx9jTvMmMFOsYbnILS4UMpass2bMXqD9Rpk6YmDz/jpxWbRoTS0YUPcE9bSW6DViawXOBr7PM3sE1bnB8ZnGOARBLJAMoFi8ShNe4nWGffDx0otFnjj328TT983No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728289996; c=relaxed/simple;
	bh=uOochachISimjQ39OOWUzc9V/CCdGqt8u0xJZpbV59w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dN97lCGi5Orgroj5VZFy9+Ey4VLE1P9gNrpixgJs5GWZU3LENrfqv6C0KbtHbdP6GFjxYwIDaQhNoj6vog3KjTzlslSAiEwsydQqvJWcTGmQamlNAGM/YNuC5Z3jkl9h8eYlKJzebjo+IBKiPtV53q330YGby+wYKGkPQv5fj1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zmb+JFKl; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728289994; x=1759825994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uOochachISimjQ39OOWUzc9V/CCdGqt8u0xJZpbV59w=;
  b=Zmb+JFKl5XfOubYLmVCIKkbTCfCF+9uAGDChTJ7wusHqbJs3EWNATpfj
   TPLzHCoMJwzGXU9je3tKzkHQXZpqnhyrEesl5aANzA69ZQ1UN6AxoqVJ2
   CREYtZgCDe4CY8y9/SvAgy2EMlqus+IyjOIDqYzcol/LME9dKSu4xRQBt
   CxJrgraas3kCNDcidQsG0dDaECh05WtDkalfn5KTvUKOLc4kBVpzbX+5o
   xwXV0phPR24ks4Iw8EALp5dLxjfh6q10x4KeBrFrD+GRWgU9PMqUAjZIj
   u0luYZGhw4W4aRAKBjxAhG2xAg0LcVEmTdkC2j1tEq3ym+8Mpx+N1u4TD
   A==;
X-CSE-ConnectionGUID: HKIedSDyQ9Ox6ASkZux/RA==
X-CSE-MsgGUID: lURlbljISBu6pL4iV3aDkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="15045552"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="15045552"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 01:33:12 -0700
X-CSE-ConnectionGUID: 24uNg1ZSSiGaBwFSXZK+xQ==
X-CSE-MsgGUID: pL9ZppH1RRiAORRO4c/LkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="75741132"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa010.fm.intel.com with SMTP; 07 Oct 2024 01:33:10 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 07 Oct 2024 11:33:09 +0300
Date: Mon, 7 Oct 2024 11:33:09 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel-dev@igalia.com
Subject: Re: [PATCH] usb: typec: altmode should keep reference to parent
Message-ID: <ZwOcxWOftFJxpMbo@kuha.fi.intel.com>
References: <20241004123738.2964524-1-cascardo@igalia.com>
 <Zv_23J-1U5pZ6rgT@kuha.fi.intel.com>
 <Zv/43ewc3n5aSEUO@quatroqueijos.cascardo.eti.br>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zv/43ewc3n5aSEUO@quatroqueijos.cascardo.eti.br>

Hi,

On Fri, Oct 04, 2024 at 11:17:01AM -0300, Thadeu Lima de Souza Cascardo wrote:
> On Fri, Oct 04, 2024 at 05:08:28PM +0300, Heikki Krogerus wrote:
> > On Fri, Oct 04, 2024 at 09:37:38AM -0300, Thadeu Lima de Souza Cascardo wrote:
> > > The altmode device release refers to its parent device, but without keeping
> > > a reference to it.
> > > 
> > > When registering the altmode, get a reference to the parent and put it in
> > > the release function.
> > > 
> > > Before this fix, when using CONFIG_DEBUG_KOBJECT_RELEASE, we see issues
> > > like this:
> > 
> > Let me study what's going on in the drivers code. The children should
> > _not_ be cleaned first before the parent. I'll have to come back to
> > this on Monday.
> > 
> > This really should not be necessary.
> > 
> 
> Well, they are likely not. But driver core API states that either way, you
> should keep such references. And one way to test it is using
> CONFIG_DEBUG_KOBJECT_RELEASE. That delays the actual release/cleanup of the
> struct device, so:

What I want to understand is, what is the rationale for this behaviour
in the core. If this is something that the drivers can do, then why is
the core not doing it for everything? Why is the core decrementing the
parent reference count already in device_del() instead of
device_release()?

I'm probable missing something, but I really want to understand this.
There are other drivers also need resources from their parent, so if
there is nothing preventing this from being handled in the core, then
that's where it really should be handled.

thanks,

-- 
heikki

