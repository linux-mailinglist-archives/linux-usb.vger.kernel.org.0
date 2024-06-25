Return-Path: <linux-usb+bounces-11645-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B92C8916B2B
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 16:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C164A1C20A8F
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 14:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738DF171082;
	Tue, 25 Jun 2024 14:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oJJE5Buv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD80B16F91E
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 14:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719327277; cv=none; b=CWqXA6bm8oWgJtYlcOcUGqbSE0t4YV3AnmPxUoeoO6d6dVkVwgwb8ll8C1jTUhWnrgguk9/MNNrOOqCyiBCBAeLRixw9Ne0lEKjqupa36/9ZGWGWEdbGpA0+Rm6TIXgwGNy1iRFi7Z/h0V6w9hZcthB1ZifJpz/9C53uB4dKbyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719327277; c=relaxed/simple;
	bh=mI5j32lGmh9mGgx/qR0lTHll3MYLBaGs+ozW531l430=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K5Q9mm/QkPNgx/7tFBff4qmXJxdDnWWQpmWzfcW0egtt1dGa3sZ7gIYHzGSSLxGxRYMr/SkrYimln9ZE9WIJSDSKKe4rNEOwPEUEEW4zqI9zYIfZbHr12yD6r3ssXJUO/WC+oAMQmUE3b/RuHXWpwQglnuaJGWHBZ3XhTlhs4zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oJJE5Buv; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5295e488248so6429987e87.2
        for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 07:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719327274; x=1719932074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cd2X10zVjMn+EpTL9h3lm0rs/LnmaQV9sjYCW3W4aNs=;
        b=oJJE5BuvahRP12naSnUVYs4rslHdKo4HnnqhN73N4g6GDK2lxvJ9HdM6q6SrN/XMQy
         i8Bj9dJtlESIzpniA6Y+1R0jzXkcKi5pfI5aKm265ItfIZh8U0uSwUtgmx5P/lbR01Ou
         lTKblWXAXqvpfPC+Np6ee5TxjoVpWfai+9n4lQECZ+75TYSHwAn08FxPhUCEhmIanuOm
         H87ZtthKNM5KnjXUJ7mYk0tnTP31OMYGtDoHaiXEmS0gsYdZizl8BVAXKimJTtRVrWnN
         fHj8bzQPMiDeK6Zo73ki3FwYZV/1IomZAam1L5rd+bdJmnYCWpGJ0dvFf9UHfpzVl3mb
         Y0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719327274; x=1719932074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cd2X10zVjMn+EpTL9h3lm0rs/LnmaQV9sjYCW3W4aNs=;
        b=p4bNkrpUpN7MBhDKuHGYtyc00ZCuFZZ5wGr+XUk8n5Jdaem/97Gt3Bv9HfdZOjE1CF
         VZEmfRhR3FXuq9lIaid3M/SEXAoQ9nB/+rR0XTaARAnXD8leIsg2V21Nke8QvssYwgQO
         X4pWQtpRH73PNf921x+3tLNOfe8zzU5D95ycasOpSeGjDTsjs0Xj20bu4wXe6wLeaRnM
         O5noyBQ2HF/VUW/CW5ps+N0WRYIFxJQ67z9tFpUupShOYoxvHUkRG5L0PDyq7F6BfI7I
         4JRO+pGgTeqAJayJZJl0Yt9hcIZGu2UlIJSO0z86++olhiv5asgiwaJf0+AQ2/YbeMrr
         gKng==
X-Forwarded-Encrypted: i=1; AJvYcCVvZExfoPKfOOrRKGjqwU7Zm3iZhTyWF0O39XWfN/mF72zBwAYgsCNngPoK+omRKPU+3uga6AUtNAW10gZJFM20SzNHs/o2TEM4
X-Gm-Message-State: AOJu0Ywp7brnsWy0IGhEvf4B2BrY2k3cxrLEWUnOkfZ2X+u26y3fQLS+
	qUeSVYn2aTlR3NoHsza7JacwW3JWrBdFp7EB/WKm4D9+XJ7XC3OGs3dxFKcXkBP0NWZfSpHmaJ7
	9Qjc=
X-Google-Smtp-Source: AGHT+IFBU/FqlV1rlHFm7VcDP7TI1En+d6tYg9faOguYFxQeaenBL0P/drueNcNZbM5bdmNqJCDT6w==
X-Received: by 2002:a05:6512:2394:b0:52c:d84c:1182 with SMTP id 2adb3069b0e04-52ce1862c12mr5311099e87.64.1719327274126;
        Tue, 25 Jun 2024 07:54:34 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd64328b7sm1251877e87.221.2024.06.25.07.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 07:54:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 17:54:30 +0300
Subject: [PATCH v3 5/7] usb: typec: ucsi: inline ucsi_read_message_in
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-ucsi-rework-interface-v3-5-7a6c8e17be3a@linaro.org>
References: <20240625-ucsi-rework-interface-v3-0-7a6c8e17be3a@linaro.org>
In-Reply-To: <20240625-ucsi-rework-interface-v3-0-7a6c8e17be3a@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Nikita Travkin <nikita@trvn.ru>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mI5j32lGmh9mGgx/qR0lTHll3MYLBaGs+ozW531l430=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmetojhmAknU4eETQ/0OVEnR93dwpzXwqv4zv11
 DBDhLbs1XGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnraIwAKCRCLPIo+Aiko
 1Zv3B/9UujGkolgkJQLF8DrUxTo7LuRVr+QOZJVWx5Y+Qqj2Vrktn20TdD10r17dEMR4lI7w1VC
 UMrX64IlrvWdR72wijPKPH6uafW5wUnCh3PNSBQgh+/03iBS8LwLJHaACH8JzISR8VnV8dh6Cya
 Xn2x+c9iwslIG6VPuSj+cxfyP1RPp+XY24Um3N7VOqS9MpeuJ54FtBQ9SwcEq/lf33MRf/+Vxv+
 WwdlSitm/UoP2YJG99Fmg4nhaSNFDyyuKOvwrwC8TVZlSnhgehx4ekDRPW/4pQEtyC2R6/PNpN5
 9FXIu8GWZ1DIn1Pb30kNSGbmuqxjMWkVwcYgoe6MFIjYwGMf
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is no need to have a separate wrapper for reading MESSAGE_IN data,
inline it to ucsi_run_command().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 5f8e5ed9e0f9..e14366e20cd5 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -36,19 +36,6 @@
  */
 #define UCSI_SWAP_TIMEOUT_MS	5000
 
-static int ucsi_read_message_in(struct ucsi *ucsi, void *buf,
-					  size_t buf_size)
-{
-	/*
-	 * Below UCSI 2.0, MESSAGE_IN was limited to 16 bytes. Truncate the
-	 * reads here.
-	 */
-	if (ucsi->version <= UCSI_VERSION_1_2)
-		buf_size = clamp(buf_size, 0, 16);
-
-	return ucsi->ops->read_message_in(ucsi, buf, buf_size);
-}
-
 static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
 {
 	u64 ctrl;
@@ -70,6 +57,13 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 
 	*cci = 0;
 
+	/*
+	 * Below UCSI 2.0, MESSAGE_IN was limited to 16 bytes. Truncate the
+	 * reads here.
+	 */
+	if (ucsi->version <= UCSI_VERSION_1_2)
+		size = clamp(size, 0, 16);
+
 	ret = ucsi->ops->sync_control(ucsi, command);
 	if (ret)
 		return ret;
@@ -98,7 +92,7 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 	}
 
 	if (data) {
-		ret = ucsi_read_message_in(ucsi, data, size);
+		ret = ucsi->ops->read_message_in(ucsi, data, size);
 		if (ret)
 			return ret;
 	}

-- 
2.39.2


