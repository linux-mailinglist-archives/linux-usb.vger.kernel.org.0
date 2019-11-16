Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7055BFEB55
	for <lists+linux-usb@lfdr.de>; Sat, 16 Nov 2019 10:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbfKPJZ5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 16 Nov 2019 04:25:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:35756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726830AbfKPJZ5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 16 Nov 2019 04:25:57 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D457620723;
        Sat, 16 Nov 2019 09:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573896356;
        bh=O57bQZE/Qv9pds+0hvLQxrDfTjim4AUF4PlyRUnbQbo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d+FfvuC6J8SHcC5bkRxc3RYTGdMO7DkXdZTSrdJCgcOcKKkKeansuCkoSNNITbJKA
         rL6/4FuxdjOs9VUABI13EYf6sLrrNasyOS8EBDZVqDpP7QZI3PEaZCe5FvhVW3Zcxc
         8gOdmYv53dlVJmDs4obaDHepMPGNcAxnO3ld0M0A=
Date:   Sat, 16 Nov 2019 10:25:52 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 4/4] xhci-pci: Allow host runtime PM as default also for
 Intel Ice Lake xHCI
Message-ID: <20191116092552.GA390155@kroah.com>
References: <1573836603-10871-1-git-send-email-mathias.nyman@linux.intel.com>
 <1573836603-10871-5-git-send-email-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573836603-10871-5-git-send-email-mathias.nyman@linux.intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 15, 2019 at 06:50:03PM +0200, Mathias Nyman wrote:
> From: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Intel Ice Lake has two xHCI controllers one on PCH and the other as part
> of the CPU itself. The latter is also part of the so called Type C
> Subsystem (TCSS) sharing ACPI power resources with the PCIe root ports
> and the Thunderbolt controllers. In order to put the whole TCSS block
> into D3cold the xHCI needs to be runtime suspended as well when idle.
> 
> For this reason allow runtime PM as default for Ice Lake TCSS xHCI
> controller.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>  drivers/usb/host/xhci-pci.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Can this also be queued up for the stable tree (or at least for 5.4.y?)

thanks,

greg k-h
