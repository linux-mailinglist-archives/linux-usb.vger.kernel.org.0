Return-Path: <linux-usb+bounces-19266-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0205A0BF46
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 18:53:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19C06163857
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 17:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB2D1BEF8B;
	Mon, 13 Jan 2025 17:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIfY8p1b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A6E1BD9FB;
	Mon, 13 Jan 2025 17:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736790785; cv=none; b=ZkHa4+d3A/kHhw++Hl9yyZFviLB4C7iHhlKMoJjxua9/7ptjvgqrazScsI+CPc+M0LqYrDry5/WgXDYi88yHNsODD+V8P9X1Ri/eClILxlX0p1pPrRXwb1PsQ4USbZ7kLkEieD3Dz3Bl8/OvjwZK7fj5rMJfxYMBmIUGyKO+3fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736790785; c=relaxed/simple;
	bh=tVZ90TLcc9hnhgxdnwlzwfTH9WT3BCV3oE++gMl82Uk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XglBm/7pEQTwDujmPwcxsONWWkyiGX+1uOZ3vD36XTrrrmJuFb3ALOqJlxXyoNp6S2fU86lXL6AC+/sbSuTlA2uZoIZwoQNVyjLp7WwoJF4C16p20avk/h6b2RjT7/9m2pfsF4pMlhH6ssI3VcxIH5LYsFzawqIFtgZC/gGXjp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIfY8p1b; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ee397a82f6so8050195a91.2;
        Mon, 13 Jan 2025 09:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736790783; x=1737395583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=79vv5qRnf5VUTD34W/u3Z54GdzZcFo1kzpfwaK7haEg=;
        b=MIfY8p1bgarH0hHhJA8PmJ12+OA37VVjmdx1m5QmOmMGgnc4yWTZ0VkIBQf76LU5sr
         iJBZg23H3LMC+S9r17cwIYbQp4NqVBTxXaqppU3eRsh063+OdmAHpLCLvMs5nKNuXYrT
         8bFheCL9FESXlpPGCverQF/XKqr2mUu9Zn8hhPmziWdp0rekBrhypprSIiCmwbrSJP6C
         ELAJTioX09F/WruhjvQ8WP+oPCX+RqrCg2Z+I/QU5y+HfwLBbpVTqck9+ZKf8QibZ0Xt
         R/5tG0ELocbCIrwPrbLEGpDJ14xCUWer0cIXl1iFebbZHNr13FeSCTQYM+I3ofZLRLTK
         6c0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736790783; x=1737395583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79vv5qRnf5VUTD34W/u3Z54GdzZcFo1kzpfwaK7haEg=;
        b=LPsPHpHdo1D7trofK/6bID2LQEqUgQWZ4rw10iJtBztukF8vakRca764yhuDZQ6XOg
         RFeF4+GQOjc8D7eB7AqxM7L00WE/TTvEB3RaNJyuDCADIXZgN2YrVyoPl8M61/ErG/BB
         KOuQkJTPvgBE7+Xe4yhNAWYiw8aHjKIlQK45O2mNFnfv+tz3Idn2dy+NjNO1Eosw44jo
         dVamhMJlcrr1Dh5lghpax/Fhz16+tUQigoxchnMVvU1/lg0O36kRhnCoLAEnQoQig5fD
         ukDR1dR0Kz79xIcUvbFwSyaNr3VGIh/v8hTqPR9i9IgoWBnm4F2tI8dEFz8PYUhC2/eC
         8i5A==
X-Forwarded-Encrypted: i=1; AJvYcCUublJFdMXkP+DkAjQfCg+9/NDHP56FVmKgsFmXRTWuHEK6eF9jOHtFdUOShKqBgxt0pqcDvkXNA0hMcTg=@vger.kernel.org, AJvYcCVcTbBMsOyLQYEj8/0kj2AmPkWgY96fVT6cH+49+Qu0KdgiUtAz133F62m0JZEmUuMcxHinymCoekJj@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv0/EI2dDv7SLDHo40gquZg5Z4alxB8dFm0GI6oqxaQSsLqze9
	6ZypZRqZYiCaiJv/ehOqA8ZNiJRBP8UTndheWDbwbRR68o7tDSBI1Ox96suR9iycFw==
X-Gm-Gg: ASbGncs5JuY6AZacHx0HvU3xFy/RptQSBZX3Dq20P82xqEtAykaxFxFd9jenQaaUAeE
	Az+HpsAUgM8PgkRYFRs02CtCRMY2sOSJmiCfiok7TGnH4Lx700LjQtVTIOg+RVcI8LJtA62haGR
	GCv40cfkl1eEOdD93T0nYdGIpsZyQFUAXyR2YvY/1j0ID5WQ9BlQpYBL8GJhIuzB6j70NJ2qWYw
	Y1C7rSkDMduIkJ6zXnOaagZOFmQ8IpJ5bJyC9mPquBAG07UuW9Wlrg=
X-Google-Smtp-Source: AGHT+IHbe+EU0u+vYn02K4peLD4fFtvyRBm69Bsz3NzncYR0z93HeKYcBXyuS/wtO87b5wQDSjlSiA==
X-Received: by 2002:a17:90b:51c1:b0:2ee:f687:6acb with SMTP id 98e67ed59e1d1-2f548f35587mr30340159a91.13.1736790783334;
        Mon, 13 Jan 2025 09:53:03 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10e0c4sm55724905ad.24.2025.01.13.09.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 09:53:02 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] usb: typec: ucsi: Add a macro definition for UCSI v1.0
Date: Tue, 14 Jan 2025 01:51:25 +0800
Message-ID: <20250113175131.590683-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many platforms from Qualcomm(before X elite) still use UCSI v1.0,
part of them hardcoded the version number to dsdt, add this for them.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 5ff369c24..82735eb34 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -30,6 +30,7 @@ struct dentry;
 #define UCSIv2_MESSAGE_OUT		272
 
 /* UCSI versions */
+#define UCSI_VERSION_1_0	0x0100
 #define UCSI_VERSION_1_1	0x0110
 #define UCSI_VERSION_1_2	0x0120
 #define UCSI_VERSION_2_0	0x0200
-- 
2.47.1


