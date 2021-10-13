Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C725C42B811
	for <lists+linux-usb@lfdr.de>; Wed, 13 Oct 2021 08:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238100AbhJMG4X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Oct 2021 02:56:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:42958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238039AbhJMG4W (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 Oct 2021 02:56:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C763660F11;
        Wed, 13 Oct 2021 06:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634108060;
        bh=UxvVOw3cDb3T2OuNSIqyJB6/Y7mQtARlpp0WI5M3FqU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BNWs0aaW4GF7KeORZBkZ5RQgc1FdfiP/kIX49cktFujWQAK76wjYwwfkC2BEZu7GT
         q2yR4nMjujq4V4lmsLw8uRw3I/uSZLfaWvZ0WEdysW2OMof4y91ywaGBRYjki2l0Ro
         eb/UO/AtW0OHn2oNzgGCRO9uxnsOwWnP7sZeSiEE=
Date:   Wed, 13 Oct 2021 08:54:17 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Yunhao Tian <t123yh.xyz@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: gadget: uac: fix indentation issues in UAC
 files.
Message-ID: <YWaCmVKjGCJRm4ED@kroah.com>
References: <20211012165314.338619-1-t123yh@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211012165314.338619-1-t123yh@outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 13, 2021 at 12:53:13AM +0800, Yunhao Tian wrote:
> From: Yunhao Tian <t123yh.xyz@gmail.com>
> 
> Fixes: 02de698 ("usb: gadget: u_audio: add bi-directional volume and mute support")
> Fixes: eaf6cbe ("usb: gadget: f_uac2: add volume and mute support")
> Fixes: 0356e62 ("usb: gadget: f_uac1: add volume and mute support")
> 
> Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>

I can not take patches with no changelog text at all, sorry.

Also, there does not need to be a blank line between "Fixes:" and your
signed-off-by.

Also, please make these all individual patches, one per driver.

thanks,

greg k-h
