Return-Path: <linux-usb+bounces-2316-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 876C07DA6B0
	for <lists+linux-usb@lfdr.de>; Sat, 28 Oct 2023 13:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF8561C20A23
	for <lists+linux-usb@lfdr.de>; Sat, 28 Oct 2023 11:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C8610A08;
	Sat, 28 Oct 2023 11:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvYoWMez"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689C4B65D
	for <linux-usb@vger.kernel.org>; Sat, 28 Oct 2023 11:20:52 +0000 (UTC)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C297AD9
	for <linux-usb@vger.kernel.org>; Sat, 28 Oct 2023 04:20:50 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c50906f941so42794561fa.2
        for <linux-usb@vger.kernel.org>; Sat, 28 Oct 2023 04:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698492049; x=1699096849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAck/6qKWDraen+tV31UeIYbVIAWhijiSU82fYtGfdA=;
        b=SvYoWMezJFVeM2YhLUHboH9WRDzdKQNCVDOnU78ZiHIwatQonk2LpkcYYSeDLUBswm
         sjCbveO+zlpGCHSLLUTjYuO2ZUUHkn5CvZeEr4uzfkt9/ZZVs0YA+dysyok125A5U+ip
         fnZ3wDGGGqc+k5AHTiyEXSX9VOclBxMsVQM2F+OpdYewOM9IjtHpFQ9csi9GkeHjwqLW
         RGbcAwYq/xp8IXbwlaCqkuyFfbDO7lH21LrPt3aNqRrN6KwU3QiEI50x6GW38J0JukRW
         yLw6z4k1n1+d1sAcCwo+Pj6fj1HKUh3eT9hMIFnZcj6tH64YeuaGUDkBAc4bGIu888Xd
         z4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698492049; x=1699096849;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gAck/6qKWDraen+tV31UeIYbVIAWhijiSU82fYtGfdA=;
        b=eRW+oL/LEwLD8W61uDzxa0H1v91MTfg+LXvNWbnh0fjcINNHjh23YdHaOzgU0mJzW6
         TlAWYatVBSF8pLLff7RAo65Tv1FIxziYHHcoSBVpT3lrTld38YaajBj6OdnYNOT8jww3
         uusL+fvIUMbP+TngIu7K5RMW6eebMqiPpbmwXCTK4h6aHvFe6rezT55KvK3c+oCUs/cQ
         /dPCdzTKuX4XDSrf2bO6OMu3t/sFVXsIfo5tf43WbXzWOi51teXT1LMjiJ3h5ZZWSue4
         LUQIvJ1RDgc05pw5mmOK8UpqMYcuAKrIuI6vAgE4+/UtKXEQuloknHhimxr26zzryV59
         tgCA==
X-Gm-Message-State: AOJu0YwVZ1i6l7hRQ2tdumoXmqKvTIQmsNIe8yuMNLmKWeZeSKSCRRsm
	QLU07bjK4iAA+1t5m9MvTLE=
X-Google-Smtp-Source: AGHT+IG9fkF3rQlbUrbAtXRWCaq20nPyu4oSngW4d9oASqn1SrKnRSrQbFsCsZ7Kba1vXgVGg5hGVw==
X-Received: by 2002:a05:651c:1032:b0:2be:54b4:ff90 with SMTP id w18-20020a05651c103200b002be54b4ff90mr3841957ljm.53.1698492048694;
        Sat, 28 Oct 2023 04:20:48 -0700 (PDT)
Received: from ?IPV6:2001:14ba:4c14:9c00::188? (dltml4yyyyyyyyyyyyhfy-3.rev.dnainternet.fi. [2001:14ba:4c14:9c00::188])
        by smtp.gmail.com with ESMTPSA id y28-20020a2e545c000000b002b657f10b78sm634531ljd.58.2023.10.28.04.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Oct 2023 04:20:48 -0700 (PDT)
Message-ID: <fc65171d-ce06-44cd-860b-8425ec066f0d@gmail.com>
Date: Sat, 28 Oct 2023 14:20:47 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: storage: set 1.50 as the lower bcdDevice for older
 "Super Top" compatibility
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux USB <linux-usb@vger.kernel.org>
References: <ZTsR-RhhjxSpqrsz@debian.me>
 <055de764-c422-4c22-a79b-dd4db56122ce@gmail.com>
 <2023102704-stable-lid-c86a@gregkh>
 <7484f7c8-a49c-4111-83f0-bb6db2906fae@gmail.com>
 <2023102729-spent-ninja-7e39@gregkh>
 <037e5af2-3afd-4a37-a4d7-6dc87af605c7@gmail.com>
 <21c2b8ee-7753-413e-98f9-d1401edf5c73@gmail.com>
 <2023102720-emotion-overlying-9bb4@gregkh>
 <ccf7d12a-8362-4916-b3e0-f4150f54affd@gmail.com> <ZTyyDXYR4f6WKdLM@debian.me>
 <2023102848-esteemed-reptile-851f@gregkh>
 <68ad3c1c-bc5b-4dd5-9183-202d8b04b45f@gmail.com>
From: LihaSika <lihasika@gmail.com>
In-Reply-To: <68ad3c1c-bc5b-4dd5-9183-202d8b04b45f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.10.2023 14.05, Bagas Sanjaya wrote:
> On 28/10/2023 17:23, Greg Kroah-Hartman wrote:
>>
>> There's no need, I can take this as-is, thanks.
>>
> 
> OK, thanks!
> 

Thank you all 🙏

I will use git mail if I ever have any more to contribute in the future, thanks for all the advice 👍

Have a nice weekend!

BR,
Liha

