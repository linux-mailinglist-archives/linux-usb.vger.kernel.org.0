Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4811257C0C
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2019 08:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfF0GVv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jun 2019 02:21:51 -0400
Received: from mga14.intel.com ([192.55.52.115]:48577 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725385AbfF0GVv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Jun 2019 02:21:51 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Jun 2019 23:21:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,422,1557212400"; 
   d="scan'208";a="361043963"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga006.fm.intel.com with ESMTP; 26 Jun 2019 23:21:50 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Kai Ruhnau <kai.ruhnau@target-sg.com>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: RE: No carrier lost information with gadget RNDIS/ECM
In-Reply-To: <AM0PR02MB384108B692229DF41816A363C5E20@AM0PR02MB3841.eurprd02.prod.outlook.com>
References: <AM0PR02MB3841F110F7B6931A087DF566C5E20@AM0PR02MB3841.eurprd02.prod.outlook.com> <87o92kk0ih.fsf@linux.intel.com> <AM0PR02MB384108B692229DF41816A363C5E20@AM0PR02MB3841.eurprd02.prod.outlook.com>
Date:   Thu, 27 Jun 2019 09:21:49 +0300
Message-ID: <871rzffszm.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Kai Ruhnau <kai.ruhnau@target-sg.com> writes:
>>> I have activated CONFIG_USB_GADGET_DEBUG_FILES, and the contents of
>>> /proc/driver/rndis-000 don't change when I pull the cable:
>>>
>>> Config Nr. 0
>>> used      : y
>>> state     : RNDIS_DATA_INITIALIZED
>>> medium    : 0x00000000
>>> speed     : 425984000
>>> cable     : connected
>>> vendor ID : 0x00000000
>>> vendor    : (null)
>>>
>>> Only when changing the host to a Mac, it's different:
>>> Config Nr. 0
>>> used      : y
>>> state     : RNDIS_UNINITIALIZED
>>> medium    : 0x00000000
>>> speed     : 425984000
>>> cable     : connected
>>> vendor ID : 0x00000000
>>> vendor    : (null)
>>>
>>> Thanks for any help.
>>
>> Which peripheral controller is this board using? Is it chipidea? dwc2?
>> dwc3? High Speed or Super Speed?
>
> According to the device tree it's 'fsl,imx6sx-usb' driven by chipidea/ci_hdrc_imx.c
> When connecting to Windows, the dmesg shows:
>  configfs-gadget gadget: high-speed config #2: c

Okay, adding Peter (chipidea maintainer) to the loop here. There are a
few changes on UDC side of chipidea between 4.9 and 5.1:

$ git --no-pager log --no-merges --oneline v4.9..v5.1 -- drivers/usb/chipidea/udc.c
16caf1fa37db usb: chipidea: Add dynamic pinctrl selection
51b751f112dc USB: chipidea: Remove redundant license text
5fd54ace4721 USB: add SPDX identifiers to all remaining files in drivers/usb/
fc5b920c3b9b usb: chipidea: do charger detection in vbus session
581821ae7f7e usb: chipidea: udc: Support SKB alignment quirk
734c58aefcc4 usb: chipidea: udc: compress return logic into line
aa1f058d7d92 usb: chipidea: udc: fix NULL pointer dereference if udc_start failed
a932a8041ff9 usb: chipidea: core: add sysfs group
aeb78cda5100 usb: chipidea: use bus->sysdev for DMA configuration
4f4555cfe704 usb: chipidea: udc: update gadget state after bus resume
afff6067b305 usb: chipidea: Drop lock across event_notify during gadget stop
732a4af85e87 usb: chipidea: Remove locking in ci_udc_start()
34445fb4333f usb: chipidea: Properly mark little endian descriptors
63b9e901e461 usb: chipidea: udc: remove unnecessary & operation
a98e25e71d11 usb: chipidea: udc: make use of new usb_endpoint_maxp_mult()

Peter, have you seen the problem described before?

-- 
balbi
