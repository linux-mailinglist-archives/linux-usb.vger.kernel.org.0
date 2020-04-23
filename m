Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD2E1B5C65
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2020 15:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgDWNVE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 09:21:04 -0400
Received: from mga07.intel.com ([134.134.136.100]:16372 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726753AbgDWNVD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Apr 2020 09:21:03 -0400
IronPort-SDR: f50xU05jhT7BfdlyQVgzTbZXsMUIuhf5Ik5RGB55fSurRjqrN2zk3E3Y2w9/OXuRIyhRuHgtLN
 h+MExhwh9VxQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 06:21:03 -0700
IronPort-SDR: OOjnu8DxnBTJOuIcuqjZYg5D9j6TGFcHecCry3CQDBPvNopaZAd7JnjMVplWGPF04+MqQ1uIpW
 QXmmEhKnu2vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; 
   d="scan'208";a="366001006"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 23 Apr 2020 06:20:59 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, "K V, Abhilash" <abhilash.k.v@intel.com>
Subject: [PATCH 0/6] ucsi driver changes for v5.8
Date:   Thu, 23 Apr 2020 16:20:52 +0300
Message-Id: <20200423132058.6972-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Here are the ucsi driver changes I've collected so far. On top of the
usual driver improvements, there is a patch from Abhilash where a USB
type power supply (so the power supply class) is registered for each
port.

Let me know if you want me to change anything.

thanks,

K V, Abhilash (5):
  usb: typec: ucsi: Workaround for missed op_mode change
  usb: typec: ucsi: replace magic numbers
  usb: typec: ucsi: Correct bit-mask for CCI
  usb: typec: ucsi: save power data objects in PD mode
  usb: typec: ucsi: register with power_supply class

Mayank Rana (1):
  usb: typec: ucsi: set USB data role when partner type is power
    cable/ufp

 drivers/usb/typec/ucsi/Makefile |   4 +
 drivers/usb/typec/ucsi/psy.c    | 241 ++++++++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/trace.c  |  10 +-
 drivers/usb/typec/ucsi/ucsi.c   |  41 +++++-
 drivers/usb/typec/ucsi/ucsi.h   |  26 +++-
 5 files changed, 315 insertions(+), 7 deletions(-)
 create mode 100644 drivers/usb/typec/ucsi/psy.c

-- 
2.26.1

