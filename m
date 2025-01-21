Return-Path: <linux-usb+bounces-19570-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4C0A185A0
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 20:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FD4416B249
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 19:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D305219E7D3;
	Tue, 21 Jan 2025 19:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Suc8WV8p"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA82C1F55ED
	for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 19:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737487580; cv=none; b=bBqbiLJWc0cfGWlt/yVxADFXqIaiOabcltGi6DLZlnNOn/YF9Y60PLncF/h56sHr7t3yLKnrB3ndrbyAqFzo0dYQDK4pE9XicUs4FbsHvR4SuQpjP6wT13r3Xiq5TKGc8yo2iiNsloR4GCjIrVOy1DGWBE6Y/7ITPrtK15WTMr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737487580; c=relaxed/simple;
	bh=sjC2mTWOvmLkV1BfFQM9OQWaicCAATfyj/dlGlTg2F8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7Z/CMSdPJsuFUPmB3eMfnhiNwS0ViyAkNmtf3E5/+Y4DdpQ07Z1T7hkcHopQst3b7/bdU7a2UwDkYZHAPU8OeGvCz0NO53VRgMgEv1GCvuorUA8izygKvXNmubNUMCfgDnrFKVbZm6XbuG6DTqGWvUxrM9Y87rOxVWSs97ZUsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Suc8WV8p; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4678cd314b6so58127711cf.3
        for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 11:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1737487573; x=1738092373; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xieAPLO+FNWI+mLPegHNse+KoqcDSArXL4Gd8PWxXMo=;
        b=Suc8WV8pO5e3A5k5K1p8xLh0iIKRRG0cNDxdn/e92A5aJBOfZHue30+K1gCS04XefI
         ibSkjQpZAgzBRkFMNEMS2Olq9Cw9/tAsBIVxroVPDRjY0czf0vzuedP6ZMkc8qJIBJ36
         56rMXeRs3XGXHtnJsZ5hYOXokUm3bg6+vH1RFj/quifv3+c186eys9etEuEL9AiNxg8j
         Bp7dKxarIqCo2ZXJz/9AOcZaYFfNwNrp3f/sYClN0moZqBMzGOqLPGNrUddRXOcOvWT6
         t2HhgPjum/MDusMEoClODYQJheW22AWq4NwihceyZOmvqX7/GgCPjfxkoPa5DdHiYwJ9
         zFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737487573; x=1738092373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xieAPLO+FNWI+mLPegHNse+KoqcDSArXL4Gd8PWxXMo=;
        b=PnNP6vxu+7lI30vlSRZ9DEdLWZRUUoULltwW8QTZopy/zSxg9e4P5JfGNIHuYvc7Te
         LyIDFxXuQCBXZMOGMw90X9LQd9xBmFnOjk3GKWScd9qzZA/wXQBoyTIbnl+quXxN5DE4
         1jqzWD0l+lCC+AkBfoxzGY7vIAulF5h5j3Ag4IrQAPfXe71aPW9F2B37gYTkVdYNWO3J
         iEXnQyUTabcLc1In8vc8UaV4ttWRLImQOA78V6bwjte3D1HY9oUyWZ/iDneqCTIJDn74
         z6SKr72uZQwcIXVgUX2Zv6bfmXntdKcvx6wwih01MFw6Bimt/XwrwsYLqVlhlWIp6GMS
         b2FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBWZyJKFSw83+KcZGoUAr5lGKHcSnW74weWNDKPSTWogtBmWZDTxvKYmzudDvnKVaTZxP/OshrlNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHGw3Txd4IEhVJwOs3MA5BiqldxNT0LYeOAUMRrVQM6q2Ya6S4
	GdUvKXfwB7okbHQa39y+Uj2ToIAMHzOUIREzcGBX0G21iKWb8otmzVeC+czOXw==
X-Gm-Gg: ASbGncurhMbSL+X9SFV7b3XE3+FVwG4hcx1B6nIfInXQGJyMaQWbuFyRpItjGfBarKA
	WYmoxRjncyKK6+NZ/B0wbTMnKEWTEYQFkSVCxNfnu/POhRai72Jy72oYo7gRB6jRnPF9Q216XeE
	FmPzpdgC8JHsAThndG+tILuqaTGadVjpOPx8Hd4YhVB1qNEua93PADAIahVkboBX1cVjC6jVAD4
	6KAgzesjUVG9vBNOzZQ10ef1u7YtKdzjUttBBwsOHP/XWSuycAB6Vv5yHqEvNhPhToKLxrFoSM8
	SWfBaOvnpUcyeZBhTkJZq+t6KMKN2XK2Y6g0Q2StQQOWX8pT3ypWGRKh2CajLUY=
X-Google-Smtp-Source: AGHT+IFq7S3vDhzoX4F0nnIc/Nzfks8g9QEQ7njKiBg89/lJA+gSl9yMwpUkPuqiNCD51JU33K8D3Q==
X-Received: by 2002:ac8:5703:0:b0:467:5d5d:fabf with SMTP id d75a77b69052e-46e12b6f80emr259723551cf.25.1737487573538;
        Tue, 21 Jan 2025 11:26:13 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-51.harvard-secure.wrls.harvard.edu. [65.112.8.51])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e1030e930sm55765341cf.38.2025.01.21.11.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 11:26:12 -0800 (PST)
Date: Tue, 21 Jan 2025 14:26:11 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Takashi Iwai <tiwai@suse.de>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: Increase the limit of USB_GADGET_VBUS_DRAW
 to 900mA
Message-ID: <e823a961-a0a1-46c3-84a9-7da3cd718f4c@rowland.harvard.edu>
References: <20250120111702.3738161-1-prashanth.k@oss.qualcomm.com>
 <894f42a7-50a5-401e-a705-a06eafd6161d@rowland.harvard.edu>
 <1b1587e8-5c38-4138-a27a-1de71ff07ce3@oss.qualcomm.com>
 <e36303c0-9d1f-4c66-bc40-891958507275@rowland.harvard.edu>
 <d308300f-2559-4d13-8d15-5a2416ac00c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d308300f-2559-4d13-8d15-5a2416ac00c9@oss.qualcomm.com>

On Tue, Jan 21, 2025 at 10:19:08PM +0530, Prashanth K wrote:
> 
> 
> On 21-01-25 08:36 pm, Alan Stern wrote:
> > On Tue, Jan 21, 2025 at 09:50:08AM +0530, Prashanth K wrote:
> >>
> >>
> >> On 20-01-25 08:17 pm, Alan Stern wrote:
> >>> On Mon, Jan 20, 2025 at 04:47:02PM +0530, Prashanth K wrote:
> >>>> Currently CONFIG_USB_GADGET_VBUS_DRAW limits the maximum current
> >>>> drawn from Vbus to be up to 500mA. However USB gadget operating
> >>>> in SuperSpeed or higher can draw up to 900mA. Also, MaxPower in
> >>>> ConfigFS takes its default value from this config. Hence increase
> >>>> the allowed range of CONFIG_USB_GADGET_VBUS_DRAW to 900mA.
> >>>
> >>> Is this the sort of thing that really needs to be a Kconfig option?  Why 
> >>> not make the decision at runtime, based on the needs of the gadget or 
> >>> function drivers and the connection speed?
> >>>
> >>> Alan Stern
> >>>
> >>
> >> Right, set_config() in composite.c does this in runtime based on the
> >> values of MaxPower (from configFS), VBUS_DRAW defconfig and speed.
> >> If we don't set MaxPower from configFS, this config helps to set it
> >> during compile time. In fact MaxPower in configFS takes its default
> >> value from CONFIG_USB_GADGET_VBUS_DRAW . Sent this patch because Kconfig
> >> has this limitation where it's only allowing values upto 500mA.
> > 
> > Why does MaxPower need to be set at compile time?  Why not set it at 
> > runtime instead?
> > 
> > If MaxPower gets set at runtime then it can take its default value to be 
> > 500 mA or 900 mA depending on the connection speed.  There will be no 
> > need for CONFIG_USB_GAGDGET_VBUS_DRAW.
> > 
> 
> Yes, agreed. Can we mark CONFIG_USB_GAGDGET_VBUS_DRAW as legacy and
> maybe also avoid configfs/composite from using it?

Indeed, the whole idea is to avoid using CONFIG_USB_GADGET_VBUS_DRAW in 
configfs and composite.

If nothing will still be using it, just remove it entirely.  No need to 
mark it as legacy.

Alan Stern

