Return-Path: <linux-usb+bounces-1501-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7607C6AF0
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 12:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C84A282AC7
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 10:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566D822F0F;
	Thu, 12 Oct 2023 10:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="OOe/SE0w"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDB022EF7
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 10:23:52 +0000 (UTC)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87BD9CF;
	Thu, 12 Oct 2023 03:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1697106227;
	bh=77/5kGZDvjmKJEmjKc9G1sLtjI9zG6J4vpqdH8+SQGY=;
	h=From:Subject:Date:To:Cc:From;
	b=OOe/SE0wShL27Fslgwqvy93fVw7awrnvU8D2bkkXFq/r+co5D3qEk9HKsY2e29q6Y
	 TqhR6mGFrEcKshNAL4P+wEky9sOiuLjM6p8RWDXzzX7HcR5p7ZCoF0VO7y3RXbeIqf
	 fDFuHGiU9pjynsOOHYjQgI0cuqKfGvzUSPxixZFA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/4] HID: remove #ifdef CONFIG_PM
Date: Thu, 12 Oct 2023 12:23:37 +0200
Message-Id: <20231012-hid-pm_ptr-v1-0-0a71531ca93b@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACnJJ2UC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDA0Mj3YzMFN2C3PiCkiLdVCPLxCTT1FTz5FRzJaCGgqLUtMwKsGHRsbW
 1AKVsz9VcAAAA
To: Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697106226; l=1006;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=77/5kGZDvjmKJEmjKc9G1sLtjI9zG6J4vpqdH8+SQGY=;
 b=ovkq4dcnyDQcOqGDKIT5r4EQk2ywTf9xcY8S7c8/L061zmU/czps+DfP99Ls6+uwKg8Q6ZEDn
 TvD2u8RI2ehCRk5yIato/BSXdwSt0WW88Wk6jJLklbHIP3tOPqtuiYa
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Through the usage of pm_ptr() the CONFIG_PM-dependent code will always be
compiled, protecting against bitrot.
The linker will then garbage-collect the unused function avoiding any overhead.

This series only converts three users of CONFIG_PM in drivers/hid/ but
most of the others should be convertible, too.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (4):
      HID: core: remove #ifdef CONFIG_PM from hid_driver
      HID: usbhid: remove #ifdef CONFIG_PM
      HID: multitouch: remove #ifdef CONFIG_PM
      HID: rmi: remove #ifdef CONFIG_PM

 drivers/hid/hid-multitouch.c  | 10 +++-------
 drivers/hid/hid-rmi.c         | 10 +++-------
 drivers/hid/usbhid/hid-core.c | 11 +++--------
 include/linux/hid.h           |  4 ++--
 4 files changed, 11 insertions(+), 24 deletions(-)
---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20231012-hid-pm_ptr-e29ab5ee7ce7

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


