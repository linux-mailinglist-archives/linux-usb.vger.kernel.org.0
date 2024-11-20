Return-Path: <linux-usb+bounces-17757-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C46CD9D4451
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 00:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70AAC1F21AAF
	for <lists+linux-usb@lfdr.de>; Wed, 20 Nov 2024 23:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92D219E7D1;
	Wed, 20 Nov 2024 23:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpqYN3xu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907D342048
	for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2024 23:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732144308; cv=none; b=kqo17QNpXOyYvs6iWW8R8T+fFfIbN4yph8rfof8hJXL3n//r5haecwj+C/jK77WevU12AdYPHDrwJeQsTGVJtxkhBgH9aqwNUx9raJ/iNefb20wbkc8G1N2PWZxpjzpyKbQvMPWuptUXVx+Mm5OBSMLyR0vZu9pKYXZhRW+t6FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732144308; c=relaxed/simple;
	bh=UTH/6KkcvTnJs+HdFV8VOkwtBex5NbX5E7rNfCG5THo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=G9SCOTAYyQMFpEXO9wuwIWOXtrmv82FvRxrGYDsQ67pCEu2IukL1T8GvF75zExQl2uicTxTX7Sj3Rl8WJOIz55odLrURr1TThPpNeSSBRmbxQCk+Dn32OzGi2Xawkou/Q0GKtGOEORW3Qy9+oI2h5ji4C3PYBYsj93t7fAYhzDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpqYN3xu; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so3306171fa.1
        for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2024 15:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732144305; x=1732749105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UTH/6KkcvTnJs+HdFV8VOkwtBex5NbX5E7rNfCG5THo=;
        b=LpqYN3xuM1bVSHy/z+4DkiqlvAMYXscgI1DuTTqkSr2E4SxBWKJi+0bj0t9jshmsRL
         15dCcRcqMkaRMcxdmfWRpLQ5d4LHxgy7kRoIf00oMyjvXObqF2uhvzwXhEVYB+6TCQDQ
         o3GIntLDBJqkGrdRHkIw4Gsd6MO3j7cXenazhuQUCjRuU/ZnViNIvLJmOnwUnjM3rjfU
         8rizT1sy6YrL6T6Ky5uxM/Hrau6K5xY8fdlXvvebLOyysfV2EKaEzskqaasW0ddElLQE
         KoqbDeugTpiSD+lNWBonI9iWHumNzMv4ZMD/unpKJAJ9NTAqj4rkCHcVHih7r4J6kPw+
         xTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732144305; x=1732749105;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTH/6KkcvTnJs+HdFV8VOkwtBex5NbX5E7rNfCG5THo=;
        b=Pir/1Kqd9GhW8EJVMNBCCiDtMMk8CnCdBggV4N1omwtPm1FKLPy/stDuPJCQxi+97p
         JqjHrpoWJSts5eedvrTRn/RIVZC2Fci1dIbtmv+cX5iya2WTi87ACxBtOz0XlkvHKdta
         6DG+6QTbQnUTtTJJsTp0fepWuQmCen+RNXUUB98YB8D40JSyi2QJuuvZX9fENe4NWi5h
         TPsarGQY2GRbT8kdRGHQmpsv5kAjWiNdbcgnXCiq6QVMaUPEXBvCptx6hSdPRh/4Xov+
         SV0Ye7P5h+tuoMsW79xURNriBCXI38jjNDHe9J9IjPXHZ65JjTFYQ6ZwOhIW5lyHwxfZ
         uODQ==
X-Gm-Message-State: AOJu0Yyn4gusd4JkTJMUMpry+MLd5+K38iOcEBFRRP62uuDV9bbz4Q5I
	x4h/iJMfsdhfy5aLHsEIEWxD0F+4JxkT93CqYfQieQJS0j+9pIO0nH340g==
X-Google-Smtp-Source: AGHT+IF8S9WfGWTCSweWq9NTEPXzQgHd8LvPnlA6Mqb4yatgDJ5Gu+0bD2MKlIl6hmieKQ8ZAeCWwg==
X-Received: by 2002:a05:651c:1542:b0:2ff:5b2c:3cc8 with SMTP id 38308e7fff4ca-2ff8dc62367mr34951041fa.32.1732144304330;
        Wed, 20 Nov 2024 15:11:44 -0800 (PST)
Received: from foxbook (bfh193.neoplus.adsl.tpnet.pl. [83.28.45.193])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff698517cesm16734231fa.4.2024.11.20.15.11.42
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 20 Nov 2024 15:11:42 -0800 (PST)
Date: Thu, 21 Nov 2024 00:11:38 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: <linux-usb@vger.kernel.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: How are halted endpoints supposed to be handled in Linux?
Message-ID: <20241121001138.23a45f6c@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I have been wondering about it after seeing how it's done in xhci_hcd,
which looks wrong to me.

USB 2.0 spec 5.7.5/5.8.5 states that halt condition due to either STALL
handshake or "transmission error" should cause both the device and host
endpoints to be reset. I presume "transmission error" means any error
detected by the HC which causes it to halt, various examples exist.

USB 3.0 just refers to USB 2.0.

Linux appears to ignore this part and only reset on STALL handshake, as
advised in Documentation/driver-api/usb/error-codes.rst and practiced
by drivers - they don't seem to bother with usb_clear_halt() on -EPROTO.
This wouldn't necessarily be bad in itself, but:

On the HCD side, xHCI will:
- give back the current URB with -EPROTO/-EPIPE status
- reset the host side endpoint, clearing its toggle state
- point the HC at the next URB if one exist
- restart the endpoint without waiting for hcd->endpoint_reset()
- ignore one subsequent call to hcd->endpoint_reset()

For STALL, I think it's a little awkward, but acceptable. The ultimate
result appears to be that all pending URBs are given back with -EPIPE
and things start moving again after usb_clear_halt().

But if the device isn't stalled, the next URB may execute right away if
the failure was transient. This makes it impossible to ensure in-order
delivery on bulk OUT pipes, because one URB is skipped and the driver
has no reliable way to retry it before some later ones may get executed.

This behavior also creates an opportunity for toggle mismatch, and as
far as I understand, the hardware will resolve it by silently dropping
one packet. Another could be dropped if usb_clear_halt() were called.


Either I'm missing something, or it seems quite broken?

I wonder what other HCDs are doing in this case, and what's the idea
behind it all?

Regards,
Michal

