Return-Path: <linux-usb+bounces-21025-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 180B1A43CD9
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 12:08:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E05CC3AB5BE
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 11:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0161B1C7015;
	Tue, 25 Feb 2025 11:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VLKvPrms"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F013DBB6
	for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2025 11:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740481378; cv=none; b=fRT9enM4gt216lJQ9cCqz/8RBMwmxZgpNh/BgD3feJd0tO/2yOFVDq8yvWaXx9y1gsFySH1nLHiBB7qZgMhMiKV8Lde6fCUIbciaKDZP8xul5UlXMU4EUBAzoCLAC8SJFWs8MKNzPFA2+s3/9IubhNtckNH7OfxuoSS66KW1TEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740481378; c=relaxed/simple;
	bh=ETtuxgoCmGD6GCJAtelSUQ7IYvR4XbEQT0pQYTDvHLs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=euv6uqUVFvkyBuNuf0bfv9P97T/OuRFDw8gyfkDM7I+rb6E07m4UKbll/qwyHyxLQFRF0x6xvLlYMyRJjBkBEvW0ywTT5d9PFvfbVD134o9zraaSK+k0ds2N104+FxTe+TegCzQTCLGExryOEO6Kesi91w2X+0k7LW6M6vV0Kr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VLKvPrms; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38f5fc33602so3089393f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2025 03:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740481375; x=1741086175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u3Kz9HYv0oshW0gFWXcIc0A+6ZC5T21YpojNVzTKfkk=;
        b=VLKvPrmsxdF1qVjJ9Aac5UFKpw3tu9gHlDq8ScHrj7VtDLIoigpDanWfdaA6ba9HD9
         1OGBmgG5pQVESiG0O9bu2iw8E/2ka3PnBCCbqPZzKA/BwWaM+uzA8XhvaE9772kBunhK
         OrrUxpX0RDgL09hCjkOH7iIexiWTjq1DRjNensa4BGqF3DTQ2S/F3wja9LHEkruJoE0b
         NorI6wFtucdhdxP+42LYBNLYAmXxZl9CHHcyFWDokxHDXwbGDm25EwUWOylDaafxYzJc
         1jcUBNH9vk6nQvuxv49QeEOvIFPVoWzYJv5nghVpdlbbj44Q4AhVJr9/CqojYJcBf8PU
         T+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740481375; x=1741086175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u3Kz9HYv0oshW0gFWXcIc0A+6ZC5T21YpojNVzTKfkk=;
        b=N3w/YWSCm9Y2Y8jAPt9EAEHVgd+NUEIBDgdej+FRzxbnCDXHAt5VmQNSXbJLgwte3y
         eiAAPbQWbf+JWAePkNbrtL2EfANG0t4ZJBPphzbGjBhICmkPMgUeqr08wmx2eCaIKxZs
         f8ZtBJZV5gSrT71LJj6pTeR6PC5aYcc5mSr9qRRnmAFQrnj4v9MVj8n7TPXSdgOhlyOR
         lcypg3O+1YL/aAPQm06Zd+EZaRXKGhc33DqCkggvCNvjpMiVg/w+ypHFmsGqggpUb5f+
         oU+ruaGv0BXgJhD+H81h/M6Y1EJzqtZ19bF/23TWcgZ27cJzjZ6jiAlkL/JDXAYgNzWy
         1OKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbx0kPojHsXMKvIv1uNFPkTjnlPRNSaH047volmaHFCeaMbpmd97x4IHfQQEucgsl9bbBeTp7LUv0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwmz3NoHh1QZcSSyWqSHpReim7mrnqyBqh09wmw3AvDlSwr+9X
	GUekmmvp8Ypg+udNoMYiNtDhcQedNcVrxztmpbG5APIFGGshmJRrQ3LGO7WtpkA=
X-Gm-Gg: ASbGncszCuPXhnRDh8J8lvWhw70txMNJylxYH9ygSnhM+Ek1CDLJUnLPiYRrosKIraG
	w13tBx+n3F7IeV84VjoKPEzNzfNNQOcs+rV+E2QVZBeYV3NuWzTkbBSBRCEb9R51BMsQVuIcPq3
	8N+NGs/Cz5LowudagaJP/1W80aUxmq9MRKWV6gQEQbXMpqrG5LxPTh9KLZOcwoZVXNApqnU4Fbu
	J82hpRfYQvVKryYZZRDYDgkPWcoG3pC1KkuT4vnXHXqEb0IhNsIWM6o7OzjXs87x6WJxUWBOslC
	w8g8fUy2ykvY/KST+4k6BopNWhSGWOyaSKHK/4wnE7HRLrd6gKPgAxE=
X-Google-Smtp-Source: AGHT+IH/3iSaiAIw4MHYyqaCp1fgVVpiGu5evNyaZzm9vasT9RI3VLb9Fgw+RB5SxvQw9z25TmoUAQ==
X-Received: by 2002:a5d:6d09:0:b0:38f:4f37:7504 with SMTP id ffacd0b85a97d-38f615be1c7mr17685892f8f.16.1740481375029;
        Tue, 25 Feb 2025 03:02:55 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab1532dccsm21972385e9.7.2025.02.25.03.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:02:54 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	geert+renesas@glider.be,
	biju.das.jz@bp.renesas.com,
	yoshihiro.shimoda.uh@renesas.com,
	phil.edworthy@renesas.com,
	balbi@ti.com,
	laurent.pinchart@ideasonboard.com,
	kuninori.morimoto.gx@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/3] usb: renesas_usbhs: Fixes for renesas_usbhs
Date: Tue, 25 Feb 2025 13:02:45 +0200
Message-ID: <20250225110248.870417-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series add fixes for the Renesas USBHS driver identified while
working on the Renesas USB PHY driver (series at [1]).

Series (with [1] on top) was tested on Renesas RZ/G3S with consecutive
unbind/bind and data transfer tests before/after the unbind/bind.

The unbind/bind was also tested on the devices with the following
device trees but w/o checking the data transfer (as I only had
remote access w/o USB devices connected):
- r8a7742-iwg21d-q7.dts
- r8a7743-iwg20d-q7.dts
- r8a7744-iwg20d-q7.dts
- r8a7745-iwg22d-sodimm.dts
- r8a77470-iwg23s-sbc.dts
- r8a774a1-hihope-rzg2m-ex.dts
- r8a774b1-hihope-rzg2n-ex.dts
- r8a774e1-hihope-rzg2h-ex.dts
- r9a07g043u11-smarc.dts
- r9a07g044c2-smarc.dts
- r9a07g044l2-smarc.dts
- r9a07g054l2-smarc.dts
- r9a07g043f01-smarc.dts

Thank you,
Claudiu Beznea

Changes in v2:
- dropped RTF
- collected tags

[1] https://lore.kernel.org/all/20250219160749.1750797-1-claudiu.beznea.uj@bp.renesas.com/

Claudiu Beznea (3):
  usb: renesas_usbhs: Call clk_put()
  usb: renesas_usbhs: Use devm_usb_get_phy()
  usb: renesas_usbhs: Flush the notify_hotplug_work

 drivers/usb/renesas_usbhs/common.c     | 6 +++++-
 drivers/usb/renesas_usbhs/mod_gadget.c | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.43.0


