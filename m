Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58776122818
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2019 10:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbfLQJ7P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Dec 2019 04:59:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:46558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727112AbfLQJ7P (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 17 Dec 2019 04:59:15 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3ACEA20733;
        Tue, 17 Dec 2019 09:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576576754;
        bh=ZN3Ga9G/ygIWfVrBJjvaxT95lvdW3uXSv/t6kB5w77A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2abr0vZ4XYdBT9uYdc2GeGW0DL5HV3Z1EwMzty0dKRxcj+aH6SeL0nwD0PwFYOKah
         /H4wDqEK+YZEUw/8y9D0+r3tZ9kYQwIftf0IqbNhybec1Vwhm6H7LsuGJIecHpQqjI
         Xzj8VdMyE1hPrnWUeW51S5N4zwe5XDm31uUpboqU=
Date:   Tue, 17 Dec 2019 10:59:11 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     b-liu@ti.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: musb: Remove unnecessary check of musb->hcd in
 musb_handle_intr_connect()
Message-ID: <20191217095911.GA2807137@kroah.com>
References: <20191217095023.6878-1-baijiaju1990@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191217095023.6878-1-baijiaju1990@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 17, 2019 at 05:50:23PM +0800, Jia-Ju Bai wrote:
> In musb_handle_intr_connect(), musb->hcd should be non-null, 
> so the check of musb->hcd on line 783 could be dropped.

Have you verified that this is always the case?  How did you do that?

thanks,

greg k-h
