Return-Path: <linux-usb+bounces-16889-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 650189B77BE
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 10:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 079C61F22EBF
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 09:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2379196450;
	Thu, 31 Oct 2024 09:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AxvZr6xT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DF213BAC3
	for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 09:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730367730; cv=none; b=o6oi7RPZcVDA29bD+UZwvrmWfCILQhbP8SoAJsHZpco+aiTfR5PLXFnGKsSXoIHlpJd78wU+Zde08nFdQVFBvHKrVh48oOyL5s11Bzf4wGSpJ0iK9CTa5DsfqLNKnRSmv+qBxXPSw792XCgUAbF/G5ECxIJ6C/XgGcl6pfSkJqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730367730; c=relaxed/simple;
	bh=slm1xODwz4LgrTMoK5d/AyCYrGmHjuQnHuRelrg2N4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=elCNAxgIoukSW15tyOPzp7D49M01/RpYZg5EoVz3K3CXPoM1yI8zGWNcNYWcXkwwxtUJeto46//ouODkNkwSCvlXtKe+nmjFsEmHkV0N8cDy35ytXWIjwx0VYM35BBf6b68TbnPp/Y58AZ0dqDRh32JECvqtPuHdj1oZPbkAtgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AxvZr6xT; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so6700011fa.3
        for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 02:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730367726; x=1730972526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4sf3KyC2PuT3c0iMyDEW48NX1uMX2hRQgrfMPxPiTI=;
        b=AxvZr6xTAkALvZPO2/0yXWVsXDbP5s1XjtA4RwU0fgmykhql6o399yicTU70gP+4HJ
         X1rTg9Cnm0jNVIAv4N5g613lh7lzJBnMrB5UH4DmBwPz2339jipPq49zgVktWiXGeK/v
         HgMloK7onrqXZmJfDKTrwTCBTdW1xH99zZ60Am5eb+7/WyNKDimIuW3V7fOO66s6b8GQ
         FAYckSVpmCkpkIMiIsCmr8zdVj3WkLPIPHyzY7t782fvwFKA7f5qIS3d/I8OGFK2uUs1
         kfuck5E8blxwIBmzJ9C+uuUxhXBvLzVQZvQ3PD8pwTBtcAo3UXI1nm2ZhFpyvGY9pDMK
         tw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730367726; x=1730972526;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4sf3KyC2PuT3c0iMyDEW48NX1uMX2hRQgrfMPxPiTI=;
        b=d98Krlua+XAOmnt4/JLY0dhvWdQQ6VgZPFXOMIqLVS2mDQv6H7E8hCHqIXT5L4c0nI
         /bd5j8r4YCvj5n+SDRy75KVtu/taBhVdeL4criPF1NkmFTUtfD0+qwK/567gekDLcNbz
         rOIkt78fVlx9xHeL+JYlQOrLU9FYvAqA4MXfsjWYSr/bb1GGvaKWS4eFCpKUa3E7rpev
         yTEGUIotVnTiA5RKTslzAqIt8LU6bPztg7HQpYpZURJ49jpIgzin1xQg9Ngh8XRmFvqI
         CWLkCEIdpFk6xjyK5LBsPyPsHuqaaWJmPDWRIvhJ5xXz/OXFomSw2xC/2LTpr90KpE+J
         +GNA==
X-Gm-Message-State: AOJu0Yx8Ng1U8g/J3T+NuBfCF2FKdHBOeT+ZrsB+3YEyd/7GNNhoZJGz
	0GYLlx8tO+tWdd+r9h+FMhE/5xke63CI27cCm1FH6xCSAvTve+7j0gB/iQ==
X-Google-Smtp-Source: AGHT+IGI4lMrrZ8wRnmNJayuIze6seSM4HEOhsJpqAhIW/BjVCTiD23VwauMqG17BzD+Jrkld08uww==
X-Received: by 2002:a05:6512:32c7:b0:535:645b:fb33 with SMTP id 2adb3069b0e04-53b348bc2cdmr9421488e87.2.1730367725930;
        Thu, 31 Oct 2024 02:42:05 -0700 (PDT)
Received: from foxbook (bfh123.neoplus.adsl.tpnet.pl. [83.28.45.123])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bde3293sm142177e87.277.2024.10.31.02.42.03
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 31 Oct 2024 02:42:05 -0700 (PDT)
Date: Thu, 31 Oct 2024 10:41:59 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH v3 0/3] xhci: Fix Stop Endpoint problems
Message-ID: <20241031104159.25f9ff70@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

This is a thorough rework of "Fix the NEC stop bug workaround" series.

The focus is on simple patches which fix one bug at a time, hopefully
for good, using localized changes touching only 1-2 related functions.

1/3 resolves the problem of infinite retries on NEC by limiting them
2/3 resolves broken cancellation on stream endpoints (purely a SW bug)
3/3 resolves almost all known cases of pointless retries, which is an
    optimization at this point, as it falls back on 1/1 when it fails

At this point zero issues are seen on NEC, but other HCs with known HW
bugs are yet to be tested fully. However, ASM3142 has just passed the
"ifconfig up/down" test, so there is that. ASM1042 not tried at all.

If this works out, the ASMedia chips could be enabled. Or maybe all
chips could be enabled. Technically, retrying Stop Endpoint doesn't
seem to violate the spec. But we know the chips already have one bug,
so who knows if they don't have other bugs...

Maybe some internal operation scheduled by the doorbell ring could
interacs badly with commands. It's clear that some HC vendor haven't
thought very hard about what happens in those cases.

Regards,
Michal

