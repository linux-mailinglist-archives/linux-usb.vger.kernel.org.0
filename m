Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0C938A045
	for <lists+linux-usb@lfdr.de>; Thu, 20 May 2021 10:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbhETIzv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 04:55:51 -0400
Received: from mga11.intel.com ([192.55.52.93]:63017 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230442AbhETIzv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 May 2021 04:55:51 -0400
IronPort-SDR: T7uvI/5EqI764L0foqulYctWtghfiU0lPIG3R2iAk9qmUsy8DS97V4xWPT1k3a2+BGZjrKe1nM
 QWNQ0viX1QYQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="198092538"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="198092538"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2021 01:54:29 -0700
IronPort-SDR: gueLUyfNUWrHY6zfZAbTDwkuLYgkav9uV+0PeWYHTlDN8Fzz6/nWTROfN8TVW2RDHRpYSA4vil
 GaXA066QrZLA==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="473909595"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2021 01:54:26 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 20 May 2021 11:54:24 +0300
Date:   Thu, 20 May 2021 11:54:24 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 1/4] thunderbolt: dma_port: Fix NVM read buffer bounds
 and offset issue
Message-ID: <20210520085424.GF291593@lahna.fi.intel.com>
References: <20210517115907.52503-1-mika.westerberg@linux.intel.com>
 <20210517115907.52503-2-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517115907.52503-2-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 17, 2021 at 02:59:04PM +0300, Mika Westerberg wrote:
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> Up to 64 bytes of data can be read from NVM in one go. Read address
> must be dword aligned. Data is read into a local buffer.
> 
> If caller asks to read data starting at an unaligned address then full
> dword is anyway read from NVM into a local buffer. Data is then copied
> from the local buffer starting at the unaligned offset to the caller
> buffer.
> 
> In cases where asked data length + unaligned offset is over 64 bytes
> we need to make sure we don't read past the 64 bytes in the local
> buffer when copying to caller buffer, and make sure that we don't
> skip copying unaligned offset bytes from local buffer anymore after
> the first round of 64 byte NVM data read.
> 
> Fixes: 3e13676862f9 ("thunderbolt: Add support for DMA configuration based mailbox")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/fixes.
