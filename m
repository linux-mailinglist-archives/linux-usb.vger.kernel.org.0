Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E801344EFE7
	for <lists+linux-usb@lfdr.de>; Sat, 13 Nov 2021 00:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233565AbhKLXGN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Nov 2021 18:06:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232265AbhKLXGM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Nov 2021 18:06:12 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF153C0613F5
        for <linux-usb@vger.kernel.org>; Fri, 12 Nov 2021 15:03:20 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id d5so18139258wrc.1
        for <linux-usb@vger.kernel.org>; Fri, 12 Nov 2021 15:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dCpjDXFOFZqLtbOzTQIk6/6cDmr7++hUg3HtVfNMbEk=;
        b=MYN6q+1BGpoB2XoBPXGKdiJwgjvB2mfqiwnyV5oqdwfWwWvOfQWwyD1lla9DxlJ5LU
         DLZSf8WWZ+czQdex2kRfn/yAbOxx645Nm9eGTbMtYPOj0P6NygEQVyoF9EWT1/atCmu+
         t2z+mZaJnV1FyKRXeDqOJmbWbANZxA0Mu5TDWo+erBYSgrZ0s+h7z7XVUL4DwHi3K3L7
         Tqt20xihGRivgtYH3mBsiJN9cQ9DewVIvHZDPD8xIvzoreFcyX1j8pPa9EkxKIheYFL1
         8eH7RKNiuxDmMXxKSH1TcoRHmkNb+iSTD8Hn91oMgTfb7AyUS3qahP9yL5xc3VG91ChU
         AvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dCpjDXFOFZqLtbOzTQIk6/6cDmr7++hUg3HtVfNMbEk=;
        b=UozzJlmKpqDWRcilsJomeAeO3NlotfAWbn80N00Jplq6JpoI5OZlDEpAiL3ikvF1eJ
         Bo6c4c35qh3oMqNfGRd8TZvU1o8gEB6S7uPJ6y6DMWUmwPYhtRa0KctKtP9FTr9H5Qgp
         aH7VY9whwiiV8F54nE3XObfmwKQ92QEu6DeBNDg+EKik83Q/O3o89Rk4+Jlcom4Yvq5x
         2OU+Db2RUr11XbnJQu1H51Ix52fqfouB27/+JPVLYIUPauqRnEMmpnt/y66u7WEkqwtK
         h7fDUF94Gbc0OrWU18WWX1rZeOUZPutqu1iKXDpUiGmdahJAChvh9MTzcUZ8TaI7rR3V
         3y0g==
X-Gm-Message-State: AOAM530U4Q6rrLqex+uqqvavb+XK8vj1HtCNB1bxg+MRzUz6cxC0JrvH
        2pI48RaI5u9x+vzv0UaxRXqlOg==
X-Google-Smtp-Source: ABdhPJwifE+82ngNTeiIycVB2T0xpNr78gzko1WzfFUKqPfUuG49rD4VwvhdjtGM4prOXsr4Gqo8PA==
X-Received: by 2002:a5d:5651:: with SMTP id j17mr22884802wrw.166.1636758199399;
        Fri, 12 Nov 2021 15:03:19 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id z7sm12531139wmi.33.2021.11.12.15.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 15:03:18 -0800 (PST)
Message-ID: <07f52f4b-c733-87e6-7158-32de50172fdf@linaro.org>
Date:   Fri, 12 Nov 2021 23:05:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v3 5/7] dt-bindings: usb: Add Qualcomm PMIC TCPM YAML
 schema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>
References: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
 <20211105033558.1573552-6-bryan.odonoghue@linaro.org>
 <YYlaqTYhe4hbXhFf@robh.at.kernel.org>
 <60841bf0-f5ea-314f-34c6-822a8812000d@linaro.org>
 <CAL_JsqKtesGfaJ+81jaWzB1kD_qXeehv7hrvXh3x=cpo15Ny-g@mail.gmail.com>
 <4195f05a-e926-246c-5276-ec38750909cb@linaro.org>
 <YY7p7jviA3ZG05gL@robh.at.kernel.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <YY7p7jviA3ZG05gL@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/11/2021 22:25, Rob Herring wrote:
> Your other option is instantiate your own device from the virtual
> driver's initcall based on presence of the 2 nodes above.

This sounds a little bit more like what I'd like to do, I'll investigate it.

---
bod
