Return-Path: <linux-usb+bounces-22140-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF459A70CFF
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 23:36:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7FB13BB1CF
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 22:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131C226A0A5;
	Tue, 25 Mar 2025 22:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqtRmT5G"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F161B269CE6
	for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 22:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742942181; cv=none; b=n/dUqZrhDb3mWUwZxbQ0lmtvWrFZdtrKFBSsK6LrrNOeQal7wmTSttgbomHujFdbL3hs81M4UzWGAqSq4ijzSVXku+7U2iz0sOL0IhUOjzWpr7MPm0sNDX7UrQkjDvdgSlHdTYPnQaNPQ8KZzFITIryQOv9zgOZLGNtf8433/N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742942181; c=relaxed/simple;
	bh=lu5xwqIZhL25Rmi86pMoxAy2bmNgypB/H5v6iXQaiEw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=umry+VEohNb3S7My+pSrUJmAgEgMqjkzp91KjXoo0SJIVIXLwQ+H5p2767ZZYM5u8seiCf92OwVunEejO7at5ZnKb/GAdBknbRFXzCYE+CO/nsImUnt81DvCGPfCYi8OXRLBeDnGLsY+kc7NUFTTRJECPySaUCYkHSU+uLpfaDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqtRmT5G; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54af20849bbso2254375e87.0
        for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 15:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742942178; x=1743546978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lu5xwqIZhL25Rmi86pMoxAy2bmNgypB/H5v6iXQaiEw=;
        b=VqtRmT5GQubJ3uJ3LhEiQ7TcjfnlM6Rsv8hsa0h/dyA8UmvaXLKR/Nm1nN4fZ6WHKc
         q9BEkypf/kTNzG1fgWSQyFB0Kchcuh8ScfOj8msvvbnYldZ8faxE5gK5s/TS3QDwSp8X
         iFy6cDunCkY6V8fHqtYnF+iDXbRxh2p4fnShnU7YjIgrUGYvhAaLrht1hp5Kt5IsQmX9
         pS2spEptbMxRoXtgx06RMCrPGp+eN/DTi5P9eGkJbq9nkdEH+8NM9RZuNci30p/PQGqY
         TplFimNq0GIIt5E93owVuJU47TyqUeRts7UkSmXJztdoGFDK9pd63fSXKmBlghcJ8/ql
         aaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742942178; x=1743546978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lu5xwqIZhL25Rmi86pMoxAy2bmNgypB/H5v6iXQaiEw=;
        b=lBTNo9MtInpJD3LmGnkzMlyMr0x2yNae79HBSfMi4pCDihVBVX14DkBa+FAncLWOSZ
         zOS/8sKBOUitpIJjFGkkZCXSPu8cmG+uImURo+RgpilliPs/Q/Mhtg6MMtoqbt/xMyuU
         wNE6m4P+QiE788E3uICHHwA/MvzIq6aADbWUIFmGrUpEC/r5tu94b7RDUJeIW1u2nfSC
         P2rqn3vkXXMlj37jz1czANMad1/qSVY+KLlW5J2KZSRTceqGuXqtm3erTIP7wHf0mQ1H
         D+U7UnkSJNVKChEW5632TKsxfntu6ViP0/FQeJtm8WZUG6VLHxt4S8H2QdUP8aNXMcyD
         qqKA==
X-Gm-Message-State: AOJu0Yz7jhgtorlG18Wrtt1K/pG9vXnxIN7CybWlEbLkuMh1uqv79tlw
	tlgHUMHH9nnVgFXRTNeP/QZh5iI5kZa5TLUuReD7IHqqhRsbVRg/
X-Gm-Gg: ASbGnctBecPMj/MgeExmqtYxesmxdpmMflFxwQMQHfUtO1aUU2Eh4et3Z6cY775E15c
	PbqlbAnXjvzPKouNif58yb1rwOJvMhRKldlvoOgypqr8GO1P4HCsVrsQti58clTs05SU8NWlpYn
	ismqdmKtMlPBeckLvuTV4dfHYJi4n3RYvQGIsmCOzPhrtuLAeYsq/KuV756EOHDzsvZn1VxWEtu
	WXaECwlGsHAZQYeO/1wNQ5EAfkuB3uZ3GHBmrYMxIE8lJWBEZ1z/+3p+Dfk+qGv7z81LtNqJSTx
	37TBK06C/9238bDg9Ql9cVh7zp+IiUs78BN6JffBctoTMtlrrn+UchAkBvezhvcS4KsjJQ==
X-Google-Smtp-Source: AGHT+IE75TIQdDt5qKVZc3xPm3xgnJE0bXeTYg8DLbCRGPmJ/bjuFG2SD6rg2R9LVKBVBjIUHS3+ng==
X-Received: by 2002:a05:6512:3501:b0:545:d72:95e5 with SMTP id 2adb3069b0e04-54ad647997dmr5786425e87.7.1742942177734;
        Tue, 25 Mar 2025 15:36:17 -0700 (PDT)
Received: from foxbook (adtt43.neoplus.adsl.tpnet.pl. [79.185.231.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6508196sm1617208e87.166.2025.03.25.15.36.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 25 Mar 2025 15:36:17 -0700 (PDT)
Date: Tue, 25 Mar 2025 23:36:11 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: laycookie <laycookie@proton.me>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: USB device enumeration failure after a certain amount of uptime
Message-ID: <20250325233611.118e3a33@foxbook>
In-Reply-To: <MNPMsZnv8AXRyS4mqWaolXZkblyzndGqRmVitU7e5Z4HakEyOse4qfahFpSuU0ApYetf8S34NF26rGgBbwKb-39FBI3Z8o6ElQnzozl_Fkk=@proton.me>
References: <20250325093251.4c5330d7@foxbook>
	<MNPMsZnv8AXRyS4mqWaolXZkblyzndGqRmVitU7e5Z4HakEyOse4qfahFpSuU0ApYetf8S34NF26rGgBbwKb-39FBI3Z8o6ElQnzozl_Fkk=@proton.me>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> > Is this a complete log? And the device was really working during
> > those six minutes before "setup address" failure? Usually, address
> > setup happens once immediately after device connection, not sure
> > what would lead to it being repeated later.

Nevermind, it looks like address setup is also done on device reset,
so that's what may be happening here.

Although now I'm not sure what would request a reset of an idle device
and why. Apparently not uvcvideo/snd-usb-audio drivers because they
only ever seem to reset a few specific USB IDs. Maybe USB core did it
for some reason.

You could try enabling usbcore dynamic debug:
echo 'module usbcore +p' >/proc/dynamic_debug/control

and see if there is some noise in dmesg when the device is idle or
shortly before it fails. Note that this enables debug logging on all
USB buses in the system. Change +p to -p to turn it off.

> I also discovered that apparently if I stream from the capture card
> to some application it never disconnects, or at least I have never
> encountered it disconnecting.

I guess a simple test is to leave it running overnight with some webcam
viewer software or similar. If it survives, and then fails shortly
after turning off the software, that looks like an idle state problem.

Maybe autosuspend is involved? Totally guessing. It can be disabled:
echo -1 >/sys/bus/usb/devices/4-1/power/autosuspend_delay_ms

This is quite unlikely, I think, but sometimes those USB controllers
can break and stop performing transfers correctly. You could see if
things return to normal after re-initializing the controller:

echo 0000:08:00.0 >/sys/bus/pci/drivers/xhci_hcd/unbind
echo 0000:08:00.0 >/sys/bus/pci/drivers/xhci_hcd/bind

assuming that this card is 08:00.0 and not 09:00.0 (or something else).


Michal

