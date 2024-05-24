Return-Path: <linux-usb+bounces-10523-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFA48CEAB5
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2024 22:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 972E1B215B6
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2024 20:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CA771747;
	Fri, 24 May 2024 20:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wzY8fuDX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379CA84D0B
	for <linux-usb@vger.kernel.org>; Fri, 24 May 2024 20:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716581305; cv=none; b=Rl8amtl/5WLbPu9Z92gTHOJXjMDyoRACjlPUQ2d3EaVyYF6lpR8zOhu0YFG8iwdeKnTQqKrlpXtnkIP0IPs6we6Rw6QKZK+kV315/KyIwXLkGDOPgtek9qPE+Jf310D+crdmF2aZeSC+OZTUvwbG1GWyw6tGcK8EBeXIxbw1scA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716581305; c=relaxed/simple;
	bh=4FcReVOVCS7hYyDzoxRFPQL2lrzw79+DnOI7/JBY7bI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QvVCYjAiBZJOw7Wvgh4vCpsLa3rRWMO3pfeCH260Bxer/XOISegpRhwJ1d8xCAen/i9V2QTNY7ZxwWomVEUY8m/SVgjc67ZrpNiuhW2tZ+cGxnChmMRBSDainQdid7dZgGaT05MNy8XBfkpvyv8TLh+CQnWH51tx1101A1S0S7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wzY8fuDX; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-62a087c3a92so12976967b3.2
        for <linux-usb@vger.kernel.org>; Fri, 24 May 2024 13:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716581302; x=1717186102; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eCIWhXYa2p87CDvkJmySfb+8QTD7UAzsT7978LLc4BA=;
        b=wzY8fuDXc2MIzqoc41UIfK6/pwnVFMAg/Ga7Jg7yC7gD7f7H50dLYsRddqUn3tgXK5
         rcXTUO/hpOywg5M+fsO1s8pcT+bTb+69rKZ27CyG/ijGbqcHxy1Nznow+ksZGN8g+hPw
         0xyITZRZi7kiEOSn6cYCdkVNtB2MYuvMRgOpC7yRffDXFHJ++7HSilg30XnRs3Tg67iT
         XnEWxbSZQRMp9t+BUqILT/ipSn4xnuGL9c/H2CLkuNno966Rf8aP+erDTB7nPDGFG5oB
         tt8VTlUelt82XcmMMc+4oXZTFe8y2PfxnjZOjbS/2zTKe99R1lrKwrKs8Aukb89fzg+t
         s4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716581302; x=1717186102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eCIWhXYa2p87CDvkJmySfb+8QTD7UAzsT7978LLc4BA=;
        b=FsxF+NraDDRkEXXK/oR8VSg2U7nW3klCfBZpQMwQmlYybxKEjlgeXUqPhA4nNwhWyq
         vBbmTp1lH5dmPoFNQNSj6rsEx+t2dwwz5Zy9YHfxo7sQXo2Nrd2tAl2N6Z5mY6xKvO6d
         s0WPWnsAbtms3AzlbEg6cXMj3U7JfA79EiGyYdmQt2fLmelpFBwgh2YNvMltKRILDYif
         iKIX84LSFFjZoMEdRdb1iNpwjDwGFINDCtXg/kCFLKXXV40ycs9pews0+IVEnehKUMaP
         Ajl1lt8sdnZzlJCyP+fkaaYklTl5u06Ub+iCtsFKVSnfZQn77qVNR/e9QOPrRrwiBtML
         Dytw==
X-Forwarded-Encrypted: i=1; AJvYcCUl5hPrgyDq6qhWgj6s+duwBlcSwjSWzAFltar29+opTDNYAeW6jUmS6FGltmOMtzVxjaPhSU8jRt6R7e9U3kt2hweTXFMsxiD1
X-Gm-Message-State: AOJu0YzYPbXYcPP2BjbJMkZlEKON5zGQ2SQgjMyqbJ1J5t5tH3J5wo0/
	xNjC9G73FDm1RhMe6E//RhZHwe7yAHSCjlQGQFbr4+KxnEouNmNFL+cr780wPUj7rqHLdwnjmKU
	u2AEXZj/ao8kpysVIpxXPuPGbPrEOj5VgmAbPHQ==
X-Google-Smtp-Source: AGHT+IGfAILPpHKmHhMhPuha3zVO3krHrOtz2jtUmy9g1cSv1RC+mxHXjhsBUatjQc7ZmXfc28FlOTJyiuPQQbjt8K8=
X-Received: by 2002:a25:6b0d:0:b0:df6:ad25:f5ef with SMTP id
 3f1490d57ef6-df77237822bmr3447230276.58.1716581302201; Fri, 24 May 2024
 13:08:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMSo37V5uqJ229iFk-t9DBs-1M5pkWNidM6xZocp4Osi+AOc1g@mail.gmail.com>
 <20240523064546.7017-1-jtornosm@redhat.com>
In-Reply-To: <20240523064546.7017-1-jtornosm@redhat.com>
From: Yongqin Liu <yongqin.liu@linaro.org>
Date: Sat, 25 May 2024 04:08:10 +0800
Message-ID: <CAMSo37UyC-JRfZjd83Vx2+W-K-WqxAN9sHJ88Jev67Fnwci_pg@mail.gmail.com>
Subject: Re: [PATCH] net: usb: ax88179_178a: fix link status when link is set
 to down/up
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: davem@davemloft.net, edumazet@google.com, inventor500@vivaldi.net, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, Jose

On Thu, 23 May 2024 at 14:45, Jose Ignacio Tornos Martinez
<jtornosm@redhat.com> wrote:
>
> Hello Yongqin,
>
> Again, not a lot of information from the logs, but perhaps you coud give me
> more information for your scenario.
>
> Could you try to execute the down interface operation, mac assignment and
> the up interface operation from command line?
> That works for me.
When I tried the down and up operations manually from the command line,
it worked.
But it only worked after I ran the down and up operations after the boot.
It fails to work by default after the boot for both the fresh deployment,
and for the later reboot

One thing I noticed is that the following message was printed twice
    "ax88179_178a 2-3:1.0 eth0: ax88179 - Link status is: 1"
after I ran the up operation,

Is that expected?

For details, please check the log here:
https://gist.github.com/liuyq/be8f5305d538067a344001f1d35f677b

> Maybe some synchronization issue is happening in your boot operation.
> Could you provide more information about how/when you are doing the
> commented operations to try to reproduce?

The scripts are simple, here are the two scripts for Android build:
    https://android.googlesource.com/device/linaro/dragonboard/+/refs/heads/main/shared/utils/ethaddr/ethaddr.rc
    https://android.googlesource.com/device/linaro/dragonboard/+/refs/heads/main/shared/utils/ethaddr/set_ethaddr.sh

Is the one to run the down/change mac/up operations script.

Not sure why the up in the script does not work, but works when run manually.

--
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android

