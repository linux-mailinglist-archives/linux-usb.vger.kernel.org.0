Return-Path: <linux-usb+bounces-25771-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E83DB041DA
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 16:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 071294A1E08
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 14:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1749259CAF;
	Mon, 14 Jul 2025 14:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K39ZGBs3"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9A5251792
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 14:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752503809; cv=none; b=AwvMP9M6cxE1qJjWSRZaDLAPMgBOD5aa/UGaa0+YrxAOcc1qAINarI+XIaF+IPAltQluYU6cY5xUhvm4zeFg01jSb73yJa7FOu7L+yN1XW2Rh1tmxWEtaX/XxmkznJafpYkSHMtsbu9BqPwlxNi73DwWdj6QsqjgR6I/o0pkKMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752503809; c=relaxed/simple;
	bh=VuqqMa72HKsGgw63UuN5cHyjaBeUWVPHJvFJII6coOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ck38kHvu/nsWdBIbh5RdAuWdoI/PvWngIqyKSIdFUu3rEwAht5XdhlvYCktqogUC/Uv2QAHdz1PpwmUGBXRxN8BMDIUvLnpRpclPbIxXlgu5gXEWPZcggdwXjgfF7gz5augOFRqeizYW63uOoJn7L4C+6C5RIThcKGDtetpCoac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K39ZGBs3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752503806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=stVCHu6LKp83uxTYBPZjVntnTY6VyQOczeCpnXoPZFg=;
	b=K39ZGBs3DW7er8HSJWu7e6MYjVBVE5qEDjqf0QXV/BeO2f4w/aay76F2hvF2V6u2AYOfo/
	UDjTOD1Vt8uKewCudDKb6S7AXu1IN5Ss924mVTSTNkxPM3jkOy670TKYWwBq0ka9/7jd+j
	vjnhfoR4s6weHdGSJ92/2IQ/D4JiaII=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-BnZu19EsONmgejLW75sLlA-1; Mon, 14 Jul 2025 10:36:45 -0400
X-MC-Unique: BnZu19EsONmgejLW75sLlA-1
X-Mimecast-MFC-AGG-ID: BnZu19EsONmgejLW75sLlA_1752503804
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ae0a0683d6dso480236466b.2
        for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 07:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752503804; x=1753108604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=stVCHu6LKp83uxTYBPZjVntnTY6VyQOczeCpnXoPZFg=;
        b=cKfCv69dXu5HUl0T0Oo57C4+Vm/xzCTntMkYUDaJfsrKpzCS0DgcIbnV8RqpbUheYf
         c9MTQV8YoAvDpJb8uoh1nwCN3pYK3q0Ll45bvisJYoxn15OG5vQOll/cWHcwYyj3o4T1
         Nd1lfAuOM+JjnhgZi0vGlI3LxIOiaw63WHPdsgS8cP+Dx5AR8/+gNI2kE/3ANBTn8VtJ
         pYSre8OPlaAPh9TuCcduYLjgeDzHRbrJjmifAEbuB+hpSKQqno6XMun3NWnOT6tJF4q3
         JOshm0zZn7n6ob4I4Z3MqaE49gPRIUHPh1B7aj1Mld8WjSb6xQSheDaESMGrEeKQka7q
         zK6g==
X-Forwarded-Encrypted: i=1; AJvYcCUkxcoQCel/yZFXxD3w2SMC8/w+pbv1QSEyi/qNNFX1ZlEadzsjjclvtjLHlpLPoVM/jDr2z+8bSBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuLqsq248ZFTqlZ68b5YmfHhV7qteNzLXJ0mw9V9GyoBeoCDTE
	bN7zc3xSvN9XXeyieVnnAgQjOy3GVV8/Yg72+BdecNowZ0CSKvJyS0UDpcSotJAzcTrqpLZl4bH
	SoW0/hl0RDSJ0c/RLBinjF2SIe5uE7+p2IUSPKXMz/Y9ORCSc9jIo0Jd1JozfmQ==
X-Gm-Gg: ASbGncshBIDjZa4CmNGGp58vjZ847DuEgknb8buj7UXmCpSLnv0q6LEoFe1w7RRbNa/
	VoMvBxQIQgvwZyeQ9Ff22QZOmrvlTiwwFNYZI+ecoBiQtFZo+e/UH1KKLyxwDiXf4acr+HMre9/
	0m3u/GqZsQxJ/wk91WYpTsevDHW6MdEoY9vZ0rFKhx0xmaKVGPbt2rJQ0VX5iv4ED4VfRlFkxLf
	E+8Lf1zJxy5DCOhe/7LMcgYxA4N2f4IMFq29lsNJOtRZ3y3XhDycsWZkb9DKBwVnsdKNqc5rGRw
	oO2IR+GghlYUtCJG8car3/8SPJoMJrt6wAdQXU+1LjYA
X-Received: by 2002:a17:907:8689:b0:ae4:85d:76fc with SMTP id a640c23a62f3a-ae6fcbc35bfmr1263813066b.30.1752503804298;
        Mon, 14 Jul 2025 07:36:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEf9LW2oVjZhF5sLUcvf0WPEAbAeIZPxgH40L/19uJOl41oKRe5Iyk5Y7lPc7HLnpXjTK6irQ==
X-Received: by 2002:a17:907:8689:b0:ae4:85d:76fc with SMTP id a640c23a62f3a-ae6fcbc35bfmr1263810666b.30.1752503803914;
        Mon, 14 Jul 2025 07:36:43 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee47a2sm842823166b.58.2025.07.14.07.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 07:36:43 -0700 (PDT)
Message-ID: <71d9aa58-e166-419b-9d32-839f5c4ad62c@redhat.com>
Date: Mon, 14 Jul 2025 16:36:42 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] media: uvcvideo: Add support for
 V4L2_CID_CAMERA_ORIENTATION
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-8-5710f9d030aa@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250605-uvc-orientation-v2-8-5710f9d030aa@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5-Jun-25 19:53, Ricardo Ribalda wrote:
> Fetch the orientation from the fwnode and map it into a control.
> 
> The uvc driver does not use the media controller, so we need to create a
> virtual entity, like we previously did with the external gpio.
> 
> We do not re-purpose the external gpio entity because its is planned to
> remove it.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

...

Taking a second look at this I noticed the following:

> @@ -1869,11 +1869,15 @@ static int uvc_scan_device(struct uvc_device *dev)
>  		return -1;
>  	}
>  
> -	/* Add GPIO entity to the first chain. */
> -	if (dev->gpio_unit) {
> +	/* Add virtual entities to the first chain. */
> +	if (dev->gpio_unit || dev->swentity_unit) {
>  		chain = list_first_entry(&dev->chains,
>  					 struct uvc_video_chain, list);
> -		list_add_tail(&dev->gpio_unit->chain, &chain->entities);
> +		if (dev->gpio_unit)
> +			list_add_tail(&dev->gpio_unit->chain, &chain->entities);
> +		if (dev->swentity_unit)
> +			list_add_tail(&dev->swentity_unit->chain,
> +				      &chain->entities);
>  	}
>  
>  	return 0;

The double checking of if (dev->gpio_unit) / if (dev->swentity_unit) looks
unnecessary here list_first_entry() is pretty cheap and this only runs
once at probe() time. So maybe:

	/* Add virtual entities to the first chain. */
	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);

	if (dev->gpio_unit)
		list_add_tail(&dev->gpio_unit->chain, &chain->entities);

	if (dev->swentity_unit)
		list_add_tail(&dev->swentity_unit->chain, &chain->entities);

?

...

Regards,

Hans


