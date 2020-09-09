Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80EFF262DA3
	for <lists+linux-usb@lfdr.de>; Wed,  9 Sep 2020 13:06:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727900AbgIILGH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Sep 2020 07:06:07 -0400
Received: from mga09.intel.com ([134.134.136.24]:16261 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727055AbgIILGF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Sep 2020 07:06:05 -0400
IronPort-SDR: shBDzQqZ6W856tpYBwr2aadS3FEx75sDUI47JBfIVA6K7ae+V0ia4mss3BJatoI1cXkh9Zzj11
 BHojP1F0VWpA==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="159270009"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="159270009"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 04:06:04 -0700
IronPort-SDR: lhDXH/mngJhZRR8kaUa3pxUG9twjyH07qa3wTcUhaX4j1us9TXGAw0I3duDdaH7+ys5KvRRmwK
 34oQEhYonBjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="407416692"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 09 Sep 2020 04:06:01 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 09 Sep 2020 14:06:00 +0300
Date:   Wed, 9 Sep 2020 14:06:00 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH] thunderbolt: Retry DROM read once if parsing fails
Message-ID: <20200909110600.GN2495@lahna.fi.intel.com>
References: <20200907110340.71031-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907110340.71031-1-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 07, 2020 at 02:03:40PM +0300, Mika Westerberg wrote:
> Kai-Heng reported that sometimes DROM parsing of ASUS PA27AC Thunderbolt 3
> monitor fails. This makes the driver to fail to add the device so only
> DisplayPort tunneling is functional.
> 
> It is not clear what exactly happens but waiting for 100 ms and retrying
> the read seems to work this around so we do that here.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206493
> Reported-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/fixes.
