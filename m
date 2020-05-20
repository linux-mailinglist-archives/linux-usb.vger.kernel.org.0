Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E13E1DB833
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 17:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbgETPao (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 11:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgETPan (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 11:30:43 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4550CC061A0E
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 08:30:42 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id i15so3562019wrx.10
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 08:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EgTtNaBhBPUTYFIWc4Kw7+D+hyuByUZ6JeHc9lXYe5k=;
        b=WvYCbWZ5Fj5uNe1qwdx9qEer8Uwkl9+Wxo3oynXPSp/esO4p4dYj3DXHPNvkpF27q/
         TTQaDpaZRz1EWVXAo4h+V2odQ71yj6snVtAz6nHqYf8XOBNWNErdtAzA/47CNuP0gUjx
         dSob/0IumtdWoftf0HKMaXGXJ4kPuvi1B5MaSTH5QslkdF9lzrpO+LSzxREY2NvAxOsg
         LaBXHuiM3whFnkjr2NfV6PeDJnDW6wFaVpSr19mgecjejJQ4JEki33U0byubYrQhQT8Q
         o/GcjqWAWKv4m7Qps7+OQh74tp/tU/sI2H0cmq5Out2y6oR6YtWkQVO7igREIAHjPGXb
         4waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EgTtNaBhBPUTYFIWc4Kw7+D+hyuByUZ6JeHc9lXYe5k=;
        b=XFY+HgED9mLnEhdzr/D6xakFQ0fN3ReP6Odjl1ZJ8MJiU1xsjLSBryXvAM4uOsGUbd
         3hUitTsbDRNkC+xjBI28hUa+Z0w1OS6MaeSvcRcl3n7Tb9jrdvwQMTZVsQlh0LjJNjBd
         CD3+9ly3VSJDePv4v6umhUSmEF3YAxzgjFUaaE14EKmNVUg+8abngx320hlMTMFPHGBY
         PJoGUYWYSrzFpLhjZqTpAFR6ZK9Ud+FQBYqnFBzkYKJAIFbbFCbOaUrO4vgbgUM0MvG4
         r8oA6ElEvn4JaIwACGBG0O5ww/wxu28I/WiP7h9vGtBPKahX3HYZef8YMY7oYEkRlb0b
         gRoA==
X-Gm-Message-State: AOAM533eOkozrJdQm/hQ3n57DpIE6tCSCsO15piBD544pYThRuMYBAaF
        YIISn3/hs/3129rYWtCKzbh6iHzW8R8=
X-Google-Smtp-Source: ABdhPJwmjvgUpShvWf/Lrheb+0kQXSrNpE27vFr/8wcVeRD5Sh19mNvAuRXZ0OBdtmfUnOqPrdrJaw==
X-Received: by 2002:adf:e5c9:: with SMTP id a9mr5058176wrn.292.1589988641012;
        Wed, 20 May 2020 08:30:41 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id b7sm3312238wmj.29.2020.05.20.08.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2020 08:30:40 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] usb: typec: Ensure USB_ROLE_SWITCH is selected for
 tps6598x
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
References: <20200520123312.320281-1-bryan.odonoghue@linaro.org>
 <20200520123312.320281-2-bryan.odonoghue@linaro.org>
 <20200520131728.GJ1298122@kuha.fi.intel.com>
 <ae7915f0-be5b-1756-c51a-b839ec3de8eb@linaro.org>
 <16b990e1-2046-23e8-f4be-bf1f8659313b@linaro.org>
 <20200520133942.GA1910854@kuha.fi.intel.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <edc593de-16d0-0e72-d749-89a354336f75@linaro.org>
Date:   Wed, 20 May 2020 16:31:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200520133942.GA1910854@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20/05/2020 14:39, Heikki Krogerus wrote:
>> to do what you want to do - shouldn't we have to make all of those "select
>> USB_ROLE_SWITCH" into "depends on USB_ROLE_SWITCH" ?
>>
>> i.e. make all of the consumers depends on instead of selects ?
> Yes, ideally.
> 
> thanks,

I've built the offending x86 version, instead of my more contrived 
version deselecting USB_ROLE_SWITCH from the chipidea

-       select USB_ROLE_SWITCH
-       select REGMAP_I2C
+       depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
+       depends on REGMAP_I2C


works - we can look at the depends stuff for the consumers later, I'll 
send the above now to fix the build.

---
bod
