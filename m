Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6266197B72
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2020 14:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730007AbgC3MCK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Mar 2020 08:02:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:48350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729669AbgC3MCK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Mar 2020 08:02:10 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0866020716;
        Mon, 30 Mar 2020 12:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585569729;
        bh=47YsEWohAAs8MnT+k+kCYLDngMt9bFmeSZqLlVeipBE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s+OkQu9Gxp3v9mVaZy+WheTLpcDUNSzWO04A1k4JJdtMtmhosdksnERIsGCBI3HGR
         z4R9rqs5dIVOjhdqzHZMCbQitophlX/XAvaL3+9ercT7sNKyLwn0um85JWEqylyg48
         RYYcN/z48VYK1n+rlBHKSFHvFKbQKd/gms59EfCA=
Date:   Mon, 30 Mar 2020 14:02:07 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     madhuparnabhowmik10@gmail.com
Cc:     hariprasad.kelam@gmail.com, colin.king@canonical.com,
        tony.olech@elandigitalsystems.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, andrianov@ispras.ru
Subject: Re: Possible data-race related bug in u132_hcd module.
Message-ID: <20200330120207.GA2807@kroah.com>
References: <20200330115243.11107-1-madhuparnabhowmik10@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200330115243.11107-1-madhuparnabhowmik10@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 30, 2020 at 05:22:43PM +0530, madhuparnabhowmik10@gmail.com wrote:
> Hi,
> 
> This bug is found by� Linux Driver Verification project (linuxtesting.org).
> 
> The bug is related to the parallel execution of u132_probe() function and�u132_hcd_exit() function in u132_hcd.c. In case the module is unloaded when the probe function is executing there can be data race as the mutex lock�u132_module_lock is not used properly.�

Please note that module unloading, while a nice thing to have, is never
something that happens automatically :)

> i) Usage of mutex lock only when writing into the u132_exiting variable in�u132_hcd_exit(). The lock is not used when this variable is read in�u132_probe().
> 
> Moreover, this variable does not serve its�purpose, as even if locking�is used while the u132_exiting variable is read in probe(), the function may still miss that exit function is executing if it acquires the mutex before exit() function does.
> 
> How to fix this?
> 
> ii) Usage of mutex while adding entries in�u132_static_list in probe function but not in exit function while unregistering.
> This should be easy to fix by holding the mutex in the exit function as well.
> 
> There can be other synchronization problems related to the usage of u132_module_lock in this module, I have only spotted these so far.
> 
> Please let me know if this bug report is helpful and I can send a patch fixing it.

Please just send a patch, no need to ever ask if you should, that's the
best way to report and fix anything.

thanks,

greg k-h
