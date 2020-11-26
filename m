Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 843D32C51DB
	for <lists+linux-usb@lfdr.de>; Thu, 26 Nov 2020 11:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387561AbgKZKNb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Nov 2020 05:13:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387509AbgKZKNa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Nov 2020 05:13:30 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D111C0613D4
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2020 02:13:30 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id l11so1750532lfg.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2020 02:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OYTqBpCPfav4YXADEpnvd8OFjgAUhxcsuBCl+LNs7eE=;
        b=L+x17B5EZb2c40RUxD69+OLrZ1goo0aAYKFImA0AZ/N7qdTqDIq3yJ5hDrCrt/JgnL
         6BFqsqqvrCK0x4Azn0IRgwaYSJ4b+3pcEcicjcDN9tIctZHkiGb5s19DW4hqZc2auE0z
         +DzjmoNnoOInSU6Uw1UDPrN+1scNcBcKUBczFdYtey0A9ZvAQrhqEJuUvDPkux90lJNx
         4QEjQb9BSRxwl4uH8Yk6/DlRb22CBVg+o+aOT3x+Z6hpA2ffdo/ulzmQQ8utYUf5ncDL
         1AHd9ASpnZ0nvmLTwaGsOl42d6jjSx18lv5+kX0jui77r5Xe4Gg6GAa/p/iZoxHoWcGp
         nD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=OYTqBpCPfav4YXADEpnvd8OFjgAUhxcsuBCl+LNs7eE=;
        b=mBdnCc+Ad6rKviVv3n8GLNM8gUrTXm6ME5hmIG3H+n5+qGPlhVodLqW5iZIlTEQ1UY
         gqAp0cN2M44sQ9FIlaJSGT9eD5D7EilTDmGpKIB1EP3nItCb/0fQW1a727Blu8qY+s6A
         yghRtw/1pOWQLgbcp8F33leaaOOIEhlkW9ccTwWmHgzQEW1/oPkNaZiuk9dF0ZRnUlB+
         uDZ+TH70OtlU0xkZbYhAUELRif81eZlUpLMVvGJPmqFnzsRDaH2s3nv+bzYvKZP/UU8z
         JXTSIfisx4jL5c4k7GqvNKdnQZTwUgimoGF74J3/xD19Oi6TNLFSjnvTD0qzI5NbaoEp
         l/nA==
X-Gm-Message-State: AOAM532JzdPclCKIWwu9l0FKKBq7XohPqEQWjD+cO1G5t8PBwf28HWuW
        DaVlUuJkettDKM1X1yxTXH/jL7N0N1bDng==
X-Google-Smtp-Source: ABdhPJy7/LAoo+bxGFLxc6/XvULlmvci7zCHxreTqWQBvRjR48RLh1GiYVuTx+Cvm96Br/FPfGLFCA==
X-Received: by 2002:a05:6512:6d0:: with SMTP id u16mr950390lff.497.1606385609077;
        Thu, 26 Nov 2020 02:13:29 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:66b:370c:5526:9beb:62ce:c7a8? ([2a00:1fa0:66b:370c:5526:9beb:62ce:c7a8])
        by smtp.gmail.com with ESMTPSA id w21sm261737lff.280.2020.11.26.02.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 02:13:28 -0800 (PST)
Subject: Re: [PATCH 2/2] usb: cdns3: core: fix goto label for error path
To:     Peter Chen <peter.chen@kernel.org>, pawell@cadence.com,
        rogerq@ti.com
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        frank.li@nxp.com, Peter Chen <peter.chen@nxp.com>
References: <20201126065409.7533-1-peter.chen@kernel.org>
 <20201126065409.7533-2-peter.chen@kernel.org>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <007261b9-92ec-9ca6-e609-f5d3a337f322@gmail.com>
Date:   Thu, 26 Nov 2020 13:13:16 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201126065409.7533-2-peter.chen@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 26.11.2020 9:54, Peter Chen wrote:

> From: Peter Chen <peter.chen@nxp.com>
> 
> The usb_role_switch_register has already called, so if the devm_request_irq
                                   ^ been

> has failed, it needs to call usb_role_switch_unregister.
> 
> Fixes: b1234e3b3b26 ("usb: cdns3: add runtime PM support")
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
[...]

MBR, Sergei
