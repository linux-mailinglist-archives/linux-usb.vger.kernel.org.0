Return-Path: <linux-usb+bounces-10850-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E108FC026
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 01:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3E42281FB0
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jun 2024 23:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D95D144D3F;
	Tue,  4 Jun 2024 23:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WQtArBO9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E6514D6E1
	for <linux-usb@vger.kernel.org>; Tue,  4 Jun 2024 23:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717544721; cv=none; b=mzeSFJML2RanNtds7HZslGzSWEuk/BC8sWD/Mxt20yMP0805++FkvGbzqn5pB7pzYmAZBcfboFTycS3y+eh6mRzbm/Oi8uTfexYwItSzdL7IHz4EYJ6lvn6x4atf9FmFm1qJDYXOP2/oGaRXYvr4zBDoBHt+xWLEgip3Zfo9RN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717544721; c=relaxed/simple;
	bh=mO8l9w4yeT3MwF+7vLMvKbuL4NN22/fk6ciH+STfS/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VsMdq0e/A0eLIbt4df8Wm4LdycsZobHg05r9cZhDn/JccOMo5Lrb0kwH0PXCahyvnVu+D4wLX0TD9pQ9PyLDHD2WVPljhQmQBTHN9QjvU4SLEu9SsieVyOW1l99Tp6Ltt2z4z4bKFLwUnHkdpNFrWwEKtDFy/T3qoUp7+58F13E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WQtArBO9; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e95a1eff78so81202291fa.0
        for <linux-usb@vger.kernel.org>; Tue, 04 Jun 2024 16:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717544718; x=1718149518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Hw+o9ushxP4oL0sHkBGbfJZ8jixB6ffntpZ1wrdq0I=;
        b=WQtArBO9TsroRxHH4ArrDjRyGKCYUBLXWt3C642C/YCWChbqjkd/KUo5XNpBGpQAGA
         dl6MItxYn4Jz5jrkxV5RpggA+rukkcHQg5A5LoWjxz81cTZnJrkP1lTtzh4tsT3ZtdBJ
         xNwFL9IzWdZ7y7i56VfDQbWqDyn1ziWakl8j7XSl0qg0aPwn53FWi8q0KEcyOyQrs5Nu
         qgkoCvGvmlkyQ8nSqdXW4HORSpdbe5QnRteqE3Rx4XBpl0jezTnlk5UhtFORopNjgYve
         p0bKSgmHk6wuXro200b2Xr6k1qDNvMw6rqoCYclAk2J+Xogsu7s6IwGLzsNJ8JCnp9lQ
         w67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717544718; x=1718149518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Hw+o9ushxP4oL0sHkBGbfJZ8jixB6ffntpZ1wrdq0I=;
        b=TtF2Rp87UuC3leqmagtaNHreBEqrZsPgFEcVHz3+Zu0J+s6V+3aepzMaZNPAKqEj9/
         xq5X/z65pIifkpFTPDCe++NxKHdAHcQufhso6V6D4fr0CoJAfYemxPO2/m0dHn2L56fx
         RUn3rKGzU5avLxjsLD1vXP9Cl6rhV2fcR5BCH/B1Mvzk2IqK8sKpsICBWITimEFn6kLE
         F3VH0h/1DJzf8QwQT+dw7emeFRAz5ofuocQ3x1ZqojQbRCnYOWVg3dyFUOI63wGZ/hyU
         yiYbNLIuZY066jPP4GZ5ooSdy+xVYEMwEfU5+Ivc7FQ6zFnoHEdFZWRurksKW0vCAR4f
         Xy4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvweaz9loZO3IxYhoVDFrsOhwCTGjj4sqSOcLP1BgkumXvAhf9gomblnVX0O+NXJV8ZWi4zPEfmf3V43t8eUSjDRjcGCN9FRUE
X-Gm-Message-State: AOJu0YwiRRdfZ4Pxns3MLEo0aOxkDhE/abVOYTUjPR4+W1PfP9Xko7h9
	QgoX+7KG2xt7FRFhQjsxR67g/Ta97gmZI84+lnTTRFmS+xP3dp4rEHx4ycVDBug=
X-Google-Smtp-Source: AGHT+IG8irwaNLll4RB47HRbguyt8AVMzhkXC9ZQGs3YBcqRUl1jpwxE9PzbsvEuob4oJF/5G2XrxA==
X-Received: by 2002:a2e:b52c:0:b0:2e9:77ec:58eb with SMTP id 38308e7fff4ca-2eac79eb9b9mr3928441fa.17.1717544717653;
        Tue, 04 Jun 2024 16:45:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eab50fc12asm5892401fa.63.2024.06.04.16.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 16:45:17 -0700 (PDT)
Date: Wed, 5 Jun 2024 02:45:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: treat get_pdos not supported condition
 as info instead of error
Message-ID: <2midmmssv2i3plvtc2hajar6alfvggpnbvgpmldspelxsnjvcl@qiblhwat6n3p>
References: <mpearson-lenovo@squebb.ca>
 <20240604194056.16625-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604194056.16625-1-mpearson-lenovo@squebb.ca>

On Tue, Jun 04, 2024 at 03:40:44PM -0400, Mark Pearson wrote:
> On systems where the UCSI PDOs are not supported, the UCSI driver is
> giving an error message. This can cause users to believe there is a HW
> issue with their system when in fact it is working as designed.
> 
> Downgrade message to dev_info for EOPNOTSUPP condition.
> 
> Tested on Lenovo L14 G5 AMD and confirmed with Lenovo FW team that PDOs
> are not supported on this platform.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index cb52e7b0a2c5..090be87d5485 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -632,8 +632,12 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
>  	command |= is_source(role) ? UCSI_GET_PDOS_SRC_PDOS : 0;
>  	ret = ucsi_send_command(ucsi, command, pdos + offset,
>  				num_pdos * sizeof(u32));
> -	if (ret < 0 && ret != -ETIMEDOUT)
> -		dev_err(ucsi->dev, "UCSI_GET_PDOS failed (%d)\n", ret);
> +	if (ret < 0 && ret != -ETIMEDOUT) {
> +		if (ret == -EOPNOTSUPP)
> +			dev_info(ucsi->dev, "UCSI_GET_PDOS not supported on this hardware\n");

Maybe it would be enough to guard GET_PDOS commands with the
UCSI_CAP_PDO_DETAILS check? Is it cleared on affected platforms?

> +		else
> +			dev_err(ucsi->dev, "UCSI_GET_PDOS failed (%d)\n", ret);
> +	}
>  
>  	return ret;
>  }
> -- 
> 2.45.1
> 

-- 
With best wishes
Dmitry

