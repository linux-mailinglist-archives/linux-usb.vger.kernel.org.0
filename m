Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 952FE2122B3
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 13:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728849AbgGBLxi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 07:53:38 -0400
Received: from mga04.intel.com ([192.55.52.120]:5015 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728813AbgGBLxi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Jul 2020 07:53:38 -0400
IronPort-SDR: LamNGFfkGgsD0cdlnwYwNghixb+lkyZ8n9CiweeWGJxc07aNTa7MM0HNXV1th5kB+dw9ffAawx
 IMn+7ijUZkwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="144386689"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; 
   d="scan'208";a="144386689"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2020 04:53:37 -0700
IronPort-SDR: bbbdfZyO3yEXTYX8WFFN2SRdDCYGGBsw17/NUBwRRvkexdjBdpLuSC4R4N9fh3hBFJ8n6VtUMw
 6L4M191McniA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; 
   d="scan'208";a="387313386"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 02 Jul 2020 04:53:35 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 02 Jul 2020 14:53:34 +0300
Date:   Thu, 2 Jul 2020 14:53:34 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH -next] thunderbolt: Fix old style declaration warning
Message-ID: <20200702115334.GU5180@lahna.fi.intel.com>
References: <20200702080750.70614-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702080750.70614-1-weiyongjun1@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 02, 2020 at 04:07:50PM +0800, Wei Yongjun wrote:
> Fix gcc build warning:
> 
> drivers/thunderbolt/quirks.c:21:1: warning:
>  'static' is not at beginning of declaration [-Wold-style-declaration]
>    21 | const static struct tb_quirk tb_quirks[] = {
>       | ^~~~~
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thanks!
