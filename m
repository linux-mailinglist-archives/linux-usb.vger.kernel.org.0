Return-Path: <linux-usb+bounces-16895-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AC59B78FC
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 11:49:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97FDB1C203E1
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 10:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F62B19993C;
	Thu, 31 Oct 2024 10:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fprg6BCj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6D014659B
	for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 10:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730371777; cv=none; b=Ns7JZrpP0/ky6EhQefmvNkJtM8K7YtbPJmrGhkLL76gdS7TKZUVUvK2KQh38wSaYvDslwzFcV9RkCBAmZbhWGSyUzcqfepCSXmF6ZCyhR+MbvCRFiEgI53ax9ScZZXyb602P+8bI1PovpsIVh6sMWpBgAspyOwyj7UcIufccyIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730371777; c=relaxed/simple;
	bh=5jkBeD8BZmyLo0GZPHODc4qmcbpHUIBkkt9wk7V+y4s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SuY7D28aFU7MeNw03ScBC51iucAWvVGyYYs2GZNZjy/UbO0DOUkdnZSthhpyhXx+PBHdKFR2AdV3JDzeIdV8Pg4ZqOuN0tCq/KVyMcASytt3pJujHT0O2fcAFBIpZ1ywtwsFOVhphybbitUZYL4ksEkt3CLedlsbNw5eVbCwIH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fprg6BCj; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso11057921fa.2
        for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 03:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730371773; x=1730976573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRGlHG/jTmca0xTMhZgFdXeb//nXoBuON4gNuMJk6wk=;
        b=Fprg6BCj9wRCiZd7eWxCRW02tJI6PhppwjSox0roIgBvtDWkCXdgyYvlxnelpzLYbQ
         osOUZLLO2hJJHPjw7c4sG/FhB8Y6t7g2f/A1/goTiAEQvkFDH549t56LOFFJL16DGuTh
         UqRQFWr2KSZNmQYWRtLqM7j9Y2SOB93QNdoeqP6luXsiPMM9nmGUA4E35IU/OP3us2f2
         DqBsYOno5qP0o4Swyt+vUPgWczT5Pnv5UN+iCDGLiPN5E/NTgxARyrQLFnzrdxEMwL3b
         KgV9X9M0O1eWEwQ1yUNWTQQVTPzTdSPKhL62xGuJuPD+0rzzYyQtnM8Lp2GfnVi+U4aY
         RMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730371773; x=1730976573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRGlHG/jTmca0xTMhZgFdXeb//nXoBuON4gNuMJk6wk=;
        b=aSnOdwd0vdQDWDr5kWxepZx/perEKbNmgbn3cN90uBHftWQcExLGse7Zuj9fRk6cdx
         pV4UaCqpApnTHRY/zf4/MgBIcbRdUF5MHawEjKoTvBZM87kssINWZHV1dhtgdk0TRheO
         hLC4TBmrB6e4odKT6tlDG6yckW52Y/+QIaeNXtJa/178PcujXidsb7N/0ztsISWjYPuw
         7TWDAM2M9q/IAskBxhVzWgyjFGKcmRoQfwg0hbOCnoJ+xKgW2QLRgAflY4Ti1ospZD5m
         sWn+0KQ2jKFG/n+r7nvT6PWbYPUHIfi50l66E/2knyvOG00j399AfsF9DFTnERKCVq/x
         zJIg==
X-Forwarded-Encrypted: i=1; AJvYcCUqCPDbzR6lX0tAHkrbG4/9w7SUwaZ21sbbD8nWMYQ4BQdf61Ceq3N26l4y0A8GREOiuQ0fLBIf9os=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFXIp/pOhuHXj0fXmHN3YnvsX5Ee+xRzYbsxSjjOrzhRWPBT7m
	mwykii3T8leg2gPp9QbezqDHZE9lITrzs5+QrfUC5YcU8kUo3tjaBX5KHw==
X-Google-Smtp-Source: AGHT+IG0cdZ0nnCXr5Wl4/wjxQTFG6uLCW78jN93dZW00aZX5SclA9XAKFMKOcL8/P062kwRlMW+1g==
X-Received: by 2002:a2e:8714:0:b0:2fb:62ad:89fa with SMTP id 38308e7fff4ca-2fcbe0a3e50mr93896951fa.45.1730371772328;
        Thu, 31 Oct 2024 03:49:32 -0700 (PDT)
Received: from foxbook (bfh123.neoplus.adsl.tpnet.pl. [83.28.45.123])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef8f23afsm1776291fa.130.2024.10.31.03.49.29
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 31 Oct 2024 03:49:30 -0700 (PDT)
Date: Thu, 31 Oct 2024 11:49:26 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 "Neronin, Niklas" <niklas.neronin@intel.com>
Subject: Re: [PATCH 0/2] xhci: Fix the NEC stop bug workaround
Message-ID: <20241031114926.22ac4359@foxbook>
In-Reply-To: <20241031091347.29b6ffdd@foxbook>
References: <20241025121806.628e32c0@foxbook>
	<20241028083351.655d54cf@foxbook>
	<f6dcf205-e8eb-4ba8-91d9-24fa0f769739@intel.com>
	<20241029092800.32eccf3b@foxbook>
	<7c2abdd1-c209-4616-9d18-be5fc99fc527@linux.intel.com>
	<35fdb2a4-8514-4b4d-9332-127d6ed07908@linux.intel.com>
	<20241031091347.29b6ffdd@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 31 Oct 2024 09:13:47 +0100, Micha=C5=82 Pecio wrote:
> This looks like it should work on semi-well-behaved HC like NEC, but
> it doesn't account for hardware not restarting an EP "just because".
>=20
>=20
> while true; do ifconfig eth0 up; ifconfig eth0 down; done
>=20
> locks up on ASM3142 with AX88179 adapter as expected, and when the NIC
> is disconnected I get those 'ep ctx error, ep still running' every few
> seconds. It seems lots of network code got locked up and I can't even
> ssh into the box anymore to copy exact dmesg output.

I apologize for rushed testing and providing bad information.

Your patch doesn't trigger infinite retries because it gives up after
just one retry. The infinite retries every few seconds I observed were
all caused by separate cancellations. The class driver timed out on its
control transfer, cancelled one URB, tried another one, timed out, ...

It takes a few minutes before it gives up, and only if I kill the
ifconfig loop, otherwise it seems to be forever.

Your patch prints one dev_dbg() each time, mine spams many of them for
100ms each time. I will remove this one retry limit from your patch to
see if starts spinning infinitely, but I strongly suspect it will.


One retry is not enough. This is what I got on the first try with a
random UVC webcam:

[ 7297.326596] usb 10-2: new high-speed USB device number 2 using xhci_hcd
[ 7297.465252] usb 10-2: New USB device found, idVendor=3D1e4e, idProduct=
=3D0103, bcdDevice=3D 0.02
[ 7297.465259] usb 10-2: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D0
[ 7297.465261] usb 10-2: Product: USB2.0 Camera
[ 7297.465263] usb 10-2: Manufacturer: Etron Technology, Inc.
[ 7297.468898] usb 10-2: Found UVC 1.00 device USB2.0 Camera (1e4e:0103)
[ 7297.475995] usb 10-2: UVC non compliance - GET_DEF(PROBE) not supported.=
 Enabling workaround.
[ 7297.476928] input: USB2.0 Camera: USB2.0 Camera as /devices/pci0000:00/0=
000:00:05.0/0000:03:00.0/usb10/10-2/10-2:1.0/input/input25
[ 7297.492153] usb 10-2: Warning! Unlikely big volume range (=3D6144), cval=
->res is probably wrong.
[ 7297.492159] usb 10-2: [3] FU [Mic Capture Volume] ch =3D 1, val =3D 5120=
/11264/1
[ 7299.301892] usb 10-2: Device requested 3060 B/frame bandwidth
[ 7299.301907] usb 10-2: Selecting alternate setting 12 (3060 B/frame bandw=
idth)
[ 7299.304772] usb 10-2: Allocated 5 URB buffers of 32x3060 bytes each
[ 7300.339246] xhci_hcd 0000:03:00.0: Stop ep ctx error, already stopped wi=
th pending start
[ 7300.339252] xhci_hcd 0000:03:00.0: Stop ep completion ctx error, ep is r=
unning
[ 7300.339283] xhci_hcd 0000:03:00.0: Context Error unhandled, ctx_state 3
[ 7300.339324] xhci_hcd 0000:03:00.0: Stop ep ctx error, already stopped wi=
th pending start
[ 7300.339326] xhci_hcd 0000:03:00.0: Stop ep completion ctx error, ep is r=
unning
[ 7300.339365] xhci_hcd 0000:03:00.0: Stop ep completion ctx error, ep is r=
unning
[ 7300.339492] xhci_hcd 0000:03:00.0: Stop ep ctx error, already stopped wi=
th pending start
[ 7300.339494] xhci_hcd 0000:03:00.0: Stop ep completion ctx error, ep is r=
unning
[ 7300.339533] xhci_hcd 0000:03:00.0: Context Error unhandled, ctx_state 3
[ 7300.339593] xhci_hcd 0000:03:00.0: Mismatch between completed Set TR Deq=
 Ptr command & xHCI internal state.
[ 7300.339594] xhci_hcd 0000:03:00.0: ep deq seg =3D ffff88810b006000, deq =
ptr =3D ffff88810ae0e780
[ 7300.339634] xhci_hcd 0000:03:00.0: Stop ep completion ctx error, ep is r=
unning

Not sure what caused this mismatch, it might be a new bug of yours
because I don't recall seeing such things before.

This was with your three patches on v6.12-rc4 plus the following:

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 7d036fda354c..7325729beac8 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1182,6 +1182,8 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *=
xhci, int slot_id,
 		default:
 			break;
 		}
+		xhci_err(xhci, "Context Error unhandled, ctx_state %d\n",
+				GET_EP_CTX_STATE(ep_ctx));
 	}
=20
 	/* will queue a set TR deq if stopped on a cancelled, uncleared TD */

