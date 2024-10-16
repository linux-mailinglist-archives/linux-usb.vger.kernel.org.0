Return-Path: <linux-usb+bounces-16342-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAC89A0E12
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 17:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7C361F2390A
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 15:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E7620E016;
	Wed, 16 Oct 2024 15:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="107p6FVO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01D02076B3
	for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 15:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729092259; cv=none; b=h3QpTJSliFgJGBX8JXaIy8JP0aC0PgQq9kwtYyHXarlbcqBJH6MK4aSM9MZUSNR/u/oU1/v5mVQ8maPb9q9xKxTEZgwiKIX72qmGKB1I7t1Zhcvu5PbnwTk1SmFRCfTazLfq7N/+hZFPcvrjQPqGWEhHdw/F51++jAijniIZarg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729092259; c=relaxed/simple;
	bh=GbXGjdX1Dr2Oee9k84WvyAAoh1Efv0lViBIMCmGYb1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PBioC69P9BIGItsWOGJxAEasXtknyq3U7Hcf7XQGCF26yvbpuYofC8KWHx0JMIzvEIKScuhZNtOfeuAZROLg6IHK67W/Zi3iEeMxRBc/sDK1hiHTVXhlyifHfTEttyMz/QYoH9uGeqVfBsdzOuyO9vcECt1RFcEkRRyGulcWEBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=107p6FVO; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c934b2c991so465a12.0
        for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729092256; x=1729697056; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vrc8esy1mHVI7WP06NeyO5yMa6lXp8Ynnils2Flmbkw=;
        b=107p6FVO53BFjrRMdR9hz9+uwqX5rCFh8yPVm5oIDNWYSU2z6nk1qojj7swS9e0TBZ
         x80HEaKUeJYANLpz4MWGusYNrj9+oiJC9Vm0pvZQJfjn8q5s5L4ATcxKwGdm+o+vX9Dc
         /mXWQruo/fwlW13jNIa1iSQyl40pzTJmsABnslEbV7NM+bCIKXxT8UUON4akZsoazMmr
         P4J3WFxGArGslSaVIJ/zm0squTUP2cva5VObKveDzMzEfShCX3OKN1jdGkEgc97B1Wcj
         aI4SXaRk4HAY84CDPHJrxUL+eaC3DnVaoB3CuqXdJYio1IHZLGxnnU7/nvTFxlqAzFuF
         VwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729092256; x=1729697056;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vrc8esy1mHVI7WP06NeyO5yMa6lXp8Ynnils2Flmbkw=;
        b=hquLI9as12q7O5uj4nRAERC/DL5tfLB4/tu5Q4jVtQTK3zIEWZX+l+bQgG6zTA4zn3
         geyf/el7Uvu7gn/5+rObR+EFK1hEtfK3hMthw3sQqaR2+0hKZtJjiN/OmZtq0e5cHnhk
         VTl3brN2vgRlYbUMnMpf8cXe4g1a2HCz9A8sIpxfUjn9iLsAj3qopVKYeXaaOsWKiLJx
         GB4T2J2IVad6qTHOHN/w2YJMb+cErF9XTr/KY+EgHjbpw/VAwVdnYus0mC/uUxxkcOp3
         OiEZ9V6c6REtRT47OAZKrt/nDBVamniRGzZLWMU4rtUoecuCYCmnG6bS9mljJ9pXUxiC
         jWfg==
X-Gm-Message-State: AOJu0Yzsz3y2eZhl68/DTLrsVXieSJSHAIVzmyYQFwOHH7ONmdu44V60
	5FQ+iFolZTBFeGL2DvgMB2Tsc+1tMyzJETcIszxjoVuci2vP/0krqRnZNGdwl777EsyBRHckCEg
	AjKlg
X-Google-Smtp-Source: AGHT+IG9mnB9BW6igr+s13cFGwzxtIMxDk9GIrI1fxeuwrcx6CG2Po3qh9GMewyeUtDTuWm/xFWh2Q==
X-Received: by 2002:a05:6402:2681:b0:5c8:a0b1:9c4 with SMTP id 4fb4d7f45d1cf-5c997a74be2mr4379a12.6.1729092248774;
        Wed, 16 Oct 2024 08:24:08 -0700 (PDT)
Received: from localhost ([2a00:79e0:9d:4:a496:e3cd:3667:2787])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fc45577sm4566610f8f.116.2024.10.16.08.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 08:24:07 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Wed, 16 Oct 2024 17:24:06 +0200
Subject: [PATCH] usb: require FMODE_WRITE for usbdev_mmap()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-usbdev-mmap-require-write-v1-1-6f8256414d5c@google.com>
X-B4-Tracking: v=1; b=H4sIAJXaD2cC/x3MOw6DMBBF0a2gqRnJtoJBbAVRkPglmYLfGEMkx
 N6xUp7i3pMiVBCpLU5S7BJlnjJsWdDrO0wfsIRscsY9rLGeU3wG7DyOw8KKNYmCD5UNXKPyoXJ
 NMN5R7hfFW37/d9df1w2vudcGawAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729092246; l=1198;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=GbXGjdX1Dr2Oee9k84WvyAAoh1Efv0lViBIMCmGYb1E=;
 b=rTm4b5cSTKEzv+kO7L3v9JQSbzp2tND5lbDhmES12Hqi2sgOEy8MAyq8H+0O7V6EwU8LsFzjN
 hVJHDiFkOiNAkflM9EYu406TTKHhC5TvdCN+sw+tJmCJP+jXoujwmn+
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

usbdev_mmap() creates VMAs which can only be used through
usbdev_do_ioctl(), which requires FMODE_WRITE; so usbdev_mmap() is only
useful with FMODE_WRITE.

On typical Linux systems, files at /dev/bus/usb/*/* are mode 0664, so
UIDs without any special privileges can't use usbdev_do_ioctl(), but
they can still execute the usbdev_mmap() codepath.

Check for FMODE_WRITE in usbdev_mmap() to reduce attack surface a little
bit.

Signed-off-by: Jann Horn <jannh@google.com>
---
 drivers/usb/core/devio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 3beb6a862e80..5363468a282f 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -238,6 +238,9 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
 	dma_addr_t dma_handle = DMA_MAPPING_ERROR;
 	int ret;
 
+	if (!(file->f_mode & FMODE_WRITE))
+		return -EPERM;
+
 	ret = usbfs_increase_memory_usage(size + sizeof(struct usb_memory));
 	if (ret)
 		goto error;

---
base-commit: eca631b8fe808748d7585059c4307005ca5c5820
change-id: 20241016-usbdev-mmap-require-write-7e56d528d062
-- 
Jann Horn <jannh@google.com>


