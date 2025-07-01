Return-Path: <linux-usb+bounces-25341-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8C5AEF1A5
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 10:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59CAC7A63E7
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 08:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06EEB220F36;
	Tue,  1 Jul 2025 08:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KHKo/dIu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8DF1F09A8
	for <linux-usb@vger.kernel.org>; Tue,  1 Jul 2025 08:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359615; cv=none; b=You+rDCx3+aE5nVTxKUhId+QOruoJqLBEN55XvZv1+4A9OqtapK0YTvvA8DSzXiWoXq7Harmp0zo8Wggq2NFqh2pNszCa2m3pN/Kkrd/M6+9fofTJXf+EuQ/vwKpwKmgjdjc3HOo790DWLk2ch1BmX605wSHiwVBWD6+lSAv+zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359615; c=relaxed/simple;
	bh=A908LYKMmcYjZlUcu3kIUELgzwJf9sMXe8cUrJFgVBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1MwON+qm5/+hLfB/paaaRDhns8UoU52W23TywvQPC9/vpffhBONI83LZp4Hbkq8LQ1L1ssKliHaNr/URCKxtMn9Q5CYFm/ni7JbzbLETPicdPFbStbNNGQhGw6Xh8d4u6mlwgJfpzyJRkXxtLpf2GFzyPg8jH48C2KwibTy3Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KHKo/dIu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751359613; x=1782895613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A908LYKMmcYjZlUcu3kIUELgzwJf9sMXe8cUrJFgVBk=;
  b=KHKo/dIuQHtmpamEn42oESs2wU+L4XccqHXYL0pvq2yqAkQ1NFpmh6jR
   nNPlQPvABgVdPUClle1vl5ZKizmeo91BJkfujzcszcOnZPBBQGSu8/fCK
   pgwMY2tgqqfCcvCZhGsdoPTb4vzHZ/uV3yy9TKSQXxruj5c67uZywAh2T
   +603lmEi/sf3n7iZ5o68oFVSjwLtLz65AQbVPazf04nqIAjexJ9/GapxK
   G6XZH9d8lT/UyWfkW0NiZuymv1k0u8EllYg3xOOSETV2xqOmLpLKlv+d9
   ieZ24l/eMYH+E7IURxn2FYsRRR60cB4+QT51Fv2ZIfHRgWCEE97N9yYWt
   Q==;
X-CSE-ConnectionGUID: X6yDoUUlRMOMU0wNPj2f9g==
X-CSE-MsgGUID: AFwDTf7NQbSKG1iTsrZsGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53719086"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53719086"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 01:46:52 -0700
X-CSE-ConnectionGUID: 32b2FYTLTfaauCBOWAztAA==
X-CSE-MsgGUID: lLWjuR2CTS2AUhv4b7K1sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153870636"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa007.jf.intel.com with SMTP; 01 Jul 2025 01:46:50 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 01 Jul 2025 11:46:49 +0300
Date: Tue, 1 Jul 2025 11:46:49 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Pooja Katiyar <pooja.katiyar@intel.com>, linux-usb@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v2 1/3] usb: typec: ucsi: Add support for message out
 data structure
Message-ID: <aGOgeSIOK-nDRGHB@kuha.fi.intel.com>
References: <cover.1751042810.git.pooja.katiyar@intel.com>
 <cc0b7701c4ea3d1001fefeb3df65caeb3e624722.1751042810.git.pooja.katiyar@intel.com>
 <2025062813-untying-hesitancy-088a@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025062813-untying-hesitancy-088a@gregkh>

Hi,

On Sat, Jun 28, 2025 at 04:51:56PM +0200, Greg KH wrote:
> On Fri, Jun 27, 2025 at 11:10:10AM -0700, Pooja Katiyar wrote:
> > Add support for updating message out data structure for UCSI ACPI
> > interface for UCSI 2.1 and UCSI 3.0 commands such as Set PDOs and
> > LPM Firmware Update.
> > 
> > Additionally, update ucsi_send_command to accept message_out data
> > and .sync_control function to pass message_out data to
> > write_message_out function if the command is UCSI_SET_PDOS.
> 
> Normally when you say "additionally" that implies that the patch should
> be split up into pieces.  Why not do that here?
> 
> And do you _really_ need to add a new parameter to all of these
> functions?  It's now getting even worse, look at this:
> 
> >  		ret = ucsi_send_command(ucsi, val,
> >  					&ucsi->debugfs->response,
> > -					sizeof(ucsi->debugfs->response));
> > +					sizeof(ucsi->debugfs->response), NULL);
> 
> You can kind of guess what the parameters mean before the NULL change,
> but now you have to go look up "what is the last pointer for"
> everywhere.
> 
> This feels very fragile and horrible to maintain over time, please
> reconsider this type of api change.

So I think what Pooja was proposing in the first version of this
series, where you had a dedicated function for filling the
message_out, was better after all.

Pooja, I'm really sorry about this, but can you revert back to that,
and send it as v3? Let's start over.

thanks,

-- 
heikki

