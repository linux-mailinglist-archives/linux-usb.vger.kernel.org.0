Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 818FFCFD6A
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 17:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727536AbfJHPRd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 11:17:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:41090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725839AbfJHPRc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Oct 2019 11:17:32 -0400
Received: from localhost (unknown [89.205.136.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BAA87206C0;
        Tue,  8 Oct 2019 15:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570547852;
        bh=yO3/YnTbrpvm1pwhAE7ZWODMtp0oApfl+61PfYMZbpU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1ANvQNX4mX6bE2kkWK5RpB13tDQdk1EhCKhcbLWdtYQd+StSxYg8C3pv8VqS4m0ns
         1qyflCTfd6nzqTJJOy0nvRt10xCaeqHQmOmMTXDNpt/dg4OlLzdj8dtFmZUl2Ew+MW
         f3XKQOKnIUlbxkHHXmXaGpH05oDGBYiZfPGrlXxg=
Date:   Tue, 8 Oct 2019 17:17:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     David Heinzelmann <heinzelmann.david@gmail.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usb: hub: Check device descriptor before resusciation
Message-ID: <20191008151710.GA2872679@kroah.com>
References: <20191007153538.GA985210@kroah.com>
 <20191008080901.17628-1-heinzelmann.david@gmail.com>
 <20191008125546.GA2846493@kroah.com>
 <20191008161022.GA20011@dhe-pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008161022.GA20011@dhe-pc>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 08, 2019 at 06:10:22PM +0200, David Heinzelmann wrote:
> On Tue, Oct 08, 2019 at 02:55:46PM +0200, Greg KH wrote:
> > What happened to Alan's ack?
> > 
> 
> I'm not sure I'm allowed to add someone else's acked-by tag?  

If they provide it, and you don't change anything, then yes, you can.

> If so I will sent v5.

Please do.

thanks,

greg k-h
