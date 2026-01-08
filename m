Return-Path: <linux-usb+bounces-32048-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A703BD020F7
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 11:14:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A8553346D77
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 09:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A2C3ED64D;
	Thu,  8 Jan 2026 09:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YCxRmC+O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619C63ED63C
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 09:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767863438; cv=none; b=tJdkQZDnViNldwOGMyw8RaqiKBhnXkjqVDLvDCMoRfS7bx0IfKqCgMm/0vUN0aRuezzWQwYd/1wMzvF29oK42cHgwo689yRYqPw9bJf3ynxsxZfQJdaT5nx8PAhoCk0KOU9C/3IOkmecUG+nCCQZmsB6+SwCOmecAmQW2JLIYPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767863438; c=relaxed/simple;
	bh=My9LdPfbtVFSB3sp0w6t1oa4q3QaS94XKVQNWPjyMq0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZtkOLtrWjZ/EorGMyWnv3IKk0D0uQA5VAC8SwdnapEDu5wbx8jTWVw4uTrd/xYNPSam3g9kZsWWg7Svz6yzcGfiKa+Hh7CtCTFggi9EisKJT1tmjIwfwm2KGYs/gYN0WTj25EBGtbwF43WhCQeigHZwCqnhaTgdyddN37GWCzV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=YCxRmC+O; arc=none smtp.client-ip=209.85.210.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso1880473b3a.2
        for <linux-usb@vger.kernel.org>; Thu, 08 Jan 2026 01:10:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767863429; x=1768468229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qiMjUjf8apd8PnqE5AATGbYetcy2Uw3TxDHDwt6y7V8=;
        b=JgV+eMcUhzFxJqYFaPdPeNKtBYmuLFcVrZefVewkyRX1xlBuOqHHXYBArx6lRH9Tt7
         fZPQFYplojMGwgv34tWJhFMg7mPaylh8ywmA/yOig30z7ARChT94e6ggV5/xtX8bba9J
         rXxq7Uxy+LMQLaKjLVsvt4WMhnU5ZComFQ/K2TL3lJDFIJyfBwfca5MnkxXwk2sAtw/U
         na0mHF/ookt2GD/ft1DuA82wS80i+RVw8VgFJnDRyMBOIUyBL4iOpXJe8vyxR3u1hyca
         AtuiQYIEGvLKM2IrCrv4zJCo/tKzD/DMHQsbzmwYfvH3boDt86DWBBsGJp6LDhDYbE9k
         YdFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBE4byZfa1K7RRbvBDpoNVcgsASF7GlvexqD5w8/7FIjg6S1fgvKlUG1wA4fQsksqnGcnblqSu0hY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrJaSF2Nik0atP5Cecch3eUzFOh+0ej5mwKHjRilDV/a5sX2EZ
	ezbEurCT3u1P1V+pQ1P9CrAnpH8ods5Kq8HkQcX2CRv2+hNKg6qajy4fUqFG4qRUcLcB2+GAOtF
	PU/IUnG8nOb/r6OZ048s1c1B1A57GjrYzXlsBKdBjvCO1fn0nODVeuTzm9OuoIJDzdbPOy4fP6W
	SBDF8A+SMSJwJCgKGHPzPx1m4ba/5/FfkO75YWYAN3c88+4xuKijU8ROL5Sk629Piy52uhQ1l9F
	bLHKMMNHvJoz8WzvXc0pw==
X-Gm-Gg: AY/fxX7b4S4ZvhnILHASOa4cxoKFZt215W0rAeP1pv8yy1+B135rwewKR9/NwBqdNxC
	/7QP6zfgoQk1GdEMEShg5JF+c04+TSvlaY8dR0j8DSw9Lq/hXkMdWpFB9UwZe7ITTpM48g9NVcC
	RCkNQSE7rZADPUbZUqV002F43emCK1QEHd/vmWPfYnF2mmOsNhnkYRlMeCiH/FB3vPilhCGMCxX
	7u7ExIbRZAXd/yUnpEAwrdbEwG7pnfrvfBbPyciCefud4TlW1xMY2pQDDXUXgFxFrvjUXtMpUnc
	d5H3V/jHPAexE1y/DjlrSWZR/BCULjuUkXBUBkb1AiQtYp7N8aj7SATgm18WnjurrFvf1Ro1YSE
	L4pvYNRR7egLExcB5TGu5RZt67EVBmzASjWfp6uxHotAuLci1byBfglFER/wtyLgaR3R77gXWS4
	oA3zje5sVcT4CB3V+CpgY5FAnO+DS4zz7N5j26Gt2MZyw5voTheAs=
X-Google-Smtp-Source: AGHT+IF1aar5h1N1Vdrv6rDAO0Z3HsJ1s2NveEMGk/H82/yIMnJeEOGZ1G1ua3TDk7XqA5vQxNAXDJruponE
X-Received: by 2002:a05:6a00:1bc8:b0:7aa:ac12:2c2e with SMTP id d2e1a72fcca58-81b7d8563a8mr5060076b3a.25.1767863429148;
        Thu, 08 Jan 2026 01:10:29 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-819bb0dfa0dsm731698b3a.3.2026.01.08.01.10.28
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:10:29 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-11b7dbce216so3498714c88.1
        for <linux-usb@vger.kernel.org>; Thu, 08 Jan 2026 01:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1767863427; x=1768468227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qiMjUjf8apd8PnqE5AATGbYetcy2Uw3TxDHDwt6y7V8=;
        b=YCxRmC+OsyOi89py4gTyrZZSe+O7wXRx4BNQ133qJOA4+Dfv6Faz7VszQ/D/XAM395
         UzpUTeLyFBUIIcWnPMeHUEhgs4BN0FDPUmfwoRf4ooGuQtYlI7JSDdHRPh6ZxcJ9Xnv8
         6CuFtwaJWov3pt65U3NL//GJxIaZe+/DziOlU=
X-Forwarded-Encrypted: i=1; AJvYcCX6uB8saVkc55xIWvho2/51i34OLr5bhG1xBK5LKKgj9WEiiDFzcVkkvZdTgWXcm2FQBr9n1O230Ig=@vger.kernel.org
X-Received: by 2002:a05:7022:493:b0:11b:9386:825b with SMTP id a92af1059eb24-121f8b7799dmr4741738c88.48.1767863426953;
        Thu, 08 Jan 2026 01:10:26 -0800 (PST)
X-Received: by 2002:a05:7022:493:b0:11b:9386:825b with SMTP id a92af1059eb24-121f8b7799dmr4741707c88.48.1767863426192;
        Thu, 08 Jan 2026 01:10:26 -0800 (PST)
Received: from shivania.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f24985d1sm13267619c88.16.2026.01.08.01.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 01:10:25 -0800 (PST)
From: Shivani Agarwal <shivani.agarwal@broadcom.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: mathias.nyman@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Shivani Agarwal <shivani.agarwal@broadcom.com>
Subject: [PATCH 0/2 v5.10-v6.1] Fix CVE-2025-22022
Date: Thu,  8 Jan 2026 00:49:25 -0800
Message-Id: <20260108084927.671785-1-shivani.agarwal@broadcom.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

To fix CVE-2025-22022, commit bb0ba4cb1065 is required; however,
it depends on commit 7476a2215c07. Therefore, both patches have
been backported to v5.10-v6.1.

Michal Pecio (1):
  usb: xhci: Apply the link chain quirk on NEC isoc endpoints

Niklas Neronin (1):
  usb: xhci: move link chain bit quirk checks into one helper function.

 drivers/usb/host/xhci-mem.c  | 10 ++--------
 drivers/usb/host/xhci-ring.c |  8 ++------
 drivers/usb/host/xhci.h      | 16 ++++++++++++++--
 3 files changed, 18 insertions(+), 16 deletions(-)

-- 
2.43.7


