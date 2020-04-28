Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C561BB987
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 11:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgD1JKA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 05:10:00 -0400
Received: from mga18.intel.com ([134.134.136.126]:43554 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726271AbgD1JKA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Apr 2020 05:10:00 -0400
IronPort-SDR: i9A/KpjnXIiQaP62GqONaTtpPcVDrkYeR9X4CEEWj4j1HTs6cyh2ViSLAYOEU2rG/5Imj/kXYZ
 kJU+tngYZluw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2020 02:10:00 -0700
IronPort-SDR: PLqDA7DYusmb+EvvBiPQ0WcTPWJy9wId9IrB8M4nwfM3V8KzhDKPquFjhierqVxb098Ne/WoDa
 6fpgJYXVi4/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,327,1583222400"; 
   d="scan'208";a="367444997"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 28 Apr 2020 02:09:57 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 28 Apr 2020 12:09:56 +0300
Date:   Tue, 28 Apr 2020 12:09:56 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 fix for v5.7-rc4
Message-ID: <20200428090956.GR487496@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit ae83d0b416db002fe95601e7f97f64b59514d936:

  Linux 5.7-rc2 (2020-04-19 14:35:30 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-fix-for-v5.7-rc4

for you to fetch changes up to 9d2214b14103594efdbf33018b893b9417846d42:

  thunderbolt: Check return value of tb_sw_read() in usb4_switch_op() (2020-04-20 11:54:19 +0300)

----------------------------------------------------------------
thunderbolt: Fix for v5.7-rc4

- Fix checking return value of tb_sw_read() in usb4_switch_op().

----------------------------------------------------------------
Mika Westerberg (1):
      thunderbolt: Check return value of tb_sw_read() in usb4_switch_op()

 drivers/thunderbolt/usb4.c | 3 +++
 1 file changed, 3 insertions(+)
