Return-Path: <linux-usb+bounces-26909-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED02FB28070
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 15:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64F071CC43D1
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 13:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2786C302765;
	Fri, 15 Aug 2025 13:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZkx2FCy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340F322A4F8
	for <linux-usb@vger.kernel.org>; Fri, 15 Aug 2025 13:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755263647; cv=none; b=WvUxQq2jCfNnyWNpB846s2chvLnNe4pi9u7tW0SXGKmRvrkWpfQ4xFIaVanmvbTuHzsxW9gx8YVRAo6+PKBWRcH7MVqLalZCE7+ZW3pPWPj27VO6YmP08n4Ka0CKKGW88pCTKRAuyn/Nh4dwUfLR6Z7ARL/YdNQUwK7cr8dLesQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755263647; c=relaxed/simple;
	bh=YzqpBeHLQWFShEkm59/cGddLseeqgkSzjjd76FsVdDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JeIkLmGsujoGKVSOxkkeaAq4trHrsMmSheohXGQhuWbgHoGWFTZ9oUeGIfFAaPr25FzU9S2hJB4mBs2S+NU9cNJLIq3QDbQBkdCaBDzmisEvLBUkDDxZ0bho0isGy9R7s+V9tt7+BWopsBedSOCuzEEO9pfeXGKPxz5xw1Wr0s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZkx2FCy; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7e87061d120so200688585a.2
        for <linux-usb@vger.kernel.org>; Fri, 15 Aug 2025 06:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755263645; x=1755868445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FaBn6yu6mKaAFUnmDJX4IzB7yUEkMp9/jeZ8442dcAg=;
        b=kZkx2FCyD6aRxEeMIUXXdZf3vuLoEgqxE1yN9fencqO17B/n82ZgauqbAKbyYCfnzl
         IbGYn3ksQ4/NOcEo7I+kMH9GarYg5G2F8uNkB/pWOhg/c97cHgC2FItLvsTeknwFMmRn
         lxlmbkhDy/SlkcEkaR8YIhg7FW6zVzcVWQxygRUezG+Pgt10smYWJdfGHa6G5z4i3KtX
         m24v0d7DT/6CXW45emEeDSQp2JG9nChSSzZOKQKuytDz05v+G1Gg7OpUbbLCePelRu+j
         37FJ7nyoAo7goMSDhnOH8kzNK8fWCSuIx2wZGE/t54oRt4pV27Bh5fSMSLqS8vZHIC3d
         f2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755263645; x=1755868445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaBn6yu6mKaAFUnmDJX4IzB7yUEkMp9/jeZ8442dcAg=;
        b=sdjGEub6ltscFi5+6qZnj4DETmKDMGDgtIl2iIr0da2l5O+l8ezewdLbz3SHhLGeJL
         SFRxwFO7UUI4RIkOMPSdeSqRPa7HSrTTREmwDyv4C6uY/xpCGC/KVy3hzMLXGjgQ0IhK
         MbEC3Yq4WqgE+fSZVkJvDkqBaPltFqDxBokgHlPJWqp5P4KR7jWJ+9vk3JuSBzObpnyL
         N6AKcmTxiqgJC6uYo/7ojAbQZhc8EdRrJUknJBEsiHEhlhPbwS9IkGbHiPYjKtWFjcxy
         AYj2JDE3Bm70v3am27iXhrBmmSiC8P7hNLmBTePRptMzhfvAIZOGcr3ISSp79BP9SsO8
         +d0A==
X-Gm-Message-State: AOJu0YxCAZZ0ko/vVfJ4YXrlNQKLvJmN+WtvkMnTrvC5u259xLAnq+Op
	MBLEyIL1XArQusbeJH/AzgnObYN5zMw/PSt2er0e9OAa4gNg3Us4gWUxqqPPDLw2vqjGow==
X-Gm-Gg: ASbGncvFK5c83x2LxfWL72fP7JCaQ/Tetvgf5VUvkFN+lOT4qhggyVgIpbvbPr6WSgA
	wNx1d0eH8VOqttMrwDDnS0Mb3LQt0W/54eYQBfkLPEqgrrPW3lF1FNm8jFVM2sgkPbsCnf8FxJA
	XwF8AsodlOHOGsk61jfsbdSFlz0x+vjS5cekcMd0/n0aCpaAvKQiOn0ouwWGTCcV9BSFRcuMe17
	+XWdS/43CjLjuU8rBPd3e25bvS+5fhB8h2pteXWSgQ1i1MPbJD00E37ko/DT3zRQk/wlxsthmDd
	1YlJ1h5SWiE6OUCbA/OJ9EAPe35d8b5v9Zt7uJApX5BzCfS43lzyqIG/dNj+EkK1p7doYlucN1o
	phfq7J+HkY/PqJnQ0dK4jp8CyObApqLwkcN14dZAo2dPz/lz26bpRkwqwIqEQmdZSnd/+kb+cip
	M2fXzohkn2ok6+VvA=
X-Google-Smtp-Source: AGHT+IEKjJwrEUW1KqntvJV7zAcNPbUd5/0Q2h47aokTBqbWOAMzavah/S3vh7nR1PYYnLOCLkheOw==
X-Received: by 2002:a05:620a:4402:b0:7e2:77d0:f33d with SMTP id af79cd13be357-7e87df91cbbmr278795085a.14.1755263644683;
        Fri, 15 Aug 2025 06:14:04 -0700 (PDT)
Received: from KAG-86297.KAGWERKS.LOCAL (static-108-44-230-106.clppva.fios.verizon.net. [108.44.230.106])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e052a95sm105612685a.20.2025.08.15.06.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 06:14:04 -0700 (PDT)
From: raub camaioni <raubcameo@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	raub camaioni <raubcameo@gmail.com>
Subject: [PATCH v4] usb: gadget: f_ncm: Fix MAC assignment NCM ethernet
Date: Fri, 15 Aug 2025 09:07:21 -0400
Message-ID: <20250815131358.1047525-1-raubcameo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fix is already present in f_ecm.c and was never
propagated to f_ncm.c

When creating multiple NCM ethernet devices
on a composite usb gadget device
each MAC address on the HOST side will be identical.
Having the same MAC on different network interfaces is bad.

This fix updates the MAC address inside the
ncm_strings_defs global during the ncm_bind call.
This ensures each device has a unique MAC.
In f_ecm.c ecm_string_defs is updated in the same way.

The defunct MAC assignment in ncm_alloc has been removed.

Signed-off-by: raub camaioni <raubcameo@gmail.com>
---
V3 -> V4: fixed variable, added f_ncm.c to make, built, tested Jetson NX
V2 -> V3: Corrected whitespace formating style error
V1 -> V2: Corrected From and Signed-off to be identical

 drivers/usb/gadget/function/f_ncm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 58b0dd575af3..cad111f33552 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1463,6 +1463,8 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 
 	ncm_opts->bound = true;
 
+	ncm_string_defs[1].s = ncm->ethaddr;
+
 	us = usb_gstrings_attach(cdev, ncm_strings,
 				 ARRAY_SIZE(ncm_string_defs));
 	if (IS_ERR(us)) {
@@ -1771,7 +1773,6 @@ static struct usb_function *ncm_alloc(struct usb_function_instance *fi)
 		mutex_unlock(&opts->lock);
 		return ERR_PTR(-EINVAL);
 	}
-	ncm_string_defs[STRING_MAC_IDX].s = ncm->ethaddr;
 
 	spin_lock_init(&ncm->lock);
 	ncm_reset_values(ncm);
-- 
2.34.1


