Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07AE61913BC
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2020 15:57:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727940AbgCXOzf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Mar 2020 10:55:35 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40717 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbgCXOzc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Mar 2020 10:55:32 -0400
Received: by mail-lj1-f196.google.com with SMTP id 19so18874003ljj.7
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2020 07:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BNd0h3fsVcT6k8d64lGb4UxIfYz4swlJdfLJY5I84Pk=;
        b=LnXgAgYwJnh4LyNLf6Ei0tES9O4ek/ykjW3ITZ+X43dvYS7Ob00W597ztY5ZO6ftDg
         LAyQ8TkGy2IMIv1mwYwM3GUW2wGTlOEZtL+pcWQMoan2Xztfv0St5RZkqg5C83J37JkZ
         HXAqLmlpJBkZ1yPXRbL/b1lbZbU7+4UbmCV0ucehy7Jj2u+AoNpVWpYvu8fffUdGhm55
         LKsz9OvlTP3PSTVn9lqnGP16ngUvc8PzX1mqq1h6yiO4iPPTMuEmKkoLdbh5mOqPqSCU
         vhIT5t1FPMsUV3B1NmUfy7F5cLdqk6wDO14j7xTO43eecWD9nIal5MK3PBWXhKoWKkzq
         Ndrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=BNd0h3fsVcT6k8d64lGb4UxIfYz4swlJdfLJY5I84Pk=;
        b=jYJymSPAOQwlMtkI86Sy6/ZQrRH+ipwzTlAJzii/+nuRrqb+uZ9cyWXwY0AT3UpUWd
         FvwwfNgVI3s3aJj1h5isxIQIrof0g6f3z+7VucRBvMyablo4XDcVe85tmKF+MmYXH1nO
         10kzKr9AmWDNCEAgWDbM7GVqaOZ9lHPrvzfHSbGJYrk6DxbfP4ZMJTyC/CkaKf2jOyKU
         gso7KDmhhNTymjU7YO9RWf8+Hx0QiBtekPUKdPI3gtu1MeSy3Ucr/95nsizwmm+Y8Wbc
         +kM7w2T7J3/s5EkKz2bNqv6U9axXHMjqEE0BFeUduZiIegyHNLjyI2dBSLDBtmoB88Cb
         byLQ==
X-Gm-Message-State: ANhLgQ05BDQHQ6q5W4BMVXiNcO31DkiuCIdyVjSXj1WuVyiYxcGY/Thi
        9+Ro+yUbadZ0WGBev9d3trLYOQ==
X-Google-Smtp-Source: ADFU+vsBL16mOCk78Gq17PBMvQLAA6Qth2JMTHL5EZhA1UfaBW61ACz13l083keat7MBz0Xg2o16kg==
X-Received: by 2002:a2e:858d:: with SMTP id b13mr9091346lji.227.1585061729549;
        Tue, 24 Mar 2020 07:55:29 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:42d3:3567:1f77:9f32:8c0:b337])
        by smtp.gmail.com with ESMTPSA id q8sm3440800ljj.77.2020.03.24.07.55.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Mar 2020 07:55:28 -0700 (PDT)
Subject: Re: [PATCH v2]usb: gadget: bcm63xx_udc:remove redundant variable
 assignment
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Tang Bin <tangbin@cmss.chinamobile.com>, cernekee@gmail.com,
        balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20200324132029.16296-1-tangbin@cmss.chinamobile.com>
 <a0afd44f-177d-ad21-02b5-93b15b29399e@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <82d75ffd-0df5-d41c-7b3e-615d97c1838a@cogentembedded.com>
Date:   Tue, 24 Mar 2020 17:55:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <a0afd44f-177d-ad21-02b5-93b15b29399e@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 03/24/2020 05:50 PM, Sergei Shtylyov wrote:

>> --v1------------------------------------
>> In this function, the variable 'rc' is assigned after this place,
>> so the definition is invalid.
>>
>> --v2------------------------------------
>> In this function, the variable 'rc' will be assigned by the function
>> 'usb_add_gadget_udc()',so the assignment here is redundant,we should
>> remove it.
>>
>> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> 
>    NAK.
> 
>> ---
>>  drivers/usb/gadget/udc/bcm63xx_udc.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/udc/bcm63xx_udc.c b/drivers/usb/gadget/udc/bcm63xx_udc.c
>> index 54501814d..a7afa8c35 100644
>> --- a/drivers/usb/gadget/udc/bcm63xx_udc.c
>> +++ b/drivers/usb/gadget/udc/bcm63xx_udc.c
>> @@ -2321,8 +2321,6 @@ static int bcm63xx_udc_probe(struct platform_device *pdev)
>>  	if (rc)
>>  		return rc;
>>  
>> -	rc = -ENXIO;
>> -
>>  	/* IRQ resource #0: control interrupt (VBUS, speed, etc.) */
>>  	irq = platform_get_irq(pdev, 0);
>>  	if (irq < 0)
> 
>    This *if* branch goes to the 'out_uninit' label which uses 'rc' (and it should
> be negative).
>    In principle, if you change 'rc' to 'irq' below, this patch would be sane.
> It's not as is.

   Still, the other *goto* out_uninit in te loop below shoild be changed as well.
Otherwise, if the result is overriden to -ENXIO, e.g. deferred probing is borked.

MBR, Sergei
