Return-Path: <linux-usb+bounces-28826-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB02ABAEB79
	for <lists+linux-usb@lfdr.de>; Wed, 01 Oct 2025 00:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 447E3189D90E
	for <lists+linux-usb@lfdr.de>; Tue, 30 Sep 2025 22:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804E02D1925;
	Tue, 30 Sep 2025 22:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N3K9R98n"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2A7283FF1
	for <linux-usb@vger.kernel.org>; Tue, 30 Sep 2025 22:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759272940; cv=none; b=QYOAPvET4mjed1/mHYjy5Ja+VqatWpmu3VrVpG2wlhFByZnvs89yhzOLgInrBIitYXLwrKxHvLQmw4odnQ74Fy8M82Say3Tt9la9tMJM94EVdXAUIS3+9IwamgpoUGdc8FXOIFGk4sNi4sVFHGHF/0BPi0VmwPpud6yPZJ4YZZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759272940; c=relaxed/simple;
	bh=yVA9Jz0NaEGwNdHklt155W5PzrBW3E/ulBCRYzSYVKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MW/VAxzzj0AtgVDpT19X/Ik1FES3f3wWsscbTLBg4d9688wwfgCp8wktNyD99V3fM3Ds6QvCPKqfycuf8n0BuJDmLsm9NroZlJjJrMCv/6MgWfQh7+wLjFIkc4n6lOBkc/qFf8XYsQ8+nT2jj9f2ewknbuRu5y54KyuYB9PhtkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N3K9R98n; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ee64bc6b90so4094070f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 30 Sep 2025 15:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759272937; x=1759877737; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yVA9Jz0NaEGwNdHklt155W5PzrBW3E/ulBCRYzSYVKM=;
        b=N3K9R98nxGxOF7OnWp7haHEZxY0ov7TQ9GKSMdYDU2gI/juQyD3zvWoHQ1utwBq1f9
         GrzMcfiOmQn0D7Mmj5ymg+alkn/QqL6AKSMo7gAQvsg21RYlcc72VZRuQ43yMmrHfzSY
         8coKBMDv4HpD7EOemzjWVlHT0gADklB+Fa/gMYphsUDatGFNIoDnWroUcP74Zr3Jm0hU
         weT9qkNVyFo/TA98OQDPx2z31TgaF95c4OI0DGxjY7lx3uX8WlyQItJYYESh0mSVm5x8
         zpCiye6Fv4oyNMdNxESSpW2YW0QRbWZ+oGwfTJKKLnUPJr3vRFsdAesiXeUBlVlzAYX4
         8zwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759272937; x=1759877737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVA9Jz0NaEGwNdHklt155W5PzrBW3E/ulBCRYzSYVKM=;
        b=MZrlGY+UDew9JX41ItApxJm8F8x3GPB7wClNLSNI/sQYsSC/hEE8q3AGFqTfELs+Zy
         581bpgtQt29YcU++AQWfJcOPv7IH2IF9ON6I83KMaaouQFap61EP16WlKn7yzFFTQV5q
         aSUmTPmd2Afn92L36Bc4Mw1LD+UK6Ew2uwCxn5tzxKksdtptf90S+RuJ5Dfzpd2amCz1
         PuHFuVpLM1m0Mzoz0TYw9Ev2HNI5lCtsu7L6zbMeuOmNcO+atei2dJ0QivhH/TTWylPM
         f/tzrKrF4T5oBG54SvzkJcnbo9XdAcCWvbrG4hA2rYsKIPhqVXp9NqpAW6zCunxIom1R
         VKfA==
X-Forwarded-Encrypted: i=1; AJvYcCVJzjJHBsGXUoT9CUozn3iT3LDjrWHPTD7JL73NzIxQ2blPXpaKYyX1N+ZZrhVb/fd8FWkAhfGAEHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUpBc3D2h3K/XYi4O+0jCobU6UlItcYpH8YimD8W5+Hy4zPK+M
	pyznOoFN8v4H2dGcKDPYFhY8MSAhsx/6rO8yoP9OL1CXlmt5OutKWe/GPyNzU1suZB4TSB5cgZP
	vv4+cZZVyw7xExbtyTGTvas1ZfHdRW3CL9XMZbD7G
X-Gm-Gg: ASbGncvk7EyS1s6TmYFew5XzbAWzbCG0NCayWw2BtacF7o9I/UV+XjyPaC4r/kTkPR8
	g+YnErU2Fph3wh6CulfVDo3QuOOP30r/f1GBaX5k7+T255+dVG5ghVb1Z/uHEsEtvVJFqiVsZGh
	lngqxBBWAF9kb8qr+ofdiYIJ8AAR5lCFFe6C20TAuZTAYdbakoCmtDncHJiwjapLLrw+1vXOOEQ
	Ay7ZHJlbxQ1V0xKFAIhmWnnS9841odszit1ictmwhGLKh1ObgLuZDOyEGNc33k9qcaKWVViMJXR
	TGwH372Qg0K4zg==
X-Google-Smtp-Source: AGHT+IGHRuxtWgut0Vzt6PdinBJDWxg9G0yj04Jszjbv4ItQ3wbJzXeBdiQBzEdeuLcKh8ZuTRqv06sC4HCq3f+U5jQ=
X-Received: by 2002:a05:6000:420a:b0:3ee:114f:f89f with SMTP id
 ffacd0b85a97d-425577f1bf9mr975463f8f.15.1759272936532; Tue, 30 Sep 2025
 15:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250930012352.413066-1-jthies@google.com> <20250930012352.413066-2-jthies@google.com>
 <175920697975.1402374.5817792319376446761.robh@kernel.org>
In-Reply-To: <175920697975.1402374.5817792319376446761.robh@kernel.org>
From: Jameson Thies <jthies@google.com>
Date: Tue, 30 Sep 2025 15:55:24 -0700
X-Gm-Features: AS18NWBGGK3TvBvWwAKJGudm0q5uvJFaU-KF4NSgxPec6eL4jZqolX0Co6k50AA
Message-ID: <CAMFSAReZA3=VH+c2H3xA-ojhBnEEp8wxySFwUuKLq+6k47AA4g@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: chrome: Add Cros EC UCSI driver
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, ukaszb@chromium.org, 
	linux-usb@vger.kernel.org, akuchynski@chromium.org, tzungbi@kernel.org, 
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org, abhishekpandit@chromium.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> My bot found errors running 'make dt_binding_check' on your patch:

Thanks for catching this. I did run "make dt_binding_check
DT_SCHEMA_FILES=google,cros-ec-ucsi.yaml" to check the newly added
yaml file. But I didn't check google,cros-ec.yaml or any of the DTS
files with "make dtbs_check" so I missed this regression. I'll follow
up with a v2 series and test all bindings with "make dt_binding_check"
and "make dtbs_check".

