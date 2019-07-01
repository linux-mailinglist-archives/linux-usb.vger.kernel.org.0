Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04269230F3
	for <lists+linux-usb@lfdr.de>; Mon, 20 May 2019 12:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731566AbfETKMN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 May 2019 06:12:13 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:37150 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730468AbfETKMM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 May 2019 06:12:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=MqrvqRAJlxcONvOERepJ1ia9im/zVqpqGszIN9wgOpo=; b=ZU0ytO4YuOP96ibdGXamVHekr
        uBSM7cCD4CWqHQfee0lTS97z/EH61ONs+mc6CZYtOT3GX7GdQmDV3ZCOxswvcWlCdcD5tUMAKf3lO
        8cpp0xOP8zB04CG4MxT6SoS91K/bYf1pOv70rCpVbLb80GTGRylJADjqzF3cgmEgHUCkxQGxvFu3x
        aOyZDtSq0VnBtTuwVqlvi3AyMOPs0BZtj5FOG+3gvaPGFhfapQUsk0j9OXJifHtQQuG53bi2iid/Q
        FTK3ijbqOwmRyAmwSPJpu/fnRPXmJu6s/sGdB6ZSVuyzXo7qkti7ONQZV6wv8/86V2mFIRECvY9P/
        aujbpJYRQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hSfH4-0003eI-EN; Mon, 20 May 2019 10:12:06 +0000
Date:   Mon, 20 May 2019 03:12:06 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Jaewon Kim <jaewon31.kim@gmail.com>, linux-mm@kvack.org,
        gregkh@linuxfoundation.org, Jaewon Kim <jaewon31.kim@samsung.com>,
        m.szyprowski@samsung.com, ytk.lee@samsung.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [RFC PATCH] usb: host: xhci: allow __GFP_FS in dma allocation
Message-ID: <20190520101206.GA9291@infradead.org>
References: <CAJrd-UuMRdWHky4gkmiR0QYozfXW0O35Ohv6mJPFx2TLa8hRKg@mail.gmail.com>
 <20190520055657.GA31866@infradead.org>
 <1558343365.12672.2.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558343365.12672.2.camel@suse.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 20, 2019 at 11:09:25AM +0200, Oliver Neukum wrote:
> we actually do. It is just higher up in the calling path:

Perfect!

> So, do we need to audit the mem_flags again?
> What are we supposed to use? GFP_KERNEL?

GFP_KERNEL if you can block, GFP_ATOMIC if you can't for a good reason,
that is the allocation is from irq context or under a spinlock.  If you
think you have a case where you think you don't want to block, but it
is not because of the above reasons we need to have a chat about the
details.
