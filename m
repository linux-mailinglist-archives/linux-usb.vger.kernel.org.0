Return-Path: <linux-usb+bounces-17469-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BAB9C52E0
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 11:14:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06262280FE8
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 10:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0972123DD;
	Tue, 12 Nov 2024 10:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W32lFz6T"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21E421217C
	for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2024 10:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731406444; cv=none; b=i8Ebg1luEA90ykZwhYnsZDEbn/3mby3Vi+2280Gi5Ma6V6SSkK4Cz0ZqE13kKR53moyfwq+NoKAORFPKNtu6q/ILOPrRComsQt4+lB47SHHCy3I/F9bQN1kvpu/XBoYfSs0b5X8rmlnYG9bplTvEeRU3MeIEV7GwPeCCJpq80Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731406444; c=relaxed/simple;
	bh=kTSEeYO9uLuip2rqs4uMM1R/jUqENgcFEGf14fCjQGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JuZlhT/OsrvzrTNVjmPm9AyZaVN1sJLRv9KLALOYg7NdOy/UsMnshN2GAx4i+jRQi52yEf5pTJLqFKcFB+hrYsyRp5TNvzlP6ReG4/nemY9mNRDJ18LKRiKD/2KgKAba+mgUN6MsWcnoCQsHaFLf4uLHsJJoXMMU21ekItSsyJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W32lFz6T; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731406441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZwSF5D49HipZ56t6XJsI1ol4Ef+NR1BeAomPoPwHktw=;
	b=W32lFz6Tx9OMmCcQ8MWX2DEiBY2BuYrmjKVvvsUzIDWrw2drw5X8ljgYh1NmbEbPlLzWzu
	JLJK3oUL0VsLIBaXVLWvpyDSeMkMsVW3errGJMNSfaibUXKzKiT8z2yQjG2bCndU426Ktg
	uDDgZyYD52biEZC06x4OO2EBx9M1Uww=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-5IsXsHIsNiqCTzCpJ3nnLA-1; Tue, 12 Nov 2024 05:13:58 -0500
X-MC-Unique: 5IsXsHIsNiqCTzCpJ3nnLA-1
X-Mimecast-MFC-AGG-ID: 5IsXsHIsNiqCTzCpJ3nnLA
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a9a0710ca24so410654766b.3
        for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2024 02:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731406437; x=1732011237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwSF5D49HipZ56t6XJsI1ol4Ef+NR1BeAomPoPwHktw=;
        b=AtfqNvrArqjUu4JiPvHKJl3HzUxOvYVHseGEcfAYsSzBajBoUgcBDXSOoniMWsY9uo
         UlncpB2MZDevjY741RC6KN2nkU3iC8PocSWzf+6GUw1JPDZ6t0WGi8BtHydzFTcs/Wsy
         vqzu7bkOpouzWZA1BPh7a4UBnSZuysOuox3KGxH0Q1w+22umBEptma1oevz94mJouSqc
         0hy55QaLs2mKcZmtNFw4GRbR4mL2gpLVBg1C6Wh7zrHe9UP7xNDzubWcO30Uu2VpVLAR
         c9VyUPIcDuUGiX7c3d2eiQcMzOqQO7iqK6hW2O1i0W4FNoRSFjhrs8fCIK10f2Xdb52I
         FQEA==
X-Gm-Message-State: AOJu0YxDMHck1VC1bnyMD6+8cnRrdZqcE/DPBFOnUug81QyOyQe3S2dU
	Y2Qt+pIJC3tCt2bMmYHRNuFQ5rgsDAeKZ2Cw57IMl7ROjloGjcwUOSZXt+z36Fr+mYREAHa4YEd
	q99pfElhfYeHwpcrXdtceBhgu6av+fJFafRQSTgxT6U8vSN9GPbKagLExLA==
X-Received: by 2002:a17:907:d13:b0:a9a:1918:c6c6 with SMTP id a640c23a62f3a-aa1b1024d9amr233921266b.8.1731406437511;
        Tue, 12 Nov 2024 02:13:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHe0E6YnuKHlwChgFWM+tXTgBO+8bOVIoI2EqRr14i83kIHdf0V1FAB9KpUxPtVDUM/xMp9Vg==
X-Received: by 2002:a17:907:d13:b0:a9a:1918:c6c6 with SMTP id a640c23a62f3a-aa1b1024d9amr233918966b.8.1731406437120;
        Tue, 12 Nov 2024 02:13:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0abf47esm695801766b.88.2024.11.12.02.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 02:13:56 -0800 (PST)
Message-ID: <48a4d4c6-0c85-4daa-952a-808829a6cfc7@redhat.com>
Date: Tue, 12 Nov 2024 11:13:55 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] usb: misc: ljca: move usb_autopm_put_interface()
 after wait for response
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20241112075514.680712-1-stanislaw.gruszka@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241112075514.680712-1-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Greg,

This patch 1/3 + patch 2/3 together fix an issue causing the camera to not
work on quite a few ThinkPad models.

Can you maybe pick up patch 1/3 + patch 2/3 already, while
Stanislaw works on fixing 3/3 ?

Regards,

Hans


On 12-Nov-24 8:55 AM, Stanislaw Gruszka wrote:
> Do not mark interface as ready to suspend when we are still waiting
> for response messages from the device.
> 
> Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
> Cc: stable@vger.kernel.org
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Tested-by: Hans de Goede <hdegoede@redhat.com> # ThinkPad X1 Yoga Gen 8, ov2740
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
> v3 -> v4: no change in this patch
> v2 -> v3: add A-b tag from Sakari
> v1 -> v2: fix handing error of usb_autopm_get_interface(),
>           add R-b, T-b tags from Hans
> 
>  drivers/usb/misc/usb-ljca.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> index 01ceafc4ab78..8056c65e4548 100644
> --- a/drivers/usb/misc/usb-ljca.c
> +++ b/drivers/usb/misc/usb-ljca.c
> @@ -332,14 +332,11 @@ static int ljca_send(struct ljca_adapter *adap, u8 type, u8 cmd,
>  
>  	ret = usb_bulk_msg(adap->usb_dev, adap->tx_pipe, header,
>  			   msg_len, &transferred, LJCA_WRITE_TIMEOUT_MS);
> -
> -	usb_autopm_put_interface(adap->intf);
> -
>  	if (ret < 0)
> -		goto out;
> +		goto out_put;
>  	if (transferred != msg_len) {
>  		ret = -EIO;
> -		goto out;
> +		goto out_put;
>  	}
>  
>  	if (ack) {
> @@ -347,11 +344,14 @@ static int ljca_send(struct ljca_adapter *adap, u8 type, u8 cmd,
>  						  timeout);
>  		if (!ret) {
>  			ret = -ETIMEDOUT;
> -			goto out;
> +			goto out_put;
>  		}
>  	}
>  	ret = adap->actual_length;
>  
> +out_put:
> +	usb_autopm_put_interface(adap->intf);
> +
>  out:
>  	spin_lock_irqsave(&adap->lock, flags);
>  	adap->ex_buf = NULL;


