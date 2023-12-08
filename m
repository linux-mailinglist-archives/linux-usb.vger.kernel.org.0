Return-Path: <linux-usb+bounces-3910-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F35480A4DD
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 14:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B90441F212C1
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 13:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7274C1DA58;
	Fri,  8 Dec 2023 13:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbPbZqnx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F7B198C;
	Fri,  8 Dec 2023 05:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702043811; x=1733579811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=55M1hh3vjcTT4qbO8ePl/PG9N+ftOAwqAUqgSIIaDag=;
  b=QbPbZqnx40/b5djRjENAAqQIPeMs8h/Z+0keaMOUm+ids76OeMO0xge2
   L8JYANyrOZxgTszBakoF2oasQxCJR/f/4wQ3SMMfWuh9L1RBnZIRa6kyy
   Jt2dG3GgtFwUxk1rNHiHqSdZInwgEt8vSDOYa/YGAhgrDDBlG5x1b39PT
   xVVlWQ+nQRuT7A9aVYFOsN/sSip8VyQVlQWfl/MZjhGMoNU4a+uipoQHd
   oo3m2+OnzTQOsltOlWIjdAR7iGhev8B7pr5NbRPwcZvpC00AcS9idhf3f
   GXLgJLOHd/DW0Mi8lmm7cPJihoNLfkhB9hGFgn/WAecbaYRTBJJ9vQxm8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="384811841"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="384811841"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 05:56:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="721872348"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="721872348"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga003.jf.intel.com with SMTP; 08 Dec 2023 05:56:47 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 08 Dec 2023 15:56:46 +0200
Date: Fri, 8 Dec 2023 15:56:46 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: fix gpio-based orientation detection
Message-ID: <ZXMgntTKDPfAQbYT@kuha.fi.intel.com>
References: <20231208123603.29957-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208123603.29957-1-johan+linaro@kernel.org>

On Fri, Dec 08, 2023 at 01:36:02PM +0100, Johan Hovold wrote:
> Fix the recently added connector sanity check which was off by one and
> prevented orientation notifications from being handled correctly for the
> second port when using GPIOs to determine orientation.
> 
> Fixes: c6165ed2f425 ("usb: ucsi: glink: use the connector orientation GPIO to provide switch events")
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> 
> I found this one through inspection when skimming the driver.
> 
> Johan
> 
> 
>  drivers/usb/typec/ucsi/ucsi_glink.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index db6e248f8208..4853141cd10c 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -228,7 +228,7 @@ static void pmic_glink_ucsi_notify(struct work_struct *work)
>  
>  	con_num = UCSI_CCI_CONNECTOR(cci);
>  	if (con_num) {
> -		if (con_num < PMIC_GLINK_MAX_PORTS &&
> +		if (con_num <= PMIC_GLINK_MAX_PORTS &&
>  		    ucsi->port_orientation[con_num - 1]) {
>  			int orientation = gpiod_get_value(ucsi->port_orientation[con_num - 1]);
>  
> -- 
> 2.41.0

-- 
heikki

