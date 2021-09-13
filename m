Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 217A9408A7B
	for <lists+linux-usb@lfdr.de>; Mon, 13 Sep 2021 13:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236395AbhIMLth (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Sep 2021 07:49:37 -0400
Received: from mga02.intel.com ([134.134.136.20]:2712 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233570AbhIMLtg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 13 Sep 2021 07:49:36 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="208882210"
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; 
   d="scan'208";a="208882210"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2021 04:48:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; 
   d="scan'208";a="608944506"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 13 Sep 2021 04:48:18 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 13 Sep 2021 14:48:17 +0300
Date:   Mon, 13 Sep 2021 14:48:17 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: hd3ss3220: Use regmap_write_bits()
Message-ID: <YT86gU4LNBL1d5id@kuha.fi.intel.com>
References: <20210907092706.31748-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907092706.31748-1-p.zabel@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 07, 2021 at 11:27:06AM +0200, Philipp Zabel wrote:
> Use the regmap_write_bits() macro instead of regmap_update_bits_base().
> No functional change.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/hd3ss3220.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index f633ec15b1a1..cd47c3597e19 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -125,11 +125,9 @@ static irqreturn_t hd3ss3220_irq(struct hd3ss3220 *hd3ss3220)
>  	int err;
>  
>  	hd3ss3220_set_role(hd3ss3220);
> -	err = regmap_update_bits_base(hd3ss3220->regmap,
> -				      HD3SS3220_REG_CN_STAT_CTRL,
> -				      HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS,
> -				      HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS,
> -				      NULL, false, true);
> +	err = regmap_write_bits(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL,
> +				HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS,
> +				HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS);
>  	if (err < 0)
>  		return IRQ_NONE;
>  
> -- 
> 2.30.2

-- 
heikki
