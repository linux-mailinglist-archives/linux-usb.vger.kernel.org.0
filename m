Return-Path: <linux-usb+bounces-13725-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC4F958553
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 13:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 692C3283CCF
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 11:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF3B18B497;
	Tue, 20 Aug 2024 11:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gY6pOvk3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8B3158D8F
	for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2024 11:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724151728; cv=none; b=Hytmgv3XSfeacBbumLvHPHyB6ruFU1HPWISo4JIUsvMVx0pz7g2+nVK2yctWXhodrcTBmE3LV6re/SB2+w+0KBiyo5WLwDXnpI5fVt/ov0ma6O/iQJS6pSHgIx2yJZu4SS2//c2AVAStA1VnJ+x69vLKI9xBD6Oo7yvalRFPvEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724151728; c=relaxed/simple;
	bh=R8eqTAsyNbEdNAd4MQYKwZBnMmMVIm/ciWPbck58jLY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=Ea5VbCAxjWk5e2x8881IMUo8bAyBFP6gxxHXQ6wEGJJ7ueMVySiZRET8XP8sJGTYoepf0+HG848ZlKxUTLtiFz+2k37TFceADvafXB2xUrFbt0xSlXsFq9qzdsomVtMvEnEA6Ly2QRZDzOJbPolNNQ34T8FTy5FAfUmJGW+WH7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gY6pOvk3; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f3f25a1713so2162431fa.2
        for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2024 04:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724151724; x=1724756524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R8eqTAsyNbEdNAd4MQYKwZBnMmMVIm/ciWPbck58jLY=;
        b=gY6pOvk3KASS+pYA+NihlRfsSBo9S+LygJ4+tVPj+GFAbJCcRRu8O6eQYzv/HWxKTs
         B0L+KllrpFXUpnhN+L2j1AiEeSZqhj1XN7qozVd3i3jERWbmr/hfP1yd6C0OhaZdilDd
         kH7TbdvgxraxlW/I7E1ZiyY3AC8+XvAyLXd1ssJ6dwv2oxeUwt5bxzxvdARh0nb3Qzr+
         /bNK08Vk30+72pqYkUQ62S7NdhzMUjoQyg0fYPYxHEtM+VWieBmeBnL2jZ++JzjzplF+
         pFiUiTLVmV2nQ1Vcm16vLeMHHovlhAPPSYHFLaJYcOWk0va6n5Cj9EUsWVx++7lpT7gS
         PPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724151724; x=1724756524;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8eqTAsyNbEdNAd4MQYKwZBnMmMVIm/ciWPbck58jLY=;
        b=L2sb519AUh9MfYAnSHjKbxbd6hay3PLNvqrS2aqYmkOmK/aYV12hPSGAavxh9xJv71
         laqroExvjbtjWp1sj5NP/ljvAAurY+DWoDLYYB86Wz88byffKLbekmXXHDKqnJ+wu7pv
         ePTCcQ4/l6kmq5rKX1tN6Dksvdn7vmGNrXOu4CaffTa72Hhk/YEXtazgz36ziPS3/EqF
         WEaOZnRMWm6lniOg1oqY4CcTEzXD8fgACXZnJdBT37II4jfagTUUNWf3uLlrtB8H3HUD
         nzTtw+quqQs2x5vQy+eujw62TnU9xyuJPrmWFezacTyxx6sdeXHmZZzv8s63vVJla6WV
         MB1w==
X-Gm-Message-State: AOJu0YxEFN+X4Mlx1ei1u78GDHu7TgNOuA09DT5zo2RpSUepYhwRdjSg
	VsWDzg9Q+nybdh0twVG8Eghxsj7iMvpEX56DWIzYGMf4z3MkSZZJ/yvrGw==
X-Google-Smtp-Source: AGHT+IHrwCOCpIcN8dEhqMR7XoXtm83cIggZ+4IA1Csh0BrfmESd8TO2ZwitmAHNATgn29hycyr3Pw==
X-Received: by 2002:a05:651c:2209:b0:2f3:bfcc:245f with SMTP id 38308e7fff4ca-2f3bfcc27dfmr94235051fa.32.1724151723866;
        Tue, 20 Aug 2024 04:02:03 -0700 (PDT)
Received: from foxbook (bfh246.neoplus.adsl.tpnet.pl. [83.28.45.246])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebc08140csm6640220a12.83.2024.08.20.04.02.02
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 20 Aug 2024 04:02:03 -0700 (PDT)
Date: Tue, 20 Aug 2024 13:01:58 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: mista.tapas@gmx.net
Cc: linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com
Subject: Re: Misbehaving Alder Lake-N PCH USB 3.2 xHCI Host Controller
Message-ID: <20240820130158.339b4d87@foxbook>
In-Reply-To: <a3bcbff4-1e68-4856-bf27-aea3e71298a2@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,


I can offer a few quick suggestions:

1. When kernel bugs are suspected, try other kernels offered by your
distribution. See if there is any chance that -rt paches are causing
issues.

2. Does any of that go away when ALSA buffer size is increased or is it
always there on this machine?

3. When posting wall of text errors, start at the beginning because it
may offer clues about what originally went wrong ('dmesg -W' helps).

4. Playing a tiny file with 'aplay --period-size=48 --buffer-size=96'
is a simpler way to reproduce the problem and generates a shorter log.


> I have to note that these "WARN Event TRB for slot 18 ep 1 with no TDs
> queued?" were there before enabling this dynamic debug feature, I just
> forgot to mention them in my original mail.

This particular part is probably caused by our failure to properly
handle the preceding condition ("underrun event still with TDs queued").
I can't know for sure, but assuming no hardware bugs, it appears that a
new transfer descriptor is queued after the hardware reports a ring
underrun but before we actually process the report. While processing
the underrun we are surprised by this unexpected TD, then we see that
skip flag is set so we erronously report all TDs (most likely including
the new one) as failed to the audio driver. Meanwhile the hardware may
execute this transfer and report its completion later, at which point
we have already forgotten about it.

*Maybe* this creates enough chaos that some sort of infinite loop of
cascading errors is established as a result of one recoverable error.
Or maybe your problem is elsewhere and this bug is only a side effect.

Are you able to test kernel patches?


Mathias may have other ideas to try.

Regards,
Michal

