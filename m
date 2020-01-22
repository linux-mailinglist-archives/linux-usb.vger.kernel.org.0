Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A050C145837
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 15:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgAVOwB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 09:52:01 -0500
Received: from mga18.intel.com ([134.134.136.126]:14242 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725827AbgAVOwA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Jan 2020 09:52:00 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Jan 2020 06:52:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,350,1574150400"; 
   d="scan'208";a="307545445"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga001.jf.intel.com with ESMTP; 22 Jan 2020 06:51:57 -0800
Subject: Re: [PATCH v2] usb: host: xhci-tegra: set MODULE_FIRMWARE for
 tegra186
To:     Peter Robinson <pbrobinson@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20200120141910.116097-1-pbrobinson@gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <ee78d12c-d3f5-e122-e4bd-b43b2cc79a3c@linux.intel.com>
Date:   Wed, 22 Jan 2020 16:54:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200120141910.116097-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20.1.2020 16.19, Peter Robinson wrote:
> Set the MODULE_FIRMWARE for tegra186, it's registered for 124/210 and
> ensures the firmware is available at the appropriate time such as in
> the initrd, else if the firmware is unavailable the driver fails with
> the following errors:
> 
> tegra-xusb 3530000.usb: Direct firmware load for nvidia/tegra186/xusb.bin failed with error -2
> tegra-xusb 3530000.usb: failed to request firmware: -2
> tegra-xusb 3530000.usb: failed to load firmware: -2
> tegra-xusb: probe of 3530000.usb failed with error -2
> 
> Fixes: 5f9be5f3f899 ("usb: host: xhci-tegra: Add Tegra186 XUSB support")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---

Thanks, added to queue

-Mathias
