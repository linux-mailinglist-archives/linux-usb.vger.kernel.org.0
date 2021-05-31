Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A80A3959CD
	for <lists+linux-usb@lfdr.de>; Mon, 31 May 2021 13:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbhEaLkW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 May 2021 07:40:22 -0400
Received: from mga04.intel.com ([192.55.52.120]:1762 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231289AbhEaLkU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 May 2021 07:40:20 -0400
IronPort-SDR: wh81qc8JRjUKKHbEp58CY7q+XDsOuUE4gAklByJX7vFLzDIdajJAhHibM/NlO7Z1I1q1MwpKPH
 GoQ9pvp/O9pw==
X-IronPort-AV: E=McAfee;i="6200,9189,10000"; a="201470409"
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; 
   d="scan'208";a="201470409"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2021 04:38:40 -0700
IronPort-SDR: js8b+x0aO6lbmD+8LcokE5DzRU0mBTmvWmdNFe21CFg1dJE+18f1n/HYihdNlRjm/COt+0UJCp
 WzOyFCdgiJxw==
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; 
   d="scan'208";a="482063736"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2021 04:38:38 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 31 May 2021 14:38:35 +0300
Date:   Mon, 31 May 2021 14:38:35 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 3/4] thunderbolt: Split NVM read/write generic functions
 out from usb4.c
Message-ID: <YLTKu8hfP9Wrj7l0@lahna.fi.intel.com>
References: <20210517115907.52503-1-mika.westerberg@linux.intel.com>
 <20210517115907.52503-4-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517115907.52503-4-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 17, 2021 at 02:59:06PM +0300, Mika Westerberg wrote:
> We do this for Thunderbolt 2/3 devices through DMA port, USB4 devices
> and retimers pretty much the same way. Only the actual block read/write
> is different. For this reason split out the NVM read/write functions
> from usb4.c to nvm.c and make USB4 device code call these when needed.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

This and the 4/4 applied to thunderbolt.git/next.
