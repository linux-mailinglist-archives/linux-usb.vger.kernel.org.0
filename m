Return-Path: <linux-usb+bounces-26764-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85937B22A30
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 16:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 393D91C24EB3
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 14:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828CA288CA4;
	Tue, 12 Aug 2025 13:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="L95HYkjK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4FC288534
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 13:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755007098; cv=none; b=bNAYxWK9V+zlQf3WG8hCqDWsRGhxI0QVDRo6wIZbiSTkqTVbuBjzSq2fhxvbVLVjpUUjoCiWxYWT5rzJvm2ezMB59BIlcKfaKf+60Se/MHa2TwKAcg2sWY8vJ2ItsaxpDLKX1MemXM4mZZd9gNi4uWP8rGpooqPHYmyrZH36Kio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755007098; c=relaxed/simple;
	bh=Na4iWeDCQRPl9LzD4kCPaWWUwwrlVecEdQojPjHnMyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6aJS/V14xjP/navxPNUSgL7RXBUj/mDAqPtVWN1kRBwVH+R3Dn99ZwGGDhY++cuoKFgRcb4SYqQUtVKtSpmDmxxZrw6HJcM0gYzeFECQKgNE+M2N5SKN/mw8YEhGLM3M2nVyzOyETOIGgTwTuNmm9ogudAakPuJenyiumFyNog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=L95HYkjK; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-70884da4b55so57050136d6.3
        for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 06:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1755007095; x=1755611895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R+Gsjl2VYe9a0zVK7a5HKD7uo1nfdcvcaSbmFWpIqX4=;
        b=L95HYkjKFJhcQ19zWo/Bo5gM1QMTZpMaub1YTePzo2aeexE/gwoWZA+hW5sJQEomxj
         JAY1jY/3We4JlTHvymApAeTafwvlPMlz8Syzoa4RJhuXby8zbX6OIyD/tGkJJ5bgBEVm
         qz4Y5pFHVGbvdFdQN8Xw3/SsuoedO1DbmsEhbIwc3k4dxZB5AtiwIQPiur+u8bQWgD/K
         3iwvf2R9Rk96wTOdAaNmBL1cTgag8jEOkccL0ioqX8ICtD7AqMgMb1LzEjpB4gXQ7L5l
         aSZjEfYllURhglHgQ/7UEwEgavr4vBsn++whgf6mVQ67LX03qn+16wEXc7uV+sN7c8V4
         lbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755007095; x=1755611895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+Gsjl2VYe9a0zVK7a5HKD7uo1nfdcvcaSbmFWpIqX4=;
        b=EaJO894zW+brRsxGEjP+j+SkJpayv/lYLWFVCIB5LOR3jBpmNlQBVZnK7nlLimV3Af
         jH1no1erdPCCInQHd4v41t59QrPg5CZRNSsC/GGXHsjgO1yfpn6uHQpQIoR+sKTiOzFQ
         UDdRkkczGtwC3UE0om3bihOQWDVzasqslHFXMjbO/rNLFwMpu862x3siGI2KCv6V39Rb
         kd13si57ktysYdAFryHq29bfDe7uHk6rLjfvIntF7WYjEywf2KAZlZCSNJxNbcBlzFgA
         3GN7BQWLi8hZOd+9J3rO134MhaXThuubHamQB5ymqiywDxHFbCU1hpfHHxpn+UqwYfoT
         3Xsw==
X-Gm-Message-State: AOJu0YxahK2vJ1sVtW5YFFnMCxyxS4Q/y1Kr8shoLv8fuiTiCMoLbocK
	vB3fecFimscp2TMyv5ybB1hFdsnwVRsONZE2E92FpvjYYyntsMx2GnOKq45HOpOfRA==
X-Gm-Gg: ASbGncsHsMivX3CZVvDYQIMnz+UOpCIVsWHW/EBKcajieYNQccgq9zKaVMxbSbpoFRP
	jPtUYOL+aQesr31YxCdisV3UGx+wBpgknSQh3hRRilwxrq78KRU+agMluDd5BAIf7O/sDFV/UPa
	Sgth6m/sSvC+nRfhphtbeP4SCugOwd9U9uQHYUoV+U2umNUggJaTxKSJuPwKsblwjlL5pBsgeZo
	B7VArtGB7wMR1pbUS5O4dhpXozQIaPaHLQqchj3ozhlEK2QASyhphWjtbCVGH6+eNEgfUQRAmQK
	4yRjw2nq02k4niMRPGzsuda4cTFU1ZquDHtzip8AZzCgTdHB3KuokAv44q/VuxYW4ocThv1g9nR
	CS4Oa+BtjSMmW2S9LfbCuFAg=
X-Google-Smtp-Source: AGHT+IFv/b+bBjwUWwpfHqE8nWYmGMNu3Uoq70IlfCB1ySgkD1HRampnC29eigYMvP3IiXKYK3WS2g==
X-Received: by 2002:a05:6214:258a:b0:709:deb2:3dc8 with SMTP id 6a1803df08f44-709deb24c7bmr23594506d6.17.1755007094470;
        Tue, 12 Aug 2025 06:58:14 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::e316])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077ca464acsm178138076d6.36.2025.08.12.06.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 06:58:13 -0700 (PDT)
Date: Tue, 12 Aug 2025 09:58:10 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com, Thinh.Nguyen@synopsys.com,
	Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v4 3/4] USB: Add a function to obtain USB version
 independent maximum bpi value
Message-ID: <f6b581a7-f373-4dd2-98f0-ce2520e39a89@rowland.harvard.edu>
References: <20250812132445.3185026-1-sakari.ailus@linux.intel.com>
 <20250812132445.3185026-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812132445.3185026-4-sakari.ailus@linux.intel.com>

On Tue, Aug 12, 2025 at 04:24:44PM +0300, Sakari Ailus wrote:
> From: "Rai, Amardeep" <amardeep.rai@intel.com>
> 
> Add usb_endpoint_max_isoc_bpi() to obtain maximum bytes per interval for
> isochronous endpoints in a USB version independent way.
> 
> Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Hans de Goede <hansg@kernel.org>
> ---
>  drivers/usb/core/usb.c | 32 ++++++++++++++++++++++++++++++++
>  include/linux/usb.h    |  3 +++
>  2 files changed, 35 insertions(+)

> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 535ac37198a1..b38978abc3d6 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -2049,6 +2049,9 @@ static inline int usb_translate_errors(int error_code)
>  	}
>  }
>  
> +u32 usb_endpoint_max_isoc_bpi(struct usb_device *dev,
> +			      const struct usb_host_endpoint *ep);
> +

I would have put this declaration after usb_maxpacket() instead of after 
usb_translate_errors(), but no matter.

>  /* Events from the usb core */
>  #define USB_DEVICE_ADD		0x0001
>  #define USB_DEVICE_REMOVE	0x0002


Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

