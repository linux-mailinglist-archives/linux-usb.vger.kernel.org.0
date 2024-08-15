Return-Path: <linux-usb+bounces-13518-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E8707953640
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 16:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 886E5B237C4
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 14:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D725B1A01B6;
	Thu, 15 Aug 2024 14:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6SDnmaE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8721AC8BE
	for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2024 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723733487; cv=none; b=jVeWOEefC2CtGoMH7Ok8YWjiJMGsNAJ2f5xfXhZHEIPBgtFVcsnhKuOz8ifTSaenCvAcuScBtNQjirrT6qJnEUZgT7BaYctOb0GODSkREV2noqU68qoi+/EA6t907q3XP/H1QTz9ufS3Mbdargm+BEHQjALdDNRJxWaTJB0+tK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723733487; c=relaxed/simple;
	bh=wOJ4fdL1yxQ/hsrG00nhDaep8bVQ9Oyj88x+6CUjMdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNl2nOlOUNgGasiX8WIM43Zk8dBh9+2r5zK6MrsFW0WVUBZjgefBfXGM6deHdxIg7M4NsdFBqQ0JCz7I4V2q9paFdjCfSilCQa49jBE9TeDMnHWH93paebKbr7ytnHPzVZJK89eYBMDhihqKVaatJ4/H2RCHHGOrt3LpeKyk73U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6SDnmaE; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723733486; x=1755269486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wOJ4fdL1yxQ/hsrG00nhDaep8bVQ9Oyj88x+6CUjMdE=;
  b=a6SDnmaEEsFqPQN3Lec4CmbrLnC4YchfK3fUIWwyyYaafjDt8i1pfQTH
   1Celwcz4XUAktQ6kXVOSZaka1KPxJzJcFaVfqsgvRsx4eK9rFZjPDF2RB
   HxYtOL4GWGq1y+ZtBrWeqmgivW/Uk0VVHcLb9shdigzVE+5GIIf2m+NgV
   LzxQSBV1iFZeoTV6FhvlUtE6hhJjAldOqDEWouO14bAWtAOaM3DDpxDKL
   cUnl20mjyMJZo2SU9x4xUkzLjkEAR+TxnAMUfDnht87jp1fGwmKL689IM
   nzG2awhrdFIesvJkixuBHZn4hUykk1L8vblWfez824PvEw8uMpvRbNcB1
   Q==;
X-CSE-ConnectionGUID: nPUSWKhaSTevN95eqOBTSA==
X-CSE-MsgGUID: 3WLfkw+HTx+Ldrj6mxN7Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22142159"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="22142159"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 07:51:08 -0700
X-CSE-ConnectionGUID: h+wqZCvDQ8O4J+bkOPd99Q==
X-CSE-MsgGUID: t8IkX5T6TAyLBEdax0CSiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="90159410"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmviesa001.fm.intel.com with SMTP; 15 Aug 2024 07:51:04 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 15 Aug 2024 17:51:03 +0300
Date: Thu, 15 Aug 2024 17:51:03 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/5] usb: typec: ucsi: Minor improvements
Message-ID: <Zr4V13mBemOZz2rU@kuha.fi.intel.com>
References: <20240815085726.2865482-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240815085726.2865482-1-heikki.krogerus@linux.intel.com>

On Thu, Aug 15, 2024 at 11:57:21AM +0300, Heikki Krogerus wrote:
> Hi,
> 
> The two first patches prevent potential issues. The rest are just
> cleanups - removing duplicated or otherwise useless code.
> 
> James, can you test these? I'm changing the handling of the identity
> discovery in patch 3/5. It would be great if you (or somebody else)
> could confirm that it continues to work as expected.
> 
> thanks,
> 
> Heikki Krogerus (5):
>   usb: typec: ucsi: Don't truncate the reads
>   usb: typec: ucsi: Only assign the identity structure if the PPM
>     supports it
>   usb: typec: ucsi: Common function for the GET_PD_MESSAGE command
>   usb: typec: ucsi: Call CANCEL from single location
>   usb: typec: ucsi: Remove useless error check from ucsi_read_error()
> 
>  drivers/usb/typec/ucsi/ucsi.c | 126 ++++++++++------------------------
>  drivers/usb/typec/ucsi/ucsi.h |  14 +---
>  2 files changed, 39 insertions(+), 101 deletions(-)

These are in wrong order. They break bisectability. I'll prepare v2.

thanks,

-- 
heikki

