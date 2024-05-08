Return-Path: <linux-usb+bounces-10124-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9CB8BF59D
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2024 07:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31CDB1F24A11
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2024 05:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51A817BAE;
	Wed,  8 May 2024 05:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KcIa/Bhi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CEC1756A
	for <linux-usb@vger.kernel.org>; Wed,  8 May 2024 05:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715146970; cv=none; b=nJEJrousow09DluqHBwjyvqodWgsemvfvdRQhs6XRig7x35e/1YJlz6IO+KDWXcWcaHgCSCUEzkRq/bTB+BIWthT4l5SqJzTqCaJVfhdMqU4Gpa260klhJRdR//3Kf/Q4wGgu4+rWtxGYHXVcuOukau0EuTHwuoKHtbGpUhFOto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715146970; c=relaxed/simple;
	bh=Dm8oAyDId/BGzFguq4WTwi8cfuw6NO7IL3CwBWqI+YI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tFo5CDmDFlK7Ivhd5spME3sVFsN0tAsMn78KGO+CtzAZzRrtvjylXMkaLDK0f3HkJPDwNGScfBKfkLjWuHhsF2HshRUfEXXuV40SdyIcv8Bw0uEm83n928ED5HZW/8/cjrgP+ddy9vL8QETIfeUKvvWcf9Cse0E90CsdnevWuk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KcIa/Bhi; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-61bed5ce32fso43600727b3.2
        for <linux-usb@vger.kernel.org>; Tue, 07 May 2024 22:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715146968; x=1715751768; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8is/8kMXXquytRmRTTojazPRXnlwoDhApNzUo9b3+OQ=;
        b=KcIa/BhiRW5xS3AQueE75g59SNsIUK7uFzmASvX+e254/TVlCrWRvk69o5U56MBJVJ
         +6xNpGUi81LEsfeMlpf6hPyxUdTvREE/rIno9US2AeUv9/8rmuCvX8qkUtO/S4P8x9A7
         gNql39MBxjLtQik8dAb4RLs/g8TlxD2m+dPOYdISqkTDJKRFqa+foXMAvQz00Bh58S6/
         LHt55T6ueY+mS8FEKFflcKay5dgT8SAdfyf0xb9P5MfFn4/7Zh96p49GdgRLyEj69xui
         BSmXw9E1iueHRuA82pmMB9+39RgIgqlXs/LhwyNLzhxGWgRGtzBOCF67qE5Z49dGQA17
         TOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715146968; x=1715751768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8is/8kMXXquytRmRTTojazPRXnlwoDhApNzUo9b3+OQ=;
        b=JT6ZTHJsvxq8WtoD9WK4z6TvCfTfIenZr1nOGTQ2fUcWG1t002SGgeAT3DzoTLA9SQ
         TTw4APbaOVQgPyytC6bVo/QjzSqEMEOst7T+43V/86TwJmz/7I4XGv8LNB6ecK803pjx
         VPMN56uk4xZLbejBc+zORlvBLO7doNEdP/C6J6iqkh1W3QMJAmJ6Bt5/XuBNQo1qryG3
         ih3OpDreP8xYkU0Op911TfO8Wztckplwi4IqWcc7qJLdKWj895UAQKzX26jqYt9pmRyT
         sNvlOn5nFZiWMIVHUtavNyYPprl2Lx0S/iEv0MJkoIsLdZR7TYSTiJahHQNROS0ze8af
         0BSg==
X-Forwarded-Encrypted: i=1; AJvYcCWM2oTZDs6/THIba4ZuVay9wK2HqEB+PHs4U3eUK878vU7jo9jd9lNuZ8zMJAaRoN7BxSsnuQ+an1TvYpgcL4E3w7MifbHWKspU
X-Gm-Message-State: AOJu0YxQj/Qbfy0IGRcFMD0WZqA7HOg7cikZ7igqcLirXK2KcUb+PDs+
	KfMRTu+SOxs2ZqmGLsr6GVVIU3fDwhNdw/5d3ajOAc+FMgtPy5zDwWBO9G1r23T2J+J5JQgnz5I
	Sa3FTPaxS1/Sm6i/QSJuP1uW3+8sSKfZ5SETcOg==
X-Google-Smtp-Source: AGHT+IG24D1NQIZ27R3N3aZ27xeVwEEsTRm5xCfdyZ/r6uMBhrpmntSpIHxXqQrXwipOem08bGFWGZKtDUaSlW68z1M=
X-Received: by 2002:a81:7182:0:b0:61b:3356:a679 with SMTP id
 00721157ae682-62085a6fd15mr20951377b3.17.1715146967118; Tue, 07 May 2024
 22:42:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430082717.65f26140@kernel.org> <20240430160057.557295-1-jtornosm@redhat.com>
In-Reply-To: <20240430160057.557295-1-jtornosm@redhat.com>
From: Yongqin Liu <yongqin.liu@linaro.org>
Date: Wed, 8 May 2024 13:42:36 +0800
Message-ID: <CAMSo37UN11V8UeDM4cyD+iXyRR1Us53a00e34wTy+zP6vx935A@mail.gmail.com>
Subject: Re: [PATCH v2] net: usb: ax88179_178a: avoid writing the mac address
 before first reading
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com, 
	inventor500@vivaldi.net, jarkko.palviainen@gmail.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, stable@vger.kernel.org, 
	vadim.fedorenko@linux.dev, Sumit Semwal <sumit.semwal@linaro.org>, 
	John Stultz <jstultz@google.com>, Viktor Martensson <vmartensson@google.com>, 
	Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi, Jose

On Wed, 1 May 2024 at 00:01, Jose Ignacio Tornos Martinez
<jtornosm@redhat.com> wrote:
>
> > v6.8.8 has 56f78615b already. We need another patch, Jose?
>
> Hello Jakub,
>
> I will try to analyze it during the next week (I will be out until then).
>

Not sure if you have checked it already, this commit causes an issue for the
db845c + ACK android15-6.6[1] + AOSP main Android configuration, the
ethernet does not work,
there is no ip address assigned, like:
    db845c:/ # ifconfig eth0
    eth0      Link encap:Ethernet  HWaddr 02:00:89:7a:fb:61  Driver ax88179_178a
              UP BROADCAST MULTICAST  MTU:1500  Metric:1
              RX packets:0 errors:0 dropped:0 overruns:0 frame:0
              TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000
              RX bytes:0 TX bytes:0

    db845c:/ #
if I have this change reverted, then it will work again:
    db845c:/ # ifconfig eth0
    eth0      Link encap:Ethernet  HWaddr 02:00:89:7a:fb:61  Driver ax88179_178a
              inet addr:192.168.1.10  Bcast:192.168.1.255  Mask:255.255.255.0
              inet6 addr: 240e:305:2c88:4700:4b6d:926d:1592:fc5e/64
Scope: Global
              inet6 addr: 240e:305:2c88:4700:edc9:86ec:7c5e:b028/64
Scope: Global
              inet6 addr: fe80::32ce:8a2e:269d:e53f/64 Scope: Link
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:966 errors:0 dropped:33 overruns:0 frame:0
              TX packets:475 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000
              RX bytes:51193 TX bytes:39472

    db845c:/ #

One thing to be noted here is that, during the boot, the MAC address
will be reassigned
to make sure each board has its own unique MAC address with the
following commands:
    /vendor/bin/ifconfig eth0 down
    /vendor/bin/ifconfig eth0 hw ether "${ETHADDR}"
    /vendor/bin/ifconfig eth0 up


Could you please help have a check and fix or give some suggestions on
this issue?

[1]: https://android.googlesource.com/kernel/common/+/refs/heads/android15-6.6
-- 
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android

