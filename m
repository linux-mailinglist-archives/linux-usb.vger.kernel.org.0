Return-Path: <linux-usb+bounces-5226-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC053831B0F
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 15:04:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D8571F28315
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 14:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E92C2577E;
	Thu, 18 Jan 2024 14:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IrBy1KE5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F8825579;
	Thu, 18 Jan 2024 14:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705586671; cv=none; b=HdZI4/FFpEh3k3iQ9RRn17YMsVo/b6CARHI5N2i4EtBNPIk7X8nsQ5R/0Vq99fGBAY86++mWiy1sLs6NtYmX4i/TgB+K0QSIm3N0mMUJXjU2FPwwzGdFPZUJ9GzOgqDVLj9gj8l+L75J4VN9OU7T/VD4saGtFNAMfM1M2B6g5E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705586671; c=relaxed/simple;
	bh=9lVuw0NTSAQ8gz21uvK06l+eBWHooCCeN+14mfp55nQ=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=i5Rgc/fcGdYo25cYNoFR1iRkx3eFnw3P0+uoDywG+i7tu9tGYwNQWlDNO2BbFPA9Mf89dwJGbAuvYtlwBxV0bJl4RhO95da4+mMkhY3dsL51fKlpDppF+O9gtb/JlL173VCPjjx6rIzIwEIee81d8LeHyG+V6ZTA4ojouDZQrTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IrBy1KE5; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705586668; x=1737122668;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9lVuw0NTSAQ8gz21uvK06l+eBWHooCCeN+14mfp55nQ=;
  b=IrBy1KE5DOMH0Xc8vfSSRAGskUp//vnNGw4RchQkKtQA2S4FhY8PDZYU
   +NSJqxniPegoFADTQ2G96QcqYkNT0LNzoFLsN+AHk/gIV+PVGm0lb3e4g
   sZitBPoH8J9pi1o13ZT6L3+aZhsYGoijNa/p7YGNjizOLK4C6ruc8g9Yu
   /wCJGJPmu11cuKBJkZpvJP4/+CF0RnAoWkaJrtK7ALRYI3pN/dtLiH03r
   MTL4m5Gln5Y9oScTAvaoFrcqrqUNq3e9nTbdUxkuLqdSL2GOCZLWRjj8b
   o8Q8h+Ya+OppPrjh6RShpKssuD78EIZNKkxac9rKz7Q9bPdUDd+JU4Z/V
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="431610081"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="431610081"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 06:04:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="957822907"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="957822907"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga005.jf.intel.com with SMTP; 18 Jan 2024 06:04:19 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 18 Jan 2024 16:04:17 +0200
Date: Thu, 18 Jan 2024 16:04:17 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Haotien Hsu <haotienh@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Utkarsh Patel <utkarsh.h.patel@intel.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Sing-Han Chen <singhanc@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Wayne Chang <waynec@nvidia.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, WK Tsai <wtsai@nvidia.com>
Subject: Re: [PATCH v6] ucsi_ccg: Refine the UCSI Interrupt handling
Message-ID: <Zakv4Z2tWa4R5kOn@kuha.fi.intel.com>
References: <20240118040034.2798629-1-haotienh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118040034.2798629-1-haotienh@nvidia.com>

Hi,

On Thu, Jan 18, 2024 at 12:00:34PM +0800, Haotien Hsu wrote:
> With the Cypress CCGx Type-C controller the following error is
> sometimes observed on boot:
> [   16.087147] ucsi_ccg 1-0008: failed to reset PPM!
> [   16.087319] ucsi_ccg 1-0008: PPM init failed (-110)
> 
> When the above timeout occurs the following happens:
> 1. The function ucsi_reset_ppm() is called to reset UCSI controller.
>    This function performs an async write to start reset and then
>    polls for completion.
> 2. An interrupt occurs when the reset completes. In the interrupt
>    handler, the OPM field in the INTR_REG is cleared and this clears
>    the CCI data in the PPM. Hence, the reset completion status is
>    cleared.
> 3. The function ucsi_reset_ppm() continues to poll for the reset
>    completion, but has missed the reset completion event and
>    eventually timeouts.
> 
> In this patch, we store CCI when handling the interrupt and make
> reading after async write gets the correct value.
> 
> To align with the CCGx UCSI interface guide, this patch updates the
> driver to copy CCI and MESSAGE_IN before they are reset when UCSI
> interrupt acknowledged.
> 
> When a new command is sent, the driver will clear the old CCI to avoid
> ucsi_ccg_read() getting wrong CCI after ucsi_ccg_async_write() when
> the UCSI interrupt is not handled.
> 
> Finally, acking the UCSI_READ_INT interrupt before calling complete()
> in ISR to ensure that the ucsi_ccg_sync_write() would wait for the
> interrupt handling to complete.
> 
> ---
> V1->V2
> - Fix uninitialized symbol 'cci'
> v2->v3
> - Remove misusing Reported-by tags
> v3->v4
> - Add comments for op_lock
> v4->v5
> - Specify the endianness of registers in struct op_region
> - Replace ccg_op_region_read() with inline codes
> - Replace ccg_op_region_clean() with inline codes
> - Replace stack memory with GFP_ATOMIC allocated memory in ccg_op_region_update()
> - Add comments for resetting CCI in ucsi_ccg_async_write()
> v5->v6
> - Fix sparse warning: incorrect type in assignment

You need to put the changelog ..

> Signed-off-by: Sing-Han Chen <singhanc@nvidia.com>
> Signed-off-by: Haotien Hsu <haotienh@nvidia.com>
> ---

.. here.

>  drivers/usb/typec/ucsi/ucsi_ccg.c | 92 ++++++++++++++++++++++++++++---
>  1 file changed, 84 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 449c125f6f87..dda7c7c94e08 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -192,6 +192,12 @@ struct ucsi_ccg_altmode {
>  	bool checked;
>  } __packed;
>  
> +#define CCGX_MESSAGE_IN_MAX 4
> +struct op_region {
> +	__le32 cci;
> +	__le32 message_in[CCGX_MESSAGE_IN_MAX];
> +};
> +
>  struct ucsi_ccg {
>  	struct device *dev;
>  	struct ucsi *ucsi;
> @@ -222,6 +228,13 @@ struct ucsi_ccg {
>  	bool has_multiple_dp;
>  	struct ucsi_ccg_altmode orig[UCSI_MAX_ALTMODES];
>  	struct ucsi_ccg_altmode updated[UCSI_MAX_ALTMODES];
> +
> +	/*
> +	 * This spinlock protects op_data which includes CCI and MESSAGE_IN that
> +	 * will be updated in ISR
> +	 */
> +	spinlock_t op_lock;
> +	struct op_region op_data;
>  };
>  
>  static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
> @@ -305,12 +318,42 @@ static int ccg_write(struct ucsi_ccg *uc, u16 rab, const u8 *data, u32 len)
>  	return 0;
>  }
>  
> +static int ccg_op_region_update(struct ucsi_ccg *uc, u32 cci)
> +{
> +	u16 reg = CCGX_RAB_UCSI_DATA_BLOCK(UCSI_MESSAGE_IN);
> +	struct op_region *data = &uc->op_data;
> +	unsigned char *buf;
> +	size_t size = sizeof(data->message_in);
> +
> +	buf = kzalloc(size, GFP_ATOMIC);
> +	if (!buf)
> +		return -ENOMEM;
> +	if (UCSI_CCI_LENGTH(cci)) {
> +		int ret = ccg_read(uc, reg, (void *)buf, size);
> +
> +		if (ret) {
> +			kfree(buf);
> +			return ret;
> +		}
> +	}
> +
> +	spin_lock(&uc->op_lock);
> +	data->cci = cpu_to_le32(cci);
> +	if (UCSI_CCI_LENGTH(cci))
> +		memcpy(&data->message_in, buf, size);
> +	spin_unlock(&uc->op_lock);
> +	kfree(buf);
> +	return 0;
> +}
> +
>  static int ucsi_ccg_init(struct ucsi_ccg *uc)
>  {
>  	unsigned int count = 10;
>  	u8 data;
>  	int status;
>  
> +	spin_lock_init(&uc->op_lock);
> +
>  	data = CCGX_RAB_UCSI_CONTROL_STOP;
>  	status = ccg_write(uc, CCGX_RAB_UCSI_CONTROL, &data, sizeof(data));
>  	if (status < 0)
> @@ -520,9 +563,20 @@ static int ucsi_ccg_read(struct ucsi *ucsi, unsigned int offset,
>  	u16 reg = CCGX_RAB_UCSI_DATA_BLOCK(offset);
>  	struct ucsi_capability *cap;
>  	struct ucsi_altmode *alt;
> -	int ret;
> +	int ret = 0;
> +
> +	if (offset == UCSI_CCI) {
> +		spin_lock(&uc->op_lock);
> +		memcpy(val, &(uc->op_data).cci, val_len);
> +		spin_unlock(&uc->op_lock);
> +	} else if (offset == UCSI_MESSAGE_IN) {
> +		spin_lock(&uc->op_lock);
> +		memcpy(val, &(uc->op_data).message_in, val_len);
> +		spin_unlock(&uc->op_lock);
> +	} else {
> +		ret = ccg_read(uc, reg, val, val_len);
> +	}
>  
> -	ret = ccg_read(uc, reg, val, val_len);
>  	if (ret)
>  		return ret;
>  
> @@ -559,9 +613,18 @@ static int ucsi_ccg_read(struct ucsi *ucsi, unsigned int offset,
>  static int ucsi_ccg_async_write(struct ucsi *ucsi, unsigned int offset,
>  				const void *val, size_t val_len)
>  {
> +	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
>  	u16 reg = CCGX_RAB_UCSI_DATA_BLOCK(offset);
>  
> -	return ccg_write(ucsi_get_drvdata(ucsi), reg, val, val_len);
> +	/*
> +	 * UCSI may read CCI instantly after async_write,
> +	 * clear CCI to avoid caller getting wrong data before we get CCI from ISR
> +	 */
> +	spin_lock(&uc->op_lock);
> +	uc->op_data.cci = 0;
> +	spin_unlock(&uc->op_lock);
> +
> +	return ccg_write(uc, reg, val, val_len);
>  }
>  
>  static int ucsi_ccg_sync_write(struct ucsi *ucsi, unsigned int offset,
> @@ -615,13 +678,18 @@ static irqreturn_t ccg_irq_handler(int irq, void *data)
>  	u16 reg = CCGX_RAB_UCSI_DATA_BLOCK(UCSI_CCI);
>  	struct ucsi_ccg *uc = data;
>  	u8 intr_reg;
> -	u32 cci;
> -	int ret;
> +	u32 cci = 0;
> +	int ret = 0;
>  
>  	ret = ccg_read(uc, CCGX_RAB_INTR_REG, &intr_reg, sizeof(intr_reg));
>  	if (ret)
>  		return ret;
>  
> +	if (!intr_reg)
> +		return IRQ_HANDLED;
> +	else if (!(intr_reg & UCSI_READ_INT))
> +		goto err_clear_irq;
> +
>  	ret = ccg_read(uc, reg, (void *)&cci, sizeof(cci));
>  	if (ret)
>  		goto err_clear_irq;
> @@ -629,13 +697,21 @@ static irqreturn_t ccg_irq_handler(int irq, void *data)
>  	if (UCSI_CCI_CONNECTOR(cci))
>  		ucsi_connector_change(uc->ucsi, UCSI_CCI_CONNECTOR(cci));
>  
> -	if (test_bit(DEV_CMD_PENDING, &uc->flags) &&
> -	    cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))
> -		complete(&uc->complete);
> +	/*
> +	 * As per CCGx UCSI interface guide, copy CCI and MESSAGE_IN
> +	 * to the OpRegion before clear the UCSI interrupt
> +	 */
> +	ret = ccg_op_region_update(uc, cci);
> +	if (ret)
> +		goto err_clear_irq;
>  
>  err_clear_irq:
>  	ccg_write(uc, CCGX_RAB_INTR_REG, &intr_reg, sizeof(intr_reg));
>  
> +	if (!ret && test_bit(DEV_CMD_PENDING, &uc->flags) &&
> +	    cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))
> +		complete(&uc->complete);
> +
>  	return IRQ_HANDLED;
>  }
>  
> -- 
> 2.34.1

-- 
heikki

