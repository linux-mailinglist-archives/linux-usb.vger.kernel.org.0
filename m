Return-Path: <linux-usb+bounces-18914-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6F29FF00D
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 16:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DDBA3A2E90
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 15:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D74B84039;
	Tue, 31 Dec 2024 14:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNlT2ben"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD7F2F4A
	for <linux-usb@vger.kernel.org>; Tue, 31 Dec 2024 14:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735657199; cv=none; b=D1eSJGG5XzJsQkxFBowTZWRumFLlaXKaQRdOmArIH4nopweCb5LVAj78eJe2CnrArXKEWDplXRm7rwqrsUpS8EZ+XNfWDAAVFIdx5sazNDTBUN1m1eyyDNgRTWr5whH2NgV65X6UAtnYmfjEEyXR/42v/cf8UafZLcz+7NyLT/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735657199; c=relaxed/simple;
	bh=vx7dQgBaD5aaDPWhSedXPsAF7+in5W5KUg5nc1Zcbro=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=AT+VuKd5xmy6jtu2Vlzvj6luKbrC26aB/Fz7HlelpEVkGvdnSgCCwroyrMFPMq4jW9F50HQZywC/k5/BOBlpmotCAdSP76qLsCX+aorwOT3n9hJ/Xmar0ClVmlMrPXUz+Bgrn6Oe7cX7kMoXtOMJA5Oa1gyatwZP4txcTeanBBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNlT2ben; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e3c8ae3a3b2so11129043276.0
        for <linux-usb@vger.kernel.org>; Tue, 31 Dec 2024 06:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735657196; x=1736261996; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vx7dQgBaD5aaDPWhSedXPsAF7+in5W5KUg5nc1Zcbro=;
        b=hNlT2benIVobPj7UuQbIUvb7yK8UT8XLorX3uRw9Xg7I88vEkgG8G9eYYn/1wR1r1w
         iaevQFnZ/Vf91drNfEOiHVtPPGWKjUG87SPbm3Pk+GcEQcwsGGfPWcH8wldGbRCCdqUU
         fl63vSplQLfnhkCWdV98Lvd5foCaercy8vHX7ZB6KyW8N75CB1/4z7P3DDds8UH64WrB
         HhnyiWzgToAfnSb7X2WHGmhaaXigJvLvChTI3FBiAKSZc3mK24aa8E3gdCwUN+Timwhc
         WBTcQx7F0JtS2GlGvzvQjDPorDfld0Lj1t1IEh6bjZvz/8s4+siVALQeMxfG7heX2ujU
         m67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735657196; x=1736261996;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vx7dQgBaD5aaDPWhSedXPsAF7+in5W5KUg5nc1Zcbro=;
        b=CP1CnO7dEEcwQhZKBYP+6wihBqYYu+o6Vxxcf6+F5qvlqNJMZVYUPpoY2CM9PJROwe
         bn1b7Szhl0Kj1TvsDcesz+q9FYnM2MVk4pdctUtSWztP4FtIgQA8Ld7yv6LTOhj3KHg4
         7jcl9Tbf4z5FBzFVh6ZaiJgfuLYwVhEo3vFabaHSa7NAh0NCqfVLGFj6oTwpkxMGcuE5
         DqPlParI1XrIDwj4LOrHI78JTeXDWAgDXcG72cKlfW8N0G8VEehVIpW1+zdwi2xpY42c
         yFSYih4A19wvllZIDWYpN1udtbQ0u17rLsGlGXVYY98cOgFntAG1FSw0upUZEQ/oyni5
         0hWg==
X-Gm-Message-State: AOJu0YzbpEKBx6eCrqUglx+0x52VaKRo2A8fe45gDw0llhDlQvNQJ6v4
	6ohxjx4dz+NCci9zgY5fZmN30tVezL7XCc6SQWvGI0tld2Ei4knqmJD/2FFxcsG6HdlI4f28gDY
	Zh3URrsTeK6pK9yIR0O6Tdty28cSuKiEP
X-Gm-Gg: ASbGncuJEWIiYEbmCVSmQy5aYIDmOwMTPb08Wb6oJC9exrGHHCPvgvEAVTDtg/TViQf
	FgMIqnsisQNP3VRUh8nektjQibA2KB+NBWRphQA==
X-Google-Smtp-Source: AGHT+IFyZJBPqMEftoH8+LR6T5ghRcGTUjryFkC2W5AOvD2dyHiB2ONn74hF5pDapcS3kxfaG/BrTSLO0Gw55SyBgyI=
X-Received: by 2002:a25:21d7:0:b0:e4a:130:45b with SMTP id 3f1490d57ef6-e538c3a166cmr21358418276.35.1735657196458;
 Tue, 31 Dec 2024 06:59:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jate Sujjavanich <jatedev@gmail.com>
Date: Tue, 31 Dec 2024 09:59:45 -0500
Message-ID: <CAPphmgY-bj6KzdEgKMg3JXyaSHNn643Th8wBoJjApQUx1F1pUQ@mail.gmail.com>
Subject: USB and EOL LTS Kernel Advice
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I have a device running the 4.19 LTS kernel which just went end of
life. It has some USB signal integrity issues which result in "clear
tt" loops until the bus can recover (if it can). This can result in
system hangs including with lsusb.

Management would like for me to patch our Linux kernel to work around
the problem thinking that a kernel fix is much less costly than
deploying a hardware fix. There are some USB fixes in the upstream
which might help. But I think I will be without community support.

What advice do you have?


- Jate S.

