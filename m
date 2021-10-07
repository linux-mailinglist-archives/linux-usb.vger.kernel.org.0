Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53CCA424CD2
	for <lists+linux-usb@lfdr.de>; Thu,  7 Oct 2021 07:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231945AbhJGFfd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Oct 2021 01:35:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:39400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229752AbhJGFfc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 7 Oct 2021 01:35:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A21D60FD7;
        Thu,  7 Oct 2021 05:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633584819;
        bh=MxFsxblgOCC7Soz0aoiJ79ggZ5jZ3TLA80YIUu+hMpQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PHG4KQJji0qKJrqBmfB/fy4NxlOOISQnKtniRQD33w3vk4LmKsH+PF+IqwIbhfW68
         zWWsJKisNHThliDqiDpaJnKOvYeBBtv03Ri/Vk3MMdbiNmmzoZ+a6k49W/iFVjPEo0
         DpOjdstcdK4V6Wvomudd1FIvRyOW3gav2jiLNBsA=
Date:   Thu, 7 Oct 2021 07:33:37 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Lars Gunnarsson <gunnarsson.lars@gmail.com>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v1 1/3] tools/usbip: support use case reconnect: prepare
Message-ID: <YV6GseUgazTkP7G8@kroah.com>
References: <20211006204817.GA43927@dell-precision-T3610>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006204817.GA43927@dell-precision-T3610>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 06, 2021 at 10:48:17PM +0200, Lars Gunnarsson wrote:
> This patch implements an usb monitor into libusbip to await usb events,
> example connect and disconnect.

No documentation anywhere in the code showing what this is and what it
is good for?

Please, if you are adding examples, make it obvious to others what they
are for.

thanks,

greg k-h
