Return-Path: <linux-usb+bounces-31434-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F4CCBC3B0
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 03:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82DA4300508B
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 02:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B4C24677D;
	Mon, 15 Dec 2025 02:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Ea7WMpio"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A821FF1C4
	for <linux-usb@vger.kernel.org>; Mon, 15 Dec 2025 02:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765764642; cv=none; b=sWvr6LLsgfXEfpC+fUJMFXTI7W7mC5fhYzgp0AtQhQzX0MVO5x9AShB86eQB/gIcS8sxHznDwTxH2v8ziW7z5X9GKA+fEFfMOqB5Qk3zkwTLYVhfib28L8b/vJYrN8D35yK+ZvspEXS7tXri7glGf33TY1kyxTjw9rBuO4Z91yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765764642; c=relaxed/simple;
	bh=CCIMITnWYRI5bZVQuacY9Hsiu9S/XOPOJSMygTdWwfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PYqCs++8Hi3U7r6kpQksLZivv+WpeKGRS8Y7Hk6/CgekmV06Bkc8/J6GKgxwW+gENZ8yFWFzp3AFXo7Rw94q0fQqKGPzTD++UXymWyN6YAkmNj1DLi5lLzan8F1w6yaPEtIbCDyre+g7XNuF+5gLcP4/6w/HmowdGogoMm0raG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Ea7WMpio; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a087b2a9c0so19411195ad.0
        for <linux-usb@vger.kernel.org>; Sun, 14 Dec 2025 18:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1765764640; x=1766369440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPGRtSGrv+ONhLXGuN0IDSDXOT3OnLCdCzkHGTQZGf4=;
        b=Ea7WMpioW8m+Ebrzm5Sn2WBHhYrDRhsyP3R2VCQVfpvZ9BlQO8TZlWJcEF9u425KIP
         0kDkD3xExhS3Te/DIL8++bEwMOyQX+oMvXMxuimopE6XINrgAZ9eMJj4PhW6djnkeYi/
         zwU+508+Ay0it4/pUquWxghWTQIo6GY0Ce7fBlukAwVzJ8p8f52J4J8PiD/3QlFQNXQI
         Xrx0Y3HbqG4IGbOezepCYRVBZNH1V8AlNf1lJytTITHCGmWF4FqeH3Q0S1rVdWKMPIsF
         /fj8ur4sircwYPS/LybVZHzGjwifTYMnYeuIlZ/yd+o65wiqIcuOvmu5PeIiTNnEwI9F
         h6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765764640; x=1766369440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IPGRtSGrv+ONhLXGuN0IDSDXOT3OnLCdCzkHGTQZGf4=;
        b=txOMS/RSIJ4+WrJrFi+otbeOov1acoQetoboe/Egjtonq1CUUMcwbxyi14+K2Rzan7
         e/Mr0/gV9fcl0aR+WbmmdxFj0A2wW+yrnJKW1H5Eb+xpQqhqA9GALKiLjCgVCOOORpIZ
         eL3ivF4noWF2Qmf2ibLjxm6cHBpxi+QIkXO4Cb4quabT9eOu2pl3PuPqts3itzbxK0Zc
         SPc5XACVxBGZMlrnUXvId39GJqtOKncLR7apZf1WvrjjSVYecTiFEjEYZOPB+310csJu
         EmVPq5Xy40v4Stz3qm/9kvVI7dKY9H5utaMnd7V+CXBkPcOIwbtbqlChTkTy3BU3hhdK
         +4zg==
X-Forwarded-Encrypted: i=1; AJvYcCU62/EGhrc35/d4spdWs4AB3qPqfeTDAek7p6aMUHTRG24x1kdFd3oHTcgTn3rUwCzXIwdhpIt+s9s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhFV1/05oniEz/2iCpCwVr03CMR/RJ5KPPojjguDvtXfdci6dF
	jAcC68aQ1l+R5QD+iR/xFCzcUHLQl3MOhRKCW+EhV38X+FEtSIA+w/LLVfEWdov9KPyY4hGtvxH
	XxWmyF78EkwJ1htJh8jXnCR3FTOjr37lwvZ4v
X-Gm-Gg: AY/fxX63Ap2XeFn6HCZRrpMphxRoW7F7ocZv4u520NFfDtb0BOMRWZzVfW4KLV4z21h
	hIkPykRjpg9QWdd1phXlUswPmhRtCUbY9f3lZIJXeuehMUPTdFlKzejfB5WTK4tn1e5OFMa+qHm
	RKFwatswfIkzD5HrXvbAEXiB+3Zg3TJj0OdGgG+oVuO3MmkMAOhoQ3CeTH2Q4EhMELB1yG5ocFK
	VbxhESwXG64Du46WHfuJUXkUtJSx3wJo0jB3vfnPmLmHgJ30swN4+2pVoH0GcAvMhFpik4pmKf1
	CiqdJvJv8dPjdTitUKTNInxG2sG4KyuhSNaEbs8=
X-Google-Smtp-Source: AGHT+IH8h+iLAFTHbLzeRSFMpvqY+B6gSpNp0cnCziIr7/WIVwVogFL7lPwTYji3seOccOFId00CR0ByWGZM+TQK+bk=
X-Received: by 2002:a17:902:d4cb:b0:2a0:b438:fc15 with SMTP id
 d9443c01a7336-2a0b438ff57mr37088875ad.11.1765764640114; Sun, 14 Dec 2025
 18:10:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aCHHfY2FkVW2j0ML@hovoldconsulting.com> <CAFBinCAUNNfOp4qvn2p8AETossePv2aL7jBkFxVZV_XzzULgVg@mail.gmail.com>
 <aINXS813fmWNJh3A@hovoldconsulting.com> <CAFBinCBMTOM-FMgENS-mrnV17HbKzhtPUd44_dDiwnD=+HVMWQ@mail.gmail.com>
 <aIiXyEuPmWU00hFf@hovoldconsulting.com> <CAFBinCBZhjs7DGEgxhz54Dg8aW3NX9_LdnoZeUZpm5ohaT_-oQ@mail.gmail.com>
 <aJCoRFe-RFW1MuDk@hovoldconsulting.com> <CAFBinCCYsWHsNwi99kFqvLv+xOYtp9u3omhrPdV-hdH+5Cfyew@mail.gmail.com>
 <aK7Y9rRIsGBKRFAO@hovoldconsulting.com> <CAFBinCD19CVc0kX-aqa8pw71O2F3Nwy9ght+2TCn9B4PbOCBfw@mail.gmail.com>
 <aS2hxeBR-tptevYd@hovoldconsulting.com>
In-Reply-To: <aS2hxeBR-tptevYd@hovoldconsulting.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 15 Dec 2025 03:10:29 +0100
X-Gm-Features: AQt7F2oUxyJwGd_WKCwwLF80-V75bjB5XWJtUOeV1SpEEBwZKD7mzdmljBNalKI
Message-ID: <CAFBinCAt1DevnggWJdzBzh3X1Yfb0ScZXYsgkrA1cGrUmfXVwg@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] usb: serial: add support for CH348
To: Johan Hovold <johan@kernel.org>
Cc: Corentin Labbe <clabbe@baylibre.com>, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, david@ixit.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan,

On Mon, Dec 1, 2025 at 3:10=E2=80=AFPM Johan Hovold <johan@kernel.org> wrot=
e:
[...]
> > Unfortunately I don't know how to read the HW flow control state from
> > the hardware.
> > Do you have any suggestions, how I can test HW flow control (after
> > manually enabling it for a port)?
>
> You can try disabling reading from the device (e.g. never submit the
> read urbs) and see if the RTS is deasserted when the buffer fills up.
Doing so results in:
- lots of UART_LSR_OE
- RTS stays LOW (pulled to GND)

UART_LSR_OE increasing seems correct as far as I understand this.
RTS being LOW is wrong and I cannot manage to get ch348 to pull it to HIGH.

I did some more research and found that ch348 implements UART_IIR_MSI
and provides a fully standard compatible UART_MSR.
This is either triggered by a status change on the pins (UART_MSR
delta bits and the actual status bits), or by requesting an update
using the VEN_R command (UART_MSR status bits only, no delta bits).

In a very simple test-case I've used jumper cables on port #0 of ch348:
- RX and TX connected together
- CTS and RTS connected together

If I remove the jumper between CTS and RTS I get:
  ch348 ttyUSB0: got MSR =3D 0x01 // jumper removed
  ch348 ttyUSB0: got MSR =3D 0x11 // jumper connected again
  ch348 ttyUSB0: got MSR =3D 0x01 // jumper removed again

So the hardware does register the change.

Earlier I thought I found a fix: I had the values for
R_C4_HW_FLOW_CONTROL_OFF and R_C4_HW_FLOW_CONTROL_ON swapped.
That however didn't fix it.

My current work can be found here: [0]
If you also don't have any further ideas then I'll drop the whole
RTS/CTS code for now so the ch348 driver can finally make it into
Linux 6.20

> And in the other direction, verify that writes are buffered after you
> deassert RTS manually on the other end. That should be easier.
This seems to work: if I pull CTS up then ch348 stops sending data

> > In case I can't easily figure it out: would you also accept a driver
> > that doesn't support RTS/CTS for its initial version?
>
> It's good to at least be able to control DTR/RST at open/close (i.e.
> implement dtr_rts()) so that you can communicate when the other end
> has hw flow enabled. Sound like you're really close to doing so.
In the meantime I found out why I had trouble with the DTR signal on port 1=
.
It was a user(space) error. I've been using [1] for some of my tests
and it has a bug where it would clear c_cflag HUPCL [2], which
prevents the kernel from turning DTR off on port close.

[...]
> You can (should) set num_ports higher (e.g. indirectly via
> calc_num_ports()) for devices that mux data for multiple ports over
> a shared endpoint (like this device, iirc).
>
> mxuport and a couple of other drivers implements such a scheme.
I saw this and I'm switching over to use this as it simplifies my code.

> > This, together with delaying the call to
> > usb_serial_generic_write_bulk_callback() until we receive
> > UART_IIR_THRI allowed me to get rid of the workqueue and re-use a lot
> > more code from the USB serial core.
>
> For writing if you need to wait for THRE per port then it may be best to
> just use a driver specific write implementation (using a single urb per
> port). That should be more readable/maintainable.
>
> You can still let core allocate the urb and writer buffer for you (by
> providing the endpoint mapping in calc_num_ports()).
I started implementing the endpoint mapping in calc_num_ports and it
simplified the code.


Best regards,
Martin


[0] https://github.com/xdarklight/ch348/blob/v9-prep-20251214/ch348.c
[1] https://github.com/cbrake/linux-serial-test/
[2] https://github.com/cbrake/linux-serial-test/pull/70

