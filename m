Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6ED534170B
	for <lists+linux-usb@lfdr.de>; Fri, 19 Mar 2021 09:02:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234312AbhCSIBm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Mar 2021 04:01:42 -0400
Received: from mga03.intel.com ([134.134.136.65]:12782 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234256AbhCSIBg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Mar 2021 04:01:36 -0400
IronPort-SDR: bApJviL0M4EmQepVFP9aTRZC6nZJexOIsATa66+pGRLKUBUIYBDbYET2Em7jtyOMU7np/iCiUl
 dgQctxj3XdWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="189888469"
X-IronPort-AV: E=Sophos;i="5.81,261,1610438400"; 
   d="scan'208";a="189888469"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 01:01:36 -0700
IronPort-SDR: rx+Eg+3X+Kd29cujeUDRssMTYoGpJzXWxW1XwpAFQv4YrPc+IXotg5beaYvphaClHW2KkKrOfN
 +w/h1I2/GhNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,261,1610438400"; 
   d="scan'208";a="512411446"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 19 Mar 2021 01:01:34 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 19 Mar 2021 10:01:33 +0200
Date:   Fri, 19 Mar 2021 10:01:33 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Phil Rasoa <philippe.rasoa@outlook.fr>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Enable USB-C port as Host on Ubuntu with DWC3 driver
Message-ID: <YFRaXYct7+ysnL+A@kuha.fi.intel.com>
References: <PR3P191MB12150E0D54799FE616B709E4F8699@PR3P191MB1215.EURP191.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PR3P191MB12150E0D54799FE616B709E4F8699@PR3P191MB1215.EURP191.PROD.OUTLOOK.COM>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Philippe,

+linux-usb ml

On Thu, Mar 18, 2021 at 02:08:17PM +0000, Phil Rasoa wrote:
> I am currently working on a project that forces me to use a USB-C port on a
> Ubuntu server "computer". Since I have 2 USB controllers (one using xhci_hdc
> kernel dricer and the other dwc3-pci driver), I would like to know how to
> enable this port as a USB host.

If your computer is Intel based, then the DWC3 controller is device
only. Dual-role capability is achieved with a mux. So if you connect
one of the connectors on your computer to another USB host with USB
Type-C cable, that connector on your board is muxed to the DWC3
controller, so it's in device role. If you connect an USB device to
that same connector, the connector will be in host role and it'll be
muxed to the xHCI. The muxing is handled in system firmware, and we
have no direct control over it.

However, you should be able to attempt role swap if you have connected
the connector to another machine that is also USB dual-role capable
with USB Type-C cable. You should have all the connectors on your
board and the partners attached to them listed in sysfs (_should have_):

        ls /sys/class/typec/
        port0 port1 port1-partner ...

So if let say you have connected port1 to another dual-role capable
machine (you can see the port1-partner device appearing), you can
attempt role swapping like this:

        # Check the current role (device)
        cat /sys/class/typec/port1/data_role
        [device] host

        # Swap to host role
        echo host > /sys/class/typec/port1/data_role

        # Check the current role again
        cat /sys/class/typec/port1/data_role
        device [host]

Hope this helps. If you need more help then please share some more
details about your system.

Br,

-- 
heikki
