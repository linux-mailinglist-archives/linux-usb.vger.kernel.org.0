Return-Path: <linux-usb+bounces-21665-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74858A5D3D9
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 02:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEF851796B1
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 01:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D278635B;
	Wed, 12 Mar 2025 01:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=one-eyed-alien.net header.i=@one-eyed-alien.net header.b="o6io00gU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AFE2F24
	for <linux-usb@vger.kernel.org>; Wed, 12 Mar 2025 01:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741741757; cv=none; b=TZrybecHe0eZJ70z3fPnDHOGHuq0ogRpQaX+MTnjebD++oy0OOMY4j4XGJxZ6IqDG6tDNFcdAmuNUrEC81NhOrcZB7FPXCQzC4/gg56jHa/DiYbfBlYDNjlhl4S4fbennRAEirxkoT6LskqLR7cBhge4vdr5fHlpGvep5lB9Yrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741741757; c=relaxed/simple;
	bh=8v10IauO9+ZYWShfiIg8lWU0cAyNhQMaXPvPDC9VdPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTe+juVY40Lv3h0kIJA5y18IUYgg1IBKg7qpO6cIIWECXPPcdiuBWXyj38uye6Tpug1BlxfubbPO08OGOitgm+pLnMupisBBMIyi1IfnfvOZ6aYngFZF89hQoN8GYyjRHmir9gdn9NaHKLps6odx8AqE6urCgJthL7tIkfXFNzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=one-eyed-alien.net; spf=pass smtp.mailfrom=one-eyed-alien.net; dkim=pass (1024-bit key) header.d=one-eyed-alien.net header.i=@one-eyed-alien.net header.b=o6io00gU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=one-eyed-alien.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=one-eyed-alien.net
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so36719695e9.3
        for <linux-usb@vger.kernel.org>; Tue, 11 Mar 2025 18:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=one-eyed-alien.net; s=google; t=1741741753; x=1742346553; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MA1s+CFJcoptHGHTr4whY7uZy+Mb8KOq82ve4XvNd6U=;
        b=o6io00gUxRHmtE7NO/pMvwq/rJ2XppfTXupRns3Fs2A9g5ug/HR5bIXfrKiErix2T3
         Upnx1WWjESXB1wuQ6YXs3jeqeJzyWL1f7ZPp8zncwxzo0b3r8ysoxskiqOfaiOzHHw7e
         RNXkS2V4bwurkLqUUE4n0wJYtyknxiB4xWQSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741741753; x=1742346553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MA1s+CFJcoptHGHTr4whY7uZy+Mb8KOq82ve4XvNd6U=;
        b=LkGr3aDs4rmw5JRDH0WLZY617m5aVW+qZzsVfb+6eCQQ2gpfeAwXKSOnDuql8Q4Myw
         I97rXhagLbdLuveOpy1uNyIPvYnVkkHWKA+Ph2UKsw1XPluU0Fjr5Of1+PMzMTa2/29v
         vUxMCzl0MLtfvWnS8fBuBWZuZEe6AbNywo4K1mRJ57Kk0sdQ13CaUS9tjZ/aZWKDIzJp
         K7Rfoncek13PhbixevX2rj8UG0bk24moRJlYvS5T9EsaatVlR2UYL2v2umE8IrWKvV9G
         5nQ8CkczfBvyUGxI44s8bQvLWy+LbUQOUJblKhQWRlsmLlabJ7d7dRrT7rTD7prNg21g
         W16Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvLl9Z+2csZRA2pAbcXHx73pOubGuNzVv85XQmVv9KVgP2XPAIfoYWO1jsdpt9yfVrb4I/aVZaYgA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl5ZcryYh73LLU2MxaW+PxCK8uJHwAOEqp/QaUaRAIAcmf57L9
	ZR2/uOrKnNpNAnd17CIkPseg5w6prKsLrZWrP7NXAM8b5dCVak32M5EyfvfBp1eqdZ9N+6LMHrw
	d6G0v8UFATXfugT8uq2hcmMPQ9gTf6/kgPrX+ew==
X-Gm-Gg: ASbGncv69EceeXFAnJJupknOfA0yQnVE7UjkIWlfhoEyPq+GS8j6S0F/XgTMXuqnEpq
	cAqHETuvhodhpFiG05UhBDd/FGnlcSQ5p66yuGUo1mxOivV8Ix3RbTKj3P4j63bxi+MRnUF+zkC
	iCUuP/0mhdfYx0nRz2xJQ4rbc=
X-Google-Smtp-Source: AGHT+IEzF0ireum6/FPbkjs402SHBM0UMUqmkV5EVVKUF1OpBtqyx/4FZi728uAGKSmhUDjUErnfEpjvsDzmXXOOq/s=
X-Received: by 2002:a05:600c:198e:b0:43c:e478:889 with SMTP id
 5b1f17b1804b1-43d01b85209mr71117685e9.0.1741741753407; Tue, 11 Mar 2025
 18:09:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311084111.322351-1-daixin_tkzc@163.com> <6a266eb7-0150-43e9-a712-b9e6fe8c71ea@rowland.harvard.edu>
In-Reply-To: <6a266eb7-0150-43e9-a712-b9e6fe8c71ea@rowland.harvard.edu>
From: Matthew Dharm <mdharm-usb@one-eyed-alien.net>
Date: Tue, 11 Mar 2025 18:09:02 -0700
X-Gm-Features: AQ5f1JrKnODlP4cRLeJ-QLQyz0b3tuL4cGZxHXaD9UPY5m6VAbrBbZF7y7QAN1A
Message-ID: <CAA6KcBDjRPjrfQpYYHtqc6tnpFoLz9QAESqkaOLK5Hi1HbpQHw@mail.gmail.com>
Subject: Re: [usb-storage] Re: [PATCH] usb: storage: Fix `us->iobuf` size for
 BOT transmission to prevent memory overflow
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Xin Dai <daixin_tkzc@163.com>, linux-usb@vger.kernel.org, 
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 7:12=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Tue, Mar 11, 2025 at 04:41:11PM +0800, Xin Dai wrote:
> > When the DWC2 controller detects a packet Babble Error, where a device
> > transmits more data over USB than the host controller anticipates for a
> > transaction. It follows this process:
> >
> There is no risk of memory overflow.  The length of the transfer for the
> CSW is limited to US_BULK_CS_WRAP_LEN, which is 13.  And the length of a
> CBW transfer is limited to US_BULK_CB_WRAP_LEN, which is 31 (or to 32
> if the US_FL_BULK32 quirk flag is set).  Therefore a 64-byte buffer is
> more than enough.

There is no risk of memory overflow *unless* the DWC controller
doesn't respect the buffer length as given in the URB.  If there is an
overflow issue here, it is an issue with the controller level.
Matt


--=20
Matthew Dharm
Former Maintainer, USB Mass Storage driver for Linux

