Return-Path: <linux-usb+bounces-11346-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE38B9099ED
	for <lists+linux-usb@lfdr.de>; Sat, 15 Jun 2024 22:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BB96B21BF5
	for <lists+linux-usb@lfdr.de>; Sat, 15 Jun 2024 20:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404385577E;
	Sat, 15 Jun 2024 20:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMcYxJqK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB5DCA6B
	for <linux-usb@vger.kernel.org>; Sat, 15 Jun 2024 20:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718484600; cv=none; b=JYa09G4H/IJnKc3CPIBOBNAWiTBRQ9+qPPUQPiauOA0T7sMukWeshFFRS9Ct21wlXH7FjHZRFzj9e6sgmzkx8HXvLCaYYkf7/mdBZ1GiLnoWMd67V4YPk/s2E8KDe4LAoDOIIw14qERX9N86ZRqgitB+ti6IlDI/ZgX+xBEQDF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718484600; c=relaxed/simple;
	bh=uJLr+npbKlPmNakVPmmsmYXLiqcnCrFt5oaOgk8UNxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TujSnrTMN3w1JXJ4PRO2Mtz9UNLU3N5JtXbSLhmjpHr7aX0wVHoJWbvbvowLw8pJ0RHGYrUkeXsSNnL9WCSB1hKl7MKB6iOFCMNwEYbAV2qJQtJVH6mToXuUUSadQQeMnRF2vGZG1VhCVU03EdRiIcojELIIURykAdltsovBx0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMcYxJqK; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-35f22d3abf1so2982286f8f.1
        for <linux-usb@vger.kernel.org>; Sat, 15 Jun 2024 13:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718484597; x=1719089397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkNLFHzGWQ4/eLcOF7s0YoqwiLrU1v1qbfrs9MiBC2Y=;
        b=UMcYxJqKkryj7KsmxXO5KvSe0YnvBPZDnKgztOfgb++AKMKydXL96S4/9cEL/CFUd0
         X+rtlgCoVy2lHQ7EXE3KqmXqpjEw3MC2qLBdJfdyu1AjdEEMfdbZrTu5KNS9LWwcSdxL
         rUiUuA0uU/nq9cWXbO4sKWwbLm9O3r1hVJpH0dowEh5LDXJvRFE2ypmAj6eB23vyY9Aw
         gzapy+6Rqw5dPZTqlbAzsStpLBb5NhDFOM/teBI8s7WXF335q3fNCHns+cFzPDPRtswc
         AW9lYW8XypTUg2Gc1jp6MxcWP3gV32TPPxX1qVsrglSnZJxfuifzpWGPwQekGI4AxZDp
         cfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718484597; x=1719089397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkNLFHzGWQ4/eLcOF7s0YoqwiLrU1v1qbfrs9MiBC2Y=;
        b=HI/xyAbAZREg6VLreqP1pLHDiqzdmyRshXD5CH0MkoiEsO1xl/wq/m3wmh+9ih/zF7
         ILASc6WP/dc7vvdx9mFgHakaVCgRqSfhTOZw8mG+OK+R4vOVvyNwrBNpEbe9j5mob2Lg
         TnnPkfWPckYdfxjRpVdzna0scEQjNuxAPnV3BP+5PgMGB+qgKIxYjXAfpLMz5l9iTXL7
         malsOEnOOHz+EZHi5Hun+BxhXMmRcWvB0SYEvCZFJnMTKw0Xi2qfTwqGLiZ0wZWSAXWC
         PPqgkiAeimZkByEA5R9uU92spl562UAFi+B87tk0qXQVdDeshPJppFRzRwQtlhIQfpwO
         3W4w==
X-Gm-Message-State: AOJu0Yxgo02i34P9u61fNmtLhhM++62axDE+8bs+jROGJFU2hMaD/fb9
	EZO+OCTjgeBQehd3gHN+CGax7yNsALo1CJsNDbabVdyidlN+w6MK3PUOw4rf3Cqs7O2n+JrHJKB
	fnx7h3kDtSqQTSIHc6uQ1aJ8ATsPZb5Ns
X-Google-Smtp-Source: AGHT+IEVd5dHVZFV7rd4p2GSb22RitfHOq5ve+sVP/ZlLRGTzPc8psuDzsxbjUGjv0/IUcC8A3MHi7+xS8swfelKDAg=
X-Received: by 2002:adf:e943:0:b0:360:71e0:8e69 with SMTP id
 ffacd0b85a97d-3607a761dcdmr4825459f8f.26.1718484597223; Sat, 15 Jun 2024
 13:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+fCnZeLRqk-FOkJ81qMY0NMZC7YnW=beTw=w_DVA=OhOnywRw@mail.gmail.com>
 <8b7aa23c-9976-46c2-b64f-1d4614aefe89@rowland.harvard.edu>
In-Reply-To: <8b7aa23c-9976-46c2-b64f-1d4614aefe89@rowland.harvard.edu>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 15 Jun 2024 22:49:46 +0200
Message-ID: <CA+fCnZd1UOqCiH7L1FMMqLhepiMSBfgVb-tXfc81F_VuX_zy4w@mail.gmail.com>
Subject: Re: Stalling non-0-length OUT control requests in Raw Gadget/GadgetFS
To: Alan Stern <stern@rowland.harvard.edu>
Cc: USB list <linux-usb@vger.kernel.org>, Paul Elder <paul.elder@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 15, 2024 at 4:12=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> Yeah, this is a known weakness of the Gadget API.  There's no way to do
> it at present.

Ack.

> usbfs allows the user to send a complete transfer, not a partial one
> (i.e., just the SETUP transaction).  Besides, it's not possible for a
> device to stall a SETUP packet -- the USB-2.0 spec requires devices to
> respond to SETUP with ACK every time (section 8.5.3) -- so this approach
> won't solve the problem anyway. And even if it did, you'd still have to
> handle the situation where the proxy device accepts the SETUP packet and
> the data but then stalls during the Status stage of the transfer.

Ah, so dealing with this on the usbfs side is impossible.

> There has been a patch posted to support UDC drivers that don't
> automatically acknowledge non-zero-length control-OUT transfers.  But
> the patch hasn't been merged, and even if it were, all the existing UDC
> drivers would still need to be updated.

This series below is the one you're referring to, right?

https://lore.kernel.org/linux-kernel/20190124030228.19840-1-paul.elder@idea=
sonboard.com/

Do you know why it wasn't merged? (CC Paul). There are no comments on
the latest version I managed to find.

Also, just to check my understanding: with that series in place and
assuming the UDC drivers are updated, a gadget driver would need to
first do usb_ep_queue with the proper length and explicit_status =3D=3D
true to get the data for the control OUT request, and then either do
usb_ep_queue again with length 0 to ack or do usb_ep_set_halt to
stall?

Thank you!

