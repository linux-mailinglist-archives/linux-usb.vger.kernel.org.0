Return-Path: <linux-usb+bounces-14910-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 910C8973942
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 16:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C13A31C2517C
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 14:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FCB1946BA;
	Tue, 10 Sep 2024 14:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBl/vQHp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CF019412D
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 14:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725976883; cv=none; b=a5U/9LBUBDmKaGqoL+QSykzGg6l+5I0mbI7rBBWZxtmf1q5S7WmCiJuT23m97f/4seyZScog6CIprR1aWl9+I3CdBznhJK+qbFarAFywUNO4QfVSjahqjc2i5QN/Vb7uZuKHiHeZdy2eogZ3NoRFAdJSsORYs1RppeQBrCeTt5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725976883; c=relaxed/simple;
	bh=2gOXsOh22ZcdjJ6Y+mz0JzjSStB2D5rpfzs5iMU66ek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XCIbktfh1KU/xkxvHBIUDeGhDFn4Zf+jQNpozXV3X6DZcRKA3eiK4DfwbvSW2fgmmTvDizU/+U5pDci3smmVj05gIRjUF6oe9jKB3ewHRe+d6asYD3Oedw+ZTh4uQoGccFs8XY97ZieRqZjFq/VhCb6KxWqUo4U4Vi0BZJCvLyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBl/vQHp; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f74e613a10so1335861fa.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 07:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725976880; x=1726581680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2gOXsOh22ZcdjJ6Y+mz0JzjSStB2D5rpfzs5iMU66ek=;
        b=FBl/vQHpJ9iGrqJFOKRHnv3ydDoxIUvAXd75XfL3P1FDBgzua1hbUweyuUJl4YIsRm
         mLrg9R6JMotH5w51e0JsEsPOr8A0TBGisNk05EDZBE7kWfkPZw1jqaogXY4OSnMyAPLT
         hsHpdQqS/oxgCmmaC93eVb10hHolfkijxXkkXAp0c31jMfjegFbM0OWD11Sin3O17vaE
         uf2okyBFHZ9nJmZIiVjItZZcpgggaEyfR3YJrlYByypldlLFTDWJGhZDj8RBix90DEYf
         +wTTE4AmuOAJ/y2QBZyUd69d0vHxmRPnGj3M44NqhsNmHxjPFM88ptrSGNsoKrDsMBe0
         dDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725976880; x=1726581680;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2gOXsOh22ZcdjJ6Y+mz0JzjSStB2D5rpfzs5iMU66ek=;
        b=XfzU0HL9I2Pml4gO5ew5Y4RuhAs5s7f7+c1a/pa87nEQdolaMOZBGUVYXAO2FD/q2a
         FiY5IgTnawXVA6bVo5v5So+f6ndVE0J7TAu9wiBXzhTpoI3OWDvZd/PdOxXo5CgCjGpf
         WVHUwasb8EOZ01o38BB2rSXV0tC5BxsZAXGgjVErMM0t5zZYEsYhUeSia3aSGrSI8RgD
         H/Z0jx3/aOls7FK0u1TjWRmj0r6o8i6aoT6OGGRilpix2BfxJrMoMio2Gyhmz5Qa+fFc
         aynAP5VXyiFkKr39PnlIyUvqeczROmukUaPShgOyXeTcs7R3q2Y99+9CCEiLddF0aEtz
         YtnA==
X-Gm-Message-State: AOJu0Yw2FA3x+MDtEzY2SPyWdeTBpv+BKHWr2PEjR1CCAHkxrAm6fXkb
	SMSpL2G50KIz+4g4Tk4N4czHUvUPdq0PlxssKAd23Am12cMFNidktpf57g==
X-Google-Smtp-Source: AGHT+IE02/7y/AKevdEPkPN1e1kYVMIv2APOwDIoVP3bgEjenVLreT0cCEnO0K0D+0r9ilcl3gXZzA==
X-Received: by 2002:a2e:4c02:0:b0:2f1:67de:b536 with SMTP id 38308e7fff4ca-2f75a99e717mr79873481fa.24.1725976879485;
        Tue, 10 Sep 2024 07:01:19 -0700 (PDT)
Received: from foxbook (bgv123.neoplus.adsl.tpnet.pl. [83.28.85.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d258339dasm489634966b.38.2024.09.10.07.01.18
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 10 Sep 2024 07:01:19 -0700 (PDT)
Date: Tue, 10 Sep 2024 16:01:14 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 0/2] Fix sum_trb_lengths()
Message-ID: <20240910160114.50b77a91@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

This function sums from ring->dequeue instead of td->first_trb, and
this is even documented. Makes no sense and doesn't work right.

I searched xhci-ring.c and this appears to be the last such abuse of
'dequeue' still surviving to this day.

Regards,
Michal

