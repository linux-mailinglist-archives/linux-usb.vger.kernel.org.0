Return-Path: <linux-usb+bounces-724-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA5F7B2715
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 23:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id ECFB8282F98
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 21:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3840E15484;
	Thu, 28 Sep 2023 21:06:15 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397541FAE
	for <linux-usb@vger.kernel.org>; Thu, 28 Sep 2023 21:06:13 +0000 (UTC)
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09CB51B4;
	Thu, 28 Sep 2023 14:06:06 -0700 (PDT)
Received: from remote.user (localhost [127.0.0.1])
	by rere.qmqm.pl (Postfix) with ESMTPSA id 4RxQxl0yqczBf;
	Thu, 28 Sep 2023 23:06:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1695935163; bh=55XpWhNKMX1xJec8+ShthJVwuaVBpCPUQ0HDAw6jCkg=;
	h=Date:Subject:From:To:Cc:From;
	b=WA3voBpiNjLNFqPEg2TF9J2XkWbjHG91hI2h8oawyNxRVzVQHuWCtnAh18TuDyso6
	 W0xy4zUUtbnGN+xUQG6ywnK1cewkRa7DcvWpGOLcXDLiGJ9L+pkAvyRK/xVduw/YiE
	 oNqOMmXUAjg8LWAQFPVcxsXXpOg8NWTY2PD4PAUkajg/yk/EfHBne2vhZ4/0N/6Iql
	 /8osQLy72ReWUk+rGMwD7ye/tjPkD8UvwTO5sX9XRgw1ZT3bf3rkB5OKhLsWZ2N/to
	 m0BW11VrJd7GRkpGfAEdPnZKYkAj4w39kHZAvjL4Wpey6xbtDIkQ5qwuxz8Ei7S3JI
	 Zv1wprVlqaNfA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.10 at mail
Date: Thu, 28 Sep 2023 23:06:02 +0200
Message-Id: <cover.1695934946.git.mirq-linux@rere.qmqm.pl>
Subject: [PATCH v2 0/3] usb: chipidea: An USB DMA fix + cleanups for Tegra
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
	Peter Chen <peter.chen@kernel.org>,
	Peter Geis <pgwipeout@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Cc:	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This series contains a fix for a DMA buffer overflow in Tegra USB driver
followed by a cleanup of the DMA bounce buffer code and another cleanup
to make probe() consistently use dev_err_probe() for error printk()s.

v2: reworded the commit message in patch #1

Michał Mirosław (3):
  usb: chipidea: Fix DMA overwrite for Tegra
  usb: chipidea: Simplify Tegra DMA alignment code
  usb: chipidea: tegra: Consistently use dev_err_probe()

 drivers/usb/chipidea/ci_hdrc_tegra.c | 16 ++++------
 drivers/usb/chipidea/host.c          | 48 ++++++++++++----------------
 2 files changed, 27 insertions(+), 37 deletions(-)

-- 
2.39.2


