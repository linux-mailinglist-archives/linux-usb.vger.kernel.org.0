Return-Path: <linux-usb+bounces-27995-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9522DB5432D
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 08:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 473125657FC
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 06:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FF329DB86;
	Fri, 12 Sep 2025 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Kh9zipaZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4246929E0F8
	for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 06:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757659684; cv=none; b=J0h7oWhwMe+mJVj/4Hb723VqXZNHJuMyDBRVFXV7NGvdvbpYiCBc1C8fJgVd/kNtOyVgoS4JJka/awogeA3Bc8D/F2jzCPhWmt1X9q1+cLVu8nS/TZZSJsT6L92Tzo+oO8oqzAfeYioRgApa60Vy1VryXg9xmgqYmY0i7P9LxIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757659684; c=relaxed/simple;
	bh=6KQEugjnx2rJCM48+qtPictQnwqObzm5rcbLajzHMU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aCRT5AO/tU9jZMfw7XnaaMx3tiNqalRStax1f/Qwv8e6Su28K2kazWCPJPN89ct0N52LV9soIQfKDNVTDQ34+mIi6MzodeTavbL+u8faIPq2f7FEGolZQZXj+ourOM9H0Mw3mLCKZ1AVnt86d/fLNaUDsfe3R431mcYmyZFNmW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Kh9zipaZ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b079c13240eso250844966b.1
        for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 23:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757659682; x=1758264482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NeNrKd6NoBbgDfjKGLBumkxmas+f61lF0BwvgkVNtg=;
        b=Kh9zipaZxajVGH4xeN3ClG+zRHVb3Y+jlk/+SdO/tjmygNYJQa29LOkZsepxHUwuTv
         l6x24eCmWHrmh9AVWcpoE/GK1ETizP5gbC10GREXP+iBEQAU5VJ90LFXRonc5K1Z/umk
         DtrWByY9SyhMon+UTMCxRIr/ChaoRai0H69lY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757659682; x=1758264482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NeNrKd6NoBbgDfjKGLBumkxmas+f61lF0BwvgkVNtg=;
        b=xQYFwW0CQqh4tmqiEvrU6ZI5sU8xX73ulJDgUPrGSe/uvH7kLh0C1Y/tEl1XYkrbem
         j9wp2/uPit0WJuPKiZwx/E43LElIo21NziUqx9ILF/y3tvVHvkXSW/sBkoTlXvtfTxyO
         SVJD9fykLS66GtxjnsxIy9HeS/FKeCJ4MwdLisD+Of5/Lb8rPfSqjaCrydGfV4avWfbr
         4hSc7uB0yZF31JBKF1rh5ElSLvwQB0YDX8EuxgZFh1+426rC42npW3MItxQwQ835pdyn
         GxXXTwFlcfZtomqKzdDXaef12n8Z4KfpAJi5KoYtlmjZ6U4lH8YqWSVdwVsqVh+afOJy
         0BJw==
X-Forwarded-Encrypted: i=1; AJvYcCWyWwYvie4BIQnp5VNVrsB7S639biNmq+OU9wJuDuQCUgcrwbHCUKfLXhL+yUXuJIpZIX2syP46Ge8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXeJBBoNS1fuvfQGz9msLC9kcdzX0rWWjZhWHgqiRSKlUYURfx
	K8sM4jhdgvH01c8NYsdZHTl3lNU1zepEsyLExAOlZwnfDgyxz8VJd50Alk5UYRbhlw==
X-Gm-Gg: ASbGncuK3YMmOnObCvHCd9IoAg/+sACsfFKxLncEQnbsf8RBUYHYCR2fxXIBNfTqu4f
	V3Lx4GGBM+ajjeWMtOX8QvfGrax+l2hXhj9skLsMWJPGEz7XgeCI6Y2BDfUAAI/LP6ISpx+M/Dq
	E8mA1zgDEmJmgt8/dRadM5UY98iOUUpRbkhXw7Fr80KqIL7W+IrUa6QnlOtJUMkstYrzBwZTlbJ
	eT1UGTbIbj380Rfj/3leLQbH9LNBLyweO8n9N26VBM6W+hLhAW85LZmBxd8SnDk21v6D6oH+Xp7
	iv+Hf6ha+DFRlRuSjdJe2L1+Rizk71G2bLZ90argmAo+FE6ch9mDB/YzBhVLqA5tWwW7CIUT1TU
	OG1xYDfHJmXY5l3Pk+KWi56q54OjZs633aMIuepmZNp8IH+JN7o7pBk0kf50iHv5Jg1vsRNSaCK
	CK/1cQq+3ULQztNFY=
X-Google-Smtp-Source: AGHT+IG1I03T5HSq2OfkiQuee3J0Y3gSkDAX+xUtryPFhxhfXEKh52whMlG6mWqFElm4wgmiKoe2Pw==
X-Received: by 2002:a17:906:794d:b0:b04:8701:7304 with SMTP id a640c23a62f3a-b07c3546e64mr171386666b.10.1757659681595;
        Thu, 11 Sep 2025 23:48:01 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3128a1esm295465366b.29.2025.09.11.23.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 23:48:01 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 2/4] platform/chrome: cros_ec_typec: Set no_mode_control flag
Date: Fri, 12 Sep 2025 06:47:49 +0000
Message-ID: <20250912064751.1987850-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
In-Reply-To: <20250912064751.1987850-1-akuchynski@chromium.org>
References: <20250912064751.1987850-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag specifies that the Embedded Controller (EC) must receive explicit
approval from the Application Processor (AP) before initiating Type-C
alternate modes or USB4 mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index b712bcff6fb2..c0806c562bb9 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -491,6 +491,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 
 		cap->driver_data = cros_port;
 		cap->ops = &cros_typec_usb_mode_ops;
+		cap->no_mode_control = !typec->ap_driven_altmode;
 
 		cros_port->port = typec_register_port(dev, cap);
 		if (IS_ERR(cros_port->port)) {
-- 
2.51.0.384.g4c02a37b29-goog


