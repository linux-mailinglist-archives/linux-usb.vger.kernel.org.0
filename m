Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4212A43749E
	for <lists+linux-usb@lfdr.de>; Fri, 22 Oct 2021 11:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbhJVJWB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Oct 2021 05:22:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:49592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231563AbhJVJWA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 Oct 2021 05:22:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF5F2610CB;
        Fri, 22 Oct 2021 09:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634894383;
        bh=vS+ZcXhadhA9wYQz8FyXx/08hM//YJdKTB2WtsxECTc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kjqEC0WgL7ylQPz06/hz7mNklglTKg5oMHuSHPmJ9wd8CJ2LIF3v4ZhbcNbSVdsn6
         TgQw3RrgU3NPlb81n2zecEQIQ3omcNNmDd3DWnEmrfu4GACgY2kwaRgKTG4I83vraU
         DIjfb5ZHxdALJVw2mfJbfiFviCKLdNuOZ97/1d0w=
Date:   Fri, 22 Oct 2021 11:19:41 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Jack Pham <jackp@quicinc.com>
Subject: Re: [PATCH v12 0/4] usb: gadget: configfs: add some trace event
Message-ID: <YXKCLeqPO07TmKZ5@kroah.com>
References: <1634649997-28745-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1634649997-28745-1-git-send-email-quic_linyyuan@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 19, 2021 at 09:26:33PM +0800, Linyu Yuan wrote:
> this series make some minor change to gadget configfs and
> add some important trace event from configfs layer.
> 
> follow suggestion from Felipe Balbi in link below,
> https://lore.kernel.org/linux-usb/1629777281-30188-1-git-send-email-quic_linyyuan@quicinc.com/

I've applied the first 2 patches here, as they are nice "cleanup"
changes.  But I had a problem with patch 3, and I need others to help
review patch 4 so I can not take them at this point in time yet.  Feel
free to rebase the remaining patches on my tree so you no longer have to
send the first 2 anymore.

thanks,

greg k-h
