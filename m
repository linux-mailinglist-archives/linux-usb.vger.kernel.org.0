Return-Path: <linux-usb+bounces-3577-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D23F8012C6
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 19:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEE2A1C20FF0
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 18:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF23051014;
	Fri,  1 Dec 2023 18:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bxgEyueO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3187E129
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 10:31:30 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6cddb35ef8bso2316795b3a.2
        for <linux-usb@vger.kernel.org>; Fri, 01 Dec 2023 10:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701455489; x=1702060289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ga3+iKjA62Fa6KbPgroTk3zWELzaacYSZ02Ed8CuNZM=;
        b=bxgEyueOZAnQphyhoXq+kHAIBv2uqcFALaBHS/qh6qysSt6be1qSPaD7prM/eJnSw7
         +Ikv09MrPqjYMD+N+zuij8PWmZW0fstyim34jalRP1o8OAc5eV0T0sdmZzHu5hAQw2Rm
         xHPF539GQrw49LYIdIlm9h49bc0lOHqBjAOs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701455489; x=1702060289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ga3+iKjA62Fa6KbPgroTk3zWELzaacYSZ02Ed8CuNZM=;
        b=NX9+FW3ZfwFRKRMQ1wKJye0B1eQbscwe8veRjrM2oWiUrEPiy5V4Z075GZ1Onbr9z6
         bDRjB1ghkygJYGZznRVM0edi+xjlIytNO3Cw+KQqeYpyknC0gru2+LyvBHjIVpBiiQGB
         hLh9dHS25cVW5yBwCIdIYfbVCxLVIT+awQdMuBkUN6pt1r/+zLpQ2Zc2XuzkIvjbOxbJ
         DmLuXtj1Z7AjHvW7xkyI1116QDc4klz0gflkfVRG7V9SLqy47uAwBfp93SsuncAHc3aw
         hBdz0jpch/T3u8XA/ILenZCkvSxZuMJyDobxeQkNtfyg2C/9AFEpI8mi76k7IYjTPL3F
         6zHQ==
X-Gm-Message-State: AOJu0YzI1n/6a4esqAmM0xf17lU8brxh003YmRiJbmKVNcuuFKjcpfcF
	0hpkiZur8Uf9ex4ROpcS4RWvxxalmoV9tIrBghRJA4zj
X-Google-Smtp-Source: AGHT+IHbE+wbfalZufbhJj+tBtKr6YsDYezEXtezfVLD2wtXqSnvF5LqZTRKvLOu6DAzM7mOVEHhuw==
X-Received: by 2002:a05:6a00:1f0a:b0:6cb:63cb:83c0 with SMTP id be10-20020a056a001f0a00b006cb63cb83c0mr29667323pfb.29.1701455488688;
        Fri, 01 Dec 2023 10:31:28 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:11eb:92ac:94e:c791])
        by smtp.gmail.com with ESMTPSA id g11-20020a056a00078b00b006cdda10bdafsm3306926pfu.183.2023.12.01.10.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 10:31:28 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Grant Grundler <grundler@chromium.org>,
	Hayes Wang <hayeswang@realtek.com>,
	Simon Horman <horms@kernel.org>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	netdev@vger.kernel.org,
	Brian Geffon <bgeffon@google.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Douglas Anderson <dianders@chromium.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] net: usb: r8152: Fix lost config across deauthorize+authorize
Date: Fri,  1 Dec 2023 10:29:49 -0800
Message-ID: <20231201183113.343256-1-dianders@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


This series fixes problems introduced by commit ec51fbd1b8a2 ("r8152:
add USB device driver for config selection") where the r8152 device
would stop functioning if you deauthorized it (by writing 0 to the
"authorized" field in sysfs) and then reauthorized it (by writing a
1).

In v1 this was just a single patch [1], but it's now a 3-patch series
and solves the problem in a much cleaner way, as suggested by Alan
Stern.

Since these three patches straddle the USB subsystem and the
networking subsystem then maintainers will (obviously) need to work
out a way for them to land. I don't have any strong suggestions here
so I'm happy to let the maintainers propose what they think will work
best.

[1] https://lore.kernel.org/r/20231130154337.1.Ie00e07f07f87149c9ce0b27ae4e26991d307e14b@changeid

Changes in v2:
- ("Don't force USB generic_subclass drivers to define ...") new for v2.
- ("Allow subclassed USB drivers to override ...") new for v2.
- ("Choose our USB config with choose_configuration()...) new for v2.

Douglas Anderson (3):
  usb: core: Don't force USB generic_subclass drivers to define probe()
  usb: core: Allow subclassed USB drivers to override
    usb_choose_configuration()
  r8152: Choose our USB config with choose_configuration() rather than
    probe()

 drivers/net/usb/r8152.c    | 16 +++++-----------
 drivers/usb/core/driver.c  |  5 ++++-
 drivers/usb/core/generic.c |  7 +++++++
 include/linux/usb.h        |  6 ++++++
 4 files changed, 22 insertions(+), 12 deletions(-)

-- 
2.43.0.rc2.451.g8631bc7472-goog


