Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF2232ED5D
	for <lists+linux-usb@lfdr.de>; Fri,  5 Mar 2021 15:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbhCEOoy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Mar 2021 09:44:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhCEOov (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Mar 2021 09:44:51 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E9F7C061574
        for <linux-usb@vger.kernel.org>; Fri,  5 Mar 2021 06:44:51 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id k2so2251116ioh.5
        for <linux-usb@vger.kernel.org>; Fri, 05 Mar 2021 06:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=g9WR5LUcVIgFW7g2wnr5Zp2huJ5WAnqnH0Z1U5EpqdI=;
        b=A1kK1MxeRSv4PdUhjPsEU8dc6F2RJZAlt2I2PGlLaFBdZFlgIKIMggz4RQQIVRU3+p
         G05xG8SjW67zLzOlHXAuCqtM6tITwcJZRb6mCI2NCRCLteLxv01uAlqtwwJ9/8tGO2W7
         X4Y/6IxkXlr9Vv7HAmqZuo6JgC9XJ4mF20J9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g9WR5LUcVIgFW7g2wnr5Zp2huJ5WAnqnH0Z1U5EpqdI=;
        b=Qemsdx7D45/yXQJKaDupwZzVwYTU427iJWV7cWwylGLXuoYW/2F+E+CxupSk5MEBg+
         1Y11sJa4flbTw2ghCoAk9qZMPk+RWd5zK7z/yNLW6UpeTgnPbWfkLGwD/9H0EpNemHHY
         xBSssMp6Tm4jMrmkdMXaloZp69eYbMhEYS4GMoyPra8VD39j+JTOMFTyCcpW92fVpJXz
         O8u8SLehHFTTxgMOew9XvUzthT0rWNZpPKAHsCFQBAmm4dZk/6tAQk/4jfvE4SGpfTii
         EJGsNX2ZU3U13z8VR8yXWAITWigDby+oXJchQ6VGUmWEA0fbzjK0Qrlh8/dvsDPK0Ue5
         TdeA==
X-Gm-Message-State: AOAM532SC8QBQle7T56Ri9BbCY1p9zC/tCmi1HhwrtpHmr7DPWcLw6a3
        r5UVR3jAhb92kgIf0Fa6wzOi2A==
X-Google-Smtp-Source: ABdhPJz8sXdnCFm77LRjCdP2fJ8szFTOQ5cggcbsM2VIxbUk49edcPBYIi/17aoxTT/l+q8pHvsiQw==
X-Received: by 2002:a05:6602:14cb:: with SMTP id b11mr8651790iow.175.1614955490407;
        Fri, 05 Mar 2021 06:44:50 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id q4sm1389207iob.52.2021.03.05.06.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 06:44:50 -0800 (PST)
Subject: Re: [PATCH v4 00/12] usb: usbip: serialize attach/detach operations
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <df337d16-2a6e-f671-7134-449d7da6a9cb@linuxfoundation.org>
 <20210304152455.3685-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <353d42fe-d730-63bb-7d40-33ee67d20411@linuxfoundation.org>
 <54519d84-9173-21d4-8347-d53500b32092@i-love.sakura.ne.jp>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <673ee78e-d70c-84d7-e4b5-919d17ecc5c9@linuxfoundation.org>
Date:   Fri, 5 Mar 2021 07:44:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <54519d84-9173-21d4-8347-d53500b32092@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/5/21 3:06 AM, Tetsuo Handa wrote:
> On 2021/03/05 0:52, Shuah Khan wrote:
>> As I said, it uses a simpler approach and reduces the number
>> of changes. I would rather go with what I am working on.
> 
> Will you post it to ML so that people can review?
> 

Yes. All my patches go through mailing lists. :)

thanks,
-- Shuah
