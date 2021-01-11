Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 394982F20D1
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jan 2021 21:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733074AbhAKUaV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 15:30:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:34378 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732953AbhAKUaU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Jan 2021 15:30:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6595121BE5;
        Mon, 11 Jan 2021 20:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610396979;
        bh=ZL2Tr27BAyH7lf+5uXotJ3Ho5kTkqKeZLx2htZ7lDHs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oebD7mUPSSPQ1PTwzzpDqA+X0JU8ex5c8lGbRurImuiQhKH0tccUQusQWh27U7GO9
         ryz0X28A2PDjYnvme4ArnpBKGIHX5LhqWnwFlMpbWvBHyn+WesZwifI3R0j+3JJSeh
         cazQ9AsQKW6KCIBiMj5d4Zci4v7HuXXK1bnRy3cM=
Date:   Mon, 11 Jan 2021 21:30:50 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc:     Al Cooper <alcooperx@gmail.com>, Felipe Balbi <balbi@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: Conflicting PCI ID in bdc driver
Message-ID: <X/y1ekqBrjXK8lZO@kroah.com>
References: <CAMeQTsacNs-YVWeX6vFJyMBLeD_AX6imNQRodV_X-QS54wAREA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMeQTsacNs-YVWeX6vFJyMBLeD_AX6imNQRodV_X-QS54wAREA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 11, 2021 at 08:34:01PM +0100, Patrik Jakobsson wrote:
> Hi Al,
> The PCI device ID of 0x1570 in the bdc driver (bdc_pci.c) is
> conflicting with the Apple FacetimeHD webcam [1]. Is this caused by an
> incorrect ID in the bdc driver or are there actually two devices with
> the same ID in the wild? If we have a real conflict, how would we go
> about solving this?

Looks like someone at broadcom messed up :(

Can you look for any other fields in the device other than just the
vendor/device ids to verify that this really is a webcam so you can not
bind to the same thing this driver wants to bind to?

thanks,

greg k-h
