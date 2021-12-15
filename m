Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9900F475B29
	for <lists+linux-usb@lfdr.de>; Wed, 15 Dec 2021 15:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243610AbhLOO52 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Dec 2021 09:57:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243671AbhLOO5Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Dec 2021 09:57:24 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D73CAC061574
        for <linux-usb@vger.kernel.org>; Wed, 15 Dec 2021 06:57:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 75DFD61880
        for <linux-usb@vger.kernel.org>; Wed, 15 Dec 2021 14:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55251C34604;
        Wed, 15 Dec 2021 14:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1639580242;
        bh=vb5GDA+WtqeA7swpCfAWVETXRpuBBbn/ZtsD55WjfEE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pYwtK6ExHNGpmr8Hnaj8kUhn1UsTlF8nh/T22Fj7np3I8mtIdaUDOYxL8JoKPTqJm
         RizSaGo+uq7khUp9WxPVr+jfwHbeISf4ZvXV/BXvHQPf/vsKlc69q+JU/6fpioDyaN
         /hmuNs9buGYWl4U5Gzvkwu2lQyuE1eMDiAxsRa6o=
Date:   Wed, 15 Dec 2021 15:57:19 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [RFC]How else could a malicious device sabotage endpoints for
 usbnet
Message-ID: <YboCTzOTp49HuCxa@kroah.com>
References: <ad1ee829-401a-d051-1da8-f9e01caa7b85@suse.com>
 <YbIlBl8Ay1rIED8p@kroah.com>
 <71bfdff1-61d0-881e-a201-e91920750648@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71bfdff1-61d0-881e-a201-e91920750648@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 15, 2021 at 03:47:55PM +0100, Oliver Neukum wrote:
> 
> On 09.12.21 16:47, Greg KH wrote:
> >
> > Why not use usb_find_common_endpoints() and/or the other helper
> > functions instead? that's what they were created for.
> 
> Hi,
> 
> which one would I use? In this case I already know the endpoints
> to be verified.

I have no context here so I have no idea, sorry.

greg k-h
