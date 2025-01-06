Return-Path: <linux-usb+bounces-19035-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84296A02FE5
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2025 19:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1673F1885F7A
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2025 18:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0940E1DEFFE;
	Mon,  6 Jan 2025 18:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="az/Qf2yh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F008A78F4F
	for <linux-usb@vger.kernel.org>; Mon,  6 Jan 2025 18:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736189014; cv=none; b=iGVy7tf7H4MZ+8MXtAa/8S5zkVkF9aROKhHtCJd0hrgstUQ7RyZ3QIBTZTH5TGyG7FBLGG7J3Qq4iZj0nJNPpqpFDqFs7kJgbAo/jB10YWi4UHUVO/EWFzl1/pYjRayWKhWYckBqO07lNaw7qg3puR7NuXy5SXqvuqAmeOpHim0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736189014; c=relaxed/simple;
	bh=7aN90AR7PqYNg8bBc3NK4O2h76WvLMYAbDuqAU8+OWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OapJc6rdSS+YkipH0vLzT46zEgFCH0w/iEAsTxuqxVOrC24ksexmUljXGiMFGnNS6AaHvP8lQewCa8kfJCXgFibNlPsWJTn9OGdJuBmL0t4G6x/1aDjxW5/k6nGIXxImMuc4KI49ySRAMmB+4m7m6hkywsLhMzK38Fk6Rb9SItU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=az/Qf2yh; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-51878d9511bso4290505e0c.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Jan 2025 10:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736189012; x=1736793812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81ZFvMgCvonNvOa7sNa0pgwWruFLmxxFAQesD1YVwY4=;
        b=az/Qf2yhRq2DuFbOqB+SFa3/OV9pnqaDp8KOoiQc0PzgJhMUFwhTXrjc0OgYNs5dC6
         lgJ1TsFj9Xiw5RxhSiinks7oiX5uAYf6cW6iRD54zCbF4R6O0WbxyFyHhXxvsrKwzpnw
         nVB4uJCpqR5womPQ7P/foO0GZEPEAPG/+N2vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736189012; x=1736793812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81ZFvMgCvonNvOa7sNa0pgwWruFLmxxFAQesD1YVwY4=;
        b=bA9X1Y65LUPXwKRecIQp0z4ce5yFHsPSakmDiBXuF6KhadDb7wrxl3DihdgQtmnBl1
         hkK6VItzjOX3O1WwuvGc6p/dP4mQBaTZQmXBcQ0+qLg3+4I/B4XCqXd9L640sV6/EGLk
         A8q1k87v8auBOe6VJtCN5u4Ahq6ngl2AMDleRYo0Zqw4Mw4SP4ZQHpErNOxTpWiJdaGS
         XBHG3G7Hfs05/TEFPItcXWtVGG89KwlkLLTj9MEhQVLzaMZwj3zvbSVqHxMKX1TtWrx4
         v7aXctLqIhGkBpsWdkW1OYpg9jIGRQ/qN/N6pq9rSTFPjw4Sq44ckA+rBU/o8WAGVI1c
         IWMg==
X-Forwarded-Encrypted: i=1; AJvYcCVIthuSkCtVYdwlIaRmdo4FnapNHEmCz9uxEEn/yeDYnH+EmUbGbwvR2vbfwL73z81aDbTPbKAQCnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH78hsfOsbS2UnmpMMCyYzK/Ss2hy0NTohpIcH/oK/ttIeD3z1
	wh+GbPa9sKaEKaIctIvDeOJFohjjQD0Zwz1Wcqd+vWczJVas8v2slSkXxxmRVbVvT3HMpllMKiy
	udYXshzxMjIkJYH3t8UqKqj/sRXglSWEHt6DL056G6hr1n2BQOg==
X-Gm-Gg: ASbGncvKqkC34zcN0+aSOEnsx75+JLHVGfzhc/UojfTMBF6iCuNMvBMANm8THl+kwhb
	T71mGHI8F/xfH3V5Ov3MP1WRpGi0D5zgMwfDBxSJjdxHuWx3PFZte3/jVOAfqalyZdgOQyJw=
X-Google-Smtp-Source: AGHT+IHk98Kf7OM+ZBtDPuup4OOy0upl2rnDixUREr43ZTUaabOIIjtlaFd/yhcsCMWeQUv7LYZQFV7Kq2SJw9Avw3o=
X-Received: by 2002:a05:6122:4891:b0:518:7ab7:afbc with SMTP id
 71dfb90a1353d-51b75d3f1a1mr41957018e0c.7.1736189011943; Mon, 06 Jan 2025
 10:43:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241231131047.1757434-2-ukaszb@chromium.org> <20250103233407.4001046-1-gwendal@chromium.org>
 <2025010438-canopener-renounce-4a28@gregkh>
In-Reply-To: <2025010438-canopener-renounce-4a28@gregkh>
From: Gwendal Grignou <gwendal@chromium.org>
Date: Mon, 6 Jan 2025 10:43:20 -0800
Message-ID: <CAPUE2usEN1OZ-=A19PH2yx3tCM1aNnXqNZt3stvgWZod7GxW=w@mail.gmail.com>
Subject: Re: [PATCH] driver/platform/chrome: Update cros_ec_trace with new
 USCI commands
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ukaszb@chromium.org, abhishekpandit@chromium.org, bleung@chromium.org, 
	chrome-platform@lists.linux.dev, dmitry.baryshkov@linaro.org, 
	heikki.krogerus@linux.intel.com, jthies@google.com, linux-usb@vger.kernel.org, 
	pholla@chromium.org, tzungbi@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 4, 2025 at 12:13=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Fri, Jan 03, 2025 at 03:34:07PM -0800, Gwendal Grignou wrote:
> > Add this patch to "platform/chrome: Update ChromeOS EC header for UCSI"
>
> I do not understand this changelog text, sorry.  How can you "add"
> something to an existing change?
>
> > to add the new commands form cros_ec_commands.h in the tracer so that
> > they are nicely decoded. Enable the tracer with:
> > cd /sys/kernel/debug/tracing
> > echo 1 > events/cros_ec/enable
> > echo 1 > tracing_on
> > cat trace_pipe
>
> We don't need to document how to enable a tracepoint here in the
> changelog, right?  That's going to get lost and why is this new one
> somehow special?
>
> confused,
Sorry, I did not use `git send-email` appropriately: the code snippet
inside the email was not meant to be a standalone patch, but to be
added to patch v12 1/2 "platform/chrome: Update ChromeOS EC header for
UCSI".
If this is too late, that's fine; I will send a proper kernel patch
through the chrome-platform@lists.linux.dev mailing list.

Gwendal.
>
> greg k-h

