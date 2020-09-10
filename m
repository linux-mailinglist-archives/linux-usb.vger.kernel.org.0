Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94F55264A46
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 18:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbgIJQtJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 12:49:09 -0400
Received: from mga01.intel.com ([192.55.52.88]:61884 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726980AbgIJQmh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Sep 2020 12:42:37 -0400
IronPort-SDR: K9lxWcW4qOn+WoLF/2hpmokB37jR0S62Lq4tGy0jyKhjqHRTgIYZawO3FKmd/ygAViceL16kzZ
 7H1wbIiVoFng==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="176641204"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; 
   d="scan'208";a="176641204"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2020 09:42:25 -0700
IronPort-SDR: ytMx7cdPDUFmOgbMi9IC7XeUfxZPoBvtg733oVcRGgScZUPVElBlrZr3PN8hS54PLtcrN5jHNE
 aIKTG5iM54sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; 
   d="scan'208";a="407811435"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 10 Sep 2020 09:42:21 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 10 Sep 2020 19:42:20 +0300
Date:   Thu, 10 Sep 2020 19:42:20 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Gil Fine <gil.fine@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: debugfs: Fix uninitialized return in
 counters_write()
Message-ID: <20200910164220.GW2495@lahna.fi.intel.com>
References: <20200910100805.GB79916@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910100805.GB79916@mwanda>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 10, 2020 at 01:08:05PM +0300, Dan Carpenter wrote:
> If the first line is in an invalid format then the "ret" value is
> uninitialized.  We should return -EINVAL instead.
> 
> Fixes: 54e418106c76 ("thunderbolt: Add debugfs interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks!
