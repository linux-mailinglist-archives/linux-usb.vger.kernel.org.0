Return-Path: <linux-usb+bounces-13121-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D6F9488C3
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 07:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 136112848E4
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 05:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DCB1B9B54;
	Tue,  6 Aug 2024 05:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kT8KiPF7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2902029A1
	for <linux-usb@vger.kernel.org>; Tue,  6 Aug 2024 05:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722920683; cv=none; b=ZWTib/O2XkgByHP1ClfvoN+/he+SlEdqY2zVllaj8RU6TR87ox3vsmzAKhz16patlEru8lDs2SMv0F3slbfSKupQHAKSyVZtKIUE2qVWYBhYwb1TgD/dFyP1ZoyZKvijoOkf2t3+dynUUL0WTu4o/hUi8if7RZZ/pk9KjDmW62k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722920683; c=relaxed/simple;
	bh=DRIYDZgXZ9BmQtc6oCkHW3uVGMncoXNQkBn/YqgODco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HwEXcZB/UDPGNXTLjieKOUKgB6Khs3rExXa2+eC21pIkB+mTXOv5tvl3VBlEFMqkMNtUzRtUMt7GtEFOYe/FQPRPUD0dy0mWxT/JEWRxYOA368r8Un8FGhBtOsfX5at2RT1BykE0Vc4gL4/Y0xPGZzKM6UmiwVQrHvRXWtV6QiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kT8KiPF7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722920681; x=1754456681;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DRIYDZgXZ9BmQtc6oCkHW3uVGMncoXNQkBn/YqgODco=;
  b=kT8KiPF7aT0CAqAGFkbd4zTSINzDT4tjsGyKgis3CgY/HcYtyFvaZpf5
   unZHkb7QWzJEoO64xyktl+8i6Pfd3GfGa57xEgPulxXSGDq08LakLpxxf
   frmI5rRxTxNOoij6DVhZJZvRFgLXdZGoRNP3ug+vKpPrK//wyGcamk+VB
   uPIZ+iW09tKLaOE+WXRkm2v60MQ3ID9gvW1bed81CZdWNkFGURzHMaI+y
   jbKyASCV3H3a3bh7uenn/oteD/h8NCbf/WKyiIYWnY5WRFPcxPoWfLsHm
   BAFknCXWLXVWkUEYvOhWph+6Dn+hopsYg61YgEJH0wTaCGqUUnuhXhxJz
   A==;
X-CSE-ConnectionGUID: YSUa1gl2TV2gDUFGNvJSZg==
X-CSE-MsgGUID: zG5sTkeyROSzc4KABkQb7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20791065"
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="20791065"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 22:04:40 -0700
X-CSE-ConnectionGUID: cQs3WvFCRDC+YxBMf/2ReQ==
X-CSE-MsgGUID: 8y7As9vgSZCudPGYNwoJYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="61244413"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 05 Aug 2024 22:04:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 4405D13F; Tue, 06 Aug 2024 08:04:37 +0300 (EEST)
Date: Tue, 6 Aug 2024 08:04:37 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Mark XDomain as unplugged when router is
 removed
Message-ID: <20240806050437.GX1532424@black.fi.intel.com>
References: <20240802070543.1338656-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240802070543.1338656-1-mika.westerberg@linux.intel.com>

On Fri, Aug 02, 2024 at 10:05:43AM +0300, Mika Westerberg wrote:
> I noticed that when we do discrete host router NVM upgrade and it gets
> hot-removed from the PCIe side as a result of NVM firmware authentication,
> if there is another host connected with enabled paths we hang in tearing
> them down. This is due to fact that the Thunderbolt networking driver
> also tries to cleanup the paths and ends up blocking in
> tb_disconnect_xdomain_paths() waiting for the domain lock.
> 
> However, at this point we already cleaned the paths in tb_stop() so
> there is really no need for tb_disconnect_xdomain_paths() to do that
> anymore. Furthermore it already checks if the XDomain is unplugged and
> bails out early so take advantage of that and mark the XDomain as
> unplugged when we remove the parent router.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/fixes.

