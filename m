Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4022303D7B
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jan 2021 13:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391383AbhAZMpY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jan 2021 07:45:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:50886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391070AbhAZKCf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 Jan 2021 05:02:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25293207B3;
        Tue, 26 Jan 2021 10:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611655300;
        bh=y1MOKASzLXlgv5G7Z2WdzbbQ7vAhq5jKKktHAEjEmOQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gpxee3bgMTnI9BbSPYoCB38fdhNoRnccEg7Je314xkCqZEky4Zfv0Tulvf4NqX3dd
         YLnmRY4Ds0nDQ4rCQVHg3EYtzNE70fioscJLZycCtMoPxHO+Y+TdGDJkpBy8R3ZBxs
         7ExB+HL/uYSx93v3famMEJVEz/dxayyut6oXGJr4=
Date:   Tue, 26 Jan 2021 11:01:37 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ray Chi <raychi@google.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, kyletso@google.com
Subject: Re: [PATCH] usb: dwc3: add EXPORT_SYMBOL_GPL for role init functions
Message-ID: <YA/ogYkHrbmd1Eyo@kroah.com>
References: <20210126094913.180945-1-raychi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126094913.180945-1-raychi@google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 26, 2021 at 05:49:13PM +0800, Ray Chi wrote:
> Currently, role init functions are used in dwc3 driver but
> can't be called from kernel modules.
>   dwc3_host_init
>   dwc3_host_exit
>   dwc3_gadget_init
>   dwc3_gadget_exit
>   dwc3_event_buffers_setup
>   dwc3_event_buffers_cleanup
> 
> If other kernel modules want to use these functions, it needs
> EXPORT_SYMBOL_GPL() to get compile pass.
> 
> Signed-off-by: Ray Chi <raychi@google.com>

What current kernel configuration fails without this patch applied?  I
don't see any in-tree users of this as a module that would break, or am
I missing something?

thanks,

greg k-h
