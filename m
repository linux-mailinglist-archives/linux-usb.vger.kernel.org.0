Return-Path: <linux-usb+bounces-21278-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBC0A4C2AE
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 15:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8066B7AA1D7
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 14:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52C2212B2B;
	Mon,  3 Mar 2025 14:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MsezEC15"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BD41F4183
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 14:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741010530; cv=none; b=Fw1B0fwuLc5uspTQgwKV3bD6TNz5PfjkFLmWmWUGazzGmlCqnB3oxAKvAd6QUHIIHDAlnM0+vtCRI70/J5znkk9LGjxGxmiqZxQibVxGv1j9S3pKkD2w1elKBfxDoiBMrHcxl7zLsUlIi48dLa5DFr8KGrmlcXTndnMwi68NoR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741010530; c=relaxed/simple;
	bh=Jufy7M4Kztcpw5rJP6Hlxdy24/cw9McZr0Hv/YnG6E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOP3L7znVIWk2oXjppsZpaHTwq44/cpRVgrHXFUeDTfWVvDBSxBhSlKcejS7kg9O0ispdC70R770A0bdAmGfPqss2eP+3d9P7lEJ+CpknsdgzEIi/J1htcuZtXFWTsZUS0NCYMu4DzQoXMMUp8Jcc2WZrhug4IegTknTbx1gWg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MsezEC15; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741010529; x=1772546529;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jufy7M4Kztcpw5rJP6Hlxdy24/cw9McZr0Hv/YnG6E0=;
  b=MsezEC15kqSk2LX9z98iGD5owAw0kjL8bMzbHr36uJuuSEvd2ead4KUB
   LwkHCI+xjS8rhhs3KC8ZI6Vtp7LyDKHUVDyg6iQPWBXZdAmBcMOQZXT2O
   6qU9nVSX0phnwPSrihm0/AhYqd5BQlKbt0MvT/DquMSoBeWoUn3xS4uI0
   ysCwfx5bieweRfv+FGKVr+yjcRQtpg14TTiEYCz6zCJec7wn2leHh5Ei+
   eZvVKblxrrNyjpaXzed3sALseoywmij3hpUUbKK5cJkCD43xHNajonT4w
   Lag1FfijzXUUiZTePmVOXKo9WqZRxEKZ2wuOtigkC+BFEvEH8OFzUU0lY
   w==;
X-CSE-ConnectionGUID: x1+VXWp8TCW7m0SbTjlEuQ==
X-CSE-MsgGUID: hRCABhhCTXWxcoi8HO2IyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52863394"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="52863394"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 06:02:00 -0800
X-CSE-ConnectionGUID: ht2MA6fsTxysszBXSIYWZw==
X-CSE-MsgGUID: 4KP6+ftNQdCgMqoPk4Pw9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123235261"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 03 Mar 2025 06:01:58 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 115C7151; Mon, 03 Mar 2025 16:01:56 +0200 (EET)
Date: Mon, 3 Mar 2025 16:01:56 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kenneth Crudup <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
Message-ID: <20250303140156.GY3713119@black.fi.intel.com>
References: <f31309e4-6ce5-48cf-910e-cd74f818aac8@panix.com>
 <20250303112149.GS3713119@black.fi.intel.com>
 <d56fcd99-433e-4670-8388-7035812a78d9@panix.com>
 <20250303115329.GT3713119@black.fi.intel.com>
 <68cec31a-0132-43bd-8a61-29e0ac23b326@panix.com>
 <20250303131359.GV3713119@black.fi.intel.com>
 <744090aa-074e-443f-8a94-567dadff4c7d@panix.com>
 <20250303132327.GW3713119@black.fi.intel.com>
 <20250303134618.GX3713119@black.fi.intel.com>
 <24ef839c-8fa5-4a19-b9c6-0a267aab84f5@panix.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <24ef839c-8fa5-4a19-b9c6-0a267aab84f5@panix.com>

On Mon, Mar 03, 2025 at 05:53:22AM -0800, Kenneth Crudup wrote:
> 
> No failures for you at all? OK. It'll take me a couple of days to do all the
> steps, but I'll get on it and get back to you.
> 
> > "Forget" all devices from boltctl to make sure PCIe is not involved.
> 
> What's this do? And my system recognizes all new TB devices automatically
> (no manual intervention required).

Right it does that if you have screen unlocked.

If you "forget" them then it should in theory at least keep from creating
PCIe tunnels, so keeping them out of the equation (we just want to
concentrate on the TB/DP side here).

Actually if you use GNOME there is a better way, same dialog but switch off

  "Allow direct access to devices such as docks and external GPUs."

this will temporarily stop authorizing PCIe tunnels. You can switch it back
on when you are done reproducing.

