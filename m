Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4521D14E9D6
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2020 09:55:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728206AbgAaIz5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jan 2020 03:55:57 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43139 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728151AbgAaIz5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Jan 2020 03:55:57 -0500
Received: by mail-lj1-f194.google.com with SMTP id a13so6265930ljm.10
        for <linux-usb@vger.kernel.org>; Fri, 31 Jan 2020 00:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2S9wxqWKmAask0cSmOXArpFefQZ8Zs4WIsmkzwTxodA=;
        b=qwCBgOXOZyBRvz9NOySlnT7zC6Fci8iA7N8LSlPoyi9HrJKhTT23KXR/ydhItyxJHn
         JBumoZHevQF2yiPTSVX2QMKJMPM5Ctb62+cHd3vV/Lc9XxmwRfmv4ffKiYqon8MKl/oz
         RZSmAzC/MA8uq/h7mKFYwVNDZ7vbexFQbg0PISRhfOErdYiGgMhE+LK3WlwcGlapSyyk
         SYiKXJn3ZZrlpHlHg4CTePg7SXn1+SAFmGjbz0TxzDJmQ3WkT4zo77502ko8A85vIFnR
         0INXOWqsKe3FJTIC9Xo+2ZzTN8yr1YsOWnIKvIoes5hwcwInvvO/mDjOG+NEfiWtHTXz
         KtXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2S9wxqWKmAask0cSmOXArpFefQZ8Zs4WIsmkzwTxodA=;
        b=SM3z4IEBe/QJy46S2JgnQWw65eMSqoOrwi71zIsnmYPBWrHqOcoz7GJhX4N1wFUoPG
         lfINhTWa08zjvrCPlyURGiobgBy1pN689JKILgkTNdqHOFwL3hpNGsBk4c6BgYhcy7os
         aStIrOAegXFwgZqp3+uPsaEe3iQPPqtQWBwuwOSKrT/D47192mMbIKK1kHgc5NVW5vhi
         nkL/ErIo3X1RKv5eKyUn3NVwTivJTXIf8SgqHtGuA715SWFLjcFbancMWjjKtMn2TPcr
         ghX496aTAAdVwxueC1k6STEFGzO5FbBbWtWz2mqKPuLs4+sm/r+vovdKFM+PxUKaf7zx
         TSyQ==
X-Gm-Message-State: APjAAAUqwWE9MnuM4z1Il6UUMMTygb61AraOEPzBk+2yc6fFfUjzwAxA
        sPSaEXYim3tlWGkGohFw10wYi+6hICjY9g==
X-Google-Smtp-Source: APXvYqyEQx9QVHoxefeuUkR77FDHUFpUOqbmL+owXhzwgkpsiLTrZhbAk1FgHrGOxFJXROkSqmE+Ew==
X-Received: by 2002:a2e:8145:: with SMTP id t5mr5383167ljg.144.1580460953581;
        Fri, 31 Jan 2020 00:55:53 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:8e8:c09b:ed38:3474:b1a8:ff23? ([2a00:1fa0:8e8:c09b:ed38:3474:b1a8:ff23])
        by smtp.gmail.com with ESMTPSA id w8sm586635ljj.75.2020.01.31.00.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2020 00:55:52 -0800 (PST)
Subject: Re: [PATCH 1/1] usb: charger: assign specific number for enum value
To:     Peter Chen <peter.chen@nxp.com>, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org
References: <1580436213-8862-1-git-send-email-peter.chen@nxp.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <a23885dc-c804-5a0c-df78-fe18292360cf@cogentembedded.com>
Date:   Fri, 31 Jan 2020 11:55:45 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1580436213-8862-1-git-send-email-peter.chen@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 31.01.2020 5:03, Peter Chen wrote:

> For work properly on every architectures and compilers, the enum value

    "For working properly"? Or maybe "to work properly"?

> needs to be specific numbers.
> 
> Suggested-by: Greg KH <gregkh@linuxfoundation.org>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
[...]

MBR, Sergei
