Return-Path: <linux-usb+bounces-8701-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C287D894AF6
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 07:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EA9E2838E8
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 05:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657EC182B3;
	Tue,  2 Apr 2024 05:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cSXg9FSr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4878323D
	for <linux-usb@vger.kernel.org>; Tue,  2 Apr 2024 05:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712037113; cv=none; b=n8QWK8dAlorzY2lLa4iAJDT+k+v1kkA0UNufHx/GiRPtVitJg503AXmAaWEikqIuNnXnELamv4uPxfdntA4vJNeaJdeNUfj/o0mELozhXszZjpqg8WWGr1S0A0Nh8tYlNMsvLXhXh9N7aAkuodOP+se55LVjSRcecurUAsHSNiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712037113; c=relaxed/simple;
	bh=WETY7/ZlAxxB7BFfY1+9JYufAgXSqnIg0N1rknjuYtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpalVis19rZXb0+VkW28M6ZY632NGJwiC3fN+Nx3BZ4cSzjGIi8PgzkjHiAP0kYWa5DF8T+hwIMvLcwv2Qe3aAen9eLynNHja9gr4JSDjZGjKYWbgn2L9FNHcQPEKxyU6kkaWhtBYS+hKu+Ggt7vfoBjm8KjG9RbjPmRmASo4fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cSXg9FSr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712037112; x=1743573112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WETY7/ZlAxxB7BFfY1+9JYufAgXSqnIg0N1rknjuYtU=;
  b=cSXg9FSr00fdvsHZWmzjcvn3NnyJ0fDI9H3VjPmS1beEKiE+8axRqgjv
   lm8rxHA9cxh3Q3dhMBbR1IhxkWr6qzAtPTgSIg4HbNfr7YimThuHX0fEb
   E+s6HZ6aBbh5acyGeVK4TcBS/nkiJWzYABTfcPdqfJaNy71X3D5NRkC+e
   MEswJp4P3kd/EVyuBFHIccYNljUak87ELupvt4OUIn0l4dDaFPS8X460Z
   BmdEi1VKwr6X/iut+zoqhsBWOMdjgR2NJBtwco63c77M0HoWL70dCOsEH
   oHHNwHUfTB6T1AaottDeW/zOshPJMhMstCAHTJF0UbBCIXOdXFhoUmhG1
   g==;
X-CSE-ConnectionGUID: 8ZjZD11jQEGBrOTYQQ4RYw==
X-CSE-MsgGUID: R+UfxJLBS0idNF37c6NZsw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="11004840"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="11004840"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 22:51:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="937082854"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="937082854"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 01 Apr 2024 22:51:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 29D961C5; Tue,  2 Apr 2024 08:51:47 +0300 (EEST)
Date: Tue, 2 Apr 2024 08:51:47 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org, Gil Fine <gil.fine@linux.intel.com>
Subject: Re: [PATCH] thunderbolt: Do not create DisplayPort tunnels on
 adapters of the same router
Message-ID: <20240402055147.GM112498@black.fi.intel.com>
References: <20240327083032.1611284-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240327083032.1611284-1-mika.westerberg@linux.intel.com>

On Wed, Mar 27, 2024 at 10:30:32AM +0200, Mika Westerberg wrote:
> Probably due to a firmware bug Dell TB16 dock announces that one of its
> DisplayPort adapters is actually DP IN. Now this is possible and used
> with some external GPUs but not likely in this case as we are dealing
> with a dock. Anyways the problem is that the driver tries to create a
> DisplayPort tunnel between adapters of the same router which then shows
> to user that there is no picture on the display (because there are no
> available DP OUT adapters on the dock anymore).
> 
> Fix this by not creating DisplayPort tunnels between adapters that are
> on the same router.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10265
> Fixes: 274baf695b08 ("thunderbolt: Add DP IN added last in the head of the list of DP resources")
> Cc: Gil Fine <gil.fine@linux.intel.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to fixes.

