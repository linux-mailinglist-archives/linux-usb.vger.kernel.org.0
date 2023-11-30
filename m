Return-Path: <linux-usb+bounces-3488-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2BF7FED5A
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 11:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CAC2B20E09
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 10:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893B23B2BC;
	Thu, 30 Nov 2023 10:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uIwEt2th"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075B6249EC
	for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 10:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8010C433C7;
	Thu, 30 Nov 2023 10:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701341711;
	bh=t6ZounqBO6HxEEGhrx3bS0Kz+fsk66UnnVgdvGFbMgU=;
	h=From:To:Cc:Subject:Date:From;
	b=uIwEt2thI+cpFCjgvxCmTh0I+RHe1DAlDyR7sQIyySRC3eQ7seybZ9FDEU/WyLKV4
	 RvvlsDbSGrStDvQrb9i10peqBWDwS/BR+Tup7t4nmlnN6kb8QLNzemtMlMXGQySyMC
	 1MxL2tiEio3exkEMbjFJ+AdBNhc9h6dZvhDyqyss1EEG1PomDPGoyn6XBjA7FMJUwt
	 6Ykoc7qr7dpEfTAs06/EaifOSK2bte/TkorWHD/Eiz1LzZkUstwBSHfItRXS92z4+T
	 dm0uY7mGob973aulOk17zadWqJq3898Dq2J5i31TRZXu8eHfI+frDn9+YB3EydpHpU
	 HuwawukDGhC9Q==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Damien Bergamini <damien.bergamini@free.fr>,
	Dmitry Bogdanov <d.bogdanov@yadro.com>,
	Feng-Hsin Chiang <john453@faraday-tech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-usb@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthieu CASTET <castet.matthieu@free.fr>,
	Pawel Laszczak <pawell@cadence.com>,
	Po-Yu Chuang <ratbert.chuang@gmail.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	Yuan-Hsin Chen <yhchen@faraday-tech.com>
Subject: [PATCH 0/5] usb: Replace {v}snprintf() variants with safer alternatives
Date: Thu, 30 Nov 2023 10:54:34 +0000
Message-ID: <20231130105459.3208986-1-lee@kernel.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is part of an effort to rid {v}snprintf() where possible.

For a far better description of the problem than I could author, see
Jon's write-up on LWN [1] and/or Alex's on the Kernel Self Protection
Project [1].

[0] https://lwn.net/Articles/69419/
[1] https://github.com/KSPP/linux/issues/105

Lee Jones (5):
  usb: atm: Remove snprintf() from sysfs call-backs and replace with
    sysfs_emit()
  usb: cdnsp: Replace snprintf() with the safer scnprintf() variant
  usb: fotg210-hcd: Replace snprintf() with the safer scnprintf()
    variant
  usb: gadget: Remove snprintf() from sysfs call-backs and replace with
    sysfs_emit()
  usb: gadget: f_tcm: Remove snprintf() from sysfs call-backs and
    replace with sysfs_emit()

 drivers/usb/atm/ueagle-atm.c        |  16 +-
 drivers/usb/cdns3/cdnsp-debug.h     | 354 ++++++++++++++--------------
 drivers/usb/fotg210/fotg210-hcd.c   |  12 +-
 drivers/usb/gadget/configfs.c       |   2 +-
 drivers/usb/gadget/function/f_tcm.c |   4 +-
 5 files changed, 192 insertions(+), 196 deletions(-)

Cc: Damien Bergamini <damien.bergamini@free.fr>
Cc: Dmitry Bogdanov <d.bogdanov@yadro.com>
Cc: Feng-Hsin Chiang <john453@faraday-tech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-usb@vger.kernel.org
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Matthieu CASTET <castet.matthieu@free.fr>
Cc: Pawel Laszczak <pawell@cadence.com>
Cc: Po-Yu Chuang <ratbert.chuang@gmail.com>
Cc: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: Yuan-Hsin Chen <yhchen@faraday-tech.com>

-- 
2.43.0.rc1.413.gea7ed67945-goog


