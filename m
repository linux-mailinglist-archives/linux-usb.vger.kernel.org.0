Return-Path: <linux-usb+bounces-17054-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A843D9BB6B3
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 14:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB1701C22D5B
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 13:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83CCB7EEFD;
	Mon,  4 Nov 2024 13:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KTrcvgBa"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561644EB50
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 13:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730728291; cv=none; b=Pw+vD7JkQ6qhTuoTBO4SnzfSmmhbKjz+vvHENbVzJLUASmoiQzfj2Wj3KFscRaX6QGMBSYE17dKExeZCd5/NomVj1Zp96m7xlL6dVunelgSmGC6sU7PMh9VZgERMfavaLkJwx1SB0n8xiFRuUGy8gkLpVpY72qEoREljYjoviY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730728291; c=relaxed/simple;
	bh=hp5hEbArKXU4KRxw09tHKeCKWLpnK8BfIOlXLQs2KkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ISVisaly94yWJTc0TV5BZDDM0+Ee5tggrYDE/vExF9pJ46dfOh8hwc6kg3smp+SvTA2HNKM2qyysQBpigjDVm7lsxwxqrwWgu2X7Z0U6+//fZx1RajmEVa9yIL0ttb9S9hmv2ijsoMQZ8eHW4mX31xZMw/r5qXCLIebOaZ35BVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KTrcvgBa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730728288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3lF5IASooUpctwR6379w6BrGwF+LjoXzeDnJDL0nY1w=;
	b=KTrcvgBaKhtIRdDNeIAxwFLVAtBjoG+q48qIRFBoJru377/2QF2fGF0L3Rk3PYIyHn7Fcz
	kfedtCfkKLnt5XYt/sQ6WfCXCqf09swC0MOqDKi0cbVDt8S17Loq6IuY6MjzqgLa3OKhJ6
	bHh/7ngktMSrcoPkOglLbk00gZ9sQ08=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-dIjoz0nwNT-8JCLMUV44Ag-1; Mon, 04 Nov 2024 08:51:27 -0500
X-MC-Unique: dIjoz0nwNT-8JCLMUV44Ag-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a9a2ccb77ceso333790866b.2
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2024 05:51:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730728286; x=1731333086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3lF5IASooUpctwR6379w6BrGwF+LjoXzeDnJDL0nY1w=;
        b=I6TKIVVBbNqHCjmeNgFXjZN7LBa6JjvUmR2nj2IORyj/lJCvu4mHgP5bOnK40+8N82
         j5vbqHZUpix8U1Y90GAoa+oWxBnPIQFOgjwwnG1sXJLK9FKuaNeCkNDgiRG2+TlutET8
         U6+43vk8OwRu1WSqjtNc29OOEby6tE6TG8ZEyvbXyBT+cJHRrirlMJ9VX94unRYox80F
         l5jU9CboBgJ1kW/JNKjv6L3GknXZ4Y7LdEMVCv24xeATRn7yiGhSvJNjxmRg2NF3lyZr
         f3HubEpRSg7gQ4EXo1t2uWmB9MvIousL4yevxmOvH89YH3dLojqb39h2PomoioyI/C7w
         sGvA==
X-Forwarded-Encrypted: i=1; AJvYcCXhA/BD89Ub9SX/eoGog/SetE4WG85u0CsCvRbOm6qWjdZ5Z/inR/L+E6vHVubvPlVzRskf3gYyI84=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI1jZhrzm8H2tAQJFEqLSt2lqFs3ejoTDw7B64+96tSFD6wqRd
	9M1B5XeEA3WpRAsBdtufQ6sehQvyBLDR93z421C/DDLW1j5i4HCq/au8Ubsy6CkxqgrsfQQui5D
	xStDJYQUktvbANbRmvP6ElXioPKylHvDBf6hPv5FCXSb9mnoTCqp+bd/9fBNcuzEKlA==
X-Received: by 2002:a17:907:94d0:b0:a9a:634:dd2 with SMTP id a640c23a62f3a-a9de61ceb81mr3223925166b.43.1730728285830;
        Mon, 04 Nov 2024 05:51:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCt+/cu1ypDKgoUBzKPTM743ISHFqGr1yn9jl+X24jkZ+AUXjHhFN4T7MJiP/kdMO3JRCqLg==
X-Received: by 2002:a17:907:94d0:b0:a9a:634:dd2 with SMTP id a640c23a62f3a-a9de61ceb81mr3223922166b.43.1730728285370;
        Mon, 04 Nov 2024 05:51:25 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e5669941dsm558916366b.221.2024.11.04.05.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 05:51:24 -0800 (PST)
Message-ID: <2d9e2b58-18d9-476b-badc-70089ff453f1@redhat.com>
Date: Mon, 4 Nov 2024 14:51:24 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] usb: misc: ljca: print firmware version
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-usb@vger.kernel.org
Cc: Wentong Wu <wentong.wu@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20241104085056.652294-1-stanislaw.gruszka@linux.intel.com>
 <20241104085056.652294-3-stanislaw.gruszka@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241104085056.652294-3-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4-Nov-24 9:50 AM, Stanislaw Gruszka wrote:
> For diagnostics purposes read firmware version from device
> and print it to dmesg during initialization.
> 
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I have also given this a test run on a "ThinkPad X1 Yoga Gen 8" and
everything there works at least as well as before:

Tested-by: Hans de Goede <hdegoede@redhat.com> # ThinkPad X1 Yoga Gen 8, ov2740

On this laptop the reported LJCA firmware version is:

[   25.704000] ljca 3-8:1.0: Firmware version: 1.0.0.544

Regards,

Hans



> ---
>  drivers/usb/misc/usb-ljca.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> index 062b7fb47114..0f8751c51bf6 100644
> --- a/drivers/usb/misc/usb-ljca.c
> +++ b/drivers/usb/misc/usb-ljca.c
> @@ -43,6 +43,7 @@ enum ljca_client_type {
>  
>  /* MNG client commands */
>  enum ljca_mng_cmd {
> +	LJCA_MNG_GET_VERSION = 1,
>  	LJCA_MNG_RESET = 2,
>  	LJCA_MNG_ENUM_GPIO = 4,
>  	LJCA_MNG_ENUM_I2C = 5,
> @@ -68,6 +69,13 @@ struct ljca_msg {
>  	u8 data[] __counted_by(len);
>  } __packed;
>  
> +struct ljca_fw_version {
> +	u8 major;
> +	u8 minor;
> +	__le16 patch;
> +	__le16 build;
> +} __packed;
> +
>  struct ljca_i2c_ctr_info {
>  	u8 id;
>  	u8 capacity;
> @@ -694,6 +702,24 @@ static int ljca_reset_handshake(struct ljca_adapter *adap)
>  	return 0;
>  }
>  
> +static void ljca_print_fw_version(struct ljca_adapter *adap)
> +{
> +	struct ljca_fw_version version = {};
> +	int ret;
> +
> +	ret = ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_GET_VERSION, NULL, 0,
> +			(u8 *)&version, sizeof(version), true, LJCA_WRITE_ACK_TIMEOUT_MS);
> +
> +	if (ret != sizeof(version)) {
> +		dev_err(adap->dev, "Get version failed, ret: %d\n", ret);
> +		return;
> +	}
> +
> +	dev_info(adap->dev, "Firmware version: %d.%d.%d.%d\n",
> +		 version.major, version.minor,
> +		 le16_to_cpu(version.patch), le16_to_cpu(version.build));
> +}
> +
>  static int ljca_enumerate_clients(struct ljca_adapter *adap)
>  {
>  	struct ljca_client *client, *next;
> @@ -810,6 +836,8 @@ static int ljca_probe(struct usb_interface *interface,
>  	if (ret)
>  		goto err_free;
>  
> +	ljca_print_fw_version(adap);
> +
>  	pm_runtime_set_autosuspend_delay(&usb_dev->dev, 10);
>  	usb_enable_autosuspend(usb_dev);
>  


