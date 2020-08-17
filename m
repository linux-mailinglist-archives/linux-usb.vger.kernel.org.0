Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6627246E9B
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 19:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389037AbgHQRds (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 13:33:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:43526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389039AbgHQQuo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 12:50:44 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8BD4320674;
        Mon, 17 Aug 2020 16:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597683044;
        bh=s5Oj+XeTGUE01xwfHqWuxmOUt7veNln1nBx9Tynz1M8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HP1oekZMKqjR23k/tOMt0jQLwYtMcceC7FljK9yJ/l5xIz5Q6LipFXeHY/ws+Cmo5
         Y4oC+kJ04Npr87kCkfQABAF/MUDmt6DNLg1EGtcMi3+aeqZiKBEYcLVGBy5tV4LRTK
         H9QYKQBHxE5UhWwFUriS+t+u6nRPJYrT4FthuGKU=
Date:   Mon, 17 Aug 2020 18:51:03 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH v1 2/3] usb: early: xhci-dbc: Move cpu_to_le16_array() to
 core
Message-ID: <20200817165103.GC721399@kroah.com>
References: <20200817164226.49119-1-andriy.shevchenko@linux.intel.com>
 <20200817164226.49119-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817164226.49119-2-andriy.shevchenko@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 17, 2020 at 07:42:25PM +0300, Andy Shevchenko wrote:
> It's used in USB but it might be useful for other drivers as well.

Don't move it unless someone actually needs it.

> While at it, introduce a counterpart helper, i.e. le16_to_cpu_array().

Don't add something that no one uses, otherwise it will just be removed.

thanks,

greg k-h
