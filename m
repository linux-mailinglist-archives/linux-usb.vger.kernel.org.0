Return-Path: <linux-usb+bounces-2472-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C317DF991
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 19:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B25A21C20F9B
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 18:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CA821112;
	Thu,  2 Nov 2023 18:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N31XFBmm"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C1021108
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 18:08:16 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B9F01FEB
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 11:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698948338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QRXwdss2hObuvqlvs2MkvKOylIPYK80PqIiStFR+MfM=;
	b=N31XFBmmyKJij7bFUoRHbmSwRTstqjeLZS0Zt+tYoI0dmek64IzhL2SylDzRxgwSf0vAXk
	prDi6PMMFjxynAap9/SoT+pZSAWsfxr/EQRmh0J3ZKN7R07r6+O7ovlbTSc7SjwxG5J3Ow
	tfisdnbcHok4jRtOljJw67f/maQK5PE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-ypzruzi6N2KKF6OoVYNzXg-1; Thu, 02 Nov 2023 14:05:36 -0400
X-MC-Unique: ypzruzi6N2KKF6OoVYNzXg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9ae57d8b502so95551666b.2
        for <linux-usb@vger.kernel.org>; Thu, 02 Nov 2023 11:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698948335; x=1699553135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRXwdss2hObuvqlvs2MkvKOylIPYK80PqIiStFR+MfM=;
        b=VoKb4orSyq/EyojtXfK/YELDscvXIs5Qu6vnDbTCoh3SyCkJtFmGBzGq9IXIu8INDC
         HiMw6hOkrruHf1yY8pBmxztxKTanG4sIfLjbgWz1VUbsgue2ri1ScmCkRWhAyyV/Q/q3
         Incfb/DPAAPSwI7FBzij5zH1dCOySDzSgb/ieo724o2ez/xcSnOHUC1jiukJ1rlyLWdS
         /LknJBtp23MPPUWTNJM8ZU1ucvWpKa4dDWnpi9I0FHoAv6EfPkQA2S26kzQESsNj+k56
         dnIDgU3vmW5h7kftCKQnVQCM7RPtKv+ZKnNBTTJSYUPFl7rwuK6AMxM969TmphGP7NAN
         qtOA==
X-Gm-Message-State: AOJu0Yz4GMbWhh/n8QjTbI2carqftm5cDp5XKE6Dlkq3V/DS7qYKTPjO
	EayXyyHTYI0jzsEnTMydniofFu4dmKpQb6d9HRlR/5NrAqih+lpk4QlQpfL5cxvjWL6Q0E0Rw3v
	DN5mZHZ1dNKIRUlf9oabC9/eOWL3T
X-Received: by 2002:a17:907:7b87:b0:9bf:80f0:7813 with SMTP id ne7-20020a1709077b8700b009bf80f07813mr5555748ejc.16.1698948334935;
        Thu, 02 Nov 2023 11:05:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbRVGd830Q+4A/j7z/PpnzGilaHeD8Dbg6M0NQiQOV6RTTi57hjl4gqqnXE75QEJ0a3v+OJw==
X-Received: by 2002:a17:907:7b87:b0:9bf:80f0:7813 with SMTP id ne7-20020a1709077b8700b009bf80f07813mr5555728ejc.16.1698948334641;
        Thu, 02 Nov 2023 11:05:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e10-20020a1709067e0a00b009b2ca104988sm1415634ejr.98.2023.11.02.11.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 11:05:34 -0700 (PDT)
Message-ID: <841a0653-15ed-268f-d702-c97be7482ca8@redhat.com>
Date: Thu, 2 Nov 2023 19:05:33 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] usb: misc: ljca: Fix enumeration error on Dell Latitude
 9420
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Wentong Wu <wentong.wu@intel.com>
Cc: Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
References: <20231102164817.547128-1-hdegoede@redhat.com>
 <1027800d-7740-c52e-e372-9993888ecd8e@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1027800d-7740-c52e-e372-9993888ecd8e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sergei,

On 11/2/23 18:25, Sergei Shtylyov wrote:
> On 11/2/23 7:48 PM, Hans de Goede wrote:
> 
>> Not all LJCA chips implement SPI and on chips without LJCA reading
> 
>    LJCA chips without LJCA?

Heh, will fix for v2.

> 
>> the SPI descriptors will timeout.
>>
>> On laptop models like the Dell Latitude 9420, this is expected behavior
>> and not an error.
>>
>> Modify the driver to continue without instantiating a SPI auxbus child,
>> instead of failing to probe() the whole LJCA chip.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/usb/misc/usb-ljca.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
>> index c9decd0396d4..24f781782c56 100644
>> --- a/drivers/usb/misc/usb-ljca.c
>> +++ b/drivers/usb/misc/usb-ljca.c
>> @@ -656,10 +656,11 @@ static int ljca_enumerate_spi(struct ljca_adapter *adap)
>>  	unsigned int i;
>>  	int ret;
>>  
>> +	/* Not all LJCA chips implement SPI a timeout reading the descriptors is normal */
> 
>    Comma missing after SPI?

1 line comments typically don't have any punctuation, also notice
the missing period at the end. With that said I'm happy to add
a comma for v2.

> 
>>  	ret = ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_ENUM_SPI, NULL, 0, buf,
>>  			sizeof(buf), true, LJCA_ENUM_CLIENT_TIMEOUT_MS);
>>  	if (ret < 0)
>> -		return ret;
>> +		return (ret == -ETIMEDOUT) ? 0 : ret;
> 
>    I don't think the parens are necessary.

They are not strictly necessary, but IMHO the code is more readable with
the parens.

Regards,

Hans



