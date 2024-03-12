Return-Path: <linux-usb+bounces-7879-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40723879275
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 11:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 864111F22C21
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 10:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723F778B7B;
	Tue, 12 Mar 2024 10:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l9K2VNOl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D002572
	for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 10:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710240725; cv=none; b=SH+AbWtXAToivvq6njU6jDh6UHGQgT4XBPEJXB0Xv0P9ErB5IEwTVGAhHlq8doxrwHek95XICM6yc/5wSi66p8KKP/ORRnQYuccqOTbRSqUgr0O5gi4ZSfUzUTMsr0nxIBP45Lnk7w7jDJYOClCjdA8zuFVOcC1syDrXHvDpHPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710240725; c=relaxed/simple;
	bh=/ZEjD7efh3KrQdGAWE7k/j4K4u2Fm9HoiF/t4L9kY7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iyXutOTALkVChpc0a+hxwyqzvKyvfFxAQEyHbezZTT6BtCjKF3g0urwHGkLY5g5bQIvEh+Os9vXyCA5PFwJQAmSWPKUUaNW3BX3KWAOcICedg9L9UubD8pQfKC2eATBfx8QeQsKPCe9OFICYyB/o1KALeve+SWQHEQ/sHNv+MbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l9K2VNOl; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5683576ea18so4944197a12.3
        for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 03:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710240720; x=1710845520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bu6+LLVfvLRk+4XXFg43GrQ97HaC/9aw5HQn0qTXuKQ=;
        b=l9K2VNOlXrDVR0/njYQoY7kAYkwfO2w7q+vu5Hmo562vUJxVjt5KxGlIC26t0FhCvA
         LaM3CaHpB2BSzIpLaRK8EdeJ6VZ2G/3z8DLQ7QVIrcD5kyDq8du+z5GJu/j2cxbgna4Q
         gis/mKZTAUCXh6y8k4rmMWyS06eC2LP85aNXGB2maDWJHJZu6AIijvyxmJgyCb2duA0Q
         KLchgY9rDNIjhanWIWdM5pOd6gAi4r2btX6rpJalNGtX5lAde/gMLBBfZQKSGe4QOMY9
         VCYVtyAJrcyed/tRANuSmrshA8jcq06IBvGOiWtW1aqSZc07W20yebijfm5gCjgLJU2X
         Ds7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710240720; x=1710845520;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bu6+LLVfvLRk+4XXFg43GrQ97HaC/9aw5HQn0qTXuKQ=;
        b=OBhCbn8PjPzv01OH1MMIHpJzWZtdTEwxdRVVL1svRt81NX2nkq8Md8P6S4GseiqcZS
         6Y3TC49QfuArFeLOXYxfg1Ix/scY6+1C5ahwwM+/tU9cUOn6PSUkzSnw29WLby8uw7kY
         FeXsKhvaaIELA454WhsRGU9y9A8fbnR0aIUCvQQP/abWcpemjS1FWzC80Cw2OlW3lhC9
         25JkKjMWPfRReK8ut6vSEeDWXSIL8axdid1GxTrs4xzJtfxRbfxjMEqZ/EgQqz8INwFf
         qr5qUdewOaVZyOQKINymZwzpGHKkbH5jilxDo+Mj+ZSS3CpZ6TPKHgFYW9Qa9CBloKnA
         cLrg==
X-Forwarded-Encrypted: i=1; AJvYcCVW0xysO0+rZW98kMCa8fFdx62484wjVIS55nxG8Y/vNrDo/Ihr0Hjy9ZhbzU74nr6sIj1sIeks1XiOyBhNsHvfMq3ztoWfb8BD
X-Gm-Message-State: AOJu0YxcN5fDhUM7rzSmR64ceBK6D3lLQK3NMdRsc3DBGa+5duMs6OE6
	61sHqJBiP7fPAXqoBvv5+YyTF7leAmxD3seF8X3zB1wNWIhmiNl3cvvEvaH0gAU=
X-Google-Smtp-Source: AGHT+IFJul748kXjFnz4DDSxsfZTHrCjYIviegCUOTT6PMd8nf3sfLy+vD9FNqMyKsXcyHIF0tWOKg==
X-Received: by 2002:a50:85c3:0:b0:566:ab90:1073 with SMTP id q3-20020a5085c3000000b00566ab901073mr3022007edh.34.1710240720446;
        Tue, 12 Mar 2024 03:52:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id da17-20020a056402177100b005684fc23524sm2716259edb.49.2024.03.12.03.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 03:51:59 -0700 (PDT)
Message-ID: <afd0fc30-6c05-420e-95cb-b9315a29f56f@linaro.org>
Date: Tue, 12 Mar 2024 11:51:57 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 1/2] dt-bindings: usb: typec: anx7688: start a binding
 document
Content-Language: en-US
To: Pavel Machek <pavel@ucw.cz>, phone-devel@vger.kernel.org,
 kernel list <linux-kernel@vger.kernel.org>, fiona.klute@gmx.de,
 martijn@brixit.nl, samuel@sholland.org, heikki.krogerus@linux.intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, megi@xff.cz
References: <ZcaCXYOf6o4VNneu@duo.ucw.cz> <ZdkOCqPKqa/u9Ftb@duo.ucw.cz>
 <Ze92B/PPOvvrtnkA@duo.ucw.cz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Ze92B/PPOvvrtnkA@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/03/2024 22:22, Pavel Machek wrote:
> Hi!
> 
>> Add binding for anx7688 usb type-c bridge. I don't have a datasheet,
>> but I did best I could.
>>
>> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> 
> Any more comments here? Automatic system told me I need to replace one
> character...

Well, I often do not review patches which have build failure so were not
compiled. In the terms of bindings `dt_binding_check` is like test
compilation of C, so just like no one reviews onbuildable C code, I
don't usually look at "unbuildable" bindings.

Plus original v2 patch went into some other email thread, because of
"References" field, so a bit disappeared from my inbox.

Best regards,
Krzysztof


