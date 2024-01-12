Return-Path: <linux-usb+bounces-4964-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CD882C1F6
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 15:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 446751F25006
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 14:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6FD6DD05;
	Fri, 12 Jan 2024 14:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gyn7/j5N"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC0364CC7
	for <linux-usb@vger.kernel.org>; Fri, 12 Jan 2024 14:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705070212; x=1736606212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RP8FO7XH/g7qZYon+ZpTaxKX715d7eIojHShPZDMtSE=;
  b=Gyn7/j5NhMhXjXgk8S6V/chUkTs/tUCpgKkvdcp9bs9RuHU4RRdp6TB9
   2dn4DV6Cxz8HXVXjUPYFtDC7tzmeqpxzfo+VfAl/0IJf80eBrEVBjQy2T
   kUjn76f6KBpwiQRn6kons1KSofkCcQ22X/N2JTTa3widmRAAdddpIhxYi
   58/x94ZsBmzK9J0dTJkaUtuXG5+4/MVc1czWksZFmfcQs4t0mbpQp1zUF
   D8pF3vZPnBZ3iysLHfypdrDsOTI3+3cH7fGiWFFvsmZyhA0xwOgt7CaLv
   FOnP9vGRG0tH0KPxvDhhCxzyNuPyWLPJ7K4Ew22EDpFE0vAia6Fvwgm5/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="12547724"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="12547724"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 06:36:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="732592326"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="732592326"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga003.jf.intel.com with SMTP; 12 Jan 2024 06:36:49 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 12 Jan 2024 16:36:48 +0200
Date: Fri, 12 Jan 2024 16:36:48 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: pci: add support for the Intel Arrow Lake-H
Message-ID: <ZaFOgL0XaADUN0/B@kuha.fi.intel.com>
References: <20240112142758.3823690-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240112142758.3823690-1-heikki.krogerus@linux.intel.com>

On Fri, Jan 12, 2024 at 04:27:58PM +0200, Heikki Krogerus wrote:
> This patch adds the necessary PCI ID for Intel Arrow Lake-H
> devices.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

I forgot to Cc stable@vger.kernel.org. I'll just resend.

Sorry about that.

-- 
heikki

