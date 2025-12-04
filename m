Return-Path: <linux-usb+bounces-31160-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC53ECA32DA
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 11:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEEE730DE062
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 10:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BE632572B;
	Thu,  4 Dec 2025 10:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jk1njphi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F6B244186;
	Thu,  4 Dec 2025 10:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764843083; cv=none; b=Ydy1yOmEEAUtpgBmYUmQQ8pO4Ko8GHSp7v4/H/rKPpALnoGk1cDjTyH0BzyCRae7Wd3ZbbqN+Ez7bDAbuQNWEcYXLnJ9ihpHh6BRxqkNVb2QMHzTphixa0DSNA2RyT2ADvhMrvKgxHSs8lkyNmDbU+PKc1eqQl5r1uxIW1d7NSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764843083; c=relaxed/simple;
	bh=HKfSXscOpvUdtKiz7s9Xq7/VXzagI9+7jmqmEYd8d9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vd+KP3+YVJx77je1pAKbJ57oXzlBRxili/SRdEYc9QV9QwiBrVZkLY2eIL3yY+yU0jGY0MJA+vKLDu/PoKP4W95fhgoH1y/ZHNt3u+rL/qnvvf7FJKxiuv/bYucYkDCXoY7VHe3QdGYviJslUscB7sbAhtumlBXItX4jrG9aZAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jk1njphi; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764843081; x=1796379081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HKfSXscOpvUdtKiz7s9Xq7/VXzagI9+7jmqmEYd8d9A=;
  b=Jk1njphiKkwbhLojGSFlQeHTRgQhJ39ItxWK75xPglFR84fQNSM504wP
   Bt6YiwcJEqZZ26cJEa4kJ39JaRKQsP3YQzB8KzBTHT2RdHgYON3D9TK23
   2grLvAglBRepptNgz/xpLKZD1qy/bepsCKEWK0muo6knTknwGgmNGLtgD
   188u/tYXs7ameta00CV6Z+ZjU9DgjlD8sC2+JRhoGXbAX+431fdU0NC9d
   y2IKJhJd27fLXG6HluAN1pZXTRfDEhuwSaJ8ZzF77L27Yz3psEqskGwhh
   L9GndJXiF9zb8HwHq8TcOGNUv6cYvF2S7G79a/dmRQnO9yEgyXscos1D9
   A==;
X-CSE-ConnectionGUID: Jpc0sr/jR8eH9bkKFDQ7ig==
X-CSE-MsgGUID: mgXdaJi7RmWoaqJsCTbbvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77965781"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="77965781"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 02:11:20 -0800
X-CSE-ConnectionGUID: ZJCJnOYbTRibjJBbOJRvKw==
X-CSE-MsgGUID: mYsb8kqaSCm0Rm7Ep/T/ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="194222247"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 04 Dec 2025 02:11:18 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E79EBA9; Thu, 04 Dec 2025 11:11:16 +0100 (CET)
Date: Thu, 4 Dec 2025 11:11:16 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Return -ENOTSUPP when cm_ops callbacks are
 missing
Message-ID: <20251204101116.GA1613537@black.igk.intel.com>
References: <20251204093224.1431-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251204093224.1431-1-vulab@iscas.ac.cn>

Hi,

On Thu, Dec 04, 2025 at 05:32:24PM +0800, Haotian Zhang wrote:
> Several tb_domain* helpers return -EPERM when the corresponding cm_ops
> callback is NULL. A NULL callback indicates the operation is not
> supported by the connection manager, not a permission denial.

These specifically return -EPERM on purpose because these are used when
PCIe tunnel is established and torn down. If the connection manager
implementation does not provide them it means you don't have permission to
deal with the PCIe tunnels.

