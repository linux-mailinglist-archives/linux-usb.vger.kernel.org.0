Return-Path: <linux-usb+bounces-23494-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB188A9DCDE
	for <lists+linux-usb@lfdr.de>; Sat, 26 Apr 2025 21:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAD2E922772
	for <lists+linux-usb@lfdr.de>; Sat, 26 Apr 2025 19:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD8125DD02;
	Sat, 26 Apr 2025 19:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCZp6F07"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5FA946F
	for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 19:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745694758; cv=none; b=NWe09Zd0zaZ9BBjdIMJJAnrMH9wbXMkBk0BvEfl4fq2nUclZ69QsrmM+d4FTe0l7Jd6EobhFkXZNCTQW4nm6t8my3rM5yiZy9RduNzSMHqVvKspmAS9RQ88JJHUFJLxyvH9JMqrmwS0jHEb/APdqiht36A55KikU/Mq9A1RHzds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745694758; c=relaxed/simple;
	bh=tDOqFySVnKUC35zBTQzQCAY2FUiPns1UDF4WUsOXxqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o0eVMn0tjrGcmBYTWgtBan6tjOKtJ014upDBvcY7KogF8Rac7H7CKXimwcDD1KgOCeSH/BSnqYaXaMJ3dPRPKws7n75f8YZn0GF0XG4IFvnHdzKGoUnykHn+r9nhvKqQTmz4WY9A6FRBTcAMKdGiRiVXRbtH3d7Sf+zhu9ekigc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCZp6F07; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf680d351so26062645e9.0
        for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 12:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745694755; x=1746299555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gE9yqGlmSoncXuH3bxZWad4oXNf956odcXkUC7ORXEY=;
        b=PCZp6F07dhJ08A8n4yvO8wd6JwlRma0Cpa5Q4qjXnJAiBAe1u7rSz0yZ2gvTHfYHZF
         J9fjrMYhAhO0g1Ff/s48VLlvwRZLY/D3gnplYpD+n1lrVGTHM6D5oJ/BMSk4h05eObtS
         OuKoz+IXbTxM5Q/kA+NYzCM2CWslkxPuTaVnaMipf0pV9xS7PKvyCNn+evzQV87+XVVq
         Z+Znt2oUyP/2eWPhgxPcDCMfEmvBhdePRC66iVJryDQxSB94WjDOgsiykqhQ6wWRx955
         VKzNQpH27ekXiU0zHab8C/wLxpbHzAk9jTjZbUp5WT2KGVocG6ozHoW2PvbJSSYYZNeI
         PXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745694755; x=1746299555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gE9yqGlmSoncXuH3bxZWad4oXNf956odcXkUC7ORXEY=;
        b=dtYmGw72HVjQJ7U//WCSsOGIp2IuwqKviUN23BBt0OQrvoPi5gZs09FJgYfJ57pyTA
         ChZYcuAXdkkqD7RxWHcJ8VXx6pGV4qJHmflgXFfdNiCX3At5d3g056mj0KcqRkh6rA9X
         kE7OZHbbEPJ68od7SiULYVUixzebZtvkIX3ahXLZAbclwwQKLjUg3DfBMgvC/S3vFZpp
         tGiTRNKkGlaT3MEOPUguIyRGxLfNFU4SWcgLBWBwlgCJy2ZptdfdhmdHmuXByYOxxYj2
         o4nT6kgM2GMeeFnioE1NHQyOxL4Eii52RjJX+/rZ1RMsn4GG7W8UShJgKcUptAEycB/v
         4oZA==
X-Forwarded-Encrypted: i=1; AJvYcCVff9r58JBB4sjS97LBc9aRk7l6OtdhkplHlCbOepX1AKEpF1tKpg7eiabF89hB3K5aXubipUoPlTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDBYtBH1mHQ5FtBYnEDDR3l2+VzEMLjrd+JDEPoXsiA2zUf7NV
	At3pMOGhd27jMClrxwlJdyAlCj40RXLm36M8mpUdwM9xh/zQ04g0
X-Gm-Gg: ASbGncuupjPrGVHfmUYIpMnwSoYXo/ZIwFiPanz7bV5EwlvfnXCXi0/5Ows/GseTtcW
	rcbTkwoMlSfLcfY0y0EKbgiKCrmKhj5tRo2CW8Zpge3/Z8lcQmpVziUeoObwvhfGawT1SKuSEMc
	q/l0rw8vWvpeNeeENUTnEnNLM6gxYoXhnWxQhF8GM/wa7Z3cwOaNyU4zMbCBniu3ljiFr6jr2i8
	3z0KqsQTFsHrSKK1iSPgNaTHYmb19w7VKxmO7YnAC8cGbvPZcdRn7pQg4jW4cfLD1sNS38JWlyo
	82y+T00rUUgV6D8Y46lvzwA4K0zhp1UBVyO7taussCbg4yW2QYf7R1eIML7dRJNIwiBK+VjJj8t
	l
X-Google-Smtp-Source: AGHT+IF19BppRCKBdoN1SvmBZf0ZO1XSQ89h6xC83lnKMgrC+gVX2QKtmzoEJRNInSjR8TA8iBBb7w==
X-Received: by 2002:a05:6000:18ae:b0:391:1218:d5f4 with SMTP id ffacd0b85a97d-3a074d4637dmr5083520f8f.23.1745694754536;
        Sat, 26 Apr 2025 12:12:34 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8da58sm6473285f8f.15.2025.04.26.12.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 12:12:33 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: guido.kiener@rohde-schwarz.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 0/3] Fix erroneous ioctl returns
Date: Sat, 26 Apr 2025 21:12:19 +0200
Message-ID: <20250426191222.13727-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recent tests with timeouts > INT_MAX produced random error returns
with usbtmc_get_stb. This was caused by assigning the return value
of wait_event_interruptible_timeout to an int which overflowed to
negative values. Also return value on success was the remaining
number of jiffies instead of 0.

These patches fix all the cases where the return of
wait_event_interruptible_timeout was assigned to an int and
the case of the remaining jiffies return in usbtmc_get_stb.

Patch 1: Fixes usbtmc_get_stb 
Patch 2: Fixes usbtmc488_ioctl_wait_srq
Patch 3: Fixes usbtmc_generic_read

Dave Penkler (3):
  usb: usbtmc: Fix erroneous get_stb ioctl error returns
  usb: usbtmc: Fix erroneous wait_srq ioctl return
  usb: usbtmc: Fix erroneous generic_read ioctl return

 drivers/usb/class/usbtmc.c | 53 ++++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 22 deletions(-)

-- 
2.49.0


