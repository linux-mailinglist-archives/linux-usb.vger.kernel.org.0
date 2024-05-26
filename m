Return-Path: <linux-usb+bounces-10560-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC128CF2C8
	for <lists+linux-usb@lfdr.de>; Sun, 26 May 2024 10:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77C1EB20D20
	for <lists+linux-usb@lfdr.de>; Sun, 26 May 2024 08:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853718BEE;
	Sun, 26 May 2024 08:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MOSgWImH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6B279F6
	for <linux-usb@vger.kernel.org>; Sun, 26 May 2024 08:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716710817; cv=none; b=fvpccc07T34VESrILE7nLY0sthWibXUFFr0ogVYhdAP+FgDn/vZwU+LRB2DwYsbjMMaYANVGhj72sGdXNkprXrQb/emviPXs+4k2yB2tchWO4M/U36hh4n8IuAmdEJi4/n4qj5GqT0d++1eIsXRRSVGTBf6CVDZjqjbeW8S4fEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716710817; c=relaxed/simple;
	bh=5od7lYNQ6DBrTyy8YCPs25d+haTMXf9G73dLLSQxM+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJCF8B6uWJs/fe1ZfhLMutJXUKJeJvqv7zAy4fAsHCQAO0Zjls7E/CCC1GK77duRs4nJQnlGAcsgZpMsn3OiqjHJNnDwE8o/oJtmVn9a/IxA9xmAeg3wjC5oYkxwdkJzsVQ7tQkiBfGNnIBU0SAsEygKEE8FfwaCxcKF4KG3HQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MOSgWImH; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e6f51f9de4so123712081fa.3
        for <linux-usb@vger.kernel.org>; Sun, 26 May 2024 01:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716710813; x=1717315613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uzItbLCLDN25ECEr4bCtWzVC/fO0Y6ybJrMdSsi6pDw=;
        b=MOSgWImHhH+eHKHcEzgmYoaO1QFUgki+G3yjkPzAoMujVLs7J2LJ5Pf5TwrqdMmmiZ
         6QJ/Yf5m4FgVcrDEfWJVQQv1Jsy5huFvroEyQ3d5aLBo5Br1EEoX36K1ZLGTyWSoRAzi
         TJxWUuOPW76KB5ZzXjT48/jD6mBOuY4TgOK/IG7udTA4Pq8ED7ha3zJ02fW+wrI/90VQ
         nXvclKIfvXEQ9StmBhRIzvd7OodYnMlIVganWw6Ld6hqrHFf/lQ9f3XXv4/o+z+3AAI7
         0mdwBLURP9D1vRbCvAko/KBpnucGLL0GPCsrvOa7S4w18f1eAejp/ZuhAlisa221M9P3
         ZZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716710813; x=1717315613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzItbLCLDN25ECEr4bCtWzVC/fO0Y6ybJrMdSsi6pDw=;
        b=whVMLPAicHHkh0yCllXPRroxyM9ZWsgcuxm2GrN+51Ri4GIQ8FL4dYtzfB+rQfYCrK
         +30da2xTYpseBmi4hwG1+jTsXMkXF1FRw+hztvF9/7wfy6hW/g2cbKlkH65Fwt90J4Sw
         natU1v8nUBfXACbw3sTTPAnLzhfmZMAwZ1AS55gGphSuwt7JhfOWM/qilf7sOxrOC5pz
         UUtDbG52wRXy3ZIgW2ffmJmx8GMhFo7OHptuuXejU61CFAZGa37+WefhwzqK2h5VYB3W
         TR8WC7nryxmYWYNLENiTXE0rTBhrAeI+IEcIJbFDJ35zEc66S0Fi5N0lOTT3ww/p1gu9
         9wHw==
X-Forwarded-Encrypted: i=1; AJvYcCXXViLRaasjLzgweGSad0S18coWBNnm1xLmyfciHkAO00w5oeq+AN99kSrcum01QdQ1kafMrKdkYuE73A+2C3KNZda8Pm71uruy
X-Gm-Message-State: AOJu0YzrDp0H+q9cN8BD+Xpl1BGr+UGAIRYGwVS6loVpRc0+r0GDnuTK
	ObH8jIDv26X70UJ/9/mcGPTpW1DqCR4DdNI8MJWYBpYrKjDuFo2/XiauU6/8UPc=
X-Google-Smtp-Source: AGHT+IHMGcclDBkRzx4ZJ7MIltcpvBEx4jlVdT6HK0RZcj6ZzUVywClgUtqnVppbRnqA2K+jiwTB9A==
X-Received: by 2002:a2e:938b:0:b0:2e5:2414:a205 with SMTP id 38308e7fff4ca-2e95b0c162bmr47477161fa.27.1716710813031;
        Sun, 26 May 2024 01:06:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcc45bcsm12679351fa.27.2024.05.26.01.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 01:06:52 -0700 (PDT)
Date: Sun, 26 May 2024 11:06:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] usb: ucsi: stm32: fix command completion handling
Message-ID: <d2nuqs64getpkfb6uavzan6tdxctd2qri2jgrof23doukwcke6@olwaf445vq74>
References: <20240521151109.3078775-1-fabrice.gasnier@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521151109.3078775-1-fabrice.gasnier@foss.st.com>

On Tue, May 21, 2024 at 05:11:09PM +0200, Fabrice Gasnier wrote:
> Sometimes errors are seen, when doing DR swap, like:
> [   24.672481] ucsi-stm32g0-i2c 0-0035: UCSI_GET_PDOS failed (-5)
> [   24.720188] ucsi-stm32g0-i2c 0-0035: ucsi_handle_connector_change:
>  GET_CONNECTOR_STATUS failed (-5)
> 
> There may be some race, which lead to read CCI, before the command complete
> flag is set, hence returning -EIO. Similar fix has been done also in
> ucsi_acpi [1].
> 
> In case of a spurious or otherwise delayed notification it is
> possible that CCI still reports the previous completion. The
> UCSI spec is aware of this and provides two completion bits in
> CCI, one for normal commands and one for acks. As acks and commands
> alternate the notification handler can determine if the completion
> bit is from the current command.
> 
> To fix this add the ACK_PENDING bit for ucsi_stm32g0 and only complete
> commands if the completion bit matches.
> 
> [1] https://lore.kernel.org/lkml/20240121204123.275441-3-lk@c--e.de/
> 
> Fixes: 72849d4fcee7 ("usb: typec: ucsi: stm32g0: add support for stm32g0 controller")
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_stm32g0.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> index 93d7806681cf..7d6576778dad 100644
> --- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> +++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> @@ -395,9 +395,13 @@ static int ucsi_stm32g0_sync_write(struct ucsi *ucsi, unsigned int offset, const
>  				   size_t len)
>  {
>  	struct ucsi_stm32g0 *g0 = ucsi_get_drvdata(ucsi);
> +	bool ack = UCSI_COMMAND(*(u64 *)val) == UCSI_ACK_CC_CI;
>  	int ret;
>  
> -	set_bit(COMMAND_PENDING, &g0->flags);
> +	if (ack)
> +		set_bit(ACK_PENDING, &g0->flags);

ACK_PENDING is not defined in the patch.

> +	else
> +		set_bit(COMMAND_PENDING, &g0->flags);
>  
>  	ret = ucsi_stm32g0_async_write(ucsi, offset, val, len);
>  	if (ret)
> @@ -405,9 +409,14 @@ static int ucsi_stm32g0_sync_write(struct ucsi *ucsi, unsigned int offset, const
>  
>  	if (!wait_for_completion_timeout(&g0->complete, msecs_to_jiffies(5000)))
>  		ret = -ETIMEDOUT;
> +	else
> +		return 0;
>  
>  out_clear_bit:
> -	clear_bit(COMMAND_PENDING, &g0->flags);
> +	if (ack)
> +		clear_bit(ACK_PENDING, &g0->flags);
> +	else
> +		clear_bit(COMMAND_PENDING, &g0->flags);
>  
>  	return ret;
>  }
> @@ -428,8 +437,9 @@ static irqreturn_t ucsi_stm32g0_irq_handler(int irq, void *data)
>  	if (UCSI_CCI_CONNECTOR(cci))
>  		ucsi_connector_change(g0->ucsi, UCSI_CCI_CONNECTOR(cci));
>  
> -	if (test_bit(COMMAND_PENDING, &g0->flags) &&
> -	    cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))
> +	if (cci & UCSI_CCI_ACK_COMPLETE && test_and_clear_bit(ACK_PENDING, &g0->flags))
> +		complete(&g0->complete);
> +	if (cci & UCSI_CCI_COMMAND_COMPLETE && test_and_clear_bit(COMMAND_PENDING, &g0->flags))
>  		complete(&g0->complete);
>  
>  	return IRQ_HANDLED;
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

