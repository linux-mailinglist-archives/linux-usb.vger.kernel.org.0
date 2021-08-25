Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F54B3F70EF
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 10:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231697AbhHYINm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 04:13:42 -0400
Received: from mga09.intel.com ([134.134.136.24]:12980 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229780AbhHYINl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Aug 2021 04:13:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="217481120"
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; 
   d="scan'208";a="217481120"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 01:12:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; 
   d="scan'208";a="597974158"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 25 Aug 2021 01:12:53 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 25 Aug 2021 11:12:53 +0300
Date:   Wed, 25 Aug 2021 11:12:53 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ulrich Huber <ulrich@huberulrich.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: ucsi_acpi GET_CONNECTOR_STATUS failed (-5)
Message-ID: <YSX7hZnCoFSXTFJe@kuha.fi.intel.com>
References: <b36249c5-776a-9338-bb9f-ae6a5c446860@huberulrich.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b36249c5-776a-9338-bb9f-ae6a5c446860@huberulrich.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Ulrich,

On Mon, Aug 23, 2021 at 04:29:42PM +0200, Ulrich Huber wrote:
> Hi,
> 
> I'm using quite a new device (Lenovo Yoga 9 (14ITL5)) on ArchLinux with
> mainline kernel version 5.14.0-rc7 and run into the following error:
> 
> ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS
> failed (-5)
> 
> The device is charged using a USB-C cable and this error is related to
> attaching or detaching the power cable. Sometimes I can at-/detach the cable
> without this error showing, in other cases it appears once, and then I have
> cases where it floods my kernel log with one such message per second.
> 
> Sometimes the above error is accompanied by this additional error:
> 
> ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-5)
> 
> I attached the kernel log and the information from `lsusb`. Feel free to
> request further logs, though I will most likely require some pointers on how
> to get them.

Thanks for the report. Can you test this with kernel v5.10?

I'm wondering if commit 217504a05532 ("usb: typec: ucsi: Work around
PPM losing change information") causes that GET_CONNECTOR_STATUS
failure.


thanks,

-- 
heikki
