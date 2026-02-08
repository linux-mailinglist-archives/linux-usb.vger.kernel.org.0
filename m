Return-Path: <linux-usb+bounces-33170-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGNWAijEiGlyvwQAu9opvQ
	(envelope-from <linux-usb+bounces-33170-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 18:13:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC0F109859
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 18:13:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A04F1300C5BD
	for <lists+linux-usb@lfdr.de>; Sun,  8 Feb 2026 17:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC42D2D5925;
	Sun,  8 Feb 2026 17:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cX7vjSic"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA9E2857F0
	for <linux-usb@vger.kernel.org>; Sun,  8 Feb 2026 17:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770570780; cv=none; b=hijy+VIQnGmRhf1kehoWOFJtQNx6wkxPE3OU3OOSXhxUI4fXXPFBf6qxrzfh94oYuOOjVIzk9dRX2xOcNMwiwP2xPspA/6yvhvo7b2h0hnbcn1Us9q3mHnIqyjcEwxq/9DORdmpfuIu2wK7emaIOh15uce/Mzx6faTDjOeOherM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770570780; c=relaxed/simple;
	bh=mhdGlb1t/ORpowAdA81B+hfxkL6dR35ohtzKQDqvK14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZVW9RncQWi3+Ak5XS/hx8xBCds23PwbSbneJ2ufRQfmwnZWb1ZmmbH4NaMxhIiAkDcF0EzV4dLZnhSENU8dabsQ/yYIhMYiy1WgxJjpTqz525X0HLppkjCEuMiLJeeqJZHktTnolO4MAnHsn6iU3KarPIDY0Py+mAlbRHziY54E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cX7vjSic; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4362d4050c1so2088708f8f.2
        for <linux-usb@vger.kernel.org>; Sun, 08 Feb 2026 09:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770570778; x=1771175578; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pvwzpJVVWdrlZd2NDzfr6xh4JKcYdWHSQxCaogW/r78=;
        b=cX7vjSict1bsD0vMsB+mmRfET8M7H/i5JSv6sBnzz99nfiUSljoB0rivBaEByCgFnM
         7gBQrr7NomgUPKUArdh+0Jf1npGyrodNWffxB3vnne0wmNWrQnTkXz/gaVQQP8+qALeu
         FUfPBz+25gwU5c+5CxjnAlgQOCvLDDwfN695h/3yJosQfcpcMnJ3Oirt2hpyyL+sM0jf
         FK4feTe3mm1ykHefSMrwR2UbC+ZpzPkzWPEZB1LIMbSxX0jh2YLnAwnpqDDTxMLblP8i
         2kYLTdImTBzNX9tdGuUa4SQcyQEKJF4M3RYvJjVpheKc8inN8aYpna6ybzEvOrqmxoUP
         6GVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770570778; x=1771175578;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvwzpJVVWdrlZd2NDzfr6xh4JKcYdWHSQxCaogW/r78=;
        b=Uxi34wsWxcT7+rc17/cc2KhRdpga4Xn+jD0qXHwx9KZoF1XKlZhj8Ep0WtFqqyQpJz
         QQrG7m6EkrvLTD4jciSZL1puowFUN7838hxvunIsySss/litSOxMf5nT+Uv8aSQsObnY
         9gjl3nEqx3YPhkQgC2++JOYc9Brt9i6iDxXezSAgqu7RyDM6ZDYWCT+uyeZp/Cb9mb/6
         rQAZZwov9IbEU0V0YtzDsv0tIcm11OQLjuZ6a43fQmJIE6LVECkzKGUOxKxWDAppihJk
         a5xk/lVmUWYZRbORnZwRd93i8psIDxWu268S0tG/QVqx12zUI58W3sXpEuV95btQR9qj
         v6Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWTa7k2EN6hCXfL/zrF7rYyynyuiQrI80XF+9sUdvGBshRRGH7C1EVdjH/TfdDjb26ZpeH+Y6PbSlg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmkkEYtC3C6eu9i5Ad5jDb/kKcBI8As8L6vrLtZOPq4wp7Hn6O
	A9zooMt52rj39C5YbR39f+V7O921HR9YC+ukxoCQzVX5qksCX79Ogmvw
X-Gm-Gg: AZuq6aJlgLm6gUX9vimXxJ4Qbu8MlfOQvWgwh0XhDfII8pu+AqeoAaJ8YmQNnOdbw9u
	IJcltocPE6jAC+Qr61phrYzsxfbWx2rdcVFLNUqlkcTdbb7j42RP6Axt74ELoXNGu9cyYgrfiig
	g3xcOpT2K1CqZognnh2+8RB4wC7umoNLoztsgdR5/8QkVd8XgYB833wFERhqlFNsqu8O91vZiU1
	Pn0/vT+rgOJ6mB2oSSjqrsEghu4xn7Qy4k65BjYOSDef5fCJL+Gxr6AtzcW/bZLUxlJD7p55xrD
	kpfv4C4MuwunOyuBuk4tQbOGkRtsCZ9KtLeNvwGaQpiPLPpEnDQjBx6HoUonCq11+ssSl7dHjId
	4inS1V4WAOY3+/1zpbtltKQ7vwUohDPGWbDHgNQY8+AZvsgM8V7gDaXeAyDLENZBdsnrK9OaQkU
	hStMINxm5p0jJOjVIb7KKy9YmkLg==
X-Received: by 2002:a5d:5f88:0:b0:431:35a:4a8f with SMTP id ffacd0b85a97d-4362938ffacmr13963638f8f.47.1770570778245;
        Sun, 08 Feb 2026 09:12:58 -0800 (PST)
Received: from [192.168.178.21] ([2001:9e8:fb98:1600:22c9:d0ff:fe7b:79cb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376accfc0bsm5451770f8f.32.2026.02.08.09.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 09:12:57 -0800 (PST)
From: Liam Mitchell <mitchell.liam@gmail.com>
Date: Sun, 08 Feb 2026 18:10:19 +0100
Subject: [PATCH] usbhid: tolerate intermittent errors
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260208-usbhid-eproto-v1-1-5872c10d90bb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwML3dLipIzMFN3UgqL8knxdQ1OjZPPEpOQkQwtTJaCegqLUtMwKsHn
 RsbW1AOpKY4hfAAAA
X-Change-ID: 20260208-usbhid-eproto-152c7abcb185
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Liam Mitchell <mitchell.liam@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770570777; l=3087;
 i=mitchell.liam@gmail.com; s=20260207; h=from:subject:message-id;
 bh=mhdGlb1t/ORpowAdA81B+hfxkL6dR35ohtzKQDqvK14=;
 b=Ya3bIaypa9Ewxl1KQHmRS4/NfpBCMUt3ZTOCfdVztCt1pod1ob43r+3jt4L5nUqpATl1H2SpA
 knKUZSaLzxZB/aMVifGEFE/OxK+fpTZtXWv61BVpxlOX5chism183Z1
X-Developer-Key: i=mitchell.liam@gmail.com; a=ed25519;
 pk=Y9mPqBk1OuHZ0OaUZ5a8Nc5X7YHs7+SKiNwUfcLfPmg=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[rowland.harvard.edu,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-33170-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitchellliam@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9BC0F109859
X-Rspamd-Action: no action

Modifies the usbhid error handling logic to better handle intermittent
errors like EPROTO, which should only need resubmission of URBs and not
full device reset.

Reduces initial retry delay from 13ms to 1ms. The faster the URB is
resubmitted, the lower the chance that user events will be missed.

Increases retry delay multiplier from 2 to 5, reaching max delay in a
similar number of retries.

Adds another check to the reset block, only resetting if retry_delay has
reached max, effectively only allowing reset after 4 errors.

---
The usbhid driver will reset a device after only two errors 1-1.5s apart.
The first error will be handled with a retry after 13ms.
Handling of the second error depends on the time since the first:
* <1000ms: retry after 26ms
* >1000ms & <1500ms: reset USB device, taking maybe hundreds of ms
* >1500ms: retry after 13ms

It doesn't take into account the type, count or timing of errors.
EPROTO errors can occur randomly, sometimes frequently and are often not
fixed by a device reset.
Retry delays or device resets only raise the chance that input events will
be missed and that users see symptoms like missed or sticky keyboard keys.

See following thread for more details:
https://lore.kernel.org/linux-input/CAOQ1CL6Q+4GNy=kgisLzs0UBXFT3b02PG8t-0rPuW-Wf6NhQ6g@mail.gmail.com/

The following patch is a minimal change to better tolerate intermittent errors.

Using existing variables, we reduce initial retry delays and only reset in
the 1000-1500ms window if 4+ errors have occurred.

This should reduce issues for users with intermittent errors and retain
the intended retry-backoff-reset for erroring devices that need a reset.

More comprehensive error handling could involve counting errors, time between
errors and/or switching on error type but would be more invasive.

Signed-off-by: Liam Mitchell <mitchell.liam@gmail.com>
---
 drivers/hid/usbhid/hid-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index aac0051a2cf6..b6e956ca781b 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -160,12 +160,12 @@ static void hid_io_error(struct hid_device *hid)
 
 	/* When an error occurs, retry at increasing intervals */
 	if (usbhid->retry_delay == 0) {
-		usbhid->retry_delay = 13;	/* Then 26, 52, 104, 104, ... */
+		usbhid->retry_delay = 1;	/* Then 5, 25, 125, 125, ... */
 		usbhid->stop_retry = jiffies + msecs_to_jiffies(1000);
 	} else if (usbhid->retry_delay < 100)
-		usbhid->retry_delay *= 2;
+		usbhid->retry_delay *= 5;
 
-	if (time_after(jiffies, usbhid->stop_retry)) {
+	if (time_after(jiffies, usbhid->stop_retry) && usbhid->retry_delay >= 100) {
 
 		/* Retries failed, so do a port reset unless we lack bandwidth*/
 		if (!test_bit(HID_NO_BANDWIDTH, &usbhid->iofl)

---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20260208-usbhid-eproto-152c7abcb185

Best regards,
-- 
Liam Mitchell <mitchell.liam@gmail.com>


