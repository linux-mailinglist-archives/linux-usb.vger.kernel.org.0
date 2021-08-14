Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2FA63EC3B1
	for <lists+linux-usb@lfdr.de>; Sat, 14 Aug 2021 18:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234577AbhHNQBR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Aug 2021 12:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232131AbhHNQBO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 14 Aug 2021 12:01:14 -0400
X-Greylist: delayed 486 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 14 Aug 2021 09:00:39 PDT
Received: from mx2.freebsd.org (mx2.freebsd.org [IPv6:2610:1c1:1:606c::19:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D21C061764
        for <linux-usb@vger.kernel.org>; Sat, 14 Aug 2021 09:00:39 -0700 (PDT)
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits)
         client-signature RSA-PSS (4096 bits))
        (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
        by mx2.freebsd.org (Postfix) with ESMTPS id 0858F8331D;
        Sat, 14 Aug 2021 15:52:30 +0000 (UTC)
        (envelope-from uqs@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [IPv6:2610:1c1:1:606c::24b:4])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
        by mx1.freebsd.org (Postfix) with ESMTPS id 4Gn4gd6dwVz4SJM;
        Sat, 14 Aug 2021 15:52:29 +0000 (UTC)
        (envelope-from uqs@FreeBSD.org)
Received: from localhost (roadrunner.spoerlein.net [IPv6:2a02:168:5230:0:9afa:9bff:fe63:d56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: uqs/mail)
        by smtp.freebsd.org (Postfix) with ESMTPSA id 84BCFC93F;
        Sat, 14 Aug 2021 15:52:29 +0000 (UTC)
        (envelope-from uqs@FreeBSD.org)
From:   =?UTF-8?q?Ulrich=20Sp=C3=B6rlein?= <uqs@FreeBSD.org>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        =?UTF-8?q?Ulrich=20Sp=C3=B6rlein?= <uqs@FreeBSD.org>
Subject: [PATCH] HID: sony: Fix more ShanWan clone gamepads to not rumble when plugged in.
Date:   Sat, 14 Aug 2021 17:52:14 +0200
Message-Id: <20210814155214.83856-1-uqs@FreeBSD.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The device string on these can differ, apparently, including typos. I've
bought 2 of these in 2012 and googling shows many folks out there with
that broken spelling in their dmesg.

Signed-off-by: Ulrich Spörlein <uqs@FreeBSD.org>
---
 drivers/hid/hid-sony.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git drivers/hid/hid-sony.c drivers/hid/hid-sony.c
index b3722c51ec78..a2fef59063a6 100644
--- drivers/hid/hid-sony.c
+++ drivers/hid/hid-sony.c
@@ -2974,7 +2974,8 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (!strcmp(hdev->name, "FutureMax Dance Mat"))
 		quirks |= FUTUREMAX_DANCE_MAT;
 
-	if (!strcmp(hdev->name, "SHANWAN PS3 GamePad"))
+	if (!strcmp(hdev->name, "SHANWAN PS3 GamePad") ||
+	    !strcmp(hdev->name, "ShanWan PS(R) Ga`epad"))
 		quirks |= SHANWAN_GAMEPAD;
 
 	sc = devm_kzalloc(&hdev->dev, sizeof(*sc), GFP_KERNEL);
-- 
2.32.0

