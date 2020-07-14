Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 258CB21F671
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 17:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgGNPtd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 11:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbgGNPtc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 11:49:32 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21AECC061755
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2020 08:49:32 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id 18so13362453otv.6
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2020 08:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6jLgbeQbR2y51QxkPXj1KM5ydm8hN4KlBS47bVAqPbo=;
        b=bDY4rE0dt2u4c3T1MoOhMWAfTGN7nds8Xy1K6CacPGA+PTYOPZUtoy+jVY7bgXOfGC
         qYpoFE8UJIdMqcyVmbdu4AdSAKLJS8DCSLEJPAIB72/KgXJjGINSdllY1z4R9llJ+YEq
         FMMKB+CPbWzO60nbUhygXFx9+AtcKVLPBCoQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6jLgbeQbR2y51QxkPXj1KM5ydm8hN4KlBS47bVAqPbo=;
        b=k6nSQaP2PCAtLCgW5go3wQu5vGMGvmUkEst34wqcLpIwfl4ypBOlPvN30qpcG2t/fA
         S8bV71YKIYlp6qih5efu1nhEtwIGWvSLI38mS9jq9RsyvftbwuitJYkUAxBM5Ya6y/Q6
         ycxIw+KtNjWYzaec5WAEnJHPkktPk6/TVDV448YeHWh0ci7rFJqcJ0a9m0sb/0LFi4rO
         lReu0O+9FI1ZkLVxzAcKgkrSnI2eMDbxbDZTjvflvWckpiF96Fgx0YpI8CiKD/W+OL0i
         d0FM5fOURt0ZQq0rXzu2MaliIIzSMGpz0LyDgDIChqPH9bwwQN6nVPht7IegoJVcHdjr
         QqYA==
X-Gm-Message-State: AOAM5308KhTtLiSY+tp0/d8VdF6F/af2r8EFgdSee3r0zRl8KdQrjJNK
        bbwESKTBxEqW9w6LRS6SUe/FdA==
X-Google-Smtp-Source: ABdhPJyiHPS6sDocyBlmPwMcOK3T5OJvhc9vK7owfgslvoVxglvfp5im8gyurA9CgafUTZMNcrKmRA==
X-Received: by 2002:a05:6830:198:: with SMTP id q24mr4675315ota.202.1594741771493;
        Tue, 14 Jul 2020 08:49:31 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id a6sm3653744otb.8.2020.07.14.08.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2020 08:49:30 -0700 (PDT)
Subject: Re: [PATCH] tools: usb: usbip: Replace HTTP links with HTTPS ones
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        valentina.manea.m@gmail.com, shuah@kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200711062442.GA2784200@kroah.com>
 <20200711123906.16325-1-grandmaster@al2klimov.de>
Cc:     Shuah Khan <skhan@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <55e97454-c376-e640-f020-cb297e176681@linuxfoundation.org>
Date:   Tue, 14 Jul 2020 09:49:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200711123906.16325-1-grandmaster@al2klimov.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/11/20 6:39 AM, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>    If not .svg:
>      For each line:
>        If doesn't contain `\bxmlns\b`:
>          For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>              If both the HTTP and HTTPS versions
>              return 200 OK and serve the same content:
>                Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

