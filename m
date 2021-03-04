Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A89D932D7CE
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 17:33:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237728AbhCDQcU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Mar 2021 11:32:20 -0500
Received: from mga01.intel.com ([192.55.52.88]:54480 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237699AbhCDQcG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Mar 2021 11:32:06 -0500
IronPort-SDR: YSTro68KwMyS/tuQFu8/HSYS19iuFl1CM+rEUqkqfn6N353ySyX8K7rdfEotUyGFcz9HpNz3D8
 NGCSB1x+CsPw==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="207162255"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="207162255"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 08:30:20 -0800
IronPort-SDR: kOpAznQO6X3dmn5FeMVsggEYuQLLOQE0Iiiq1AhFQDG+OQwaNCNh3hzwsq7GLHrgLcIz+4qygy
 VlZh3QURH3VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="400684052"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga008.fm.intel.com with ESMTP; 04 Mar 2021 08:30:06 -0800
Subject: Re: kworker takes 100% core after unplugging usb c hub
To:     Yiyu Zhu <danielzeltar@gmail.com>
Cc:     Greg KH <greg@kroah.com>, linux-usb@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>
References: <CAGv7gkgb12vGPvZcSE0aVOpu32zSgxaayYreLvWs+vJc5EkQrA@mail.gmail.com>
 <YCTS9I5xTVBDvwax@kroah.com>
 <CAGv7gkjoNt9gx_VPfEj=tauKAOcnOd+-2pCXyCoR=GPcHj7jxw@mail.gmail.com>
 <YCUI0h7qkY2PuJcT@kroah.com>
 <CAGv7gki7J1NVX3ti6Qhe9AFLp0JYRTRsT35zpDBTxxQ=te7-sQ@mail.gmail.com>
 <b4ae0847-23a2-c3e3-3ef2-17efdfc792ba@linux.intel.com>
 <CAGv7gkgLVTvBaGTUFd00daN0PBoqj2MbFk0dwnWKRL2odzD-8g@mail.gmail.com>
 <5d3c5b2d-4752-7253-66f3-945c06f8a980@linux.intel.com>
 <CAGv7gkigBrghpO9gETuGBLf=Go3RCA4dU6Z4NRjfTMLUn-Cxgw@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <546b9137-3054-4cb3-b085-e0ea32885e8a@linux.intel.com>
Date:   Thu, 4 Mar 2021 18:31:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAGv7gkigBrghpO9gETuGBLf=Go3RCA4dU6Z4NRjfTMLUn-Cxgw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On 2.3.2021 8.25, Yiyu Zhu wrote:
> Hi Mathias,
> 
> I did not set the correct printk value. Here is a recent dmesg showing
> the hub connection and disconnection on Linux 5.11.0.
> 
...
> [ 1662.620564] usb usb3: usb wakeup-resume
> [ 1662.620570] usb usb3: usb auto-resume
> [ 1662.620585] hub 3-0:1.0: hub_resume
> [ 1662.620607] hub 3-0:1.0: state 7 ports 2 chg 0002 evt 0000
> [ 1662.620637] usb usb3-port1: over-current change #1
> [ 1662.724578] hub 3-0:1.0: trying to enable port power on non-switchable hub
> [ 1662.832221] usb usb3-port1: over-current condition
> [ 1662.832237] usb usb3-port1: status 0008, change 0008, 12 Mb/s
> [ 1662.832262] hub 3-0:1.0: state 7 ports 2 chg 0000 evt 0000
> [ 1662.832277] hub 3-0:1.0: hub_suspend
> [ 1662.832297] usb usb3: bus auto-suspend, wakeup 1
> [ 1662.832307] usb usb3: bus suspend fail, err -16
> [ 1662.832313] hub 3-0:1.0: hub_resume
> [ 1662.832344] hub 3-0:1.0: state 7 ports 2 chg 0002 evt 0000
> [ 1662.832363] usb usb3-port1: status 0008, change 0000, 12 Mb/s
> [ 1662.832375] hub 3-0:1.0: hub_suspend
> [ 1662.832388] usb usb3: bus auto-suspend, wakeup 1
> [ 1662.832397] usb usb3: bus suspend fail, err -16
> [ 1662.832402] hub 3-0:1.0: hub_resume
(removed some messages from other buses from above snippet)

Looks like the suspend/resume loop is triggered by an over-current event.
hub wq notices there is a over-current change, and an over-current status (two separate bits)
hub wq clears the change bit, tries to resolve the over-current, fails, and continues.

This hub (roothub) has no other children or activity so it runtime suspends.
After this the bus tries to suspend, but it fails as xhci bus_suspend() 
returns -EBUSY if a port is in over-current state.

Hub is woken up. hub wq runs, this time there is no over-current change
bit set as it was cleared earlier. The over-current status is still active. 
Hub wq doesn't see any activity, hub is suspended -> try to suspend bus -> fail...

Solution is still unclear, maybe hub wq should react to over-current states,
not just changes?

Thanks
Mathias
