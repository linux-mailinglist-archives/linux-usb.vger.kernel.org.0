Return-Path: <linux-usb+bounces-4142-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 090848127C7
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 07:13:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4FB91F21A46
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 06:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411CACA79;
	Thu, 14 Dec 2023 06:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NG0lsDUS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77E5F93
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 22:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702534416; x=1734070416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tnmmVjHjDgaP0iSiJuXBN5W50XKIsl4bTt7y0hMgHXI=;
  b=NG0lsDUSW6MR7V0x704A8cIPpt+NqQbIWQtTDHgzCc0VP1vqrZKxcnRk
   gxca7OEnhA+3wWQ76xJS3h2Ksqk6thyuDcyujd7KS/lbDvQCLiUXArirw
   R+AxLd1uOrcbiJopXduiKxWpgKjF2dJc2oHMRs8+rp4hfFjLImbNQwjRu
   NelPdJ5bu8+old/iAU0GbRgizdz995FHCBqBRpmvZ6MNx5heT6dNSASMC
   YOngTy+JTySls+MEs8QWC0HGOrKiN5GbViYpZCNLfeyZwuZPjR37ZyBhR
   b0J5UK7+PusOyDi9p7bIjh4/YKTx9LysxtgFoXd8tUZyyTuX2p5ske83T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="393944708"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="393944708"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 22:13:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="844595962"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="844595962"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 13 Dec 2023 22:13:34 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id A31B23A3; Thu, 14 Dec 2023 08:13:32 +0200 (EET)
Date: Thu, 14 Dec 2023 08:13:32 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org, Gil Fine <gil.fine@linux.intel.com>,
	Pengfei Xu <pengfei.xu@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH 00/11] Improvements and Lunar Lake support
Message-ID: <20231214061332.GR1074920@black.fi.intel.com>
References: <20231204103828.1635531-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231204103828.1635531-1-mika.westerberg@linux.intel.com>

On Mon, Dec 04, 2023 at 12:38:17PM +0200, Mika Westerberg wrote:
> Hi all,
> 
> This series adds improvements around USB4 v2 support, PCIe tunneling,
> some minor fixes and also adds Intel Lunar Lake support.
> 
> Gil Fine (7):
>   thunderbolt: Handle lane bonding of Gen 4 XDomain links properly
>   thunderbolt: Move width_name() helper to tb.h
>   thunderbolt: Log XDomain link speed and width
>   thunderbolt: Transition link to asymmetric only when both sides support it
>   thunderbolt: Improve logging when DisplayPort resource is added due to hotplug
>   thunderbolt: Make PCIe tunnel setup and teardown follow CM guide
>   thunderbolt: Disable PCIe extended encapsulation upon teardown properly
> 
> Mika Westerberg (4):
>   thunderbolt: Unwind TMU configuration if tb_switch_set_tmu_mode_params() fails
>   thunderbolt: Disable CL states only when actually needed
>   thunderbolt: Use tb_dp_read_cap() to read DP_COMMON_CAP as well
>   thunderbolt: Add support for Intel Lunar Lake

All applied to thunderbolt.git/next.

