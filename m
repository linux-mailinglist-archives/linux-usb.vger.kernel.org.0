Return-Path: <linux-usb+bounces-24214-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B02FAC0642
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 09:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 498113B1B7A
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 07:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61EF242D77;
	Thu, 22 May 2025 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IakceOWH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D349B24C077
	for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 07:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747900498; cv=none; b=FegAbeYTF45Qjpyf5sslCQ8gHv+gj7nAOLWpSLdHi9oQR0aboUksxYFpSFLngQIXlpuRdZ4kyqAlogqht4SE6OW9Ss0+96uyo8Z2HojrREjjJ+JnPemlrE257uh0u/5GAFGjjQW0olSWkzFSYL5A0KJDkM9M0SuzxLJBWlkwR90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747900498; c=relaxed/simple;
	bh=LoKwRXUy4Hb7r/Q/RXZMdK+BUMPhBxS8sOlRP3SqSL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uQRUL5Q5AYnpiCz/qrVBTcsSSB2zjRq35WcQonzOAHCD5os0GzkICXIdyMtuYhhqC9tlcfdGAc8HPerIAZ3WcE+You+cLj3tqEAHXVTTyxGaqNV1Plam6/OHiGUL2qjJTB+1n8nN/XLjbb2OrzQoEg3NbJSbHGUxEbIPogx7AAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IakceOWH; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f8b27c2d7bso80275266d6.1
        for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 00:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747900496; x=1748505296; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FmN4ay/hTJ5Hy4PYQfunHicUBRRCC4gY7pvtZkhaJl8=;
        b=IakceOWHvIkJnNC7Pu7U8TD2gBxYYesD1LEwv3HXI7r4GY/jLa1n9dT6N35iNMLafS
         l1f9g/bRFdMcCfKWzuOocnbFrKqqASfV+ybjd8T69F+ccOZfLwezhwHtBwSEYd3GcCWE
         FW14qY7L+ASB2jRo4nuyVNZ3aI96i7d7RUMfT24ZaGQLUop3dY85Mdo8DOYyKYRiDOIA
         sNHqMqTxj1BY++X8OP7Lp2zHQiqHoscEeMCjusW9xQX6ZbsYxXLks5qMhLI1gOkF96uh
         xG4wB+su54cdZ7FP9av8MtdSw5aZZdpwuWLOFqT5wwjL4y0ZJcULYfwZsBDjvyaloFa6
         i0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747900496; x=1748505296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmN4ay/hTJ5Hy4PYQfunHicUBRRCC4gY7pvtZkhaJl8=;
        b=mBZ07FRSxa+pbkiOGFXnsBwkea/WBESRtThSby00pJfqSrn7B3ezIGivgDK0VLYaKa
         HnigknFHXDw2ZrbBl7CEcenHdonqy8Nc3vFCHT8D7hOQFdXB7A88PxKZAnRU7ypSXAZi
         Nd2AaF9kq4iu464EQWs6xB1XU6YtjG2HLiiO+x44bagoJEKm095t3VTYHLviPKeeaTfo
         3gUHhzNxWHRdyIY4IdDmp6egTFK23MpcuKd/QfTSOob+f5Xs+m6Brjy/xbQ5f70A6ceJ
         +JknYmfAknZR7WkAYNTpJ1urzhfBYxXdRj0PxdFcY46vWLgmfDg43QQL9rZWzKD9C2uq
         mV7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQz8Xj4AuE8MgAnl+srV7QRHEJsAkQR8qXZhmqUn1t8I6U2Lambam4cCOHzZLs7JJuUwdM29pv+qY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXLcCCCcVjKMZ565mo0qcGEY8e2Zx6astCryhhf77IOgEpbl6h
	CxuW2PiqBlsK85KHnKcNbqJnbuBsn2Bhb0Ueg25XNlpBYgFv25GXPHok6TyQKMMez8ZUKBMpuZQ
	iT2liOtSdd8E/GF5/pUblZAJwIbaB5vva4rO/Lys=
X-Gm-Gg: ASbGncuO+CEtZJU3ROdACaRbUo36op4CRcTGJMQQhs8KwU/ywOznfytkL0KBlj7O72c
	gzbB/6uqL7jmGoS7nlZFLzPF0qXt8zf4XlVQi5gFdjO5VmpvmrCFbPrN9ONHqsjqG9jPndB0/1W
	coO7E1hJcDOUGE2yWufQ7Xh4t6MpgJbjhCHMAajtrPOy6n
X-Google-Smtp-Source: AGHT+IGBBM/zN/rYwYkq2NJmGpkQa4P721iESFsbgZ54Qw4WFh6PdtgzZmb6SyV7xfkkl+QzckhTHTt3psn/BGa3n7Q=
X-Received: by 2002:a05:6214:da2:b0:6f8:aebb:71c1 with SMTP id
 6a1803df08f44-6f8b2cc7891mr371925006d6.4.1747900495658; Thu, 22 May 2025
 00:54:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521132354.1104-1-charlesyeh522@gmail.com>
 <aC3u6uCMin_0SXWQ@hovoldconsulting.com> <aC3vf5l4WacJcykH@hovoldconsulting.com>
In-Reply-To: <aC3vf5l4WacJcykH@hovoldconsulting.com>
From: Charles Yeh <charlesyeh522@gmail.com>
Date: Thu, 22 May 2025 15:54:44 +0800
X-Gm-Features: AX0GCFsB-eDxe_NEWC57_mS-DG4WysDm7MkGMPPavDeRVsZhG0aPafEWLQNArGg
Message-ID: <CAAZvQQ7=UueHS_jbJVsiKMm+kf2cTW8gqHXvr44dbOdYLMgqqA@mail.gmail.com>
Subject: Re: [PATCH] Add Proliic new chip: PL2303GC-Q20 & PL2303GT-2AB
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	charles-yeh@prolific.com.tw, joy-yeh@prolific.com.tw
Content-Type: text/plain; charset="UTF-8"

Hi Johan,

> That was supposed to say:
>
>         USB: serial: pl2303: add new chip PL2303GC-Q20 and PL2303GT-2AB
>

Thank you for the suggestion.
I will send a new patch file later.

Charles.

