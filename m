Return-Path: <linux-usb+bounces-3131-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 446647F35E5
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 19:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51B01B21913
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 18:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D222955C30;
	Tue, 21 Nov 2023 18:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L0mOpnKr"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBEF318C
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 10:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700591349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E2kgZUqh4YN3kuh9w9quInDBCqas/0qHNpCsiDxrgHo=;
	b=L0mOpnKrIWG9CzNUmuQxs+lDp5Uqp062frh9vwwNIrgNhHRdPr7KIGEZweAyMdPD/ZxI4j
	kgphHZYPUyEp5kRisxWhLIfIwjFGnXK4oqr0Vu0nHOXafsOi2a0qhZhC58DGhk5TbbRBgo
	vE3tteHmUBL73rifFjFnPGPUx8wP5FE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-bfDih28dMyuSRE0J0fnhYQ-1; Tue, 21 Nov 2023 13:29:07 -0500
X-MC-Unique: bfDih28dMyuSRE0J0fnhYQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a02aa8a129fso51353766b.3
        for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 10:29:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700591346; x=1701196146;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E2kgZUqh4YN3kuh9w9quInDBCqas/0qHNpCsiDxrgHo=;
        b=U9xyqLDFPndIap0cz0gP9pIfZVcHRh1cz+xa+RylpqzWAyZKxjjUPLG7h61v3/GEMi
         5EjBwomFLnQISjgP6t329dz/jbvVJm/IOmypH9V0zEUEerm1vKTlA02J4JyD9gbAAU2u
         ZqG1eQwGRakp5kP4MiueiqxlfHVCE2YhLZOkM5P8R6SKLBbSgOi6T0YvBZx4VgnHOUYn
         2w5i2J0HTN8EfCESZXw2BKSMdxV2cBqSbDmAT3OLqGS/DZVdq7uppgsSmaHxF3rraozZ
         FhQLAvvnI2U8tt+PhRFX0X9XyFZHz7SyKD1Sw0OAzyLuRSKyat+VG7GgUh3kfwtT1MW+
         c1Ow==
X-Gm-Message-State: AOJu0Yx3hi1PkScn/Ifa3K1WpYb0wGte6et89ex1G/TrYHhNvhKLD7Je
	4K1YR/NTfA9v+/KzGa5klzPhwjrmiRxgaRb0pq1/45FWo7Z7HtBK4Uu4hNO9znuOnnqeB/s9kVu
	iQCE9BSvw+ySN87RJkYFb
X-Received: by 2002:a17:906:fc13:b0:9e2:af47:54c9 with SMTP id ov19-20020a170906fc1300b009e2af4754c9mr7743221ejb.19.1700591346692;
        Tue, 21 Nov 2023 10:29:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7G0BKFAOnN2k+98sPYUhbWMvtHiRwspjkltuVgDU201IS1z9jEoZ1ovFS9khQ0vuCB/4xRA==
X-Received: by 2002:a17:906:fc13:b0:9e2:af47:54c9 with SMTP id ov19-20020a170906fc1300b009e2af4754c9mr7743204ejb.19.1700591346355;
        Tue, 21 Nov 2023 10:29:06 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029? (2001-1c00-2a07-3a01-06c4-9fb2-0fbc-7029.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029])
        by smtp.gmail.com with ESMTPSA id l18-20020a170906645200b009ad89697c86sm5606991ejn.144.2023.11.21.10.29.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 10:29:05 -0800 (PST)
Message-ID: <4eff7cff-3136-44d0-bf83-0d803122f9da@redhat.com>
Date: Tue, 21 Nov 2023 19:29:04 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: misc: ljca: Fix enumeration error on Dell
 Latitude 9420
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Wentong Wu <wentong.wu@intel.com>, Oliver Neukum <oneukum@suse.com>,
 linux-usb@vger.kernel.org, stable@vger.kernel.org
References: <20231104175104.38786-1-hdegoede@redhat.com>
 <2023112109-talon-atrocious-ad46@gregkh>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2023112109-talon-atrocious-ad46@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/21/23 15:05, Greg Kroah-Hartman wrote:
> On Sat, Nov 04, 2023 at 06:51:04PM +0100, Hans de Goede wrote:
>> Not all LJCA chips implement SPI and on chips without SPI reading
>> the SPI descriptors will timeout.
>>
>> On laptop models like the Dell Latitude 9420, this is expected behavior
>> and not an error.
>>
>> Modify the driver to continue without instantiating a SPI auxbus child,
>> instead of failing to probe() the whole LJCA chip.
>>
>> Fixes: 54f225fa5b58 ("usb: Add support for Intel LJCA device")
> 
> That commit id isn't in Linus's tree, are you sure it's correct?

Sorry no idea where I got that commit-id from, probably from when
I was carrying the patch in my personal tree for testing it.

I'll send a v3 with the correct commit-id.

Regards,

Hans


