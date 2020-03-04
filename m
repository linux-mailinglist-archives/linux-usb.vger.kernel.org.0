Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3E6178D97
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2020 10:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387727AbgCDJie (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Mar 2020 04:38:34 -0500
Received: from mga06.intel.com ([134.134.136.31]:36802 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387714AbgCDJie (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Mar 2020 04:38:34 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Mar 2020 01:38:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,513,1574150400"; 
   d="scan'208";a="352055626"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 04 Mar 2020 01:38:30 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 04 Mar 2020 11:38:29 +0200
Date:   Wed, 4 Mar 2020 11:38:29 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Fix error code in
 tb_port_is_width_supported()
Message-ID: <20200304093829.GJ2540@lahna.fi.intel.com>
References: <20200303101716.uf6l62oavfqmf6hm@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303101716.uf6l62oavfqmf6hm@kili.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 03, 2020 at 01:17:16PM +0300, Dan Carpenter wrote:
> This function is type bool, and it's supposed to return true on success. 
> Unfortunately, this path takes negative error codes and casts them to
> bool (true) so it's treated as success instead of failure.
> 
> Fixes: 91c0c12080d0 ("thunderbolt: Add support for lane bonding")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to fixes, thanks!
