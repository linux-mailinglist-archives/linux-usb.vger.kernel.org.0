Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68D741C8E31
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 16:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727871AbgEGOPC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 May 2020 10:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbgEGOPB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 May 2020 10:15:01 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30140C05BD43
        for <linux-usb@vger.kernel.org>; Thu,  7 May 2020 07:15:01 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id k12so6699320wmj.3
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2020 07:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=80yiYsGNxQYgC14+ONNQZJtixdahVRq8sbQRIcGiJ/M=;
        b=xHLeno1U1D2JxSDY0VwysCdednHox1CRK4tqaDgcPjB1kD7dbbbAmNMRHDzfCis+aN
         qGreKXNF5t8LqZouabVyGeeT00XjidmPAP+YDI0fZR5KzvslIabMNssidOk64jxJVwxL
         OFn0fAhk4COiZkmGEEAA/EPeD3wkFyPKGqkVgZMi4h2yMppyDMc+wYe54dGicVV4me5U
         TnvIFjQruEF+PI1IXXj5SVHjhoT3HcsIP8By//uxugZGneacSdqagGSBFj4D8EZOw2zr
         dKuhwy8uiazBmwGnsAsxSZa6YXBT+vDrJuBNrFyeEUm1dOXAIJ9h3krBGLU8LNr6aaLb
         gFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=80yiYsGNxQYgC14+ONNQZJtixdahVRq8sbQRIcGiJ/M=;
        b=sDoq0ldzsYJil7fnVh8ELbemYUi/nW9ytYkl8+M35jwQhB5//jyXjES7hfBmmLjxIc
         RCkCSeTIhHWEieE6sG6Uiy6kIX/eEIN7tQJCCIMOJagfSel64HStsu2P0qDyzIS4P05g
         g6Uz/ju4Z7456vfLuANDw7jCd6MzN1rZl7/twLj8Ky0op6jrO9mRRFKHQel57OFx1IRd
         m8vtPmX5u2Pvs+gLn0LXubrQv1HfW1hKZ9fLSMUL6Kgh1L6YLh3g/P3CnSuD8FMR8gyZ
         uOxQ7362teKdUHqaVWQcNs30OsuupqbQzKxUkRgVLILuueSzGLJ74XXYq0yWIOAtvmB+
         uIXQ==
X-Gm-Message-State: AGi0PubafPwtA0gao9c246UEPQi6Q5NdKWssHyvnkCW7FXq54rfk1tcD
        ul6f++G5AzxFIVEfexB2zkjQlw==
X-Google-Smtp-Source: APiQypKJnrDI/unFafYYlu8wEGtnza7NvJq/DS7+7kM4NUNsoslVvgL0Zjgb/O8UP2MGzqiINyfcxA==
X-Received: by 2002:a1c:25c4:: with SMTP id l187mr7105670wml.89.1588860899951;
        Thu, 07 May 2020 07:14:59 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id v2sm8653085wrn.21.2020.05.07.07.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 07:14:59 -0700 (PDT)
Subject: Re: [PATCH 0/1] Add USB role switch to tps6598x
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        nikolaus.voss@loewensteinmedical.de, garsilva@embeddedor.com,
        keescook@chromium.org
References: <20200507124556.1774311-1-bryan.odonoghue@linaro.org>
 <20200507134130.GX185537@smile.fi.intel.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <2ad37f99-9e93-8856-f976-5d6be2dcf51c@linaro.org>
Date:   Thu, 7 May 2020 15:15:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200507134130.GX185537@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 07/05/2020 14:41, Andy Shevchenko wrote:
> On Thu, May 07, 2020 at 01:45:55PM +0100, Bryan O'Donoghue wrote:
>> This patch - adds USB role switching to the TI TPS6598x. It has been tested
>> out with a ChipIdea controller inside a Qualcomm MSM8939.
>>
>> Right now you need to have configured the TPS firmware with the TI
>> configuration tool so that the chip knows if it should initiate or accept
>> data and power role swaps.
>>
>> https://www.ti.com/lit/an/slva843a/slva843a.pdf
> 
> Can you include that in the patch under DocLink tag with some background info?
> 

yep, np.

thanks for the reivews
