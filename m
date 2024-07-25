Return-Path: <linux-usb+bounces-12403-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2516D93BA7E
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 04:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55B2D1C2212E
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 02:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC19C101F2;
	Thu, 25 Jul 2024 02:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QtNUNsik"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3130F4C84
	for <linux-usb@vger.kernel.org>; Thu, 25 Jul 2024 02:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721873220; cv=none; b=V6f2PB9JzIG9aPmuEaXnFbH0ZnRXJdaziNmJHheUT91jRTj9Nuk0NccyJyrvidRPytQvM352LG+0g544C/dltCsqsoXvzgq0F9FkENM64KG/NvM71bLx0CzOsi1pfBTrTHqsl0Dmvbf/Isxulxa9ZJucP2M7AHXLRtk9Wmtkk2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721873220; c=relaxed/simple;
	bh=Db6kpzo3jKGxL7dNFcPTi+CiPNq/rVtActj14WbEm+8=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kTygqO7kVvxlGw+udg9RlKyk8RD7My805HZKSs8zu9qmnHAA6K+Eq9pYArFZCL46edB7D86uua3WpAUKtEMqH6fAHg8HHrIQCJWqSszMyPgcqa620d1q+b8TItG0o1XddogfxQ6hkQMyz8Mww+TqKq++rtLkAgXFNlqZn2iufyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QtNUNsik; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721873216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2rlgUlDua/O+ety/21gP62L5Nvewpmt12UqPQy8772E=;
	b=QtNUNsikaHCTXN3NeGubAOryTOrh+5PhP324oQdRQ7JgsMcOrdcZ4HfuTUiHsigmVLYbOj
	4VFF9dzom0aH7TMxxblUMEuB75tVHMXwLi4VhLCBXmHT4h373rU4ZshdruFGQI+W1ogYHk
	3bskyq/iYdaNgf+ZludvqZ6zh5RI6Ds=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-HCuj8PUUP-K_XkcV1alAxA-1; Wed, 24 Jul 2024 22:06:55 -0400
X-MC-Unique: HCuj8PUUP-K_XkcV1alAxA-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-70d1d51f3e9so492360b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 24 Jul 2024 19:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721873214; x=1722478014;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2rlgUlDua/O+ety/21gP62L5Nvewpmt12UqPQy8772E=;
        b=w+MUPHOXeHezhuW+Cf1GOOdLnlFz+Hmi/O2IVHmqZ1BEmGrhoQ/GeAiuwIDkpF76az
         Q6s2d0lByn8HYFrH/acEqpnIFYFflRrZu5/C9iTmOkmt/6gx49ptLLNhPMNnM5K5RLXt
         dJfq/0L2S2EqRN7hIhTXafl43hkPDCwriBbFDsQMnvs/2oZ7FAdC2SSOKEE7cbAiwwOy
         vbc9bLdXaiOa0huQ9Rt58o4e5r+zmOiT0m+AJ8o4/ggoWDCUlcKslOn6mhIDhQp9yaGD
         +vm+ViU1gDWg7aKYdfZtHyYbfO+VQclwkYrXdVKj2JzTqijB0pgAMAv4TbsL9dmIkXc1
         My8A==
X-Forwarded-Encrypted: i=1; AJvYcCXogTADXb1VEIFU62yk98xyoRqIdcewqz8q1/SoCf3cCNVQadj64NS+SoGTQMo9WVm9VV6fp70CgkUUPR/5Q49KBCsHeNXspuRV
X-Gm-Message-State: AOJu0Yz7RtyXXzlLaIoNgHniWMRpYpJamVWtnpxbpOIRvI5ueeJ1D4OD
	HX+ksyfGO1DbgC3kt2Cdpv4MjGtI3M9srhjbYpuRZIX7DyBaMILDAxmDoBEU5UNq6LC/TWmLA4j
	Jh6gVPgYK1WUsxAzcYa5FL/T64Bm8IFVPwe1Bs0sl4Ir8m022h3zKNLakZw==
X-Received: by 2002:a05:6a21:2d08:b0:1c2:8dcf:1b8f with SMTP id adf61e73a8af0-1c47b16661emr506450637.7.1721873214016;
        Wed, 24 Jul 2024 19:06:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWLTm16bZczseIwXMZV+RuHzz6bcDYzoG0FMdSUCRVemQzOS28kZBHifAqAhwB2BW5o+AMjg==
X-Received: by 2002:a05:6a21:2d08:b0:1c2:8dcf:1b8f with SMTP id adf61e73a8af0-1c47b16661emr506425637.7.1721873213616;
        Wed, 24 Jul 2024 19:06:53 -0700 (PDT)
Received: from localhost ([126.143.164.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28de8f74sm324040a91.43.2024.07.24.19.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 19:06:53 -0700 (PDT)
Date: Thu, 25 Jul 2024 11:06:47 +0900 (JST)
Message-Id: <20240725.110647.2047059058833597230.syoshida@redhat.com>
To: make24@iscas.ac.cn
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, liujunliang_ljl@163.com, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB2NET: SR9700: fix uninitialized variable use in
 sr_mdio_read
From: Shigeru Yoshida <syoshida@redhat.com>
In-Reply-To: <20240723140434.1330255-1-make24@iscas.ac.cn>
References: <20240723140434.1330255-1-make24@iscas.ac.cn>
X-Mailer: Mew version 6.9 on Emacs 29.4
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 23 Jul 2024 22:04:34 +0800, Ma Ke wrote:
> It could lead to error happen because the variable res is not updated if
> the call to sr_share_read_word returns an error. In this particular case
> error code was returned and res stayed uninitialized.
> 
> This can be avoided by checking the return value of sr_share_read_word
> and propagating the error if the read operation failed.
> 
> Fixes: c9b37458e956 ("USB2NET : SR9700 : One chip USB 1.1 USB2NET SR9700Device Driver Support")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/net/usb/sr9700.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/usb/sr9700.c b/drivers/net/usb/sr9700.c
> index 0a662e42ed96..d5bc596f4521 100644
> --- a/drivers/net/usb/sr9700.c
> +++ b/drivers/net/usb/sr9700.c
> @@ -179,6 +179,7 @@ static int sr_mdio_read(struct net_device *netdev, int phy_id, int loc)
>  	struct usbnet *dev = netdev_priv(netdev);
>  	__le16 res;
>  	int rc = 0;
> +	int err;
>  
>  	if (phy_id) {
>  		netdev_dbg(netdev, "Only internal phy supported\n");
> @@ -193,7 +194,10 @@ static int sr_mdio_read(struct net_device *netdev, int phy_id, int loc)
>  		if (value & NSR_LINKST)
>  			rc = 1;
>  	}
> -	sr_share_read_word(dev, 1, loc, &res);
> +	err = sr_share_read_word(dev, 1, loc, &res);
> +	if (err < 0)
> +		return err;
> +

The patch looks good to me.  But I think the following sr_read_reg()
has the same uninit-value access issue.  If sr_read_reg() returns an
error, value may be uninitialized:

static int sr_mdio_read(struct net_device *netdev, int phy_id, int loc)
{
[...]
	/* Access NSR_LINKST bit for link status instead of MII_BMSR */
	if (loc == MII_BMSR) {
		u8 value;

		sr_read_reg(dev, SR_NSR, &value);
		if (value & NSR_LINKST)
			rc = 1;
	}

Why don't we fix it together?

Thanks,
Shigeru

>  	if (rc == 1)
>  		res = le16_to_cpu(res) | BMSR_LSTATUS;
>  	else
> -- 
> 2.25.1
> 
> 


