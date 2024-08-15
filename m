Return-Path: <linux-usb+bounces-13520-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD6E9536B0
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 17:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5369B289670
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 15:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C5D1A76AE;
	Thu, 15 Aug 2024 15:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MwAEr/LM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FAE1A7074
	for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2024 15:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723734536; cv=none; b=UsNMPF2leG8KP4g+2whXOtNb2Q/VXvvdHMVK9j25qJrcb8bCsxkDA276CZfwGlI54speL2k/EDi7oiCmbQtsvbjJVOLmLTlngQq6fh2wXC4/L/YSNfkT1t3WJ8uhlHHOHe9a99Up1/WEJvgHYPmzkJ08D0bkJkuWTbC4hmJ6jYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723734536; c=relaxed/simple;
	bh=bO79pNeLJptlTpK5A6lz7MHn5iirBHImT5/8NA3yMzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMtZrHmbt9SLq3QiI0HXA9sYM1lRPi1LSIgMfN0/Ncq/SLXIePkqVwdBoJI1vP9frhWhmcPhOYTnhZ3xxbVhn6YyphiuSdYEaXUQVj8Kc7PoTPEtl7F+vMzL2T9mxPC1p4A6cKrtV1BAartjHSZ0cQIs/BJ96hNxcctnw5gxVBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MwAEr/LM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723734535; x=1755270535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bO79pNeLJptlTpK5A6lz7MHn5iirBHImT5/8NA3yMzE=;
  b=MwAEr/LMDvvte1OraxVAFIPllImU8+EwVFJ3fA7Cxf43m3qP5NM0iTPp
   W8Rba+PFlqJa/Wgypkvz02WKp2Y8EaAoZGXx2Vx32xKQG8n9A/w83Bck2
   kXs/RQBu+ScL4pREAvO8OQDVtt+wjTEg5AoCp9DzGsHDAFYDrMvh6TJK5
   xiK2ARqIiDdkAjHdfR7q5ylqa6dzIZbDpn5+GnqWqa8KqEhefuoh2ARcZ
   JhQpYQgcN6sw1F5Tf5vitxLU8zC6pd5AWUNHCAjgaKIS6iLc4HDZWpdY0
   NL9s+p1PxTmjqJ8YxPqzU9jelcS8tFFENswHgYZqinAZCsB8F8B7lfkHj
   Q==;
X-CSE-ConnectionGUID: TLeMOpjhTSOwhksYK6ClVw==
X-CSE-MsgGUID: XYbI12xbRDuCrYKIn4zINg==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="47402756"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="47402756"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 08:08:37 -0700
X-CSE-ConnectionGUID: 8+gjqq5yRbmV4TqX1k7DUg==
X-CSE-MsgGUID: gAeUuU/UQLmPmlsSSB0zow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="59339935"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orviesa009.jf.intel.com with SMTP; 15 Aug 2024 08:08:29 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 15 Aug 2024 18:08:27 +0300
Date: Thu, 15 Aug 2024 18:08:27 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Benson Leung <bleung@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jameson Thies <jthies@google.com>,
	Prashant Malani <pmalani@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-usb@vger.kernel.org,
	Abhishek Pandit-Subedi <abhishekpandit@google.com>,
	Bartosz Szpila <bszpila@google.com>
Subject: Re: [PATCH 0/5] usb: typec: ucsi: Minor improvements
Message-ID: <Zr4Z6/RpMtLcbR5h@kuha.fi.intel.com>
References: <20240815085726.2865482-1-heikki.krogerus@linux.intel.com>
 <Zr4V13mBemOZz2rU@kuha.fi.intel.com>
 <CANLzEktGqa4SNkG=ZJHHaeQLH54wvJm0OAKaECmBE658+p19Vg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANLzEktGqa4SNkG=ZJHHaeQLH54wvJm0OAKaECmBE658+p19Vg@mail.gmail.com>

On Thu, Aug 15, 2024 at 07:59:31AM -0700, Benson Leung wrote:
> Hi Heikki,
> 
> 
> On Thu, Aug 15, 2024 at 7:51 AM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > On Thu, Aug 15, 2024 at 11:57:21AM +0300, Heikki Krogerus wrote:
> > > Hi,
> > >
> > > The two first patches prevent potential issues. The rest are just
> > > cleanups - removing duplicated or otherwise useless code.
> > >
> > > James, can you test these? I'm changing the handling of the identity
> > > discovery in patch 3/5. It would be great if you (or somebody else)
> > > could confirm that it continues to work as expected.
> > >
> > > thanks,
> > >
> > > Heikki Krogerus (5):
> > >   usb: typec: ucsi: Don't truncate the reads
> > >   usb: typec: ucsi: Only assign the identity structure if the PPM
> > >     supports it
> > >   usb: typec: ucsi: Common function for the GET_PD_MESSAGE command
> > >   usb: typec: ucsi: Call CANCEL from single location
> > >   usb: typec: ucsi: Remove useless error check from ucsi_read_error()
> > >
> > >  drivers/usb/typec/ucsi/ucsi.c | 126 ++++++++++------------------------
> > >  drivers/usb/typec/ucsi/ucsi.h |  14 +---
> > >  2 files changed, 39 insertions(+), 101 deletions(-)
> >
> > These are in wrong order. They break bisectability. I'll prepare v2.
> 
> Can you please cc +Abhishek Pandit-Subedi <abhishekpandit@google.com>
> and +Bartosz Szpila  <bszpila@google.com> on v2?
> 
> They're also working on UCSI and can help too.

Sure thing. I'll prepare new version tomorrow and CC you guys.

Br,

-- 
heikki

