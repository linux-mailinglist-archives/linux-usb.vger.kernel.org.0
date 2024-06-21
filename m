Return-Path: <linux-usb+bounces-11538-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B346B91211E
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2024 11:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAD9F1C22F4D
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2024 09:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD35980639;
	Fri, 21 Jun 2024 09:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ho4x7izr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A88142AA0
	for <linux-usb@vger.kernel.org>; Fri, 21 Jun 2024 09:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718963202; cv=none; b=kFIkC81ano1tzhuMe74Ox0Opnmdy8KGznsvTMD8nqHiMP7Mu7qgGLo4N9i7p5crJbTTfpMZdmEvAAr09nDHDj3f5xiD4dn4xgxiatGvJ4NJYFzIAV2T3mRctuXiLCN8DgHV2XhgU8K+v8tivnqP3VFoYskqoc1WebgaSkmUz9ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718963202; c=relaxed/simple;
	bh=Goc5+3gX43O52FF+MdHUQBk+ATxefNuG5aakOPJoymc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=N2fYUhpKlSgB99/TY+eZ4mlrnlo9SeQPEz1wvSeLLx+dC97ne/7vNgK8m9PyCSrptRFxGjPrC750Zcf2qzO0IPh4wN5brqt0MgJoZpWnaO53dumh+pMS147IZYHKSOq+eVWMD4K9cS0vEi7QHwuNVaqhipaADgdUy2/kjPZziEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ho4x7izr; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-24c9f630e51so910647fac.1
        for <linux-usb@vger.kernel.org>; Fri, 21 Jun 2024 02:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718963200; x=1719568000; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmvfVBNuDY3KCRN0RggAG4Cbx66bhHqCWS4T7fHf1lo=;
        b=ho4x7izrFFyQWoG4EALv7j/wefTmXXTAOCbDgxnzKKyzJwX8C7tOEkNgAvvxp9BhUC
         yR+Zoe0HUoHcltNnX7KHDpFOxjXJ4jwY2hd2JgX6xxnNkXtAgl5hnhrPqp0NY+ENQrE8
         sehALFW92wfhbQimv+Z48iVKyZFm7evRsKAyhlP7tEz0de+ueFuQZP8Fp8PSe7DBWrbn
         H4pIaRt0o3K/1mI0c6Mno9jcCxMxu/gM1zI6koQYH96wupKj77zT7HizvbfaFSIMunun
         5b4aQPyvOOrs0F4tr2y7h7cHt9JLSkz0AMQbRZRsOhAfnttTxTkmBqsO2dx9F+kbh+6X
         OZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718963200; x=1719568000;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmvfVBNuDY3KCRN0RggAG4Cbx66bhHqCWS4T7fHf1lo=;
        b=v3mTIjY11eGapcaNHslOJUSmRmCI6072gcrFPy0nox5WEkRlDR2eeHhU9FknyHmdod
         IqyiU12H7YQeUZ15TVuhFB6duutVg6yHLAQzdezfErwzW/+2B4GF54sMPyBxqRs8XS8i
         sVG3a1zZv5EN2Z7psinu4GMg9jw80tWMXddQdwvw6CHLD4BKb8TJeQnfD6WKDgbSJWPS
         OOpQq1Gd0B9Rpf4Z7oBB4N17urawmp67xhl76Fhyo9/DOiqb7jeB0Nlh3Th0CHnHNNJI
         gEMZWYIaY03OFq/XTUi3402JZBEVVTaesmA5yNQ3e78J2rCBoB/OyFme4aHB1F29rcIq
         /NRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyLu3tJDDQsdvzBy1eTRvRg1mmyUewrSUTfwUlZOH6X8DDfDItZC74y7rs3CFWaYwodgPm4kxgIuYF6aSl/gnj05PCvP5dzZlf
X-Gm-Message-State: AOJu0YzaRi5KV6iysB5hML1POafiYwSC/Xx/aJdwwyM9pYW6L7z4Rq4E
	uXoWDhMBYuOhpL4fDGOyWyVRJcHudv0fTxVnIgL3JARLygleL3XuczFuiHAL8+SwKfmV1p0z7Kz
	iy0z/vyvKu9/vsDuzRs8Q4pvWfJblgQF5
X-Google-Smtp-Source: AGHT+IGkx5i7qFQLgEHoEjbzN8pmE8QWpuwDGYyJQrHyiBFNpOkmUgUFvrMAUK1fGV9SexkMl7VWOp+R9AfFIM2jv2I=
X-Received: by 2002:a05:6870:fb90:b0:258:37f4:755c with SMTP id
 586e51a60fabf-25c94d005c0mr8938186fac.46.1718963199848; Fri, 21 Jun 2024
 02:46:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALzsdVJ+Dy=z1JGur71CG-ZzoCH6nxbCuRBHVdOQ2bCgiOeutQ@mail.gmail.com>
 <2024062113-open-knoll-e452@gregkh> <CALzsdV+3xCVuC3oQaE4nCf3F6YAOZ1nyYywSzyUW9jiMDVUHAg@mail.gmail.com>
 <2024062124-dish-decade-c5b7@gregkh>
In-Reply-To: <2024062124-dish-decade-c5b7@gregkh>
From: minh quan le <minhquan07032001@gmail.com>
Date: Fri, 21 Jun 2024 16:46:28 +0700
Message-ID: <CALzsdV+J+99x55x7+cioKsBB9Qb76bV_1LFnd4QnuBDfMnsH0w@mail.gmail.com>
Subject: Re: Repo: linux-usb-gadgets / ptp-gadget
To: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Here is the repo link: https://github.com/linux-usb-gadgets/ptp-gadget

Thanks,
Quan

V=C3=A0o Th 6, 21 thg 6, 2024 va=CC=80o lu=CC=81c 16:33 Greg KH
<gregkh@linuxfoundation.org> =C4=91=C3=A3 vi=E1=BA=BFt:
>
> <snip>
>
> For some reason you sent this only to me, which is a bit rude to
> everyone else on the mailing list.  I'll be glad to respond if you
> resend it to everyone.
>
> thanks,
>
> greg k-h

