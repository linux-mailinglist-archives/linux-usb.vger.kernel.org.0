Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47BC137AF03
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 21:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231329AbhEKTEi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 15:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232071AbhEKTEh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 May 2021 15:04:37 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB299C061574
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 12:03:29 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id u16so19993762oiu.7
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 12:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qosnbeAaFDtVSaB4xit7DHJE79xLTaBvZ/12fULAHYM=;
        b=uuuAV+WOleL/hXbFxZYJ62A4sY/ROc3ELpChDl+S9iTJQ0pft/zEeiF8sd8jqCyiYP
         CgSjBUWyjh+ovvQmbnVUr2/pQ5LCAOqXVw9QmB2MlDtPXjuG2y04/jRBQVCD+WSb474K
         aLYWdQ4ktUkIbs3aJqIdhyG1Gs4GSZ8JWJMWc1oIwt0LbBwJEKHWbK+lyBsFdtMjmkLp
         Pz1KKm53iCcyvyzp/5M7wawhzwALLJinN6NW48eCCZt1fNkErZ+DisEmUHhZCeqBCuyM
         AJ7TPjoI37FBXv2U8Poy9Ego29loNtnZ0IMuS8CPrbf7Gade4C+98KrvCYSRGt8MtL27
         dBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qosnbeAaFDtVSaB4xit7DHJE79xLTaBvZ/12fULAHYM=;
        b=Ljhfr2F0fAmkDa9EOQ90U2+mrBTnt/CwdRPCQvY8V7E7l3f5YtMp5Tq8BOf7S8evz/
         NskBhN9qFvhlIbNUJt7X8aoHww0d1jzFNOGAaiHK96+KRzUyKgACmnFeXJHCRpweYQYO
         FsX5TKFwISBm4IkMBqM571nSQbF2IkxQzISl1vlZ8sQx/R1WzzJysYtARqxodT3n2I/o
         iXWv55IDcJvuIJgCntWWlcBlgj3ycVEaZ90XhEyPLA+4/aSKvALhQpMxLgrRMmcxa9jV
         KOTXDJctrBHF+8qAEN3TVuAQKvySvw/trkgfMcElxbvZmKu8axVnUcaSH1wGlKOZwmmh
         srAw==
X-Gm-Message-State: AOAM531D1P+CzPws1BFmkCvkzFHuXGyPbo0y9zu/IBhC9QpQpFMfs0ZA
        7MrNz+7/zfolnX8upR9ASqtTGyT6XN4=
X-Google-Smtp-Source: ABdhPJwYfgLvPuSyT0ssT9ruAWETf6CoNR9KHl6dnkLogFviaEHmkUOeMs4vnuKtuTkZVFyAWhCVnw==
X-Received: by 2002:aca:47d2:: with SMTP id u201mr4665940oia.19.1620759809115;
        Tue, 11 May 2021 12:03:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k16sm1240036otp.19.2021.05.11.12.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 12:03:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 1/2] usb: typec: tcpm: Call init callback only when
 provided
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
References: <20210511022224.1309077-1-bryan.odonoghue@linaro.org>
 <20210511022224.1309077-2-bryan.odonoghue@linaro.org>
 <f112c2b4-343a-f8a0-c00e-f020f34611dc@roeck-us.net>
 <d4a2889d-db11-69b3-5a62-13fad2ad6e18@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <71d7cdad-382c-f3a1-dd07-17d67bb2cd52@roeck-us.net>
Date:   Tue, 11 May 2021 12:03:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d4a2889d-db11-69b3-5a62-13fad2ad6e18@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/11/21 2:21 AM, Bryan O'Donoghue wrote:
> On 11/05/2021 03:44, Guenter Roeck wrote:
>> Are we going to see a driver with no init function ?
>> If not, I would suggest to make the call officially mandatory.
>>
>> Guenter
> 
> again in plaintext..
> 
> I have some tpcm code that doesn't need to put anything into the init function which is how I found this.
> 
> Its very much up to yourself on making init() mandatory though. I'm just as happy to redo the patch and add a check to the add port routine


No need, but maybe submit the code that doesn't need it together
with the change making it optional so we can see the actual use case.

Thanks,
Guenter

