Return-Path: <linux-usb+bounces-3090-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F11507F2C78
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 13:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA9E5281F0E
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 12:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73496495CA;
	Tue, 21 Nov 2023 12:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1vzJnPU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BB68123;
	Tue, 21 Nov 2023 04:02:21 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1cf52e5e07eso18633505ad.0;
        Tue, 21 Nov 2023 04:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700568141; x=1701172941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hd1DC/SqNOv5a5eH+xtl1lsGhhPk+8w1do5bp5KGmWs=;
        b=e1vzJnPU0E80j8bBGBm8nBwvp9TmymWYNZd39gCfUpXNH+TJSwybKCYBW3e9EWnX2v
         I4oMK4TXIbOFbL5qeos9fWK0ZV/zJTMID52U1mlBm/8e+QuhhI8c9d4Yt7Pz6GRoFCS4
         cY89mPDO/jRLZ7onzoLUf7Cz+vBhGbChiRDTdhPDtk8gJdsLcp8v3M/RGZFfJOIqmpDO
         THqeMBC1lwa2MuM/rZUEJfVH1cDUiB32w5yUwf4wkTGVbcEWLqOrlYQ17BFRdpu+317U
         No49zwFCieATScqyWKWQqO0CdlBxh5O2QQ31+7QxeuGA9SzmbqAQA31WiJTTVrBxgoA8
         0jgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700568141; x=1701172941;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hd1DC/SqNOv5a5eH+xtl1lsGhhPk+8w1do5bp5KGmWs=;
        b=ctEZQFiZhcYbgJENrNsG4c7kSobwOYO462cT7RtN3soKrtW71/ns8g1XPZubH/m3NP
         xoXk41YDBhulItgpUzm23HbaD5wy48c2qujz4U55fX6Dv0Gsdfz/7rhp/hZimBZjBFlE
         Er91T9WzuWht0kBtBfsVouTcWQah+24xcHKSgdbNbtTnEbJf26DK2jEQLI1RkQUAHGLm
         c267LIFXe7/HiZhrg7RBhdVjLqrFW99UdFnX9aqAkQpqu2XaHia/fuKMBv1+ywD+Pho4
         ncvwEIypV0pVQAXHdCfMsq/pNynsKZnlXX372v+8kt2EFaVc8mKKR2sgznmjEdrXDcgz
         OYjw==
X-Gm-Message-State: AOJu0Yw89+bHYHakFuiqfs4/PHKOUMgE7/x/eLoP2b0A/8Yj8woDCnrb
	R6c/y4mfH9zxOjr6ko6pjtLxId80oSOPSWNHPfI=
X-Google-Smtp-Source: AGHT+IFfzMWNbwZCuBHDaSiZ7b4+mx4ysuNLrWPkMxwMSPRUr0axr+pHhWZb4NUwxeHGeS2KDiyOMQ==
X-Received: by 2002:a17:902:e748:b0:1bc:edd:e891 with SMTP id p8-20020a170902e74800b001bc0edde891mr3543732plf.1.1700568140782;
        Tue, 21 Nov 2023 04:02:20 -0800 (PST)
Received: from [172.24.5.154] ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902d38400b001cc2c6cc39asm7726317pld.243.2023.11.21.04.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 04:02:20 -0800 (PST)
From: SpriteOvO <spriteovo@gmail.com>
X-Google-Original-From: SpriteOvO <SpriteOvO@gmail.com>
Message-ID: <7bdf5f7a-cdcd-46cc-88df-8bc0706ec9e9@gmail.com>
Date: Tue, 21 Nov 2023 20:02:17 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: serial: option: add Luat Air72*U series products
To: Greg KH <gregkh@linuxfoundation.org>
Cc: johan@kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>
References: <20231121111626.64804-1-SpriteOvO@gmail.com>
 <2023112128-spinach-quit-0d8a@gregkh>
Content-Language: en-US
In-Reply-To: <2023112128-spinach-quit-0d8a@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I've been using that name for a long time in open source communities, 
here's my GitHub profile:

https://github.com/SpriteOvO

Linux has allowed pseudonymous contributions since earlier this year, 
does this apply to me? If you are concerned that "Sprite" will cause 
confusion, I can use "Asuna", which is the name I used on IM chats and 
social media platforms.

I apologize for the confusion.

On 11/21/23 19:25, Greg KH wrote:
>> Co-developed-by: Yangyu Chen <cyy@cyyself.name>
>> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
>> Signed-off-by: Sprite <SpriteOvO@gmail.com>
> "Sprite" is an odd name, is that how things are signed by you?
>
> thanks,
>
> greg k-h

