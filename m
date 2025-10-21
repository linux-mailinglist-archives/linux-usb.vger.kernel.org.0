Return-Path: <linux-usb+bounces-29492-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6744DBF7904
	for <lists+linux-usb@lfdr.de>; Tue, 21 Oct 2025 18:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2AC93B9E70
	for <lists+linux-usb@lfdr.de>; Tue, 21 Oct 2025 16:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C1D3446A4;
	Tue, 21 Oct 2025 16:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="D6yGCuS9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD7323AE9A
	for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761062520; cv=none; b=B8DClPLEhJ4Nl9piTP8hOHLI4bIK+p+EuD5F9iXgb9sr/PDV+Fh0I/rdDxSuvFYAaa5nVdw2JizZNblTSAVvaPEboF3ybEeQwNo00mDkwBUkNuHOndMH/e6m24OL+k2+tvim1PInOKJOVXkwtFKZJEr33FF/BSZN5Y3BvDOMxNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761062520; c=relaxed/simple;
	bh=HA2nypTpryHhgmpR01USF+zghuXrOtOdssrjnFcLnD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEiTYedk8HzewFKzYF/old2rLxVcvbY6GYIMibRGm3b1aBlzGhoeyPmk2gBip6VgUAabkOb8jnjM6k/2reVtAhmHxy+0V0HNmQAulNA4a1453mE6ofbg/36iNxZQz8i9FW5V4CwaLSMU9Vq8vl10maUFA0JNO93uh2W77qa0YWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=D6yGCuS9; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-890521c116fso706237785a.3
        for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 09:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1761062518; x=1761667318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=owwIkoZTJY3UIOyyYRPjqI4rHCSTgGqQVU/9gPfvKW0=;
        b=D6yGCuS992kTetW3hOgjKaiT4gb+8ExuDhHWkDEEuNn7vYgjDvioPIkHMKe53/atxV
         y9XsH9VlHN8wBL7pyeozGVwUgtUK0aaB2XhYcDlj8S0P6M/QX6j5lkJgpX9EUQQIIvlU
         V/AndsmTj6KKurD59FvnwLm8NTeI983dPIZU7aR5CyVz44eoNw9XdN7sDP0tytQuXeWP
         M6y/rofYA4niWpYsHQKEJFWiTQyNkNkLBcjgSc9ICugH6xWKqVGy3hoRWSWl8Q7/lZpj
         g9ttbTCnY+MbZ7J24fmpReIdNUs6YD3uMMoVJWUAK7B0Cw2erDCl5PvbaAHvvOSBYv/1
         MgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761062518; x=1761667318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owwIkoZTJY3UIOyyYRPjqI4rHCSTgGqQVU/9gPfvKW0=;
        b=hRtKfeQdjHGIRVWEZp/sM9RY250++zd7nITu4EmSJly7Kx4XAIvltS2FIn4/PLVoyn
         o0wGHZa2IJQ2j8nqEaXiWxEXp5K/HDYXUF2+9mLhlUOCONGypaYYRCoberuoE2vucPEj
         YEFvbJGaTXerTjHa6fr7SjoKTu8u7zf2eMbBXOxZLn5gK58C/y9ihU1VHpapoBIJIIVO
         vOZD0QR3Msu8ESwpZHqVjtTVxn8fLvdaH5ku2/b83LajWHJzonwE3KixJWYd6+l0YIQv
         jx2x8bG30kSeeNAGyhhdupR4g+uI1ojJvvgCMsZkh4Z5EeSgnI7LJpYptGzpV+iuqTUB
         97Xw==
X-Gm-Message-State: AOJu0YxQcwZI22eSeijcGP8cgZ56m2rLFUUw6zkCtaaChP2sguB3bfSz
	/GpqZvfA6m3kX9A2xHxqlEEZJM6eYtuEnMyBCq0s5P9G8KRdd3chK8yKrpnAlS9mU0l/2pD3T4X
	eOTg=
X-Gm-Gg: ASbGncvfjM9JWTinAGcxNBiS9ycv0uvfI8LCDq0CR2U1hKjRhU9MKFtL7pwPS4HAmGQ
	BDsha5ehI3dSEf6Sk/6lqncuBYYYkuwc5jMiUsrD3WjlvwyMKRswLSmFyR9kqM8oxGRd1pkIDrc
	8njP5zwV7pJWbIY/s5SXh8w4MJqFwO0682mvzSzD/XeEkMpypuIN3gruUXmZExyv6/xwUr0mj+f
	hs7r5sQ4ESSNqaRjpzNv4g8sJ7Goceq89ypyZIXEtdWHX0okq4GvIASkVL0KGTf/EbSRbmU/Llz
	9kZXbl5tYn5Fgc374PhFkXGMrJWQ2XAJacl/mmwka0Km7wSZtiM4tr2KQedUquus7uNHiqSxDPC
	yycoRfNfMBRkcoTMWzBLU3wh4tTJEBgEY9XtWFlKbc+fLwrAgQRljomiUKFQzZb3eOEpt+K3IWy
	RQv3dXnVKxNNAw
X-Google-Smtp-Source: AGHT+IEWqNl684EtC8pb7XBm9oh243/eXGXzBSqasGBdhBqO4WznVF24fhMSwM5jYukN7KXesolYxA==
X-Received: by 2002:a05:620a:4107:b0:890:1cd0:efde with SMTP id af79cd13be357-890707f9e08mr1927879685a.64.1761062517781;
        Tue, 21 Oct 2025 09:01:57 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::ba76])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cf58edb6sm787342685a.48.2025.10.21.09.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 09:01:57 -0700 (PDT)
Date: Tue, 21 Oct 2025 12:01:54 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Julian Sikorski <belegdol@gmail.com>
Cc: USB list <linux-usb@vger.kernel.org>
Subject: Re: USB A 3.0 port on Asus Zenbook not recognising the TipToi pen
Message-ID: <4c6bbcd1-0ed2-496d-82c4-3fc9a1c2660e@rowland.harvard.edu>
References: <1393a6c5-3430-49cb-95e6-b18c0f5328b0@gmail.com>
 <cfc6d2ba-a820-4bd3-990e-7800bce171e2@rowland.harvard.edu>
 <967e7681-c9ff-4421-ba89-d83bb40f1af3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <967e7681-c9ff-4421-ba89-d83bb40f1af3@gmail.com>

On Tue, Oct 21, 2025 at 04:44:24PM +0200, Julian Sikorski wrote:
> Am 19.10.25 um 17:43 schrieb Alan Stern:
> > On Sun, Oct 19, 2025 at 08:34:27AM +0200, Julian Sikorski wrote:
> > > Hello,
> > > 
> > > disclaimer: this is not linux-specific as Windows 11 also fails to recognise
> > > the devices, but maybe someone has ideas regarding the causes here.
> > > I have two TipToi Pens by Ravensburger. These are recognised as
> > > 
> > > 04d6:e101 Mentor Graphics usbdisk
> > > 
> > > when plugged into USB C port via USB C to micro B cable. When plugged into
> > > the USB A port, the following messages are reported into the journal:
> > > 
> > > Okt 19 08:19:08 kernel: usb usb3-port2: Cannot enable. Maybe the USB cable
> > > is bad?
> > > Okt 19 08:19:09 kernel: usb usb3-port2: Cannot enable. Maybe the USB cable
> > > is bad?
> > > Okt 19 08:19:09 kernel: usb usb3-port2: attempt power cycle
> > > Okt 19 08:19:10 kernel: usb usb3-port2: Cannot enable. Maybe the USB cable
> > > is bad?
> > > Okt 19 08:19:11 kernel: usb usb3-port2: Cannot enable. Maybe the USB cable
> > > is bad?
> > > Okt 19 08:19:11 kernel: usb usb3-port2: unable to enumerate USB device
> > > 
> > > I have two pens. I tried two cables delivered with them, as well as a
> > > different USB A to micro B cable I had. All exhibit the same issue.
> > > Does anyone have any ideas what could be the problem? My first guess is that
> > > both the laptop and the pen are slightly off-spec in some strange way, which
> > > causes them not to work together. The USB A slot on the laptop works fine
> > > with other devices, and the pen works with the laptop if connected to USB C.
> > 
> > Have you tried using the pens on a different computer?
> > 
> > Alan Stern
> 
> Hi,
> 
> I did, I just tried again to be sure - with the allegedly broken cable. This
> is on my ASRock Fatal1ty B450 Gaming-ITX/ac front panel USB:
> 
> Okt 21 16:42:00 kernel: usb 1-3: new high-speed USB device number 4 using
> xhci_hcd
> Okt 21 16:42:00 kernel: usb 1-3: New USB device found, idVendor=04d6,
> idProduct=e101, bcdDevice= 1.00
...

That certainly indicates part of the problem is in the laptop.  What 
happens if you try connecting one of the pens to the laptop through a 
USB hub?

Alan Stern

