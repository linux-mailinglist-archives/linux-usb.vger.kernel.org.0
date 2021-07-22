Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A57E83D1F26
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jul 2021 09:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbhGVHAe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jul 2021 03:00:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:58930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229547AbhGVHAd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Jul 2021 03:00:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 24B326023B;
        Thu, 22 Jul 2021 07:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626939669;
        bh=vbb1dIDRz1CDgPKXNckpRGk1ns3L2l9b4XEpauAF2Y8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QPjT502/LaykmLl8OP2ku1Xm2UyOGtFvVE4YKjP5sfSkEQzJfPcO2RetY42Vie9hl
         Y4b3mDsbu4+aDwTxE8PK0UkxPjc0fkbIqwU5x6I6VWznqrBoocCTuatRvpah1g1p2i
         7cLQEMTReiEntWT3qg22N+6crqkMrFulfPuChrYsyswfL9kh9A1nHSWXj6NLgANc2A
         7ISnJTEe9VcMuJKaBFsCsIZ6KLBvKWkuSm3mObTJLIH+rKMgAodoiNt9KdWdMgPWzz
         w9HwB6vfiEkj+nKVB/jeTWdCysHxxT+efpyZqXIz8Mr4w8GJIbvnAotW0sPrEfxsVV
         TFQTv+XwR3q/A==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1m6TJy-00042o-E0; Thu, 22 Jul 2021 09:40:42 +0200
Date:   Thu, 22 Jul 2021 09:40:42 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        =?utf-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Subject: Re: [PATCH] USB: serial: pl2303: Add new PID to support PL256X
 (TYPE_MP)
Message-ID: <YPkg+lzSPxFdWzhZ@hovoldconsulting.com>
References: <20210622120906.743-1-charlesyeh522@gmail.com>
 <CAAZvQQ7af2zowxUr7UikPkQvBkcx7PFFey-fs1DixwwpWco5CA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAZvQQ7af2zowxUr7UikPkQvBkcx7PFFey-fs1DixwwpWco5CA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 22, 2021 at 01:16:36PM +0800, Charles Yeh wrote:
> Any update?

No, sorry. It's in my to-review queue.

Johan
