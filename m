Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6AE51560B4
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2020 22:25:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbgBGVY4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Feb 2020 16:24:56 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38290 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbgBGVY4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Feb 2020 16:24:56 -0500
Received: by mail-wr1-f65.google.com with SMTP id y17so563925wrh.5
        for <linux-usb@vger.kernel.org>; Fri, 07 Feb 2020 13:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z63nmHRlBmWLm42TGgaeYFUrGEwxVh8/NUBVm4zNBBY=;
        b=UnkFtEoPtv3cND7lEewEyQP0UM1oP9UfH5z42CIQeluCCqWuhqoqakKxsGPiFr4gzM
         T8TYI2CNT4uAJ5B7Pku3n5hY02jhoB1HFyMW1+w3uLN8NN2gI4KnpZDXPtk/p3nfNT+9
         3lenpitfS/UjIw0y6a3gaRxR8KysD/U2e9ESrz/wdKidkvtqQ0gfvgwx4tb9YccBjGPY
         FtaRRbanhmtQJl0KiqWfdiONHnYqJNCXJP0m1YKquzKhhHpoBJPuWj++cAHAvzTLmwqC
         qq5HNi6B65jj0fCY9WoADo6mWpCCGiGf5o6G3H0LnrNy0Fu6SF/FhRc6J+gzS35yhwmt
         n63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z63nmHRlBmWLm42TGgaeYFUrGEwxVh8/NUBVm4zNBBY=;
        b=lAkOc27qqCt8hwT9LGqyuor7ul7H41pRsV98Txsupy1hwb/eJvQc1pC0DBhKgS8pAu
         F9rvawnEjDjI24BI1SMB/p8uT1JDKRc8hLTiJUTXtd6wGSik2OBtgR5jIeF8LLmZDFuK
         pCqdo4qoG5Gbn/sWqMzFeOiYUXlEgRCifzq+S+G4bVPoyomhcvyi0VtMpuMo5zs4AnVY
         CP7cMPJZy54z/zg/mipqGQI/XuTmvdQLhH8UP9LbBI6HzY92TvWLcPDk5e+hXQqBT0qA
         v375S/+vkzcsM1f/8EIRJ8sXgPR6x9wC01GlWAQuUWfWTcpRCG/q2QqeGG7ol3zot7BR
         hJGg==
X-Gm-Message-State: APjAAAVeq7I0K1It4GHBlOM+v7QzwePyi1lH70i6K6nERAOFQ7rwEv/6
        kAY5zyEfH96pGLc7VdLj1h0wKQ==
X-Google-Smtp-Source: APXvYqxhjdrSLmr5eYFYl8KoH8+86JTXvqpPSIgO2DOaDze3FoHSCBDTDC4Y6agRQ/Te8jWRoF2QAQ==
X-Received: by 2002:adf:eb51:: with SMTP id u17mr1019344wrn.29.1581110694446;
        Fri, 07 Feb 2020 13:24:54 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id e6sm4742647wme.3.2020.02.07.13.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2020 13:24:53 -0800 (PST)
Subject: Re: [PATCH v5 09/18] usb: dwc3: qcom: Add support for usb-conn-gpio
 connectors
To:     Jack Pham <jackp@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
 <20200207201654.641525-10-bryan.odonoghue@linaro.org>
 <20200207204315.GA18464@jackp-linux.qualcomm.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <c1fab2e5-a11d-2f08-92a0-59c075153ed5@linaro.org>
Date:   Fri, 7 Feb 2020 21:24:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200207204315.GA18464@jackp-linux.qualcomm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 07/02/2020 20:43, Jack Pham wrote:
> Hi Bryan,
> 
> On Fri, Feb 07, 2020 at 08:16:45PM +0000, Bryan O'Donoghue wrote:
>> This patch adds a routine to find a usb-conn-gpio in the main DWC3 code.
>> This will be useful in a subsequent patch where we will reuse the current
>> extcon VBUS notifier with usb-conn-gpio.
>>
>> ---
>>   drivers/usb/dwc3/dwc3-qcom.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index 261af9e38ddd..fc66ca3316ef 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -550,6 +550,21 @@ static const struct dwc3_acpi_pdata sdm845_acpi_pdata = {
>>   	.ss_phy_irq_index = 2
>>   };
>>   
>> +static bool dwc3_qcom_find_gpio_usb_connector(struct platform_device *pdev)
> 
> Why not just squash this patch into "[PATCH v5 12/18] usb: dwc3: qcom:
> Enable gpio-usb-conn based role-switching" where it is actually used?

IMO its best practice to have smaller patches.

This one adds the routine.
12/18 uses the routine but also

- Triggers a notifer role-switch binding
- Adds an if/else for extcon

Believe it or not I had an internal debate about splitting #12 into two 
patches !

---
bod

