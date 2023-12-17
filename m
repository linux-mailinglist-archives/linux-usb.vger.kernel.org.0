Return-Path: <linux-usb+bounces-4286-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B6081605D
	for <lists+linux-usb@lfdr.de>; Sun, 17 Dec 2023 17:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 156F71C20C0A
	for <lists+linux-usb@lfdr.de>; Sun, 17 Dec 2023 16:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E5845BE4;
	Sun, 17 Dec 2023 16:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnUObcT1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65FE44C86
	for <linux-usb@vger.kernel.org>; Sun, 17 Dec 2023 16:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-54f4f7d082cso2680174a12.0
        for <linux-usb@vger.kernel.org>; Sun, 17 Dec 2023 08:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702830086; x=1703434886; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=65pEQBhIgvIAx7DA5Qrtu8TQ1HIPjToe6CQ2uJsQhgk=;
        b=bnUObcT1ICLb6m1HjbEYsYSNmUdA4EWmC1E/FYHgD7Lu2SptVztYUfHNG8mq2Fe/zG
         J17MT3NnjW0V86LXA/+XYx8wmVDiRr+bH281E0fn07lmyJslCHVr3kkG1Y36SSfeQJUt
         oF5oEMvEtNS372i9MAh3BBcOo7M8P2OGdfCzfuKK8IVNx9z9ffGXZ2DNjhXvicn8YrWx
         nAW180WK2LnoeN7V1N5UXX4bbSK2kbQe54ec3NAu8Ffg12PCMtvw4noDqDIbcPpIqeto
         bEbAmc6fQ+F56Cs/eySSsFeXP1Ep+mwtTGyukgrKack6iJdTc2C8C7Ke3suVkU9kKDGo
         6eOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702830086; x=1703434886;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=65pEQBhIgvIAx7DA5Qrtu8TQ1HIPjToe6CQ2uJsQhgk=;
        b=Eukq4rBu0x6gkyltp6Sfw0QIG0wEMRyJjKTSV72IvFb48FOI61uB6+IrO9z4RhsCc7
         D7MkSFgyR8X2yHPGGJlh260AgOkv0rTAD7/R6/liQb1k+8WNSwEO/X4Bknqaypo38N4j
         IPSBFfM5H6vPEFYJMN8KYAgC0kuhzXIyjqXXScC/dvLjusfekOpTpL9Yh7tNDzuNOyEs
         yNz0oPXXmjvnc16HgK0Bycll0rgX2Bow7FCe08HMbW+owPCU6aR0FOZUPMBF3p7ieEV/
         Acix6p3f3a32jqeGP/kY2/RkWPdGDc6Gj3lzvSd5i3oYxQKaeadF5Y9dWEzGjeQf2v6k
         wlBg==
X-Gm-Message-State: AOJu0YzX05vtvFRhkmbuzs+wdc7qmtdmDgOE7TYhrZ0TyCqvqJnOvWaM
	4Zi31/O6qXypzZjFcnGsWqY7nlIdVOLzuJcVuXR7GeqROuE=
X-Google-Smtp-Source: AGHT+IGG7TsjOD+2mStM54XVB/tSRPqjymO0tI9h6JJqvGrrqPEFPGTBKrunnur36SJJDgWJNwYhDY3NhtBKxvU3/3k=
X-Received: by 2002:a50:a412:0:b0:550:e014:5254 with SMTP id
 u18-20020a50a412000000b00550e0145254mr8651723edb.27.1702830085998; Sun, 17
 Dec 2023 08:21:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Date: Sun, 17 Dec 2023 17:21:14 +0100
Message-ID: <CADS+iDWFVZp81Ck48wQjzh--n_7Z-bV2u0SR4Z6-OZOMBLeMKw@mail.gmail.com>
Subject: type-c subsystem is empty on Thinkpad T14 Gen 4 AMD
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello! I recently bought Thinkpad T14 Gen 4 AMD laptop, and I
installed Gentoo on it, with kernel 6.6.4.

Even though type-c ports seems to be working (I checked usb3 flash
stick, lenovo charger, Jabra headset, Yubikey), I cannot see any
devices in /sys/class/(typec,typec_mux,usb_power_delivery).

There are no messages in dmesg at all, mentioning typec. I can see
that modules typec_ucsi, ucsi_acpi, thunderbolt are loaded. I can see
that device TYPEC000 is present on acpi bus, there are files in
/sys/bus/acpi/devices/USBC000:00, but, there is no driver linked in
it.

I tried to recompile module ucsi_acpi, with adding { "USBC000", 0 }
to ucsi_acpi_match, but it did not change anything (except that in
modinfo of this module, USBC000 is now seen.

I tried to decompile SSDT1 table, which has definition of USBC, but
there is nothing in it, which is supicious.

What else can I check, to understand, why can't I see anything in
typec/PD subsystems?

