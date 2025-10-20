Return-Path: <linux-usb+bounces-29443-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD9EBEF76C
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 08:23:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9434F4E576E
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 06:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6C82D6E71;
	Mon, 20 Oct 2025 06:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gc0bpKwm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3968D2BFC73
	for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 06:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760941375; cv=none; b=ZwyIYqXM6JnVLzHvp/suKLsDdkdAYYgqzARLOZe87HcPdyMiGASJb3k1yBlzE5cjJLkDFFStbam5hrRh1CJmYFDBNChwjv8vIbkg4qk+VJYdMHrSC61rF1awtpC9U2bjGDfuLfzGwN1lhMX5VjsKSk748RfqUTqvXqtAlSO+5Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760941375; c=relaxed/simple;
	bh=TW1HH/Ga/Kmo5uQVHnR7e8HGo5rUaSIQyH5wMf3KF4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSUOcRXyN0ne3H2PzVGUEgCOx63pX+xlhDLFYW2erBJj8OQ66VDVrAxyI5oQsmqt7Uy6k4OYw059ll3FtZXbEY8HPKcRgRasrhT1FnmM3S11DRfY8q2ZQom9AJPKYKDoiXFxyMDVNZj8mlZrlg+fEpiRT/RqnvczGjRuo3PBEJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gc0bpKwm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760941373; x=1792477373;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TW1HH/Ga/Kmo5uQVHnR7e8HGo5rUaSIQyH5wMf3KF4o=;
  b=gc0bpKwmdZhKynqIglOcvaj+QZxJCyuyhiLbdYsHzfF9KgEgaH8iX0ww
   q/BwuB1Lt/IdMi4qUcy7SUDsbB/DqRdzfzmvEhygVTlp8ox7W5yWRyEj+
   cHnEZ2hjwuduWYw9oeeA3dMoXTqpZJMBqPZu1lbivfiph/AHFyTXj1D2W
   hP8q7BSf5HKGvBrsKzOizMXz7R/y3HvhKlrQRyhnry3HGaGD98KPeTJZx
   UWa5rvG4F+6o2XR8bD4pd3w/OW9QiQ/W2Wz/8/Tui+eiKlkQ/fyjpwnX3
   /qxUtUaIb+UyhyuW0/BQNXEOB0Jh2wbBM6gO/dLTZsxgQB4xb4yRSI/L0
   A==;
X-CSE-ConnectionGUID: FS74Kl+vRFuTrQoykJ9vAw==
X-CSE-MsgGUID: bz8SHtLfQ2eyI/fv3uW6Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="85674556"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="85674556"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 23:22:53 -0700
X-CSE-ConnectionGUID: wtNemwYjTHemiKlDR8rCLg==
X-CSE-MsgGUID: LhlDn5C0Qle3YuIt2NqYkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="187517108"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 19 Oct 2025 23:22:51 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C35EB95; Mon, 20 Oct 2025 08:22:50 +0200 (CEST)
Date: Mon, 20 Oct 2025 08:22:50 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Subject: Re: [PATCH] thunderbolt: Add support for Intel Wildcat Lake
Message-ID: <20251020062250.GK2912318@black.igk.intel.com>
References: <20251010075054.2136100-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251010075054.2136100-1-mika.westerberg@linux.intel.com>

On Fri, Oct 10, 2025 at 09:50:54AM +0200, Mika Westerberg wrote:
> From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> 
> Intel Wildcat Lake derives its Thunderbolt/USB4 controller from Lunar
> Lake platform. Add Wildcat Lake PCI ID to the driver list of supported
> devices.
> 
> Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Tagged for stable and applied to thunderbolt.git/fixes.

