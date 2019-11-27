Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB1810B23C
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2019 16:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbfK0PRd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Nov 2019 10:17:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:45312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726673AbfK0PRd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 27 Nov 2019 10:17:33 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 748E6206F0;
        Wed, 27 Nov 2019 15:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574867852;
        bh=VIwNZ5WZ+q+sywxz/EPxt8SxSsZFfUCKD/MhWrYIx0I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iIirbHlVySiF86WP7KymrEZYKfhcOyOGGRnd9vuaI0/gcD2XJvqNQ4VhgmqTldbT0
         1F+ek9S+plataRnqjMpVKHiHOvxwNDAFJKSsRJCExjUm+8geGAaQz79y4TQcvrVUeD
         zdnH4pyTPPkx9L6IIc8NEdxk7o5PgrBzg/Pmt1fE=
Date:   Wed, 27 Nov 2019 16:17:30 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Emiliano Ingrassia <ingrassia@epigenesys.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: urb: explicitly initialize urb_list field in
 usb_init_urb()
Message-ID: <20191127151730.GA2775951@kroah.com>
References: <20191127151502.GA26047@ingrassia.epigenesys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191127151502.GA26047@ingrassia.epigenesys.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 27, 2019 at 04:15:02PM +0100, Emiliano Ingrassia wrote:
> Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>

I can not take patches without any changelog text, sorry.

ALways describe _why_ you are making this change, not what the change
it.

thanks,

greg k-h
