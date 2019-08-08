Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 686E585F1D
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 12:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731588AbfHHKAA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 06:00:00 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:38514 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728289AbfHHKAA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Aug 2019 06:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Av/Y4li/ONECTOz/+Cic2SGJom8kFviegfET+EIcxuE=; b=0kXVmJIBtRfhVNvfU3+9h1LAb
        CyTlMeranDLrdyMr7FNEIVrh5qM6FbhvJ1so2LPiKHQOzv4HzgQj8NVZm7ngxmVY6om1co3qmJoFx
        9DeKML++30pNmDMcmuNDzUL5Q8Y/7zMbjkfHKS9/XXB84IArVD7YGfXWwBWWueayHk9Nap4PBnY5A
        RCrmplfgK3fWluuTz972R21GjCJ/EFh1eDxI8yVVimvFFBMZo9SjhU67+kUn6HAz0z/1litJ3d7l2
        XB05s46t9TKZFsGNboPEcRfdo8qF0aIXAYTWsMMj/9B2PSwMpS+RUddC3RBkMxIqACWbdpEMc8spC
        139dgNSBQ==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:42408)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1hvfD9-00037z-SP; Thu, 08 Aug 2019 10:59:56 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1hvfD5-0002M2-IH; Thu, 08 Aug 2019 10:59:51 +0100
Date:   Thu, 8 Aug 2019 10:59:51 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     yvahkhfo.1df7f8c2@hashmail.org, security@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: usb zero copy dma handling
Message-ID: <20190808095951.GD5193@shell.armlinux.org.uk>
References: <20190808084636.GB15080@priv-mua.localdomain>
 <20190808085811.GA1265@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808085811.GA1265@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 08, 2019 at 10:58:11AM +0200, Greg KH wrote:
> But the main issue here is what exactly is this "fixing"?  What is wrong
> with the existing code that non-x86 systems have such a problem with?
> Shouldn't all of these dma issues be handled by the platform with the
> remap_pfn_range() call itself?

remap_pfn_range() takes a PFN.  virt_to_phys() converts a kernel *direct
mapped* virtual address to a physical address.  That much is fine.

The question is - what is usbm->mem?  If that is anything other than an
address returned by kmalloc() or from the normal page allocator, then
virt_to_phys() will return garbage.

In other words, if it comes from dma_alloc_coherent(), vmalloc() or
ioremap(), using virt_to_phys() on it results in garbage.

This aspect of virt_to_phys() has been well known about for ages; it's
one of the fundamentals of kernel programming.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
