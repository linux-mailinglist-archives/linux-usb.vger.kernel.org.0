Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0B9336FF39
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 19:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbhD3RKu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 13:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbhD3RKu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Apr 2021 13:10:50 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31883C06174A
        for <linux-usb@vger.kernel.org>; Fri, 30 Apr 2021 10:10:01 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id c22so19812834edn.7
        for <linux-usb@vger.kernel.org>; Fri, 30 Apr 2021 10:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=xFwRm5LKIFz8ThUwNqb4Pdxmq2A6s0g1F153TZviL3Y=;
        b=K9sCswFgdbTZPyPFtFoUTGmuSF8lTc3BWtSN/yKiS88TeMkPWXJsQzSJlcVY5zkpDU
         Pz6kpp1EDiUOjzJ9fBafv/Nb76AaaL7BkbfKef9ptomiiNuA0+XZHTZF1PHKFA41Pp4s
         zpgs9OAI8h5qx6DzL5TuavOevxJY9vj0MdTf6G8Yg9OnxRa3UwUUBhm8hJFM0sSXq5E4
         6h1cs1oyyCFjb5f1yMP5gkGNTBhwBRkDoJ6JtMcyUKNyeMS+HKA+PwD5VJJf3KS0+Oqi
         lej5oNwXNzOZd8qdwcUwzRExN4FBFBBdMgfkcYUdLzKQ+yLb5hc12d2KeomzkW8QyEFF
         PjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=xFwRm5LKIFz8ThUwNqb4Pdxmq2A6s0g1F153TZviL3Y=;
        b=gtZT/VLnOMmk/jPRcB1rJeSRvBLJenLVmYZU/8MrXwJY3cScwex/pyCr3sZX2auZ6D
         jdQrQwsVk805kUH6/FL8FQP6M+0Xf6Hq/7Y0/xttZ5VC+fzT/OuG3Grg49D0rbrbzGE8
         UbjL0Wezyf5MlFzzlE6OqJgxk9poBJVe5ItdGGRmwLDMij3K0J5DEWM2GFNq4j+VwtVn
         m49yiaJowBEWyhhC7gRmQw6hDW8d1JghyGPD45zKfjIX/EQnhUhI4LwcqdOR/fw6GkQb
         VRSlkicWV9zW763GfekuyFmNtpISUYZmwmugc7ZQBoTM2R+nTqRbjr6qet5lfWK9QN/9
         5IwA==
X-Gm-Message-State: AOAM5319L68oHgODhg2G/V/nAqRGvqp9wLxZ+qz+fpq+v3D6uicc9gPp
        3z5sQHD+zxorczzDMdXK3KscsQ==
X-Google-Smtp-Source: ABdhPJwAMZwX2qX2GPMf1uMoju5I1UiUCUSQbvBn0icsj4mzf+a5+5O7wK72yHyV6kaPwZOe8NL79A==
X-Received: by 2002:a05:6402:c98:: with SMTP id cm24mr7345068edb.18.1619802599908;
        Fri, 30 Apr 2021 10:09:59 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id mf25sm2374930ejb.101.2021.04.30.10.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 10:09:59 -0700 (PDT)
References: <20210430142625.357152-1-jbrunet@baylibre.com>
 <20210430142625.357152-2-jbrunet@baylibre.com>
 <4f213e44-e939-6d33-a333-a2573bd1e48c@ivitera.com>
User-agent: mu4e 1.4.15; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, gschmottlach@gmail.com
Subject: Re: [RFC PATCH v2 1/3] usb: gadget: f_uac2/u_audio: add feedback
 endpoint support
In-reply-to: <4f213e44-e939-6d33-a333-a2573bd1e48c@ivitera.com>
Message-ID: <1jim43hf6h.fsf@starbuckisacylon.baylibre.com>
Date:   Fri, 30 Apr 2021 19:09:58 +0200
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Fri 30 Apr 2021 at 16:55, Pavel Hofman <pavel.hofman@ivitera.com> wrote:

> Dne 30. 04. 21 v 16:26 Jerome Brunet napsal(a):
>> From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
>> 
>> As per USB and UAC2 specs, asynchronous audio sink endpoint
>> requires explicit synchronization mechanism (Isochronous
>> Feedback Endpoint)
>> 
>> Implement feedback companion endpoint for ISO OUT endpoint
>> 
>> This patch adds all required infrastructure and USB requests
>> handling for feedback endpoint. Syncrhonization itself is
>> still dummy (feedback ep always reports 'nomimal frequency'
>>  e.g. no adjustement is needed). This satisfies hosts that
>> require feedback endpoint (like Win10) and poll it periodically
>> 
>> Actual synchronization mechanism should be implemented
>> separately
>> 
>> Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
> Hi,
>
> The HS calculation of Q16.16 feedback value
> overflows at some 524kHz, disallowing use of larger samplerates (e.g.
> 768kHz or higher).
>
> I tested the formula used in alsa USB driver
> https://github.com/torvalds/linux/blob/d99676af540c2dc829999928fb81c58c80a1dce4/sound/usb/endpoint.c#L80
> which uses only 10bit shift. The feedback control in UAC2 gadget now
> works up to 4M samplerate with 1Hz precision (tested on RPi4 with
> bInterval = 1, checked in stream0 proc file on linux host).
>
> --- a/drivers/usb/gadget/function/u_audio.c
> +++ b/drivers/usb/gadget/function/u_audio.c
> @@ -118,7 +119,8 @@ static void u_audio_set_fback_frequency(enum
> usb_device_speed speed,
>                  * Prevent integer overflow by calculating in Q12.13
> format and
>                  * then shifting to Q16.16
>                  */
> -               ff = DIV_ROUND_UP((freq << 13), (8*1000)) << 3;
> +               ff = ((freq << 10) + 62) / 125;

Pavel, The code posted is a little different from snip here.
While I understand the "<< 10" and "/ 125", the "+ 62" would welcome a
comment.

Also in the final patch, the calculation is a bit different and moved to
"long long" ... but I'm sure the same type of improvement could be done.

>         }
>         *(__le32 *)buf = cpu_to_le32(ff);
>  }
>
>
> Best regards,
>
> Pavel.

