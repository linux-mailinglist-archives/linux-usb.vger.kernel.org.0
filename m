Return-Path: <linux-usb+bounces-30043-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C306C30C07
	for <lists+linux-usb@lfdr.de>; Tue, 04 Nov 2025 12:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA8793BCF52
	for <lists+linux-usb@lfdr.de>; Tue,  4 Nov 2025 11:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1D02E8E01;
	Tue,  4 Nov 2025 11:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIY0BO1U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D793F2DEA8C
	for <linux-usb@vger.kernel.org>; Tue,  4 Nov 2025 11:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762255978; cv=none; b=K6L21IZp6XvfZhQK+tv2r23aVPZa+Mmi4F2qBnNs6d4td8lTeIhzoEpDrL9kh7t7kLsYWEWNC26X+dqteNZpxb/yhr1yr9oQo6U21/d7sZAwdzlcL7zc4l4Dnit0JpBuKHV8/FBnLTjJqtZhKHTgSwSdGZdPChVV/caFVOte0yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762255978; c=relaxed/simple;
	bh=K+7xZU/4fUasOYP9w08Q3aQyqV3Y0UA9c6Cs+oRVkwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qHy+Qw1C/vzVJKd+UmYGUlmLGrsgsBpDP9lTUhkOfLnMnLVX1bEmqrPKtf2ovCkPupm8Cpm/yPKagqUrPzplsnBu0KP9w4zs7QUSe0jg3JAS+/THN2pGrycFbpzjQ7RYzaNGZnTyRfJGvtHw6fiSSr3uqTLF/k+OilOo+5ijDR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIY0BO1U; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b6d345d7ff7so1173295566b.1
        for <linux-usb@vger.kernel.org>; Tue, 04 Nov 2025 03:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762255975; x=1762860775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ercQmq63F0fbxCEEluw3pSTn/eQ1S3fyCo/09FggsIk=;
        b=GIY0BO1UvRfXXoisrWacXTS9R/KKr1SOaiIRVCTvmod6kBZHOemAL7DB36cIzkgeoG
         W+osx+Gpptn3ejGTFV8YeIgl6c5ovanSklQ2oPoXcHlfRmsK7y8lVGrBW2LybJcsUhIj
         YmlhBDb19bX9A0q2BdL6MNeaGGF1MN9YCzJoSkCea72oXhAogsP+qMzQf77j88zIa41t
         tXZbdQ/F9jyzd3mHnu57cKvvclxdgWxm2z9wBqgGWm3ITFihtu3XnQUJ+ScwjF/EHPcP
         p9NdTsqBqWKdTgdIi/6ZuEfP2rT5IeAYPI8ytax0HQ5JtL5GOUdWCfm45UEUyylJCXSf
         ImFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762255975; x=1762860775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ercQmq63F0fbxCEEluw3pSTn/eQ1S3fyCo/09FggsIk=;
        b=nk6DueBKH/vO9/FEPMHzCj3XvU6W13OoLDmEZnERZTMyCImsnx9IGMLG790hs6mtdh
         ma2wIqUVS+XjyGnTbUtNlmAiq7S17+mqrvY9CLdQ/wPIXlngKoOaSDtpq9PUwQxZVhEY
         EQkxym0u5fftNe0wuo4VTHj6HEuDB0R93+a8kAG05YXWbMApb6F55FvNXw4A2+ZBqiGi
         EkGPujaAf6ka7g9b+xehqJYM6xd9ky5znRskHOm/J3H+wdX/NgEXP+xSqfgYGcVEw6WE
         /diRpUGRsp5k9r8ntZQdKEGjQVxC7OOSdZ7vlD7hjvr3BJf1DqWUK3/RR0kg09UT+2St
         6JJw==
X-Gm-Message-State: AOJu0YzXVzTSFIV9bn+MlcLnLYZluo5vqWJ8DyBknvbkr9ATek6qDqp7
	NcfFN5d9xOJAZEnS0ft0dhpQ096qjqs9Vpt8EWzVj3oJMbqc4F/tJfLbPgLBa4eudS8=
X-Gm-Gg: ASbGncs8oupZ8IYCAM3zEcZoykwUfgtGNPSVwwNcBjDNi+7R2zvkMLWCgO3vSaAURmJ
	vXfQJWcoWTCuxWWMxz3/eeVSi3TASIVKhFEI/GpFKxSis+3k01uPlNxJb0CqD2ecraM93Uat/C8
	4PS3CLFQIdIbfXrOb7kSXpLiiTj2TCo72J6CnlooxQZbEY6dMh2sGgyOCDleh5B4Xm8zcOrYot1
	KU/y6h91dmVfyy1dpaWIRfTJthCDBlmM8P5NuGzIQP0YFKguPpycISM8m5qo8web1k5OsXzbtfH
	nJz6k2tnRWEtcf+IxyH8ZTjh76Bzr2/mK6LCmwNYS5KXwXJ/V0f3fwQpjrZCCuvg1zEPMELefXS
	af/ORRuqhKaCzOOZEjINhBAr3mILN8lf5B9CwBWqZU7m+R5JHEsdFOrhcpsN82XvTKzOCZOYpIu
	7uMTuOjyyzqe8q9z6lcxukubNH+pW7R5/FtWcOtZOMxoNkj/tLvuwSIdTrq++4AQ==
X-Google-Smtp-Source: AGHT+IEKD2kGOugAAAnbCnLnoC1UUvIAOZG3fusd2JbtCMmNYg4W7DiOKZH0QVR7QvG88atv4rcCFw==
X-Received: by 2002:a17:906:9f8c:b0:b71:6da6:66ce with SMTP id a640c23a62f3a-b7216900080mr354590366b.18.1762255974644;
        Tue, 04 Nov 2025 03:32:54 -0800 (PST)
Received: from jale-pg.. ([2a02:2a40:17ee:2900:8627:17a2:2166:4084])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72404470e9sm182469766b.70.2025.11.04.03.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 03:32:54 -0800 (PST)
From: Jakub Lecki <lec.jakub@gmail.com>
To: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Lecki <lec.jakub@gmail.com>
Subject: [PATCH 0/3] usbip: Convert vhci-hcd Kconfig related to number of ports to module parameters
Date: Tue,  4 Nov 2025 12:32:45 +0100
Message-ID: <20251104113248.223594-1-lec.jakub@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In workflows involving a greater number of remote
USB/IP devices, the default number of available virtual ports may be
insufficient, forcing user to recompile the module with greater number
of configured virtual host controllers and/or number of ports.

Allow a user to configure the number of USB/IP virtual host controllers
and number of its ports using module parameters to simplify the usage of
this module.

Jakub Lecki (3):
  usbip: Convert CONFIG_USBIP_VHCI_NR_HCS to a module parameter.
  usbip: Convert CONFIG_USBIP_VHCI_HC_PORTS to a module parameter.
  usbip: Limit maximum number of virtual host controllers to 31.

 drivers/usb/usbip/Kconfig      | 21 ------------
 drivers/usb/usbip/vhci.h       | 42 +++++++++++++-----------
 drivers/usb/usbip/vhci_hcd.c   | 59 +++++++++++++++++++++++++---------
 drivers/usb/usbip/vhci_sysfs.c | 18 +++++------
 4 files changed, 75 insertions(+), 65 deletions(-)

-- 
2.43.0


