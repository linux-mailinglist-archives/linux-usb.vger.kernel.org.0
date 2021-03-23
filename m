Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C04D345D5C
	for <lists+linux-usb@lfdr.de>; Tue, 23 Mar 2021 12:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbhCWLwx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Mar 2021 07:52:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:56102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229482AbhCWLwT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Mar 2021 07:52:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B04A261920;
        Tue, 23 Mar 2021 11:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616500339;
        bh=0OYHxTa5Y2TXmyi7zuGmZnKLO1+yL/4cS2olGQC/eo4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IIYHsu86V7jvpk0XMlB2YDQOtmRyeoLlJAaW1srVlUqahTBnpTVY1xMADWCMMB2e2
         KlPO2nvNJs7Dp9ZuVCSpW2agDiBbKgzIL7QZipCeewht65tzdvXGiht4233bgLjkA9
         IZ2E1GCN0vgmqKz1zR77jP6PiWrb0HguGWcK1wUs=
Date:   Tue, 23 Mar 2021 12:52:16 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: core: don't enable wakeup for runtime PM
Message-ID: <YFnWcPqua4burARj@kroah.com>
References: <1614767857-12723-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614767857-12723-1-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 03, 2021 at 06:37:37PM +0800, Li Jun wrote:
> Don't enable dwc3 core to wakeup system by default if runtime suspended,
> this will make the power domain of dwc3 core or its parent device can't be
> off while system sleep even system wakeup by usb is not required.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---

What commit does this fix?  Does it need to go to stable kernels?  If
so, how far back?

Please add that information to the signed-off-by area when resending.

thanks,

greg k-h
