Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48E6E4813C3
	for <lists+linux-usb@lfdr.de>; Wed, 29 Dec 2021 15:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237217AbhL2OGR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Dec 2021 09:06:17 -0500
Received: from mga18.intel.com ([134.134.136.126]:32561 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233228AbhL2OGQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 Dec 2021 09:06:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640786776; x=1672322776;
  h=to:cc:references:from:subject:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=/epgfT/WMtuy1hioNNGKPxuldt+j/exEPJZHHRR4QR8=;
  b=Ws8Bs0A2A4Ayv77V8TLr5xuz6rKs+oPGh3LMRveHS4hNEnilr/PZY7/A
   2wGxqU3JnBOcwPcBzT05loZsBm8aoOUOaypyYyK5bqZxb5xu+wzSuLnO+
   I2fbrtVhsveIxpnLBYY97jIqoE0fNj9SOo8o17ta9vrgMzX8c8U7wCfSO
   jRxX4i+7Xk+XaYwxvS4rM4f9XkBbO0R/4Uw/NnanFCFDn1bUbXhLgHurN
   W6YdrhoZbhIA4trKt5twGXtdKmQSwK3KnW0K7KVDV3nr9gbRTxYjZJ1bi
   NFQCjJmE376dLkXItwSNDlgEJUqdy5g0gKIfT73qUTmtUOxxq+e8vfrxA
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10211"; a="228351340"
X-IronPort-AV: E=Sophos;i="5.88,245,1635231600"; 
   d="scan'208";a="228351340"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2021 06:06:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,245,1635231600"; 
   d="scan'208";a="619046968"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga004.jf.intel.com with ESMTP; 29 Dec 2021 06:06:13 -0800
To:     "Wohl, Tobias" <TWohl@arri.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "chunfeng.yun@mediatek.com" <chunfeng.yun@mediatek.com>,
        "rajatja@google.com" <rajatja@google.com>,
        "andrew@lunn.ch" <andrew@lunn.ch>,
        "chris.chiu@canonical.com" <chris.chiu@canonical.com>,
        "Roese, Stefan (extern)" <SRoese.extern@arri.de>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <PR3PR07MB8116BD69B81F774A555615FAB57E9@PR3PR07MB8116.eurprd07.prod.outlook.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: USB3 disconnect takes long and ends up in warm reset loop
Message-ID: <6e857974-8e10-21b7-8267-569c980d697b@linux.intel.com>
Date:   Wed, 29 Dec 2021 16:07:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <PR3PR07MB8116BD69B81F774A555615FAB57E9@PR3PR07MB8116.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23.12.2021 15.26, Wohl, Tobias wrote:
> Hi all,

Hi

> 
> I noticed a strange beavior when unplugging USB3 sticks. I'm using a zynq ultrascale + platform and the problem
> still occured when testing with 5.16-rc6 kernel.

Does older kernels have the same issue?

> 
> In some cases when unplugging  the USB3 stick it takes aroung 10s until the disconnect is detected.
> Moreover after unplugging the usb driver ends up in a endless loop of trying to perform "warm resets".
> After replugging the USB stick, the loop stops and everything seems to be fine again. This only happens
> with USB3 sticks.
> 

There's been a couple reports like this.
I saw you noticed the patch in usb-next that solves this by giving the link some time to
notice the disconnect, and automatically go to RxDetect from inactive state, thus avoiding
unnecessary warm reset of disconnected devices.

Seems it works for some cases, but not all. 
 

> The kernel log looks as follows:
> 
> [ 1831.312566] handle_port_status: xhci-hcd xhci-hcd.0.auto: Port change event, 2-1, id 2, portsc: 0x4012c1
> [ 1831.312583] handle_port_status: xhci-hcd xhci-hcd.0.auto: handle_port_status: starting port polling.
> [ 1831.312853] hub_event: hub 2-0:1.0: state 7 ports 1 chg 0000 evt 0002
> [ 1831.312874] xhci_hub_control: xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x4012c1, return 0x4002c1
> [ 1831.312899] port_event: usb usb2-port1: link state change
> [ 1831.312912] xhci_clear_port_change_bit: xhci-hcd xhci-hcd.0.auto: clear port1 link state change, portsc: 0x12c1

12c1 = Connected, Disabled, Link:Inactive

> [ 1831.312929] port_event: usb usb2-port1: do warm reset
...
> [ 1831.379730] xhci_hub_control: xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x12b1, return 0x2b1

12b1 = Connected, Disabled, reset asserted, Link: Rx Detect. (Link value is unreliable while reset is asserted)

...
> [ 1831.447759] hub_port_wait_reset: usb usb2-port1: not warm reset yet, waiting 200ms
> [ 1831.655731] xhci_hub_control: xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x12f1, return 0x2f1
12f1 =  Connected, Disabled, reset asserted, Link: Polling. (Link value is unreliable while reset is asserted)

> [ 1831.863726] xhci_hub_control: xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x2812e1, return 0x3002e1
Connected, Disabled, Link: Polling, Warm reset change, reset changed

The odd thing here is that the "connected" bit remains set the whole time.
Other reports had a bit different symptoms after not detecting disconnect, such as reset asserted
bit being stuck forever.

In xhci specs 4.19.1.2 "USB3 root hub port" Figure 4-27 it shows that when link goes to
the Error "link:inactive" state it should drop the connected bit as well.

http://www.intel.com/content/dam/www/public/us/en/documents/technical-specifications/extensible-host-controler-interface-usb-xhci.pdf

(four bits in the figure are Port Power(PP), Current Connect status (CCS), Port Enabled/Disabled (PED), and
Port Reset (PR). Those should be set to (1,0,0,0) once entering the Error "inactive" state.

No idea why CCS bit is still set for you?

Is the device connected to a USB-C port or a "A" port?

Can there be some retimer/redriver mux or something else between port and xHCI that messes up disconnect
detection?

-Mathias 
