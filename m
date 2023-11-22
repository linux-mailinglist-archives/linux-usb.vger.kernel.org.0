Return-Path: <linux-usb+bounces-3213-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9587F52C3
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 22:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA49128155F
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 21:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3755A1CA92;
	Wed, 22 Nov 2023 21:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BgPjsObQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EBD51BD;
	Wed, 22 Nov 2023 13:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700689264; x=1732225264;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f5PkBGL11tZGIvpj3qwyLcC5fB7oIFYd3edPJQK15Q0=;
  b=BgPjsObQa0/MHJzWsAHO7dnGV+NIMER8dJPXkn+1FVVihQiV9VZZc6XT
   qkHlXigvlmcRORW9gPGwKjWkfsVsZf38gmScGmn47thYsbWe0mN3RiFru
   fgRfmhZYBHLJHq9yJCZIdN0D/nBfJiLvTvY+tiEnU8lTK/BBVynLoPMaa
   +P17odxh9ZXKhBLfKRP9v8qo18G/gTT7O0SMfJwQDMv1GBrF21YYbHQ11
   5f5uC8ondbocL0dTxUtK6GQpe1wvbpagIpu98DggxkzjHr1dzMwgX2R3N
   14P+J/XH02GsZaEnkn4gxMwADRfgx7sp511v7aYvkAReWDtQNaid0MevN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="10828381"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="10828381"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 13:41:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="940409322"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="940409322"
Received: from aconradi-mobl.ger.corp.intel.com (HELO intel.com) ([10.251.221.156])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 13:41:01 -0800
Date: Wed, 22 Nov 2023 22:40:58 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] usb: misc: ljca: Fix enumeration error on Dell
 Latitude 9420
Message-ID: <ZV51apY7Bk5NIZqh@ashyti-mobl2.lan>
References: <20231121203205.223047-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121203205.223047-1-hdegoede@redhat.com>

Hi Hans,

On Tue, Nov 21, 2023 at 09:32:05PM +0100, Hans de Goede wrote:
> Not all LJCA chips implement SPI and on chips without SPI reading
> the SPI descriptors will timeout.
> 
> On laptop models like the Dell Latitude 9420, this is expected behavior
> and not an error.
> 
> Modify the driver to continue without instantiating a SPI auxbus child,
> instead of failing to probe() the whole LJCA chip.
> 
> Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
> Cc: stable@vger.kernel.org

did this already make it to stable? I think it is not needed.

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Wentong Wu <wentong.wu@intel.com>
> Link: https://lore.kernel.org/r/20231104175104.38786-1-hdegoede@redhat.com

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

> ---
> Changes in v3:
> - Fix commit-id in fixes tag
> 
> Changes in v2:
> - Small commit msg + comment fixes
> - Add Fixes tag + Cc: stable
> ---
>  drivers/usb/misc/usb-ljca.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> index c9decd0396d4..a280d3a54b18 100644
> --- a/drivers/usb/misc/usb-ljca.c
> +++ b/drivers/usb/misc/usb-ljca.c
> @@ -656,10 +656,11 @@ static int ljca_enumerate_spi(struct ljca_adapter *adap)
>  	unsigned int i;
>  	int ret;
>  
> +	/* Not all LJCA chips implement SPI, a timeout reading the descriptors is normal */
>  	ret = ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_ENUM_SPI, NULL, 0, buf,
>  			sizeof(buf), true, LJCA_ENUM_CLIENT_TIMEOUT_MS);
>  	if (ret < 0)
> -		return ret;
> +		return (ret == -ETIMEDOUT) ? 0 : ret;
>  
>  	/* check firmware response */
>  	desc = (struct ljca_spi_descriptor *)buf;
> -- 
> 2.41.0

