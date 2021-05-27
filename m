Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A689F393425
	for <lists+linux-usb@lfdr.de>; Thu, 27 May 2021 18:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236481AbhE0Qkr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 May 2021 12:40:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:60700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229977AbhE0Qkp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 May 2021 12:40:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5CFC661184;
        Thu, 27 May 2021 16:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1622133552;
        bh=dG4Uw05A/a++e2XbcEFFkAYC6rzX6kvj+xxdx5n6Vhc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WKyFjnzvlB6NbINELOfz5Fr8+CjibVT6RTzK/LrGVZBU79qpwR5DKCho2r7eMx8co
         P6YDjFsziX/CKyydu41TKeCo6kRz3vjYYk4aVmjK90OEX8lJhC8rBi/RjD92zM1axa
         Te/JBMz4MmVjxBl46CgG2LfWKZnq6igeDyki4tXI=
Date:   Thu, 27 May 2021 18:39:09 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Piyush Thange <pthange19@gmail.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: thunderbolt: Fixed Coding Style issues
Message-ID: <YK/LLbdUVpu+j2aj@kroah.com>
References: <20210527160456.28592-1-pthange19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527160456.28592-1-pthange19@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 27, 2021 at 09:34:56PM +0530, Piyush Thange wrote:
> Fixed coding style issues generated by checkpatch.pl with --strict option.

If you want to start doing coding style fixes, please start in
drivers/staging/ where they are welcome and expected.  Not in a
subsystem where you do not know if it's needed or not.

And note, using --strict outside of drivers/staging/ is almost never a
good idea, most of the time that work is not wanted, so watch out.

good luck!

greg k-h
