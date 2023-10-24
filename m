Return-Path: <linux-usb+bounces-2152-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EECCC7D5D02
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 23:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CCD8B21147
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 21:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185BF3F4B4;
	Tue, 24 Oct 2023 21:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ka/ZKhFp"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD401D692;
	Tue, 24 Oct 2023 21:18:26 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C23BD10CF;
	Tue, 24 Oct 2023 14:18:24 -0700 (PDT)
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E8CF66607333;
	Tue, 24 Oct 2023 22:18:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698182303;
	bh=YRq5099l8oQL4Fdgmj24/WWMHCqsGt/HPtK1ssRTRao=;
	h=From:To:Cc:Subject:Date:From;
	b=ka/ZKhFp5M0+/HZbpCsb/pNnyzTib5pwvFEwqEMBcLpZKQeZl3X5l65mXPgALnchS
	 VNbg51Rugu1nhqbFGtYnMItn2Ejb7TtMvzMF2QflQezH3EN7NYYkYtsbBOY+8fSa9t
	 0nI1rqJNFcb3KDmnaBjK+3XaTkoHpOdKjlf3QguMmTba+Tnv8p+isVAZNP/kWI4n1V
	 t6fYkZQTThb+ISVq44KhCtxSKW9v5UIMLtgAYRsk7xlS03QUdMOQQ929+W+yAY5/Te
	 7Wnn4TVona2qfx9AlnFmBPk+MXH9BnhPe0DCKIWV3znm5faqxttQ8Q62xOkO+AmUp0
	 2MGixT6kVYbjg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	linux-kselftest@vger.kernel.org,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] Add test to verify probe of devices from discoverable busses on DT platforms
Date: Tue, 24 Oct 2023 17:17:58 -0400
Message-ID: <20231024211818.365844-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


This is part of an effort to improve detection of regressions impacting
device probe on all platforms. The recently merged DT kselftest [1]
detects probe issues for all devices described statically in the DT.
That leaves out devices discovered at run-time from discoverable busses.

This is where this test comes in. All of the devices that are connected
through discoverable busses (ie USB and PCI), and which are internal and
therefore always present, can be described in a per-platform file so
they can be checked for. The test will check that the device has been
instantiated and bound to a driver.

Patch 1 introduces the test. Patch 2 adds the test definitions for the
google,spherion machine (Acer Chromebook 514) as an example.

This is the sample output from the test running on Spherion:

TAP version 13
 Using board file:  boards/google,spherion
1..10
ok 1 usb.camera.0.device
ok 2 usb.camera.0.driver
ok 3 usb.camera.1.device
ok 4 usb.camera.1.driver
ok 5 usb.bluetooth.0.device
ok 6 usb.bluetooth.0.driver
ok 7 usb.bluetooth.1.device
ok 8 usb.bluetooth.1.driver
ok 9 pci.wifi.device
ok 10 pci.wifi.driver
 Totals: pass:10 fail:0 xfail:0 xpass:0 skip:0 error:0

[1] https://lore.kernel.org/all/20230828211424.2964562-1-nfraprado@collabora.com/


Nícolas F. R. A. Prado (2):
  kselftest: Add test to verify probe of devices from discoverable
    busses
  kselftest: devices: Add board file for google,spherion

 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/devices/.gitignore    |   1 +
 tools/testing/selftests/devices/Makefile      |   8 +
 .../selftests/devices/boards/google,spherion  |   3 +
 .../devices/test_discoverable_devices.sh      | 165 ++++++++++++++++++
 5 files changed, 178 insertions(+)
 create mode 100644 tools/testing/selftests/devices/.gitignore
 create mode 100644 tools/testing/selftests/devices/Makefile
 create mode 100644 tools/testing/selftests/devices/boards/google,spherion
 create mode 100755 tools/testing/selftests/devices/test_discoverable_devices.sh

-- 
2.42.0


