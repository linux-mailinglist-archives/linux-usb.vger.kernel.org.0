Return-Path: <linux-usb+bounces-13263-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0625E94CCD4
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 11:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AED1A1F21F4F
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 09:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152EC18F2F2;
	Fri,  9 Aug 2024 09:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKQYLkaw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FFE18E055
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 09:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723194135; cv=none; b=nYTqdOrpjwPo4w47Plaon6CaBRkguZPQk5QAgz+RORhofWhjA+RA5NInq2Dk+1Xezj3wVheBiNOr/pyClxgQ3x2A0Zm6P4SV0mmlOg0y70Ji1msLzm8VTWK62fn6/zwDY/ku9dBrl3qU9N32X4VEeSvrwzPxGeOkaAtp2bDL1LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723194135; c=relaxed/simple;
	bh=41wDcRb+/6sQ1bdNdLOqemCkx7DbkgRrm2tzruweUHk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k6hm0vE92EstpJwECPG3J1rTf6ttzoqN9tTyNujxL4AbDMqBkZ2JzrdFGp31/6ldVrUTudmAZlHtZiWai4an3KGXJiRK0GVuvQ3iJv6/mUae0UDlPC5FtsYCDynRA8TmCD2y1lw1QlO3dNYjO9tvwuk0WMB/+VxBZ9jaDcPBQH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKQYLkaw; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f189a2a841so17460051fa.3
        for <linux-usb@vger.kernel.org>; Fri, 09 Aug 2024 02:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723194132; x=1723798932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxlBdky/Vd+AIJHlT1Al8SGA6/46mk1AGSsLUvZDDTU=;
        b=hKQYLkawnYMjjvDIM3+Mqou1MD9HApsRbuY/ASkZwxT0wJDNNk0oFnjdwg1Fut/pFt
         NlWWNOi2//hBeIv3KamUXGBvbh/ej5F8+IyokBkuLnCqSDLAXPSTl3QkYQW3lzRpSTmp
         eTcQZ/WTYRzrsQ8c3BYGZTGMJhOMnP7M6aDYS6F9v+dn2fhyydpKX0jQzp0ad6+VGxqJ
         zYHnbSEq+kQU1CtbNAfsHYPQPujrJzdGH2Sq7rwz+0eK6gWMFKiaMmkXiuhtR2AcG+7S
         ++e3oBGvJzkP/fXOc/eQVunLwzQTzVQUOu4as/KmnwPRn1uyIW0VUI7O9VLjaUYy9inR
         tKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723194132; x=1723798932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxlBdky/Vd+AIJHlT1Al8SGA6/46mk1AGSsLUvZDDTU=;
        b=E9Rb14j7ArmzCZDPrwUgWB8iR/hVRmwP/cI6AW/AIMXC2tvK2hdxWVG3rrWKvvEBDQ
         v76gAEoGhrlnbhexzBN02VVixSq51h/Cx2Pk/dG93vIzmvxWvy2vnWnJJvY0/8GU9elk
         sQaLS3F5h52aXHAdt5SYo3EvM1gUffKVEE5t7J7focsguWSz4RdXIiOJOckN9BbzkZho
         NaOcZs5NvzBnO9QiGhspW7Ygkdm9Uvz1qXR+Tb6+T134IdnKNBBtzqRbLL0JtcZZh8pI
         v2Dj4bTtkUsMFk35FT2LVoEBYNz3puq/fh2aMJpeKx9EGqXPBOvvc7WqkQnrC6Nd2u41
         38Lg==
X-Gm-Message-State: AOJu0YwLvyKgRoDPRWRHupSVtVfgrQNp3rPWs5ZLyT+XjaD6q5SIr6OK
	HS1E5Ry2e02TKlPH69yGwUSKojFCn6fPln6LaF2tRFW0d50UKh8u
X-Google-Smtp-Source: AGHT+IEc7WKHgD1h1ckiV7xPEdsyYaQUEtDOR4Gn1yxEIYqb9x5VDe1pwHBly/mzBcy+/tDUb0UnTg==
X-Received: by 2002:a2e:b16d:0:b0:2ec:56b9:259b with SMTP id 38308e7fff4ca-2f1a6d0e3d7mr5996991fa.49.1723194131557;
        Fri, 09 Aug 2024 02:02:11 -0700 (PDT)
Received: from foxbook (bfh52.neoplus.adsl.tpnet.pl. [83.28.45.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f15e250a9fsm24569421fa.75.2024.08.09.02.02.10
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 09 Aug 2024 02:02:11 -0700 (PDT)
Date: Fri, 9 Aug 2024 11:02:06 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
Subject: Re: Forcing re-enumeration of a chosen USB device from userspace?
Message-ID: <20240809110206.4b43c1f2@foxbook>
In-Reply-To: <f46dc174-2f23-4a19-a9f6-5ae6e4e2d304@rowland.harvard.edu>
References: <20240808083921.0400af26@foxbook>
	<f46dc174-2f23-4a19-a9f6-5ae6e4e2d304@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> You can reset the device by using the usbreset program, which is part
> of the usbutils package.  Some distributions (such as Ubuntu) include
> it whereas others (such as Fedora) don't.  But if you don't have it,
> you can get the source code from https://github.com/gregkh/usbutils/
> and build it yourself.
> 
> If the reset causes some descriptors to change, the kernel will 
> re-enumerate the device.

Thanks for the suggestion. I compiled the tool fom Greg's repository
and ran it 100 times in a loop, but the descriptors remained unchanged.

I only got "reset USB device" messages in dmesg and class driver noise.


I had no luck playing with sysfs entries of the device, but I found
that the parent hub allows me to disable/enable individual ports. There
is some subtlely in USB 3.0 as the associated 2.0 port must be disabled
first to prevent downgrading to high speed, but it works.

Curiously though, it doesn't have the same effect as reloading the host
driver. My buggy device randomly comes back with good descriptors, with
the same bad descriptors, or most often it doesn't come back at all.

Regards,
Michal

