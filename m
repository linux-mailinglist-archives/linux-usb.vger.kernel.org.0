Return-Path: <linux-usb+bounces-21712-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D24A5EE51
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 09:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF46E3AEA58
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 08:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6568261591;
	Thu, 13 Mar 2025 08:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l00ctk41"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B511F12EC
	for <linux-usb@vger.kernel.org>; Thu, 13 Mar 2025 08:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741855600; cv=none; b=X9g+qcfOxkaSEPlBiZsf6S0LoZZa6h/04ujoc29N4wtXeCC95KxkiGmKzEV/kyL1TUh6/tFAx4EFv0cE/ThDXHJ8dpXNLMFx8wnBUyZXl+v+zWGnMT3xlmjo/iSPdtVbz4W/gG2QKjkjaSFft35LRQTWyI/ATEAd0wPb0StWbJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741855600; c=relaxed/simple;
	bh=IJhKbZ46HUdgequoOZ7S3VAvLd62m3gY5X7MXhzm54w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hMjiGqbP72s4T9Zo4BW0mWkSnXmwsO/9N9hJQ/UdyRNLRM4EryP5zk/ry0ku2BEQNjrFDdO4s+XcSIKeK/1egMC7ktQeccaInU88QxNfpktPEvqSmeJ8MY6eZjSlDIHLmqGI5nXvlyAwUVb6KHTQdxHjGRauQ/iMSjK5Zy0I9LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l00ctk41; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so1339138a12.1
        for <linux-usb@vger.kernel.org>; Thu, 13 Mar 2025 01:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741855596; x=1742460396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDJbwe3YW2DJjyS7bflowA1TQxXiTm4pmssxKMK1zYE=;
        b=l00ctk41IzAXaGVayYkEkHpLDU5PQfnIwH+sN1rECY97/TBHUspllDXjcwNhISSlpc
         Qz6XCEOhccc/l2b/cka8BK2CUh+NrpKO4xlodigK88dvToekLWCVnbCI+whJCmhllwkx
         tmXTZwSUPwGGv+b25x/rFss/cVeVpZPisa3IdcL7REW0kQDYl4O+DyQ7ijRe3NhznC1W
         PWqnj52SniwwBe7el5S4NmxPqR1e2OUxOfQLewn28mDdEkj3trQJnpLUlX/nKayw4n1b
         BY8XCVtzM77aYQGHfqgi72dPc+K4uHN6StJINdSR+T0fzaBh3oE8swi9q6LGuRCUGa0n
         +OXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741855596; x=1742460396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RDJbwe3YW2DJjyS7bflowA1TQxXiTm4pmssxKMK1zYE=;
        b=CG0o4NOxbDFmKFA3ZurJzSJoljK43hdA79JurEBROYCCT2VDV5u5xz8NmO4ncZBhgS
         h6l/u1F1KUr6YYVq7iTIfuvJOO5mz991F85+3Sjdtm2NYnbOvRCAV9vPTQMZgLoUGVKE
         wH5PGdp+qrG1sMmbc25Q7qIcnVf/WmzwEzWG4/V5PwzBW8/qinyV8fc1mQvFQGVO0MUz
         RWRc/2sy4A5dDMWumYkLNquQRgYh7UrsKr1Orq9Gjv39Xp/bEUs9Q3k1ZbVeNHuqgqGH
         1SbYl8y0OlWd628+jqdAXkylkryx346uW57DDnkXiGjVLyVLF4RzDxjgGpFDxFoHeh61
         /7mQ==
X-Gm-Message-State: AOJu0Yxdd/9f0ekRDsuV3wLhdTkx3Mt7dpZKLwAvEGzbR8nluDluJ0Bn
	UFJdSsqbnC9cpFtf7QLU6UOuvXjTKs3YJLjPB70+G0DPiboeWMBHscvagg==
X-Gm-Gg: ASbGncsfUVjowbt5t08kNoQsArpAQ6FRyNh/XHIx00E6uFoLe+1p6ctOuJWNUp3H7KP
	8nM3r6Tz4aUa1nsJRsv7SUBXPx3JNxGMccsvu44oV6gGCEGARFSeCQ2d2/VY9+6LHe5PGjz7GuU
	weGS3/DBkTGyfQO6p9A/tYanVAMucyOmjQTHt7fLzzgUg4rDP839cxbDt4iA9cfsXkrDEay+i7c
	FC1USDA5TW5yPFh0pbc8reEJAI2wDCEi1ci7bBCwIiN3YC4bLtOOxxwzFUaOH34FpgDaZ5PL9hs
	XvdTlqIuDMmnwfUhmdI8Vfe81H1BP0FOQlBH0rEA4cH3q28KMEGrC31WYFM=
X-Google-Smtp-Source: AGHT+IEBQuCQPlfpKBkN+QFaPu81I+en761S22Ee/UpsJBRZ4oDWxHGEasjr+/1ycL4NeHfyjfRzxg==
X-Received: by 2002:a05:6402:5c8:b0:5e6:13a0:2321 with SMTP id 4fb4d7f45d1cf-5e75f987a48mr14686357a12.32.1741855596083;
        Thu, 13 Mar 2025 01:46:36 -0700 (PDT)
Received: from foxbook (adth23.neoplus.adsl.tpnet.pl. [79.185.219.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816ad27c1sm503192a12.59.2025.03.13.01.46.35
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 13 Mar 2025 01:46:35 -0700 (PDT)
Date: Thu, 13 Mar 2025 09:46:32 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, niklas.neronin@linux.intel.com
Subject: Re: My transfer ring grew to 740 segments
Message-ID: <20250313094632.037db6b3@foxbook>
In-Reply-To: <20250311234139.0e73e138@foxbook>
References: <20250311234139.0e73e138@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 11 Mar 2025 23:41:39 +0100, Micha=C5=82 Pecio wrote:
> [102711.994235] xhci_hcd 0000:02:00.0: Event dma 0x00000000ffef4a50 for e=
p 6 status 4 not part of TD at 00000000eb22b790 - 00000000eb22b790
> [102711.994243] xhci_hcd 0000:02:00.0: Ring seg 0 dma 0x00000000ffef4000
> [102711.994246] xhci_hcd 0000:02:00.0: Ring seg 1 dma 0x00000000ffeee000
> [102711.994249] xhci_hcd 0000:02:00.0: Ring seg 2 dma 0x00000000ffc4e000
>=20
> [ ... 735 lines omitted for brevity ... ]
>=20
> [102711.995935] xhci_hcd 0000:02:00.0: Ring seg 738 dma 0x00000000eb2e2000
> [102711.995937] xhci_hcd 0000:02:00.0: Ring seg 739 dma 0x00000000eb22b000

And what are your thoughts about this noise? It's absurd to print such
long debug dumps under failure conditions (and hold a spinlock for 2ms
to do so), and I would argue that it is pointless even normally:

1. Almost always exactly two segments exist, and either
  a. the event and the TD are in the same segment, so who cares where
     the other segment is
  b. they are in different segments, and you can deduce both segments
     from dma pointers so the dump tells you absolutely nothing new

2. With more segments, the dump can tell if there were other segments
   between the event and the TD, but is it really important?

3. It might help with finding out-of-ring events, but this is extremely
   rare and should be done automatically (xhci_dma_to_trb() or similar).


Bottom line, the driver never printed it and no one other than Niklas
(Cc) seemed to really miss such a feature.=20

I would be inclined to submit a small patch which removes this segment
dump, as I have already done so locally. Or at least make it xhci_dbg()
if somebody can present a convincing case for having it around.

Note that debugfs exists and provides this and much more information,
at least so long as the class driver doesn't disable the endpoint.

Regards,
Michal

