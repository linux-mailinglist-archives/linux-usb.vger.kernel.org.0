Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E25E3A195C
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jun 2021 17:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234947AbhFIP0S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 11:26:18 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:43907 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235847AbhFIP0N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Jun 2021 11:26:13 -0400
Received: by mail-oi1-f182.google.com with SMTP id x196so25040780oif.10
        for <linux-usb@vger.kernel.org>; Wed, 09 Jun 2021 08:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZFEb5EC9h4Oz558wWnJgGSYdu9KSgRo/Ld9B/b/Md7Y=;
        b=cQcyYlxISWWBA2YLmgU2YVXdQODOaPSyusUsSWNcjb5ImIMmwXUS3y20YkzKIx8Gwr
         CRrhp7FT5vtJbuIpiXWb8rn7eIMJA9g/JuOE/BqVGxzDZeRaZKtOAJDROtF4n9WNM5Uo
         jtVVNNeGQWmjT3hALCh2dGbzv2Ll+t04aAnAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZFEb5EC9h4Oz558wWnJgGSYdu9KSgRo/Ld9B/b/Md7Y=;
        b=n16vWKOl9QA1V1FIYQtlZvcTjlcYbawoSczQtCE5PUyKl8htNNHvNi1780Sq2Dk3cB
         rMRmtHtIBc5xgGnuOje2+iJSXzCs140fYhUvBLKB0CEiRUL6l3QNPLJIj1sQqvMWrcj1
         AyhfGcN5Cz5Y1CaRzpcptYeeQAZOnjCufdIUh1jxMiHzrgN8Csnd2AF7aE/A15zGqwXc
         5wBgTFQ/T7q3p0cuiPb15VCprOK0AgzdZk3RQxKZIPbu5ePiPH/HEDZEbtgl01FbAq9R
         8eTiooqlTt037V7xpNoJhK123CcfPSboF9kwIwYum7K17Np0xYqqXy/7zU+BvVYSiq50
         vhhw==
X-Gm-Message-State: AOAM530BcWvRi2v6YBwh+4uo6r+FdU+EFV0xQhQ0jUZHAI9OClST11by
        hWhtlleCkmf+9k+ATZqTeVkgQQ==
X-Google-Smtp-Source: ABdhPJx+h5JcfyhNXaJ/xKmlw9d6bbCaq+UZA2pK0fHEP9513o4/OhyPZEM2zRePXQMHWN4oLYQAaA==
X-Received: by 2002:aca:4fd7:: with SMTP id d206mr6722685oib.16.1623252197949;
        Wed, 09 Jun 2021 08:23:17 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id t15sm30975oie.14.2021.06.09.08.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 08:23:17 -0700 (PDT)
Subject: Re: [PATCH] usbip: tools: usbipd: use ARRAY_SIZE for sockfdlist
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        valentina.manea.m@gmail.com
Cc:     shuah@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <1623232316-89719-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <a6b75133-e85f-903e-82e3-c04cc2a14d00@linuxfoundation.org>
Date:   Wed, 9 Jun 2021 09:23:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1623232316-89719-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 6/9/21 3:51 AM, Jiapeng Chong wrote:
> Use ARRAY_SIZE instead of dividing sizeof array with sizeof an
> element.
> 
> Clean up the following coccicheck warning:
> 
> ./tools/usb/usbip/src/usbipd.c:536:19-20: WARNING: Use ARRAY_SIZE.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>   tools/usb/usbip/src/usbipd.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tools/usb/usbip/src/usbipd.c b/tools/usb/usbip/src/usbipd.c
> index 48398a7..4826d13 100644
> --- a/tools/usb/usbip/src/usbipd.c
> +++ b/tools/usb/usbip/src/usbipd.c
> @@ -532,8 +532,7 @@ static int do_standalone_mode(int daemonize, int ipv4, int ipv6)
>   		usbip_driver_close(driver);
>   		return -1;
>   	}
> -	nsockfd = listen_all_addrinfo(ai_head, sockfdlist,
> -		sizeof(sockfdlist) / sizeof(*sockfdlist));
> +	nsockfd = listen_all_addrinfo(ai_head, sockfdlist, ARRAY_SIZE(sockfdlist));
>   	freeaddrinfo(ai_head);
>   	if (nsockfd <= 0) {
>   		err("failed to open a listening socket");
> 

The change looks good. Does this change compile for you?
Doesn't for me?

thanks,
-- Shuah

