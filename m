Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4522F488C
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jan 2021 11:23:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbhAMKXJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 05:23:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:59436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726692AbhAMKXJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 Jan 2021 05:23:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5326720789;
        Wed, 13 Jan 2021 10:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610533348;
        bh=lQ2kfjepUzP/opvweN3wRdYWbx4oV4OIeLjfrrlsG0E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BGYovDrntzSw78ip8/jj6Y0Pt/wUQLs3qUXQ3tUcIUNnm9un9aC9SlQj0wmcFteOM
         VY252N83eCGn0dpQJQwJ9BL7mUIYnRqKevBbe7LPZ1sTH+RbIXOi7A7CmEugMTl4dh
         bLI+Wju5Uh4clPVILCIPv8pFCEzCxiRDqKTR3asA=
Date:   Wed, 13 Jan 2021 11:23:35 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alan Cooper <alcooperx@gmail.com>
Cc:     Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: Conflicting PCI ID in bdc driver
Message-ID: <X/7KJ1gbcnQDUWx3@kroah.com>
References: <CAMeQTsacNs-YVWeX6vFJyMBLeD_AX6imNQRodV_X-QS54wAREA@mail.gmail.com>
 <X/y1ekqBrjXK8lZO@kroah.com>
 <CAMeQTsaL0mx=WW2Ekr2gh_aCWKnumS4mSr5tTH_ac+cdarzxMA@mail.gmail.com>
 <CAOGqxeUkZ8VK-D3xutVvQk7e2t1=9GzLQL7oHz0GTj_FMdVeqw@mail.gmail.com>
 <CAMeQTsZA7a9WcJq2tudWhaJbc6Z4vb4jtcUnHOCzg9u3oLxzbw@mail.gmail.com>
 <X/1ksTC4SBgrQoak@kroah.com>
 <CAOGqxeXE4D7Dyf-9c=evZMG+PTGrycKTpY1=VBk7OVAWKmyh0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOGqxeXE4D7Dyf-9c=evZMG+PTGrycKTpY1=VBk7OVAWKmyh0A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 12, 2021 at 02:51:05PM -0500, Alan Cooper wrote:
> I just checked with the hardware engineer that designed the BDC core.
> The BDC PCI driver was used with an FPGA/PCIe board for design
> verification and no one should be using this driver. I'll send a patch
> that will remove this driver.

Based on the recent patches for this driver on the mailing list, are you
sure that no one is using this?  We can't delete a driver that people
are using.

thanks,

greg k-h
