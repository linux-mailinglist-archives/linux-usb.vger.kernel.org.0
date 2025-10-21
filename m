Return-Path: <linux-usb+bounces-29476-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDDABF4708
	for <lists+linux-usb@lfdr.de>; Tue, 21 Oct 2025 05:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DD9218C5D3D
	for <lists+linux-usb@lfdr.de>; Tue, 21 Oct 2025 03:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E5E2EBDCA;
	Tue, 21 Oct 2025 02:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="XuqmJe4a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3864A2D7801
	for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 02:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761015584; cv=none; b=WZV3uQRbn3EZo/fGI7byZV7Ke/Y+W4FaRrsXIQUlaHcjJfaNfMV4ABiueAYntiMRTnvWuIwu2VUYseBVzWpffNqRrDpIbbwzoPSh8onvj+5mfLbDJLgV6b9EWTDOcMZIwtNR5Vkd6KH2O8fyFONYomGnaePyI7KD6OC4IxNpnvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761015584; c=relaxed/simple;
	bh=8gYP8u6wS8LkGIH1qTgW3R4v4lpeWlnmtwrCX2ppgqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rC2Aufxwd+fryGU3L3btHpCPC3DHaySCwuMy9MH6mNVENOh32EshgBjGKABWBmP0oWbJ7ep+4ggjSwnaSeQOxgeTa+Ia9RNyP8ljgLio1KZZTWab2i5KbUFIazCvRxLdgRKCaD6/9HQSxeQxwjG5I1mBQNAXiy7l++BB1xF+mj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=XuqmJe4a; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-87c13813464so93902306d6.1
        for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 19:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1761015581; x=1761620381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0xcLm1skDFZ85t32ojnWL+R9z9hklPV6PG75ck9pu2E=;
        b=XuqmJe4aZsZ3rvEeOTOcRcRyob81pUbL/9qYxNFWxHP/8oj2+y58UTK8DW7llDwMBt
         hieW/VdxmXNOVx/GiMfdGPYOxEuOr74m0RonSKxowUIAYWMGmEsTj4n1Kc6bPnd3Kams
         cVX45XaMvVqX2z1d7UAe53c+bhMtD8C5+54XlKH5gXh02iguqIsXZ+j/KGrSk+gGSAJM
         Dv3SMwtFObNuSAa05eVMdB5yRqdtdut0S1xfBgkzFEznkltIozJbto4hKzw5xe23+mmF
         pWKguCgJgl3A35tTs4MsEW3T5PrTNmQOBiiC9KvCpcgA6t8kBBF8/ygyzB3AVuFg3DMe
         CzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761015581; x=1761620381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xcLm1skDFZ85t32ojnWL+R9z9hklPV6PG75ck9pu2E=;
        b=s8FKQO+gShPPLasCPGj9Jk0p9dHYbiqaIJuqetq/XdGkqYSPwggZEwUfHZMmcKCJHu
         NeiMqm+HwvjJPOMwade5AwLx/1wX+w22yuvf1l2dDYcMQL1YfXK5j8Cz9cZuGdwfbBHb
         0I5Kvr+T+TwlpkR1ZQOPaBsmg3jbWBZuuiu2Nf0P+wx/agmoLald/1cAI+pOgfvyKWKN
         Fb2n4/8d6yY2WFAlXFt2u/fOg6NZNFY2stL5hvXh4aUspmhYCGxri7//s3rhswlDOjPF
         9wKEDFTjCPb2Cphjhw7IJL9ZwM1dJKD/iHBEAD8Q+NDalrziVMIcNFYBSW0d0Jz43A7x
         2zzw==
X-Forwarded-Encrypted: i=1; AJvYcCVIOKKh76oIdLA2KGMzH0Ny3RqX2Gg8xrJt5OOZwwJeYvd5IazgKCU4S7Qgs5azJyYhIde1MgDFbqI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzev2dBFMX1fXW+0bXHz45RY3zWtsxFfZ/IeBd0WHlHGd6nA0Bc
	u+2GJBqyrDR6WY8YzVdXMmSQHmyjGlA9pvGbbEPgBrBTlGr0JjqgKTN0NchoaHHoog==
X-Gm-Gg: ASbGncvh0g3rzJ00+89SbbY2Rup6mlG26bRGc0SUNU3rez/28RPuSQfIj98WJmIFnJH
	1AdG9qwlXCMpzTuwJ4V9drrdYelI0osiLdHUzfnD/umb8dhZbRtvhxrY5Kp1EJFAm6I4aTael0v
	nWhTqj0vAuR1trIFk2Vk/Wg4FmQ6PtSjSCITVKwd6m6gcj2BSnOLQp+hndn/hrU+ngzsKtt3eup
	mRy3fZnB20pHjlq5mf6Vvn+XeePj+rmyYb4AT8UTQX66JUunTm5JtP+P31CNEbuXiOw6vfkK1Pm
	ZdWGsSZeCgv+I82PLjV4K8BatCNFeE2PyItg8ppC4E7EMBFxzu0Kyg8ktcFAzUyh9OU3HeQviiT
	6OvFSLuIGFJshEqlSpUu6E7spRWZLPuDkQgimjI883drg2k77QBy+Mtx7yQ9bIiCY1Z03hQjGX5
	7tHeSrB/xfxKe+
X-Google-Smtp-Source: AGHT+IHtM1SxLEkFhVT9nTec7uRceWtW+rhXnviNdI0yQH+1wlWpiRwFe22yoCEWsvS3nGfHGGcy3w==
X-Received: by 2002:a05:622a:1a21:b0:4e8:ac66:ee44 with SMTP id d75a77b69052e-4e8ac66f4a4mr130236241cf.39.1761015580831;
        Mon, 20 Oct 2025 19:59:40 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::ba76])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8ab10bfeasm65295951cf.37.2025.10.20.19.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 19:59:40 -0700 (PDT)
Date: Mon, 20 Oct 2025 22:59:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Yi Cong <yicongsrfy@163.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, linux-usb@vger.kernel.org, michal.pecio@gmail.com,
	netdev@vger.kernel.org, oliver@neukum.org, pabeni@redhat.com
Subject: Re: [PATCH net v5 2/3] net: usb: ax88179_178a: add USB device driver
 for config selection
Message-ID: <7353775a-bc2c-4c2d-93bc-b8d3e03c3496@rowland.harvard.edu>
References: <e4ce396c-0047-4bd1-a5d2-aee3b86315b1@rowland.harvard.edu>
 <20251021022925.2881236-1-yicongsrfy@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021022925.2881236-1-yicongsrfy@163.com>

On Tue, Oct 21, 2025 at 10:29:25AM +0800, Yi Cong wrote:
> On Mon, 20 Oct 2025 11:56:50 -0400, Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > Instead of all this preferred() stuff, why not have the ax88179 driver's
> > probe routine check for a different configuration with a vendor-specific
> > interface?  If that other config is present and the chip is the right
> > type then you can call usb_driver_set_configuration() -- this is exactly
> > what it's meant for.
> 
> I tried calling usb_driver_set_configuration inside driver's probe()
> to select the configuration, but my USB network card has three
> configurations (bNumConfigurations=3), which causes usb_driver_set_configuration
> to be called twice within probe():
> ```
> static int ax88179_probe()
> {
>         if (bConfigurationValue != I_WANT) {
>                 usb_driver_set_configuration(udev, I_WANT)
>                 return -ENODEV;
>         }
>         //else really probe
> }
> ```

Why is it called twice?  The first time probe() runs, it calls 
usb_driver_set_configuration() with the config that you want.  Then the 
second time probe() runs, the config you want has been installed, so 
there's no reason to call usb_driver_set_configuration() again.

Unless something is going wrong, that's how it should work.  And the 
total number of configurations should not matter.

> Although the final result is correct, this approach seems flawed.

This kind of approach is currently being used by usb_modeswitch for a 
bunch of devices.  The only difference being that the choice of which 
config to use is made in userspace, not by a kernel driver.

> This issue does not occur when using choose_configuration.

True, but the discussion in this thread seems to indicate that telling 
choose_configuration what to do for some of these network devices would 
be extremely awkward.

Alan Stern

