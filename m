Return-Path: <linux-usb+bounces-614-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A35987AF5B1
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 23:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 9C587283484
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 21:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D6F4A541;
	Tue, 26 Sep 2023 21:28:58 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF7D499A3
	for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 21:28:56 +0000 (UTC)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28616A25F
	for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 14:28:55 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-690f7d73a3aso8732808b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 14:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695763734; x=1696368534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tM+w7SwTcJ/9TuivXGr7nl0JVKRgfVjBaqMkj1+Pw2s=;
        b=BFut5ZpGawswGr6AbMRMd8xkZcGjwSkUzW9siE+rk70jOS5UQB9e2S40V9rU13nCax
         wSxLelaun3edKvlV6a9poRCYisyk3h79yfUgxa6TEUP3NM7/6u4qe5oU7i6HGCbg0zot
         vZbgHAZwGTR5qOt9nwkiqPhok2iMtN5/SBZmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695763734; x=1696368534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tM+w7SwTcJ/9TuivXGr7nl0JVKRgfVjBaqMkj1+Pw2s=;
        b=khRJm7+OaH2gRHX1lYbwTaIp+nYfstMIuxnsla9ITxhtmu8nvvZfBZ6jS0mcJVR8nI
         0JosVLPjh2imC/odxfClOgexvLcz6JksGawvbOfuwh1lk33675g63qx+lCcdtWascjY8
         tltNVreEc4SE13/s3VOuPveWF+Kn6g1mcDNSa/Ar3Qw5Oo9beRHOEANZU+7DKsQYLt2R
         xxeE+QE5a0YE2KHAooI1rzYdK1D3o16nf/gk7vq6LFCaCaxRy8F3+sRJbdx5PwrKsuld
         4sSbKdz021+1wl20bM5JbQWDpZNt2xysNuj1qv75ixSuVwumwA1TSql+5kcSpxX7FeCI
         t/og==
X-Gm-Message-State: AOJu0Yy8pDYP4L8oIQTvzLJDuvqd/OeK7dIg5es442X9sKU9FdKjjEtv
	Vk2w7bnSEK7PSOkCGMbj6AVjGQ==
X-Google-Smtp-Source: AGHT+IFg/VWvQtSOis29D/COSilSeZuwA9ac2iVmLkvtEV2cLcnBvdR30qN03c8KVE9VJv8AcgAUxQ==
X-Received: by 2002:a05:6a20:428e:b0:13a:43e8:3fb5 with SMTP id o14-20020a056a20428e00b0013a43e83fb5mr69140pzj.51.1695763734547;
        Tue, 26 Sep 2023 14:28:54 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:f39:c3f2:a3b:4fcd])
        by smtp.gmail.com with ESMTPSA id f15-20020aa78b0f000000b0068fece2c190sm10337251pfd.70.2023.09.26.14.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 14:28:53 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>,
	Hayes Wang <hayeswang@realtek.com>,
	"David S . Miller" <davem@davemloft.net>
Cc: linux-usb@vger.kernel.org,
	Grant Grundler <grundler@chromium.org>,
	Edward Hill <ecgh@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	andre.przywara@arm.com,
	anton@polit.no,
	bjorn@mork.no,
	edumazet@google.com,
	gaul@gaul.org,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com
Subject: [PATCH 0/3] r8152: Avoid writing garbage to the adapter's registers
Date: Tue, 26 Sep 2023 14:27:25 -0700
Message-ID: <20230926212824.1512665-1-dianders@chromium.org>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This 3-patch series is the result of a cooperative debug effort
between Realtek and the ChromeOS team. On ChromeOS, we've noticed that
Realtek Ethernet adapters can sometimes get so wedged that even a
reboot of the host can't get them to enumerate again, assuming that
the adapter was on a powered hub and din't lose power when the host
rebooted. This is sometimes seen in the ChromeOS automated testing
lab. The only way to recover adapters in this state is to manually
power cycle them.

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


Douglas Anderson (3):
  r8152: Increase USB control msg timeout to 5000ms as per spec
  r8152: Retry register reads/writes
  r8152: Block future register access if register access fails

 drivers/net/usb/r8152.c | 124 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 115 insertions(+), 9 deletions(-)

-- 
2.42.0.515.g380fc7ccd1-goog


