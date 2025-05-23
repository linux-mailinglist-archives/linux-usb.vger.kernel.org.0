Return-Path: <linux-usb+bounces-24250-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EFDAC1F55
	for <lists+linux-usb@lfdr.de>; Fri, 23 May 2025 11:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D36104E29C8
	for <lists+linux-usb@lfdr.de>; Fri, 23 May 2025 09:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67BD224B10;
	Fri, 23 May 2025 09:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hlJuvQHM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6C0224893
	for <linux-usb@vger.kernel.org>; Fri, 23 May 2025 09:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747991292; cv=none; b=dBp7gTRao8W6fWytd0xxDMlacVPpLF/4Ul6K4Pb1cIZApCzKln+6qaOLtDBenoHIRaj1DLsO+ZbRdWGQ+eKqb5WfsDRPPzr49hIQJ4lq9Pro0SnpM5oo/1CcqdtDdFzWKNKRgiOeCLU4zWlPYlBcc8MHiVZd7VJzkeznNlXKT1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747991292; c=relaxed/simple;
	bh=y8fvM/8MKTAHq+U3gMcY8jxYi9epN0rxwGUcS2EA3SA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lOGO4k9JAiCwwcqEMe/MvTOghNZusFaFYFFiqBRWSbRESjZD9rkssjZYQPa3ikx81WqIIRB6jYPQbzsZER428gGAqG7RYR9v5eYbwfEwC/Da1oSv8ZlYDpVr+98ylDf8zfPyVhVb1JPJr0DNnETJiMmBCP9DxDeIgeBaLJJ1x4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlJuvQHM; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-327fcd87a3cso74421361fa.0
        for <linux-usb@vger.kernel.org>; Fri, 23 May 2025 02:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747991289; x=1748596089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmE2KG6N4yDfu1dF3+QggpGSMX7xbQbqHErllsMLWXc=;
        b=hlJuvQHM4OaZ0inAxYtWfzUR8pimZPbOK0qZ8e0L28FOfBVR+ieD7E+1zqjcQhgune
         XSle9JRCHfd0P6QnyqVqUC5MkOxbnYHpWtE+pAdaeuKFd6XrqJGKInLyQ+UGqtIoz+Xt
         Stg95J2RPCXaVITjvHof1EtnU8pqCSMo6bLAjwfwILOqrM1zEX1shNYyngv7Xl/oH1SU
         +Nk5IjjOdsRE+VPERve3dJZpIXnu9qPxSypVhbHm5AE2H227ewXjls2KRNqGYEoalFOU
         kPGwK7apYVhCwR4lZafJsDgP4LYsBRGaMu/rBuuLX47bDVKjdTisMkOq/E1RvCq/8vjC
         /RCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747991289; x=1748596089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmE2KG6N4yDfu1dF3+QggpGSMX7xbQbqHErllsMLWXc=;
        b=I0lqIkde1DIGr/SrEzhIgwvg9uhZTOiuKNBxyjW9kvlDTQvLOI/7haCo6M+vpCFr+t
         bl5NyLoesmHGV4kKNdbYGGeVR5Xaj4PO2oY9PhLR6602pC6R3Be8TRkkpZAV2oyHgq5U
         rBhaeOMBBo2TNITjVMQ+KfHiXP6JC+mgvaHi8zEjt/SDYdoP1AJpdldMtSkKVPJJYENf
         mos87ZtXRDiiGLMtF3PeQyaWRIqkfDXBp6cFJ7G3bscUvZgSGxnWgB/lqguA0WAu8qkK
         k58h4e0cpA3k9rtWn8LBlTXGomPJWLnGbP5w1UOMzycOT8Iqdbz/nYh83j2ruf36LaeT
         qm2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrm069ZCST4h14s7OGIc8f3cagll8PrO6JUBhx//2jxMX05CZbMNFA5h7038S8ok/3jhVhDxWLMfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgtSWP/cu+Y75Z5dpoPQ/PZflc0NoMKRhsnSQNjKWQ7RDDdN8Y
	jrlwjNG03LDEM+ubYaO31055UPsKaxkJDm8afwfq+jCGFYdm38uOkfqu
X-Gm-Gg: ASbGnctCzk1HcZTP3WvZ20A4U6XhRJO5ATufbCr6Kfk8vBEHoD0Hc9vwQaYirDOzDKn
	6292YYO8WsofHiUgNz+hY/IvJcRJr19za0wb4Tv6ruD8gYdFLrKS+aiGZwHk4IBk1J/NjZ4Atvw
	tM+EbUYWpbKcRAHlyBhqkDTqqzQtrLMb0/dvPbnJVeOXyL2uYzwrDfkuHVlIWWIoVcpgjAzkSIS
	Wex4tswwjGWodmtMWXY7UJSIsiaMutNYJz3gWSbjP9nOEc+Y+JMAATKxogbiWiBdVaHVH0Y8fzG
	GqrdkQHSSz06jhHU3U7rZe49YD1Ga4hOUxPMn8LV
X-Google-Smtp-Source: AGHT+IHFX+R2F0Ep9HST02KCl4lPQz1Mbpuf6aY8sJy0tilrLeqxpdGdEiHBk7oYzXixVq9RSGrOcg==
X-Received: by 2002:a05:651c:111a:b0:30a:44ca:7e74 with SMTP id 38308e7fff4ca-328096bd752mr73924761fa.12.1747991288670;
        Fri, 23 May 2025 02:08:08 -0700 (PDT)
Received: from dell.. ([193.0.218.35])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085f64a0sm35318391fa.114.2025.05.23.02.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 02:08:08 -0700 (PDT)
From: Vadym Hrynchyshyn <vadimgrn@gmail.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	linux-usb@vger.kernel.org
Cc: Vadym Hrynchyshyn <vadimgrn@gmail.com>
Subject: [PATCH v2 3/3] usbipd: use usbip_to_int to simplify usbip_setup_port_number implementation
Date: Fri, 23 May 2025 12:07:25 +0300
Message-ID: <20250523090802.17987-4-vadimgrn@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523090802.17987-1-vadimgrn@gmail.com>
References: <20250523090802.17987-1-vadimgrn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usbip_to_int function is used for handling arguments of options
--tcp-keepidle,--tcp-keepcnt,--tcp-keepintvl. It is now called
from usbip_setup_port_number to handle tcp port number.
This simplifies its implementation.

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


