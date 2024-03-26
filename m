Return-Path: <linux-usb+bounces-8420-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCAE88C69C
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 16:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C6993076EC
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 15:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32EAF13C800;
	Tue, 26 Mar 2024 15:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBCVVH4O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682F42907
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 15:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711466216; cv=none; b=MimbbXrPNH2Rr3q3SLwMQrIRK7Ba8rx47s4QcpxC1KeySwMvrn0KC4Gm1fMPh5JSkSV1J4Ik9xRCostTJSrzh5tpGuiSiGgIGccjwlFOix8CuolC0LJG19gqEZAroJ/u3n1s7YpbSmpvuClFudsGXopVUnWe7Z3C2dfsFeXALAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711466216; c=relaxed/simple;
	bh=4cmdMwyPXZnbmlAkWONHSIHMfX0ryIdh2r8WRIwspjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QMyUh8Yuv6pLAblGxK1ipeJCuf76SpGgkLL1FtX0/Rmx2VoeFkzhb+6q955xRDjy92vdaki729HT4wU0YGAYn4TVQGAXX9GqkKHkEl2C2l8Yf+EUtD9Urtgw1UaSP9fdDR9KN+LBKd+6I1D+PTE0LUg7iVjriE7e6RHYBCgUFLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBCVVH4O; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e704078860so4051987b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 08:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711466215; x=1712071015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80R3LbIAr9TSsd6Rv5J9sBGgL/siwFRaAYcEE7moMKc=;
        b=OBCVVH4OL2yiW3NxnQndpnAmUs9R1FvYfWUYQDSY5//ffoeXRV34JtO3I/P8Da18Ff
         jnGTfIBqv06zEjER44n0rHOcEqfSmDz7/YmLaF4Rw1r8r4Z2SiSZZreztpz4UllqO7X9
         XaXKG1ruCYUIsIOFoUP7YfAWIk6Sy8FDztduAxeAAAiQqCQK2ZhhtTfOTaAcNFTOM0mp
         rzQoF+Kez4efRys7KQ8k02mirEwh7hRj6+S8o4LhKQM4PXIzt4+fdvJ/1saSqvFWLugQ
         5ogZAmWwIKMQLFdEJqv5izc7seZWwIxlNDGE5kbsFSwpjhzbbLKC4vANNh0Y5SGYp2Lx
         FZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711466215; x=1712071015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80R3LbIAr9TSsd6Rv5J9sBGgL/siwFRaAYcEE7moMKc=;
        b=PsetdbxPGDcXxdX9kFYkmF2ExI7gRfry+OFBBoGS1vlnkiLLCWEtPP99g9L4sGnhcS
         IX5jVpuN79Bi+mp7lFziH/nXWSYBVuantXG+1Ie2gWAZ+gN4V0+uwmPq5MQndcDvsJMF
         AFikXhPz81Okfdee/4MwInlYwlh4M7n3tqCEOThUWc04edMlq729VJCX5JQogQ7/NzbZ
         2B+w/fFZrYSQT9tkwX0NxpKK7LcMX7seRgA2tZF5TzS4wl1UzwNMzK0B3ZrFyo/wkGhr
         jU+XdCUjW359ANvoNwqlDPZlS3G+jb2kMctrgIxqweUYyn7yQfwteP3Ni8/crJRVn620
         ym7A==
X-Forwarded-Encrypted: i=1; AJvYcCXqRFfxPNFnz/ya5tZBCbRFWCVCmQ6vfSLjpjwKNpXUC63f4wPB7cOSutk39jiiiMclM/Y4BRi6p5GNClItskPpQgBWVXjJ3ocK
X-Gm-Message-State: AOJu0YwkTzsc7fQWOwi0AV7zPf/2d0omR+7uF6zdVl4GLgmz6+qkphYW
	b3bzX91hHVt7ixVtF7KOsXzsUcnt8HiXS/dW7T5HfOEEq+L6tvcJ
X-Google-Smtp-Source: AGHT+IHYa2McHy+rmMvoaJlciPJU7LHhtdQM8kbFPl4VDs609RHEGWwJ2cCUQ7qsY8AG8KJf5/9yyw==
X-Received: by 2002:a05:6a00:814:b0:6e6:830:cd13 with SMTP id m20-20020a056a00081400b006e60830cd13mr1800213pfk.23.1711466214605;
        Tue, 26 Mar 2024 08:16:54 -0700 (PDT)
Received: from petra.lan ([2607:fa18:9ffd::c91])
        by smtp.gmail.com with ESMTPSA id s3-20020aa78283000000b006e631af9cefsm6073126pfm.62.2024.03.26.08.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 08:16:54 -0700 (PDT)
From: Alex Henrie <alexhenrie24@gmail.com>
To: linux-parport@lists.infradead.org,
	linux-usb@vger.kernel.org,
	sudipm.mukherjee@gmail.com,
	johan@kernel.org,
	daniel@gimpelevich.san-francisco.ca.us,
	hkzlabnet@gmail.com,
	reboots@g-cipher.net,
	mike@trausch.us,
	gregkh@linuxfoundation.org
Cc: Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH v2 0/4] usb: misc: uss720: improve support for Belkin F5U002 devices
Date: Tue, 26 Mar 2024 09:07:07 -0600
Message-ID: <20240326150723.99939-1-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312055350.205878-4-alexhenrie24@gmail.com>
References: <20240312055350.205878-4-alexhenrie24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
- Keep PARPORT_MODE_PCSPP
- Expand commit message of first patch

Alex Henrie (4):
  usb: misc: uss720: point pp->dev to usbdev->dev
  usb: misc: uss720: document the names of the compatible devices
  usb: misc: uss720: add support for another variant of the Belkin
    F5U002
  usb: misc: uss720: check for incompatible versions of the Belkin
    F5U002

 drivers/usb/misc/uss720.c | 40 ++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

-- 
2.44.0


