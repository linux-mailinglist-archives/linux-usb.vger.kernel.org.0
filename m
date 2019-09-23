Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBA13BB773
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 17:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbfIWPEZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 11:04:25 -0400
Received: from mga04.intel.com ([192.55.52.120]:20059 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726075AbfIWPEY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Sep 2019 11:04:24 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Sep 2019 08:04:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,540,1559545200"; 
   d="scan'208";a="188165919"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga008.fm.intel.com with ESMTP; 23 Sep 2019 08:04:23 -0700
Subject: Re: [PATCH v3] usb: host: xhci: wait CNR when doing xhci resume
To:     Rick Tseng <rtseng@nvidia.com>, mathias.nyman@intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
References: <1568799691-3853-1-git-send-email-rtseng@nvidia.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <72e14518-3349-f256-2c6b-13b08f2ebad3@linux.intel.com>
Date:   Mon, 23 Sep 2019 18:06:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568799691-3853-1-git-send-email-rtseng@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 18.9.2019 12.41, Rick Tseng wrote:
> NVIDIA 3.1 xHCI card would lose power when moving power state into D3Cold.
> Thus we need to wait CNR bit to clear when xhci resmue as xhci init.
> 
> Signed-off-by: Rick Tseng <rtseng@nvidia.com>

Thanks, added to queue.
Did minor changes to commit message and comment

-Mathias

