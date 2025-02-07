Return-Path: <linux-usb+bounces-20289-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B18CA2B753
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2025 01:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 496503A639B
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2025 00:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 409181AAC9;
	Fri,  7 Feb 2025 00:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p7tMf3hJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277991799F
	for <linux-usb@vger.kernel.org>; Fri,  7 Feb 2025 00:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738888692; cv=none; b=sRoSMEH+gmyooZfD3fuRYl7oCW5lOoUqBf2BoFsXoSmtJLNnP3SAw4p9CJHoutpuALDJHb7DQ35wnNQeZE91ZyyAhyLS5aiIhEQOZjz2dkfjNFkNAGfSKpH1bOkunKWK1Uy8G9GtkWIbzs1uHUIEj04XiuCuqyfJI2zTRHK6T4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738888692; c=relaxed/simple;
	bh=tsK0DeGVamryPJ/JSqZ9Cigp16FvKJ1MpwCnDMfV1Jo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q6TqVxVkIsSPZCvJuI3a7Vv5UYiitHpglPJNTKjG7qVES2oCmTVDWVViVKc7Od0qXvz1TAK5hNvjGPxXmZ0u53O3d1m56pOFJHmm+rYKbLS8kNv9Oy38DtUOVHWV3/U+gZlr6JSbxD2L7fKGH9xyupcCHizCn1+orJyFtUo33js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p7tMf3hJ; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6f88509dad2so14537037b3.3
        for <linux-usb@vger.kernel.org>; Thu, 06 Feb 2025 16:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738888689; x=1739493489; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4fOjNPhoAv4TZXdI14RVbI9uZnpqRZziWgyzdagdA8k=;
        b=p7tMf3hJLlz+s7nC6RAfdbS47AEeYoDZuQkKBqYUB2kHnNhifFl9zPZCLlhEqK8vKV
         T8jSIBnE5AQpXV/++ZczuFaLajhZduJCgTYMtAQiTu4SW9sekZFcSUALYdvDBCUFbtG/
         YmzP5aX9XQ4G84l2G72SmBTBgHWpjM3JgXdSRe2V/+ocbe6pQq4LVuv3KkJBmoQtEowK
         BZ3eQyZURQ7zjnxNabUUUo3DEO7k3Vs8YEY8XWIS34KQjHImXj6J8hId0Tt2tSZCF195
         DI8HDKn2udKLgezWfb3ndRSruWFF4Snzgzst4Mx2lb4+avxJRu4XiitiAKAwQTdIRaT9
         vADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738888689; x=1739493489;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fOjNPhoAv4TZXdI14RVbI9uZnpqRZziWgyzdagdA8k=;
        b=cfMCdfzZNnwrsS+immDSJ7du0cWatXY4z9/GsiKzqHaPDet3QGkh5Q+2ZtGenqOomg
         CxezuN+LzRn/OxY4SYMJ3bgyxzDRDX1bOzjed0mDvW2sQK4Q33lDp/jKN/S43jX6ey2R
         gC4BmtZQvcCJMvZo3CWF3D9VnRBQMPktD1MGYSkZmsuwXPQY4xxTuLODmhHlEXVnr21n
         WqUt4SK5wy/tsg4dNKuu6isWnFJyY5ECh1/XlzHJB2q1rBgjuxElbHRJ5Py4UL1RWiDQ
         06bVav75nKudOnLdVDyN7m7iYBpmN7G7yKroueMzdeXBPcdKqOMVpUr8BcTPAePRnvcn
         AxFg==
X-Forwarded-Encrypted: i=1; AJvYcCXjmAUmdvnEroDZyQPlAvuHkN8WMdvD8KLWxeFmMBwoS92JKgcbXzybl124zNrQguOBT6SWduBZPnI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqimVPhNbXirWBJbefFYb2dZM2E2CEifBg4R7eWhst4vfXFBJt
	Sf51RKRJjPop6MxXzTJHdbvEpwJxbToTg6mdM2WUDvzx69L4q6/8eWIe59kRoyWeYi5sga4fu+I
	rYuorkbYiVJsj2oDMsd198VwXcxzkb8A6XHyLhg==
X-Gm-Gg: ASbGncvI7Xcyny2qOMzV0gjQH+0PjG0mqlJVf9HmFp9iuer/ODZvLqy7Ssb9wTcWYcW
	vwOdeqYaJJtICLal3AYeDbemy1/eY8ohOUIlNG1dQqacpwdnAaHrVGrgpPNjo2/ZVm7hLe1A=
X-Google-Smtp-Source: AGHT+IH8g4An/jcF5yd1TIqzwdYLykZ/8ukwVsv00Vdp1yg6lQkOh3D5OGlQ4HAbwDEUCbXqReuchnm2zfmN09mQsR0=
X-Received: by 2002:a05:690c:4c13:b0:6ef:9e74:c0b8 with SMTP id
 00721157ae682-6f9b2879d3bmr11778117b3.17.1738888689024; Thu, 06 Feb 2025
 16:38:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206184327.16308-1-boddah8794@gmail.com> <20250206184327.16308-2-boddah8794@gmail.com>
In-Reply-To: <20250206184327.16308-2-boddah8794@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 7 Feb 2025 02:38:03 +0200
X-Gm-Features: AWEUYZka4EeRX_3WwZYOEw2blnT_RRdK95iguJ8tA2s-wMBnpOtfTb9QZXUAavQ
Message-ID: <CAA8EJpr=SBQ29m8_iCigUKMHzrdbTFRSpTHv4Aapo55hMVOcaw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] acpi: typec: ucsi: Introduce a ->poll_cci method
To: Fedor Pchelkin <boddah8794@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Saranya Gopal <saranya.gopal@intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Pearson <mpearson@squebb.ca>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Feb 2025 at 20:43, Fedor Pchelkin <boddah8794@gmail.com> wrote:
>
> From: "Christian A. Ehrhardt" <lk@c--e.de>
>
> For the ACPI backend of UCSI the UCSI "registers" are just a memory copy
> of the register values in an opregion. The ACPI implementation in the
> BIOS ensures that the opregion contents are synced to the embedded
> controller and it ensures that the registers (in particular CCI) are
> synced back to the opregion on notifications. While there is an ACPI call
> that syncs the actual registers to the opregion there is rarely a need to
> do this and on some ACPI implementations it actually breaks in various
> interesting ways.
>
> The only reason to force a sync from the embedded controller is to poll
> CCI while notifications are disabled. Only the ucsi core knows if this
> is the case and guessing based on the current command is suboptimal, i.e.
> leading to the following spurious assertion splat:
>
> WARNING: CPU: 3 PID: 76 at drivers/usb/typec/ucsi/ucsi.c:1388 ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi]
> CPU: 3 UID: 0 PID: 76 Comm: kworker/3:0 Not tainted 6.12.11-200.fc41.x86_64 #1
> Hardware name: LENOVO 21D0/LNVNB161216, BIOS J6CN45WW 03/17/2023
> Workqueue: events_long ucsi_init_work [typec_ucsi]
> RIP: 0010:ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi]
> Call Trace:
>  <TASK>
>  ucsi_init_work+0x3c/0xac0 [typec_ucsi]
>  process_one_work+0x179/0x330
>  worker_thread+0x252/0x390
>  kthread+0xd2/0x100
>  ret_from_fork+0x34/0x50
>  ret_from_fork_asm+0x1a/0x30
>  </TASK>
>
> Thus introduce a ->poll_cci() method that works like ->read_cci() with an
> additional forced sync and document that this should be used when polling
> with notifications disabled. For all other backends that presumably don't
> have this issue use the same implementation for both methods.

Should the ucsi_init() also use ->poll_cci instead of ->read_cci?
Although it's executed with notifications enabled, it looks as if it
might need the additional resync.

>
> Fixes: fa48d7e81624 ("usb: typec: ucsi: Do not call ACPI _DSM method for UCSI read operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
> Tested-by: Fedor Pchelkin <boddah8794@gmail.com>
> Signed-off-by: Fedor Pchelkin <boddah8794@gmail.com>
> ---



-- 
With best wishes
Dmitry

