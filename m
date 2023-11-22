Return-Path: <linux-usb+bounces-3162-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA357F3EE4
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 08:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82BC81C20B78
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 07:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9047F1DA4F;
	Wed, 22 Nov 2023 07:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2VURbOh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC56B10C;
	Tue, 21 Nov 2023 23:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700638358; x=1732174358;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DTy+5s+titJCRb9lM2czn3EeHfdmnHbjASYVMkfVbec=;
  b=M2VURbOhZIpzE2HZy2yKTEnpKzkonXg7FdWw86h5gMVGzSh42ZOg9r2f
   QbMNEKISUQB0F3gBw3ZQZm8Cno+aSZByoy99eS6lf7djEfC4o0KwshhCu
   MKBFJAeYIyI3uvNfCX5YGoEooP7V3P6ruA0P8XWsuWSpWted9fCH289h+
   DUsplrHfHfLgPI3V4tzGaDNwbZ+iuqIqZHLOFNJfSdGGjgGuPk8JTER+H
   6YlTFQjXqqWXzY3J/Vs4SxkvBSUs/KenpoINc+DAD1NGflifM+ily/BKg
   b64ADLYBzJkOzZDS+p4JE4a4JB26+5qFFevN4aSgBepUoQsUth9Et7ypi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="389154275"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="389154275"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 23:32:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="832924702"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="832924702"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 21 Nov 2023 23:32:36 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 476DD2A2; Wed, 22 Nov 2023 09:32:35 +0200 (EET)
Date: Wed, 22 Nov 2023 09:32:35 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sanath S <Sanath.S@amd.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	stable@vger.kernel.org
Subject: Re: [Patch v2] thunderbolt: Add quirk to reset downstream port
Message-ID: <20231122073235.GU1074920@black.fi.intel.com>
References: <20231122050639.19651-1-Sanath.S@amd.com>
 <20231122060316.GT1074920@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231122060316.GT1074920@black.fi.intel.com>

On Wed, Nov 22, 2023 at 08:03:16AM +0200, Mika Westerberg wrote:
> also please make it a separate function, tb_port_reset() following the
> similar tb_port_unlock() and friends. With the matching kernel-doc and
> everything.
> 
> > +			val = val | PORT_CS_19_DPR;
> > +			ret = tb_port_write(port, &val, TB_CFG_PORT,
> > +					port->cap_usb4 + PORT_CS_19, 1);
> 
> Since it is using cap_usb4 you probably need to make usb4_port_reset()
> as well that gets called from tb_port_reset() (try to make it as simple
> as possible though).

Also please make sure it follows the CM guide 7.2 "Downstream Port Reset
and Change of Link Parameters" so that it observes the 10ms delay and
such.

