Return-Path: <linux-usb+bounces-11642-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 313A2916B25
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 16:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62D161C20C1D
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 14:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374B316F8E7;
	Tue, 25 Jun 2024 14:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ot8D9QpH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C85116D9DA
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 14:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719327274; cv=none; b=phYOVNa3xg6Nd6oFq4H8QmObvOFKM4IHZ8U+hzWiiLJmKbgivEt+5KVIwgXMLyYm6qrmSWaMl32Qjr43vhoSsJtzrEdo7xVtbUBFy+ERR0wsNuCxbThEkbJ4wpA+qZVh33FuVcpShCH5s7aVX0Hzs5whh7bXCxX6ipnAaV78UyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719327274; c=relaxed/simple;
	bh=E+vOJjv2UvdlrXvKnRgzVGWs8xl24PgUq84JxgbpN+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H8LD20fgM+Prvd5IeQD0ps2JkW6MhJGgpCGAosbMOVow7AKOSrDgRtjSmicp8dca6c2CyGzc0RXo7SqUPoOLCIQuGweDtlNtmAAqIXvM+5xqbrekDfw/Nbo4taQGecA41xkDU5TnIaGDFNdmYXIV5I6vUKVqaEboys8LTdAkwwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ot8D9QpH; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52bbf73f334so4352317e87.2
        for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 07:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719327270; x=1719932070; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JAfmKGbaHSRN3BDyb2Ps0ChAgC9WErixxC6u5jSyHcs=;
        b=ot8D9QpH0Xknfeg0Zy7p5K+JY98y55p+aozKKMdlJ0TInRBT9ZaZUkxHFxC5NzATSx
         TFWPcowvZvVWhuzfn67ldXmKbn28sIEx8A/qQUieuKfG/bZoLSFyqP6EE2ddX7VyFolp
         IwB+J4wNr9oYLrC4eqcRDV4/bbCsjQXhP7eOe1bjujUEhRIpsO2k6gl/4pyqiReVeUdZ
         ajXuYUBYmokH1oyMeSqLO8hYaqt//bk+WEjUf7daLXMz7lP45QH+0hPCjb6Cu+kl7Xhs
         7pqBcD7lLK0vsYHUZelP0nPDP8axRfruo3M+GZJW60XqWUdLruD5ScNecRZMxWHVZCQD
         YYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719327270; x=1719932070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAfmKGbaHSRN3BDyb2Ps0ChAgC9WErixxC6u5jSyHcs=;
        b=L0hT8KGF1A+lq36+ev9Io3jajF+D/NZs4fp5/c8fgYgDDShheZ0gKLY9at3aqcrjgo
         zvRDLiDTyFp9htp5dHjLmgPUgiTqD8pAx4FPbIJCXe4yI+UlibEWaB7gHbaNC+/VLtHV
         lotgJA+e7ZuAk1VlKvl3bISPaZ5c2gwtwN6TzweFSQrVQfP+acnBp2BYiDHR+qA3QgBG
         vObFjAYp9B/txzLZlBmOM6+aJEEYlpTsGkFuS/3+s2PBNnUHaFWCAe7xtIRyVUKhdUAM
         +V5TyXxf8/P24tVT214oiX1MNLY1UJ/9Si4elnSK+pTUZ/iVzGal5WL1j0ywpQNINTT+
         b/Vw==
X-Forwarded-Encrypted: i=1; AJvYcCU/O/es1S0BLHab1UfSjIyMqoZhXPHh6rWKWNEkfZYRCIMsLaOArQTUCZv+n7VtR90acMhXDkJBFn5SfyXKTxJtM6gwFKDd82Ct
X-Gm-Message-State: AOJu0YxyDf/Ouf+eH8EqzJBeT7n1QrVt25+sQr5bcU9TUCn8S6cOxRTw
	lrD6U7hmB+f1mpbdi4PGDWsdVhh0nLUQWrZOHQ70+NNje+nHhpytZI1jyEAxFdo=
X-Google-Smtp-Source: AGHT+IGZFf/nSGa2e2d62pxL5I+qOFEUEnjG9EKzs41xvEO8rAlHlgWJuddbGqx0uxqUQDIYsbz3Rw==
X-Received: by 2002:a05:6512:453:b0:52c:d943:300f with SMTP id 2adb3069b0e04-52cdf7f6705mr5392914e87.38.1719327270161;
        Tue, 25 Jun 2024 07:54:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd64328b7sm1251877e87.221.2024.06.25.07.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 07:54:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 17:54:26 +0300
Subject: [PATCH v3 1/7] usb: typec: ucsi: move ucsi_acknowledge() from
 ucsi_read_error()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-ucsi-rework-interface-v3-1-7a6c8e17be3a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=E+vOJjv2UvdlrXvKnRgzVGWs8xl24PgUq84JxgbpN+M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmetojmtp4D7cmDhXFyPFb6rzvpO9SqHUmDn68o
 x84cE4DSNWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnraIwAKCRCLPIo+Aiko
 1dsqB/wKU/73Da/F7fXX3mKihmmgqnEt8z5DsYc/2Ek86sZ2QOVH5pcoOyQjGE2tEHJM1A460DU
 fniZ9SvZ17LHTf335zpqrqK1baAzCc7as/KU5FPsnsANZRV0di+AWzepIIFaNaN3bkEDgvyhGv3
 D9plJZY56ZqgzDBYL4OkX/69YyQk2ndc/DcQOa6sbOSLN+5tjeH9gnPwh9coPGY9Cf2n3auuqJz
 1jSXserA6xSdR0TK2kuorPqnD+k9K6yufTUWdeB5SNheTQwuDx4uTO2SUb42q1522ZwVKmxA7Bp
 KSyWF53xjvQ5qHB3NY1c+iU9Gf62IqbUUg5WbVjtBFRAZ1HM
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

As a preparation for reworking UCSI command handling, move
ucsi_acknowledge() for the failed command from ucsi_read_error() to
ucsi_exec_command().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 76c48d873b2a..297d939e8da8 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -70,11 +70,6 @@ static int ucsi_read_error(struct ucsi *ucsi)
 	u16 error;
 	int ret;
 
-	/* Acknowledge the command that failed */
-	ret = ucsi_acknowledge(ucsi, false);
-	if (ret)
-		return ret;
-
 	ret = ucsi_exec_command(ucsi, UCSI_GET_ERROR_STATUS);
 	if (ret < 0)
 		return ret;
@@ -153,13 +148,14 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
 	}
 
 	if (cci & UCSI_CCI_ERROR) {
-		if (cmd == UCSI_GET_ERROR_STATUS) {
-			ret = ucsi_acknowledge(ucsi, false);
-			if (ret)
-				return ret;
+		/* Acknowledge the command that failed */
+		ret = ucsi_acknowledge(ucsi, false);
+		if (ret)
+			return ret;
 
+		if (cmd == UCSI_GET_ERROR_STATUS)
 			return -EIO;
-		}
+
 		return ucsi_read_error(ucsi);
 	}
 

-- 
2.39.2


