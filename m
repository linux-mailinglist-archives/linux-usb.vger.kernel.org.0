Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0BB2209EE2
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jun 2020 14:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404740AbgFYMvb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jun 2020 08:51:31 -0400
Received: from mga17.intel.com ([192.55.52.151]:34281 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404650AbgFYMv3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Jun 2020 08:51:29 -0400
IronPort-SDR: mUnLr3iqFSH7xPnanyKvo2HmTXpXpFlfv1HYEsKeGTkSiCO67GaUQFzVxCyFAzD3i0iETr3UK+
 cNvxfyHEcRJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9662"; a="125116189"
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; 
   d="scan'208";a="125116189"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2020 05:51:28 -0700
IronPort-SDR: 53v6sNy3nFze5kjoeCYuYwJMRFVzX0go3NXE0b9Eu0eDEAR3reK1RpLqmz1i/lc/19nWOk69Lb
 lqZevp77g4/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; 
   d="scan'208";a="293865509"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga002.jf.intel.com with SMTP; 25 Jun 2020 05:51:25 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 25 Jun 2020 15:51:24 +0300
Date:   Thu, 25 Jun 2020 15:51:24 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 01/17] thunderbolt: Fix path indices used in USB3 tunnel
 discovery
Message-ID: <20200625125124.GM2795@lahna.fi.intel.com>
References: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
 <20200615142645.56209-2-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615142645.56209-2-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 15, 2020 at 05:26:29PM +0300, Mika Westerberg wrote:
> The USB3 discovery used wrong indices when tunnel is discovered. It
> should use TB_USB3_PATH_DOWN for path that flows downstream and
> TB_USB3_PATH_UP when it flows upstream. This should not affect the
> functionality but better to fix it.
> 
> Fixes: e6f818585713 ("thunderbolt: Add support for USB 3.x tunnels")
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: stable@vger.kernel.org # v5.6+

Applied to thunderbolt.git/fixes.
