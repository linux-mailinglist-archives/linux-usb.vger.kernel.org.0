Return-Path: <linux-usb+bounces-19728-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F5FA1C38C
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jan 2025 14:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7B20168B35
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jan 2025 13:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FDD11E7C12;
	Sat, 25 Jan 2025 13:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H6qeFs9p"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300691E87B
	for <linux-usb@vger.kernel.org>; Sat, 25 Jan 2025 13:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737810121; cv=none; b=ApnNQOhPSAP0aXu1F1zjm900+IaaAy5LBoY1AFrEgpukn9FiKCcCLCo5CDic4x0z5yY9amMxQ6MlnKmrHoYUUoIDuPJQKRpBPQBxs3AfftFCO6cCzMN1QErdHWRq8TX16g4OWIQc3ois1/ST/1YQkGqP5wcgCDC3GAkPF8z0T9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737810121; c=relaxed/simple;
	bh=sS3mbLcH/a5SluKPTNpMDj9ztVNCWo8wMrmAJjvAAd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D04qIwkV5eJFdZkCdnoIrqF3WoB0ME5wcZfqtdGt8kLMA8u/aYmwdJir7Ruk3W0WsOm/lk1WuvHBrqHNkvVapXr/gcL+JEJW7h7f7PokWYvFQg873urNY308sQJ/nh6DQeJg6StyXm3Ypx2YFSGZu9818p5MCy2dHf0pjKDdAiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H6qeFs9p; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38a34e8410bso1547397f8f.2
        for <linux-usb@vger.kernel.org>; Sat, 25 Jan 2025 05:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737810117; x=1738414917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xBwEaJIA2+RPZbUWu+2aJuzA7zzqm1Ht0aJnI9t2LyA=;
        b=H6qeFs9pqBK9iMZi8kUOJdlr09AdpyWHp/GzAQuLgpwhossZAxNw9O8UU9HvclrrMz
         eqxlcod+7cFWwbc4Yh3UEI5MmHYrdw9NfEXO4gYUGf7/eMh9K9p2TjUJodSKZnWndwW/
         v6Ill/iaeoMKvlBuscWJUXu6mxbi+qOULPRakGodSXhjC3xSo/2cKBZzYdUYlYjp/i6L
         +WdF3TB3QwhtVOx5Sq5mNYKcWwaVtpbCAbtRXoovMrmaFzp9F0kmQJG7VIgMxaO+J54/
         jc+Ts6kPJMuBDJyzFaZo5djxuOPzeZ3T3PfJ1ZAr6LY2i5/tnurPxHd9YG+3L747efbt
         okbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737810117; x=1738414917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBwEaJIA2+RPZbUWu+2aJuzA7zzqm1Ht0aJnI9t2LyA=;
        b=n+nEDRlloG8DG1f0BKE1AT1spYXAeCfH4vgq6Z1SjlmGJzF/K29U0c+YyJMSEIZJBg
         4Yg2lV7fFisvgTL3HU6ofRBTxRdG0jf2eBQnABjo5Vnyfi+YyKQbiZV57LImp+3nCgWO
         KwJgAKkHRMZmEHpmqxPDawIwwHxkJGGnYpAVWt+2+Y2DNNw3m1lb2W+uRUYyVCkGAYMg
         0o2rIfpAKpTSE7aK+IWnz2tWBVnNJ9arI989E6FRSmDwwchuHro0HS45CnmJ1x528oHI
         7Ra+vNeuPawn6Gdo9EMmmWrRJvXJBCeAaK/qCR0V9CaxQrizyFsL/LB2ykNTvtvMG1G8
         hvjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx/5b6eMNQugmzvh1Z29hrn+upKGVYRFW6N3+vjQbkbcfRs1HocayfN/V9DI2iQ0nDNA2Qcd+FTi8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCcqgQlq9HDtaVCiVlEJX5IOZVov+9vZ9ZQnk47mT1OGNtAKMr
	nOEGus65q9zpvLYoI4FZxEWxeJ7dkXxbrAEzWYsRhvDM4fur5aav6R0E+9uSoj0=
X-Gm-Gg: ASbGnct2CUUB2KzXPICrBgOXz+yhpP3mBRl3qB00mfydxra6GvLjX175d2/wO2MGMoO
	V/yREnTGsbCz0eNqXTZc92xvbaIDjdP7Hc2RmLjPG0uIK35lmjFIjfmX7MhjfOo4Bk3hI1F2yjn
	KSlKMDiKV54heMf9urU2BNJv8LQa+70/tl8/a+VED6f1xP9LgZux1B3YZBuHM+ZfQGU31We6qrd
	fsqNQhqSsTTG8DEGkcgJOlGXEdl5NLaH++v7g1PRhVtZTZlW5VDucmbC2QtjWMZ8oCBhKDwVCjQ
	spUvk38dcQ==
X-Google-Smtp-Source: AGHT+IHir8pG3ke37S38Jlyrqg7Fse028mZg7kRs2RqqnJe7pIok9pvHY4SBG300epRnjxxv/2Kdyw==
X-Received: by 2002:a05:6000:1acc:b0:386:4a16:dad7 with SMTP id ffacd0b85a97d-38bf566e605mr31944238f8f.10.1737810116885;
        Sat, 25 Jan 2025 05:01:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d315sm5506679f8f.22.2025.01.25.05.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 05:01:56 -0800 (PST)
Date: Sat, 25 Jan 2025 16:01:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Benson Leung <bleung@google.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, abhishekpandit@chromium.org,
	ukaszb@chromium.org, akuchynski@google.com, bleung@chromium.org
Subject: Re: [bug report] usb: typec: Add driver for Thunderbolt 3 Alternate
 Mode
Message-ID: <a909ff9d-eec2-4e89-ae52-bb3f0b671815@stanley.mountain>
References: <48dbbbab-3d09-4162-9d76-74c9baca6603@stanley.mountain>
 <Z5PwdkpiQcGDCitI@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5PwdkpiQcGDCitI@google.com>

On Fri, Jan 24, 2025 at 07:56:38PM +0000, Benson Leung wrote:
> Hi Dan,
> 
> 
> On Tue, Jan 07, 2025 at 05:16:43PM +0300, Dan Carpenter wrote:
> > Hello Heikki Krogerus,
> > 
> > Commit 100e25738659 ("usb: typec: Add driver for Thunderbolt 3
> > Alternate Mode") from Dec 13, 2024 (linux-next), leads to the
> > following (unpublished) Smatch static checker warnings:
> > 
> > drivers/usb/typec/altmodes/thunderbolt.c:153 tbt_enter_modes_ordered() info: return a literal instead of 'ret'
> 
> I posted a couple of patches to fix the other warnings, but wasn't sure what to
> with this one since by my reading, we're doing that intentionally. This seems
> like an informational message.

Fine fine.  It's an unpublished warning.

regards,
dan carpenter



