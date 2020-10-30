Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF2CF2A0D44
	for <lists+linux-usb@lfdr.de>; Fri, 30 Oct 2020 19:21:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbgJ3SVE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Oct 2020 14:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbgJ3SVE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Oct 2020 14:21:04 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05571C0613D2
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2020 11:11:19 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id j30so9030106lfp.4
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2020 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z65a4OQ16/rnMphZkcZN/ywDaNNCsr1xY0tCemvYIk4=;
        b=CkfAXQxS4WGCbmeKtvOsKpg9l23mkqzCBgFnI30HZsajvwLsfHHpXa27d5s3N6coy+
         lxb2wVMT2Pg8oKIdolaWisgJail841qfNOt/efQ6xs+2ZZxSHXrpVS5Fkr/OQAvQfSRK
         3x8bCriEK+j1ZVeu7Rm5GqqEf1WKg24C1R6RFzgHXUTIcAfwXcHF+33UKUh934Y/SPdD
         qUbMTBydeiLiG0DVYoVC08x/gF0ADVfIFNbiMSYpGTsT3NNMhOu8q9b561GERHnGlZKZ
         tW8bvPbPL8Ak3yuntr3J5YhsJQBHxvzU9YAve24SqTWMuZqPxRaTmrYuWN7cyiZCgI5Y
         eTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z65a4OQ16/rnMphZkcZN/ywDaNNCsr1xY0tCemvYIk4=;
        b=W8JqQBXOpKhO+Ci1ZVG0JHemjiiKmkEXaBK3r32xrLwBABTjdTihhjvCsnxwJDZ1LD
         V9Xxu8TmmJi0VmUvHnxxHK4XJyo0uOeP8XqzTdshHbtwNI8NT9IJdQ0JD1WC3tVXC6s8
         eGkyCCosUYrU4wkAb8VY0xQTiN1aSGrPPDyi3dmnEHeGK5vNFOaiPsLUTmn778GTXsog
         OO9y3B3Rm5nVoKqCuj3LSI8DMDIQ4La1ecFmFk31dSi2Jdh2EgPLi9lgl2Re/EJrFeXT
         YPlQ9awoQBFZNiXwZgOTyRWyaizU8CFr4Qatd2O7U0WbGxDguEXJarsvEL3jMluu2Fjp
         7ROw==
X-Gm-Message-State: AOAM532pPBcVLY8Pm8Ih9T2eDwARTIZ4xImdIpUmdNeeEiFrTa+qRVID
        Vusurx1FIPWCa4GJ6aI+f012T57cle0=
X-Google-Smtp-Source: ABdhPJwNNfVTh1MYrUpiSrWgMs0IF0eIM/Q2D/1LczRbxQBkJWPR15kp9jw+uzH1Ivejp6tS8D3kDA==
X-Received: by 2002:a19:ee12:: with SMTP id g18mr1583088lfb.515.1604081477368;
        Fri, 30 Oct 2020 11:11:17 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:611:8042:b0de:2a12:d02e:8d36? ([2a00:1fa0:611:8042:b0de:2a12:d02e:8d36])
        by smtp.gmail.com with ESMTPSA id l3sm687251lfp.219.2020.10.30.11.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2020 11:11:16 -0700 (PDT)
Subject: Re: [PATCH] USB: apple-mfi-fastcharge: fix reference leak in
 apple_mfi_fc_set_property
To:     Zhang Qilong <zhangqilong3@huawei.com>, hadess@hadess.net
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <20201030154534.98294-1-zhangqilong3@huawei.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <63e4452e-0277-e060-ce89-4fe2dcb30ed4@gmail.com>
Date:   Fri, 30 Oct 2020 21:11:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201030154534.98294-1-zhangqilong3@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/30/20 6:45 PM, Zhang Qilong wrote:

> pm_runtime_get_sync() will increment pm usage counter even

   You missed when/if in this (and the following) patch.

> it failed. Forgetting to call pm_runtime_put_noidle will
> result in reference leak in apple_mfi_fc_set_property, so
> we should fix it.
> 
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
[...]

MBR, Sergei
