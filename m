Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20B1E501ED
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2019 08:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbfFXGMd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jun 2019 02:12:33 -0400
Received: from mga04.intel.com ([192.55.52.120]:54256 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726472AbfFXGMd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Jun 2019 02:12:33 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jun 2019 23:12:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,411,1557212400"; 
   d="scan'208";a="151853564"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by orsmga007.jf.intel.com with ESMTP; 23 Jun 2019 23:12:31 -0700
Subject: Re: xHCI Driver Compliance Test Support
To:     Rob Weber <rob@gnarbox.com>, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org
References: <20190619190307.GA18466@coops>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <fc2609bc-2441-0293-1eca-3781af410414@linux.intel.com>
Date:   Mon, 24 Jun 2019 09:15:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190619190307.GA18466@coops>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On 19.6.2019 22.03, Rob Weber wrote:
> Hi Mathias,
> 
> I am working on running our custom USB dual-role product through some
> compliance testing. It seems that the SoC and host controller are
> not responding to the LFPS signaling and timeout that is supposed to
> automatically begin the compliance test sequence.
> 
> I'm currently running a 4.9.115 kernel, and I'm afraid I might be
> missing some critical patches for compliance test support. I noticed
> these two patches came up in a google search:
> 
> https://patchwork.kernel.org/patch/10415345/
> https://www.spinics.net/lists/linux-usb/msg160002.html
> 
> Besides these patches, is there anything else that comes to mind that I
> might need to do to start compliance testing? I'm about to build a more
> recent kernel to see if that improves my situation as well.

If xHC hw has a "Compliance Transition Capability" (CTC) bit set in the
HCCPARAMS2 register then ports won't go to compliance unless software
specifically allows it.

see xhci spec section 4.19.1.2.4.1 for more details.

Compliance can be allowed either with a SetPortFeature(PORT_LINK_STATE) request,
or via debugfs.

To allow compliance using debugfs, first check port is in disabled state:

# cat /sys/kernel/debug/usb/xhci/0000:00:15.0/ports/port01/portsc
Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:

enable compliance by writing "compliance" to the port:
# echo compliance > /sys/kernel/debug/usb/xhci/0000:00:15.0/ports/port01/portsc

This needs to be done for that specific port, and after every port warm reset.

After 1st LFPS timeout the port should go to compliance, can be read from portsc

Also make sure you don't have XHCI_COMP_MODE_QUIRK or XHCI_MISSING_CAS quirks set,
these try to recover ports that accidentally enter compliance mode in normal use.

> 
> Just for reference, our product uses an intel atom z8550 SoC that uses
> an xHCI host controller and a dwc3 device controller. Our platform also
> uses a USB 3.0 redriver. The datasheet for this redriver (tusb542)
> indicates that it's internal LFPS controller supports full USB 3.0
> compliance requirements.
> 

z8550 is Cherry Trail? I unfortunately don't have those around anymore.

-Mathias
