Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24695200286
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 09:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729888AbgFSHJQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jun 2020 03:09:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:51340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727096AbgFSHJP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Jun 2020 03:09:15 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CC91D20885;
        Fri, 19 Jun 2020 07:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592550555;
        bh=7vLq9k86D0t1kk12AhQU4ptqPgt3dMPPfZGCY+OCNZg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S5+v0R1D7BRVZxGVLTLvhwDslLxdRh8VRGPgXiQriYR13re0yGTZfe+RQ4wrf+0Ad
         SwlC9ooag15G4+e7cOVVUKCzHLkyemAJbuXRh0qfOh0SY/EgCQR9B01CUnQ/wn5tFM
         ka5xb1q+bhiQIAb/TJ83h940ujKI8+PMG1h0ly90=
Date:   Fri, 19 Jun 2020 09:02:30 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Changming Liu <charley.ashbringer@gmail.com>
Cc:     linux-usb@vger.kernel.org, thomas@winischhofer.net,
        Changming Liu <liu.changm@northeastern.edu>
Subject: Re: [PATCH 1/4] USB: sisusbvga: change sisusb_write_mem_bulk
Message-ID: <20200619070230.GA543568@kroah.com>
References: <1592526534-1739-1-git-send-email-liu.changm@northeastern.edu>
 <1592526534-1739-2-git-send-email-liu.changm@northeastern.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592526534-1739-2-git-send-email-liu.changm@northeastern.edu>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 18, 2020 at 08:28:51PM -0400, Changming Liu wrote:
> isusb_write_mem_bulk calls sisusb_send_bulk_msg and
> is called by sisusb_write.
> Changed their parameters accordingly.

Accordingly to what?  The subject just says "change", it does not say
what any of this was changed to here.

> 
> Also change the local buf[4] of sisusb_write_mem_bulk
> to u8. This fixed a potential undefined behavior.

Shouldn't this be a separate patch so that I could be backported to
older kernels as it would fix a potential issue?

When you have "also" in a patch description, it almost always means you
should split the patch up into multiple changes.

> 
> Signed-off-by: Changming Liu <liu.changm@northeastern.edu>

This email address doesn't match the "From:" line :(

thanks,

greg k-h
