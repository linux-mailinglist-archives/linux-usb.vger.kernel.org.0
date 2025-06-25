Return-Path: <linux-usb+bounces-25103-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1082AE87DF
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jun 2025 17:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87C041C21B5C
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jun 2025 15:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA64E286417;
	Wed, 25 Jun 2025 15:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nwol3brN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDA31E1C3F
	for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 15:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864919; cv=none; b=tz6Wvj3TS+eieS/4fidss5KEf0uq0ibUu7w1S/TDHXciwnNw4afVNrK4HGU8oF/M+vrFZ+O7ckamI3A1+VLMP809vBXl+kFo10T9kUUFEzyMp2bLul86AHThDFmQUXMk7KKOm6WaQ60dr79KXE+pa89e+y5MIeN/ILC0HjBsYcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864919; c=relaxed/simple;
	bh=zuIu2JkP+VByMmwOo0tadAV1iHKJrDP3Abn1qg3Qzl0=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=CwznSBiiS9gDqK7KE3VWGpZ/l0Itv2zkiMXl9uNZkH45ioWA+aG3WGamN0i2BU3p79osza4eH4QymBScrbyyuGWu+Ie+Z6t4DvTPz+AyGT1ACn5F6PiAg1cfsomax5Q7jYQ9EHk6VN0lM5blyMBzwdvvpDyNSBk65B4JPTzGUGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nwol3brN; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-40a4de175a3so36410b6e.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 08:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864915; x=1751469715; darn=vger.kernel.org;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yzp42f5lewsnvG/FHvqlSbFmAKtKH3G1kymBQyanvJA=;
        b=nwol3brNJkPydHOfJL1YVRo8TfqXQcm4eWAJEth22fouzj3WlhAiWdn4jp5UG2++p6
         GJw9fisPEldRd9oGGVfHhoWXWbecKe5MJMSWHeeW9qQSbges5O6Ikoh0VpnaC8NyNF7Y
         2Ts3umvqBE7mCqZqf581uWSYhktyI6/+MMC8FEV7b+qT1c/GYKYQa295RsynxSIdEWQL
         j0DBYe+MWDJn6keLNnpiTK8JqGRd8lv67CGnXPY5yKPaMCX2q9LTJbByNodaF5KM3fCl
         +sxlO72+LcCWgVIpBpO94CJqusF+3uAh1dP8FvQMqEZl3jYuE7Lz0NEkEZVgRXEjqX0P
         liLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864915; x=1751469715;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yzp42f5lewsnvG/FHvqlSbFmAKtKH3G1kymBQyanvJA=;
        b=H0NIoMRvht0odobd+Uq4sM/9m861X7Aafgw5gP5mYoUfi9TAh6iXjslHw9HurkTq2s
         7qV3ieKixOizDZTOFNum4qWBsIIcsR6Vt8mnSjd7Bjkgh8m2eRg2vz2q5ojEFGzLiI4w
         gombwT0Y9gxlMdPs/6RLV7ybTIfPQTz00ICsoQ/2+ky9mqRBCum2nMV8K0iKV925rtm2
         MFtzSj756wdjjh68Ldpi9xo4YK8c9f4DUgUq6G6EmrBpjZ1zwqFfrsqsueI+7qW88Qfg
         mS3DgSNJGqid5eALKXX4SBXvMkDUOVOtP/1OLPowzqRmjm9rbZ4MsszYrao/kSDQ7Q/N
         +wxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxcMrQAwr8O6ahawOM3m2diW4UbyraRLa61POW3atlMXFa5DAUxoKoX2Ml6YnpkXpZ5f0yZOYX8aY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZEeVTVtCNEIu2ZcgH9XiKcFjMDTPeVzM1zY3+BQpVCB5/Zhmh
	DuoEF3vMGUuUxtwvB6CL35UWxkB1aZyTnsgEkEdYior4XAFTZgcybTXiquW7iQkXpD4=
X-Gm-Gg: ASbGncvmiCC2RVg3CVK8qHsXoJ5FVxet9hFd0E4dnwD8BiFP3D0m0oFqboT90B16aMQ
	B+WViVFddCc4Zf56RBVotl1ys0RDtDsD9bVb5KW4TFx5UUQg9bSBpOGJ+MYhQXkpiVyprwNp5sK
	PwDOItcrpuDfJ5sgd+YxjsCVSrBuvo46HrWXvWuHS4Xmjzgn0NPRmxCOkFHpejvn8UAZkUjRfhW
	cxAANLUwa8hawGGCUUdKMFOoyDPj10Pbxo/p2ecJtsJ0YMD+n1lFC0yALH00mDKhd+dwQgrx3fk
	c/bFiWRO8h2eWNjrwRcqpWP/4KfMrMGc2mYoA+OQepbAjbJJagDpWJzL2mGPT2Tw4Avz4g==
X-Google-Smtp-Source: AGHT+IE0sp7UIYpHTtNI56eLO5T0nWk3x41wIaH4yAbmtO92FlclbiE0NYj4ZNNE5zKNcwsYhAbJ1g==
X-Received: by 2002:a05:6808:1781:b0:404:e102:f684 with SMTP id 5614622812f47-40b05751023mr3392045b6e.13.1750864915540;
        Wed, 25 Jun 2025 08:21:55 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-40ac6d11b42sm2202921b6e.38.2025.06.25.08.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:21:55 -0700 (PDT)
Message-ID: <685c1413.050a0220.1a8223.d0b9@mx.google.com>
X-Google-Original-Message-ID: <@sabinyo.mountain>
Date: Wed, 25 Jun 2025 10:21:53 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prashanth K <prashanth.k@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lianqin Hu <hulianqin@vivo.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Michael Walle <mwalle@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: gadget: u_serial: remove some dead code
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is no need to check if "port" is NULL.  We already verified that it
is non-NULL.  It's a stack variable and can't be modified by a different
thread.  Delete this dead code.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/gadget/function/u_serial.c | 7 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index ab544f6824be..96756a489d6a 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1501,13 +1501,7 @@ void gserial_suspend(struct gserial *gser)
 		spin_unlock_irqrestore(&serial_port_lock, flags);
 		if (!gserial_wakeup_host(gser))
 			return;
-
-		/* Check if port is valid after acquiring lock back */
 		spin_lock_irqsave(&serial_port_lock, flags);
-		if (!port) {
-			spin_unlock_irqrestore(&serial_port_lock, flags);
-			return;
-		}
 	}
 
 	spin_lock(&port->port_lock);
-- 
2.47.2


