Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDFE1251447
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 10:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729274AbgHYIcd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 04:32:33 -0400
Received: from mga18.intel.com ([134.134.136.126]:61870 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728808AbgHYIcd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 25 Aug 2020 04:32:33 -0400
IronPort-SDR: BEwDeWYKDGQkP0q23dh01yaHOgAcYmkuBt0w+fjt0HXMR6eKFV5tLbmJCBhd2uHfRXl3hMvlri
 9TpD2/rcO1+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="143730363"
X-IronPort-AV: E=Sophos;i="5.76,351,1592895600"; 
   d="scan'208";a="143730363"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2020 01:32:32 -0700
IronPort-SDR: UuuCVCN56U0XAn5FPEMEMlUvKJMiv4IEHRL/dNrTSudoocinIQVGzGUjBRKFEtsfcXs9gPfEk8
 WBZdwe4ydNAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,351,1592895600"; 
   d="scan'208";a="402645512"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 25 Aug 2020 01:32:29 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 25 Aug 2020 11:32:28 +0300
Date:   Tue, 25 Aug 2020 11:32:28 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        "Nikunj A . Dadhania" <nikunj.dadhania@linux.intel.com>,
        Srikanth Nandamuri <srikanth.nandamuri@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 2/2] thunderbolt: Use maximum USB3 link rate when
 reclaiming if link is not up
Message-ID: <20200825083228.GZ1375436@lahna.fi.intel.com>
References: <20200819112716.59074-1-mika.westerberg@linux.intel.com>
 <20200819112716.59074-2-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819112716.59074-2-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 19, 2020 at 02:27:16PM +0300, Mika Westerberg wrote:
> If the USB3 link is not up the actual link rate is 0 so when reclaiming
> bandwidth we should look at maximum supported link rate instead.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0bd680cd900c ("thunderbolt: Add USB3 bandwidth management")
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to fixes.
