Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86A7A248FB2
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 22:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgHRUts (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 16:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbgHRUtr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 16:49:47 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F360CC061389
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 13:49:46 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id 185so22926451ljj.7
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 13:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kCrG8wKoogsNXE92HvV11eWHJdwt+iZPNrQD0ogv+dk=;
        b=Zud3AcHT1i+CA4Ke8mSxtwMG6tgfHv4kEoyf4BdAe0LaIBs3CCZBJIkb39PAi0Nubd
         HBgV1e1Js3TzGj8J9MzFlVxMACZooWoc1wXIIaAXkdUPU4toYTv++NfXw45/knwml14m
         TqC3eAhtshhbvveV3DZQYxhW5GMrB+Y8Ya2D1BS/Oymf0WATM5A+yR831ZJjnKs8XT7m
         5KYunP+VfRkttqZtjF6obw4KOz8pdvYttWJWsatzcGjgvPY33us8nDUs7gMME5juHwVx
         Ir7+/ZNRd2OEzJZCkZBnMjFK0WP8rrtedgjMl9DAx9wvIfmTevlsayCLhSvsFdEmdcGS
         t7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kCrG8wKoogsNXE92HvV11eWHJdwt+iZPNrQD0ogv+dk=;
        b=LRK1aSX1PGCVfnoLMXeS1iwOYp3KUcqUWuUDCag71Vj0DE4b6MRA0eeABL0l8iHc1m
         RiI78OP+FFPoNvff1PHAm4xhAp+D4aCGTqnSgDvch+/bYs94NqmLbcvBFaXP2b3LpKdK
         2sec1Ua2lnCpbGjI3RraqIYrj07u5nxw2YGjqoBW9MVmmZPbMEzSXwhT5LL0k1RFgX1R
         eGZJ0vMywZCkaK1Qs2ZjAGmRMSM97760d1vjCbEhiToHioy7dUA5Q5YORgjHc0duZ4OX
         /RHOJ7B7IV7+uwvVXobY95qGNEiPbXHJzDVb6HyfGFlRZaUz3GUs2HFhbdVp05WstubH
         yXKA==
X-Gm-Message-State: AOAM5310SuiIGajgG1w5lw1mnViU1w0EtYYfBfjTrXD29ZMH4bym4XZB
        FSNhGvwjZwY+S/1+kbnPyy7BvNR2Wfeh5w==
X-Google-Smtp-Source: ABdhPJwigkjz5D4Mfx4sfUsckdnwXjTpCw5aSl4ctuuBHYrX+gtBQe4MxhJ31wGrKctRm1HgSXZf4w==
X-Received: by 2002:a05:651c:204f:: with SMTP id t15mr11522928ljo.308.1597783785435;
        Tue, 18 Aug 2020 13:49:45 -0700 (PDT)
Received: from wasted.omprussia.ru ([2a00:1fa0:424f:ab22:7b8d:b6f2:b3c2:e0c1])
        by smtp.gmail.com with ESMTPSA id o2sm6764179lfi.50.2020.08.18.13.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 13:49:44 -0700 (PDT)
Subject: Re: [PATCH v8 3/3] USB: Fix device driver race
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200818110445.509668-1-hadess@hadess.net>
 <20200818110445.509668-3-hadess@hadess.net>
 <fdfc0146-5b7f-1805-3c35-68c662b2651d@gmail.com>
 <20200818172901.GA152667@rowland.harvard.edu>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <a4e87e78-7ce4-efaa-55a7-7fe7c33094c5@gmail.com>
Date:   Tue, 18 Aug 2020 23:49:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818172901.GA152667@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/18/20 8:29 PM, Alan Stern wrote:

>>> +	} else {
>>>  		printk(KERN_ERR "%s: error %d registering device "
>>>  			"	driver %s\n",
>>
>>    Unrelated but... hm, this string literal seems weird. GregKH, would it be OK if we fix it?
>>
>>>  			usbcore_name, retval, new_udriver->name);
> 
> Indeed, an extra tab character snuck in there by mistake.  It has been 
> present ever since 2006, when the routine was originally added by commit 
> 8bb54ab573ec ("usbcore: add usb_device_driver definition").

   And meanwhile it got copied to another function, usb_register_driver().
I guess it's OK to fix both w/one patch?

> It's perfectly okay with me if someone wants to remove the extra tab.  
> In fact, nowadays we'd remove the line break entirely.

    It seems this wasn't needed even in the 80-column era...

> Alan Stern

MBR, Sergei
