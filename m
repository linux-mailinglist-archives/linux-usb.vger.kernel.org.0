Return-Path: <linux-usb+bounces-19622-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F333BA19138
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 13:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42DE416633D
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 12:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56AB2212B1F;
	Wed, 22 Jan 2025 12:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1mcD2pH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471C3170A30;
	Wed, 22 Jan 2025 12:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737548153; cv=none; b=ALplMikqZi88uDl4HPS+9ia0uYAJJdNWnHwNbBnqtcJyCovdNgeJnTOYJisF/TJnJosppVfe7BYkVTaCpdOqezTeFuUzmvlKtggczuiBf/fQyKowbvd9NYXOAyTysW18oS9mq+F2KbUzIPmBbFHyl9Ofq7KpcqYevw9nox7yjAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737548153; c=relaxed/simple;
	bh=Esu/gW3ljXU5RjT93ZpsyBmP5PPzP7mRMSmT1r/+V5Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YUcQTE2gyijtTGw5Hf1qCTkQVX9/WMWDgnAC1lxrMWqOngVSYs4gq5cpv7UHQCzzjmUe6zq5XG78uDIn+0Psglr7x7E0eQNAE14x3ODuJnYo0uoqvLuGp15fqYA6New3/5nYsoQzf/6E51FGN2T8yyrLFoOw+WWp9GETK3bHBRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1mcD2pH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-438a39e659cso27665515e9.2;
        Wed, 22 Jan 2025 04:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737548150; x=1738152950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9YgVBuYheyP8aYKgbFBc2QfSvc7KqXacR7RJCCcVFRQ=;
        b=G1mcD2pH4L5hpmbJUIepEMjAYT7QiGR894RjTpPxeGvAnGNRaL2mJAvxlAfc1m+QHB
         8abUh/Fgsko8U1d/jpvltvj428SZZwL6xEJItlThKS78pmSz5QLVs9cb/iVq0g4Zilem
         3kPJj+r93CNw3w+3PSV8Ln4hBXFKjgqQ+LwzRPsvXTEsw5G/NphKxTrP+Lgy3N2NB2x9
         h+bd+UuCw9Xz7+o2OUCrVyfP7HEA163FWyfMb2lQzVVNm8J+PMzJQtEsmcxT1pJbqtdI
         5okikfGA5rt5kp6wueIn5K6T8x+tpXY2p4k3wDLTgOOESDuURlFTCjD3qKUrRuA0ZSfb
         SQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737548150; x=1738152950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YgVBuYheyP8aYKgbFBc2QfSvc7KqXacR7RJCCcVFRQ=;
        b=OTptSQ28qNArBzbri67/0U8Qe89gRwh6AXhQ0RK3iaYwr0MI4aske1to27K+Jbs9lT
         5H+fvXi7l6qUjie9i/ACosn4r/KGOST7nj+DPkgkrl8XPzB+erOYQY6qPF3CHD2vxHfB
         PIUYRW0kKRHTC7Jf2U8Z1Nb34jBNrEbPvjBZqyiO+kho13JlzAXaj9utqQNkfOFK15v9
         U5Yqxco2jisBtK5RAxJOP7cCMYYCh5m52l2TbdiQJNse0Hz+4NfIZPHrCpUB8XaHCdMP
         LfgEj7ddueIOFnSWgf6TNbvF6g/OjfJazPIunw//X6VJ5TBY9GQPn4hF86gDeuwgC7Pf
         0cjg==
X-Forwarded-Encrypted: i=1; AJvYcCVKRua9OOnMSGsvWcEtzxXFfhNPDSLboIccVi/C9FOJ1g2gN9Q3CdNPdSuesUPXxZHwt8lTBT1Dc28KBb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAmHvd3vnBF/6aHRVxWPQyYj3R9dgjyjxMlvY095nvP+891a8X
	sFuLCAr+Pwwu3/CjPxC41deX4i9PUwp71y7DdPYXNaxNIljEiF3q
X-Gm-Gg: ASbGnctq2LLsq6olGFfSzZcwr8smR4N2PQK1VNxO7g24a647kyYvxe58kmvi+oyL0Y4
	D2Nb3WAXgOOfErf6E8CMfRXer7OQhceDHWLuEaX39aTqw2R4E1jv0XVStQH8nP86BF01uEjfc1w
	ktFva57Bu9UiGgYIVTckaieSH5WvV7GHhRbUsTYFKUaUZfDJqM3J081QZVuBFvtVhqchuYqN8aT
	v06fj9UdeFmtDXGF0N6BTRqyVtibBoJ2uNydtSZ1uYDL3AI4+4AvjEQ5WuTbrE0Pqw0lg==
X-Google-Smtp-Source: AGHT+IEbxXH8SE7UPAEh3cMCYhzxh3y6HSR2HLtYKa9xOvpIbtqo30aSQGOMfzb0RhgfkeZPheqe6g==
X-Received: by 2002:a05:600c:3b27:b0:434:a29d:6c71 with SMTP id 5b1f17b1804b1-43891438b58mr181858175e9.27.1737548150253;
        Wed, 22 Jan 2025 04:15:50 -0800 (PST)
Received: from qasdev.Home ([2a02:c7c:6696:8300:60ee:6158:3505:672])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31aefcbsm22226265e9.17.2025.01.22.04.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 04:15:49 -0800 (PST)
From: Qasim Ijaz <qasdev00@gmail.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	gregkh@linuxfoundation.org,
	sergei.shtylyov@gmail.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot <syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com>
Subject: [PATCH v2] USB: usbip: fix null-ptr-deref in status_show_vhci()
Date: Wed, 22 Jan 2025 12:15:29 +0000
Message-Id: <20250122121529.15421-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If usb_add_hcd() fails in vhci_hcd_probe() (i.e., a probe failure),
the error path calls usb_remove_hcd() and also sets 
pdev->dev.driver_data to NULL.

Consequently, any subsequent call to platform_get_drvdata(pdev) 
(which returns pdev->dev.driver_data) may yield NULL, causing a 
crash if that pointer is dereferenced.

Fix this by adding a sanity check to ensure "hcd" is non-NULL
before proceeding with further operations.

Reported-by: syzbot <syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com>
Closes: https://syzkaller.appspot.com/bug?extid=83976e47ec1ef91e66f1
Tested-by: syzbot <syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com>
Fixes: 03cd00d538a6 ("usbip: vhci-hcd: Set the vhci structure up to work")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/usb/usbip/vhci_sysfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index d5865460e82d..d4a1aa6d06b2 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -76,6 +76,9 @@ static ssize_t status_show_vhci(int pdev_nr, char *out)
 	}
 
 	hcd = platform_get_drvdata(pdev);
+	if (!hcd)
+		return 0;
+
 	vhci_hcd = hcd_to_vhci_hcd(hcd);
 	vhci = vhci_hcd->vhci;
 
-- 
2.39.5


