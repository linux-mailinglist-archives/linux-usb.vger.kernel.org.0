Return-Path: <linux-usb+bounces-21428-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E234A54C75
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 14:44:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77A353AE07E
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 13:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8540E20F089;
	Thu,  6 Mar 2025 13:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="S6lVwSsk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AF920D4F8
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 13:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741268659; cv=none; b=QQ+NCNyDMuwZIknAa+zEYV6NN9s9QRaIe7LUmS8Db/oTowVN79fPe1bM1Chyb7J9Vek4i3M+nO8flE/EpkVGOeleduy4exszvXcCHwL/q757eOuoOFAhmU73y9igoqkrgW6OJHX1xxfpQZzsg0JqdVdRU5FP3Gzf637a/G/N1Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741268659; c=relaxed/simple;
	bh=A2My8BDMQF8VFr+4sgwGBz/rcCSkVwtLYDvDB+wZbtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntpviPi6LZL/+DLGfg+bnmlb6SZLgnrPKrrIrbbvIoh6C6eclBXbsluwLt8sM7JP0eG2lGO4SU7Vr8g237x9oHDWi2yZhtjQ8AZpJ3liTkezMOsUz9zQmk0g7Vy6bKKVEFOzdcMyZ5XEcv0d8LXuFzNf2/VOUleEFXJQQTOglNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=S6lVwSsk; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c3c91060d0so81703085a.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Mar 2025 05:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1741268655; x=1741873455; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WwgjDPu5gQ57J7qpYXbCmGMvklNaQu3hyIrZ9bRfd44=;
        b=S6lVwSsk8ucJquJ+3M+Tiyid9mwG6Wgs0wpWG2gB+uQCcJvpXeTcrS6c3hL/Pg1KY6
         v5f4AxzU9BnyUXEEXV7iQIrAVnTa5eCr5HfwlwEnWHzeBi0l3vCmQkzYmqMdctVetatw
         NyDcuLhTuIMERvZ+pL0CeoRdkrbpXTWg54i77FHUW47fH64IWk7UxKC6YkIq/0DL3A6B
         Qv9Ka4aP+WoHWsKEhjkOLATLdMVPz6eM4eg0AJ1kunDB3KjjwDmb+50uh8TSpi4M7kVd
         UhMF2GlZwmXHjm/Cm15BU4YZDX8sOSgUO4duwsA6yE7COXRu9vj4nwuCjSaB/069h0xk
         Yu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741268655; x=1741873455;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WwgjDPu5gQ57J7qpYXbCmGMvklNaQu3hyIrZ9bRfd44=;
        b=Uyp1e5LRUDH1tawDhAKO7MsSppBZ4HLnaBP/M203ALBNMicbHy45Lsvg89uR7wb3Gc
         KGcr4V8uQg7WdRTpeLAxpYFmQPaxM+G0egg8Qnd1d8NiPWNyHNR28xZUIHopDcr580OT
         tEl31rODydW4RqjaLDqnFJya2B0GVTndZ+RJNZiev9stOLyZ7T2KbVMr//bwfhIVKcyb
         HhSfq7QCV7M9gZKS+dfP/hDZXn0+0fzuT2B+8TZMTLIZtTJ5hJz9T8/eIFNda3slsm6I
         qpakgxmnfAFQeWTvA218NazUfi508zDyVY+gKim8ZjjSYJfOjRDsJZfnmbyyrzQLgmcg
         fnkw==
X-Forwarded-Encrypted: i=1; AJvYcCX5gko2Oyw05SjWhHCL8bpW+disDvsJUCkOVUo8mgIszGe2OAHDJI4PRLwPtmh5no6d9rvPqfViB5k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4e8uwcUui+/K9xRYi9E6Uuy69SDcrAZBiDKSKp9TfAfvm6AMX
	MdKhZzXC60T563AkKI+msyNtxZnCG7Z9IEZhtoS3YNqKtVh8uQtq7AzU+9G3Ng==
X-Gm-Gg: ASbGncsbnQU0YZr7SyQlkdspmEdzIIPYMTcqIlUPV1R+m0Nv/6g3uM+xNY9rjdkINcX
	g6BFFTZoK/tnFFDr2pdtR4kLXsnz3WOkFjYNt35vuTPrLK/xvJOH/a/utP5UEH5vDP7eBHsnyfC
	sDeDcPoRqCGXvEq6yi4stBjrAYgKeT6yjrOY4EGVy/eb+zie733Ke6L4Sg06jto09FKDXJFbWEB
	9MprOB5WIrOW8Zn3X241lmjEu70+Zeq/eMM6c590F1YyvCCpnqBSzny9UQ5rhy9ZuwXdd/QY3Jj
	o6xKQxp5IPgoUEkeq3aA3pfmeIkn9hwXIFkV/YhPDN/1Vw==
X-Google-Smtp-Source: AGHT+IFEipRBi3b1Lbw6KErxXrLIwaAdjxI5V6kG1WF27EYioXALQ7PyJP14C34zZXLZBr80yPK9Iw==
X-Received: by 2002:a05:620a:4c8b:b0:7c0:9df3:a0cb with SMTP id af79cd13be357-7c3d8f10b02mr922493685a.53.1741268655321;
        Thu, 06 Mar 2025 05:44:15 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::3ca7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3e533a1b7sm93507085a.5.2025.03.06.05.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 05:44:14 -0800 (PST)
Date: Thu, 6 Mar 2025 08:44:11 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: incansvl <colin.evans.parkstone@gmail.com>
Cc: eichest@gmail.com, francesco.dolcini@toradex.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, stable@vger.kernel.org,
	stefan.eichenberger@toradex.com
Subject: Re: [PATCH v1] usb: core: fix pipe creation for get_bMaxPacketSize0
Message-ID: <1005263f-0a07-4dae-b74f-28e6ae3952bf@rowland.harvard.edu>
References: <Z6HxHXrmeEuTzE-c@eichest-laptop>
 <857c8982-f09f-4788-b547-1face254946d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <857c8982-f09f-4788-b547-1face254946d@gmail.com>

On Wed, Mar 05, 2025 at 10:02:15PM +0000, incansvl wrote:
> Team,
> 
>     I am experiencing a problem on multiple versions of the 6.x kernel, where initialisation
> of a motherboard usb hub device fails and causes a stream of errors. The performance of the
> machine is badly affected.
> 
> I would have considered this most likely a hardware fault except-
> 
> 1) I am seeing the same issue on 2 machines of very different age and spec.

The differences may not matter if they use similar hardware components.

> 2) In each case the hub generating errors has no external devices connected to it, so
>    the error can't be caused by an external device that has failed. In fact on
>    "machine 2", having no devices plugged in seems to be a necessary condition for the
>    error to occur (see details below).
> 
> I found the discussion of this patch, but I am not clear about this description-

I suspect that patch has nothing to do with your problem.  Have you 
tried applying (or reverting) it to see if that causes the problem to go 
away?

> 4) On both machines the errors relate to a USB root hub that has NO DEVICES connected to it.
>    On "machine 2", having a powered USB3.0 hub (which has a number of downstream devices
>    connected) plugged in to one port on the hub is enough to suppress the errors, although
>    I note the that "bad" port number (hub 2 : port 3) is not enumerated (skipped?).

> (tail of "dmesg -w")
> [  781.020436] usb usb2-port3: Cannot enable. Maybe the USB cable is bad?
> [  784.990637] usb usb2-port3: Cannot enable. Maybe the USB cable is bad?
...

Please try collecting a usbmon trace for bus 2 showing the problem.  
Ideally the trace should show what happens from system boot-up, but 
there's no way to do that.  Instead, you can do this (the first command 
below disables the bus, the second starts the usbmon trace, and the 
third re-enables the bus):

	echo 0 >/sys/bus/usb/devices/usb2/bConfigurationValue
	cat /sys/kernel/debug/usb/usbmon/2u >usbmon.txt &
	echo 1 >/sys/bus/usb/devices/usb2/bConfigurationValue

Then after enough time has passed for the errors to show up, kill the 
"cat" process and post the resulting trace file.  (Note: If your 
keyboard is attached to bus 2, you won't be able to use it to issue the 
second and third commands.  You could use a network login, or put the 
commands into a shell file and run them that way.)

In fact, you should do this twice: The second time, run it on machine 2 
with the powered hub plugged in to suppress the errors.

Alan Stern

