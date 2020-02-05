Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78DB21533A2
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2020 16:07:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727143AbgBEPHR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Feb 2020 10:07:17 -0500
Received: from vegas.theobroma-systems.com ([144.76.126.164]:34263 "EHLO
        mail.theobroma-systems.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726334AbgBEPHR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Feb 2020 10:07:17 -0500
X-Greylist: delayed 1771 seconds by postgrey-1.27 at vger.kernel.org; Wed, 05 Feb 2020 10:07:16 EST
Received: from ip5f5a5d2f.dynamic.kabel-deutschland.de ([95.90.93.47]:49330 helo=phil.localnet)
        by mail.theobroma-systems.com with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <heiko.stuebner@theobroma-systems.com>)
        id 1izLo5-0003tf-SB; Wed, 05 Feb 2020 15:37:33 +0100
From:   Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     christoph.muellner@theobroma-systems.com,
        Thinh Nguyen <thinhn@synopsys.com>,
        John Keeping <john@metanate.com>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: dwc2: gadget mode and timeout with GRSTCTL_CSFTRST
Date:   Wed, 05 Feb 2020 15:37:33 +0100
Message-ID: <3600884.FGW0xRIbGs@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

right now we're experiencing strange behaviour with a dwc2 on Rockchip's
PX30 soc.

With a cable connected to the port, the configfs-snippet below seems to
work and at least creates a acm device on the host. Though I'm told that a
	 picocom -b 115200 /dev/ttyACM
sometimes works ok but also sometimes returns -EBUSY or hangs.
[But I guess that is a separate problem]

But if there is no cable connected when trying to do the configfs steps
we end up with
	dwc2_core_reset: HANG! Soft Reset timeout GRSTCTL GRSTCTL_CSFTRST
and no gadget gets configured.


So I guess to get a feeling for the issue, is this something to be
expected, or at least a known issue, with maybe a fix flying around
somewhere?

Or is this working on other dwc2 platforms correctly and is caused
by some other part talking to the dwc2 doing strange things?


Thanks
Heiko

-------- 8< ---- configfs snippet ------ >8 --------
cd /configfs/usb_gadget
mkdir g1
cd g1
echo "0x1d6d" > idVendor
echo "0x0104" > idProduct
mkdir strings/0x409
echo "0123456789" > strings/0x409/serialnumber
echo "Theobroma Systems" > strings/0x409/manufacturer
echo "Cobra Debug Serial" > strings/0x409/product

# create config
mkdir configs/c.1
mkdir configs/c.1/strings/0x409
echo "conf1" > configs/c.1/strings/0x409/configuration

# create function
mkdir functions/acm.usb0
ln -s functions/acm.usb0 configs/c.1

# activate new config
echo "" > UDC
echo "ff300000.usb" > UDC



