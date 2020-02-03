Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A864915072F
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2020 14:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727646AbgBCN2M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Feb 2020 08:28:12 -0500
Received: from mga18.intel.com ([134.134.136.126]:23552 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727606AbgBCN2M (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 Feb 2020 08:28:12 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Feb 2020 05:28:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; 
   d="scan'208";a="337184723"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 03 Feb 2020 05:28:09 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 03 Feb 2020 15:28:08 +0200
Date:   Mon, 3 Feb 2020 15:28:08 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     "Shah, Nehal-bakulchandra" <nbshah@amd.com>
Cc:     ajayg@nvidia.com, linux-usb@vger.kernel.org
Subject: Re: UCSI:CCG: AMD Platform
Message-ID: <20200203132808.GA29050@kuha.fi.intel.com>
References: <0fa0fc36-ce51-046a-32ae-9dbb7452c1c4@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fa0fc36-ce51-046a-32ae-9dbb7452c1c4@amd.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, Feb 03, 2020 at 10:52:52AM +0530, Shah, Nehal-bakulchandra wrote:
> Currently i am working on enabling UCSI support
> for CCGx based controller on AMD GPU Cards.
> 
> Now i am observing the issue reported here when
> i unplug the cable.
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1762031
> 
> Also would like to know is there any way we can
> get user level notifications for UCSI?

If you want to see the actual UCSI notification in user space, then
that is not possible, but the driver does produce trace output, and I
would actually like to see what we got there. You need debugfs to be
mounted. Then try the following:

        # Unload all UCSI modules
        modprobe -r ucsi_acpi

        # At this point you should plug-in the problematic device

        # Reload the UCSI core module
        modprobe typec_ucsi

        # Enable UCSI tracing
        echo 1 > /sys/kernel/debug/tracing/events/ucsi/enable

        # Now reload the ACPI glue driver
        modprobe ucsi_acpi

        # Unplug the problematic device so that you see the error

        # Finally dump the trace output
        cat /sys/kernel/debug/tracing/trace

So if that works, please send the trace output to me.

Thanks,

-- 
heikki
