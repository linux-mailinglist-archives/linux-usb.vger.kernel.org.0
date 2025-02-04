Return-Path: <linux-usb+bounces-20061-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC2BA26A38
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 03:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BCA01887455
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 02:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E01414658C;
	Tue,  4 Feb 2025 02:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uE6HkHMm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A246F145B16
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 02:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738637170; cv=none; b=FoTGdHqbQPAbLjLBDfPpdvvaXTDc7q1OPGqci/5ERI9VrKQdisUSq6mqYFlN0QjqZPMWH4e1+8T9Lm7qAfeFSn8zRupr0IpYM1WuAKA42Nf4uKHDa9xyuquL+5puzYRLxAF+TuiQaWEB8zY1q9UuNU1ONV0LpDCcVU2JtJfDAYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738637170; c=relaxed/simple;
	bh=zQmuZ//7F3rYkYCDgTClMK208117wQ10a1mu3b/qRdg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YvMtY+EHngbSLDz/Xtv3OIL2PVKwScL1lyf36VgLxveky836qHwZ95yTav1r/xe7QPfh9hPsoiB+q0nsyxDjF1bh6BLrDUCvrEczez8JAwJHxvYH+ocBK8vl27ddPeFyfhFzKXOtbKuVVuuaEUdFDCyyQP99ufizsObAeLdEWEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uE6HkHMm; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21638389f63so86578685ad.1
        for <linux-usb@vger.kernel.org>; Mon, 03 Feb 2025 18:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738637168; x=1739241968; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8PR6gBOJPyvjOyN9XG3Z34pMOOrgiWkRykhimhvg7tU=;
        b=uE6HkHMmcY8uz4H9rhF2di5Up83jXWDwcddlVj2F2Za/7X3NKM3pbOfDF/FUt4doMq
         3hZsLtgL9bYMikrJ6Fh3COCa1d4Dm+ItjqPaGmx2bHaaney2nhoUnGGtJ1gp3SetCx/X
         mmQU4rFVO3uemliK9iQ4sAO5SSFCxyb8zaMRUt4arNgY0xBJblVrtP5z8DqMMUkT1dmM
         Md2N/SU1p8v5EXJPbrAoBeeUEPn3pl+xuUn2Zu6MYqitjpIZppfbQL27JhzzOwx0lIhx
         0LEfkX4hwkqsyZX13ZBSLEdKmFyntVuCvoyMMOmPFyRIQDAqBtpNUtHVBt5wJUU1yX/f
         pyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738637168; x=1739241968;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8PR6gBOJPyvjOyN9XG3Z34pMOOrgiWkRykhimhvg7tU=;
        b=Q9WYgG2jqA853kzUDtyD4pQrURxOUViEDZ3fng2IxEbY7g50yoqU6TwVmUTS12QltE
         Xs1O+zqRxWI+fRtuIvEujSANqYyi/rKj23+EXdxhTQfgrk91e843eC3s7jVSrgGVHVbo
         OAvHHNovkGR+SZTMDNzPqjMkaPKwFhNj5FlRv4C/lHzNA6qeadEh5XWGNOYRDc93SZVi
         lQN4inZjnoA0x6vzCajhERTgV7DUgyPT75Euz7DSwa7FS/CAzkdAt3pk8Zfpc3tPrjzY
         xSRpJi2CRPbUKQL8FKL4F4FwAWJ4Apmsba3Y2kYt7D6GiKTsM0o5Odup+vwtRocGW9QS
         3/JA==
X-Forwarded-Encrypted: i=1; AJvYcCUOSCzpnvSN/39JUkCfQF7yXXyYe87k19nFIs1kjuWGKL/MYrxdPB8wPxM4NOrOesO9XGbq4MQAQdE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvwy+8pQvEBlddadIjlVwIfH3Q4MR1wkWN7IQgMVefq+JD7gne
	HC57TAbemSzItX+ZIOJ52V3IIA9j2CDGbbanTzBZr9sDPNI1pGBTNiTkN/QkvWBYjijIWg77gTk
	vzQ==
X-Google-Smtp-Source: AGHT+IF8jm9iEQgFx5P2DbKyMxCk6tB3nRShajtAH3tS0JvuQtjgmZljPqCAsCZPOXPaj8YAHSe13Rn0TcI=
X-Received: from pgbbx2.prod.google.com ([2002:a05:6a02:502:b0:7fd:56a7:26a8])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fc4e:b0:216:6c88:efd9
 with SMTP id d9443c01a7336-21dd7c6290cmr420570785ad.15.1738637167912; Mon, 03
 Feb 2025 18:46:07 -0800 (PST)
Date: Tue,  4 Feb 2025 02:45:58 +0000
In-Reply-To: <20250204024600.4138776-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250204024600.4138776-1-jthies@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250204024600.4138776-2-jthies@google.com>
Subject: [PATCH v1 1/2] platform/chrome: add PD_EVENT_INIT bit definition
From: Jameson Thies <jthies@google.com>
To: ukaszb@chromium.org, tzungbi@kernel.org, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, dmitry.baryshkov@linaro.org, 
	abhishekpandit@chromium.org, akuchynski@chromium.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

Update cros_ec_commands.h to include a definition for PD_EVENT_INIT.
On platforms supporting UCSI, this host event type is sent when the PPM
initializes.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 include/linux/platform_data/cros_ec_commands.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index ecf290a0c98f..1f4e4f2b89bb 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -5046,6 +5046,7 @@ struct ec_response_pd_status {
 #define PD_EVENT_DATA_SWAP         BIT(3)
 #define PD_EVENT_TYPEC             BIT(4)
 #define PD_EVENT_PPM               BIT(5)
+#define PD_EVENT_INIT              BIT(6)
 
 struct ec_response_host_event_status {
 	uint32_t status; /* PD MCU host event status */
-- 
2.48.1.362.g079036d154-goog


