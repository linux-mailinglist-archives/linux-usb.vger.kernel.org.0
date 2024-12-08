Return-Path: <linux-usb+bounces-18234-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 498A09E8770
	for <lists+linux-usb@lfdr.de>; Sun,  8 Dec 2024 20:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07858163FCD
	for <lists+linux-usb@lfdr.de>; Sun,  8 Dec 2024 19:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE9054279;
	Sun,  8 Dec 2024 19:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="N+bpro1S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205559460
	for <linux-usb@vger.kernel.org>; Sun,  8 Dec 2024 19:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733685320; cv=none; b=a4pE5ZscHraTGriNJSLoBffSNQ5e9wZGCrC7IjyEEICICokZDrFz9S6sHFWlAwQF/lpxRvp12P3UGsxDCdKVCxGPfq96NjIYz2MKuAuSBhAtR87unMRvGzxMOvSioPonl0w2bwcIrDQWrUZRyiSHJoNM9aQCX9BGL5YvzBsnzzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733685320; c=relaxed/simple;
	bh=FZK/XyAv+pI8hWk4g0TOdGFaoSvoa8YGINgMadjPPOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tchP9WW0UG7bxWXaqVcs30xwNFIUByBCGpmAZsyl1mXjZw4RzGgtbPNgu+GBjT43Zye2abRdi+lxpj04Xbq1ezs1CrtilVDzY0cG0VY1qrLnyoDp36PgaWv51ozSOaBcJimr6LHKnk3hm2Plwe7slwjkCiSNEYa7x9ifMO5/nGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=N+bpro1S; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa549f2fa32so708132766b.0
        for <linux-usb@vger.kernel.org>; Sun, 08 Dec 2024 11:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733685316; x=1734290116; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsIgRNZ3oPlIDNdYe6p/tFTXkJgIdpb4uburjF0KYsw=;
        b=N+bpro1S82vXqPGK5NhoCjeKFXPpUz66rgV0ljhQubdUS8qWbLVQ/C66I1aaBGSC2X
         4lkYE4fzUB7ekaRK+tusN462wcEFZ//9vJ3jbFm8l4S8F1MyWAJDeFiM1eNzgHRhmclz
         9N3NzMS/rXjdZnxQxrwvACan9Vj7LJRsDRVjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733685316; x=1734290116;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZsIgRNZ3oPlIDNdYe6p/tFTXkJgIdpb4uburjF0KYsw=;
        b=HM5n8ZhhT07gCCCBbcCqjfIIxDTHW3/ux94lYJ8haH6YkAvxND1/yO6rxCF4ncY85I
         B34XlVb8m24BVMMtpWI9EERR5sNJF6sgpcIE0chsb3g/wHmbfSTRFYrTptRCClKLbTIU
         EoEHcLomKnQNITQAmWeHpfB/4jQXKi8/QtZ5OyW0hYNr+P7S0MbTwBKfkMj/5vlj63kE
         zA2R7ebxIkFW8fiSdzRE4kQ7X5FNdc0BSIDju3tCmD5RkKowtd9MiXpcY4efmC/7z8V0
         0zocGUxHpOw0ALmBsZEqJpTcjH7k8dTIP0kNeyu1xSmXA8a2PGNcEtKyRIdNNNgBczEc
         rZSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ35NQTxmQfKjzvtZGcjCh7lIDGMX52jQS4TU+Kv6ZnGS7vJ/aQxblWjf3NCjiLhTgUe+mAMHmjZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YypBelYzlqdxz8JSE5p8NGqsMHqljEc4sAIS4k6auhyr3D2KCyi
	8UfbUpCy9LEO2vUXfGALKLPTTxollW91exrRcu0bJUe94xUocUrw8r9o1hC2V2wm1ntz+ETRqJ2
	mmRhCvA==
X-Gm-Gg: ASbGncsgEE2i6mNHKoRXx+8teX5oVOQAFmm1v6ethXj/AGUJgYizw36O0i76xtkH1aA
	CG6gFxb/0FeOBf+mRuZb/DeFEZcansCqLmtu0JMjav15eoCLnoWm1fRQ0amE+A2kvUweiG/l+VE
	iDCZZO0lvAv48UUAqctAWT1ljxTtBEz63eAN6NhbP//HJvpT8ZDWidtm5qaypMBNOEruMj/z8+R
	OhjZ9VCqvUIlwSw0er9GG+g0ka4FkAE1ww9K+PhjLiiwmbgT0mfccVu2/aNuzyOy04UPW6eEi2y
	wLoAXovkOzsHVY8T1fKOOU3r
X-Google-Smtp-Source: AGHT+IGbeYGUdknkHNoJP4/yI5TYUa8Jw+uAzhZ3RKNxpmffYH89kQXxPZ9+g/JiSf/2FPK/SYhpFg==
X-Received: by 2002:a17:906:4ca:b0:aa6:312c:5abe with SMTP id a640c23a62f3a-aa63a266610mr1045596066b.58.1733685316078;
        Sun, 08 Dec 2024 11:15:16 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260a3ae3sm565069366b.165.2024.12.08.11.15.15
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 11:15:15 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa68d0b9e7bso10711666b.3
        for <linux-usb@vger.kernel.org>; Sun, 08 Dec 2024 11:15:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWK0eu8r/7HGWT0SUDEn2++ebGi27GhiVBzHf1qrvJqO7TBxm9KyFWEkgHxRKHfV9YmlEF5TXdjNa4=@vger.kernel.org
X-Received: by 2002:a17:906:2191:b0:aa6:df1:668 with SMTP id
 a640c23a62f3a-aa63a21f8d7mr780857766b.39.1733685315100; Sun, 08 Dec 2024
 11:15:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=whPKnwZbbAp1MjogDP1aDYrCmQ63VC82+OnsLKy9M+gvg@mail.gmail.com>
 <2024120802-unwashed-repackage-5eb3@gregkh>
In-Reply-To: <2024120802-unwashed-repackage-5eb3@gregkh>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 8 Dec 2024 11:14:58 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgBm_x2EfaSHvSL3otbcDbw06XW2j9EFNMK2_8XoMHYqA@mail.gmail.com>
Message-ID: <CAHk-=wgBm_x2EfaSHvSL3otbcDbw06XW2j9EFNMK2_8XoMHYqA@mail.gmail.com>
Subject: Re: USB: workqueues stuck in 'D' state?
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, USB subsystem <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 8 Dec 2024 at 07:51, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> I can't duplicate this here running on your latest tree at all (it's a
> "smaller" x86 box with only 64 cores.)  So I don't know what to suggest.

Yeah, I suspect it's an older thing and triggered by some timing change.

I guess I will try to see if I can bisect it, but I'm not all that optimistic.

> Are you using any USB devices on this thing, or is that just for
> internal connections?

All internal motherboard devices. Mostly the usual random hubs, but
also some "ASRR USB Ethernet" and a "Multifunction Composite Gadget".

I assume that's for the whole management side.

             Linus

