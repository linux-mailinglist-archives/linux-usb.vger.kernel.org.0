Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9F281591EE
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 15:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729014AbgBKO26 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 09:28:58 -0500
Received: from mga07.intel.com ([134.134.136.100]:38287 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728339AbgBKO26 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Feb 2020 09:28:58 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Feb 2020 06:28:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="347288617"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 11 Feb 2020 06:28:55 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 11 Feb 2020 16:28:55 +0200
Date:   Tue, 11 Feb 2020 16:28:55 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Oliver Neukum <oneukum@suse.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: No PNP0CA0 device on a Dell Precision 5520 laptop
Message-ID: <20200211142855.GC1498@kuha.fi.intel.com>
References: <1581427518.1580.3.camel@suse.de>
 <20200211135920.GB1498@kuha.fi.intel.com>
 <1581430450.1580.5.camel@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1581430450.1580.5.camel@suse.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 11, 2020 at 03:14:10PM +0100, Oliver Neukum wrote:
> Am Dienstag, den 11.02.2020, 15:59 +0200 schrieb Heikki Krogerus:
> > cat /sys/bus/acpi/devices/USBC000\:00/status
> 
> Technically -ENODEV. It does not exist, even in a listing.
> But this thing definitely has a type C port. It is connected
> to a docking station which supplies the whole system with power.
> Ethernet also works.

There is still no requirement for the BIOS or the EC firmware to
expose UCSI to the operating system. If the ACPI node is not there,
then there is no UCSI on that system. The USB Type-C connectors
function autonomously in any case on a system that exposes them to the
operating system with UCSI. UCSI is more like an optional status
interface that allows limited control over some specific things like
role swapping.

UCSI is usually supported when the USB Power Delivery (USB PD)
controllers are connected to the Embedded Controller on the system,
but on some of our platforms they are directly connected to the SOC
instead. So on those platforms we can directly communicate with the
USB PD controller from the operating system, which is actually much
better situation compared to UCSI IMO.

Do you have this ACPI node: INT3515 ?

It's for the TI TPS6598x USB PD controllers.

thanks,

-- 
heikki
