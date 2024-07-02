Return-Path: <linux-usb+bounces-11830-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E54C923F80
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2024 15:51:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F9471C22E2A
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2024 13:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5351B4C5E;
	Tue,  2 Jul 2024 13:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvvMKHc6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5097F1B47C7
	for <linux-usb@vger.kernel.org>; Tue,  2 Jul 2024 13:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719928260; cv=none; b=cuBeKGH5/e92USJGNrV6mQ+/k4uUNKAfwsqzf6DbtzJql3rWUSgmT3wdrKyWch/OoYrmWoFNueHahFN/+ZrHynh/6aV4Cb62ujZJtvOc0Q5++ufbPNj4eEn9nYYIHMRV++YNyukUaw1J6HCH90RuIeTVRYSf4ltEAtZugciLecc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719928260; c=relaxed/simple;
	bh=KzC73GXEHwpV8scS6GQThAgKJuOXghOLkVqVW5LKhlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdJV5YzIMpQ6d1pLlxgCCdHBRzLZ4dvK38gghbdF2DTYdQLME9bwVTBLAXnrAmDJbFZkUPtdn+DEl1mrtB+s2TE5XsRWbvKzQy5DI5HfimmMEX6Tv/l7AdKngwIphWvgypWDgKhCnAH4H8zmxarqRbS7U8XT3TR4ZoT8ndPLHd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvvMKHc6; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-366de090da9so2091468f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 02 Jul 2024 06:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719928257; x=1720533057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrlODvQi0EtdNm1syRQN2fRh4MhfAwRKmpFe7v0fa1k=;
        b=YvvMKHc6fjx7e+Lgm+shy0A+sleFA0l64v/rUhCFyr9XqYhRUgBOme6lOtjn/r2yJc
         6D5Xj3RqFP9EOMmQKjwXmNwwYO1HrfJOnmcl2aKEbJ+l/725cC6xxPNeonf/BX0NNwxn
         TvKILRaaxLEA2BPVtn/GTZOpa5wSQ7e/gncN/7oeLkHVzoaKWYqq7A+xGQ+sI+z5dK3d
         478mfz2O+JsRRWriyE0eDIETSIyHTYZIwqwXUbvILhqrvdokbYyTaKaqDiHoa0xCXgm+
         SVgbNDmvQBryVSyFjYsl9/QaUkO6+NkRXZO4+6B2cpGqAYQ4rJhA9puJdrk7dJ9X7Oqt
         OS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719928257; x=1720533057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SrlODvQi0EtdNm1syRQN2fRh4MhfAwRKmpFe7v0fa1k=;
        b=wePyUrX1GTxkpgQi7oH/2v72yIuIW+5O3pbp7lBC89Xa9dORKqeCdGHtlknS57oWi6
         DmzrKmplaYhuHduFzMam7WVuguKWB4w8ETF2rDrK5lT0fs71nAN2dro/MPflkM20bazQ
         FPPJykW+LRkz5gUFPjavLGJ9WHMG+9M0xbS2uru8WJJM1o1fM5U0Jar6CnXQIQrjdoQB
         6lbSXGDVzes3aifOPRQqqxeO0otlPVSLisErsIIvQyTGUySaTUDPErtzt9zkr0nQRSav
         KGU9wuNTbzPsec0d+hAuwnbM7Ky9LrvBRIsVD8IyA4XSQ3C/eT4Wbx9nz/f7pGXSUR4W
         yKqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEKBmrPdSpj2Fad+k2v7a4cjlzMBqlyjweCdW5UQB8D8Cc5W0D8n5IB2KuXX+oZN7ipdY2ZGexaLDgZz5l0iPc5U0Ni4GYsNAk
X-Gm-Message-State: AOJu0Yz4je/+tgrZ7MrTrGlFCZyhaCD9X9VQy7yyq4TAcB8urMmV+vgt
	q3QK3C6sQ4XhCKZs7mkiQ99tp0GdA3yVWcPjWerDUB6BWNPUIt0bP4huQ4SGicP9mwelMHBUqt3
	SpzXO4Bxs5NwhN60m8ujEMZmAoltybh6m
X-Google-Smtp-Source: AGHT+IE3RCoiDImI2EXmaJIgA5eXEz+qAdJVxv/rtR/+9EXKg7PJ67NG/dkNIBRttNHJSUEOOw55DvRp60PbUQAj/4o=
X-Received: by 2002:a05:6000:928:b0:364:8e3f:89f8 with SMTP id
 ffacd0b85a97d-36775728c6bmr5375535f8f.67.1719928257395; Tue, 02 Jul 2024
 06:50:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a306a653-b6cf-41e4-875f-6c520569b1fdn@googlegroups.com>
 <CA+fCnZdZ96yW5tRfm-c1qXWfmNrVg9J1Yb779Ryht6M9v9FQbQ@mail.gmail.com>
 <612f3eee-35fb-4888-b5d9-c17c223d40df@rowland.harvard.edu>
 <CA+fCnZcrn1sr-sMbwk6i5RDMMh3q9TpBgkGAN+4cg4RaCo9S+g@mail.gmail.com>
 <28b478e2-4b17-483a-9584-0e6342677ef0@rowland.harvard.edu>
 <20240628211140.va5ghcr65dl6g323@synopsys.com> <4539c3c5-61bf-4b4d-9391-a041a2a08b57@rowland.harvard.edu>
 <CAE=33HWobLgdhx3nWrQGqcsVxPBK5zDxO4pL8YAOaPW1wTs09A@mail.gmail.com>
 <21f8608d-8df7-47eb-8400-9a5a2165f57e@rowland.harvard.edu>
 <CAE=33HWsS02CVmasLjOiNjXOv_jnrxkkjUuhGLqD+iinohrY9w@mail.gmail.com> <dcc10e02-ab6d-47e7-ba82-9a740b9d110b@rowland.harvard.edu>
In-Reply-To: <dcc10e02-ab6d-47e7-ba82-9a740b9d110b@rowland.harvard.edu>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 2 Jul 2024 15:50:46 +0200
Message-ID: <CA+fCnZeuE0OohDK9Mm_oUWabaYZYUzA55drk3rqGa82P-v0z_g@mail.gmail.com>
Subject: Re: Remote wake up in gadget drivers
To: Darrion Ramos <darrionramos@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, USB list <linux-usb@vger.kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 3:59=E2=80=AFAM Alan Stern <stern@rowland.harvard.ed=
u> wrote:
>
> Oh, sorry, I got confused.  For some reason I thought you were using a
> device with DWC3 hardware.
>
> Yes, the dwc2 UDC driver does not implement a wakeup routine.  So either
> you'll need to find someone to implement it for you or else you'll need
> to switch to a different kind of UDC controller.  Do any later versions
> of the Raspberry Pi use DWC3?

There are some mentions of DWC3 on Raspberry Pi 5, but the official
documentation only mentions dwc2.

I believe some of the ROCK Pi boards use DWC3. However, I failed to
find any clear documentation for this.

You can try using a musb-based device instead, e.g. BeagleBone Black.
musb appears to support remote wake up.

