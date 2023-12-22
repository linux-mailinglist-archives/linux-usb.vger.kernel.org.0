Return-Path: <linux-usb+bounces-4531-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F2C81C8B1
	for <lists+linux-usb@lfdr.de>; Fri, 22 Dec 2023 12:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2D1F1C21E69
	for <lists+linux-usb@lfdr.de>; Fri, 22 Dec 2023 11:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3E814F92;
	Fri, 22 Dec 2023 11:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VAEgv77j"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4CF156C4
	for <linux-usb@vger.kernel.org>; Fri, 22 Dec 2023 11:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703242961; x=1734778961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=40ksBg7VKNKUvi2pw+aRwqgVvNpnr3+nlV8D7JZXi/E=;
  b=VAEgv77jHbOD5ixo/AQyM395eaT7jH+nshV/VMK/5YBrKBvihsEW9XOb
   8ySLQE5kZy+4IfK27Ir+RfNQqlcqdGA/0QXXEuwp0uco4MndDlANQFPaV
   1iG0mbuo5/cYj+TeMVfO2TCSMnIrJ2Dh3oIQ7/b/1Nbf2k9UM2nOorCsr
   +10xVy2cLodB88uKjWNPS5WRsrZuqo64MUsR1VuXI0uKOCjQadgeOsZhs
   zuCcMQCklGWBTTsxMPgzp3Rfp4iFWzMYsDAv7rxm7bSgwXBiftsBeR0nl
   e36paEPi/aqWO1eWBjnLHLsAXnlArszvgfCdHSCZKvQ+zmeGHcNaezH3E
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="9504379"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; 
   d="scan'208";a="9504379"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 03:02:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="811289509"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; 
   d="scan'208";a="811289509"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 22 Dec 2023 03:02:38 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 212AB305; Fri, 22 Dec 2023 13:02:37 +0200 (EET)
Date: Fri, 22 Dec 2023 13:02:37 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>
Subject: Re: [PATCH] thunderbolt: Keep link as asymmetric if preferred by
 hardware
Message-ID: <20231222110237.GE2543524@black.fi.intel.com>
References: <20231219071531.2375978-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231219071531.2375978-1-mika.westerberg@linux.intel.com>

On Tue, Dec 19, 2023 at 09:15:31AM +0200, Mika Westerberg wrote:
> From: Gil Fine <gil.fine@linux.intel.com>
> 
> In case of the link is brought up as asymmetric (due to hardware preference), we
> honor that and don't transition it to symmetric, unless a router with symmetric
> link got plugged below, in the topology (and a bandwidth allows transition to
> symmetric).
> 
> Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/next.

