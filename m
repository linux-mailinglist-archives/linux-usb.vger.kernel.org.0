Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1146422C2F2
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 12:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgGXKSl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 06:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbgGXKSl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 06:18:41 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B05C0619D3
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2020 03:18:41 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id s9so4918524lfs.4
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2020 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7EclUz1Qqwytg+0Nno7AvnVg+82K/uYYBDoctVjZ4v8=;
        b=lz++d/ltEHa2eeT3Y4z2sWoiku8TAJT5DzNBz/ituYaEbDpQE59vk8NBMyer29ezJU
         ZenKKYL+Z/MpGGTL40IGOFFagZIpCG8I8dqEJgFVQsiFk/eaFDC9InP3qry+NNIXvtmC
         iLkz1h4Xe0QN3qmw1B3eO00XP0+4y9QW2SVOuwOpf0n/0kryCGBt5T4vclWgH8vnYg99
         Nyh1h7I6Rv8PEZui4MkX54cYUHQfFahlgrlANDl7d1YePDRI+L1FC8j9XF40AG2OaGXP
         K26u87nzoeQU+POhrKBTLpvswyMBxl0IElLcMfa9CNLaYZRueYT1p3tAD2qwoB8wUUIF
         SXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=7EclUz1Qqwytg+0Nno7AvnVg+82K/uYYBDoctVjZ4v8=;
        b=QR1TY3Ijvs+TdoDtRP9LfaRJ+nQ22+8QZTEI1dhPJ+1iyiTCIMd5ZwywXvOvQZn8TL
         uLwSu+wTqt68ilWZ0jQr/Fz+0Mzd7OfmAxS+VCTy27bjaHwpe8xPXM+afvvqkraJX/SJ
         3F4kWObPGiBSg6pT9CE7djn+tnR8/k8o0Yp7edSOWmQ+Q7F0xH/5ThsOJ6Skj/vTvTYc
         UlPQo7Rc++xCzI8WCtTjIiXgoF18K0XEo8H0by+eiFKkFjsZOITUdqCeis4oOyfveo0V
         wcfzPRlAvmgLTN0SlG0s6Jo4JV9q9yOsmi37JrB+ThcxC5o1WgK0nIeKuFaLY6iIT4zX
         swRw==
X-Gm-Message-State: AOAM533f88PmVwV8NBWFaqry9HXsS0CZMqjF1Qbl09yOHS3KxhcJmwNf
        lC4WD+7/oHUScVVQS/emK07lV7jHmqg=
X-Google-Smtp-Source: ABdhPJxKuPd0NpqiWezAkPSufYaVgbX4J+HPATkYpeAKUcbmVTc1BBUgMTYe79gvlCW8cQh0TGHjqA==
X-Received: by 2002:a19:c752:: with SMTP id x79mr4484324lff.197.1595585919471;
        Fri, 24 Jul 2020 03:18:39 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:48a4:44fe:25f3:4dcc:b496:1546? ([2a00:1fa0:48a4:44fe:25f3:4dcc:b496:1546])
        by smtp.gmail.com with ESMTPSA id 16sm141925lju.100.2020.07.24.03.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 03:18:39 -0700 (PDT)
Subject: Re: [PATCH v4] USB: Fix device driver race
To:     Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
References: <ee32a093d43fe6631617c203ea7c86cb700ceac5.camel@hadess.net>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <cb19dbf0-8f4f-d60c-a93f-bd3b0ae67d09@gmail.com>
Date:   Fri, 24 Jul 2020 13:18:26 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ee32a093d43fe6631617c203ea7c86cb700ceac5.camel@hadess.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 24.07.2020 11:59, Bastien Nocera wrote:

> When a new device with a specialised device driver is plugged in, the
> new driver will be modprobe()'d but the driver core will attach the
> "generic" driver to the device.
> 
> After that, nothing will trigger a reprobe when the modprobe()'d device
> driver has finished initialising, as the device has the "generic"
> driver attached to it.
> 
> Trigger a reprobe ourselves when new specialised drivers get registered.
> 
> Fixes: 88b7381a939d

    It's strange that nobody has noticed... you need to cite the commit 
summary here as well, enclosed into ("").

> Signed-off-by: Bastien Nocera <hadess@hadess.net>
[...]
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index f81606c6a35b..6731a8e104bc 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
[...]

MBR, Sergei
