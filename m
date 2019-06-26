Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF88C5685F
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2019 14:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727377AbfFZMN2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jun 2019 08:13:28 -0400
Received: from mga04.intel.com ([192.55.52.120]:56455 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbfFZMN2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Jun 2019 08:13:28 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Jun 2019 05:13:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,419,1557212400"; 
   d="scan'208";a="170048816"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Jun 2019 05:13:26 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Kai Ruhnau <kai.ruhnau@target-sg.com>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: No carrier lost information with gadget RNDIS/ECM
In-Reply-To: <AM0PR02MB3841F110F7B6931A087DF566C5E20@AM0PR02MB3841.eurprd02.prod.outlook.com>
References: <AM0PR02MB3841F110F7B6931A087DF566C5E20@AM0PR02MB3841.eurprd02.prod.outlook.com>
Date:   Wed, 26 Jun 2019 15:13:26 +0300
Message-ID: <87o92kk0ih.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Kai Ruhnau <kai.ruhnau@target-sg.com> writes:
> On my i.MX6 SoloX, I have configured one of the OTG ports for a
> combined RNDIS/ECM gadget. After boot, I have two network interfaces
> (usb0 and usb1) which are managed by systemd-networkd.
>
> With kernel 4.9.153, systemd-networkd reports an immediate carrier
> loss when I pull the USB cable from a Windows or macOS host. With
> 4.19.53 or 5.1.15 that carrier loss is only reported when I re-attach
> the cable, meaning there is a "Lost carrier" for the last used
> interface immediately followed by a "Gained carrier" for the newly
> connected interface.

First of all, thanks for actually testing the most recent stable
kernels. Much appreciated :-)

> I have activated CONFIG_USB_GADGET_DEBUG_FILES, and the contents of
> /proc/driver/rndis-000 don't change when I pull the cable:
>
> Config Nr. 0
> used      : y
> state     : RNDIS_DATA_INITIALIZED
> medium    : 0x00000000
> speed     : 425984000
> cable     : connected
> vendor ID : 0x00000000
> vendor    : (null)
>
> Only when changing the host to a Mac, it's different:
> Config Nr. 0
> used      : y
> state     : RNDIS_UNINITIALIZED
> medium    : 0x00000000
> speed     : 425984000
> cable     : connected
> vendor ID : 0x00000000
> vendor    : (null)
>
> Thanks for any help.

Which peripheral controller is this board using? Is it chipidea? dwc2?
dwc3? High Speed or Super Speed?

-- 
balbi
