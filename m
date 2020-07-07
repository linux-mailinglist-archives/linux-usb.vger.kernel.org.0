Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F20E217890
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 22:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728645AbgGGUG3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 16:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728254AbgGGUG2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jul 2020 16:06:28 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 922ABC08C5DC
        for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2020 13:06:28 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id a21so11975336otq.8
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2020 13:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=r5PL45TtpUanLMjUFz1CcEwQghycNM5MHybEf6+OAdY=;
        b=Ia/xRu4E5EmGy6Euz2yN+Lu4bpiUJmEdWdzTD8OqM8AxBU6FQFBhSUpyKT01Vr8Gfb
         B1Z5wCAkGvzqfHGLEzzzBaknQJXeNrxuVnCP9kf8bRooXqJKq6zqnMXR+v5lLmKVtu5A
         QTSvpd1Xn3a+ElGJKiVI+MGiIxrLD5plOOwc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r5PL45TtpUanLMjUFz1CcEwQghycNM5MHybEf6+OAdY=;
        b=iCPmmmuqlhq7W7tTBYHdnxxBXWTm2KYoiaBReFQCE5G3DYKvwP9AUL75xKDzVZhgGd
         bQhcNDUv+oCq8yRkoflIYijr7oI5jbBQHuVUrkG2Xcd0vVAi8+zn8tPnkH1ACCZwrHXN
         iVvn3W1v4K1igGN0Kz8cfqY5kjR2O6RlRMeV5i8l27M/3VnYXoLOeNYIFzUVSEUe7h2I
         8AGs4mHfJ12w+/I+uB/MGYg/YBSI/xaEAhNthneOOwsG0PGVa7OuJMF4PULvnd7iFTSX
         Yf0zk7zhI8Zha58qqnPSpeVmDF5lzy+hKeg8DB4w/QSDMuLtjQ57Mxr0uKRtLpCW5u9y
         XtuA==
X-Gm-Message-State: AOAM532/VSxyUTDmY2dp8wn1Zqqg1dmypG+k/5g3HIOz1Sl8v7HgSSzc
        xPDROhOLA8A8goUrNk4Rne8lGA==
X-Google-Smtp-Source: ABdhPJwwnZXLOhRRrCJBbJ2DZTfTavUWiRd8aI97qtpmNCNSuXiRBk3Odg92UJhZ/9Q7+WOFz9Le2Q==
X-Received: by 2002:a9d:2261:: with SMTP id o88mr8252897ota.334.1594152388040;
        Tue, 07 Jul 2020 13:06:28 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id d193sm302792oib.53.2020.07.07.13.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2020 13:06:27 -0700 (PDT)
Subject: Re: [PATCH] usbip: Use fallthrough pseudo-keyword
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200707195214.GA3932@embeddedor>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <977e88c2-58cb-9507-c889-854e574a8f31@linuxfoundation.org>
Date:   Tue, 7 Jul 2020 14:06:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200707195214.GA3932@embeddedor>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/7/20 1:52 PM, Gustavo A. R. Silva wrote:
> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
> fall-through markings when it is the case.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
> 

Is fallthrough syntax supported on our min gcc version?

Does checkpatch or coccicheck catch these cases?

The patch looks good.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
