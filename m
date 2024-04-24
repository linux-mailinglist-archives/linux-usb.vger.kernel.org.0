Return-Path: <linux-usb+bounces-9713-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 013948B0A4D
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 15:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F077B2186D
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 13:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350C415ADBC;
	Wed, 24 Apr 2024 13:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JdmiWux2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D4B15A4B0
	for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 13:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713963733; cv=none; b=d5jYq37jBuRxNGS6fmJtN4DTSh1BZ0a257i4bCElIvKxDC72jlK4z4Je8k/43C5Np2EKuD5Iad/AjCfFJzr3Zolekz6gBlgDy/yGkYFkXlLGhxa64dG94ogDn17XaxcA1CiGJaU+tsfjYjWw57AGpTMcax9rXP/C7gTMzRMJFco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713963733; c=relaxed/simple;
	bh=67iQI8p12cPIwv221E2K0AnYsoCsaQfHOrgrpqMRgIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTg5ZPBGEEI9XO71z+O+Vab5xzZci1X+jRm7GPuEYUWwIWgvCw1Ky6OEY9J6DuJNReACSZis4ZXstf4Y0D5t4ee3BWUVJ+3iL9hF0RymjA/h7Y1ujlSDIpWnzrvMIKxH46LFQ7UuXtMS9iupapefspqP9wgBiBdWDR/okH8mRP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JdmiWux2; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713963729; x=1745499729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=67iQI8p12cPIwv221E2K0AnYsoCsaQfHOrgrpqMRgIo=;
  b=JdmiWux2xYST/7OsCItsFUsi8RhHVe6litYIn8ryelG1CUhUMQ6nTWOI
   Rz7ZPOzPEjIHf80c2MOnMm/uQzRUYx4uwzic8qZg7wcdSuZeCiG5+OEj3
   XKbw7CYU1XlIY0gXtAJI+YHkvSowAwepmNx1HgZg8qESqqCOUn5kPW2E5
   5UTZiP6aAhKnELoc9Dv09JZ8PZUKqo2exL4eanSSG6DYRww+d5RqFoSv1
   CFrgeVg4thkHI/SD34ksJ8dKI4+1XVsNJ42hbMyvx94jvBw0wI6kTg7G2
   Z4p8PQKjeHkW1jhmxCM3e2sS3dHiHQOvNSVoVcn8w6U6xHYsRYOYPxIbv
   Q==;
X-CSE-ConnectionGUID: LAAMkgG4SoWwZ4V8S4B2Pg==
X-CSE-MsgGUID: xTnyzdk5T6K77SUJfHWNbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9702657"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9702657"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 06:02:08 -0700
X-CSE-ConnectionGUID: cGURsQhWQZuUdw0vtkyFrw==
X-CSE-MsgGUID: DOGf9N5pToy7EapL19xGXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="55658912"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 24 Apr 2024 06:01:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id AC57B136; Wed, 24 Apr 2024 16:00:59 +0300 (EEST)
Date: Wed, 24 Apr 2024 16:00:59 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Rajaram Regupathy <rajaram.regupathy@intel.com>
Subject: Re: [PATCH] thunderbolt: There are only 5 basic router registers in
 pre-USB4 routers
Message-ID: <20240424130059.GF112498@black.fi.intel.com>
References: <20240419105143.3777873-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240419105143.3777873-1-mika.westerberg@linux.intel.com>

On Fri, Apr 19, 2024 at 01:51:43PM +0300, Mika Westerberg wrote:
> Intel pre-USB4 routers only have ROUTER_CS_0 up to ROUTER_CS_4 and it
> immediately follows the TMU router registers. Correct this accordingly.
> 
> Reported-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/next.

