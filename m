Return-Path: <linux-usb+bounces-29437-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6162DBEE8E5
	for <lists+linux-usb@lfdr.de>; Sun, 19 Oct 2025 17:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1050B4E57F7
	for <lists+linux-usb@lfdr.de>; Sun, 19 Oct 2025 15:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568D82E9753;
	Sun, 19 Oct 2025 15:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="aMPOySrg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD567082D
	for <linux-usb@vger.kernel.org>; Sun, 19 Oct 2025 15:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760888591; cv=none; b=ECfP5aI4cchEHU5fkEodQ2qFCDJWBO0wvNwmFocwoNkZQryX6xRt6J7Ge5UnX/jlR7j1dhUg/uD95l3yz9FH+a9pYY0KRhjKgXMs5F1LeiqUo/oigQ7NqUVN6H0lamWt15Y7rLRnd2NYdE6QBq4+Tsb5nzhr744sXmxWs9Km/c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760888591; c=relaxed/simple;
	bh=VQ497iYA5fWuIs9gGK7e2BMuosuAL51wy9H9qwnogm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0jpVBc7Dfw4uMEmXu2JDX9YNtyNfiAi35Wj4I+5dgtgsYrfHx/SaLkPmoBWNZYzbwQTTk4m1h/p8t0JTR61VuKjmPkxUukjDswErGo4KSzg0iiULwrfMlLn7hCLptQK95tTUiKUdaRGMQGOatRsZI8ouOIQbHzI99lirFXcJc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=aMPOySrg; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-87c1f607e72so51899066d6.0
        for <linux-usb@vger.kernel.org>; Sun, 19 Oct 2025 08:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1760888589; x=1761493389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0peezqQc55okGkFITmR7T6/g2bRwPnKR8F0HghVyajw=;
        b=aMPOySrg0W6qrB4JGEOjflHwwWqE7Iw0Sm5EwyzzmcBiX0Axo0gj908kBA97zM/fqq
         DTi0ukGx+d3l/IWjIPkFRxdlJZjT1CEyLKd9yD6+yrpnZ1hyJhGj038Mi/srwDWeCBJC
         3qsWTajTW98xjjJxG2Qt8C4TgSHYpLNtFkDw1AuFO25VzI0Q+RkwH9t12c49TSede4/N
         RogrZTyVMiyLuDqzlyOwwvge0Ds39HIUgXihhdiL2qc/1oX1utC2Y4ddUaenUKHlgkRK
         jaAwNiYGkcBIV3iBUCuTl7Rf84iiXBte+acDP66nhJTO+Ofw2EBxT9C0oR4BETDDjaS+
         F0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760888589; x=1761493389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0peezqQc55okGkFITmR7T6/g2bRwPnKR8F0HghVyajw=;
        b=FF70UkecSIgOjKW+asXJi6/F7WwU8JpTtdGCAEtakUAcGYZQQRmb7rVcnPnfQZyWuy
         GO68wzF4qWPH+P9MLvlpT2rhMsL8C5A06cq1oxxQ5Vp16keOOTsD76KS7Duh/DQCveIE
         F2G/yT2CuembzvuY6+Ep8rBTvmFhh8RMp2/c/v+dhJkmNvfRvheXAlu3l1aTXxhHNzPN
         XKX369Jcfe1iAjJArMMQk+e2T3Kr6mCyW67ihVUh+vY5yzCDC0PorxJX0zb8fSt1CVSv
         cH3phePMFcBrTEaOCgx1EenK9PQTazhuzqN9FMn75JeM75ArSSfSu6dGLD3VS98mCrgP
         4fiA==
X-Gm-Message-State: AOJu0YzIAdk9nD4DFx1UP7is+i3h7j6Eb1ISdzkeWzYlVmyESxZyn9eV
	ymCcVC8JBKPMMcxmC+uyCVAFUAjHS9I2DWLnZqLMAeBQaMqrci8hjkvqT/THSzmdB7MDluYCvRJ
	RETQ=
X-Gm-Gg: ASbGncuDdjCpy1RmNpHtvWfbaJz5HlKXUlzAeWt5+A35GfTFljFvXvIZKyt/R+7pAOu
	IUnb6TjAbGVf9+tk4LbBfWULDaV0oXaRXLEdrUR56PhZbPJgKVOuvubkIuti88pQZv3HSV8nvFF
	H5Wjynfke0bvChhwFs6HyAND6Hwb9aJ/5tD1cqGcJ8XhG0FyEh1ux6cds9tbvQpdGO5sqmwqKHw
	XkYMwkBXRqx+TvfHrJ7VTNCbZdvq4HjAVCt4/gksuUhQxHN3Wb7pj9RhYVQkCuoCax/iME13C7C
	BffMcMFOvm09s0qVBKSkq5asL41JmL7IFY+ytv7a4EKiHdAubAGSqLAqVtoTeolN5gzVEJTnUUk
	RGZRRWo1KUNcFP8Kgmx7eQyGmaxBbK52mUVS+fqHuhcrjjjmU1wDxTsN70ylH3BjVAU3gw1xhPQ
	sOPQ==
X-Google-Smtp-Source: AGHT+IFJNeVlNeQaKAFbAbmAfc5xHD7w4+29Ja1zGEQUB0jK7b1zaHKTAdtS+rLpuXzpatbERe2YuA==
X-Received: by 2002:a05:6214:2465:b0:78e:2582:fe4 with SMTP id 6a1803df08f44-87c202feddemr122905976d6.30.1760888588945;
        Sun, 19 Oct 2025 08:43:08 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::a165])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87d028a9a48sm34042436d6.43.2025.10.19.08.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 08:43:08 -0700 (PDT)
Date: Sun, 19 Oct 2025 11:43:05 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Julian Sikorski <belegdol@gmail.com>
Cc: USB list <linux-usb@vger.kernel.org>
Subject: Re: USB A 3.0 port on Asus Zenbook not recognising the TipToi pen
Message-ID: <cfc6d2ba-a820-4bd3-990e-7800bce171e2@rowland.harvard.edu>
References: <1393a6c5-3430-49cb-95e6-b18c0f5328b0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1393a6c5-3430-49cb-95e6-b18c0f5328b0@gmail.com>

On Sun, Oct 19, 2025 at 08:34:27AM +0200, Julian Sikorski wrote:
> Hello,
> 
> disclaimer: this is not linux-specific as Windows 11 also fails to recognise
> the devices, but maybe someone has ideas regarding the causes here.
> I have two TipToi Pens by Ravensburger. These are recognised as
> 
> 04d6:e101 Mentor Graphics usbdisk
> 
> when plugged into USB C port via USB C to micro B cable. When plugged into
> the USB A port, the following messages are reported into the journal:
> 
> Okt 19 08:19:08 kernel: usb usb3-port2: Cannot enable. Maybe the USB cable
> is bad?
> Okt 19 08:19:09 kernel: usb usb3-port2: Cannot enable. Maybe the USB cable
> is bad?
> Okt 19 08:19:09 kernel: usb usb3-port2: attempt power cycle
> Okt 19 08:19:10 kernel: usb usb3-port2: Cannot enable. Maybe the USB cable
> is bad?
> Okt 19 08:19:11 kernel: usb usb3-port2: Cannot enable. Maybe the USB cable
> is bad?
> Okt 19 08:19:11 kernel: usb usb3-port2: unable to enumerate USB device
> 
> I have two pens. I tried two cables delivered with them, as well as a
> different USB A to micro B cable I had. All exhibit the same issue.
> Does anyone have any ideas what could be the problem? My first guess is that
> both the laptop and the pen are slightly off-spec in some strange way, which
> causes them not to work together. The USB A slot on the laptop works fine
> with other devices, and the pen works with the laptop if connected to USB C.

Have you tried using the pens on a different computer?

Alan Stern

