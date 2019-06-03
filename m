Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E08B7330B9
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2019 15:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbfFCNNB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jun 2019 09:13:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:49796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726516AbfFCNNB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 Jun 2019 09:13:01 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AB29123B99;
        Mon,  3 Jun 2019 13:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559567581;
        bh=4NtdTAiGIqSpx4dui8ZWEsBxo33REFKNEyV+SgeL3mQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dGYoY7GS/OyBryNXuOvinx8CsSUp7F3Q8uzH52hqoh/LfBlIyKAT69gQ9Oh282u49
         FmOo7odckeTm4ZcnNOIRASVBTIfc6MNw8AcREWwXijfTP07IIDjvucY710uBGRlHhz
         3zUgLqtL0ZrUbuAZupHhCeM4aUlBLLEPBnS7g5hk=
Date:   Mon, 3 Jun 2019 15:12:58 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Vladimir Yerilov <openmindead@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: kernel NULL pointer dereference, ucsi bug
Message-ID: <20190603131258.GA10397@kroah.com>
References: <CAB31r6U3Ha+JrbjGC+wKj-+gJfQ7dk+LSoL1n0tQBxVTPb2mRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB31r6U3Ha+JrbjGC+wKj-+gJfQ7dk+LSoL1n0tQBxVTPb2mRQ@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jun 02, 2019 at 09:24:43PM +1000, Vladimir Yerilov wrote:
> Good day,
> 
> There's a problem with ucsi starting from 5.2-rc1 (maybe earlier
> versions of 5.2 are affected too).
> Recently I've tried these versions of rc3 (commits), all have this issue:
> 3ab4436f688c2d2f221793953cd05435ca84261c (05/31)
> 3ea3091f1bd8586125848c62be295910e9802af0
> cd6c84d8f0cdc911df435bb075ba22ce3c605b07 (rc2)

Can you run 'git bisect' to see what the exact offending patch is?

thanks,

greg k-h
