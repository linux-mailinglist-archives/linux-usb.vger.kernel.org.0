Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 883FE9AA4A
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2019 10:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392605AbfHWI1B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Aug 2019 04:27:01 -0400
Received: from mga05.intel.com ([192.55.52.43]:53883 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733069AbfHWI1B (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 23 Aug 2019 04:27:01 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Aug 2019 01:27:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,420,1559545200"; 
   d="scan'208";a="203702966"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by fmsmga004.fm.intel.com with ESMTP; 23 Aug 2019 01:26:58 -0700
Subject: Re: [RESEND PATCH v2 2/2] usb: xhci-mtk: add an optional xhci_ck
 clock
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org
References: <1566542425-20082-1-git-send-email-chunfeng.yun@mediatek.com>
 <1566542425-20082-2-git-send-email-chunfeng.yun@mediatek.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <e1e4d220-9540-2001-13aa-89ff8ce829f5@linux.intel.com>
Date:   Fri, 23 Aug 2019 11:28:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566542425-20082-2-git-send-email-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23.8.2019 9.40, Chunfeng Yun wrote:
> Some SoCs may have an optional clock xhci_ck (125M or 200M), it
> usually uses the same PLL as sys_ck, so support it.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
