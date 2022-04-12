Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3C994FE411
	for <lists+linux-usb@lfdr.de>; Tue, 12 Apr 2022 16:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356720AbiDLOq4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Apr 2022 10:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241788AbiDLOqz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Apr 2022 10:46:55 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC9ED1A385
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 07:44:36 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-df02f7e2c9so20942168fac.10
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 07:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rY6b4Cha+4+tNB8Pe5EB9gbUIN/2B2C73pXkmyewtts=;
        b=h52PHqsVBf6x5MwcgRmqywyRnHupk7jLRhBbSS3EiExbZLToXqg8TsoZFRyY3acwjn
         0guxxFmbhbRecywCbpVLvlbUzlf9oUvl8N0Ww5B4wVJCr0HX/FU0/VvHTQObkC3o/tHV
         wZPWtPc70D+JeGBUNbAE2Ph8zJg9+oH/n8q+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rY6b4Cha+4+tNB8Pe5EB9gbUIN/2B2C73pXkmyewtts=;
        b=ihw9FE5BeZvZ98U2Xf+c71mcPBs0kExFSmLQJm2q9IlspIO9OxkV0IlpTlCeatWV3T
         mfeP8mSTrTYMMEU0aHDGi0Yj+t6j3Uacs7RgA+nMd8uYjoyaa885RNawoGEqkJiGtnEt
         xoTdX8gK8siDZhA6THsD1eKG4ieR8I4TO6cQEJzbDhNgH2ib+u7g67Bfc20wtnDL9dFa
         wp7qy+pkFhMScxQhBYJDrSEgBQ3zOFZmDJSViZqu9k+CQxsDxAAXWferUkWjgCsVAQvw
         71oPtPJbOcViUQ6SZf9nA+mUxkax+g3BjDRV8DA0mjFIdRrJfQjDWr5ULvepqV3PGujv
         +V9A==
X-Gm-Message-State: AOAM530DzTAfAdhiyM/jK4XHDAO7H44KgBVDvZXfnBgszUp4bMngDrxp
        dvx/Aoph+khoq2I42V2AM0GN1vZEtejAxw==
X-Google-Smtp-Source: ABdhPJzSYxgWK/tMScpDbAL/LJ5qvKr7lSz6bmGGfa3TUcEKF57oHtGN4oa3mRYTV2St+sOzvNrW+g==
X-Received: by 2002:a05:6870:8907:b0:e2:a4fd:7539 with SMTP id i7-20020a056870890700b000e2a4fd7539mr2271798oao.56.1649774676113;
        Tue, 12 Apr 2022 07:44:36 -0700 (PDT)
Received: from [192.168.1.128] ([71.205.29.0])
        by smtp.gmail.com with ESMTPSA id b188-20020aca34c5000000b002da579c994dsm12364497oia.31.2022.04.12.07.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 07:44:35 -0700 (PDT)
Subject: Re: [PATCH v3] usb: usbip: fix a refcount leak in stub_probe()
To:     Hangyu Hua <hbh25y@gmail.com>, valentina.manea.m@gmail.com,
        shuah@kernel.org, gregkh@linuxfoundation.org, khoroshilov@ispras.ru
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220412020257.9767-1-hbh25y@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <7d8a7ae5-9553-bcf3-55d8-57d5df6375f4@linuxfoundation.org>
Date:   Tue, 12 Apr 2022 08:44:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220412020257.9767-1-hbh25y@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/11/22 8:02 PM, Hangyu Hua wrote:
> usb_get_dev() is called in stub_device_alloc(). When stub_probe() fails
> after that, usb_put_dev() needs to be called to release the reference.
> 
> Fix this by moving usb_put_dev() to sdev_free error path handling.
> 
> Find this by code review.
> 
> Fixes: 3ff67445750a ("usbip: fix error handling in stub_probe()")
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> ---
> 
> v2: add more description of this patch.
> 
> v3: add how to find the problem.
> 

Thank you.

Greg, Please pick this patch up.

thanks,
-- Shuah
