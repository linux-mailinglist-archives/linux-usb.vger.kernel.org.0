Return-Path: <linux-usb+bounces-3887-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB182809CE6
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 08:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A45052820EE
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 07:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32656DF45;
	Fri,  8 Dec 2023 07:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DMCMNHAA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7138810CF
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 23:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702019108; x=1733555108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=guyv+xvi5l/y/5U80e52vfcoQ6ZsnJ1dxFCiTQmJW9c=;
  b=DMCMNHAA5a2FYGjJ/bdlPlHyRlsOsvsr7+nKx+zyUOKlRXVFXtMyUdoD
   9yyC8IoTAq+CjKs490vsXfmlCv+HRqJiiaS9+zN5/YqF9W1ixo6AlebSS
   qgDX7Id3kxG8gMT0iztSIcswb1ZGLkAaXXkGa824ysPdMOTZsbU0xygxf
   6KQBxj/BVws049oVJDNfLDL9AIbfoMYxgGJMYZhTA3D/U9den92JKCKyW
   stz9d9ibH2OlIFdwwBzexB4koI3qXswbJE9Hov4gdpkqKuttzZjcAauZQ
   7nMvYpUL7zXeZMqeJMWhwFZt29duB1himsdmk1+jyNnbGZSR7W4bN7A/b
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="458679823"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="458679823"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 23:05:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="748242666"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="748242666"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 07 Dec 2023 23:05:06 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id A4F43284; Fri,  8 Dec 2023 09:05:04 +0200 (EET)
Date: Fri, 8 Dec 2023 09:05:04 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org, Gil Fine <gil.fine@linux.intel.com>
Subject: Re: [PATCH] thunderbolt: Fix minimum allocated USB 3.x and PCIe
 bandwidth
Message-ID: <20231208070504.GB1074920@black.fi.intel.com>
References: <20231204102538.1634776-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231204102538.1634776-1-mika.westerberg@linux.intel.com>

On Mon, Dec 04, 2023 at 12:25:38PM +0200, Mika Westerberg wrote:
> From: Gil Fine <gil.fine@linux.intel.com>
> 
> With the current bandwidth allocation we end up reserving too much for the USB
> 3.x and PCIe tunnels that leads to reduced capabilities for the second
> DisplayPort tunnel.
> 
> Fix this by decreasing the USB 3.x allocation to 900 Mb/s which then allows
> both tunnels to get the maximum HBR2 bandwidth.  This way, the reserved
> bandwidth for USB 3.x and PCIe, would be 1350 Mb/s (taking weights of USB 3.x
> and PCIe into account). So bandwidth allocations on a link are:
> USB 3.x + PCIe tunnels => 1350 Mb/s
> DisplayPort tunnel #1  => 17280 Mb/s
> DisplayPort tunnel #2  => 17280 Mb/s
> 
> Total consumed bandwidth is 35910 Mb/s. So that all the above can be tunneled
> on a Gen 3 link (which allows maximum of 36000 Mb/s).
> 
> Fixes: 582e70b0d3a4 ("thunderbolt: Change bandwidth reservations to comply USB4 v2")
> Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/fixes.

