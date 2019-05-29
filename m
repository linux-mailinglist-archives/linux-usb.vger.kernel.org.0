Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F14552E8F0
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2019 01:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfE2XTO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 May 2019 19:19:14 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:35011 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbfE2XTO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 May 2019 19:19:14 -0400
Received: by mail-it1-f194.google.com with SMTP id u186so6439279ith.0
        for <linux-usb@vger.kernel.org>; Wed, 29 May 2019 16:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gvVrNX9+KA12CZFtJXZ2Anjp6TlWxWYL3KFrzyQz0s4=;
        b=hpACezGm+Av2ZqlIHxFN5c2QAR44g3WHweR58afFeC6kGL08n0I4QDcs5CiVrhbrZ/
         Q5Mh5XWreWPZRqTNLXVRYwzxFjq6KAOheuYfdnSSVKqB+LHRhmgQGi1c3XGrDFX3MO1H
         Ds2HX4uL++oSrI0+EG7/bN9U3yog4k4QMkBGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gvVrNX9+KA12CZFtJXZ2Anjp6TlWxWYL3KFrzyQz0s4=;
        b=ZlHM9OqcP11EtTe+oD5rD1xAB8mrW7i66jZ8bLHVLdV5FSLRkE9qVP+o0xhCAiOH7L
         z1kHJ6fivIGorG8uu5rvwCvvm/+CdD6B+R4vx3rrrXH1A2qBz8M7BCeeYu8k9rj3Dtj/
         5fevVql1tkDGZxTDGRCaGgb4R20t2Nvh8WKI9D5Sz7vSZBdU3Bb7Sqo2X5WMFlQRItaw
         nXbskBaQsLVeRRPa2LJx9Sv2vV+2sMfZXKmrGIjs2V2xkZ5PoRk5VN/Fe//S/GSWlLvm
         Q81wdKAJ0/zedDNTD/APfeoW1pYQuq1IggXXTh4qqTDPD81jySx9JewDN2b+s7de+S52
         QHag==
X-Gm-Message-State: APjAAAX3DBdMI47B3HLpulb5p0/tp1uSBvc+xad0nCFgfthHIF7rloTw
        T3JYfXjoo3BMuXYaJKSFqHe9dQ==
X-Google-Smtp-Source: APXvYqzU1xUFaMBalwA0GtYXKzaxpry5fypYcyCY3susGO0nFSAjqjh4GCov9XeTJ7RNG6ZWqjK4dQ==
X-Received: by 2002:a24:5252:: with SMTP id d79mr675333itb.14.1559171953454;
        Wed, 29 May 2019 16:19:13 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id d71sm382566itc.18.2019.05.29.16.19.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 16:19:12 -0700 (PDT)
Subject: Re: [PATCH] usbip: usbip_host: fix stub_dev lock context imbalance
 regression
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     valentina.manea.m@gmail.com, shuah@kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20190529194615.18765-1-skhan@linuxfoundation.org>
 <20190529202557.GA27140@kroah.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <3243c1dc-d198-9733-d3d0-5963e14b2d85@linuxfoundation.org>
Date:   Wed, 29 May 2019 17:19:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190529202557.GA27140@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/29/19 2:25 PM, Greg KH wrote:
> On Wed, May 29, 2019 at 01:46:15PM -0600, Shuah Khan wrote:
>> Fix the following sparse context imbalance regression introduced in
>> a patch that fixed sleeping function called from invalid context bug.
>>
>> kbuild test robot reported on:
>>
>> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
>>
>> Regressions in current branch:
>>
>> drivers/usb/usbip/stub_dev.c:399:9: sparse: sparse: context imbalance in 'stub_probe' - different lock contexts for basic block
>> drivers/usb/usbip/stub_dev.c:418:13: sparse: sparse: context imbalance in 'stub_disconnect' - different lock contexts for basic block
>> drivers/usb/usbip/stub_dev.c:464:1-10: second lock on line 476
>>
>> Error ids grouped by kconfigs:
>>
>> recent_errors
>> ├── i386-allmodconfig
>> │   └── drivers-usb-usbip-stub_dev.c:second-lock-on-line
>> ├── x86_64-allmodconfig
>> │   ├── drivers-usb-usbip-stub_dev.c:sparse:sparse:context-imbalance-in-stub_disconnect-different-lock-contexts-for-basic-block
>> │   └── drivers-usb-usbip-stub_dev.c:sparse:sparse:context-imbalance-in-stub_probe-different-lock-contexts-for-basic-block
>> └── x86_64-allyesconfig
>>      └── drivers-usb-usbip-stub_dev.c:second-lock-on-line
>>
>> This is a real problem in an error leg where spin_lock() is called on an
>> already held lock.
>>
>> Fix the imbalance in stub_probe() and stub_disconnect().
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> 
> I'll go add:
> 
> Fixes: 0c9e8b3cad65 ("usbip: usbip_host: fix BUG: sleeping function called from invalid context")
> Cc: stable <stable@vger.kernel.org>
> 
> as the patch this fixes was tagged for stable.
> 

Sounds good. Thanks.

-- Shuah

