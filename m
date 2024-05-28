Return-Path: <linux-usb+bounces-10640-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D45718D2017
	for <lists+linux-usb@lfdr.de>; Tue, 28 May 2024 17:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37A0528467E
	for <lists+linux-usb@lfdr.de>; Tue, 28 May 2024 15:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B8217165C;
	Tue, 28 May 2024 15:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jZ092uL/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6206A170833
	for <linux-usb@vger.kernel.org>; Tue, 28 May 2024 15:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716909315; cv=none; b=ekDZTVDwqei7JkytXMuPInsEEMWm3GHd7n66YrOeJo0/bPhzeud7WFpK6gJfRq3UZVAXv0ObrEoMjYt+CGQ6D3j4NoYCHL54GTmGaUvduQB5Wf/XAIbC2m60CcTVk6dirYepbxNo2CEu8vUPFQZ6g9QHuEPtcZi6uBRX6911XVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716909315; c=relaxed/simple;
	bh=tqLiPN5amlvHA7fWTBc4Bily8zs9asXJlXwi5CKHC2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iwB20awRBhd3fG5uKUg/U2jP/7YH2CVrz8nvxL/96qWQxKMQe4ViCDPpK0nZLoHc3BvX2H2AGCFpJP0Y/V59Xap7Y1IJ4erDkilcUMts+hCrW7XyJ3L8Xbs/GSGYxGkGgQ6tEnAQES5wxL3Flon/YHtxS/7WvZba7jlTGfyjEaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jZ092uL/; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-df4dce67becso884290276.2
        for <linux-usb@vger.kernel.org>; Tue, 28 May 2024 08:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716909312; x=1717514112; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DZlgz6rpKv8RDjntoQGkTFXF4S8SzOpaXSeRL3rg2Vs=;
        b=jZ092uL/ktNAxltzv+uss3nbb86PxxbCer1Qztc69hNlVsnvdrNkyd8VXeok1U03xS
         ICGUEwxnVSMgzgM8pYI3bkvravmkWJNd++XhBxtLCRBsV4iW78yd/v+zDM+3PeSMlv4J
         h9s+MO5/x2g2er9R3wY4F5OLX+xlDJCR3OegzgbYorNPuTkCDODBCC7wAQe66QZ4zLOv
         ojQEIPzFXKdk7MVnn01EzGKAyMQq8Nk+3awa8Te63YKQMdJzLmYJQ2Gs9fQ/KM21ciyp
         dTlDCTLsh17NzEbdhy9PWgnfAyNIMrOCtZIrM35uITDc7VRoKfRykRigVY1xVzjRlOAh
         tE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716909312; x=1717514112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZlgz6rpKv8RDjntoQGkTFXF4S8SzOpaXSeRL3rg2Vs=;
        b=KyN8Zt8g6WICXgVhGeKmD85x0V+6bTOwXTZBtnujm95v67svB+sejyaVpNyX+xNMMp
         /ksBXY2C/y7rHAtftFxQNF+mk26CLVjlp24CbBE0iGpJo40v/cPqa1xOXOnxpdpMPWlM
         gPA3qD5UtIH+Vqwj/LK0YX0lz/9FuVl4Uf1dVBPjtm19uzv3v57eM935mLbFZedCeX9v
         6konkZnmziiFbWtiIUbY2y4nFqvFAUn3ybgnyR4qvqbaUwgVnEjv6S1oDY6mX/zbs6LP
         cHQ2BsAw7Tj9rC80/6VRz8KE0k/QGVThZu1Njq//ls+IbqljbNBE/r1Lh2OPJc5sygyb
         cg8g==
X-Forwarded-Encrypted: i=1; AJvYcCWHAs45uzZ05cGgwQyNZJeYsCxAR6sFt96nmlpX/J2el1CdEcF6H70i5Bh7lQR7C30YiH3twtFIjn1w9TJoji+hKPIVnZwpi4Wd
X-Gm-Message-State: AOJu0YzziJbspJ8/Y7TwI2YXMvFy6+i3II97crtvdso5cBwWwtY8P3Is
	OHWCIuysS8f2RAg+zwlpNxgGDaURsK4WqmOPGe7YoZUuWhM13v7SG/xMKnYU/E9JD7di5BrKHZ7
	xNU3IwraEuav+J7g+v/mdJM0/ABnSfsIUl/O76Q==
X-Google-Smtp-Source: AGHT+IEKk+jMfb4UjQ2vLhkVRwJcPbBfG+1IZvWjYuTzuxuXisQPVm0zrHIomjE5POF4/tmNCe9LlwLUsAzYUZawgkQ=
X-Received: by 2002:a05:6902:507:b0:df4:d692:93b7 with SMTP id
 3f1490d57ef6-df772266789mr12143479276.44.1716909312385; Tue, 28 May 2024
 08:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMSo37UyC-JRfZjd83Vx2+W-K-WqxAN9sHJ88Jev67Fnwci_pg@mail.gmail.com>
 <20240528091831.13674-1-jtornosm@redhat.com>
In-Reply-To: <20240528091831.13674-1-jtornosm@redhat.com>
From: Yongqin Liu <yongqin.liu@linaro.org>
Date: Tue, 28 May 2024 23:15:00 +0800
Message-ID: <CAMSo37U3Pree8XbHNBOzNXhFAiPss+8FQms1bLy06xeMeWfTcg@mail.gmail.com>
Subject: Re: [PATCH] net: usb: ax88179_178a: fix link status when link is set
 to down/up
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: davem@davemloft.net, edumazet@google.com, inventor500@vivaldi.net, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, stable@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, 
	Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 May 2024 at 17:18, Jose Ignacio Tornos Martinez
<jtornosm@redhat.com> wrote:
>
> Hello Yongqin,
>
> > When I tried the down and up operations manually from the command line,
> > it worked.
> > But it only worked after I ran the down and up operations after the boot.
> > It fails to work by default after the boot for both the fresh deployment,
> > and for the later reboot
> Ok, so it works as well for you after the initialization.
>
> > One thing I noticed is that the following message was printed twice
> >     "ax88179_178a 2-3:1.0 eth0: ax88179 - Link status is: 1"
> > after I ran the up operation,
> >
> > Is that expected?
> >
> > For details, please check the log here:
> > https://gist.github.com/liuyq/be8f5305d538067a344001f1d35f677b
> That is another thing that I am analyzing, to clean those spurious.
> But they are appearing in my case too, and I am not modifying anything at
> boot time.
>
> > The scripts are simple, here are the two scripts for Android build:
> >    https://android.googlesource.com/device/linaro/dragonboard/+/refs/heads/main/shared/utils/ethaddr/ethaddr.rc
> >    https://android.googlesource.com/device/linaro/dragonboard/+/refs/heads/main/shared/utils/ethaddr/set_ethaddr.sh
> >
> > Is the one to run the down/change mac/up operations script.
> >
> > Not sure why the up in the script does not work, but works when run manually.
> Ok, I am not working with Android but it doesn't seem spscial, the only
> doubt is when the script is executed, if the driver initialization is
> complete, ...
 is there any message that I could check to make sure if the
initialization is finished?
or like with adding some printk lines for some kernel functions to hack

> Anyway, I will try to reproduce here and analyze it.

Thanks very much! And please feel free to let me know if there is
anything I could help with on the Android build.

-- 
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android

