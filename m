Return-Path: <linux-usb+bounces-30973-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07756C8A527
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 15:27:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC59A3A2439
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 14:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E081B3002C2;
	Wed, 26 Nov 2025 14:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6czExAQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA332FF154
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 14:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764167211; cv=none; b=e4eWJIVDpLS8R6Tj/+4nvWgZV+bLzQte2ESV5PHs1mvXUlqUoyt92gw5yGsoYzWbfYr0PGA8FDLEZg8F/qTDgN5yu21Ssvvcp3OzMxVA5IOj9zk5ZTqVlvETvk7WTH0EvCevw6Ok5tOLSUVtDOzAX4wKnY1T5kS6BEFMSDpqoJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764167211; c=relaxed/simple;
	bh=cZKCDok2bvgHpy/QIdyMpaY5kiMPfYKS7NyBSXZn3R0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZn6culZhwnV+iNmqA8IWWGRFAUOQ6yZBD6SBtu2FU34ajci7jw3fI/TAW3DXbfcnRbjyVIWYQVXtmTBqTtN3illKOKrUgJ/oVrRaHTAOd+xXaknTdOlsiUQufBiUKK7caZg8Wg+Wu49LWUAkgH1SLnL+J4psZd+Ck1CmmU1bpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6czExAQ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b31507ed8so5705883f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 06:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764167208; x=1764772008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kq9qSywkO4PP1gvaQ5TihW+kIalcwEhayZAl0fTMBI=;
        b=S6czExAQeUJz63p57SwkuRWnzdxg5QoBL6G/GJjinrD+4xbWwYFkcLULecF+gJcXh4
         Y28UdyMEMKTN6uVwyxwi4LfAok7ak/3nK3RiERJkjl2mkLd3JmCPJH5U0aOii4+QuOpS
         cBgO3Ctv8zCksytygw3XyFL/5gz72x05pNo1Fy50NWgraUHJiWu4lWLuCjLihSYDU8Q+
         49cit5BHu005X9HMcybwFVFJRgquoLS3W8rN061kWXnAoOiM8U8pRlvNAt9s8JPkQjk0
         EtyW7Y1enJC4XaUUqyZ2Mwu8QClTuVbR9wJYfdeDBeFTNshFUQr+OmBWHcD4z40vUG5C
         WKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764167208; x=1764772008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9kq9qSywkO4PP1gvaQ5TihW+kIalcwEhayZAl0fTMBI=;
        b=fJcDe4MIQJLPHCtnmizxgJGPBIfpMWSXKdWXr6OClUD38nRsgQXsPumSddHM9P/giX
         NixZJfG7awUwIrjF3mNQ12ufc96y9gp4PLoDT6QoLTCCBXKJW6ubQGnf4P+lF8X8OmFs
         fFWKL64s9gXa+/4B4ejDBYemZeRZfgqQfjHxq1ID4GtVK/hV/6qXBQ8X3RvVMqt4xtAB
         R8DtDZqXmc90cdEKNjZRibqh4Io7G43cPLesfPscPmoRWyBF+C+GCWKJSAZL8HH7ht3X
         52g1Ngw/Cuf6hISufrzmcsxidX4pOE51CPJ1Y1ytQgbGAyAsWLQX3mgH05YMaH93Jfoy
         Zpvw==
X-Forwarded-Encrypted: i=1; AJvYcCUHHrxpjlbAXgv2+NZbsqmTjWdKUx0HFb2h1eHmeh1ozFXXUkIGGUlBAfRMtL9QMlgyzksnCw0Jwos=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6iOSDNzUNXAHUVmP2hl68SQ4DfN1Uzvkt4hPgle6EnBI+peSh
	/9DlkZYZFgzi34jNaAkjDe977lnmtmTO8feX5M4v7/er8lGn9pwUTpyX
X-Gm-Gg: ASbGncsOqEtf8Ok+x2CpKR/LlpMbHGH5Bw6XVJUsUwNcmS4q4plUwVY5xYjky2c0JSE
	i0nvGuQLZ2dhDX3dTitPnzWmieOD+scRrZ4kwKEmaMP3DO7VXHL6uA1BLaIA0pRmaQrxtRGZ5rY
	3UeKaCCfdgqhi91ytEvenmRH50RNoUivHsoSn4u7KqFD6mnsulk64xt1NuTj4UfDjxewuvzWZnu
	6QQvMywoTakuTgOz/dNNOLUvx5jONpUfa94D6srxIChfrklI/arcqhIRGWfqYcjnzhqyF+3+Biy
	F5iBANHR4/4uYezRT8wGS1ZqjLi2FYgd3pfgmevAcwzwiRRCWBXGhvacsbw2XWNk3EhxG3d5l7Z
	TM9kX6mBBkWyXP4BYsFl1t+LUH7wzIzkyoIKxgbrYNXZJdy1Zxjdvs9DUSNvLVC5QBVd30gJESL
	IV73SpbHwCe2RwmfMHIWZ5sD3B8hlWF2vy8EwBbkpdiCog8wwxdDRbIEfp5CO1GK+2eNmVqEVC1
	gPb9j8uXl5sDt1scfgpxp6DpFl9XeE=
X-Google-Smtp-Source: AGHT+IETtaFHS+x0ramNhJgrmk5gzy/7x5161YsafXqoP3q79y+8pGoxvYRTtycML8sbNx6zlDz0hg==
X-Received: by 2002:a05:6000:1446:b0:42b:40df:2338 with SMTP id ffacd0b85a97d-42e0f3623camr7347370f8f.52.1764167207732;
        Wed, 26 Nov 2025 06:26:47 -0800 (PST)
Received: from labdl-itc-sw06.tmt.telital.com ([2a01:7d0:4800:a:8eec:4bff:febd:98b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm42112330f8f.40.2025.11.26.06.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:26:46 -0800 (PST)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>,
	Fabio Porcedda <fabio.porcedda@gmail.com>
Subject: [PATCH v3 2/2] USB: serial: option: move Telit 0x10c7 composition in the right place
Date: Wed, 26 Nov 2025 15:26:40 +0100
Message-ID: <bfe3ba64ee82c03af0bb6bf7802098932f254759.1764167099.git.fabio.porcedda@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1764167099.git.fabio.porcedda@gmail.com>
References: <cover.1764167099.git.fabio.porcedda@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move Telit 0x10c7 composition right after 0x10c6 composition and
before 0x10c8 composition.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 drivers/usb/serial/option.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index b9983e6f5eff..2610bb860682 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1445,6 +1445,9 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10c6, 0xff),	/* Telit FE910C04 (MBIM) */
 	  .driver_info = NCTRL(4) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10c7, 0xff, 0xff, 0x30),	/* Telit FE910C04 (ECM) */
+	  .driver_info = NCTRL(4) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10c7, 0xff, 0xff, 0x40) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10c8, 0xff),	/* Telit FE910C04 (rmnet) */
 	  .driver_info = RSVD(0) | NCTRL(2) | RSVD(3) | RSVD(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10c9, 0xff),	/* Telit FE910C04 (MBIM) */
@@ -1455,9 +1458,6 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(5) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d0, 0xff, 0xff, 0x40) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d0, 0xff, 0xff, 0x60) },
-	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10c7, 0xff, 0xff, 0x30),	/* Telit FE910C04 (ECM) */
-	  .driver_info = NCTRL(4) },
-	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10c7, 0xff, 0xff, 0x40) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d1, 0xff, 0xff, 0x30),	/* Telit FN990B (MBIM) */
 	  .driver_info = NCTRL(6) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d1, 0xff, 0xff, 0x40) },
-- 
2.52.0


