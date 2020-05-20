Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7C1C1DB168
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 13:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgETLVd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 07:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgETLVc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 07:21:32 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81432C061A0E
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 04:21:32 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id k13so2762847wrx.3
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 04:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Tpu8LW/1cVh2s0meM0mTep2LiLazAjkGMbpSe6tODh4=;
        b=bGb1ubY5VZvNgev4EhB4V/OLTjRyyFHawyjGOZ9GapnEfR0TJiUWXn5zAV4OzxqXGD
         wp7u25j0EP/Vlo67+5NGVO3elvnAXtr67sqVelfzNW7G9z1U65zgOrZvr5hQKva2VNmY
         a+yTi+0gnuCjz1wh4KkLhMXODu0UbAwr/o6byK9PtvyRD9XkDMnOFmB34TcYMbyG2HG4
         aXtwxSN0LtgiNMA9461ehXB8gHxUD1O4wZ2OACfC36v+q2sa5BtUZIybvuBCTxxPZpuc
         0HWePT4eCX8uOnwBH7GWED3ScAKowyHEQN+1Rb6auIc+AzAo6addU7gUxb1ejM9JemCc
         E1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Tpu8LW/1cVh2s0meM0mTep2LiLazAjkGMbpSe6tODh4=;
        b=AzBm8+ZKtvRdRy4xBdIwCnrFYLRmI9GBMBGuRxqnPCsG3F4ECs07AVXLQLSBMyCW7p
         R7ICHFEBBXd78Gh9LHM6w3dqBv0FlJ8Iz9VWLl2ih64LERa0vsJsTyKULYEmz2OBPrP4
         hkQAdR+nXAPtCT+LXhAsf/QSc8jPpMTbEmUdzJ403/7QGYBE7PyuSdiloa+bC+p9F04i
         C5bVJkMSyhe0s/M80msqEnozeqPOwBt9doaSafMkqPls2L3tqC6w3A/eCOdrDljVE17u
         lsCE79DcvYSiVP/be0OTWG5TdNT9dBEvF5KPe9nMXZp6w2EVNimVGIl+aNT9tgztbNIP
         dXBg==
X-Gm-Message-State: AOAM532Za+ECdnTZP28c90i07w6O3W/6qHWJ9vcxDzLAbVQmAkM10OkI
        KlqBAb67Igzv3fugkJCEq1bp6Q==
X-Google-Smtp-Source: ABdhPJzRMGchJzudajaSz+65N5cnUljB9+IHyuxA6NAqHl/OntVTTc+3IqWmAVdARbMqmrdZoyYdZQ==
X-Received: by 2002:a5d:4907:: with SMTP id x7mr3620148wrq.49.1589973691263;
        Wed, 20 May 2020 04:21:31 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id v131sm2953565wmb.27.2020.05.20.04.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2020 04:21:30 -0700 (PDT)
Subject: Re: [PATCH] usb: typec: Ensure USB_ROLE_SWITCH is a dependency for
 tps6598x
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
References: <20200520100526.2729-1-bryan.odonoghue@linaro.org>
 <20200520103542.GF1298122@kuha.fi.intel.com>
 <c1b5a729-6b2a-9c91-6ed0-94ffbc529fcd@linaro.org>
 <4f5aaa11-194f-24ad-bd8a-ce510b2bce94@linaro.org>
Message-ID: <49a6693e-ed9e-2de6-1dea-ba24b8a3ff4d@linaro.org>
Date:   Wed, 20 May 2020 12:22:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <4f5aaa11-194f-24ad-bd8a-ce510b2bce94@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20/05/2020 12:13, Bryan O'Donoghue wrote:
> On 20/05/2020 12:08, Bryan O'Donoghue wrote:
>> On 20/05/2020 11:35, Heikki Krogerus wrote:
>>> On Wed, May 20, 2020 at 11:05:26AM +0100, Bryan O'Donoghue wrote:
>>>> When I switched on USB role switching for the tps6598x I completely 
>>>> forgot
>>>> to add the Kconfig dependency.
>>>>
>>>> This patch ensures the dependency is there to prevent compilation error
>>>> when role-switching is off.
>>>
>>> There are stubs for the those functions, so there should not be any
>>> compilation errors.
>>>
>>
>> That's what I initially thought too, then I saw this.
>>
>> git show da4b5d18dd949abdda7c8ea76c9483b5edd49616
>>
>> but looking at role.h
>>
>> #if IS_ENABLED(CONFIG_USB_ROLE_SWITCH)
>>
>> int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role 
>> role);
>>
>> #else
>>
>> static inline int usb_role_switch_set_role(struct usb_role_switch *sw,
>>                  enum usb_role role)
>> {
>>          return 0;
>> }
>>
>> #endif
>>
>> That should work.
>>
>> Hmm, let me see if I can figure this out...
> 
> Well if I do this
> 
> diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
> index d53db520e209..636a5428b47e 100644
> --- a/drivers/usb/chipidea/Kconfig
> +++ b/drivers/usb/chipidea/Kconfig
> @@ -6,7 +6,6 @@ config USB_CHIPIDEA
>          select EXTCON
>          select RESET_CONTROLLER
>          select USB_ULPI_BUS
> -       select USB_ROLE_SWITCH
> 
> my build does this

ah ha - look at what role switch is defaulting to

CONFIG_USB_ROLE_SWITCH=m

So anything linked into the kernel image will not resolve those symbols
