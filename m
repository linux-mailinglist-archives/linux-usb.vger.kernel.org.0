Return-Path: <linux-usb+bounces-5025-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C98CD82CF97
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jan 2024 04:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CE31B21E40
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jan 2024 03:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9ADC17FE;
	Sun, 14 Jan 2024 03:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDHMJeYj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147A61851
	for <linux-usb@vger.kernel.org>; Sun, 14 Jan 2024 03:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7bb5fda069bso334048239f.0
        for <linux-usb@vger.kernel.org>; Sat, 13 Jan 2024 19:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705203662; x=1705808462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nl5R37RgJiJE4BDM/vYyACgdd9Ip+Z4IoNGRc6eN0As=;
        b=WDHMJeYjXXHJR+PQCeOY0KddaPi66nXFsKCmlUNiiw3Cl8/uJhALm8gbbEFQA86GDa
         B7n8Cx0Y8N5bA3+rWNZp9VNo5SNY3cn4Gx7Psaei+YfvBEf/46R2CMyHedSeez7BQzpR
         lVeti0B8T6oAcD/N/ohP9RvA98eb1Xpv6escTRtTntAYUFlEbAYEJ3u4WsvOGrgPfx08
         KkaVYrwl5Y4/RLe4xbXrjY8aB408G07wE21YdyVtHvFaY+TZH2CRbqV9qL14gZ9GGBtg
         QLpIUBgVf7cplV8jc+FL5whjonTBfmazWBhkuPlrwTwcDebpj5yhwKlD9Haz2J4CJgx+
         2foQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705203662; x=1705808462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nl5R37RgJiJE4BDM/vYyACgdd9Ip+Z4IoNGRc6eN0As=;
        b=krx4OvFBikmM7v9uBVxaQza2kA8uZwqELo7JmNG588rmpKzJAowlt63pcyE7MDr1YA
         lbPGBfsazKOsg92hjly4e0e2mZC72LGhazJmWmpi0ZCOtmiQ/s/Ctyx5MU+UUEEliJAE
         jRUAsTjCbcGSqOkgmfLZAXUSBbZ12QuY5CwHWl4LWIGj2Iw10iWXniPiqV5XPSV4e6uW
         MkI2vzyKAhQaVWj9lCZvCTl75VljXyL5aXIuBUFvN/Xwaztcz25VuqTrH+u+9r/9hTNT
         wWzslW2aP9IPdEGEfiMVMbmJnDrpdUWIBaHadsSfpX7IdrO+rAJRB4wPy+enUy5C4pgB
         NLWQ==
X-Gm-Message-State: AOJu0YywA+QIhQGOBU6xvwjn8Xnc112X548H/erTd4kzPZSpBQKGDgPF
	US5498/9BKgssnF9ADQyMtY=
X-Google-Smtp-Source: AGHT+IEH6kwnBDO6OAxJYHf2dntwUkYAFG3mkuhFozgs5/F5OZGjqhct+pPE8QA5Xc/8/VCLKj05+w==
X-Received: by 2002:a5e:dc42:0:b0:7ba:9c04:2e03 with SMTP id s2-20020a5edc42000000b007ba9c042e03mr4980268iop.27.1705203662050;
        Sat, 13 Jan 2024 19:41:02 -0800 (PST)
Received: from debian.realtek. ([115.135.24.14])
        by smtp.gmail.com with ESMTPSA id c10-20020a170902c1ca00b001d492055303sm5415632plc.279.2024.01.13.19.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 19:41:01 -0800 (PST)
From: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
To: andreas.noever@gmail.com
Cc: michael.jamet@intel.com,
	mika.westerberg@linux.intel.com,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org
Subject: [PATCH] thunderbolt: Fix xdomain rx_lanes_show and tx_lanes_show
Date: Sun, 14 Jan 2024 11:40:53 +0800
Message-Id: <20240114034054.28562-1-rahimi.mhmmd@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While reviewing the USB4 Gen4 code, I came across a section that appears to be incorrect.
Despite consulting the USB4 v2 and Inter-Domain specifications, I couldn't find a justification for it.
Please take a look at the patch email and let me know if there's anything I might be overlooking. Thank you.


