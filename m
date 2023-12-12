Return-Path: <linux-usb+bounces-4050-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B922980EFBC
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 16:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA5FD1C20C4C
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 15:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D88575409;
	Tue, 12 Dec 2023 15:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ik1JLdq8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC67D3;
	Tue, 12 Dec 2023 07:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702393861; x=1733929861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dLwFIlq58MNhpi4UGL1OxPkTqyvcNKLBZUifmxhXGb0=;
  b=Ik1JLdq8z6jd/uAJuSEFVQT3LXhgeUDZ/BMhbxKf93ejHMCf9gZdohK6
   fn6g6/aIpXRdDxc0hiSrqCBT0hzV+V7OlQP1KaxqdqSplY5zAYrBYYm9D
   96c1w4FrEfgEsBk5u3U+QErvIhLIGTpobSCwZSrIOEhsZwTqqcxnozOnM
   c7Y3YNRG8SucHm/n2Ho7PveI9yJGzaqndTeuJcmEZpctkEYuygTaQdePa
   /A0CqlUN29B0bXmhPxC0iO41NZiJ7olbgUiZkgk8OFWHo85gFBiAUlgF9
   I9HPLwlZKhTvXU11pNP4AO+6nZf2769QrasqwTMZXhsoBY/zpEtck39y5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="374325642"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="374325642"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 07:10:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="896952942"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="896952942"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 12 Dec 2023 07:10:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 52C193D2; Tue, 12 Dec 2023 17:10:46 +0200 (EET)
Date: Tue, 12 Dec 2023 17:10:46 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sanath S <Sanath.S@amd.com>
Cc: mario.limonciello@amd.com, andreas.noever@gmail.com,
	michael.jamet@intel.com, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] thunderbolt: Teardown tunnels and reset downstream
 ports created by boot firmware
Message-ID: <20231212151046.GF1074920@black.fi.intel.com>
References: <20231212140047.2021496-1-Sanath.S@amd.com>
 <20231212140047.2021496-3-Sanath.S@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231212140047.2021496-3-Sanath.S@amd.com>

On Tue, Dec 12, 2023 at 07:30:47PM +0530, Sanath S wrote:
> Boot firmware might have created tunnels of its own. Since we cannot
> be sure they are usable for us. Tear them down and reset the ports
> to handle it as a new hotplug.
> 
> Since we teardown the tunnels, Discovering of tunnels is not needed.

Let's leave this for non-USB4 (That's TBT1-3) as we agreed.

