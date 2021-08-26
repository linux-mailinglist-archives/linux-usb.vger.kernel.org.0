Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84A6B3F8A0B
	for <lists+linux-usb@lfdr.de>; Thu, 26 Aug 2021 16:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242815AbhHZO0B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Aug 2021 10:26:01 -0400
Received: from mga02.intel.com ([134.134.136.20]:52528 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242820AbhHZO0A (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Aug 2021 10:26:00 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="204953720"
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; 
   d="scan'208";a="204953720"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2021 07:25:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; 
   d="scan'208";a="598499071"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 26 Aug 2021 07:25:04 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 26 Aug 2021 17:25:03 +0300
Date:   Thu, 26 Aug 2021 17:25:03 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ulrich Huber <ulrich@huberulrich.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: ucsi_acpi GET_CONNECTOR_STATUS failed (-5)
Message-ID: <YSekP0+tq6ISq6my@kuha.fi.intel.com>
References: <b36249c5-776a-9338-bb9f-ae6a5c446860@huberulrich.de>
 <YSX7hZnCoFSXTFJe@kuha.fi.intel.com>
 <0e77017d-9358-a691-6293-234fcbab6a31@huberulrich.de>
 <a7f971ef-c3aa-aadc-e453-4c667a414131@huberulrich.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7f971ef-c3aa-aadc-e453-4c667a414131@huberulrich.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 25, 2021 at 08:37:14PM +0200, Ulrich Huber wrote:
> Hi,
> 
> I just managed to get some more details. The bug definitely originates from
> `ucsi_handle_connector_change`. Within this function it is the second call
> to ucsi_send_command with UCSI_GET_CONNECTOR_STATUS that fails (Step 4).
> 
> `ucsi_send_command` calls `ucsi_exec_command` internally, which does the
> synchronous write and following read. Within `ucsi_exec_command` the check
> on line 134 fails:
> 
> if (cci & UCSI_CCI_COMMAND_COMPLETE)
> 
> Hope this is of some help.

Thanks for debugging this.

Yeah, I think that the second GET_CONNECTOR_STATUS immediately after
the first one is confusing the firmware on some boards.

I'll send you a patch series I've been working on that tries to
improve the situation. I better include the list as well (sending it
as RFC).

thanks,

-- 
heikki
