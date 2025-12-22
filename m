Return-Path: <linux-usb+bounces-31689-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF46CD7294
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 21:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44D51301EC41
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 20:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424B133A9C1;
	Mon, 22 Dec 2025 20:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="RzA0qr5Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AB6274B3A
	for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 20:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766437065; cv=none; b=Vtfsc9vVybgSlLFQ0a36+THtsxofQG6NUwT61MUZgQWOFH9dp/pJj/NoNIUUWlgbbGmlahMbnnQ73rTIo1y2UgJtFrA8n5Z2NO13KVUiIKXUrqaBMk1P2p9ARGY4uzWJyjmmf7R9NqmUk1mJxipUlKVX24LArTG5vR/k+z3oyic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766437065; c=relaxed/simple;
	bh=9VmuG1pBESbM2uezXVsEaVteaKrcS5CY62HA/zdzkWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iggArSIup3Xhl7uUEkP1XAdp/kpDX3vc1a5ZhWLiSbgV8D3IDMSQ80Hm6XXJg8Juqzjl9X1/gU+kduT7mOicNxn/9nrHLNRI+bn2EvP0Cz2G6Ieb7sOHbrD3H6A/OM1ryTCOZhaii3CyjRG6kjTxXu5I7S5RgYh/v0nrDlEduB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=RzA0qr5Q; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8ba0d6c68a8so477271985a.1
        for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 12:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1766437062; x=1767041862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mTOX1r6jE/U/Bu3sSUjaEK7G4TN+QZFh9KW0y2P99H4=;
        b=RzA0qr5Qqx05/dFLhbjB8RvLAbYnRsgQIsUoUSU6iWjbC6YqgUm/EA+2Rkrh28VfAj
         pVJaxy3+rvxab5KeLLazixk7zGKncxBMq4SUyGc+1Gvob7/RIpc0+0yH7gNs0MNLai/D
         ik7nHwwu1HfB+e1EyIu9DusIw41TlntAiYvP6rbAW0w6UxGAGbIT7kmCadiDBCqtE1Vi
         0AInpqDl1mAnGjUsLeVWxGsj3sJGEaFDX1Vt2tv58msl5HwmTHoNLwMj56n1b4dFL8q1
         un+lPGrp5kTFdJbJ8IVhZaS9WUTNRubXU+nMXF8EXL0qF4ENDLqhlgC+JtnBW4HSmiD2
         W4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766437062; x=1767041862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTOX1r6jE/U/Bu3sSUjaEK7G4TN+QZFh9KW0y2P99H4=;
        b=OkpDjCmvPvOavzS6C4FTMM8B5EXrAEGHm0MMBhbnT1Eb8+QjJ3lHH/7kM1LGUzEiK9
         jU3VhdtN1ri7TxS3/3l7oKf85GeEsC/MNsBWEFthZTARl8FxyCJ4xD5uKpq27oYfn9td
         2yOBSVe1B/gGAw2taG3/XL3wsnMCuQdPqjfYgwNLCikHoeIcQDhSLBPrzvNNts1avF8h
         VwTEQiHOe1XMr2pOXCSQGVQYxZI7r7GC9H1vMyA3XjE62mMfBvnsC4uOVxM6WNPqcKHJ
         vWlBA3RTYxkIf4orbUfvBOVHMBL/nLJV70TkdWOM92hKOIEuE6/K9PMQfk1cjVS9qdDd
         6psQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBH0yyIvQYbE+vdHjQO9A34SiNezkqYfA6vf8DjJcs9+Br1XuzAQ7LxNaSXYUSuLhxOk/0nY5M2KU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqlurszWd5Blt7IiNJpPm1vqGFVWgSNAH7HuffD/bdAdqaaX2w
	KzDnMd/vfGzA9Z7AhWatGMutjToCunmpDvym8vrrVyNEYcYuw+RNTdrHol5d7307yg==
X-Gm-Gg: AY/fxX6/kEHIEaE88qrPNhcYwh1KR8oIKjxOx+q6urprVqIFFpckn00T9jwoKfHQFa2
	FU5IsLYdcpK0m0gTbk5VNfK2Hi8+VAoQ3JlZw0GUh8953o/tOXg+xLpkvuCaq4x3DLgTKHt4EWO
	KiiWA5StLQvPVMpbMRR0LqmFJIrqRBSnTOskS8FSpgBpjm+rR7Zk22u231Z0pUve/gmkikCKeYG
	YC793+cYuZ+XIksffURUFBoFav1tFiOBJBVgIJwhPv+5FSseh3p8UuwjbgD4WJIl3NB0dswbKxJ
	jXxD/gPiJyGDqxkkoBl4eCKK2xdIUwcp/Feb7lqchW8p2Q3PsrvuBt4XDzd9Um+ErL9EmR2y2py
	zcmgXS4ccXXep/OC/4knChlpWz2NGAOzFmA+sCLsegUypbmKaJwbljiXb2/uZqC7rVLc8zL/ewC
	x2Tip099NuJqwzhlaAtc2b31g=
X-Google-Smtp-Source: AGHT+IFb72TEMswdY+kU3MzyuaZIYLdTZutFpN7UdaKo+0gV4/ks7udthRTlxB2p9xnMe+SxpcJRPA==
X-Received: by 2002:a05:620a:2956:b0:8b2:2800:d646 with SMTP id af79cd13be357-8c08fbdb6e8mr1865848085a.88.1766437061792;
        Mon, 22 Dec 2025 12:57:41 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7e72])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0970f5fa6sm918296385a.28.2025.12.22.12.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:57:41 -0800 (PST)
Date: Mon, 22 Dec 2025 15:57:39 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Brian Norris <briannorris@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v1 02/23] USB: core: Discard pm_runtime_put() return value
Message-ID: <a93123ab-8ad3-4af0-af74-15e789e545c9@rowland.harvard.edu>
References: <6245770.lOV4Wx5bFT@rafael.j.wysocki>
 <5058509.GXAFRqVoOG@rafael.j.wysocki>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5058509.GXAFRqVoOG@rafael.j.wysocki>

On Mon, Dec 22, 2025 at 08:52:33PM +0100, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> To allow the return type of pm_runtime_put() to be changed to void in the
> future, modify usb_autopm_put_interface_async() to discard the return
> value of pm_runtime_put().
> 
> That value is merely used in a debug comment printed by the function in
> question and it is not a particularly useful piece of information
> because pm_runtime_put() does not guarantee that the device will be
> suspended even if it successfully queues up a work item to check
> whether or not the device can be suspended.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> This patch is part of a series, but it doesn't depend on anything else
> in that series.  The last patch in the series depends on it.
> 
> It can be applied by itself and if you decide to do so, please let me
> know.
> 
> Otherwise, an ACK or equivalent will be appreciated, but also the lack
> of specific criticism will be eventually regarded as consent.
> 
> ---
>  drivers/usb/core/driver.c |    8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -1810,13 +1810,11 @@ EXPORT_SYMBOL_GPL(usb_autopm_put_interfa
>  void usb_autopm_put_interface_async(struct usb_interface *intf)
>  {
>  	struct usb_device	*udev = interface_to_usbdev(intf);
> -	int			status;
>  
>  	usb_mark_last_busy(udev);
> -	status = pm_runtime_put(&intf->dev);
> -	dev_vdbg(&intf->dev, "%s: cnt %d -> %d\n",
> -			__func__, atomic_read(&intf->dev.power.usage_count),
> -			status);
> +	pm_runtime_put(&intf->dev);
> +	dev_vdbg(&intf->dev, "%s: cnt %d\n",
> +			__func__, atomic_read(&intf->dev.power.usage_count));
>  }
>  EXPORT_SYMBOL_GPL(usb_autopm_put_interface_async);
>  
> 
> 
> 

