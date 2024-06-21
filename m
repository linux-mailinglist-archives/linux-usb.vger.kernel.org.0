Return-Path: <linux-usb+bounces-11526-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7740A91186B
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2024 04:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00BE4B21315
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2024 02:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55ED84D0E;
	Fri, 21 Jun 2024 02:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEHhJEPf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75DA84A5E
	for <linux-usb@vger.kernel.org>; Fri, 21 Jun 2024 02:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718936672; cv=none; b=g6xO29ZQ+3FOOUzESIb8pTroxk+SfloH9EX6MFhxFDdE5z4R64LRYKHaeRsxMytEJ0irsW7Ko8bZXmO9C9AhSAhjJkkcXLAnpqba0VBlBS61nSKGSqm+yy4uGUniKzPvwAoS4nfsoy9CbIXc854Btc8JAMQ79bR1jzVJ1PJofNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718936672; c=relaxed/simple;
	bh=gO18jOkCS/uaxQsjeFVnr3Zd+1w5tPPuIRAvP7A/eGM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Zie2eIeiI7bbh1juQOmrzti5o0PeOkJ92A9UchDv6Dmxcq14+EVICv5bImy9HWukjVbk8irkvqaMUrPWIsvhOY7Ppha2ewnQ0m1fGIqg0Rrqgh6VtgwFUmmgrOWOaF2w2b2C4nxRFrAXIiWyMGFB65fRq4NbVEbGTCRKOYJE2VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEHhJEPf; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-25cce249004so96582fac.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 19:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718936670; x=1719541470; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gO18jOkCS/uaxQsjeFVnr3Zd+1w5tPPuIRAvP7A/eGM=;
        b=OEHhJEPf4iyG+3zCgBq+xJ9bkimZJU4G4YGi+WtbIN1KQtvGqIAMOukjsXME4OQ0Xj
         nH/dE5R1yym+Vmo8CRDnS6dm224MQ2eYsSJkD94TDFam5OBlVcEWf/C1iBpgdxv9koEl
         KmYVSWfxbCAcL01iqrVnL3ZJwy7hBeECLj0a5n9CNsHR0c1Q9i4GY1ehXaPfctkO/HEN
         +691DdzAaVkjMB4dYxFQuzxxq6pwFcgoGPym2K7yvwz4r5vG50iPC5rnrT661Ks1fVd9
         pc1vnKB3kc+vRF+Xo0McfYuNBOv8EhimlvkeaBlqKq1+cX12ZLpdAijBfjNFKmrROhn0
         SzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718936670; x=1719541470;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gO18jOkCS/uaxQsjeFVnr3Zd+1w5tPPuIRAvP7A/eGM=;
        b=KaSIJ1ayY78dg3Be8uGdDlPv8hp5xqleeGfC0Zx0jiyLXs6hQj0WcZFAUCjoLgluSd
         Z32gbIx6QwLzSnrMc+ST3T0UT6hMdcQVhnYSUA3PqgY+DuccXibjuc/AxHyj5EixWerX
         AOp/edmvnVkEDIO1uuUFDP0po6WHz6EXTjah8ysAyPeyTw4kvQZhQrfkGzrqU/+nuBre
         7voT3hY29dzA4iIqjtBD13+agplyHumxDA3h4vITTwmjNYYjgb2+0bTlDP5AqBTjVKlv
         yWrvfY32BjSZISoQ+7zeCou+8l1UpLIMT83dW0bu0CLumvgLIeLrOuS4SEPTtsUqGQk5
         Gveg==
X-Gm-Message-State: AOJu0YyQ72evsBHUbPdj+HVOSZvRwVqVZxciLlFrx4z19e0H7rv3p1Pb
	vDpJZdpB8vevhk4sK/TPYc+AzEnuqHyUNIeLRkNvNY2+Fy8twKbhpZ3cXD6UzTEWxFByPePFiqQ
	Yyhvi7On071u6h93yKSQAHh5NUVs0obID
X-Google-Smtp-Source: AGHT+IEWQEolj9EVf5lKZCeN5hhgnEfSIBRZGMGDAITKtiWCdk/cg/wZSf4yraAtoQc5ybI+cYgSmoK/6lDgsEXy1+A=
X-Received: by 2002:a05:6820:2210:b0:5ba:ead2:c742 with SMTP id
 006d021491bc7-5c1ad8a198cmr9417527eaf.0.1718936669797; Thu, 20 Jun 2024
 19:24:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rajaram Regupathy <rajaram.regupathy@gmail.com>
Date: Fri, 21 Jun 2024 07:54:18 +0530
Message-ID: <CAD039W5Z9rwi-uTk_sp+Xy3-+ZpLuj=GKvEiMeXGBUzXQSS_Uw@mail.gmail.com>
Subject: [ANNOUNCE] libtypec-0.5.2/lstypec-0.5.2 is released
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

libtypec (https://github.com/libtypec/libtypec/)
++++++
=E2=80=9Clibtypec=E2=80=9D is aimed to provide a generic interface abstract=
ing all
platform complexity for user space to develop tools
for efficient USB-C port management. The library can also be used
to develop diagnostic and debug tools to
debug system issues around USB-C/USB PD topology.

What's Changed
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
meson: fix build based on Gentoo testing by @10ne1 in #1
*libtypec : init : update init flow and cleanup
*libtypec : utils : update lstypec for finer controls

Full Changelog: https://github.com/libtypec/libtypec/commits/libtypec-0.5.2

Release:
=3D=3D=3D=3D=3D=3D=3D

https://github.com/libtypec/libtypec/releases/download/libtypec-0.5.2/libty=
pec_0.5.2_amd64.deb
https://github.com/libtypec/libtypec/releases/download/libtypec-0.5.2/libty=
pec-0.5.2-x86_64.rpm

