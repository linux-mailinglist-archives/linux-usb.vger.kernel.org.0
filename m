Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FFDC1CB23B
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2020 16:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbgEHOrP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 May 2020 10:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727097AbgEHOrP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 May 2020 10:47:15 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECBA3C05BD43
        for <linux-usb@vger.kernel.org>; Fri,  8 May 2020 07:47:14 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id u16so10874963wmc.5
        for <linux-usb@vger.kernel.org>; Fri, 08 May 2020 07:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ItCLlAEcrRObJaFc8zjZZAyKUelFuntamK73qSCmQaw=;
        b=YgqZnB4RuOjA//ot7PQ9SM6mgul9T3GJZb2JM7reEJLe+IRa9O5JM4sxrsNjR0uFU5
         1aINbi0xdDymbSd5NMRFOAUlhkiZJSJ5H/PBCFPow2nrWSbHP9TCNEs0b3CAEhZ0MXZm
         9iFJA99yXpzPTA8APDAoSVseaZx4zuWd4cjJRy/zHxouAK4ksI2q606UQp9HBOGcQTI5
         eGIf4zd7it3921mtpnBZIUzqmY9LEt97yFkyyPjm2/oDOpCMsQMexnCP9NeAmYWCvqtM
         HxhYnwelmI7R0hy/iKmgG0GdsTXOr/iGOlui5Wd4IXLYn1PXIGySXBQzfSR5VdEsiMgN
         VtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ItCLlAEcrRObJaFc8zjZZAyKUelFuntamK73qSCmQaw=;
        b=IFeZkICzrIf+n4bFTBKfMgNRIXrKg00hjWrMLjm83wj43IMXzcFBw2V51p515oo6vQ
         jBtsaHKeoqqJoCvGar/hdkyBmFEQJEU+sTd+6+K1nMomS+++UHRUPOofQShTn3uxf7EA
         CM8oapihIFoHWQpjc2FO6qEBPaLm1u6d5g5TnTc6NCYL+BihA89tLub+K8npk7T6MI/T
         ksCeAr4on7cFGWfYPaV9cNU7XLULGU/vvtIUqU2tZb2OmTq9tHgBYOND0Zg7Gajy2ydU
         oPN89oSeSO8EQa5ZoX35CSCMC5i8LuA7/8XQOlqll+Sdmz5BKXgpbnPpCFWbIlknLwDL
         J63Q==
X-Gm-Message-State: AGi0PuYcxPwFmqufY5HvgBhA5icGiUHhKtKHKr2UapVlM2YKVBbp3QFI
        y2iJdXvu6eevJSatm3RMaC+mhQ==
X-Google-Smtp-Source: APiQypJJLLVHe7P9a5jALuZCR8Qgg8gQxNUQSAW/hY0Oj3Nia5RYacq2Xq1z/snXUBGJ6do0AQO7/A==
X-Received: by 2002:a05:600c:224a:: with SMTP id a10mr17413046wmm.174.1588949233557;
        Fri, 08 May 2020 07:47:13 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id w18sm3344636wro.33.2020.05.08.07.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2020 07:47:12 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] Add TI tps6598x DT binding and probe
To:     Angus Ainslie <angus@akkea.ca>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     robh+dt@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, nikolaus.voss@loewensteinmedical.de,
        andriy.shevchenko@linux.intel.com, garsilva@embeddedor.com,
        keescook@chromium.org, linux-usb-owner@vger.kernel.org
References: <20200507214733.1982696-1-bryan.odonoghue@linaro.org>
 <20200508140132.GA1264047@kuha.fi.intel.com>
 <e1f5fac00b4d574edf187f2ccd19ebe2@akkea.ca>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <f6bd2b0b-1eda-8ea4-abf2-e17131b944d4@linaro.org>
Date:   Fri, 8 May 2020 15:47:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e1f5fac00b4d574edf187f2ccd19ebe2@akkea.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 08/05/2020 15:22, Angus Ainslie wrote:
> Hi,
> 
> On 2020-05-08 07:01, Heikki Krogerus wrote:
>> Hi,
>>
>> On Thu, May 07, 2020 at 10:47:31PM +0100, Bryan O'Donoghue wrote:
>>> V2:
>>> - Put myself down as sole schema maintainer as suggested - Andy
>>> - Fixed whitespace typo - Andy
>>> - Removed ifdef and of_match_ptr() - Andy
>>>
>>> V1:
>>> This simple series adds DT binding yaml and a DT lookup table for the
>>> tps6598x.
>>>
>>> Its possible to use i2c id_table to match the 'compatible = 
>>> "ti,tps6598x"
>>> and probe that way, however I think it is worthwhile adding a 
>>> specific OF
>>> way of doing it and having an accompanying yaml as an example.
>>>
>>> Bryan O'Donoghue (2):
>>>   dt-bindings: usb: Add TI tps6598x device tree binding documentation
>>>   usb: typec: tps6598x: Add OF probe binding
>>>
>>>  .../devicetree/bindings/usb/ti,tps6598x.yaml  | 64 +++++++++++++++++++
>>>  drivers/usb/typec/tps6598x.c                  |  7 ++
>>>  2 files changed, 71 insertions(+)
>>>  create mode 100644 
>>> Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
>>
>> There was already a series from Angus [1] for this. The bindings
>> looked a bit different, but I think we should use these, because in
>> the DT bindings from Angus there appeared to be definitions for OF
>> graph that was not used. Or maybe I got it wrong?
>>
> 
> I was trying to include optional components but was not sure of the 
> syntax so that might have been wrong.
> 
>> Angus, is it OK if we use these patches instead the ones from you?
>>
> 
> Yeah these ones will work great for what we need.
> 
> Sorry Bryan I didn't realize there was a patch already in progress.
> 
> @Bryan, I'm going to send up some extcon patches for the tps6598x soon 
> but maybe I should check and make sure you don't already have anything 
> planned there.
> 
> It still needs to be retested after cleaning up but it's the top 9 
> patches here:
> 
> https://source.puri.sm/angus.ainslie/linux-next/-/commits/next/extcon

Makes me glad I didn't try to touch the PDO stuff :)

That series looks fine to me.

The only other modification I have is here.

https://lore.kernel.org/linux-usb/20200507215938.1983363-2-bryan.odonoghue@linaro.org/T/#u

which is about data-role switching.

---
bod

