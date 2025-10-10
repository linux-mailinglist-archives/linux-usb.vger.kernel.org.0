Return-Path: <linux-usb+bounces-29123-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A5EBCDA6C
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 16:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 817C14E18DD
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 14:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BEA2F7465;
	Fri, 10 Oct 2025 14:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="unLPzE76"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BEB2F3C20
	for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760108385; cv=none; b=hMuDB/4by8SJ407fqqMf7yQsFbL7PnHiLA3OWqPlGkxxFJaqwwD9ADgR3Mo+iOGVLDeyCxHjRjB7bKqg/xP05IAmz/KrCkhJdwD9NpCyVofWwDaettxJ1LuJKbyhIamTB3UI6CXpz+riiZi2aOEiNrMQUQk7iaUY1v+lNJ1nlTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760108385; c=relaxed/simple;
	bh=T412bwiPXBjGr0Ws4d31vCxvgqmXRLYKF6XgTK4F3HE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t76UeXBL5qU61l767P08t6KSxeap5YgvSkipNG+d9qjq/AZj+ig3Suid7vwwwpeBxcy3R/pO54rEw/KxXpuykHS7Aeivxqq0UmeXdP2T14aJoTl1iksAPi+BvS7R5jGP6hqyMLKJ3iwricbylEhvuuKiwjpXn8MOxnRtOmmFp1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=unLPzE76; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-85a4ceb4c3dso202083085a.3
        for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 07:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1760108383; x=1760713183; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uEvOS5gOyU0VJFLWEh8auqxyvw1tyBqCyDfNAI8NPZM=;
        b=unLPzE760KY/uVFO7AbeT/lTBwEPUSG90BWf0c5Gd5g+pARFJnFfmgsOiwX6/FrwIC
         cjCbZjPSMoe7O/SNwbDXz18Jwq8GMokZJeHRlNldHezSQKhl8on7H3xpuagX+Q83Yl4s
         ZVqxo4rsRMi7lggYsJ+8DE5lro3peNzvhJQmo/cdZQ3n+Qdal0InbaRt9AmicCppdAIr
         3cGNPur5WJ/rRrBUK8wwVdbPOEROrOiR7cUd9S+0OkdjEml4FPMEDJ5x7anuRfH/lWxc
         rkaOXOfGTCxD66GP1sjdXNbfUWbSqy0OFM/ESSTrPZhOy+uC0QPPkFfomVFn2mhSpyS9
         910A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760108383; x=1760713183;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uEvOS5gOyU0VJFLWEh8auqxyvw1tyBqCyDfNAI8NPZM=;
        b=TCwA5RilaJEo0kwYaOiaHgMey9n/8zFQfpRXHdd5dyU/6Yr92BpZ9yHn9wm+mwPt/0
         wy+yQUAohQzR1q7EU5ADun55Fhg66j9pPdRL/eZgBTDEcXLqKfscGRjnZk/VWMZHfxYg
         oN+tzQjzfeuRbDL6kfKxIxZ2ffMq5cF8f1oWNaGko3TOlduOg8zWhH6/BjajFLMKAJwq
         YtoiQX7KxN3vTLwhv+8fTdVdVEl9cJc7dSbNWL8vWKavC8TbG8MRdbmWp203WWhpV9SI
         Iy2PilICJS3WAyo1jkocweshYzqqqCJXHXVs8VZPp0znqTGztkJWv+4pptplbv+7PShd
         0TSw==
X-Gm-Message-State: AOJu0Yw1M25Re9LjEt/rv068pYQx++B7HUR+lzyH7uWyeHKsMz9ZWayo
	2qBMCQpcXDf0pxvKpLx6Yfu6Ds9pSyakZDgiftyrU5r3cgBCR0S/zh4upcO8KZuC1g==
X-Gm-Gg: ASbGncutktzQ6kNnYHikoNQCrI2X/gPZYyTE+vnFzTnrsJRebQJ23z5GN1MjlDtMt1n
	jWHaRebSVYsljoDmxuDAafz+bHGPnBeKhoLpmi0vXGFSmR4EIRAMataSw2iuAdhzOdAc6/ivMQf
	21eaXtTpcE3kwPo/cjedSF4MhFUQP5qKcwN0Y7c96fISUtWTttgN50EeGzUTzWeB8n8B9BUkAYB
	XpWhmYlUNVmbFvO8tBIjGg4lufa1mbzTzg0PGqUmV7XrPobAk0N0tCnKX0FWTjgUebpwGie25cV
	/ls+eRstth1iNSScC3OEDtJCEUg8mMUyb2d0Gqvs23MS9rYMp2ib5nkajIOX0PdRW9xEzuk/p0p
	DxMtZhLIr5XOgyp2TTDeNdxJ5sPVkul2m0Sv3UufJ/dSgZ2jYKA==
X-Google-Smtp-Source: AGHT+IGzWA4MsKq11zn2f3aymj2xg12RTcLMAByo1V3k4688ni743IQ4x3Bgs6p10z1w+u+oCfcV4g==
X-Received: by 2002:a05:620a:6cc5:b0:835:79e8:34cc with SMTP id af79cd13be357-88354caeea3mr1604689585a.70.1760108382883;
        Fri, 10 Oct 2025 07:59:42 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::de67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f9ada65sm420308385a.18.2025.10.10.07.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 07:59:42 -0700 (PDT)
Date: Fri, 10 Oct 2025 10:59:39 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH 1/2] usb: ljca: Order ACPI hardware IDs alphabetically
Message-ID: <15a7d624-4ea0-4109-a0b4-7b4fd20e4642@rowland.harvard.edu>
References: <20251010055625.4147844-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251010055625.4147844-1-sakari.ailus@linux.intel.com>

On Fri, Oct 10, 2025 at 08:56:24AM +0300, Sakari Ailus wrote:
> The driver has three lists of ACPI hardware IDs, for GPIO, I²C and SPI.
> Order them alphabetically.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/usb/misc/usb-ljca.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> index c562630d862c..cf01cc727685 100644
> --- a/drivers/usb/misc/usb-ljca.c
> +++ b/drivers/usb/misc/usb-ljca.c
> @@ -165,26 +165,26 @@ struct ljca_match_ids_walk_data {
>  };
>  
>  static const struct acpi_device_id ljca_gpio_hids[] = {
> +	{ "INTC100B" },
>  	{ "INTC1074" },
>  	{ "INTC1096" },
> -	{ "INTC100B" },
> -	{ "INTC10D1" },
>  	{ "INTC10B5" },
> +	{ "INTC10D1" },
>  	{},
>  };
>  
>  static const struct acpi_device_id ljca_i2c_hids[] = {
> +	{ "INTC100C" },
>  	{ "INTC1075" },
>  	{ "INTC1097" },
> -	{ "INTC100C" },
>  	{ "INTC10D2" },
>  	{},
>  };
>  
>  static const struct acpi_device_id ljca_spi_hids[] = {
> +	{ "INTC100D" },
>  	{ "INTC1091" },
>  	{ "INTC1098" },
> -	{ "INTC100D" },
>  	{ "INTC10D3" },
>  	{},
>  };

In the absence of any comments saying that the entries should be kept in 
alphabetical order, people will just add new entries to the end of each 
list.  They won't remain in alphabetical order very long.

(Even with comments about the ordering requirement, people will submit 
patches with entries in the wrong positions.  But at least then you can 
tell them to go back, read the comments, and resubmit their patches with 
the proper ordering.)

Just a quick observation from personal experience...

Alan Stern

