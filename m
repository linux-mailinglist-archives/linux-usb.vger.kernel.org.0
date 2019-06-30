Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD9585B018
	for <lists+linux-usb@lfdr.de>; Sun, 30 Jun 2019 16:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbfF3OL5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 Jun 2019 10:11:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:51210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726509AbfF3OL5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 30 Jun 2019 10:11:57 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5F87420673;
        Sun, 30 Jun 2019 14:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561903917;
        bh=KTsucT/HPP6g/Z2CdzhpynATwVrtRjibL+RWPHXuwNI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ILh3fMbWfypKrrDYihos5vSQIJVYPDbmrV5ZcYHChCkbwpX9nqz7XkEzreQ1/pir+
         5U3BcoFlnw0EVI7TVythgNHfc0z30NMKrc0sdEbPPK0l7Z2irl0o+qOaArYE0ZCICv
         v0uuCVKvT5MjQn390dMG52p4+z1otso799mYheGs=
Date:   Sun, 30 Jun 2019 16:11:53 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     yuan linyu <cugyly@163.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] usb: core: message: remove memset in
 usb_get_descriptor()
Message-ID: <20190630141153.GB12904@kroah.com>
References: <20190629094410.9106-1-cugyly@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190629094410.9106-1-cugyly@163.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jun 29, 2019 at 05:44:10PM +0800, yuan linyu wrote:
> there is no need to clean buf at beginning of function,
> when below condition occur, the buf will be dirty again.
> if (result > 1 && ((u8 *)buf)[1] != type) {
> 	result = -ENODATA;
> 	continue;
> }
> 
> return negative result means buf is not valid.

Yes, but why is removing the memset a required thing?  What bug is this
solving?  What speed improvement can be seen by this change?  Are you
_sure_ that no code is relying on the fact that the buffer is cleaned
out before sending the message and needs it to be zero terminated?

We added that memset for a reason all those years ago, to just remove it
now without a really good reason is worrying.

thanks,

greg k-h
