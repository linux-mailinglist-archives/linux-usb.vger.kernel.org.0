Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42FADBE5BF
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2019 21:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392358AbfIYTgf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Sep 2019 15:36:35 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35219 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392336AbfIYTge (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Sep 2019 15:36:34 -0400
Received: by mail-wm1-f65.google.com with SMTP id y21so33816wmi.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2019 12:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p94V9WRq+daHmYvAmIQ2PfZGdypfLEo3xdi9TUiERwg=;
        b=DvUJcXMILkhs3VkmO9VYg2lxH7dOTcZH/sXcPK/V65T/YsZoW96ej0R5pEWSmD5gkQ
         xpsvemA9aLsIoM6L9yXuKZGjLrkm4aI8zlC+oZqHWwZXcT1/Ti/R3lwSa5VT/tGPrXi2
         E2ydllx2XpuA7pFFOQB94FuptwLg79fmz7yHIAaS3ZtS/Q1HuL4P5ahBNHOdGNjyro4g
         y7XFfrxJ9x2G8f5XSB7AgR59vBhYvSbkDJZeYnboFkMZ/ipNXz8TSD7QjPKafjY4O7pS
         +jThqiHP0WqT/wBaZcctmzqxBH07OU8uN/LT6HhNJ9vzk1C6RjEas3cEWhqiXcDPu2B3
         hf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p94V9WRq+daHmYvAmIQ2PfZGdypfLEo3xdi9TUiERwg=;
        b=ejhMVQrlgI29r8NA4bnzXgb4jrZm+q7tUs1ZakfpzD/KZUPCLJ/GRIsXaVYk4GkHIS
         UvzDou2qZEJWCblNR51RajKQia8JgISNN3qomW9S27tCp8XGZ2SPPCxug8oVJHDvSwr/
         ZyNI4E7u5j9EB6+MNqQZTTpP8/jSS8Qilc8N4BtLCNCi5VbZs1ONk0P7jXLWKCydtijN
         Lra0R4dOuXBkg0pSolAilikOMi8uaoxLRLuuKkWj8+1WqaxjYGGrjFXHQvB8OHIzPvrS
         5+AykcwvD1Oq9pKsi/daA1OMC3j/e8u7NqZ0K7NfOlcZmmZQUnl+rbkwdt2zc9nsuNu7
         rsJQ==
X-Gm-Message-State: APjAAAVneQIACUf0uH6m8J2Mdb8jQTmM9p4ICvu0MkbCsYbdeuFhp6+h
        6EqBEOZftwdVK1B9YHjieDF6Wg==
X-Google-Smtp-Source: APXvYqy4vpxu6+iGfcndZrsDJb6j61BDy/2VyWQivm9qKdyDf8G6TF/ZHUk6aiJ71Eb1f6boQItpeQ==
X-Received: by 2002:a1c:66c2:: with SMTP id a185mr9113888wmc.2.1569440192871;
        Wed, 25 Sep 2019 12:36:32 -0700 (PDT)
Received: from [172.20.9.27] ([83.167.33.93])
        by smtp.gmail.com with ESMTPSA id l18sm7626wrc.18.2019.09.25.12.36.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 12:36:32 -0700 (PDT)
Subject: Re: Slow I/O on USB media after commit
 f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6
To:     Alan Stern <stern@rowland.harvard.edu>,
        Andrea Vai <andrea.vai@unipv.it>
Cc:     Damien Le Moal <Damien.LeMoal@wdc.com>,
        Johannes Thumshirn <jthumshirn@suse.de>,
        USB list <linux-usb@vger.kernel.org>,
        SCSI development list <linux-scsi@vger.kernel.org>,
        Himanshu Madhani <himanshu.madhani@cavium.com>,
        Hannes Reinecke <hare@suse.com>,
        Ming Lei <ming.lei@redhat.com>, Omar Sandoval <osandov@fb.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Hans Holmberg <Hans.Holmberg@wdc.com>
References: <Pine.LNX.4.44L0.1909251524520.6072-300000@netrider.rowland.org>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <c304abca-3ac2-fb19-1328-340ca4f18f80@kernel.dk>
Date:   Wed, 25 Sep 2019 21:36:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.1909251524520.6072-300000@netrider.rowland.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9/25/19 9:30 PM, Alan Stern wrote:
> On Fri, 20 Sep 2019, Andrea Vai wrote:
> 
>> Il giorno gio, 19/09/2019 alle 14.14 +0000, Damien Le Moal ha scritto:
>>> On 2019/09/19 16:01, Alan Stern wrote:
>>> [...]
>>>> No doubt Andrea will be happy to test your fix when it's ready.
>>
>> Yes, of course.
>>
>>>
>>> Hannes posted an RFC series:
>>>
>>> https://www.spinics.net/lists/linux-scsi/msg133848.html
>>>
>>> Andrea can try it.
>>
>> Ok, but I would need some instructions please, because I am not able
>> to understand how to "try it". Sorry for that.
> 
> I have attached the two patches to this email.  You should start with a
> recent kernel source tree and apply the patches by doing:
> 
> 	git apply patch1 patch2
> 
> or something similar.  Then build a kernel from the new source code and
> test it.
> 
> Ultimately, if nobody can find a way to restore the sequential I/O
> behavior we had prior to commit f664a3cc17b7, that commit may have to
> be reverted.

Don't use patch1, it's buggy. patch2 should be enough to test the theory.

-- 
Jens Axboe

