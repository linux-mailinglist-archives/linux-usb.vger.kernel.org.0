Return-Path: <linux-usb+bounces-8520-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC0088F565
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 03:32:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3461B213C7
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 02:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7ED71DA26;
	Thu, 28 Mar 2024 02:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DJPZsEaK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD58EAD8
	for <linux-usb@vger.kernel.org>; Thu, 28 Mar 2024 02:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711593159; cv=none; b=m0W9y6mj6vTgoxorjN0vl+Og9XyhTPh/WLYl6qIemfPknqloU7ZQ7L251OcwSqzQ74K0geKaR3cTq4/JYqBNxeFzhV1SKdg2flOrOGpQhSj3nrczOJkMVFLcJ1XSrNxKIjr1qrwHeAOvhykQzV9SrmDnO/yLVT60XIkKzxxClRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711593159; c=relaxed/simple;
	bh=FLFY/kfCRksoii1pKjJgIsIEKFYSGdDCzyyy5wOIM+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pl4KUi3HvlaeDS7dHajihyy+76uPGsfoy8ImHVAd0QhSg2xKdYTg/BBytZIOYvS40u0kvp8yv1bXFNvUBZA5xqy0Ipa9dXiiO1HD7dotMVJKA4QEaR4VOTTEPFH1BngE+OVyHddkewcN2fOgn5NkPv2DzwHp0w2WtccGbIga8n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DJPZsEaK; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dff837d674so4091285ad.3
        for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 19:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711593157; x=1712197957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLFY/kfCRksoii1pKjJgIsIEKFYSGdDCzyyy5wOIM+0=;
        b=DJPZsEaK/BdZgYL4lqIxTKbwHHBLVXJEdmhWSUrifo1cxw50xnaj000tNPnm5A9Osw
         yi/YlHhg00LaGpc5j8b31VW5Rpe0EZhhleVoy1+1XeKHByfiqMdWx+dcEpIDzPXhPzZl
         8rIs8JcffdMzVgTaDkyS7NWWFX8nsFTGUusSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711593157; x=1712197957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLFY/kfCRksoii1pKjJgIsIEKFYSGdDCzyyy5wOIM+0=;
        b=ksVrwFBYJjxh4tdyJKgPFJUrNGZjAyj0OUZfFA5JDQQWBLwboR98QRK7VbOtx37n/n
         p1uWkcYnampzOxpeaHYIb93dZOkAtfC3tyJJjCvnqF9xgugXYyCm/4VSc00UyW5aGvSu
         qgiGTwyGBoU3OJOYKG09kOYBfYssBzFpMcQ/M9tOhq3JUMFyuOSDaSrSa5ehRM2yt5Xq
         AAkWM3Zve5wneP5GSeh82GDGLY+48gH3l4hrCYBTwCfr+p46ZZHS4Lgzyzl4L4GkkfrS
         KOXLN0nYT2sAcmwshd/WQNebsg+oJ13UZPETpGnpdHb7Te+ixgiiSgQtCFMyU5s1DmU7
         8ZOg==
X-Forwarded-Encrypted: i=1; AJvYcCWgk+wEm2lrS7122mdeMt1i8PhVxw7YPyXL2F7E5SB9SaFjQbB1081V6V//joZw8fVV7mygbZwO5sc3Je3iuPWtvlLApEHkoLIw
X-Gm-Message-State: AOJu0YwABQhP46RtYI4nJDQNUlAyignFwcMpw0Ys55kBurxKlZf3f/rV
	ZIeoqMLx5OctwN8ngm5QdEzzAvU6Z7xCNDE/lQbSwCuPqliBiI2fSkLSWCFsrw==
X-Google-Smtp-Source: AGHT+IFFxwcgunzNtL2vlGvoIN0AIhkUgslnmPFFG9e5z2yTdlTwkt6eJE1o/n4xZqilY9cbaPl8vA==
X-Received: by 2002:a17:902:ce85:b0:1e0:bc7e:6fba with SMTP id f5-20020a170902ce8500b001e0bc7e6fbamr1866709plg.5.1711593156973;
        Wed, 27 Mar 2024 19:32:36 -0700 (PDT)
Received: from pholla1.c.googlers.com.com (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902f54c00b001dc95205b56sm259481plf.53.2024.03.27.19.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 19:32:36 -0700 (PDT)
From: Pavan Holla <pholla@chromium.org>
To: krzk@kernel.org
Cc: abhishekpandit@chromium.org,
	bleung@chromium.org,
	chrome-platform@lists.linux.dev,
	gregkh@linuxfoundation.org,
	groeck@chromium.org,
	heikki.krogerus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	pholla@chromium.org,
	tzungbi@kernel.org
Subject: Re: [PATCH v2 3/3] platform/chrome: cros_ec_ucsi: Implement UCSI PDC driver
Date: Thu, 28 Mar 2024 02:32:28 +0000
Message-ID: <20240328023233.2568230-1-pholla@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <03e1941b-0c8a-450d-9b83-76260817d303@kernel.org>
References: <03e1941b-0c8a-450d-9b83-76260817d303@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Mar 26, 2024 at 9:59 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 27/03/2024 04:39, Pavan Holla wrote:
> > Hi Krzysztof,
> >
> > Thanks for the review.
> >
> > On Tue, Mar 26, 2024 at 1:47 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> Nothing improved.
> >
> > Yes. I only added maintainers of drivers/platform/chrome in v2. I am
> > still investigating why MODULE_ALIAS() is required.
>
> Heh, I wrote why. You miss ID table.

This driver is going to be used by the cros_ec_dev.c MFD. The UCSI device doesn’t
have an ACPI or OF entry, so I am not sure how I can use MODULE_DEVICE_TABLE
here. If I don’t use MODULE_ALIAS(“platform:” DRV_NAME),
https://elixir.bootlin.com/linux/latest/source/drivers/mfd/cros_ec_dev.c#L206
isn’t able to automatically associate the driver with the device at boot.
I haven’t upstreamed the change in cros_ec_dev.c yet, but the code is similar to
existing code for drivers/platform/chrome/cros_usbpd_logger.c. There are many
other occurrences of the same MODULE_ALIAS pattern:

~/v6.6$ grep -r 'MODULE_ALIAS("platform:" DRV_NAME)' *  | wc -l
93

I am still trying to figure out why the “platform:” string allows cros_ec_dev.c to
load the driver. I suspect it might be due to
https://elixir.bootlin.com/linux/latest/source/drivers/base/platform.c#L1257.

Thanks,
Pavan

