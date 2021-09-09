Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9156404801
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 11:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbhIIJsL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 05:48:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:50258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233296AbhIIJsK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Sep 2021 05:48:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C84CD61101;
        Thu,  9 Sep 2021 09:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1631180821;
        bh=IeIl34G+4zJXdeYO6KwY3TwYftGDlNG2/wX6Cz/JieE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NBDLJUMqoPHKrQ4iqWyQkNoJulPC89s5fn3cxlgvf22ztVvsrnLrvCJ6Yg7zMHqnJ
         5PdSA7VZtT216pnAFaA5t5cGf8jK0ftx8gKFM+ndyQ6Zz97EBnPnC7zE0CWbi1E3CI
         2qMglZx6h7Yy8PO4ktV/PllxCsNLY8O645LRyvkQ=
Date:   Thu, 9 Sep 2021 11:46:58 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: gadget: clear gadget pointer after exit
Message-ID: <YTnYEp1e9TaSFGa6@kroah.com>
References: <1631179952-28023-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1631179952-28023-1-git-send-email-quic_linyyuan@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 09, 2021 at 05:32:32PM +0800, Linyu Yuan wrote:
> when do role switch from device to host mode,
> first disable device mode, currently there is no better way to
> confirm when gadget was complete removed.
> 
> change device release function to clear gadget pointer,
> this will confirm device stop complete when it is NULL.

Where is this check happening?  If there is nothing in the tree today
that checks for this, why is this needed?

Does this fix a specific commit in the past?  If so, what one?

thanks,

greg k-h
