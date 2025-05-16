Return-Path: <linux-usb+bounces-24023-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDEBAB96E9
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 09:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DA68A00D04
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 07:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B40322DA0A;
	Fri, 16 May 2025 07:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mi2XYPBz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9382022D4FE
	for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 07:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747381962; cv=none; b=c8DssFaC3N5CzDzNP+bB0IACpTBvGs4oZSJAbIyFQsewqPLNe+zU73IOntEuTdWlI5/Rb7z6TUzshgfiGf8i59PmGcp/q9v17jlNCocdof9zYDVy3wAjn9cJQsrlyIQq22g44gtmMOtrEmqJIkE+GVtbXKYU6hP6ztWWleqwnEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747381962; c=relaxed/simple;
	bh=6yJiTwLoybt/zoUgminfx6704mwdtL2Dg1IT58c50rY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sp16sIS7e3A3EDGxDUnCUYLH8TdCvDIlBqM1d2nQLsjMmLpkQsuo7dSmvBygeOG4ePGAPkPFiUl+SkNJG7RMig9nuogQf2maKeUWK8IH9QMblaeHLNqt16TUcEAi4eyl2IvKGjUDm0iy3d/d+SPv2ZNJx+LldOHGQHQ8I+1nWaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mi2XYPBz; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-86135ac9542so68818639f.1
        for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 00:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747381959; x=1747986759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFcO4853m8kskyhkcneX2xT6tirKAj12e4AMlTYn0uI=;
        b=mi2XYPBzrjDkHi17FHCFX6JMEGtpqE9JyOI2qp/HOiyawJVFI2xhDjxFQA/Q4N2hjN
         BaVTGdA9imbIcff7Crxwc/191ho7Lt1oQSDZWzzh/Byg1I6Pfs+sod5uKPxZ9q9XrznQ
         hAoAXH10r3BCr3DHFArkNJneQw0+Gu9Q0HI2rEcV/DotZFa2etsfYU1udIoYtu6caS6L
         FyiRSBsg97fqxuM/7XQ3r2TBst/0BmSfr1GRWpWrxgB5K++f7hit9aYcpfGxDioEOaAV
         n6288VTg3TzXWqvzbOTMn4wvi3Uv7PKB5wHud7rzBiSAy+gvwSWPKaqNwAxMk21kBDGJ
         Q09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747381959; x=1747986759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFcO4853m8kskyhkcneX2xT6tirKAj12e4AMlTYn0uI=;
        b=ZjTPodk/M/RkK2Sqdvl6LObcwy6+VQIUh/iwca1kTYGmxA8cHZThWotszqweo2j+WD
         fQqHcaETxRvRoD/HNHGgZM0pvdnE6ob/i5zcq4LAbbmpkkF63Gh/nHwRCp16s8dsLt83
         CQZrA9VVx14aHvqmu4c4xLxGcZKL0VGrMlssGxDae61OaKG27+nx/J27X97/bih+CN12
         muuolDXeG0ykjNCn8eu3yu3te+NuWS14w1wd7hhoY4FJSXKTue1GmxQee+2RulkhR3uc
         LMHH9mPfVyl6U3eD4JydIU+qh5T4d4GWv/AWj+OPKdjOc6uKD2o55rS9ZnwFmLobBfa4
         byCA==
X-Forwarded-Encrypted: i=1; AJvYcCUl8kVR0GhZuUPGRdqcPLbXyczd7KGEcA3EVKcf5PATmBWmdcObLVr8CnzLurog8srRiyg8EYYvD2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVwyphM0kQn2VsdqRiMuGnenBzD/iukksCKFIdE4cyp4X7fV1O
	JCM1iVtnY6CMr8RPp02EOn8mqtIxmP40Xs6sUhI3mlRx1T+GSl7fE+py
X-Gm-Gg: ASbGncvTtz1Jh+etUWN3o/djQUzCsU6JNLkpI09JoD71QlPorc+1gjETEISuwEkM96n
	SYXI4SbAC3Bv1lBw7A9AgkzJyK7s84DYH3EPwENpnMMyZfpvnhm0wDk4bLuB3XieFcxnl4klabW
	BNWiz1JXimpwJjcy9fW4GL9UsV2tbDrunCVrevgpO4rzk2/pgBBl63slZwxiLWWjHJ4EmfbDSSC
	84Sj0nw2LCFajy4NSbXP3jjFZvQaGgN/hETkuqefl5ZI5bzYdZ5ETbTjLpTpGQPm7qcYEH/iJ25
	DkojeQkheMvKxd0Zd5X6qhaMobuDZiPJhMZ3E2INfYo=
X-Google-Smtp-Source: AGHT+IHNf4gIPEdQwn9qy1azGj95sakP8T4ipQNtyb++BsJlIWZRs7rSPXe/JZOOIymhpAkLbxlSsQ==
X-Received: by 2002:a6b:f40e:0:b0:85b:3ae9:da01 with SMTP id ca18e2360f4ac-86a174c1798mr628894839f.4.1747381959487;
        Fri, 16 May 2025 00:52:39 -0700 (PDT)
Received: from dell.. ([185.223.112.22])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4aa6cfsm281438173.113.2025.05.16.00.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 00:52:38 -0700 (PDT)
From: Vadym Hrynchyshyn <vadimgrn@gmail.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	linux-usb@vger.kernel.org
Cc: Vadym Hrynchyshyn <vadimgrn@gmail.com>
Subject: [PATCH 3/3] [3/3] usbipd: use usbip_to_int to simplify usbip_setup_port_number implementation
Date: Fri, 16 May 2025 10:52:04 +0300
Message-ID: <20250516075204.7950-3-vadimgrn@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250516075204.7950-1-vadimgrn@gmail.com>
References: <20250516075204.7950-1-vadimgrn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    - usbip_to_int function is used for handling arguments
      of options --tcp-keepidle,--tcp-keepcnt,--tcp-keepintvl.
      It is now called from usbip_setup_port_number to handle
      tcp port number. This simplifies its implementation.

Signed-off-by: Vadym Hrynchyshyn <vadimgrn@gmail.com>
---
 tools/usb/usbip/src/usbip_network.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/tools/usb/usbip/src/usbip_network.c b/tools/usb/usbip/src/usbip_network.c
index 15787044a7c9..26559a11e648 100644
--- a/tools/usb/usbip/src/usbip_network.c
+++ b/tools/usb/usbip/src/usbip_network.c
@@ -26,28 +26,13 @@ char *usbip_port_string = "3240";
 void usbip_setup_port_number(char *arg)
 {
 	dbg("parsing port arg '%s'", arg);
-	char *end;
-	unsigned long int port = strtoul(arg, &end, 10);
-
-	if (end == arg) {
-		err("port: could not parse '%s' as a decimal integer", arg);
-		return;
-	}
+	int port = usbip_to_int("port", arg, UINT16_MAX);
 
-	if (*end != '\0') {
-		err("port: garbage at end of '%s'", arg);
-		return;
+	if (port > 0) {
+		usbip_port = port;
+		usbip_port_string = arg;
+		info("using port %d (\"%s\")", usbip_port, usbip_port_string);
 	}
-
-	if (port > UINT16_MAX) {
-		err("port: %s too high (max=%d)",
-		    arg, UINT16_MAX);
-		return;
-	}
-
-	usbip_port = port;
-	usbip_port_string = arg;
-	info("using port %d (\"%s\")", usbip_port, usbip_port_string);
 }
 
 int usbip_to_int(const char *name, const char *val, int maxval)
-- 
2.43.0


