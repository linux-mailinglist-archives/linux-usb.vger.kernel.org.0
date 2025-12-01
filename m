Return-Path: <linux-usb+bounces-31080-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9809C990F6
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 21:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F6DC3A52D0
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 20:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C44828C00D;
	Mon,  1 Dec 2025 20:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jfncj/2/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2E02472BB
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 20:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764621472; cv=none; b=aAD/YbVIlIr8jv53fLyEI2qYS6HPs27+2qClWpcLIYOwse9Qt6gd6m1Gfpi2sQIYsFkPbAdHDidcPQSc3+towsxdMw8/UnoP61U5GVcpDQPb0sp2xf95S9a4+zjoe+vvQZrf3QsATsHNHpmEnwGX+A5AnyPkP7yC87vG7yjwbR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764621472; c=relaxed/simple;
	bh=E+CGsND4ktzv4fl1slpx+4Ix84N/GoJePdgvIslDw/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qrNvyaZmY5k5LQgwb+M0RO7dPUV3hojMV3kX5nhbHeF8d59lExhLyzcGJVG7djbk8Uft5+3SI8/rtbG9Ln+V6c4/JB1e0VikoC4DOjP8FZoZVMfsuLrWNgtLWBLZwmsSYHAkKlDcEWnl5v2WfMLyU58l6+utUTeeLqVaMdryyKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jfncj/2/; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2956d816c10so49471125ad.1
        for <linux-usb@vger.kernel.org>; Mon, 01 Dec 2025 12:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764621469; x=1765226269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Foj/kZet4sWmPv6CgRgKvS0h296uX2HQ0BVM9JjiE9o=;
        b=jfncj/2/DyRu4dy9SMBV0z0MYMLL8LuO35YawBHkLwmeHhfssmRIpReSCYZ7aQJZGy
         kjaekYQTVp/tuqrtt9XuuWEj6g6Ull/BEg5w73XOE9LTPnwVFWF1rsJJJaKaMu/1udCi
         Bj7lCLCK34oZEUgIy0EjDbbV0gSJK7nFl2uFTr9Bgn56d+M86SouKugf9vTtusXlMnj9
         BtSd8XkTRpWeUm/YSH9yF9S+jO4zDpWv55tAzJ7mAeYIke8tsiOoW6nunEJqaE1pkQGZ
         6VVzY+j9YVtNe3f4O/6dQAv/xNnaw4zFFAc0ASIBLDTsKODRm5zoD/Eh2nqdUrlR7/0T
         flPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764621469; x=1765226269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Foj/kZet4sWmPv6CgRgKvS0h296uX2HQ0BVM9JjiE9o=;
        b=aJuOD+REC3U2YeBvh64fXT6UiP91m9SKwMrp96f5SvZsFdm0765rmcw4EPhYeZKjFR
         mHGaCCyELaRFERAXIj8sUAhj60bhSpoPRqhJb0XvmywMo/Z7eB9+4mbLVmx3x2NL/+/P
         H6LYsneXoMu7Y+USnx40CUDU9ZnYIJczjihGSEVQWwSO8XSUSaYP0+oKDz8jP7icn6m6
         0iuotQyaNWOdRIioookSdh33nf8nQQBMBPjGKX9Z9umfgI9ttMXj0Ag1cRK5v1J7Bd72
         PfRMY+BV92TquLSaNYSUDq9L1Tic4PG8quE1bauG2PCKzEiwveQiSc5ZYOFVXdHDVBa2
         mWVw==
X-Gm-Message-State: AOJu0YxU9lQDTv+0AyKjg1bPfObm+qL+nGSvXDjuWf8To5noKe3x2buC
	EZVnC8uhnHSxBaazCQ2a4+45wgC17O4qbxl/h/jSE5A3KzNhW+hQsw7j
X-Gm-Gg: ASbGnctny/li+qVuZ034lb0fVFnSZujTXtD2KgaFRcQZ0km2Xf1Y/WdgX+SXfGjQfgM
	J4TqsBqVWtQgVTpxjsSXDW+0G/tOj6yHRdy9+M1l4m/vY+xcXktb0RjnWYtO9/I/4ciWw8q6YmY
	Ir3sHmH+mIefskKDecEqrozJF7frIhyDF5AhugtB1hCuSzXDWV6Cxw/Irfv65S4FahzMwWdQ0cL
	lqvrHMdM3Q42tVPAZBp15e0q0yNkVtBVMhLiM4d/Aw1ynvufW4DwZnWkfQfg3HbQY2Rd3P2HUgu
	GZodbeivWPTCZahZMCvubf4e/D2ytU4ojKnkR9bqG5pb5E/AnzkLuaG0NNjDbSQqS5D6QYrp7WA
	ewK5+msQRzSE865qhtyrombzQwUNgj4zErdd7d9zTek+oMEpdD0ifqVE1g2twPFBfroN6lSESry
	m3JF9R4IqBMeGBTKkTFBDnxBgNnr8o0Sf5l7s=
X-Google-Smtp-Source: AGHT+IFpV3Ynx6OFmKG24ZAhlZ70Ahfik48Rrwq/82+ByEDfjerHTI7zqgix48BJMN/pNbi01wDMSw==
X-Received: by 2002:a17:902:ebc7:b0:290:ac36:2ed6 with SMTP id d9443c01a7336-29b6bead349mr470192835ad.14.1764621469225;
        Mon, 01 Dec 2025 12:37:49 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.177.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fb248be1sm13113892a12.3.2025.12.01.12.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 12:37:48 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH v2 6/6] usb: gadget: dummy_hcd: move function braces
Date: Tue,  2 Dec 2025 02:07:15 +0530
Message-ID: <20251201203715.17768-7-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201203715.17768-1-clintbgeorge@gmail.com>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251201203715.17768-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch aims to fix the violations of the kernel coding style by
moving the function braces to the next line.
---
 drivers/usb/gadget/udc/dummy_hcd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 67b453620..031f6ea2c 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1252,7 +1252,8 @@ static int dummy_urb_enqueue(
 	struct usb_hcd			*hcd,
 	struct urb			*urb,
 	gfp_t				mem_flags
-) {
+)
+{
 	struct dummy_hcd *dum_hcd;
 	struct urbp	*urbp;
 	unsigned long	flags;
@@ -2097,7 +2098,8 @@ static int dummy_hub_control(
 	u16		wIndex,
 	char		*buf,
 	u16		wLength
-) {
+)
+{
 	struct dummy_hcd *dum_hcd;
 	int		retval = 0;
 	unsigned long	flags;
-- 
2.43.0


