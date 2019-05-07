Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1688161F8
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2019 12:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfEGK26 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 May 2019 06:28:58 -0400
Received: from mga11.intel.com ([192.55.52.93]:28987 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726302AbfEGK26 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 May 2019 06:28:58 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 May 2019 03:28:58 -0700
X-ExtLoop1: 1
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by FMSMGA003.fm.intel.com with ESMTP; 07 May 2019 03:28:57 -0700
Subject: Re: Resend: [PATCH] usb: xhci: avoid null pointer deref when bos
 field is NULL
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>
References: <86f265cb7e18410994e433ad522c0cf1@SVR-IES-MBX-03.mgc.mentorg.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <d8b27eb9-0787-6ffe-9c52-578c223f3a91@linux.intel.com>
Date:   Tue, 7 May 2019 13:31:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <86f265cb7e18410994e433ad522c0cf1@SVR-IES-MBX-03.mgc.mentorg.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7.5.2019 11.15, Schmid, Carsten wrote:
> Hi,
> 
> two weeks ago i sent this mail to the linux-usb mailing list but got no answer.
> Maybe this has fallen through your filters?
> 
> So resending it and adding Mathias in CC.

Thanks, I notice them better when I'm added as To or CC.
Adding patch to queue

We're late in 5.1 cycle so it will go forward after 5.2-rc1

For future patches please add comments not suitable for changelog after a marker line,
as submitting-patches.rst suggest:

- The ``Signed-off-by:`` lines, described above, which will
     also go in the changelog.

   - A marker line containing simply ``---``.

   - Any additional comments not suitable for the changelog.

   - The actual patch (``diff`` output).

Thanks
-Mathias
