Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E11782655F
	for <lists+linux-usb@lfdr.de>; Wed, 22 May 2019 16:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728388AbfEVOFe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 May 2019 10:05:34 -0400
Received: from mga04.intel.com ([192.55.52.120]:61227 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726770AbfEVOFe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 May 2019 10:05:34 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 May 2019 07:05:33 -0700
X-ExtLoop1: 1
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by orsmga007.jf.intel.com with ESMTP; 22 May 2019 07:05:31 -0700
Subject: Re: [PATCH v2] xhci: Use %zu for printing size_t type
To:     Fabio Estevam <festevam@gmail.com>, gregkh@linuxfoundation.org
Cc:     mathias.nyman@intel.com, linux-usb@vger.kernel.org,
        henryl@nvidia.com
References: <20190522133529.14164-1-festevam@gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <8ac71a87-cf73-852b-c4b7-4322f0ed5e5b@linux.intel.com>
Date:   Wed, 22 May 2019 17:08:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190522133529.14164-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22.5.2019 16.35, Fabio Estevam wrote:
> Commit 597c56e372da ("xhci: update bounce buffer with correct sg num")
> caused the following build warnings:
> 
> drivers/usb/host/xhci-ring.c:676:19: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
> 
> Use %zu for printing size_t type in order to fix the warnings.
> 
> Fixes: 597c56e372da ("xhci: update bounce buffer with correct sg num")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---

Thanks for writing this follow-up patch

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>



