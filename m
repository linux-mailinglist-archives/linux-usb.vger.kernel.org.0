Return-Path: <linux-usb+bounces-17646-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 716D49D027A
	for <lists+linux-usb@lfdr.de>; Sun, 17 Nov 2024 09:32:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DBFAB22A2D
	for <lists+linux-usb@lfdr.de>; Sun, 17 Nov 2024 08:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1258624B;
	Sun, 17 Nov 2024 08:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=intelfx.name header.i=@intelfx.name header.b="J31Kg2or"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6589383A5
	for <linux-usb@vger.kernel.org>; Sun, 17 Nov 2024 08:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731832343; cv=none; b=RVJ6aQ7Wm8uWZK38l7LD/VWaprtfGc/Xdsm73c7IzICPUCM6XbqboKBSuZIZnssV94tCiCIlYUwN/NMLh4LL/RFt3SbbAWiaGTLivzphfIOauUKj8nzzZ1IAxUhxUkYthZKGvVGoTYThU7B3q6i/ZzqVK6Zo6MOUWRUqs91G+xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731832343; c=relaxed/simple;
	bh=bEdtzbEoybZw2elzR+5shN7afieydr1cqVkaEADVKqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uNs0E0I7i72MYma+NBZrSQauKyVVi9vNQCBVwlr3VwitxU+8XJ68p6Cz9hUFUsFAC2y5p3h+ox1IHQ2k2yOcqIo/3JyqIvx1xOsfNUi1mgTWRFES9wkR9JbxxKl1IvI/E+DvkS/MCSxrx8SNGR4BiQjKti2y5ifBE+sigbrKadY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=intelfx.name; spf=pass smtp.mailfrom=intelfx.name; dkim=pass (1024-bit key) header.d=intelfx.name header.i=@intelfx.name header.b=J31Kg2or; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=intelfx.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intelfx.name
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d4c482844so2183475f8f.0
        for <linux-usb@vger.kernel.org>; Sun, 17 Nov 2024 00:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google; t=1731832339; x=1732437139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3xqOFH63hSrxX1dILSqXuu7UlXARoGwwkDBC60Jsfjg=;
        b=J31Kg2orYVJNBZ8e//Rq0DHyUvW1m3mjPr7srLgL4qpNSRf/8F26rS2jqyShispcup
         2L/ucFbYK2ZJzkex6KlLKEiRt2KnpGnVoOa5j7Y+rKCOlvyflFMBmbt+pKJ+O+esqhgw
         uNybT4QMOdJ7qAis19yDhea5hzon2FnuZkq0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731832339; x=1732437139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xqOFH63hSrxX1dILSqXuu7UlXARoGwwkDBC60Jsfjg=;
        b=LHOKBMeab67nAC0r1ud2oduCqZGJFhsjTZjnNrT441dQRBcFShc591xalK+dJXtxTy
         0mHvabZ1h9FDMpGpJHxEiZS7iI76hjS6pdb9AinQTudzurN+ZS2fhJib6rvzCkO57z4W
         ZlT1BaXdSWSFZ03o7bBxxOgnb9oG2uDy5COI5mLktX7Y0pwAU0kFnr+zK9d3zg5CyJhS
         FeVU/rNKcWFIIhTMYOv2tGU7sewKL84VJhgo9l7wKqMpVBbypB7f06edfbzJx1JRNUvP
         usFtaV6xaE5mWDSt5aOQSLnSWjncreHtN22gi/wq7z/xd1EC451gQJmleTDHx57wNa93
         mhBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp8ynS58cGqbaib0Ya5erBAFffi1+UK3dTD5DEP3+JWJRVLUTwW1YhDK7Coi7yg5nygYhq3B8L8PM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfYkDjioA0KstcS39dNZq2AuxjkImv3rAhrJqeAyvobJC7IvuZ
	4g+dTjwV6g5PB1yPXXDQG49vCuXyIaB4W0d6oRXBTAR0LzUt+0rjZKJ4EjTQMQk=
X-Google-Smtp-Source: AGHT+IFqkInzKSrfWZDyAqHcKfytVQVzvBRf/xa6VaY1oFjx31mr3qwfdW5qrpoRUwLDctZQXKIcMQ==
X-Received: by 2002:a5d:5887:0:b0:382:42c3:83cc with SMTP id ffacd0b85a97d-38242c38557mr659457f8f.45.1731832338731;
        Sun, 17 Nov 2024 00:32:18 -0800 (PST)
Received: from able.tailbefcf.ts.net (94-43-143-139.dsl.utg.ge. [94.43.143.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ae1685csm9466919f8f.83.2024.11.17.00.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 00:32:18 -0800 (PST)
From: Ivan Shapovalov <intelfx@intelfx.name>
To: linux-kernel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx@intelfx.name>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 1/5] net: usb: qmi_wwan: add IDs for EM7565 (9X50) in "MBIM USBIF" config
Date: Sun, 17 Nov 2024 12:31:11 +0400
Message-ID: <20241117083204.57738-1-intelfx@intelfx.name>
X-Mailer: git-send-email 2.47.0.5.gd823fa0eac
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change was discovered and tested using author's own EM7565 device.

This "MBIM USBIF" configuration corresponds to the `AT!USBCOMP=1,1,xxx`
on-device USB composition setting. When activated, the VID:PID resets
to 1199:90b1 ("application" mode) + 1199:90b0 ("boot" mode, i.e. QDL).

The "MBIM USBIF" label comes from on-device help:

---8<---
AT!USBCOMP=?
!USBCOMP:
AT!USBCOMP=<Config Index>,<Config Type>,<Interface bitmask>
  <Config Index>      - configuration index to which the composition applies, should be 1

  <Config Type>       - 1:MBIM USBIF, 2:PCIE USBIF, 3:Legacy-Generic, 4:RNDIS

  <Interface bitmask> - DIAG     - 0x00000001,
                        NMEA     - 0x00000004,
                        MODEM    - 0x00000008,
                        RMNET0   - 0x00000100,
                        MBIM     - 0x00001000,
  e.g.
  10D  - diag, nmea, modem, rmnet interfaces enabled
  1009 - diag, modem, mbim interfaces enabled

  The default configuration is:
  at!usbcomp=1,3,10F

OK
---8<---

Signed-off-by: Ivan Shapovalov <intelfx@intelfx.name>
---
 drivers/net/usb/qmi_wwan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index 0c011d8f5d4d..9a33393d4ce2 100644
--- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -1349,6 +1349,7 @@ static const struct usb_device_id products[] = {
 	{QMI_QUIRK_SET_DTR(0x1199, 0x907b, 8)},	/* Sierra Wireless EM74xx */
 	{QMI_QUIRK_SET_DTR(0x1199, 0x907b, 10)},/* Sierra Wireless EM74xx */
 	{QMI_QUIRK_SET_DTR(0x1199, 0x9091, 8)},	/* Sierra Wireless EM7565 */
+	{QMI_QUIRK_SET_DTR(0x1199, 0x90b1, 8)},	/* Sierra Wireless EM7565 "MBIM USB-IF" */
 	{QMI_QUIRK_SET_DTR(0x1199, 0xc081, 8)},	/* Sierra Wireless EM7590 */
 	{QMI_FIXED_INTF(0x1bbb, 0x011e, 4)},	/* Telekom Speedstick LTE II (Alcatel One Touch L100V LTE) */
 	{QMI_FIXED_INTF(0x1bbb, 0x0203, 2)},	/* Alcatel L800MA */
-- 
2.47.0.5.gd823fa0eac


