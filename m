Return-Path: <linux-usb+bounces-7845-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60146878E4C
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 06:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 005641F2284A
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 05:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113F82BAF6;
	Tue, 12 Mar 2024 05:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOjWh0ha"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FDC111AC
	for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 05:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710222974; cv=none; b=j3r8OBnkH7/0J17O7OHpODdXGfl93vMR/LQG/AnnIaBlnG4qafbpFQpsAycIU696XT+5P3qt2wHsI2ApXFt44x7pCexWQKMcDKzSlX1O6daXHfFaUhO4FJW4h5q/NMKPNUc8GmHlEWFwaCujRwRTu1tiKetxdJsyhtqWha3kDCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710222974; c=relaxed/simple;
	bh=HA6xzbXEFgmNW5aXJev88R3ywTWxmsWWBzThqVQsfL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iS16M4zQl6V2fXDpYSMBAnNXcnPiOXDdYABKmTxUFiMwsDvyhwbx2RE2bLVkej6kGmaOIMGntrX7fLhb9OMaFIPdqV0pXny4Qz5e2GlLUTVjbUBs34wVAZCSB3BLBUp9qiAYRoGH2UV82ocKIqvkIicSV55/2T6l0iq4EHpdakM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOjWh0ha; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e64a9df6c3so4217977b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 22:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710222972; x=1710827772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzkITiBLhyrNfsAY55+TA7J2AEudtQ83y3uuGgzmOGc=;
        b=WOjWh0haWyKx980JwDUO7iQxDPy9OnOdqYw203CvNp6NU4eK1aTfuZEJ/TiERBCp6b
         zf8786h2cSiFMkCo8Za0DYVxEs5AHvRNwDjpULOJN0kTEwcw0svD6/drxlsluye4jcrO
         DV0rIH89R79/pPDUbaSjrBm/ZC+I3WFr9gQ+yB30inTX4snRI1/1J57WA6ss3+owK9mo
         ejHDGoEn003EQqgkw1H+4z/29wb776uijG7h6WZsBTS5VDM6IyMjU1+wtUNcdZwItm/8
         0u0ATjsgMkR05wEIVg6U1aQhlQHbXHt2KV68h9XDp+bXtScE9wHS48VRIyeJxpncFASM
         redg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710222972; x=1710827772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LzkITiBLhyrNfsAY55+TA7J2AEudtQ83y3uuGgzmOGc=;
        b=PDrOBotDjVAYWygrAV98xgrbBzYytbzsq3L5DfaLysjl5KkTNEHFBNpOA9jReQox2n
         KXHZrLPKQBlXH3wTJ8gHd+7GHq7WJnSi8pSNBp1+di1AP1Y3nFFPdxmVe005K8EtuauM
         4w6ew/IfGMszWvqlu54fWU3vr80giObNHcVb8xjdjnSVQUU6Jt/WN6ASEO3ynAdnTtBG
         +4pGPlsLezLsFfiOt+TYyDOEE9+jkcAD1GBw/KD97NQJTg9zknOyGN7PAXoBeEgerOeZ
         tl3aqQZgKDyRGv45CJpwQ8UDW+xuwIu0E5THHi0Wkqz31juHZM+GBzcnMdXNL2RsBOxM
         Iodw==
X-Forwarded-Encrypted: i=1; AJvYcCXHj+wJkBKcfpGn0gGrkJdjQ2orEd41MNcS9mkuBRLUf5p59FweF/VSbOAGnk77lxN/lPzREUPpMuw4H3bvAXQRg9eaxFgOIYv+
X-Gm-Message-State: AOJu0YwHbqV7QZ2XTwvVgj272x1cgSvQx1+0GgInxdhkaM/MiXVQ04wt
	fmFpNFTkSOx9bF5K33CzcnXCrq3hsVrUcV9DXJyjHBnQQHOXhmQv
X-Google-Smtp-Source: AGHT+IF1ofl+elb2wqUDPQOI2c520WhDD/HLlfM2OyJJVmet6pZaRK1HuwUU6XZr8gQmrXA1b/wzcQ==
X-Received: by 2002:a05:6a00:1913:b0:6e5:d3b9:2d06 with SMTP id y19-20020a056a00191300b006e5d3b92d06mr10649541pfi.21.1710222972485;
        Mon, 11 Mar 2024 22:56:12 -0700 (PDT)
Received: from petra.lan ([2607:fa18:9ffd::d95])
        by smtp.gmail.com with ESMTPSA id k30-20020aa79d1e000000b006e65720e892sm5448898pfp.94.2024.03.11.22.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 22:56:12 -0700 (PDT)
From: Alex Henrie <alexhenrie24@gmail.com>
To: linux-parport@lists.infradead.org,
	linux-usb@vger.kernel.org,
	sudipm.mukherjee@gmail.com,
	johan@kernel.org,
	daniel@gimpelevich.san-francisco.ca.us,
	hkzlabnet@gmail.com,
	reboots@g-cipher.net,
	mike@trausch.us
Cc: Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH 2/7] usb: serial: mos7720: don't advertise PARPORT_MODE_PCSPP
Date: Mon, 11 Mar 2024 23:50:27 -0600
Message-ID: <20240312055350.205878-2-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312055350.205878-1-alexhenrie24@gmail.com>
References: <20240312055350.205878-1-alexhenrie24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 drivers/usb/serial/mos7720.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
index 23544074eb1c..0e97def80e19 100644
--- a/drivers/usb/serial/mos7720.c
+++ b/drivers/usb/serial/mos7720.c
@@ -589,7 +589,7 @@ static int mos7715_parport_init(struct usb_serial *serial)
 		return -EIO;
 	}
 	mos_parport->pp->private_data = mos_parport;
-	mos_parport->pp->modes = PARPORT_MODE_COMPAT | PARPORT_MODE_PCSPP;
+	mos_parport->pp->modes = PARPORT_MODE_COMPAT;
 	mos_parport->pp->dev = &serial->interface->dev;
 	parport_announce_port(mos_parport->pp);
 
-- 
2.44.0


