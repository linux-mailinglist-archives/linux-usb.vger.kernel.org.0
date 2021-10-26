Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 027BC43AC50
	for <lists+linux-usb@lfdr.de>; Tue, 26 Oct 2021 08:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233057AbhJZGfc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Oct 2021 02:35:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:54440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229635AbhJZGfb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 Oct 2021 02:35:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2534461074;
        Tue, 26 Oct 2021 06:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1635229988;
        bh=ypzPYiTbFuer0D9M3tg5zBboP11PtYw5ybkKP9hMJGQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QSLcISr4B1oj1xQyI+ja1PZHfWxqkHqFighbp2GAPLDQ9z2HmbzeKOhK4fpBww/Dd
         9aqzssxiFdEIt1PZd1iQmk3Naf1V3lizY8jLk64vfStRQc0Eqh4S2bfN3I+AzgErsL
         oHGf3ZnpoNdHINywsLt7lu+906YXvzCrfjnJt3P0=
Date:   Tue, 26 Oct 2021 08:33:06 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Jack Pham <jackp@quicinc.com>
Subject: Re: [PATCH v13 2/2] usb: gadget: configfs: add trace events
Message-ID: <YXehIjnJAcswRCkl@kroah.com>
References: <1635229309-2821-1-git-send-email-quic_linyyuan@quicinc.com>
 <1635229309-2821-3-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635229309-2821-3-git-send-email-quic_linyyuan@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 26, 2021 at 02:21:49PM +0800, Linyu Yuan wrote:
> in case of USB Gadget functions configure through configfs from
> a complicated user space program, when switch function from one to another,
> if it failed, it is better to find out what action was done to configfs
> from user space program.
> 
> this change add some trace events which enable/disable a function,
> it including add/remove configuration function, bind/unbind UDC,
> and some attribute files write operation.
> 
> Suggested-by: Felipe Balbi <balbi@kernel.org>
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>

Can you break this up into "one patch per trace event"?  That would make
it easier to review and for you to be able to document the locking
issues here better.

thanks,

greg k-h
