Return-Path: <linux-usb+bounces-2865-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3871E7EADFC
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 11:27:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98B16B20AFB
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 10:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936DA1946D;
	Tue, 14 Nov 2023 10:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aVfpr7IE"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE3119448
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 10:26:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 663951BD
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 02:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699957610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yQTMHHTHAXvXlOc+pqmuVwvqSDOFUtypphlALzITryw=;
	b=aVfpr7IESnaVM61GlVuJrws8jrDE9OAxcQ6fFvlXritSHbx9MuFb/8c3MbaUjRK90uXPas
	ISPX2CF0hdvlL68Z5GkklWV7VvM07EDIDgoB2JYaeEES/0tUZHSMfYAEOPI/jMA82Pw25q
	9I0B0PxFM7T1sX1LSl6dxlKylL6Ptwk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-7edf3ZB5NP63WAnTX06o5w-1; Tue, 14 Nov 2023 05:26:48 -0500
X-MC-Unique: 7edf3ZB5NP63WAnTX06o5w-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9e304dd4856so351896566b.0
        for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 02:26:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699957607; x=1700562407;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQTMHHTHAXvXlOc+pqmuVwvqSDOFUtypphlALzITryw=;
        b=lE4p7FQ8Fy6VM+j0T2eCIqV5PXlggCe6kwfiqq3OVUKKXU1nkVF+5DOeSniJuNz831
         Tretk6Tv3kRAOa6XNtBUV8ISImFJrhLXdVse+4vuCDBWw8M2zjJhVnyVrK1Pt39d48je
         Oqhg4HYE61GuC0foWDRnz3ZX+Wl/K8ZDAj9ThL3+SQLxm0ytGMbECM6j7YPcO2UuNYsw
         oDkFhG75PhMdtggnylzKEyiOZe6xdmgVKTA2OjHg0B1ySPlzVhOsq2Rl8Ao/mo/LYHG2
         +ke5Z/3NHVOpLKBqhL1iKsI1Q4sNcaRTIzyQ9Mw29AneBgsrbpxnCEknArKvX9r6bkdU
         PdJQ==
X-Gm-Message-State: AOJu0YzcLQxsgLChluPq876F3VbNvFvpuOoGLleDhsSheqmcAzu1xNCV
	ALhsOBHUUS5GsSiK3tgPxXxalFQMaJD/GwyibJaYMFL73fRYFTd5mI/n4uersjR078K6xEi4C5O
	Tpg1pm+8DuqnB+xUa+7F1
X-Received: by 2002:a17:906:f252:b0:9c7:59d1:b2c9 with SMTP id gy18-20020a170906f25200b009c759d1b2c9mr6547401ejb.17.1699957607623;
        Tue, 14 Nov 2023 02:26:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtEeBlZQBiJnA6ruSH3Mk5wCQJI9FP2pTQoCF9ze0Pf1QATGI/VrTlAuh6fxOGqCw7NuOA7A==
X-Received: by 2002:a17:906:f252:b0:9c7:59d1:b2c9 with SMTP id gy18-20020a170906f25200b009c759d1b2c9mr6547387ejb.17.1699957607225;
        Tue, 14 Nov 2023 02:26:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o10-20020a1709062e8a00b009e676a5b158sm5248104eji.83.2023.11.14.02.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 02:26:46 -0800 (PST)
Message-ID: <7ab7084f-1d28-48bf-9a0a-0f12a209f6ed@redhat.com>
Date: Tue, 14 Nov 2023 11:26:45 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: misc: ljca: Drop _ADR support to get ljca children
 devices
To: Wentong Wu <wentong.wu@intel.com>, andriy.shevchenko@linux.intel.com,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org
References: <20231114072531.1366753-1-wentong.wu@intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231114072531.1366753-1-wentong.wu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/14/23 08:25, Wentong Wu wrote:
> Currently the shipped platforms use only _HID to distinguish
> ljca children devices. The _ADR support here is for future HW.
> This patch is to drop _ADR support and we can then re-introduce
> it (revert this patch) if future HW actually starts using _ADR
> to distinguish children devices.
> 
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/usb/misc/usb-ljca.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> index c9decd0396d4..7f0deebebc13 100644
> --- a/drivers/usb/misc/usb-ljca.c
> +++ b/drivers/usb/misc/usb-ljca.c
> @@ -457,8 +457,8 @@ static void ljca_auxdev_acpi_bind(struct ljca_adapter *adap,
>  				  u64 adr, u8 id)
>  {
>  	struct ljca_match_ids_walk_data wd = { 0 };
> -	struct acpi_device *parent, *adev;
>  	struct device *dev = adap->dev;
> +	struct acpi_device *parent;
>  	char uid[4];
>  
>  	parent = ACPI_COMPANION(dev);
> @@ -466,17 +466,7 @@ static void ljca_auxdev_acpi_bind(struct ljca_adapter *adap,
>  		return;
>  
>  	/*
> -	 * get auxdev ACPI handle from the ACPI device directly
> -	 * under the parent that matches _ADR.
> -	 */
> -	adev = acpi_find_child_device(parent, adr, false);
> -	if (adev) {
> -		ACPI_COMPANION_SET(&auxdev->dev, adev);
> -		return;
> -	}
> -
> -	/*
> -	 * _ADR is a grey area in the ACPI specification, some
> +	 * Currently LJCA hw doesn't use _ADR instead the shipped
>  	 * platforms use _HID to distinguish children devices.
>  	 */
>  	switch (adr) {


