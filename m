Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4BAD5D12
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2019 10:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729234AbfJNIEi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Oct 2019 04:04:38 -0400
Received: from mga12.intel.com ([192.55.52.136]:33045 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725934AbfJNIEi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 14 Oct 2019 04:04:38 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Oct 2019 01:04:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,295,1566889200"; 
   d="scan'208";a="220032491"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga004.fm.intel.com with ESMTP; 14 Oct 2019 01:04:37 -0700
Subject: Re: [PATCH] xhci: Don't use soft retry if slot id > 0
To:     Bernhard Gebetsberger <bernhard.gebetsberger@gmx.at>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191013003313.3497-1-bernhard.gebetsberger@gmx.at>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <84476602-7551-b667-9803-55016e477b02@linux.intel.com>
Date:   Mon, 14 Oct 2019 11:06:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191013003313.3497-1-bernhard.gebetsberger@gmx.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13.10.2019 3.33, Bernhard Gebetsberger wrote:
> According to the xhci specification(chapter 4.6.8.1) soft retry
> shouldn't be used if the slot id is higher than 0. Currently some usb
> devices break on some systems because soft retry is being used when
> there is a transaction error, without checking the slot id.
> 
That is not correct

Specs say that soft retry should not be used if we are dealing with a
FS/LS device behind a HS hub, this can be checked from the "TT Hub Slot ID"
field in the slot context, which we do.

In xhci all devices have a slot id, so this change would prevent
soft retry almost completely.

Specs 4.6.8.1:
"Soft Retry attempts shall not be performed if the device is behind a
TT in a HS Hub (i.e. TT Hub Slot ID > ‘0’)."

-Mathias
