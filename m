Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 477E51D31A8
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 15:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbgENNqi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 09:46:38 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:62113 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgENNqi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 09:46:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589463999; x=1620999999;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=66jlXt28CE6ScMvqdgsfrIxpJQ4UbAilL8dvmhWUcpQ=;
  b=cIRqsGrqoZXa1T1OadmGAvuuzENlizl76QfFlcN/eReQpeROTTLfGbYX
   Vvdp0mJX5ejOP7Sj/eUvfBHws0n+Xa/qghrcjO6g+m1/F3Bpk8cEwVg8V
   NINtvJxUCMTbIBYSZwXLAJqENabSbKhptzWNY7mQu/t+c8UY3du976/9C
   wJAgc6nkg6/4KH0A4hx/fI/e1blfQtggaSlGRc7SDpWuHCwinRTPguEUF
   vq5zG+g9aMmNFZhvMcbYLHcChiarAe4Uy3U1v10VKdCUXJp185D3x9ak8
   KqUTUqJ88CuCqr/Wuok7JnagAHNlUvTsGDRGrfF520B35SvVNHnAki9IZ
   Q==;
IronPort-SDR: vvxCgUCCTC3ENzVJrDlcZMAgT3gAnY/Wqe6+UfEIvBcrvXyLGeU68Out0GmQEZkyTvH9yS8oJy
 ndCOzN5wQaoV5DZgZyBqvOfd2eb4SxkmGoE4kSP4ZksyxteEtZPVFHXBnff7UhyWn484r8HOQN
 9+78jguvsgMdnKezLtNsaaNCjy+A2g/0ZIZFLoLm+ezQBqHZZCIdX54tkGEH8ibkIOib9N/rNv
 0UIuuMCbV+0+0DNgC5fPkmXVS4CXHqwrR1VlsTi7zvDFJfXIF7No0gbi60Cgf8p5ehyqoOfP3/
 wqA=
X-IronPort-AV: E=Sophos;i="5.73,391,1583218800"; 
   d="scan'208";a="75894420"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 May 2020 06:46:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 May 2020 06:46:36 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 14 May 2020 06:46:35 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH 0/7] staging: most: usb: fix issues found in code audit
Date:   Thu, 14 May 2020 15:46:22 +0200
Message-ID: <1589463989-30029-1-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series fixes the comments/findings on the previously submitted code
of the USB adapter driver. The fixes should be applied in staging before
moving the driver out as one patch.

Christian Gromm (7):
  staging: most: usb: use dev_*() functions to print messages
  staging: most: usb: remove reference to USB error codes
  staging: most: usb: check number of reported endpoints
  staging: most: usb: use dev_dbg function
  staging: most: fix typo in Kconfig
  staging: most: usb: use macro ATTRIBUTE_GROUPS
  Documentation: ABI: correct sysfs attribute description of MOST driver

 Documentation/ABI/testing/sysfs-bus-most | 104 ++++++++++++++++---------------
 drivers/staging/most/usb/Kconfig         |   2 +-
 drivers/staging/most/usb/usb.c           |  46 ++++++--------
 3 files changed, 72 insertions(+), 80 deletions(-)

-- 
2.7.4

