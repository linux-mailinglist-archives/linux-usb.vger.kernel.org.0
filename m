Return-Path: <linux-usb+bounces-18219-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F214B9E7CBD
	for <lists+linux-usb@lfdr.de>; Sat,  7 Dec 2024 00:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B25B9283F39
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2024 23:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20422156E6;
	Fri,  6 Dec 2024 23:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Mkia7qtb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0579212F85
	for <linux-usb@vger.kernel.org>; Fri,  6 Dec 2024 23:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733528335; cv=none; b=uUGxCcQskzMhIWskKXap6Mx0vZaUUoF8dSLqEDNdS2vQRq9WVfLt7DyhnBY76kWVPBcrcZK8Sb+zRSqMfXKOBhYOSIlDL6PsL9Q5KQsb9sHczt52igi8U0Lv6QiW3I5DJ5RTygRSfKtTlQDkBZMnY4Z3E5LBF7T3KOm5nH7BmK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733528335; c=relaxed/simple;
	bh=Ulzg2xjkFRD+wiTK/aYzwa6zKISjF0fC6sX0+p179fU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gRAOiBJPn0HtcFzJTQkidu9LoFah3jV+HpwWq8q5RhOHNyuCwGUPQfQJwCvkldBjZNJKuSwTpy0XMJWRRWVowuqTIAWxE6O8YrX5P3wfxFdh1wURPPhC5np2x6Azu0pLv/+3THQmdy0Zpd4eLMHkP5LxTayRjYs5iWtS3GbmYVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Mkia7qtb; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7ee51d9ae30so1847082a12.1
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2024 15:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733528333; x=1734133133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7ywRolWY01/rWUFSkYNRJ4dfXAYAQRxZrdC+AkeGz8=;
        b=Mkia7qtbbAYsJnWuRQW3YE7McQb5m37n4t+1A0y9k6j1GcdGk2K+cpWVtq6F9Z9m1P
         e32wjOAB9QVFD2Lt4JEkXx/FmU5b3wgXRbogGWFzVB8tx6/Cay+2K8LVWTKMpcclUQ4M
         WR+Yx1v+a3Z0luCJtO7Vk7UW6DW7t/m/iYOUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733528333; x=1734133133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M7ywRolWY01/rWUFSkYNRJ4dfXAYAQRxZrdC+AkeGz8=;
        b=ld6w2d98vj1pFvZc0MS+YXAyVligSMO+jUSw/dNksTOnNPmsXdzYYZg27Od1Q4h7Dv
         FR3h0FL0flzFwCqF46uNkMAZriQTPwqURh8SbWhJlRvzdPGb0sj9QP5H9y00Uuwn7184
         /6rBABQ4mUWou9hUipYn+ttMhalTxlLp2lJr3IPTX97CVEx+sU2serJSZlWJsNmbJ/X5
         kPrHSA9h2opilwuveH49ja8gB44RER0GlcG+ipO5cWvYZeTw8LNyc99FqZU5Qt3xlCzU
         K/sYAOCfwn5TaUDNQ7dw4LobrSkFlVTTldjm0NBUMlBeaRUfEtrZT89hFSUJIiXsJJAo
         BXvg==
X-Forwarded-Encrypted: i=1; AJvYcCVduJZ162lTbe+5gFrawKAxzvq4ze1Z0lHkVijsmC6/7FNsywUfGWhWsNTsh6Vofp3hGIrGq1X5PuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPIkv1TdmNzLKfkuNnM3pHgth1BYHbcT++8F4SA11Mn5kVMEFm
	kiw1AbmTXb8uofzH+4q7NlAo8f6mLwgOxT31eJ9L5kdkKA5/bNpy/5VJn1VOpw==
X-Gm-Gg: ASbGncuDwZRGQe8MAggxzR+1PdqHXPFn+aG30NH1L/WUxKMAv5b+lX4VpUpNpbfEez/
	aJcZsoCkC5YiW8sOSR5jLYejRWa8JcScZ57ziR5An8tMH6LMJDZVFmSt+viR/6KDTns1hGDpEIO
	b556sHnxm2lUIryCHGC982WHNoE5dorkpFxVLhJNUKhLbo+XXZppy/YjUow11DJskLODnKAjRYP
	7oNuXnNdELqAsyVpx6EOS/SQrtnlgpu8WnJC+0603Zb7Ufw6fbtKicYF1zfj1/Tx1Y7CQ05Dtd7
	QXyTyncAEwGOyZtJUUKSv0Ko
X-Google-Smtp-Source: AGHT+IE2pYezOEFHi20tWshTX8jQdgxLAviowJebOf0BsxXK7byF4aVYK7F4ypRAUugG9hj/xkBzoA==
X-Received: by 2002:a17:90a:d445:b0:2eb:140d:f6df with SMTP id 98e67ed59e1d1-2ef693676demr7738327a91.1.1733528332939;
        Fri, 06 Dec 2024 15:38:52 -0800 (PST)
Received: from localhost (227.180.227.35.bc.googleusercontent.com. [35.227.180.227])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2ef4600ead7sm3702702a91.53.2024.12.06.15.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 15:38:52 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: akuchynski@google.com,
	pmalani@chromium.org,
	jthies@google.com,
	dmitry.baryshkov@linaro.org,
	badhri@google.com,
	rdbabiera@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/7] platform/chrome: cros_ec_typec: Disable tbt on port
Date: Fri,  6 Dec 2024 15:38:18 -0800
Message-ID: <20241206153813.v4.7.Ic14738918e3d026fa2d85e95fb68f8e07a0828d0@changeid>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241206233830.2401638-1-abhishekpandit@chromium.org>
References: <20241206233830.2401638-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Altmodes with cros_ec are either automatically entered by the EC or
entered by the AP if TBT or USB4 are supported on the system. Due to the
security risk of PCIe tunneling, TBT modes should not be auto entered by
the kernel at this time and will require user intervention.

With this change, a userspace program will need to explicitly activate
the thunderbolt mode on the port and partner in order to enter the mode
and the thunderbolt driver will not automatically enter when a partner
is connected.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

(no changes since v3)

Changes in v3:
- Set port.inactive = true instead of auto-enter.

Changes in v2:
- Only disable auto-enter for Thunderbolt
- Update commit message to clearly indicate the need for userspace
  intervention to enter TBT mode

 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 0b87be52e1db..743cb5a9fe51 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -311,6 +311,7 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 		memset(&desc, 0, sizeof(desc));
 		desc.svid = USB_TYPEC_TBT_SID;
 		desc.mode = TBT_MODE;
+		desc.inactive = true;
 		amode = cros_typec_register_thunderbolt(port, &desc);
 		if (IS_ERR(amode))
 			return PTR_ERR(amode);
-- 
2.47.0.338.g60cca15819-goog


