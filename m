Return-Path: <linux-usb+bounces-12405-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A429693BB08
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 05:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 599F71F213B7
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 03:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345EB12B72;
	Thu, 25 Jul 2024 03:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gWcHc9N7"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104EB1862C
	for <linux-usb@vger.kernel.org>; Thu, 25 Jul 2024 03:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721876476; cv=none; b=Xs5hpCEXndafRFNUXR5NLDV0Mn25/IDP0Axy/VbO08x2u9xZ267MmWjfzKegLw4ZE0swWmY8ANC+VzZ20Tb0JfI+XvQi8LQAaeYmQYVXT6N+qk/frn+c9fldAZtFeCuJ4GGm9pzVOLcVkcUkr1bTr8tbnJ8LrC5b3u5pnPQOr8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721876476; c=relaxed/simple;
	bh=VF+PXS0cN4+7WGdSUdvB33v2NKJjsMSSiNKGb+niVEI=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kzRn35d8CrRAehbp83bJGZfuTcfLPvf+WjfVeKT9Hz5VfhgPESncGWYUOSRVWO21HA2zowSuKsWOSw+8yFiIsdjIEGsx8GIC7+J1y0IgNSvy7+eRU0CsnG/3dGkK7AxIBavY+/0m+8Voz61PtQCI5J8nJgnjmSaGU82uNH0xLZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gWcHc9N7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721876474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WR4C1klarxsCcuevMDPpmoXX3IapIZL76EvSWY9IHig=;
	b=gWcHc9N7ot/LbSmpNNCtQtDQU1s//D4lllZXQwgFen7IZUmcjA0nEseUX3R71zuwQaHThG
	bTsVG6w+I/WmdjBBWAMDRf6mYRD7ykOXYH+d9lMUkDaA8RYsCEZdCEs7TDAtdzmVk2hh5P
	r6gKnbzudMD8mx2pjOevKWcqs8mLVEU=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-va4gUHhiN8K8GHoWBBTQVA-1; Wed, 24 Jul 2024 23:01:07 -0400
X-MC-Unique: va4gUHhiN8K8GHoWBBTQVA-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1fc6ac9a4aaso4368485ad.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Jul 2024 20:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721876466; x=1722481266;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WR4C1klarxsCcuevMDPpmoXX3IapIZL76EvSWY9IHig=;
        b=LGpMKxwp8w07GGAcImX2nFyVC7oWSwrZ2Ia4ecOfK+ei+38U1Ne4fjRQmG1Tf0SL+i
         kmgx1++sOOX8ViWT9Y/aDNwh34WTPl7ZaTj4lP3KBAdgysjPj/tfVAHTrurYQEjIRY6f
         oxzXB1Rv0eFsBYBP1fFiJoaDjJkGaBOzWBInsUaNH8Qewa8Uk2PaR0aFYCX14lT+Q1ew
         YeQkBXpwoYqxkc1Y0LJtM43qeI5Zkv7uzgFWgKOAHrrE32zvxCXu+kjjJCzDmT6ZuDOx
         oYRksV7hhs2dZbSubh8flGiwZvYgeuFxjQ86fwgguvv91/GJ4kWKrX2TYce9w4eOm9ZK
         cEJA==
X-Forwarded-Encrypted: i=1; AJvYcCVKYjJNPkj6qPak6l/bDy8hgd3N9vofECyObQlfRg4jpxHU6uLpW4r+3PASCZMY5LGh8gzBtpJXSAUz3wWqEO/OhoMEuJ+9LFZ7
X-Gm-Message-State: AOJu0YzdULDWyoj6uuLzbihpQY9vIZXMliCIzf1YUYQBdDTGRc3swMpx
	EUXSyjVxAmMU/O0z+raTlcn6LA+gYFtRS8Qg5f5v7xAQ/aPMRLAh6Ga1wfoIwiTpRuNgCO75zhN
	1d4GMym0pAIWwnHKLFlWnbSdU2gWBYPSFIbRjtp/z6qP5kRNWv75qA5pqUA==
X-Received: by 2002:a17:902:ea02:b0:1fb:4fa4:d24 with SMTP id d9443c01a7336-1fed3aed403mr18867325ad.50.1721876466421;
        Wed, 24 Jul 2024 20:01:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdSwWHgKDpLoPuClxTWTLGgSR81gaWdx9VM+Y30/dTNbwfcdNrSvXE5T5oFpUbysdfWQq5Iw==
X-Received: by 2002:a17:902:ea02:b0:1fb:4fa4:d24 with SMTP id d9443c01a7336-1fed3aed403mr18867035ad.50.1721876466045;
        Wed, 24 Jul 2024 20:01:06 -0700 (PDT)
Received: from localhost ([126.143.164.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fb1accsm2912335ad.261.2024.07.24.20.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 20:01:05 -0700 (PDT)
Date: Thu, 25 Jul 2024 12:01:00 +0900 (JST)
Message-Id: <20240725.120100.2041590414991833213.syoshida@redhat.com>
To: make24@iscas.ac.cn
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, liujunliang_ljl@163.com, andrew@lunn.ch,
 horms@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v4] net: usb: sr9700: fix uninitialized variable
 use in sr_mdio_read
From: Shigeru Yoshida <syoshida@redhat.com>
In-Reply-To: <20240725022942.1720199-1-make24@iscas.ac.cn>
References: <20240725022942.1720199-1-make24@iscas.ac.cn>
X-Mailer: Mew version 6.9 on Emacs 29.4
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 25 Jul 2024 10:29:42 +0800, Ma Ke wrote:
> It could lead to error happen because the variable res is not updated if
> the call to sr_share_read_word returns an error. In this particular case
> error code was returned and res stayed uninitialized. Same issue also
> applies to sr_read_reg.
> 
> This can be avoided by checking the return value of sr_share_read_word
> and sr_read_reg, and propagating the error if the read operation failed.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: c9b37458e956 ("USB2NET : SR9700 : One chip USB 1.1 USB2NET SR9700Device Driver Support")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>

I did a quick check for sr9700.c and there seems to be other
suspicious usage of sr_read_reg().  But, for sr_mdio_read(), I think
the patch is sufficient.

Reviewed-by: Shigeru Yoshida <syoshida@redhat.com>

> ---
> Changes in v4:
> - added a check for sr_read_reg() as suggestions.
> Changes in v3:
> - added Cc stable line as suggestions.
> Changes in v2:
> - modified the subject as suggestions.
> ---
>  drivers/net/usb/sr9700.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/usb/sr9700.c b/drivers/net/usb/sr9700.c
> index 0a662e42ed96..cb7d2f798fb4 100644
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
> @@ -189,11 +190,17 @@ static int sr_mdio_read(struct net_device *netdev, int phy_id, int loc)
>  	if (loc == MII_BMSR) {
>  		u8 value;
>  
> -		sr_read_reg(dev, SR_NSR, &value);
> +		err = sr_read_reg(dev, SR_NSR, &value);
> +		if (err < 0)
> +			return err;
> +
>  		if (value & NSR_LINKST)
>  			rc = 1;
>  	}
> -	sr_share_read_word(dev, 1, loc, &res);
> +	err = sr_share_read_word(dev, 1, loc, &res);
> +	if (err < 0)
> +		return err;
> +
>  	if (rc == 1)
>  		res = le16_to_cpu(res) | BMSR_LSTATUS;
>  	else
> -- 
> 2.25.1
> 


