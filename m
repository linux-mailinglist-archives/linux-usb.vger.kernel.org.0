Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DCB215560B
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2020 11:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgBGKun (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Feb 2020 05:50:43 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38211 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbgBGKum (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Feb 2020 05:50:42 -0500
Received: by mail-wr1-f66.google.com with SMTP id y17so2096276wrh.5
        for <linux-usb@vger.kernel.org>; Fri, 07 Feb 2020 02:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=s3siQdVwUR2AQJspUWLBveOF5d5gEtnXKp3bye6ABQ0=;
        b=NMvwM94IBWfiDjGgUZiNve+xmIFm23S+iTOyrmyZM9GuK6WJKYkzqVTZJ7+iQZ2X7D
         OGtNV09th4X3ZMgbmqTATg10cOtTsMEWpetXpUYb7Un0PDB2tNTuqDQnScsZa7s0r1B3
         QQTfMIJmn/RizMM77L/r2T/NYEzO9Je5nsOy/gHqmYoNQ0lzYKJKD1iIeDlvZ4IQIm2t
         wP76v1J7+wMS9t9Y1SWnJdb/cABuV21q+UBcwjCWKzoNwTDsGLoJwKQPV6wbK+w7CYKK
         FLW7l9Cuu8NWv613/cmq0CdBqzxphpbfMUICsxEnY9aOiYhCNA6MSewcADdE8FlnfxXz
         nrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s3siQdVwUR2AQJspUWLBveOF5d5gEtnXKp3bye6ABQ0=;
        b=iKTpBi5Qhn7zT+4rWZdCSvv4UOWw6LEhn5VFOflDbZawALhNePr8ZbnbvAgpFCuG5K
         Hlv6MN+VTnzgoKVSnZyX3F7yucibUiS1CnqrWBuqLJK/MOLsPx8WCRigi9E609WFrrAM
         NEHMyeIYMV6eK+M16M2KKWbLfiOVGmmxrtEL7Ohb7pzVuQQHVrrQAH7I0IHZBnp4u8ex
         rVCuy/njDcgaZZo2PczlUiv0idNSaoaXf3gc68Tjpahj3Fwx7lOo9DRg12PyawLpTrtH
         wyfrem0sMOjUSLlMR4pWJ/XHVbjjyBOFQXrLvYcmmMbULGw4epOuSpZnWquj2BZZHv6a
         UGwA==
X-Gm-Message-State: APjAAAX4W4HwyjyzpC2YJ5CUB8ji5m4gAmjSOMW5244cX7Wj4GRutJDH
        dvz08lvtFDz8s/dVur1zuLm+ow==
X-Google-Smtp-Source: APXvYqz2kV1/VNj2vtLrqOvcxHp2oruPVYMQmZgXomeA4NxtqVu+akd5vZjo2btRinJtOKthW1IARg==
X-Received: by 2002:adf:ee01:: with SMTP id y1mr4305931wrn.152.1581072640457;
        Fri, 07 Feb 2020 02:50:40 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id y185sm3050539wmg.2.2020.02.07.02.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2020 02:50:39 -0800 (PST)
Subject: Re: [PATCH v4 09/18] usb: dwc3: qcom: Override VBUS when using
 gpio_usb_connector
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Manu Gautam <mgautam@codeaurora.org>
References: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
 <20200207015907.242991-10-bryan.odonoghue@linaro.org>
 <20200207080729.GA30341@jackp-linux.qualcomm.com>
 <2bd67925-14cf-5851-14a2-c51a065fac6c@linaro.org>
Message-ID: <453bfea7-4085-1a24-84ad-30c7671665e7@linaro.org>
Date:   Fri, 7 Feb 2020 10:50:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <2bd67925-14cf-5851-14a2-c51a065fac6c@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 07/02/2020 10:36, Bryan O'Donoghue wrote:
> On 07/02/2020 08:07, Jack Pham wrote:
>> Could the usb_role_switch class somehow be enhanced to support chaining
>> multiple "consumers" to support this case? Such that when the gpio-b
>> driver calls set_role() it could get handled both by drd.c and
>> dwc3-qcom.c?
> 
> It is probably necessary eventually, but, per my reading of the 
> documents and working with the hardware, I couldn't justify the 
> additional work.
> 
> However if you think this patchset needs the toggle, I can look into 
> getting the indicator to toggle here too.
> 
> We'd need to add some sort of linked list of notifiers to the role 
> switching logic and toggle them in order.
> 
> Similar to what is done in extcon now for the various notifer hooks.

Maybe I'm wrong...

Looking a bit closer at the role-switch code it might be possible to 
register multiple devices _as-is_ so long as you have a pointer to the 
relevant parent...

---
bod

