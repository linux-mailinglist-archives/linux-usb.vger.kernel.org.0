Return-Path: <linux-usb+bounces-1937-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B217D03BA
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 23:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DD7FB21296
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 21:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669483DFF6;
	Thu, 19 Oct 2023 21:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YrffcQSH"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C113538DF6
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 21:22:06 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C3BA10DF
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 14:21:54 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1cac80292aeso51385ad.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 14:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697750513; x=1698355313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8UYTqG/6/51k2TLUFfCOqmPLkctnDDkEac11ETWHXAA=;
        b=YrffcQSHbfkv3wYDSF1qbiJVDuHrzrAys4OEFHbULpiMWn9WW1blRL7KLyUT+xA95b
         sP3jLTFXmh4ZzqQ4B41h775SEd/eOxLfQTTve+hiUw+JwpXgOQG9SiyT/KobnOFma7jZ
         4Y8ZcJ6O05NMhTmR56DtCLyQAoY6z35vDQGec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697750513; x=1698355313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8UYTqG/6/51k2TLUFfCOqmPLkctnDDkEac11ETWHXAA=;
        b=qrMmF/0XpZ/MvwCdU6xwO3dRvsWrNjLp39/NiVJj0idbGfOYclNgWx416epM961vgx
         oQXsluzWGjTnYtvKw9GNQGWxgjrsMma0wmKYr/z0b+d2bj7G6fAwUL8DLWI6jXjqlx7Z
         Pp0izbpW9J0oLG/fVOsG9wkI/0gAZw1PrLmvvk6xTUMCWnBwKTcSHm07FJ6hyxP/uJDZ
         svTmaehI2b3QyVx7WCmr9p8w6wPaCQw+LzsVXWd6WNgPoCSSVG+XcUd5BV71v1VOv6U+
         2YiFgJ3cphcwuqonybHmSb2bfivwOblT4AalFCljN2C4ZDtGD8gDDvBKCSzQsXRXEJ4c
         vPfg==
X-Gm-Message-State: AOJu0YzC3HoeVk8sWSHQnnWtQN5IcGfKLQXPcIoj+bdJK3jtyL6yh+6U
	JjSRGW8bk4EiD2AqQN/NXTh1Ew==
X-Google-Smtp-Source: AGHT+IHzJlRpUB2nDTKRU0As3Y1nSrMCYGEvG2M7Fp+2hxAvFzahD9zX1yznGS7gMsBiVFN81ofEHA==
X-Received: by 2002:a17:903:27cd:b0:1ca:25e:3c32 with SMTP id km13-20020a17090327cd00b001ca025e3c32mr107647plb.19.1697750512876;
        Thu, 19 Oct 2023 14:21:52 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:a6da:6f08:412:e04b])
        by smtp.gmail.com with ESMTPSA id l2-20020a170902d34200b001bbdd44bbb6sm154100plk.136.2023.10.19.14.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 14:21:52 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>,
	Hayes Wang <hayeswang@realtek.com>,
	"David S . Miller" <davem@davemloft.net>
Cc: Grant Grundler <grundler@chromium.org>,
	Edward Hill <ecgh@chromium.org>,
	linux-usb@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Laura Nao <laura.nao@collabora.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Douglas Anderson <dianders@chromium.org>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v4 0/5] r8152: Avoid writing garbage to the adapter's registers
Date: Thu, 19 Oct 2023 14:20:19 -0700
Message-ID: <20231019212130.3146151-1-dianders@chromium.org>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is the result of a cooperative debug effort between
Realtek and the ChromeOS team. On ChromeOS, we've noticed that Realtek
Ethernet adapters can sometimes get so wedged that even a reboot of
the host can't get them to enumerate again, assuming that the adapter
was on a powered hub and din't lose power when the host rebooted. This
is sometimes seen in the ChromeOS automated testing lab. The only way
to recover adapters in this state is to manually power cycle them.

I managed to reproduce one instance of this wedging (unknown if this
is truly related to what the test lab sees) by doing this:
1. Start a flood ping from a host to the device.
2. Drop the device into kdb.
3. Wait 90 seconds.
4. Resume from kdb (the "g" command).
5. Wait another 45 seconds.

Upon analysis, Realtek realized this was happening:

1. The Linux driver was getting a "Tx timeout" after resuming from kdb
   and then trying to reset itself.
2. As part of the reset, the Linux driver was attempting to do a
   read-modify-write of the adapter's registers.
3. The read would fail (due to a timeout) and the driver pretended
   that the register contained all 0xFFs. See commit f53a7ad18959
   ("r8152: Set memory to all 0xFFs on failed reg reads")
4. The driver would take this value of all 0xFFs, modify it, and
   attempt to write it back to the adapter.
5. By this time the USB channel seemed to recover and thus we'd
   successfully write a value that was mostly 0xFFs to the adpater.
6. The adapter didn't like this and would wedge itself.

Another Engineer also managed to reproduce wedging of the Realtek
Ethernet adpater during a reboot test on an AMD Chromebook. In that
case he was sometimes seeing -EPIPE returned from the control
transfers.

This patch series fixes both issues.

Changes in v4:
- Took out some unnecessary locks/unlocks of the control mutex.
- Added comment about reading version causing probe fail if 3 fails.
- Added text to commit msg about the potential unbind/bind loop.

Changes in v3:
- Fixed v2 changelog ending up in the commit message.
- farmework -> framework in comments.

Changes in v2:
- ("Check for unplug in rtl_phy_patch_request()") new for v2.
- ("Check for unplug in r8153b_ups_en() / r8153c_ups_en()") new for v2.
- ("Rename RTL8152_UNPLUG to RTL8152_INACCESSIBLE") new for v2.
- Reset patch no longer based on retry patch, since that was dropped.
- Reset patch should be robust even if failures happen in probe.
- Switched booleans to bits in the "flags" variable.
- Check for -ENODEV instead of "udev->state == USB_STATE_NOTATTACHED"

Douglas Anderson (5):
  r8152: Increase USB control msg timeout to 5000ms as per spec
  r8152: Check for unplug in rtl_phy_patch_request()
  r8152: Check for unplug in r8153b_ups_en() / r8153c_ups_en()
  r8152: Rename RTL8152_UNPLUG to RTL8152_INACCESSIBLE
  r8152: Block future register access if register access fails

 drivers/net/usb/r8152.c | 269 +++++++++++++++++++++++++++++++---------
 1 file changed, 210 insertions(+), 59 deletions(-)

-- 
2.42.0.758.gaed0368e0e-goog


