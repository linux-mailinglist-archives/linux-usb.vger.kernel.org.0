Return-Path: <linux-usb+bounces-312-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF3C7A4770
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 12:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04C791C20AE0
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 10:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51906FCA;
	Mon, 18 Sep 2023 10:44:55 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6988438F89;
	Mon, 18 Sep 2023 10:44:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FDF6A2;
	Mon, 18 Sep 2023 03:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695033893; x=1726569893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YuADBYyJPbfyS00a+dZYSYo97GWD7ip/0k5iF9oNauE=;
  b=JeixJUGq59gwH+GUvowa2egT0n8qoTR0kQWgqAliXKul+skBXTHaWnCr
   fgLwB2usaaJ0m9M2h4MB3X9xS/tJIJvvI6myGtCkzzIs9hFjlwyqRHUlZ
   6fMUP5D/f3PCMQkvT5i6mKoibbCyIfHBR4Vsk4kLZvQ2UbHgCeHZCVHyw
   l5YxgZl+1wEy4vnf9F9Vn/sQVCuTS7UOrpTycvu1ME61OXUu66HZW6jat
   cYhGnd7NgYCGd/A4uyVVq0lMyDFi5Jl9DsvIOwkjNi/14NhCZlMB0qKBD
   nX0U0860YL8YiSczHr8cu69e+sr4nIsVZ5lCiyvurW6Qog+i0+q7BcCvX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="383445202"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="383445202"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 03:44:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="739086164"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="739086164"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga007.jf.intel.com with SMTP; 18 Sep 2023 03:44:48 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 18 Sep 2023 13:44:48 +0300
Date: Mon, 18 Sep 2023 13:44:48 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abdel Alkuor <alkuor@gmail.com>
Cc: krzysztof.kozlowski+dt@linaro.org, bryan.odonoghue@linaro.org,
	gregkh@linuxfoundation.org, robh+dt@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org, linux-kernel@vger.kernel.org,
	abdelalkuor@geotab.com
Subject: Re: [PATCH v5 02/15] USB: typec: Add cmd timeout and response delay
Message-ID: <ZQgqII6+wplL8AjG@kuha.fi.intel.com>
References: <20230917152639.21443-1-alkuor@gmail.com>
 <20230917152639.21443-3-alkuor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230917152639.21443-3-alkuor@gmail.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Sep 17, 2023 at 11:26:26AM -0400, Abdel Alkuor wrote:
> Some commands in tps25750 take longer than 1 second
> to complete, and some responses need some delay before
> the result becomes available.
> 
> Signed-off-by: Abdel Alkuor <alkuor@gmail.com>
> ---
>  drivers/usb/typec/tipd/core.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 37b56ce75f39..a8aee4e1aeba 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -284,7 +284,8 @@ static void tps6598x_disconnect(struct tps6598x *tps, u32 status)
>  
>  static int tps6598x_exec_cmd(struct tps6598x *tps, const char *cmd,
>  			     size_t in_len, u8 *in_data,
> -			     size_t out_len, u8 *out_data)
> +			     size_t out_len, u8 *out_data,
> +			     u32 cmd_timeout_ms, u32 res_delay_ms)

It looks like 1s/0s is still the "default", so you could have just
made this old function a wrapper:

static int tps6598x_exec_cmd(struct tps6598x *tps, const char *cmd,
			     size_t in_len, u8 *in_data,
			     size_t out_len, u8 *out_data)
{
        return tps6598x_exec_cmd_tmo(tps, cmd, in_len, in_data, out_len, out_data, 1000, 0);
}

thanks,

-- 
heikki

