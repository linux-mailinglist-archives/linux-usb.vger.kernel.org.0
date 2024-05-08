Return-Path: <linux-usb+bounces-10127-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AC68BFB30
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2024 12:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C67A6282236
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2024 10:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771CF81AC8;
	Wed,  8 May 2024 10:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z3FgsNNT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542C32836D
	for <linux-usb@vger.kernel.org>; Wed,  8 May 2024 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715164932; cv=none; b=U+Aj2uVnfny7/rvkkhkum4PJl9yW8Z7EON7Fezq+C6HW6IwgjbEZnu/0M1gKlQDU0S/fZUbl0PDQwtyLgEKvWMn+KLnYsRdg3KIPEcmpK/c+ORTrht/DLFpaBviJtgQ6iGuxN9iP8BKnraCDdkxxT6lEHThSUp9uUB8i8aFdYsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715164932; c=relaxed/simple;
	bh=msFOWMMZAv+nOcQqKV5mzuGZJ+dqXm8YAjq5UYtYae0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BH9VMPJZfyaMKGa8U+udAkMWmrY830KFTzmzely0E5y9zmTHkxPGOf1TyPTs1CU8HxCt+g+M14kIRZzzarGuqSpCum27YxLkY+tHlV0PqR8x4mkhTRdkQMhI0hikFuL6UovnVjUgVjdczQerOX2sUar862JMc9SrwXWyn8f2FOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z3FgsNNT; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-61ab6faf179so43673717b3.1
        for <linux-usb@vger.kernel.org>; Wed, 08 May 2024 03:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715164928; x=1715769728; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SCNZSYQEn9C0yYifJvIKeqaC0I3ddBBIVvQAOJJfdew=;
        b=Z3FgsNNTxk1w3eCb/U+dIqo+fSnddur6Kj3Hjwm6PWw6J43QdXoqeyT9WmkuZsv2Fn
         r0CglCSOtTjn42IStELQLTUfutMDTHCLcjU7Xv9xg0rZExtbqIQLsgy+7rKvINYWrjr3
         mpdFacD3PlzYQKEt0u4BXc6JzQs8LEQjpOU0pyERqcnGVQJqam7XE69WSpuRL07S+eMF
         8UOwMlMZPVNNO0MtG3MSzXrNLqYVpOcQ9By2Rf+4C9CaYhcWQ1vYd5xPF98wCF6TtCM5
         QhLhFYECHfF6Cpj66Bvzue9MmTZucTPd1gd8CXiZSy7hhEj2vRMqYGZQ71X1My/ETTNL
         JGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715164928; x=1715769728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SCNZSYQEn9C0yYifJvIKeqaC0I3ddBBIVvQAOJJfdew=;
        b=urtvIcRAByIS8Mq3PFqQaYHOt6laP7eecD9WW41gK8ZBOEQMKqvslpSb6lYS72SKbi
         r4U5j2misv/6KLKZq7ZtNMDA9xwFXkAOBFpdNoX7kj7fqQ/LoA73GJ5Q7aZnn5XWO81R
         XE4txJV3En3BrcorVb+Uc5bPTBbLu3VIkHtvsnwJEZ0wjMh1vTWmT5I0WvLor6avRIdi
         irkg7PVKh63DZx/ceqwUMc8o3NnEj0x5QcQlAZB5pE1R7saDbX94VmqAtRMBxWCtdpqr
         QtBl4eBUN2Efn+LuxUGra7TWLuTZQPBjyO5KklfPQYBQQuAW9NQ38UbIKeRoLMDDfR7r
         qiQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYLpTe2pmiqwOyPi94+rLqR3xvrNSZ7Fs1BkdRRu1IkgEwTZtPtRiOTWYHMUeI4/NWmhItaCbqI3rzjrgriK1EwpeDXvazikFy
X-Gm-Message-State: AOJu0Yx26ROC9Y8bVKUBiPbMq3rgq9uqzxNyQuouaBJUKmFl1ud9uTU7
	Fp9pzzM2oQUj8BoIgig52KVbpwsqvcGYMDHzz/w+FJmhMnkMA0G3/KlugPRKSExLWvIs+mxnrG2
	h46mk3PbYScVa1+1N3esQnRFMauhwahXF0fEqfA==
X-Google-Smtp-Source: AGHT+IG/YkpxJFnMtp9np4dGXgtlpi8FQCo5Um1fohI6F0WuAx9qFoD5jZyRnJpee9YYAVFVuPsAG5b/WQKuWWsqGYM=
X-Received: by 2002:a81:844c:0:b0:61a:db67:b84f with SMTP id
 00721157ae682-62085da981emr27885857b3.27.1715164928430; Wed, 08 May 2024
 03:42:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMSo37UN11V8UeDM4cyD+iXyRR1Us53a00e34wTy+zP6vx935A@mail.gmail.com>
 <20240508075658.7164-1-jtornosm@redhat.com>
In-Reply-To: <20240508075658.7164-1-jtornosm@redhat.com>
From: Yongqin Liu <yongqin.liu@linaro.org>
Date: Wed, 8 May 2024 18:41:57 +0800
Message-ID: <CAMSo37XddAvE199QpA_WR5uwQUjzemF8GxqoWfETUNtFw6iCrg@mail.gmail.com>
Subject: Re: [PATCH v2] net: usb: ax88179_178a: avoid writing the mac address
 before first reading
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: amit.pundir@linaro.org, davem@davemloft.net, edumazet@google.com, 
	inventor500@vivaldi.net, jarkko.palviainen@gmail.com, jstultz@google.com, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, stable@vger.kernel.org, 
	sumit.semwal@linaro.org, vadim.fedorenko@linux.dev, vmartensson@google.com
Content-Type: text/plain; charset="UTF-8"

Hi, Jose

On Wed, 8 May 2024 at 15:57, Jose Ignacio Tornos Martinez
<jtornosm@redhat.com> wrote:
>
> Hello Yongqin,
>
> Sorry for the inconveniences.
>
> I don't have the db845c, could you provide information about the type of
> device and protocol used?

The db845c uses an RJ45 as the physical interface.
It has the translation from PCIe0 to USB and USB to Gigabit Ethernet controller.

For details, maybe you could check the hardware details from the documents here:
    https://www.96boards.org/documentation/consumer/dragonboard/dragonboard845c/hardware-docs/

> Related driver logs would be very helpful for this.

Here is the log from the serial console side:
    https://gist.github.com/liuyq/809247d8a12aa1d9e03058e8371a4d44

Please let me know if I could try and provide more information for the
investigation.

-- 
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android

