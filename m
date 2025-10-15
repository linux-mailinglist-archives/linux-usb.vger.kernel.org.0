Return-Path: <linux-usb+bounces-29333-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AE0BDEFEA
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 16:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AFCE5501B25
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 14:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CACA9262FEB;
	Wed, 15 Oct 2025 14:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="b4guQ+FF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CCC24DD11
	for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 14:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760538105; cv=none; b=U7fRwNi/B+uWthpbFnN3ZvERyytD4LdA/77JKN88K3lMq0lAU7x+kP9ygCMAJo7m6VQqlRkAqbuMtsh0IEo387uHvUYzgypzLCBzELjdWZU1Sfeyy/lImMqpbeuXZ/4MoHj+TePlspHFqlyuixXWzrIN0FFvUwKMi44GAJW1rpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760538105; c=relaxed/simple;
	bh=rsCxuIGa07OzPA91/mcN7Lbx5abo0noYtZAvC10T47M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efTy5wJOUHU2gsL+hBoECgw6h2DjbcFNKB8eer73pFK4LzBVAagNMzTMee7eLIZqKEZz7Kxg3p/XK7A5vWtd2LHlj1ksRWSdyEdD2p1zoBZH4vSAiQmhh+f5q/vQ4TxzTPXFb5lEcot+QFOKxHLRIq9m9q5l989XHLg6BZ2W+e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=b4guQ+FF; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-79ad9aa2d95so114045176d6.1
        for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 07:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1760538103; x=1761142903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lo2y1Bu1LMnaNfCd71h+uw7Uf0QO/1obDl+YiKgx8yY=;
        b=b4guQ+FF0YzwKkzkjKzTwK10u8GI1l7bBbULvzKH893ArD9KfUKpgkmhQBt4EP1GgQ
         j6V7dh7pk16oO1CQSVAfq3kpCC9za1dm1f0DwlHLzlNUNWwfYS32dkSG65ycwuAhNZaO
         WypdZI1pqeOhlU1U6agqODjBleBzHeBbMQM/nffzy1F1hbJqmWS27LZM9gUDkUoDZyyh
         aCskAxChCIFNIb/H/u5g4QG4/l6yCyROQ/vEDmd7iH21O4tAe3dfpBaN6Q5MQPlNS0fe
         +twLch6dzUNmytBIXGfswe4PWGLdtucAOhiKCtPKZzFiQLH8BcBWI/SlZAo+riCjOSgV
         GSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760538103; x=1761142903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lo2y1Bu1LMnaNfCd71h+uw7Uf0QO/1obDl+YiKgx8yY=;
        b=R07srsTTU4M0Zj/w/KN4hL/EZ+LWGaymMqj+EgOzc09s2ZQmil0dwv5QbqDSWoxYgl
         H1zyiQ/rlxSjcmBLegcQorjfcauXwYIchTa58VuW/lfHbNddp6pjlPjW3oIr0pIf3ZzG
         3zLayIaQ82owow6VHxASij9Nvm6T9Yjsd0MXRT2O542sO8kpjkaawnBk7RT/7R/4sq6J
         R31bpTheGdhNFShdxO1GHR+zSyMl7Vx38RBAeZpbkAAskGbwJC+iubEYXil/ttU/w62U
         jPOBvi4CyUTmQgSuuIhaBXNxXBXoTlU9pUijwvOuHjsiJMjYzeHoEThD7iJGHl8Z3Jbg
         9Zag==
X-Forwarded-Encrypted: i=1; AJvYcCX9ce5OBlEQELvBPbTOAe49JwO5XChKTMpq8b+gRi1Gxanj/kzTsYNJLgUcksjt+izg4tV7hRldngQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPf7CF68jNdcs5bKoWqvVNsz2hZM854BdTrmjskRoT+juO59+V
	8HMBCWnzc/F0/2mCUAI0QMDJ8bkNRnJ6LP6s3T4TWNwK/9+fHM1sEMx8jxhiF831vfMmQQpZA0N
	I/Ds=
X-Gm-Gg: ASbGncub0qJqzaJEILjKg7fGw/SQZW2TXWZBPWszlPhazRSa7XRnvotHL/E8WckJEDu
	PQKvyWLk6elf1NiYLhp618hAcIWn/HyrL8celU2qCiCsUSSpM+isms8XI++We9zrfjvaPtPbT5F
	VeViSP9c5Z+3qTwFPWE7rHOdtIulCeMZ8gmXl8pxJRfclRvIiXKGbLQp3sIUujFJQ9i9mTMYmj7
	018ADZyCpolvDTs83AIUealNPSx1zI6NsZ+be6Zq/G6fMPdXOh6vvpOtl8PZh8rnd9GdfMboqbj
	x21ZqcIR6b6iVaucwoHX7HB2zqFnLPrvHVO2l9OCM+TOtYt7T7RHBaw8kJ84IHbLLGjual9pwyX
	doo6Yfb7wXWwhA1KHSGHYV3ZHNbxwV35cGtfqKjVlWwtKKiE9Ci8jxpyuZDTaJif1FUEVDm+tUJ
	YLwg==
X-Google-Smtp-Source: AGHT+IFrJLeVOnPgxh66ucu/t9d4mmQTNB8Y0LxSmbCqtxoIGawoP6sDh9GYHFFnOFjMyeDPg8oqtw==
X-Received: by 2002:a05:622a:1a9d:b0:4b7:a8ce:a3fc with SMTP id d75a77b69052e-4e6ead65069mr381373611cf.66.1760538102557;
        Wed, 15 Oct 2025 07:21:42 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e881c577e6sm19687141cf.7.2025.10.15.07.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 07:21:41 -0700 (PDT)
Date: Wed, 15 Oct 2025 10:21:39 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tim Guttzeit <t.guttzeit@tuxedocomputers.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb/core/quirks: Add Huawei ME906S to wakeup quirk.
Message-ID: <8ef4550b-a958-4fa4-88df-89b3d4b1117d@rowland.harvard.edu>
References: <20251014153049.91722-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014153049.91722-1-wse@tuxedocomputers.com>

On Tue, Oct 14, 2025 at 05:30:05PM +0200, Werner Sembach wrote:
> From: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>
> 
> The list of Huawei LTE modules needing the quirk fixing spurious wakeups
> was missing the IDs of the Huawei ME906S module, therefore suspend did not
> work.
> 
> Signed-off-by: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>  drivers/usb/core/quirks.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index f5bc538753301..39fbbc31e9a41 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -469,6 +469,8 @@ static const struct usb_device_id usb_quirk_list[] = {
>  			USB_QUIRK_DISCONNECT_SUSPEND },
>  	{ USB_DEVICE(0x12d1, 0x15c3), .driver_info =
>  			USB_QUIRK_DISCONNECT_SUSPEND },
> +	{ USB_DEVICE(0x12d1, 0x15c1), .driver_info =
> +			USB_QUIRK_DISCONNECT_SUSPEND },

Please pay attention to the comment at the start of the array's 
definition.  Entries should be sorted by vendor ID and product ID.

Alan Stern

