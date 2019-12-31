Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7F712D522
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2019 01:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbfLaAEs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 19:04:48 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38597 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727751AbfLaAEs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Dec 2019 19:04:48 -0500
Received: by mail-ed1-f66.google.com with SMTP id i16so34130417edr.5
        for <linux-usb@vger.kernel.org>; Mon, 30 Dec 2019 16:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UIBxewMY3nznL5SvEmEa+wyozMXEUAHnk3liBvERPKU=;
        b=TAKO2iXFBSZsFGt6ExVr9s00eJyYE3rUuhfN5gJzCxeNbrBhiIarX0jWV+AtPKb2Ye
         d1ZLpKKaRCqmxrTmY5JUwQ5NxsMDSUZPOSOXLESoSY6VMdlrCMvV5VFxyRONMwBoBVOV
         m32x0kFwnVLNqpChO8YH8C73CaxVFNqV0FQVKLwYPpbcZroxR0mwPHn0yNfzQOs6w2aK
         q0t4tGrTkCA19oGSxVivd2mzcZe2+77A4n3z4qq1KkVaJxU4f2uBMS2riRLfQ6rRg2Xy
         QfxyJk475yfJ9yWtycqzQWo+YUkkmZeS2bE2Kn4COAjX2SAA4ibITr/6Aw3+GzYxp+DI
         6wZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UIBxewMY3nznL5SvEmEa+wyozMXEUAHnk3liBvERPKU=;
        b=Ot+aJ5MrHzX+0nCP+q2cE+ZTfGZ3+1O4tX9TIYKdJmmEYfY+Y/k55ul6G4UlJELHYf
         1wp6Jsvp5jEoXWG4JcSdCT5nLYh27HWwZZ/vUozjUK/KCToK4gzVYF0xi+wtu8f8VSgW
         k5M9afUhNX3Z4A78Cv56xjRGuu4NUkPPQCiIXaj3x7bJ3oFQ0kOwyLMaFKK6XgkJpKG6
         gw/EpL06CT1ueaBB51z6xmed+krOGWXUo1e0XDwYNTjYK1Ha8a1aU9DIL7eyIvluwDwo
         EjhXZ5vXfxdS30DliCkZETQKmvvs6Kcs6T4ot8cryqb2pfS5WjsExsECdYCCtwOariQD
         YdKQ==
X-Gm-Message-State: APjAAAUQXBrM43iwCKl6vycjaJf22d/cZjl0MHTTup14cdyS1Dk8kaAD
        UlTk72VSqWL9zxYL4BO78L7xj3/DPvQ=
X-Google-Smtp-Source: APXvYqwrGbb4SHIthcmfY8qpeubECSaNaWzkINorfKEu9z7KardRZNr+vadbrl3GmAECP0kKhYu/Sw==
X-Received: by 2002:a17:906:3591:: with SMTP id o17mr74979351ejb.209.1577750686139;
        Mon, 30 Dec 2019 16:04:46 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id o15sm5506653edj.3.2019.12.30.16.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2019 16:04:45 -0800 (PST)
Subject: Re: [PATCH] usb: dwc3: gadget: Fix failure to detect end of transfer
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191230161321.2738541-1-bryan.odonoghue@linaro.org>
 <20191230185703.GA1763367@kroah.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <e772c382-b820-355d-f2b9-8690a5f85885@linaro.org>
Date:   Tue, 31 Dec 2019 00:05:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191230185703.GA1763367@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 30/12/2019 18:57, Greg KH wrote:
> On Mon, Dec 30, 2019 at 04:13:21PM +0000, Bryan O'Donoghue wrote:
>> A recent bugfix 8c7d4b7b3d43 ("usb: dwc3: gadget: Fix logical condition")
>> correctly fixes a logical error in the gadget driver but, exposes a further
>> bug in determining when a transfer has completed.
>>
>> Prior to 8c7d4b7b3d43 we were calling dwc3_gadget_giveback() when we
>> shouldn't have been. Afer this change the below test fails to complete on
>> my hardware.
>>
>> Host:
>> echo "host" > /dev/ttyACM0
>>
>> Device:
>> cat < /dev/ttyGS0
>>
>> This is caused by the driver incorrectly detecting end of transfer, a
>> problem that had previous been masked by the continuous calling of
>> dwc3_gadget_giveback() prior to 8c7d4b7b3d43.
>>
>> Remediate by making the test <= instead of ==
>>
>> Fixes: e0c42ce590fe ("usb: dwc3: gadget: simplify IOC handling")
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   drivers/usb/dwc3/gadget.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> I think this patch:
> 	https://lore.kernel.org/linux-usb/ac5a3593a94fdaa3d92e6352356b5f7a01ccdc7c.1576291140.git.thinhn@synopsys.com/
> 
> should fix this issue instead, right?
> 
> If not, do I need to include both of these?

Yep, works fine in isolation.

