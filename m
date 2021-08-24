Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C6E3F5C05
	for <lists+linux-usb@lfdr.de>; Tue, 24 Aug 2021 12:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236150AbhHXKZd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 06:25:33 -0400
Received: from mga12.intel.com ([192.55.52.136]:3606 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236287AbhHXKZc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Aug 2021 06:25:32 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10085"; a="196857349"
X-IronPort-AV: E=Sophos;i="5.84,346,1620716400"; 
   d="scan'208";a="196857349"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 03:24:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,346,1620716400"; 
   d="scan'208";a="597538138"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 24 Aug 2021 03:24:40 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 24 Aug 2021 13:24:39 +0300
Date:   Tue, 24 Aug 2021 13:24:39 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: How to proceed: usci_acpi: PPM init failed (-110)
Message-ID: <YSTI51ilGLJLYlQz@kuha.fi.intel.com>
References: <20210823180626.tb6m7h5tp6adhvt2@fastboi.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210823180626.tb6m7h5tp6adhvt2@fastboi.localdomain>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 23, 2021 at 08:06:26PM +0200, Samuel Čavoj wrote:
> Hello,
> 
> The driver times out talking to the PPM (the message pops up 60 seconds
> after loading the module, the timeout in ucsi_acpi_sync_write).
> The command which times out is the first one after resetting the PPM in
> ucsi_init, enabling basic notifications.
> 
> The laptop in question is an ASUS UM325U, with the AMD Ryzen 5700U SoC.
> 
> The ACPI description of the USBC000 device looks reasonable to my eyes,
> but I am not an expert. The _DSM Method copies the UCSI OpRegion to (or
> from) EC memory. I can provide a dump if needed.
> 
> I am looking for guidance on how to proceed, I am not too familiar with
> the UCSI other than peeking at the spec for a short while.
> 
> Looking the error up online leads to various discussions usually ending
> with installing an nvidia driver, however mine does not have any
> dedicated GPU.

Can you send full dmesg output, and acpidump:

        % dmesg > dmesg.dump
        % acpidump -o acpi.dump

If enabling the notifications fails, then I'm not sure the EC firmware
on this board actually supports UCSI. That would not be unheard-of
situation.

thanks,

-- 
heikki
