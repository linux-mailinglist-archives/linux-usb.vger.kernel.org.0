Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4C038A049
	for <lists+linux-usb@lfdr.de>; Thu, 20 May 2021 10:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbhETI4Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 04:56:16 -0400
Received: from mga07.intel.com ([134.134.136.100]:22975 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231246AbhETI4P (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 May 2021 04:56:15 -0400
IronPort-SDR: pb3ASRXqscRN0Sn73vm7nuNPbovXM8J2rsp+6kScglhD8cnTWLYRvYLQjJUqKL1R3ZAPTb+JLZ
 pLUywZm6Cq+w==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="265092314"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="265092314"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2021 01:54:54 -0700
IronPort-SDR: C3c0j6i492wQOQzynTAes/JrUVJWGhyp49wdGk6bzs0VzX0SrcALJbLu/RCZ0Tf3guamyeWs3q
 zFDSxQGoGQTA==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="440366268"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2021 01:54:51 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 20 May 2021 11:54:48 +0300
Date:   Thu, 20 May 2021 11:54:48 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 2/4] thunderbolt: usb4: Fix NVM read buffer bounds and
 offset issue
Message-ID: <20210520085448.GG291593@lahna.fi.intel.com>
References: <20210517115907.52503-1-mika.westerberg@linux.intel.com>
 <20210517115907.52503-3-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517115907.52503-3-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 17, 2021 at 02:59:05PM +0300, Mika Westerberg wrote:
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> Up to 64 bytes of data can be read from NVM in one go.
> Read address must be dword aligned. Data is read into a local buffer.
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
> Fixes: b04079837b20 ("thunderbolt: Add initial support for USB4")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/fixes.
