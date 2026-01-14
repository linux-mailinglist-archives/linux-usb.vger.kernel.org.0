Return-Path: <linux-usb+bounces-32343-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B19DD20ED2
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 19:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 80DED300CB5F
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 18:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C48833BBCD;
	Wed, 14 Jan 2026 18:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0lfE1gr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD1C33B6E4
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 18:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768416999; cv=none; b=HW1FFrF0IbDgrQ4hVqlQfY00mG0yKEqOpTegEkiDuTfr1QdTkuP/ubuKMr/cGV6BoAgAHyuM9EXz5yL54jqI+KYPw0HNRAYgttdtK5WJWvGcMJCaAMzs3ntYSfRY3YqPbNoszSXyOPlVmfZ32vpxe5bmM3E71C+aNudhVaVY+Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768416999; c=relaxed/simple;
	bh=AXNRP/RiCLJMNVTwYZ+/Hft1GlmSrxHJXn1qJl+YDzc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=T8f+Mw0ob3S/5C5vDqS5UmEm9+GvLYojn9dNukrg25F9ftKPpdhHTZuYTjRQgP2GkkvUfZJyl+JAmgCdnd1wM2HQtOEnqrsIecbxRDjBPeXiYqlZRjlTwz79QJqCHI06HrHGI3Qe1cBk+yMn1dklkwawGvAMPJWKwsWqIrzeUm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0lfE1gr; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4fb68720518so968261cf.2
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 10:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768416994; x=1769021794; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A+EJOC7qOLDFLrRbX7fAQVQMiijpYhyrD0fxa6sn0aY=;
        b=K0lfE1grPY1UaIxPAWorwlITX3piRqRRS/DYaEXIqJptNdEyOAvqCIpCKOlIxlQhkq
         oH7Fj9LjDnx54QnFuCJZLRnsZ+FWw7GZINAKzt6WvZZt58h+6aTYG7hPlOXnNv/OE7fo
         3IqxPuMWtpbQP4grJTxJd0JTolBs/dj2n0opRhhQ9MqwBUSVJP5r5Wsb5kXkamf4fR26
         zuwHybRYLsVhVBPPEGfvO52KtUBUtgPHBwjM/OoiUvJrQ/NQ3C6SPhqYDnsP4KGFmteh
         uKHpSeITgVQwPiqJE7WX0wSrxJbtAgrpxBwX5H5WXaJRVK1nBldQmjsQhzPrMk/ymjaa
         jQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768416994; x=1769021794;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A+EJOC7qOLDFLrRbX7fAQVQMiijpYhyrD0fxa6sn0aY=;
        b=TH9tcXQMpqd2MYNcGwCl/EWNfmGLA/gieIJHJ9R3wjQ108sProOOCV5FuHZAh2ClIk
         3X02XuJ7NWr5DlT1F4RikA20tR+qLj0HTrxW2qeNrHC5wF/UITOKvRcJ00Fc2Sl+3Xl7
         9OaNOdQ0Bx0/zgC43nRwWqnwXOqPjNXbIMSnCEsdEjmgJgaKbBzLVyL7Wpw/igaysTw8
         SROxb4qn8bS3RJD5NVs1Y5IlhPxcbVLw0fD3yyPdbVwqBEKqrBYBV0ZZjPbu3wGa44BS
         TRa6A+k1Wcal7wwHKAsvN7nue9rjce9UBXb2IbIVdz9M+6//GfaKTy7JB/IQs5GiT/cT
         CX+A==
X-Forwarded-Encrypted: i=1; AJvYcCVBG90pmGbR5ASkSm+bsqCQq31ce7tu/GyxlaHZLXLVySvlkr6VrqflgNfnUfF7Grm04fNvgi9zftw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZT+jzHqm12oNW2Gl/6/Rlf1nQNC9xhBFt4iR/qiWrIBhvuCwh
	eXq9UQ8VfYuSkunNtM3Oe+RN9/JGZINPjZu7RKoWA/XvPK5GDGW165K4S0wTy3ct+uFvpZGoTXQ
	moA/A3t6F74zzOJP85zWJhqT3koqD+W/vMycArDMLm1QDMao2
X-Gm-Gg: AY/fxX7aY5bbmKBqensLSNF1yKcRWx7PiX3Ug9ptuXpLS0wzacjYFRibBduEapOWXF9
	5DAUoAa9I9xerhfc26gUVOLGdDQER06jPhu8T22Osw5+4MsHfcGKVl7UiT/WXLPR/F/LUP9/f/n
	ccoXAti9ydt8INABH8pr1vaBn4SJ/WLG/Oq63HDa92V2hz9AAdZMx095qYU919BSYvTpL0oOHXk
	AKHNz3Pb7QsOkhlGyWVL/C+rHbF+gKsT9FXs+4PZ1N4X9LWG72qzct/VOsEnaXCaipDww==
X-Received: by 2002:a05:622a:1981:b0:4ec:f23c:3b94 with SMTP id
 d75a77b69052e-50148220475mr53271891cf.36.1768416994344; Wed, 14 Jan 2026
 10:56:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?6b2Q5p+v5a6H?= <qikeyu2017@gmail.com>
Date: Thu, 15 Jan 2026 02:56:24 +0800
X-Gm-Features: AZwV_Qj2YCYlu1ncELKP034wY7oXetlTPNzkZZ9QDYItQVL8R85W3WnppNZ-LiU
Message-ID: <CALEuBan7V-YVTyLif29E0hZx9nacbxJG1xSL6DspxEctDbdtLg@mail.gmail.com>
Subject: [PATCH] usb: typec: mux: fix NULL pointer dereference in {typec_switch,mux}_put
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: andersson@kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This fix was discovered through static code analysis.

In typec_switch_put() and typec_mux_put(), the code directly dereferences
sw_dev->dev.parent->driver->owner without checking if 'driver' is NULL.
This can lead to a NULL pointer dereference kernel crash.

[Call Chain Analysis]
The vulnerable functions are called through the following paths:

  Acquisition path (fwnode_typec_switch_get):
    typec_port_register()           [class.c]
      -> typec_switch_get()         [typec_mux.h]
        -> fwnode_typec_switch_get() [mux.c]
          -> class_find_device()    (gets device reference)
          -> try_module_get(sw_devs[i]->dev.parent->driver->owner)
          -> stores to sw->sw_devs[i]

  Release path (typec_switch_put):
    typec_release()                 [class.c]
      -> typec_switch_put()         [mux.c]
        -> module_put(sw_dev->dev.parent->driver->owner)  <- BUG!
        -> put_device(&sw_dev->dev)

  Registration path (typec_switch_register):
    I2C/Platform driver probe()
      -> typec_switch_register(dev, &sw_desc) [mux.c]
        -> sw_dev->dev.parent = parent  (sets parent device)
        -> device_add(&sw_dev->dev)

[Data Flow Analysis]
The critical data flow is:

  sw_dev->dev.parent:
    - Set by typec_switch_register() from the 'parent' parameter
    - Typically an I2C or Platform device (e.g., &client->dev)

  sw_dev->dev.parent->driver:
    - Managed by kernel driver model (drivers/base/dd.c)
    - Set to driver pointer when driver binds (really_probe)
    - Set to NULL when driver unbinds (__device_release_driver)

[Race Condition Scenario]
The vulnerability can be triggered by the following race condition:

  Thread A (normal operation)        Thread B (attacker/event)
  ----------------------------       -------------------------
  T1: typec_port_register()
  T2: fwnode_typec_switch_get()
  T3: try_module_get(parent->driver->owner)
  T4: store sw_devs[i]
      ...
                                     T5: echo <dev> > unbind
                                     T6: device_driver_detach()
                                     T7: parent->driver = NULL
  T8: typec_switch_put(sw)
  T9: module_put(parent->driver->owner)
      -> NULL pointer dereference!

[User-Triggerable Paths]
Users can trigger this vulnerability through:

  1. sysfs unbind interface (requires root):
     # echo "<device>" > /sys/bus/i2c/drivers/<driver>/unbind

  2. Module unloading (requires root):
     # rmmod <switch_driver_module>

  3. USB Type-C hot-unplug (physical access):
     Physically removing the USB-C device or its parent device

How to fix:
Add NULL checks for both 'parent' and 'parent->driver' before calling
module_put() in typec_switch_put() and typec_mux_put().

Fixes: 71793b579ba68 ("usb: typec: mux: Allow multiple mux_devs per mux")
Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
---
 drivers/usb/typec/mux.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 182c902c42f6..6ed8bb999ee0 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -134,7 +134,8 @@ void typec_switch_put(struct typec_switch *sw)
  for (i = 0; i < sw->num_sw_devs; i++) {
    sw_dev = sw->sw_devs[i];

-   module_put(sw_dev->dev.parent->driver->owner);
+   if (sw_dev->dev.parent && sw_dev->dev.parent->driver)
+     module_put(sw_dev->dev.parent->driver->owner);
    put_device(&sw_dev->dev);
  }
  kfree(sw);
@@ -358,7 +359,8 @@ void typec_mux_put(struct typec_mux *mux)

  for (i = 0; i < mux->num_mux_devs; i++) {
    mux_dev = mux->mux_devs[i];
-   module_put(mux_dev->dev.parent->driver->owner);
+   if (mux_dev->dev.parent && mux_dev->dev.parent->driver)
+     module_put(mux_dev->dev.parent->driver->owner);
    put_device(&mux_dev->dev);
  }
  kfree(mux);
-- 
2.34.1

