Return-Path: <linux-usb+bounces-17115-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D24F9BCB53
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 12:12:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8CB7B2171B
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 11:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6751D3590;
	Tue,  5 Nov 2024 11:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dQcJF7HR"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481681D2716
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 11:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730805138; cv=none; b=g6/cINxqCv87yTZI+gJseo296oYq9Yp74Ulezeag2zsbuROAuHsbr9urSYyQqc/zGew+7e+GfEx4hWZeyorQodA96jsFdFqYxR1JlwM76PlIPtw6cBD15/jb1KyxyovbQ5RAtX9qxf75ydLRthk7emPovB+5d6mFuoTpnjXgcJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730805138; c=relaxed/simple;
	bh=EUjOR/V1/Ff7FCV0KtVJ6a801ILitSsONPj8+8g6O7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rVF/uwCRlZMpUouTvu5WsT3hXPIWQtYh8apdctwumFJW6aSJrMTOwCxsvRL5A+/LHy2IaGGv4V8UQQpTNXVeeeyYxJQyAjt/nIX+wLrzZfKURFf3DSztosuFgMElFpl5rPbX96DGPyFVVdC9yuYOczZVoZkGLvQWNx5ghTFypwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dQcJF7HR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730805136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yCvdUfc//ZWvKe194x55fTwuIp9lO3BXGQHJFfiBiaE=;
	b=dQcJF7HRkaQZ90vtbZLpQImlE+I0AGqt/+Zs2ierA92l9+cNmMeG1EELzxL5o4kMPYR6KN
	/yzBbjtytteqIEMcamVMb2orxWU8inRPuCjVwuqRsKxx+2UQoL6/9y+KlFD0ZbWF1qBKP5
	9RaUaKip5ta19OxKAccQuy4gP5Fnsr4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-2-Fl5GM0MLeDE0MAAukqtg-1; Tue, 05 Nov 2024 06:12:15 -0500
X-MC-Unique: 2-Fl5GM0MLeDE0MAAukqtg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4327bd6bd60so35483605e9.1
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2024 03:12:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730805134; x=1731409934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCvdUfc//ZWvKe194x55fTwuIp9lO3BXGQHJFfiBiaE=;
        b=YWYLALcncyoIibpXD1IB62bZ+Ggu+u7BDwyMgol5xTIJwDLw77G9v8dCa9GQQgSRHa
         HWXPEr4bg6tdK3uEKeqKNJBYRMqbFRvVtpbiLWa6oKHPPM9p7qtOESvbNLL1fK7+ZIEz
         +CJ4KBxfy+gXZncFvI+0XfYcivv45wuDxm3zjETc23fkxbLPJbHSqWNBM4MVswUcteHw
         EUonJ/Nwr+5HbFKdt+Rm5JuYedcpDKvFgStt8BY+KudQIB1tdbHoOSFtWAOtT++omG4a
         0wENLF8+ERrYAkancawkClA831ODFt0Hhd5YJtC/Dt+h4/dc1b0fLUcdelVKaxtoG0LG
         FxGQ==
X-Gm-Message-State: AOJu0YyX8wWWFqFJtoFtxDagTd/cQu3iXQ985sVVcbdHHAl/39j3RiKi
	VYchiKqIffJ+2fAoNXYmCfa9r4YpQ+50WJ1aVjDhhez+qM9V+9RtZN7y4ToYxecfK1Finrob8sK
	EBKA4atUnqBeQWMsTwT8me8+o+rumGZl9w4fYaLaPasNOlZr7ws196a4isw==
X-Received: by 2002:a5d:5f41:0:b0:37d:4f1b:35d with SMTP id ffacd0b85a97d-380611ff128mr28662023f8f.48.1730805134144;
        Tue, 05 Nov 2024 03:12:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESHCOZomXTbsA7mek+NYOSWPjCHtTlyjVpOUcf98wwcSXASlnKPOIrcK6yEt/H8DUdWzsINA==
X-Received: by 2002:a5d:5f41:0:b0:37d:4f1b:35d with SMTP id ffacd0b85a97d-380611ff128mr28662000f8f.48.1730805133781;
        Tue, 05 Nov 2024 03:12:13 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d4392sm15860512f8f.36.2024.11.05.03.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 03:12:13 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH] thunderbolt: Replace deprecated PCI functions
Date: Tue,  5 Nov 2024 12:11:33 +0100
Message-ID: <20241105111132.57339-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcim_iomap_table() and pcim_request_regions() have been deprecated in
commit e354bb84a4c1 ("PCI: Deprecate pcim_iomap_table(),
pcim_iomap_regions_request_all()") and commit d140f80f60358 ("PCI:
Deprecate pcim_iomap_regions() in favor of pcim_iomap_region()").

Replace these functions with pcim_iomap_region().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/thunderbolt/nhi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 7af2642b97cb..1257dd3ce7e6 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1340,18 +1340,18 @@ static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (res)
 		return dev_err_probe(dev, res, "cannot enable PCI device, aborting\n");
 
-	res = pcim_iomap_regions(pdev, 1 << 0, "thunderbolt");
-	if (res)
-		return dev_err_probe(dev, res, "cannot obtain PCI resources, aborting\n");
-
 	nhi = devm_kzalloc(&pdev->dev, sizeof(*nhi), GFP_KERNEL);
 	if (!nhi)
 		return -ENOMEM;
 
 	nhi->pdev = pdev;
 	nhi->ops = (const struct tb_nhi_ops *)id->driver_data;
-	/* cannot fail - table is allocated in pcim_iomap_regions */
-	nhi->iobase = pcim_iomap_table(pdev)[0];
+
+	nhi->iobase = pcim_iomap_region(pdev, 0, "thunderbolt");
+	res = PTR_ERR_OR_ZERO(nhi->iobase);
+	if (res)
+		return dev_err_probe(dev, res, "cannot obtain PCI resources, aborting\n");
+
 	nhi->hop_count = ioread32(nhi->iobase + REG_CAPS) & 0x3ff;
 	dev_dbg(dev, "total paths: %d\n", nhi->hop_count);
 
-- 
2.47.0


