Return-Path: <linux-usb+bounces-21474-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD21A55904
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 22:43:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57218170742
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 21:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68E027701E;
	Thu,  6 Mar 2025 21:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Njr0imto"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0C127602E
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 21:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741297398; cv=none; b=N6jh1pzCHzJNcnhjy8kVp8Jwf5X3FS2ZuMK0aVaQtsY80INPp1LF/2vX/Pn+iEZSTGwgkDJJFabZg7GfLtFV69IL8ly/vYKT4DZzcOZUfN4n0ED1Koobt9ioBfQ187jX7wfVyKXJnTYqyj5PnCxG+p/V4+ruPh+JqL0lg6eN4ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741297398; c=relaxed/simple;
	bh=SNFuNCfIgcF5/PptKRJ7JhAvv9sk7R7PiUdz8a1KQGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVNI1zZUUgTgwg3i9e4+lkTrB7d6LhOVMFnsTyDfDqvadGDrSIJPqWFTz0UTZHBsYPBC4kvhQvdEoahkBd/JFP/Dy2aL8+2e+662/P6vcYFk+Q84XL/RADzxjyMS98e61UEvUPCBl4Nw9iivg0dq6Q9w3Gdpbk79Rzz4DFQ0wEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Njr0imto; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-474fba180cfso9927091cf.3
        for <linux-usb@vger.kernel.org>; Thu, 06 Mar 2025 13:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1741297395; x=1741902195; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oyv98J/VYPy+XUbKLqkeEBWOqmDRWz3461BxBi5DFCU=;
        b=Njr0imtoJOUjnvbUL0e1CSQDd6qGyevwMpHbE4eVRW6i6Z/NM/O0654wyHiGdtv2O/
         8sjQFDVG2TfSY5THuNaM5NnO0DoTjzWWC+wHuTRGkeYYQw3F/Tc0YXoCVgqJzVALtmrF
         PyG2c75sLcULwaBZyeM46TAY6Ffdm5yoY1Q3rk4D0TBw8Xv5fBpRWGeMai0bH7qzdFQ/
         4JzX5ZcmqtqTgNIlzugtnQ+b4khj1T82lrbZM9DlD1eVFWV7wNRrsKQC3W8943438m8B
         IJ4dZjUoe5/6rI2dUjyDupDdf3o6ObvgRWaFSHy6z/k9HiRDSgcb73dFG0Q5DcTa9bjw
         kGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741297395; x=1741902195;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oyv98J/VYPy+XUbKLqkeEBWOqmDRWz3461BxBi5DFCU=;
        b=ZDYe9/+p5WeYwxkYyyBnIzqcY/W591TG+BCsFsHtoiR3Ai0VSePsR1a/o3qPtyjWZ/
         SsfDTSMv6g2epfi+5G/qTjEgiTVHI/dqmhZF3QNhQsfJyTh24MFKgpY/v7gZkCtdY4mp
         x4ybNfzy6Zf8nFSjP2qvOyacPUX4IY3zcvlfVf9ctkf/xKapViA4PwQl7pS6BEZ3mM0t
         blE8nx+zfQCOHemvyzs2gBITwQYJe16yIs6YPqQx8Tblgr8jR/2EIqs9hrj/fxAl1/bd
         Zrpyu4/dDHyK1gDUZuKmcHJaRIPO11E4YDowqOQZYyoV03UhsoEXPMsOx/60Lb01hbeu
         VK8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLWSyJSSt5iBwcJAbuHCr1zu1CXZhYwi4Kbp2aHAjqiUpuwyFZWsoCv5qrWjeV6wmjmL8n/YjSRoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUZK50iikYA1nZx3vDQ/ZXMvhy5WMOekUEr5NCy2+y6rrBn1f5
	9YdSsfaz8aHdXO8gtO9KX6KTZAqO6Wivv72QjgUzlAwlJg7/ggPX4FPD9b4DkA==
X-Gm-Gg: ASbGncsCckXJK9K4QBuJKrITvORpmFeehfA+MOnyUZ9oSZLWV/eAblb0FnZGA1LQVcR
	ab/YWsC5W9dQCFHbfC7ee3kWaUxpkc6c/7KuF4gBxZnW2ADDHt2KzK6FZTtKcQ/9Sr9ItBwG5D6
	2o0ZAwi7SqE+tMzidDpUKn+/iisDjq7Qv18Be9j5Y+77maqVkBL8do8lAgYn2U0tN5u0f9FwWuj
	C3jBIOpr97ZQg5rCV2LpvMQ/JkMrLSo2qIQxjP4KFHG46nlussiQNn2CNqBeemWN5TlEpnv+jNt
	HEf+nUkBan0ynNn00oirTVYYl85WVr22kYlqGy1elhuEvQ==
X-Google-Smtp-Source: AGHT+IFnAgDNioiavSEVVuQAtbRWHZD2jSHEVT25d3GoKqWLqtEkZCF1Iwjtf2+iqzJNvvEeQHrmnw==
X-Received: by 2002:ac8:5852:0:b0:475:819:27ec with SMTP id d75a77b69052e-47618b38b3dmr11877871cf.50.1741297395363;
        Thu, 06 Mar 2025 13:43:15 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::3ca7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4751d9ad29asm12223241cf.46.2025.03.06.13.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 13:43:14 -0800 (PST)
Date: Thu, 6 Mar 2025 16:43:12 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Colin Evans <colin.evans.parkstone@gmail.com>
Cc: eichest@gmail.com, francesco.dolcini@toradex.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, stable@vger.kernel.org,
	stefan.eichenberger@toradex.com
Subject: Re: [PATCH v1] usb: core: fix pipe creation for get_bMaxPacketSize0
Message-ID: <04cb3076-6e34-432f-9400-0df84c054e5c@rowland.harvard.edu>
References: <Z6HxHXrmeEuTzE-c@eichest-laptop>
 <857c8982-f09f-4788-b547-1face254946d@gmail.com>
 <1005263f-0a07-4dae-b74f-28e6ae3952bf@rowland.harvard.edu>
 <cf6c9693-49ae-4511-8f16-30168567f877@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf6c9693-49ae-4511-8f16-30168567f877@gmail.com>

On Thu, Mar 06, 2025 at 09:06:23PM +0000, Colin Evans wrote:
> > Please try collecting a usbmon trace for bus 2 showing the problem.
> > Ideally the trace should show what happens from system boot-up, but
> > there's no way to do that.  Instead, you can do this (the first command
> > below disables the bus, the second starts the usbmon trace, and the
> > third re-enables the bus):
> > 
> > 	echo 0 >/sys/bus/usb/devices/usb2/bConfigurationValue
> > 	cat /sys/kernel/debug/usb/usbmon/2u >usbmon.txt &
> > 	echo 1 >/sys/bus/usb/devices/usb2/bConfigurationValue
> > 
> > Then after enough time has passed for the errors to show up, kill the
> > "cat" process and post the resulting trace file.  (Note: If your
> > keyboard is attached to bus 2, you won't be able to use it to issue the
> > second and third commands.  You could use a network login, or put the
> > commands into a shell file and run them that way.)
> > 
> > In fact, you should do this twice: The second time, run it on machine 2
> > with the powered hub plugged in to suppress the errors.
> > 
> > Alan Stern
> 
> Happy to try this, but as it stands there is no such file, or file-like
> thing, on my machine-
> 
> # ls /sys/kernel/debug/usb/usbmon/2u
> ls: cannot access '/sys/kernel/debug/usb/usbmon/2u': No such file or
> directory
> 
> # find /sys/kernel/debug/usb -name "2u"
> #
> 
> # ls /sys/kernel/debug/usb
> devices  ehci  ohci  uhci  uvcvideo  xhci
> 
> 
> It seems something is missing?

Ah -- you have to load the usbmon module first:

	modprobe usbmon

Some distributions do this for you automatically.

Alan Stern

