Return-Path: <linux-usb+bounces-31391-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA314CB6364
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 15:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B689E30987B1
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 14:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DB12F1FD9;
	Thu, 11 Dec 2025 14:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6A1nPwe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802602D8799;
	Thu, 11 Dec 2025 14:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765462991; cv=none; b=jlDEHB3Mo91f5ISIpW5zDPjBPmiJY5QzB+hRf96u7qEurEkzvdLXzd6GTIsw/9BpbG7o+UxAlKS1IgdbMWsL8JZaOYRGYpkuG692ghQHruHfcPBfkwc5gFnk47+FKMR2ow9JzfLuOnj0ufVCEosKg+GW9x9GIDq3onwr9wpPDxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765462991; c=relaxed/simple;
	bh=Y3OiXOZcdUuK/t85aiLic9ti7tF9t/QEcg8Jc+6OU2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BtCCcGAHSTU4WedsXLuVfyICr2IuHBHLuq5Grzy9WQqQItojeAn2wPSf7BdjsPdq58JEB0xhmEKodUrY1Jbr1/bgDNygNuXpXo1JVxksblp+Vn/VSQuxv4QPm97mUmTZkEj3esZ2NVtWysVWcg/cowe+M5kRwzW5XHvr4aqr5dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6A1nPwe; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765462990; x=1796998990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y3OiXOZcdUuK/t85aiLic9ti7tF9t/QEcg8Jc+6OU2A=;
  b=P6A1nPwexMqZXeqBGPP00s3zTDWSSPkRffMRLbCKAysOolJIA8lOzkVN
   lg41pERg8c73oJo02LyRWVQ96A4gMClPkfWaWib6jjvA/lIul/SI2E8SR
   h8tgYRL55aBzMM1fDvU52hhjDGAwOJiA/lIPfxdeBDanukx4PMr4hV3Vb
   voKAOYeOkySOWh4oWK11osqJSd5t3qoiX1wyRbVIFbzbZqeV8YAa9iDAu
   BzwgqMI6VRXw8GxkmJqaL2DYyw4P3e5OAWS3BTUGwurh6clmXpUgzLnqY
   4He3FnLF78RHtGyeAY6327zfSPiyZlJZ17RT9GuYhphlh4AvC6DLw1v7n
   Q==;
X-CSE-ConnectionGUID: BUYyj7IJQnOTwGMpbOzFDA==
X-CSE-MsgGUID: ZngSaBGYTHudFR2qYJs4Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71067527"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="71067527"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 06:23:09 -0800
X-CSE-ConnectionGUID: gyzAZhjxT4qg/19Cy6w4MA==
X-CSE-MsgGUID: KLNuBfEkSAuV2H6QTgL8cA==
X-ExtLoop1: 1
Received: from aschofie-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.222.61])
  by fmviesa003.fm.intel.com with SMTP; 11 Dec 2025 06:23:03 -0800
Received: by kuha (sSMTP sendmail emulation); Thu, 11 Dec 2025 16:22:52 +0200
Date: Thu, 11 Dec 2025 16:22:52 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Pavan Holla <pholla@chromium.org>, Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/8] USB Type-C alternate mode selection
Message-ID: <aTrTvA8Srak1mNGS@kuha>
References: <20251201122604.1268071-1-akuchynski@chromium.org>
 <aTrJwA7Y4fWiTMzB@kuha>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTrJwA7Y4fWiTMzB@kuha>

Thu, Dec 11, 2025 at 03:40:24PM +0200, Heikki Krogerus kirjoitti:
> Without going into the code review yet, I'm okay with this in general,
> except with the artificial SID for the USB4. I still don't understand
> why do you guys think we should use that instead of an USB4 specific
> device type?
> 
> I think somebody said earlier that the user space can't see the device
> type of the alt modes? If that's really the case, then I think there
> is some bigger issue here. Are you really sure that if you check the
> device type of an alternate mode for example with udevadm, it does not
> say DEVTYPE=typec_alternate_mode ?
> 
>         % udevadm info -q property --property=DEVTYPE /sys/bus/typec/devices/port0-partner.0
>         DEVTYPE=typec_alternate_mode

Or just use grep :)

        % grep DEVTYPE /sys/bus/typec/devices/port0-partner.0/uevent
        DEVTYPE=typec_alternate_mode

So, if that really does not work, then there is a bug somewhere that
we obviously need to fix.

Please note that the port altmodes are now also part of the bus.

Br,

-- 
heikki

