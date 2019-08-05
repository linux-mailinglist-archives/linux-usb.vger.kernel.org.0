Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB5181741
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 12:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbfHEKlk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 06:41:40 -0400
Received: from mga04.intel.com ([192.55.52.120]:24042 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727158AbfHEKlk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 5 Aug 2019 06:41:40 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Aug 2019 03:41:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; 
   d="scan'208";a="325280133"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by orsmga004.jf.intel.com with ESMTP; 05 Aug 2019 03:41:37 -0700
Subject: Re: [PATCH 0/2] usb: xhci: dbc: 2 smalll fixes for
 'xhci_dbc_alloc_requests()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <cover.1564577335.git.christophe.jaillet@wanadoo.fr>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <32129b2c-e447-9e80-90df-e99f74308bcc@linux.intel.com>
Date:   Mon, 5 Aug 2019 13:43:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cover.1564577335.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 31.7.2019 15.51, Christophe JAILLET wrote:
> 
> 
> Christophe JAILLET (2):
>    usb: xhci: dbc: Simplify error handling in 'xhci_dbc_alloc_requests()'
>    usb: xhci: dbc: Use GFP_KERNEL instead of GFP_ATOMIC in
>      'xhci_dbc_alloc_requests()'
> 
>   drivers/usb/host/xhci-dbgtty.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

Thanks, adding to queue

-Mathias
