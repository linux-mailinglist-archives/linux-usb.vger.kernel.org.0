Return-Path: <linux-usb+bounces-31241-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B93DCAB4F2
	for <lists+linux-usb@lfdr.de>; Sun, 07 Dec 2025 13:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EF82307078C
	for <lists+linux-usb@lfdr.de>; Sun,  7 Dec 2025 12:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40ACD2F0C46;
	Sun,  7 Dec 2025 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gbu4CXgc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B481E9906
	for <linux-usb@vger.kernel.org>; Sun,  7 Dec 2025 12:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765111760; cv=none; b=GbElg/S/ORdLPAfRvYbfU9SyNFgLRcc5Zf5MYioRS1cMlCNQFtWDl5LJPr34qt01lscUUEVAuWKR91vphQiCfK49sa6IsHvHixt2F3wpRMSH8EdO+k3Z6Bv7/W+xQnhEt64XuNjkbOHWTkpTJ90cZ3/R2IEo/Dc5KQzEffJIIqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765111760; c=relaxed/simple;
	bh=FX+8sBh0D0k7gtmDN0+MFagdL0M/PD/C6G2dNuAPiNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UDlrJiafV/GcYvPwUvsYfJjxa55YL0CR7eLECzbfS2sOXvwXjTXEL4MQHC8O5SJ/C1tgmxa3iHhU7ONJVfRTnnfQAbVyZ7tQc3aY6g1QyZqx45+3bx7C3wLTp1Z+gdV8s7RkH9dTqz2cRAzCvasPqvoXx/CPHCLj11MYQulnpKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gbu4CXgc; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b75c7cb722aso504627566b.1
        for <linux-usb@vger.kernel.org>; Sun, 07 Dec 2025 04:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765111756; x=1765716556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sgZ0eJYW8otbjQ3WIsasw8sc769o73QNisF0rtObE7A=;
        b=Gbu4CXgcobLbuAj9ck1oFBnQedc7+Bu1PlGolw2LrnP5j/g1qL0lm8Ro5GmL51A+Ax
         mI+bcwIDtXuwyNGAjjblpNM8i+MMRcdY/eip8V0vJQ4yVLOHOGoLz/vgi/p+tMmjS2MH
         CXfwEwFk16FU/pbYhkdnItRwUILjMyOzj3Qp2QY5wYeLmiTWh1SnmegIsPt76e2Bj5Gt
         RIr91OW/2MvKAO1gTWvwi4R9C4ygUBY0Bn/J7Rkg5qL/kc63fqq/FcznDbDZA/HDzPae
         C+9C+r5bsDHw57IAMrRiqaLSVZrbUwXcw9mNh0P0h48SAkrNkL2vqnMVqf3fEwzKgJ5A
         KXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765111756; x=1765716556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgZ0eJYW8otbjQ3WIsasw8sc769o73QNisF0rtObE7A=;
        b=nCac0RXvHm714uTw+4obEBur7JUsIP9n4oY49jgjeHsCtklVvl4gnzekt/lJQci8JD
         euvQvB2kjSJPIjOyLPc/lA3THNF035jDwgqixq6Te4JFRnu9OPWfyGoSyHgr6kR8u+rH
         u6TJXj6Gzo2fD/DTZSBXlka+nka4py9jkDzyo4oP9aKFR2+Nk8eqA2efMswWkrGv46QQ
         Y3j4bt+zsav3fWZ9GeTEpnOhUplB6A5v01jsdeHNhpG6nb4jntBsTkHcVJ8HxgOqQMdj
         bpMocqKtCulP1qkqSp4lvJqhJsgQvX4pU123VIF16+80uNS7H/IRf7hL3OuTVnxc8rOA
         o9EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPoP0GBjeLBWGiwH699FROUZSWU5LTZ+KN1y/JB0DFJ376o8MGIIPuMKP5JNL+6pD0SiG/e7yo/X4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY5XGe+I3OTP0riGcqO1DuxYF5/wekjd9GdIZYtwvLgs80ARtA
	8JEbv28yT//ShxWv2734wYdXQ2DcuSiwyF3W6/3amZJqJfpfAa2HO0YtYVRyNw==
X-Gm-Gg: ASbGncv7446kxMsfxdQ4CjPtVVP78NEtTCNYqmZJ9ReIwl6y4aFfAM+2OPeoIu2PjpC
	HyCI5SloA+somv2H0KNXE5VkgH5Xo0lYhFeGbLADmd7C3tZQxFoDyrwEYgNN9WHFWBhARL2LGu4
	/+JHZx1pnjVodzMoisx8coA8SepCOnHvrTlzvE2TrOmon+OSRaglHyxqvz+DTg4MQNEaaGQ1wUx
	+JO96AMAaTVoVo/MzJ2WBTndgWBDcwEMS8CPE4cqMbgfDkFWGB0sCHOHS1AMVQqEi56cfQRRH0K
	Mp7TpM97/+2qKl7EOBogL0rW29hEaO8UfLK7NJyd9aAxyfUF2NgCukmOgozx5f9QDW4mxUNLb3F
	KqhkX9mKDYFkqnxaIqAHU9X7lUuFMdUNu12IVTgwO+CjlhqCRQN4hZwurTDPuvFULxC9Avcc+St
	nEBs4HwzCu2PMeAdAJdONqPBv/I/VnoI0dKZITFCuS+Q0lc8Z1ooj5MUs9zbrDABTmZJxpz3yLw
	GHSYGA65KOxez3o
X-Google-Smtp-Source: AGHT+IHeMd1I7UftN9k36AnFkP3iiSo/Kt50+PZXp0E67sjZ/8vadRt+vTTWVoCd6F9E/0ysGllf/A==
X-Received: by 2002:a17:907:96a6:b0:b72:91bc:9b35 with SMTP id a640c23a62f3a-b7a244e42e4mr487088166b.39.1765111755733;
        Sun, 07 Dec 2025 04:49:15 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f445967fsm848078366b.10.2025.12.07.04.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 04:49:15 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] usb: host: Drop resume calls on {e,o}hci_platform_suspend()
Date: Sun,  7 Dec 2025 12:47:25 +0000
Message-ID: <20251207124742.96526-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

As per the suspend_devices_and_enter() [1], if .suspend() fails, it invoke
the .resume() callback. This patch series drops redundant resume() from
{e,o}hci_platform_suspend()

[1]
https://elixir.bootlin.com/linux/v6.18-rc7/source/kernel/power/suspend.c#L519

Biju Das (2):
  usb: host: ehci-platform: Drop ehci_resume from
    ehci_platform_suspend()
  usb: host: ohci-platform: Drop ohci_resume from
    ohci_platform_suspend()

 drivers/usb/host/ehci-platform.c | 13 +------------
 drivers/usb/host/ohci-platform.c | 10 +---------
 2 files changed, 2 insertions(+), 21 deletions(-)

-- 
2.43.0


