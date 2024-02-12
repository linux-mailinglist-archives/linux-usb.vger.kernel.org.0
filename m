Return-Path: <linux-usb+bounces-6251-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F63851CF3
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 19:39:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B586F1C2245D
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 18:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4120405FD;
	Mon, 12 Feb 2024 18:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mwa.re header.i=@mwa.re header.b="jXaE5X/X"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DAB3FE31
	for <linux-usb@vger.kernel.org>; Mon, 12 Feb 2024 18:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707763163; cv=none; b=pZ+PsbZ7AS4CpDfbpaYIbcsOyQR/ZfVxVtXtKC+JaxLCI29v4V8JY5ps388BtQz1iNOxRxyf41GwNR6nrd5TH35nwPI0F7P1hx8ZoFy8m4odwEZZL/XkXhIL34QcNm6EU9AGN3eMy+qFWvb52wzOocbuBogD53JGuN5uqa3Ub5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707763163; c=relaxed/simple;
	bh=D7HP4oHCZLOV0pggjxN8gRQrvsasBsC+LkaMYccuwaI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=eMx6ZHk3LPsZaxeJgTWq7hFQLzCVuJXcNi6SMPeWyNSzt0g8ld72JW0juG5JpNXbPel9M6FEU3ZFIVn4BQj4pC5iRdJ7CMcbCZrbTzHBX32rNRWa2N+8yZDeFCuFCVEASRX+vGYY1BlOr9+DwrLRCb4DfsWiv0btVE8yrx5Fvko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mwa.re; spf=pass smtp.mailfrom=mwa.re; dkim=pass (2048-bit key) header.d=mwa.re header.i=@mwa.re header.b=jXaE5X/X; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mwa.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mwa.re
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5118d65cf9cso1573046e87.0
        for <linux-usb@vger.kernel.org>; Mon, 12 Feb 2024 10:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mwa.re; s=google; t=1707763160; x=1708367960; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D7HP4oHCZLOV0pggjxN8gRQrvsasBsC+LkaMYccuwaI=;
        b=jXaE5X/XJmneQCai67RjqWsU22s3W51OxKR0xPGk43j3xQVtJFMzlXwkZNH1IbWqed
         NVjwKoYizCVG+keQLF+TDLyZVTpO4WhUQFzpBYpQyAMuZo0VwtwHMw6crJimvemkqBHC
         SE2OdKdEZLZuLuy3ub+ZDBdw4fReYI6W/hWJIuhX7trMAazYCJ1OjQ6LOZkJAgdw7YQY
         zNkyPukcPqhaTDNsclEzJ03pqgsX8m6QELaXpUeTKJGxc2Z0hbqPEUJGJWHlt8Bl6BBh
         vnVJd/S700FjGGVkUDektfVL5ZfSjrA1Rt8kVM5T8tixJc8ka3lGu54gXfcvV2V5uxQ4
         zYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707763160; x=1708367960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7HP4oHCZLOV0pggjxN8gRQrvsasBsC+LkaMYccuwaI=;
        b=Vqdjmu5EzptVBmvgTWos4i/HnDaiGUarWeCJ79b3kbS2eESmlGy3laKrrlTFmfvNDw
         UeWy2wQnzEhK2Ow07K/55aV0cLmB4wp5l166ylsTJLbmWCLjJ4Ux0N2e/SDr4+JeLI36
         eAPWOEWM3SpU0nXczEkdBww69XgQgGiFFbSTDRaRCB6vmDtx6KSb9WA3cgjfWYfxNNtc
         e1iDgLpce7cw2ltBMbladRYqNgMC4ao6Z4i+Xt0DvTnBXg61l5WFuJcigVLjGSi+Dq3A
         gwYntjpaE6u0Ol1gEI6u2f5/grGQiiIDgq/SIuOGHkpZDMTTadSDGpobzSmWqQtKJIFm
         3kfQ==
X-Gm-Message-State: AOJu0Yz3x88+Hv7x1kRM1/G1mwuTAVjyfyIMUHcVa6SJoNloq5Yock0D
	u3iRsG8EHI8KOTSUsWFIp0/ruVHqSjFFc7HMc/FzcHT9X5KtIF6QML5B+agCtxnXrF8F75cJnI5
	SnUWTWrCOows7htNd2uSir5b577Aeb5031WQdNw==
X-Google-Smtp-Source: AGHT+IGP5DuP5NQjSe3l6JeqYpHls0/iHw4jLynU/X8uhrK7z88uW/tdZJCuW3RdemOUkC7R4K1m/GxpMgFFPw7KNvM=
X-Received: by 2002:ac2:4284:0:b0:511:75a8:1846 with SMTP id
 m4-20020ac24284000000b0051175a81846mr4644174lfh.47.1707763159407; Mon, 12 Feb
 2024 10:39:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jan Henrik Weinstock <jan@mwa.re>
Date: Mon, 12 Feb 2024 19:39:08 +0100
Message-ID: <CANi1PHh4W7KPagKkvZW6cNAQqgAeG3zxaaTJKkg3KiTbsFRMdg@mail.gmail.com>
Subject: XHCI without USB2 ports
To: mathias.nyman@intel.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Lukas_J=C3=BCnger?= <lukas@mwa.re>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I am currently working on an XHCI platform device simulation model. I
noticed that the Linux driver (Linux 6.5.6 xhci-hcd) stops working
when I configure the model without any USB2 ports. During an interrupt
(TRB_PORT_STATUS), I only get "xhci-hcd 12100000.usb: ignore port
event for removed USB3 hcd."

During xhci_irq, in handle_port_status, xhci->shared_hcd is NULL [1],
so the interrupt gets ignored. However, shared_hcd would only ever be
allocated during xhci_plat_probe [2], if the device has both USB2 and
USB3 ports, i.e. xhci_has_one_roothub returns false [3].

Without any USB2 ports, a shared_hcd will never be allocated in the
first place, and handle_port_status will always exit early.

I am new to the USB driver framework, so it's quite likely I am just
overlooking something; but to me it seems that the driver cannot work
unless I have an XHCI device that has at least one USB2 and one USB3
port. But during boot, I only get "USB2 root hub has no ports", which
is not fatal.

Best regards
Jan

[1] https://elixir.bootlin.com/linux/v6.5.6/source/drivers/usb/host/xhci-ri=
ng.c#L1895
[2] https://elixir.bootlin.com/linux/v6.5.6/source/drivers/usb/host/xhci-pl=
at.c#L282
[3] https://elixir.bootlin.com/linux/v6.5.6/source/drivers/usb/host/xhci.h#=
L2001

--=20
Dr.-Ing. Jan Henrik Weinstock
Managing Director

MachineWare GmbH | www.machineware.de
H=C3=BChnermarkt 19, 52062 Aachen, Germany
Amtsgericht Aachen HRB25734

Gesch=C3=A4ftsf=C3=BChrung
Lukas J=C3=BCnger
Dr.-Ing. Jan Henrik Weinstock

