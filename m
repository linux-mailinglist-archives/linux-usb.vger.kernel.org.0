Return-Path: <linux-usb+bounces-29223-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A75BD327E
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 15:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9E45A4EF6D2
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 13:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80111270ED7;
	Mon, 13 Oct 2025 13:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ddAv/zcx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BE47262D
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 13:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760361395; cv=none; b=mwZHKk38OXKcaxpXgs2dciFFHC0ne5/qjZsTqHxX7PbIdg1jRqnEfg47aWDEtwKPlxaYnmixTdXQnYjR9NLOu+EsJTqi7oD3Dvh7k2miMit4Va65lLq+5yHYliA9UudiEyZ+WOKbvDJYlvNj13p6a83ZD+Hov8EbqIWFHK1XDcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760361395; c=relaxed/simple;
	bh=6LwevomWCksbvPw5zxzgKJ0rn361gs1colI8667FE8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgY2/BBza8tNTZRL/Shuvav0OC1xgzncyI8ZWdK6wx5i83fm+wvcHyM/6spdk8/+WdIgS8EPdi2UbLUNbZXXYFluek9QvLsHXA13wZaJXmNbJnnzjyO5TRXXhx4d50w6yQoT7f0MHCH0RXt4oo/GsFEtxt4CyA/naTyZ6NNv4Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ddAv/zcx; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-879b99b7ca8so62138636d6.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 06:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1760361392; x=1760966192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1bSnM1zzOjn0R4lX0zxJUOJFBs8bOrPyVKb1PDpbaf8=;
        b=ddAv/zcx40upFuZuHn/A0REoNwjI81ga2fVEeU2+Nst5bhX+Vsyym+yL/sMxtATvT+
         GxSQ3xRWHIRlQleXoFJS2LmB89/kgPRRnZ1z45sc9Jii/G3+nqqYS8M9a1B3Nlq0yvW0
         EQ6fMXNf+PqGSUa5r6JcRSjs8eyslLcQU5hwYFOiRoAMHt2s5XXSkeXwGckUFA8LkI0M
         Q7PmlibDHEL5GIG+q8iMmQfxSixyGBjljwyMKBgeRnc2SAQ0mUmQUa2/4VU7omuSTqnl
         uduhZeQcB2VTr2k8+C73tpmVlu1hMxoJU+sSp9jJbA0Yuc0zCQlv198VJV7t3l2RnRTN
         7iJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760361392; x=1760966192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bSnM1zzOjn0R4lX0zxJUOJFBs8bOrPyVKb1PDpbaf8=;
        b=oU/N460cwatVi6y2Zg7TJikvKkV2232blg/H4P/p/7ZAWnzUdbMJyllL3yIcuzCYT3
         xp0ECmCHpLIDDAhn9nzuwzLweVviSC3dnzfTCeeU0xaqJFVsRAuWgF68D1i7rlxSEtBp
         GalCSJQtnRwlcggCKYixKR5wew420AcBxXq6QylAOkf4TVh+0sE+jQViCEPIHeuoC1A/
         aQX4OklQBAnPWyGzi1WGvHqrCct2J44Fnb00d7sSqDOgLS0YTfqIOYrlYQn38L4qSata
         ShHgtSfLswzNEwT627cySJJsqMWPJSAvdamfqXznQIqVJftWz7xxUgU3Pd/bokcdoH1Y
         zCqA==
X-Forwarded-Encrypted: i=1; AJvYcCUDe+gemLbA76jRdwa8mpg1FuVSDTbzWRLQOaLogsGQs+o7kD4bRrjDAzNIete0GKKO8PFZtJcojZw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc1ztjM+kPlw6GNKtae0TrcvlM60wHdo2gMmjfy8PrzlYJypJU
	Srro3FZjqPK41lPXhFBIJ0UiDaGOKHnsMkPY7f1yPVmigEs7KnZz6vfyHtPlPOZPGQ==
X-Gm-Gg: ASbGncuiY2L21AHxNFmMbnR9cQSfKa75m75pHc/ybEI2XjMQxAJYcg42TkyJKnekwiG
	RAmsxEDfcNokoHQnLdye/rys0SKj35uXvy7sP4BIKch+QVpR1VLteppLtm+Sm9Z1lkSe8Y44Hkm
	++ui8M/hIkMtzA6idYXxt931Ry84CIoy+Pk2m8M14IHbeW34ewqZhVIzMprUuQsxg0b5rpec02D
	N7pJSpmESBVh0L7WbcVhZ0Y1W/TSLONaZfb4x5q5tNA9aVZ4xCsaCLW0qO8rUvTCx0wrw0PX9O2
	PN1db3CUrY/DxqCnpvs+WAAbCr1b17PQw1J6LDmKWUR1xv2Q2xgo0jrq6Hsr2D8+3NE/41Aour1
	1hxbFTJnZyOZ04iFc/B9j77N13l0dNGako+aiIpxMoQGhLvCOxg==
X-Google-Smtp-Source: AGHT+IH8zyaxI27rVjNd4e3LoVIDALG3OGnNtJloQCfAqB0TMxZmw9IeaHLbnZ6+owcuuM+JIhRxtw==
X-Received: by 2002:a05:6214:416:b0:7f1:62a9:ea2f with SMTP id 6a1803df08f44-87b2ef941eemr285584636d6.52.1760361392115;
        Mon, 13 Oct 2025 06:16:32 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::20b3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87bc345b893sm71760936d6.3.2025.10.13.06.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 06:16:31 -0700 (PDT)
Date: Mon, 13 Oct 2025 09:16:28 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Kuen-Han Tsai <khtsai@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: core: Centralize device state update logic
Message-ID: <24db7c90-16d6-4122-8bda-aee2a2c930bf@rowland.harvard.edu>
References: <20251013-usbcore-tracing-v1-0-b885a3121b09@google.com>
 <20251013-usbcore-tracing-v1-1-b885a3121b09@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-usbcore-tracing-v1-1-b885a3121b09@google.com>

On Mon, Oct 13, 2025 at 10:01:22AM +0800, Kuen-Han Tsai wrote:
> Introduce a new static inline function, update_usb_device_state(), to
> centralize the process of changing a device's state, including the
> management of active_duration during suspend/resume transitions.
> 
> This change prepares for adding tracepoints, allowing tracing logic to
> be added in a single, central location within the new helper function.
> 
> Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> ---
>  drivers/usb/core/hub.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 256fe8c86828d51c33442345acdb7f3fe80a98ce..ce3d94c960470e9be7979b1021551eab5fd03517 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -2147,6 +2147,20 @@ static void update_port_device_state(struct usb_device *udev)
>  	}
>  }
>  
> +static inline void update_usb_device_state(struct usb_device *udev,
> +					   enum usb_device_state new_state)
> +{
> +	if (udev->state == USB_STATE_SUSPENDED &&
> +	    new_state != USB_STATE_SUSPENDED)
> +		udev->active_duration -= jiffies;
> +	else if (new_state == USB_STATE_SUSPENDED &&
> +		 udev->state != USB_STATE_SUSPENDED)
> +		udev->active_duration += jiffies;
> +
> +	udev->state = new_state;
> +	update_port_device_state(udev);
> +}

This seems complicated enough to be a standalone function, not inline.

Alan Stern

