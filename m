Return-Path: <linux-usb+bounces-29092-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A479BBC96E5
	for <lists+linux-usb@lfdr.de>; Thu, 09 Oct 2025 16:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCF0419E7995
	for <lists+linux-usb@lfdr.de>; Thu,  9 Oct 2025 14:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75642E9759;
	Thu,  9 Oct 2025 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f505K/ij"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4852E9EDF
	for <linux-usb@vger.kernel.org>; Thu,  9 Oct 2025 14:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760018860; cv=none; b=kBZGiegiWTENFGZPxJwf0ZHle7KJQz+eYBMxRjd4e4GEYI72pOX15WQykwN5C92Jd6eRPArSTlOcYl91LgELCAMDDqI8lIImsGIo9Pp3oPVfhj2MVOxGRgQvxMjxeqKu5bcHB4jYLw8WfIBPT7csojRy+Oxd5MQCpOvPu9rM9/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760018860; c=relaxed/simple;
	bh=91yVJoR6BDpW09trqWYEMoeTVLPjixOTZgz3FJFcFMI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CkZ7EKB4l3kay/5qmpsFZojiJmauILP0BRGZncu7zO2Iu6c53tU4TOUQDIJb8kTiy9+rg/0GqafuZJLx+7fTtS3TaJ4jHuRNtckA/hd1gyp/kePh517y62pFiMouj7yTMczIXnedPEf11/d9FKlCRS4ZK7cRLvUueVLdg8wPbJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f505K/ij; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b3e44f22f15so144656466b.2
        for <linux-usb@vger.kernel.org>; Thu, 09 Oct 2025 07:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760018856; x=1760623656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyZn5PmlBBt8egaNWBfPpzd01wJch/GFScgmFErRpRk=;
        b=f505K/ijUZhKNzP3l2dPSl5Ipqq4kVfHj01ZaMCIlFh9cjnU1yDq4q0elL6Y13+r1+
         ggc6iGIVJ3geg8+GKaQUzQzWv/qk3hooiVV1E6rPipaarPQP2G4+5zv0rdZRvh6T7GSn
         skoVwxqXYa3F9cGM/w85kjVx68zTBhHNq34z8/9Uw/zW5S/2lttaeFlAVuwp2467ThEW
         fCnpLvMlraKtHvM5KOjYU5BT5l2u9iW7LUFk/H7EY9LScTMutoh+D3sbfhwBA9S6iB8M
         wPINzDtd2qL+pi/dG2paRG/R5K7cdCKwfyqILxNDPzBHV5JXZGx9KaskHesoM9gkOa/S
         AhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760018856; x=1760623656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyZn5PmlBBt8egaNWBfPpzd01wJch/GFScgmFErRpRk=;
        b=dJeg0xGlQD/W0pwIZBC1IJ4OKl2B8P4YT4LR1BQqUTWJ3Wo9HCNDI6Ceczkx7kXbHy
         y9U1Kpo9OtJujc0cYz3WhdtcocrJzc5JTm6EMPo64diP2iMeMba6hTGkAAtX1hPGOSj2
         ZcrPGixPFXkxsxA//oM4Nck7ivQ8JJ0+C8n2XoHMF5OYU6FWK2oQUhed2IrXGqeVGRIk
         kzjosuIxwbKsmBkoFX2UZcqq7f7s+Kt2uneSheLuIh6wGoR2Lof7TSXmGb/GmXtCYFKy
         xDWM4CdTHZiWVOSjlJjiBpWwUejKAUWbJvbpNHYqDK2erwPHrZElvyDirJ4yQOUK6/qu
         M4KA==
X-Forwarded-Encrypted: i=1; AJvYcCV/YM5m00yl+O94KSN8rnkPAiK21fscN4HDxuU0h99zH/GTCvt7acbjtxLbTXjNnRS82CjYGIhVMJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdfoqVZg5wMQQ8+CEJ0c53zluNYBUV38U8+ybs6BZdoR+97fUu
	sGL+u+v2fY+wmjVgrY/SatXGxdBFbLxUABqc5sHRlAGwYcNdYogKok8j50Vv/A==
X-Gm-Gg: ASbGncuIFlnl93ABOofngRZHZutJNU68shhUvG0QnGc8ge1F2KCkj8RVAWOf53wQBAd
	xw0yQiSRUfpkIztNVLduzKRmNETO9fcZPMtSLW8fO0BB71GV5YIahhwIN1cD2xK4iBWs0J2LHjO
	xyT1tQvQhEt3cE5a7JWu9rhDV2il0yk6apFKksTIa1eOARftfkjl55eZUr9oWwVaHcqU6Z/OIiW
	Yodx0DDPss5bKczH1aKRV/ihTbzuA6Vp9siIjmJDv8ca9yDWbodTH3cCpWv860PK5v03D5CsgzR
	9e6ErNBlxAcDjh1KjUOtbDeirsEabFReYp8vqJWjSAegdCFxwzNY5TRJIDh/HNjMZ9LgoLPvueQ
	Aa2r+70ibi8t3n29k4BjP7iKsjc58j2TlRg6D3r/cK0Fe8/1jmfJ8O65ekio=
X-Google-Smtp-Source: AGHT+IEpRrjCdpBafsmwFvZUPUH+rhoyg65L6ynnarVD+LFu0paAJGTtukTih4Ja/+bLIjB1kbve8g==
X-Received: by 2002:a17:907:72cf:b0:b2d:a873:3a4 with SMTP id a640c23a62f3a-b50a9a6c379mr856461466b.2.1760018855947;
        Thu, 09 Oct 2025 07:07:35 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4fd9esm1900266066b.76.2025.10.09.07.07.35
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 09 Oct 2025 07:07:35 -0700 (PDT)
Date: Thu, 9 Oct 2025 16:07:31 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Pierre Tomon <pierretom+12@ik.me>, linux-usb@vger.kernel.org
Subject: Re: USB disconnection after mounting file system
Message-ID: <20251009160731.58dd47bb.michal.pecio@gmail.com>
In-Reply-To: <2025100905-gestation-founder-3e70@gregkh>
References: <4chgTL1WjjzCqn@smtp-3-0000.mail.infomaniak.ch>
	<2025100905-gestation-founder-3e70@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 9 Oct 2025 15:35:55 +0200, Greg KH wrote:
> On Wed, Oct 08, 2025 at 05:48:05PM -0000, Pierre Tomon wrote:
> > Kernel 6.16.9
> > FS: ext4, does not happen with NTFS.  
> 
> Perhaps ext4 pushes more data to the disk causing it to draw more power
> and things flake out?

It seems to be something weirder than that, because there is a few
minute gap between the last storage traffic and the hub interrupt,
which is indeed disconnection if my Wireshark decoding is correct.

ffff8b7808d86540 959060304 S Bi:6:006:1 -115 13 <
ffff8b7808d86540 959060697 C Bi:6:006:1 0 13 = 55534253 53080000 00000000 00
ffff8b780a96c240 1218406664 C Ii:6:001:1 0:2048 1 = 10
ffff8b780a96c240 1218406695 S Ii:6:001:1 -115:2048 4 <
ffff8b782ae2ac00 1218406713 S Ci:6:001:0 s a3 00 0000 0004 0004 4 <
ffff8b782ae2ac00 1218406731 C Ci:6:001:0 0 4 = a0020100

Potential hypotheses:
1. It is actually *lack* of activity which triggers it.
2. You need to wait a little longer until you see it happen on NTFS,
   then stop worrying about filesystems and software ;)

I too would suggest trying other cables or USB ports (SuperSpeed link
quality sometimes varies from port to port). Or xHCI controllers - I
don't know which one you have, but those with "broken streams" quirk
coincidentally (or not) also tend not to be most reliable, IME.

Regards,
Michal

