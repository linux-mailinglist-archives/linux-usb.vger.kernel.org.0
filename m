Return-Path: <linux-usb+bounces-29251-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2593BD64F3
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 23:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81CFB4203B6
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 21:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F98B2F5320;
	Mon, 13 Oct 2025 20:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hrxsi++r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF252EF66A
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 20:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760389180; cv=none; b=IYV6ebWUtvE51XbD/pas14TxgR5/iZlHabGF+F3X5sHp8FMNhOppxuQCagzMSJxgGqLDX95VTxNm4E9Z326pwD7WQbRoGFS16piksOTFy9inK+mMto2t72DGZfDMYT7p7cCuHRtGvZA9iykrZqT2QNp4EPf1GrXDhQKT11vrUnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760389180; c=relaxed/simple;
	bh=sG7NGEDvazkQFTLe25gikpPASVjElHvfGph3Osk9HmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hkZLEDOwODKprhYNiOWmTNAYvrb8YOz3QgTVUowz7Sks2/rpzW5ZsTdWRCR0QkWCsPysAq/sJBymKfPH0xAS68xBCGcPij6Wsx8Tahmt2tKFL5BmpL4+bbDc66oE+gfEKb2XI74GatptobJJRL9TAkTHE6k2nvchlgY7cU3r+FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hrxsi++r; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-579363a4602so5459083e87.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 13:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760389177; x=1760993977; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sG7NGEDvazkQFTLe25gikpPASVjElHvfGph3Osk9HmY=;
        b=hrxsi++roCYJ1Z1FXYPSxaiHcPAXYRnXk/nOWoo9IOPpmxdn5WRmZ9I/H8PC6dGJGB
         QedfeXmAjaekI7vv05bA/2MkkcgndxcKGm8b2d8cZt5BuN4dlkkbz5glRGklcXZK23+4
         W7Ql5b1MZ/qyw8vBenX87bAcni/CmGPyJJ3cfvkVA7XJGCXxfL7RrtWOy3LdQER/kokA
         TeksQJQsDTUGFjaaKwZ4fn24vHR605GSy6SwXSDfDjm+h6jn5WGEEV/k8TbxBndw0yUb
         6tH4OoWoKLGuZZYJDaD1jCzODBShctU5ouG5Tp/Ut362zYJMcAVeW7sjduhcT32N1TRN
         kbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760389177; x=1760993977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sG7NGEDvazkQFTLe25gikpPASVjElHvfGph3Osk9HmY=;
        b=HRcXHpg0r3+IgJ4Asl/jts1tWsRi+A41Ox30mHmCHe6mkm1Aej/udBUJyvvp9dTAMj
         5DwXkI9oilPJwt6DDuB1mPbXSCvNKkuSbVKKKwmERQyxe+WTpp86yu1SOv+V/g9d5kS8
         Ew+L15qOInMCLP1HIjqQx8/l4Df75AzH88a5ahdvwkxouY0VA4vS5K4VAkWgTyHjUH5i
         oYLUCT/rAr2Wljo56U4tdg+TBDI5+CRSfI0m64tSHFKOxxqgJDHIpcyfcmF08Bgi1tnB
         n7tpyMHkXHFD2JCbxu+rC3kDI8v96XwtfQKMXa2VGsBoYB9pdkNTqdAA4PMFrXAOnS1q
         fBDA==
X-Forwarded-Encrypted: i=1; AJvYcCUcRh4EfbrS5e4PeihustqH1oCzqkZ+0iGXPuhphDiB/Oq7Wsz8Xvs0Y0D1Csb+lJtj+o1Z4/ziZoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQB4R41H7OrhSCAGJYtICGfYLXdVNw5TFhArYay2dgNxjeWuOM
	7vtsg8CPUMqS6Z9l25CS9wickf+iNxxPwWLQ9Gr8+i1udy6wGHgoCzrelabCKPAaPh4RxL4/JT3
	gWJpYHPTPt2Hwoy0DRdOlXpuw51J7PpjNoAQoTk5K
X-Gm-Gg: ASbGnctDffajZZImmBV2H1cnD/kuRhmP6FGkuBR8O+Pcw3zK59XuzD3DASKrtCZhnf/
	i1jRVG0/LpyAZ5IzWx4PNVGeEJWh7H29ez/CS6J0zMhYl/bvRHXavJeEZ0NbmCgP0ObYGmsWCMO
	qSh30VFBdevFsQmA35XbDSuHDE4GnlS7bx7iFT6h4j+5HZju2m8kIitCByjH9Otihu08NzJAsOV
	PGzJ1r40bmS3KMGoQwjMIqf1AwUuFMrK1UOr+vub/adF69MCunvVTgfEd4XLaqoqkTatGQxfA==
X-Google-Smtp-Source: AGHT+IFj45Vf6vX1bjTBB5Y4cqsAZeNKRI/eLafCHoF+c8jjTmaW/C5E9tyETRqfbRkVl6TZ+XnX8p5L2a31W/hIa2w=
X-Received: by 2002:a05:6512:3ba0:b0:579:f0fc:46f7 with SMTP id
 2adb3069b0e04-5906de89a6bmr6324643e87.56.1760389176718; Mon, 13 Oct 2025
 13:59:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007000007.3724229-1-jthies@google.com> <2025101316-rage-vegan-c380@gregkh>
In-Reply-To: <2025101316-rage-vegan-c380@gregkh>
From: Jameson Thies <jthies@google.com>
Date: Mon, 13 Oct 2025 13:59:23 -0700
X-Gm-Features: AS18NWDGTZv_Oy2h6qwDHrqgajO5V3yrBh2yGLcdRP13uD3jCB5MkJukoafZek8
Message-ID: <CAMFSARdQCDcB=tAehoaNkjW+Ctp-ULiDTtyTSfMJX9whYaW7sQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] UCSI Power Supply Updates and Bug Fixes
To: Greg KH <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	bleung@chromium.org, akuchynski@chromium.org, abhishekpandit@chromium.org, 
	sebastian.reichel@collabora.com, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thank you for this feedback. The only patch here which is a clear bug
fix is 5/6. Currently the driver reports 0.1A max current when nothing
is connected on the port. I'll send that patch separately.

