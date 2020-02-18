Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCC616261B
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 13:29:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgBRM3E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 07:29:04 -0500
Received: from mga04.intel.com ([192.55.52.120]:53843 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726338AbgBRM3E (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Feb 2020 07:29:04 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2020 04:29:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; 
   d="scan'208";a="348688599"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 18 Feb 2020 04:29:01 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 18 Feb 2020 14:29:00 +0200
Date:   Tue, 18 Feb 2020 14:29:00 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 fix for v5.6-rc3
Message-ID: <20200218122900.GC2667@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-fix-for-v5.6-rc3

for you to fetch changes up to da0f3e0201b87ee4bbd2175925dd57e1228c35fb:

  MAINTAINERS: Sort entries in database for THUNDERBOLT (2020-02-11 17:21:15 +0300)

----------------------------------------------------------------
thunderbolt: Fix for v5.6-rc3

Single fix that orders the THUNDERBOLT MAINTAINERS record according to
parse-maintainers.pl.

----------------------------------------------------------------
Andy Shevchenko (1):
      MAINTAINERS: Sort entries in database for THUNDERBOLT

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
