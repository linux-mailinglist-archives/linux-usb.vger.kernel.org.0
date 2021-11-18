Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C196E455E59
	for <lists+linux-usb@lfdr.de>; Thu, 18 Nov 2021 15:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbhKROlD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Nov 2021 09:41:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbhKROlD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Nov 2021 09:41:03 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45A9FC061574
        for <linux-usb@vger.kernel.org>; Thu, 18 Nov 2021 06:38:03 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id d1-20020a4a3c01000000b002c2612c8e1eso2493005ooa.6
        for <linux-usb@vger.kernel.org>; Thu, 18 Nov 2021 06:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2h+oaqnOMHvS+xynA4IjCWs1MfrcdOhsNZmXnZGUZls=;
        b=WaZSlN6bI+Hy/w/P4y8dpmziv8hBz/CymhH8GEYm6/dW9EArb/KqtUsDDqwvyFqfg+
         c15XAy0cPwOm7d1Nl/hic4vwfa4rn6DHtjVkvKUWCWHAbDqY5wY3Nr10+DiwW0q4fvmG
         Wn/AOUfC0yD1C8cSNUgEfQ/SgdbWS4U+lmCkCSUbOEs309dQjcJCNDKlYHaa8OjoMugJ
         gzJRJB93MZ/M3fpTrZD8Y4/FN9dOZ6Pym3nqVE5lOxvKv8SPTld4LDKN05WS3VnfXqfQ
         05HyYjo6G/W5buKehmiT9XvNxG+wKAyVOaufk13JLkVR0QRrRlzBxck+ItjFy9fKMfgd
         hN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2h+oaqnOMHvS+xynA4IjCWs1MfrcdOhsNZmXnZGUZls=;
        b=IYbqYZmMojQix9Reyyo8TklpUbhrWNn2epQxo6EF8kAHCb/LR+sTU4NXKeoLH1MnzN
         W21NnYuiav2fu1zame5xrBUA0ol9jhLS9aB5gsXYfXFulvuDi61Lmw9ol1IB5iDu+VsS
         FTnh3Pyvij7weqxun4u3dQD2Jlu+T/5FrqA5rW9dUDvCEXgTbPa5XT53Ptd2VGg2DUMk
         ulY4vZOk3sTmhe4jtxLnoUPBhGamb7i1Kr+og0TBOJLfVUi+J2OKZSajC3nVG5VjVORo
         iz9ktpMlGolTZ/jc2r3NMnueCqnKmGaD4VwLkSyVh6wV9fJKY/Gsm0rKp95j7rsYNGYU
         +PSg==
X-Gm-Message-State: AOAM533n6AoaaT2mzp2pWr122v2vOabMtcW7JAfU5I9sVEng+Ke+mz9i
        +n/Oz1110BEy7WC8ju1qfr0=
X-Google-Smtp-Source: ABdhPJztXoY6GirUySdmzlpDOc4sSDNyoj0tqVLk7uuuduxghUAlT4iQvll3VH+xEqg7tWL9lf6gSA==
X-Received: by 2002:a05:6820:622:: with SMTP id e34mr13957703oow.19.1637246282580;
        Thu, 18 Nov 2021 06:38:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t5sm541823ool.10.2021.11.18.06.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 06:38:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Xu Yang <xu.yang_2@nxp.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, linux-imx@nxp.com
References: <20211118092352.259748-1-xu.yang_2@nxp.com>
 <YZZSpffDfPd/CJDX@kuha.fi.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] usb: typec: tcpm: fix tcpm unregister port but leave a
 pending timer
Message-ID: <c4b51f6d-fd3c-1fb3-6ee3-18ca37dd171c@roeck-us.net>
Date:   Thu, 18 Nov 2021 06:38:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YZZSpffDfPd/CJDX@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/18/21 5:18 AM, Heikki Krogerus wrote:
> Hi,
> 
> On Thu, Nov 18, 2021 at 05:23:52PM +0800, Xu Yang wrote:
>> @@ -6428,6 +6432,9 @@ void tcpm_unregister_port(struct tcpm_port *port)
>>   {
>>   	int i;
> 
> You need to take the port lock here, no?
> 
>          mutex_lock(&port->lock);
> 
>> +	kthread_destroy_worker(port->wq);
>> +	port->wq = NULL;
> 
>          mutex_unlock(&port->lock);
> 

I don't think the timer code runs under the lock, so that won't help.
But, yes, the code is inherently racy. At the very least, port->wq
would have to be set to NULL first, but even that would have to be
synchronized. I wonder how other drivers handle that situation.

Guenter

>>   	hrtimer_cancel(&port->send_discover_timer);
>>   	hrtimer_cancel(&port->enable_frs_timer);
>>   	hrtimer_cancel(&port->vdm_state_machine_timer);
>> @@ -6439,7 +6446,6 @@ void tcpm_unregister_port(struct tcpm_port *port)
>>   	typec_unregister_port(port->typec_port);
>>   	usb_role_switch_put(port->role_sw);
>>   	tcpm_debugfs_exit(port);
>> -	kthread_destroy_worker(port->wq);
>>   }
>>   EXPORT_SYMBOL_GPL(tcpm_unregister_port);
> 
> thanks,
> 

