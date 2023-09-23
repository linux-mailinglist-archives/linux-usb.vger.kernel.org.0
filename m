Return-Path: <linux-usb+bounces-537-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9717AC4F6
	for <lists+linux-usb@lfdr.de>; Sat, 23 Sep 2023 21:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 03DBF282597
	for <lists+linux-usb@lfdr.de>; Sat, 23 Sep 2023 19:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FE421369;
	Sat, 23 Sep 2023 19:49:31 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C94A21354
	for <linux-usb@vger.kernel.org>; Sat, 23 Sep 2023 19:49:30 +0000 (UTC)
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDFD319A;
	Sat, 23 Sep 2023 12:49:27 -0700 (PDT)
Received: from remote.user (localhost [127.0.0.1])
	by rere.qmqm.pl (Postfix) with ESMTPSA id 4RtKJx541CzR;
	Sat, 23 Sep 2023 21:41:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1695498115; bh=wp7EybNqxZPuaJseGNWMLajq/4TvZRIK+t8tPGl8NZA=;
	h=Date:Subject:From:To:Cc:From;
	b=qHzeJWgh89lusdHb6R07h2qNXYUd9Iuyp66mt4Cj0StxChiPqC8Qy9fWpFV2F5Fgk
	 G4GvlYrDbAaLyPq5J8gSVp/KybCxPRin8N49PROEFNY31RvN+H5MOMUXldP0bWx2vo
	 Px04kK3LJgU9vRDbBA8u8lm5KfFGlhYnzaEYnaTNpOQnOSrKerwmucLLciqwDRttXy
	 o7g4Fmnawa5/kRbCNb+3SIz0wZowYAkcF7Lq8YEPvUKXrA+94OCQ+RN5YPJJjHmQZ4
	 aW3SupWSgqL+8NB1YAEWpqpa5G3yS1PJDuPHaBN5nW+3w6tpK4ZWsjH2EWuSp2GCTl
	 /o3aJ/KDB/bzA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.8 at mail
Date: Sat, 23 Sep 2023 21:41:52 +0200
Message-Id: <cover.1695497666.git.mirq-linux@rere.qmqm.pl>
Subject: [PATCH 0/3] usb: chipidea: Tegra USB DMA fix + cleanups
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From:	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
To:	Dmitry Osipenko <digetx@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter Chen <peter.chen@kernel.org>,
	Peter Geis <pgwipeout@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Cc:	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This series contains a fix for a DMA buffer overflow in Tegra USB driver
followed by a cleanup of the DMA bounce buffer code and another cleanup
to make probe() consistently use dev_err_probe() for error printk()s.

Michał Mirosław (3):
  usb: chipidea: Fix DMA overwrite for Tegra
  usb: chipidea: Simplify Tegra DMA alignment code
  usb: chipidea: tegra: Consistently use dev_err_probe()

 drivers/usb/chipidea/ci_hdrc_tegra.c | 16 ++++------
 drivers/usb/chipidea/host.c          | 48 ++++++++++++----------------
 2 files changed, 27 insertions(+), 37 deletions(-)

-- 
2.39.2


