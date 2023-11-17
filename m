Return-Path: <linux-usb+bounces-2957-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 720357EF16D
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 12:09:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBC52B20951
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 11:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0E81A5B9;
	Fri, 17 Nov 2023 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="El58OC8I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7168DB3
	for <linux-usb@vger.kernel.org>; Fri, 17 Nov 2023 03:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700219350; x=1731755350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F3nDpc5V+jRFubaXbLe/LGQlK1RlhLdXY1+W03OJZbA=;
  b=El58OC8IudwPYNH07OP6pjGwtdGG7asjggXqBGxB4ryhDINhjsdqs6Vw
   cp3DFAa3eeJsvGP0PeXQg/qXyAy6SSPaOjfCWinEqCChYfUOBNfAnfN4g
   xhToeeVqYhIzq3AZVdAQyutxE4RruLZQ3dnqoEmD7/PuMBBS0+fWrEuEK
   pgjbbPx/vSAD1deZ1DHk1baW6jvpW2ZrAIz2bpwFfES81jVPDJoWeGQQZ
   UoBffmz4MlWcZek0bPG89rJMfMBipS3vOT7vcMSyVm8xXwPZhRSDQo82R
   /yMO20fIhuWROn7W6nHQgmgIlbI/GhgYNUc8h6sQPjh331+45plFLDQiL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="9940907"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="9940907"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 03:09:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="769199486"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="769199486"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 17 Nov 2023 03:09:06 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id BBF762BE; Fri, 17 Nov 2023 13:09:05 +0200 (EET)
Date: Fri, 17 Nov 2023 13:09:05 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org, Gil Fine <gil.fine@linux.intel.com>,
	Pengfei Xu <pengfei.xu@intel.com>
Subject: Re: [PATCH 1/3] thunderbolt: Set lane bonding bit only for
 downstream port
Message-ID: <20231117110905.GH17433@black.fi.intel.com>
References: <20231114121203.203762-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231114121203.203762-1-mika.westerberg@linux.intel.com>

On Tue, Nov 14, 2023 at 02:12:01PM +0200, Mika Westerberg wrote:
> From: Gil Fine <gil.fine@linux.intel.com>
> 
> Fix the lane bonding procedure to follow the steps described in USB4
> Connection Manager guide. Hence, set the lane bonding bit only for
> downstream port. This is needed for certain ASMedia device, otherwise
> lane bonding fails and the device disconnects.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

All 3 patches applied to thunderbolt.git/fixes.

