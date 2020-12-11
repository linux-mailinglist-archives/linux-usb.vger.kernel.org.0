Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8847C2D78DD
	for <lists+linux-usb@lfdr.de>; Fri, 11 Dec 2020 16:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404185AbgLKPNu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Dec 2020 10:13:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392751AbgLKPNW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Dec 2020 10:13:22 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D9FDC0613CF;
        Fri, 11 Dec 2020 07:12:42 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id s75so10165611oih.1;
        Fri, 11 Dec 2020 07:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s3h0dLytB1IDZ/ht7+weWbdt57gQOut6q6WDYmaaLv0=;
        b=E4gfO7L4+OhLkz6Rnbhq6LER0jHIrx8jOk3SqPhamN4jMQAGBx2ducH+NXHaqR94U8
         EPaqUtHqfTtHjKjKWjBhCTHCFw7c771gmC64tUVZq0pdAq8pUTszAz+uXqd6CfNRMUZV
         jFOkicHOkrIR1oIQpnhxAJpwVYAY00uf2SXwDu/UPf65gURzMhIHghDkzaojMaaBLMMH
         mDk/yr14hYXh2VXqniowARmlv5l0NXFEp3Xm/OyVflWJBoiyvcXnShzhNG2TdoP3dUq8
         I+ifaIFjRAB+PjaA4SBwxE5IrzaEha2LT9sSrFKlfNO2fMWuolO+uTVOps9eouiyZSYS
         1Yzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=s3h0dLytB1IDZ/ht7+weWbdt57gQOut6q6WDYmaaLv0=;
        b=dJZbV9Jac+fJ0hYuCVfpnXKBQgSaiKiKKGaiFz6h3ST75v556luRTBJaGTY/8DyNkC
         ROCYpyzDSUWCKYgP/TvMh51l7orADHTPrEBng8jR/TERHi6QSBi7HwP3ivjS8EbfHwGM
         kbwkCqircwWvI7xfoJcDKzdE2NUUU7yG8Ssf7hHkSpbhPDszGq+fgtL9Lna+M55BxaxL
         NCrhFbANvCZ8+8GWPMPNIFlSg/K99VbbTBmo1f04nxiP0NquMmJ5TAfVH46goLodPdXq
         AyDEdXdTiq0wJqpAj8qfziBze04wVLOvHjkiAFtSczJ2pwwyVz7BP6OsBISilRpS3PL5
         sqsg==
X-Gm-Message-State: AOAM531h7SX9hEx1hOfaO6pbYvVi/6XOjzHduR2rEkTEvPzu/KM7evwL
        ek//hRFf/zp0qm/djGCTyC5jp2kfd2M=
X-Google-Smtp-Source: ABdhPJzoxYTpnNI6Rd/RVnNHEf7xucs63UT7z6bdcq0WptEEI+8VFRKKj8HK6KURE45i4pUPefawTw==
X-Received: by 2002:aca:f44f:: with SMTP id s76mr7428046oih.120.1607699561767;
        Fri, 11 Dec 2020 07:12:41 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s23sm1876986otr.59.2020.12.11.07.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Dec 2020 07:12:41 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 1/1] tcpm: Fix possible buffer overflows in tcpm_queue_vdm
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Xiaohui Zhang <ruc_zhangxiaohui@163.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201209030716.3764-1-ruc_zhangxiaohui@163.com>
 <20201211100939.GJ1594451@kuha.fi.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <71be94d7-24f0-46d7-ba74-e61572007721@roeck-us.net>
Date:   Fri, 11 Dec 2020 07:12:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211100939.GJ1594451@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/11/20 2:09 AM, Heikki Krogerus wrote:
> Hi,
> 
> On Wed, Dec 09, 2020 at 11:07:16AM +0800, Xiaohui Zhang wrote:
>> From: Zhang Xiaohui <ruc_zhangxiaohui@163.com>
>>
>> tcpm_queue_vdm() calls memcpy() without checking the destination
>> size may trigger a buffer overflower.
> 
> Thanks for the patch, but I didn't actually see any place where that
> could happen. I think the idea is that the callers make sure the count
> does not exceed VDO_MAX_SIZE before calling the function.
> 

Yes, when I wrote the code I made sure that this is the case.
If that is no longer true, we have various other problems because
the count is assumed to be in range pretty much everywhere.

Guenter

>> Signed-off-by: Zhang Xiaohui <ruc_zhangxiaohui@163.com>
>> ---
>>  drivers/usb/typec/tcpm/tcpm.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>> index 55535c4f6..fcd331f33 100644
>> --- a/drivers/usb/typec/tcpm/tcpm.c
>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>> @@ -1045,7 +1045,7 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
>>  
>>  	port->vdo_count = cnt + 1;
> 
> That should have been fixed as well, no?
> 
>>  	port->vdo_data[0] = header;
>> -	memcpy(&port->vdo_data[1], data, sizeof(u32) * cnt);
>> +	memcpy(&port->vdo_data[1], data, min_t(int, sizeof(u32) * cnt, VDO_MAX_SIZE - 1));
>>  	/* Set ready, vdm state machine will actually send */
>>  	port->vdm_retries = 0;
>>  	port->vdm_state = VDM_STATE_READY;
> 
> Unless I'm missing something, I don't think this patch is needed.
> 
> thanks,
> 

