Return-Path: <linux-usb+bounces-30162-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 780F8C3BFAC
	for <lists+linux-usb@lfdr.de>; Thu, 06 Nov 2025 16:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66F493B5D1E
	for <lists+linux-usb@lfdr.de>; Thu,  6 Nov 2025 15:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF5532D0D4;
	Thu,  6 Nov 2025 15:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Agpg/LTL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8376730C636
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 15:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762441607; cv=none; b=ces7sYGwikUW7WrZqWyEzY40Ru/+pyJhUDbxJohTE0TjB4Mbzn23rTFJT0RSveV3WQsVlFNPa2vKyDT4nRyCSLAUr42OYYRUDrP4LL3YW044UpO7cb/mMdeDrQUrcwwTaZTwYbcl0TrcawtERAtt5gVwPgbI1Q8ZLqqIJjPfgcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762441607; c=relaxed/simple;
	bh=epKk9hIgRG8WUpPbR0hGKihJpPTkNb6k5T028RwwyQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXfhCiLOL6IyWGOutTdHnJnSH9+ztvx9tohMUqmYwDMDn1qeDaOAl7U2H5zlCw6CsXbmONcdxMUWg3GP83838m/eGA1JaoA3Zf/rvG+1PLemfz8zqCGbumBtkwMSWAWXrEznu6rOL7Tx6m+vNDKQ0mj0A3koNQ6bN5496E/9f+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Agpg/LTL; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8804a4235edso11769326d6.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 07:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762441604; x=1763046404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ORQfgg+cW8yABsGzp725YgIcKrepRBh9vz20FOvD0Q=;
        b=Agpg/LTLMocuOYqXKgdFucVH55v0Zye8S99GGENTQjU2aDAnz/D2OBiROvs6hwe5Gv
         NBisqnShY4NHO2TtjskhzciKnQea1MXGxzeThswIWVPeHuuWG53/MI112uujeTODw0Xt
         r70L0MF0RcnpaSnow5VH+CNMpZOXrVMDoETNOPnQX78bOu+se58uAP84+eRAbeaUv/2v
         CB+m0l0Kv6DcdVkQoRkBhk+mSSVrd1/0cdy477ImcNDDQqAzmlIgRc7sBJTtgG73jS+M
         tZboYlYcSLi9OJb0UxJ77tr7dvqyJK9lK2QBK5Uv/LtPGa5Y4zzXlEUpHTAJp1ZkcKUF
         HCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762441604; x=1763046404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ORQfgg+cW8yABsGzp725YgIcKrepRBh9vz20FOvD0Q=;
        b=n5kGhvtQNy6p3b60jY37+grdRmtCJXrrMBZLWQcvrv9xI+sjinVovSBuJEA09Y04WC
         SqTxlbevma0ZmwIZJZh2SLGVJnK3wGR3/+rah3WVtvEcbYHc9qen4v1To56omUQq9oue
         Rc60hJtFJNh4OyTwWXoju7/KnS8IReAmtvd6+br9o6DF2ZAas8AuirucTjudruh+giyc
         GaMJ1n6cmQWMkehyEIsqfrJoEFAbaZCzU/uLBZJcBSyJzKjN0RBcX6zuCe/Dq+5mO1hQ
         o2m2K1992UXviGKV+3XQZuapCEWv2vRn2EUFi+Y6DFELZQTlFySVxdbUzZ2/a+qKiPcp
         UIFA==
X-Forwarded-Encrypted: i=1; AJvYcCXnPaOydvA6SlKy0qhj58bu0SzpPGFrs1nqm1M/KVkBJx34D1myYJGeV57lKKgo2MOkbsK7aEd62mU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLbXZu1DDSBeJnoqeJfaIys1YzE7dU1TYeRzeh9YWVxN8NKIPx
	SPNt4kneciYZCw5z7xoWF8RnCirjPspIyN5RWyvJI5qy8GjyDWVm6gY023PM24BahOucfEg1lEW
	1IpprRw==
X-Gm-Gg: ASbGnctBPqxJM7hW9oN9jSyudCNaioI1CiwaLgWwcGt0FbFySYHYJ9wNKuGe4DZdSav
	SUO9Fj5bDrh3zLKLfu+/+sEbFhdHua+sI9lbtK1JbAIiRV6JIV0w/TekzKECyFxUflYtNGbFjIy
	Bd3wlAUJjhwgyPk5lcahak/SOHApMW/ZknlIJJnwlRc6CRkuvtJJ9CWPWvKjP12LclmL/2MaKVe
	HRNPIIvtP3eMG+QLY+ZeyDF6/hlRjW8+4s7L10qMZgMQN6LikaINWYfcPp3MyNnxqMl+3K/vJo1
	cCiU4mHzG2S5r+nk5IizDglXNddZVjoiEXlLKmjBSxD8bHYmjo1/YoE0mAEQqp+vl+KUBtUNYg6
	8TN6lWDCeRJhiwXO4tPdHaS6S+dEwWJXRAdfwiFwwQModx/er2hrLXFunCv/oRMSrNKuIBhPCYz
	s/mF3NWuU+VbKZkfw0OSL5hkYUuHH/Bw==
X-Google-Smtp-Source: AGHT+IFBo9a2vdeNFG6Kk55s6sYJCGm3S9KmBS7l6cyJk9i0cDOjX+l19Ru5Cp7b3iLIEfRbNdXt7g==
X-Received: by 2002:a05:6214:2583:b0:880:5813:1551 with SMTP id 6a1803df08f44-880711a9127mr101182466d6.30.1762441604295;
        Thu, 06 Nov 2025 07:06:44 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88082a08a29sm20453586d6.49.2025.11.06.07.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 07:06:43 -0800 (PST)
Date: Thu, 6 Nov 2025 10:06:40 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: gregkh@linuxfoundation.org, p.zabel@pengutronix.de,
	yoshihiro.shimoda.uh@renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	kuninori.morimoto.gx@renesas.com, geert+renesas@glider.be,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 1/4] usb: host: Do not check priv->clks[clk]
Message-ID: <aa3eebb4-c2d9-46f5-a8e3-44f17d2ab32a@rowland.harvard.edu>
References: <20251106143625.3050119-1-claudiu.beznea.uj@bp.renesas.com>
 <20251106143625.3050119-2-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106143625.3050119-2-claudiu.beznea.uj@bp.renesas.com>

On Thu, Nov 06, 2025 at 04:36:22PM +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> There is no need to check the entries in priv->clks[] array before passing
> it to clk_disable_unprepare() as the clk_disable_unprepare() already
> check if it receives a NULL or error pointer as argument. Remove this
> check. This makes the code simpler.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ehci-platform.c | 3 +--
>  drivers/usb/host/ohci-platform.c | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
> index bcd1c9073515..57d5a7ddac5f 100644
> --- a/drivers/usb/host/ehci-platform.c
> +++ b/drivers/usb/host/ehci-platform.c
> @@ -112,8 +112,7 @@ static void ehci_platform_power_off(struct platform_device *dev)
>  	int clk;
>  
>  	for (clk = EHCI_MAX_CLKS - 1; clk >= 0; clk--)
> -		if (priv->clks[clk])
> -			clk_disable_unprepare(priv->clks[clk]);
> +		clk_disable_unprepare(priv->clks[clk]);
>  }
>  
>  static struct hc_driver __read_mostly ehci_platform_hc_driver;
> diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
> index f47ae12cde6a..af26f1449bc2 100644
> --- a/drivers/usb/host/ohci-platform.c
> +++ b/drivers/usb/host/ohci-platform.c
> @@ -69,8 +69,7 @@ static void ohci_platform_power_off(struct platform_device *dev)
>  	int clk;
>  
>  	for (clk = OHCI_MAX_CLKS - 1; clk >= 0; clk--)
> -		if (priv->clks[clk])
> -			clk_disable_unprepare(priv->clks[clk]);
> +		clk_disable_unprepare(priv->clks[clk]);
>  }
>  
>  static struct hc_driver __read_mostly ohci_platform_hc_driver;
> -- 
> 2.43.0
> 

