Return-Path: <linux-usb+bounces-19176-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 270DFA08293
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 23:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5D8F165D55
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 22:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9737205AB6;
	Thu,  9 Jan 2025 22:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ApWgDmYu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4882054F0
	for <linux-usb@vger.kernel.org>; Thu,  9 Jan 2025 22:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736460423; cv=none; b=Q1Iymdllmtj7tOK6fh6OzC1eEIhVZYDWRUFdYOfqxlass+5Mloaf7Dpnj6BbAAYwUemoCwazMUc2ZPkvXmiMYGafzmgZYWy6hsbo2+plGU2s6UwGSJpXWoebNuSVVUwGqgBijAaOiyvBRvLcVqX954qEzbJC67Td1Z2hdItwBoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736460423; c=relaxed/simple;
	bh=16103WdjKkDRPAUpJv/gja+j04dR9xW9d/edeY7WQjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N7k0RVgUsFKczhhl/Ak47ZzA+NZpvWHtrHBQjze1OON+DP3DQefWtzatVJojM5wVv3BaU2U9T0+SuxDN0IggzDb4gtzY8Mn3URBVix1ApnBc/I8eGpjkrZ+NqyQ7Fp/jZv8H38ZKvLbbgOZkkDcNABp2CWTTVqZq6+xGBXrAumU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ApWgDmYu; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-215770613dbso17757455ad.2
        for <linux-usb@vger.kernel.org>; Thu, 09 Jan 2025 14:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736460420; x=1737065220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXlckJ6SpwsTGpU1oM+HpGRrggJSHrz/QlJTly2bc/Y=;
        b=ApWgDmYutqFn9Q2R8uo1z/lx8fFejzlQZH83jcw3a7meLdIwbYzSmNcdi3lfU4rCub
         ec9Yl1WyZJa6r9vpPzJS9BqH6SdCI8+arUV5lf597jwlFFyACXKyZ+UfONJgheoOT8SW
         Sj+jRKNmEYrnT98Cc7jx/ufX4mCNiuJowO4c8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736460420; x=1737065220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXlckJ6SpwsTGpU1oM+HpGRrggJSHrz/QlJTly2bc/Y=;
        b=u6NtHBbexv5ReSew9G8vhy1HKTccGuPmkYn43p0j1w1e9iGhON/KKGpO7aA3EafMw8
         Utl9L3FkOlVdc7mcYpzHQFDXSH/ZAvWDhKmfg7u92Wh5t+ecy0Bc7c0SpvLPgXylra0B
         joZ/wMoKW+07abQCBJqxz/DNSD+rbT36L0JXw7FZX9zRY24Yf+8/wx72raylwPE8ZTnu
         Z5+pCx4MXo7iXPSYjTHPeoxdEdtDzTSXExz3LwK2ADbtfDvJoLPBlAgwGYDjlvu3QSvB
         A/AOoEQsISUJ9LwTC4ljFWSCsT/1196EeJmuFmVX/amQb/KjAfjtMfzv93rL1xffX+rh
         NRMA==
X-Forwarded-Encrypted: i=1; AJvYcCV7ZhJzKmx5XzHZ1U+QiH4TWPNv+xFnseH9al1bzHmuBFVLB5IwttHG0yaQmjq052iFyNa6Th+FycQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/djoTW7WQs3ekMuqWqmZSvt+WYlTyNoU3cbpUh1/f71lx6y1i
	3FmyFij3JNYQgrxKAbsmh4PTPRp4ONqSISbiwxfNOi2VjiQP7e5GLcZT17qP1g==
X-Gm-Gg: ASbGncvruTDsvesZBd9XAtRS8rjPTkjTDYUZgfk7RlsjtNgmclsRbr3wwdneTpSF06j
	1U8q3JFIIvy6164ItoGceLuK8SJyj3wFJec8xTwS36SZKjXtD8NkbA+YhyIjLussVACGdwhHnSK
	UYmqbGU3Udz17ACp67JBgeS3QeAs8Bnb+0c1SPLppJnTw99KQ7vd1KQIsw9qJBdg0yqBA9QhSTi
	xLsQiQKhCLwkSOe1gG2IOBYXl8ASKGrDQsUNGbd4cEflzBTe237nWKjsg7bFsG/cI/oMSHSzkHa
	2Czr0jJpnaE8HU106UP7
X-Google-Smtp-Source: AGHT+IFHTcniOS4ymC+7O/d+cYlP/uXsl/KBs0vwkT5Jh/l8n+3KRvnZGRy97PfSYyRO9sv8ZtFVgA==
X-Received: by 2002:a05:6a20:a10e:b0:1e4:745c:4967 with SMTP id adf61e73a8af0-1e88d0dfa1dmr13487894637.3.1736460420526;
        Thu, 09 Jan 2025 14:07:00 -0800 (PST)
Received: from localhost (129.135.125.34.bc.googleusercontent.com. [34.125.135.129])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72d4068178csm291404b3a.148.2025.01.09.14.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 14:07:00 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-usb@vger.kernel.org,
	Pavan Holla <pholla@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Subject: [PATCH 2/2] usb: typec: cros-ec-ucsi: Mark cros_ucsi_ops static/const
Date: Thu,  9 Jan 2025 14:06:53 -0800
Message-ID: <20250109220655.1677506-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250109220655.1677506-1-swboyd@chromium.org>
References: <20250109220655.1677506-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This structure isn't used outside this file and can be marked const so
that it gets moved to read-only memory.

Cc: Pavan Holla <pholla@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index 75646a8d55be..c605c8616726 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -133,7 +133,7 @@ static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
 	return ret;
 }
 
-struct ucsi_operations cros_ucsi_ops = {
+static const struct ucsi_operations cros_ucsi_ops = {
 	.read_version = cros_ucsi_read_version,
 	.read_cci = cros_ucsi_read_cci,
 	.read_message_in = cros_ucsi_read_message_in,
-- 
https://chromeos.dev


