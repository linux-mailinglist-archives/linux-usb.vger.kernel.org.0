Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0309437A34C
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 11:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbhEKJUk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 05:20:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230427AbhEKJUj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 May 2021 05:20:39 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 417DEC061574
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 02:19:33 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id s82so10691305wmf.3
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 02:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=jyybLxuJ7xZ6d0x/klVfoxVqBUHmxhi7TG3BpYlm8NE=;
        b=HktvOaMB5x12Ns178Wm/doVxZinZi2WPW+EulQYNbPw4xfEkH6xw1FHl1XnEge4EJq
         c5VXc6f2N2Rw6Gvv/sGVd1uOBt1fSsNAl5C4CadoLTV7qWeBCpbkILfgPIKC4UOjrCXr
         aqCvfVoskQnK8LghTC0mdCpHFElv/0E/oxp+6UiCenjYUj+q5iYk0k+SF+4D+jfVAddE
         aKlx42Y6AnhnXRp5toZoZaCah5hEmwRqWhWQ6HQcT9whYlIUA/TnOedNt8uSj/3c+O69
         qACgYSXclNr+/hf6g85aYrTvPUH3pbF/rkite1kuBRjNhu7jltx0KDFO5wPg7re0tZc+
         gsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jyybLxuJ7xZ6d0x/klVfoxVqBUHmxhi7TG3BpYlm8NE=;
        b=YuaKxgEldSEE6547sN5U7k1lwDO9EGSZkDM2dl1YbP+eTn0w60G2VpBJeRo7PoapzC
         n+LDObqni22De4iDUD7pjPGcPRNhtiGTo8iTu2yt0UPpRlm/ARKEC6xe6Z7HKGFx/gzg
         lQy148CBRRxuJIpsMFq8stsQcBgG2o5SARJjoLt/+fMT+CU52oZNcemMREoRgmdCGjj0
         SJaM3yENfbPFcmVxHlTff3wu1nPYOBwXaYJqgPDHMftdiEeiN8VQIOPZPtWwSt9GVF2u
         kWk0LewLlZ26IB5R/+G6GMoQOYc7MlIAmuHcnVEmjzEmFkmvOS4viOJUyUZuyDO+mRiC
         K+Qg==
X-Gm-Message-State: AOAM532S/PDcczGeuHi8C5oMOQYxPE55ytEGzBDn6Y70RmKwwi+RYSxo
        +vXGXtpUivaE1IdahX8oVTn1/11mz6CEgA==
X-Google-Smtp-Source: ABdhPJwzCoN6T5+yO10Uo2WLjV7FZrVzZpalOmcRgykldTRqlgHXo7uN6I9kVNnG1VuvixbNQeFlPg==
X-Received: by 2002:a1c:545c:: with SMTP id p28mr4369981wmi.118.1620724771418;
        Tue, 11 May 2021 02:19:31 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n5sm27041326wrx.31.2021.05.11.02.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 02:19:30 -0700 (PDT)
Subject: Re: [PATCH 1/2] usb: typec: tcpm: Call init callback only when
 provided
To:     Guenter Roeck <linux@roeck-us.net>,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
References: <20210511022224.1309077-1-bryan.odonoghue@linaro.org>
 <20210511022224.1309077-2-bryan.odonoghue@linaro.org>
 <f112c2b4-343a-f8a0-c00e-f020f34611dc@roeck-us.net>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <d4a2889d-db11-69b3-5a62-13fad2ad6e18@linaro.org>
Date:   Tue, 11 May 2021 10:21:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f112c2b4-343a-f8a0-c00e-f020f34611dc@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/05/2021 03:44, Guenter Roeck wrote:
> Are we going to see a driver with no init function ?
> If not, I would suggest to make the call officially mandatory.
> 
> Guenter

again in plaintext..

I have some tpcm code that doesn't need to put anything into the init 
function which is how I found this.

Its very much up to yourself on making init() mandatory though. I'm just 
as happy to redo the patch and add a check to the add port routine
