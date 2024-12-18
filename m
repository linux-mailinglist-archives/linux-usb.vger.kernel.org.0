Return-Path: <linux-usb+bounces-18633-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 850B99F61E0
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 10:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CC881881801
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 09:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7269418858A;
	Wed, 18 Dec 2024 09:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M7nTJv6Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342D3156669
	for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 09:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734514559; cv=none; b=c07cohFYUPWkJd0bHxPvTe3RoPHUmaa4rR+HuF47v4i/BicfP0mV2mMRXJKrTA3sK6x9Nwl47eLen+wRpFMQT5xjsPNauHWE7FyQgl/2A1H58QxL0pAaOmPt1vKIwaVH4e4OSOGtpM+6EV+VxXynR5PZHgSJ3ErOH0x9JaXgHNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734514559; c=relaxed/simple;
	bh=FJq1pYapoccia/BgWigddIl2gQuB1ofXOmvP/EMzZEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmwtSbFWG7zyA90mtkz1J45U2u1RsbKA+GgVNtTkJXhq1+i5tH4QL1ZDPV1Eg3Y1WJIjQlneWH6OBX2Pjbu7G/JXln9Rk7I2keJ058/68T+l4BRaaxtO/CqGAxFvAEXw8ino/CGMor3Ljqh36sK+pZteyj1H+TgQTLGLsCBtrTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M7nTJv6Q; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso912351566b.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 01:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734514555; x=1735119355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3N9Pq3W0yA6vyS5UgH7SSPLqSJKsQrk0GFj7xmOShmA=;
        b=M7nTJv6Qb3iqETkPf4KivlUNm8joSDRsKxUbd5z94Uoh9Na8yoHr3jXE8v9m8t0LD7
         D9n0LW9d4flka62SOtftChLgPgMCxKDKfkC0mi3IELjhqktuJMcd51dacBW5vz+jqo4h
         2sMq3FdiK6F0QJijm8bDLYskfoeFxpAJWjP88zfMT1K70oe7EV/MsXunQWKnpSNUpE1L
         nit4BxecQTUjzAvq2dgjK4htCtB+Gj9f5+6acNSjm0dzJSlu/K1vI+F3+oBr8vCmEt6c
         EN0xnI/HwB8JGdFXj/N5WvSNrp3QbWj10VDWSyiY2OuF6mD7BoVFbyTeVAKk64/Q7d91
         KO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734514555; x=1735119355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3N9Pq3W0yA6vyS5UgH7SSPLqSJKsQrk0GFj7xmOShmA=;
        b=YXJiqEGZ6DYvbqHXVltg0k5jvtxP0HZ45B0srIDGLZQAxj8DkX+wpQUOyJQS4IHBTw
         hHt2e7+crUBQv8DiTw4aqV2VGUjwiXCoNmNTH0+HWn97cfKcuC/W3NVVbLqiC88jcuXF
         Jy/+3PM+9OWe8zEq7grivx8NP+qYqcuVmp/t8S5B9GAqyd0cMLHBEpWXF6n7MOGslxl0
         nJA5y8aVzM5YW3DGU53BACcyRF7jCrxzgSNPKMNBpjog4t9P3Xls0FBynREdRO2QWT1X
         jClPzjHo1BiQ19+XdUzhYERZpB5SzfFWkDbGGLVZza5AbvDSOnBTYbxPKu6MPgUqMqQR
         YJ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3ksQ/2APwKGVcdzOSrTaY/4kqpos3HjRLt4Ixa+4hGX+slqtMjW2AwDm8r5wMPg8Hsyj8Pe4InYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUREPoQifDNc1D1xZxt6mWvbYeeEcn0ON2fnW+175Sst9WJ4sh
	I7riUnP9rVYUX05+yMyYbowJ7Qa6/zOWxWrf8MKqT3b0lNCnv0kLn50uV+5l/b8=
X-Gm-Gg: ASbGncv1XM7gRbO6s3BTlgmtxQjg+jjq86OeKIlVYljx65whvfZqpdG0292qy1ifRTZ
	lysko2iyAHHvyPQA0KswvxagDFxjxl8MPbUS8yMG6Kcrlp7TfX2Lv2dKpTS3KExf8kDGm87YEP4
	Turq4Pwh/GND8qzSYn4ASwtpb6AHpMPSDq30p8sNsu+bRx8jn3L1jxhjj5PZY41tOIqJaM15xMl
	HCRjLeLAF6kYI1GHPBa4/+c7Hv/gUT16hAsySG4bDx7F+3bHU6e2peMVkGP7w==
X-Google-Smtp-Source: AGHT+IFaGu0nRcRN0hBkf3tpYx1H1DRFGLVAT0p94ikyhVxYr1CI3Q0jpFhyrnZ85QBDos4sy3/DvA==
X-Received: by 2002:a17:906:3b10:b0:aab:daf9:972 with SMTP id a640c23a62f3a-aabf4787284mr163782066b.28.1734514555568;
        Wed, 18 Dec 2024 01:35:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96068928sm538861966b.70.2024.12.18.01.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 01:35:54 -0800 (PST)
Date: Wed, 18 Dec 2024 12:35:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, emanuele.ghidoli@toradex.com,
	parth.pancholi@toradex.com, francesco.dolcini@toradex.com,
	u.kleine-koenig@baylibre.com, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 1/2] usb: typec: tcpci: fix NULL pointer issue on
 shared irq case
Message-ID: <3f6167b6-f3b1-46d9-b436-ac4e7b42a7d0@stanley.mountain>
References: <20241217091208.2416971-1-xu.yang_2@nxp.com>
 <5260fafb-0b1f-43d5-83af-a61b3b179a1c@stanley.mountain>
 <20241218054547.bbbpvqledrul343f@hippo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218054547.bbbpvqledrul343f@hippo>

On Wed, Dec 18, 2024 at 01:45:47PM +0800, Xu Yang wrote:
> > > Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > 
> > 
> > This commit message was not super clear to me.  It didn't mention that
> > it's tcpci->regmap which is the NULL pointer.  (Obviously there are a
> > lot of other NULL pointers, but that's the one which will crash).
> 
> Ahh, actually tcpci itself is the NULL pointer and kernel will crash when
> get regmap. Because if tcpci is a valid pointer, all of its members will
> be valid too. Anyway, I will add such info to commit message.

Thanks!

regards,
dan carpenter


