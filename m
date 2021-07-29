Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC133D9DC9
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jul 2021 08:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234283AbhG2Go6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Jul 2021 02:44:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:39060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234079AbhG2Go5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Jul 2021 02:44:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C26636103A;
        Thu, 29 Jul 2021 06:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627541094;
        bh=/bxqOAV+0acTE5ZY3raucbHWGgx0b3x+o6dyFvFri9U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LvjB47vQwtkbFNoxsmLY6cOmpK0k9uFV+3PhwrtTMtWAcpt/aAvzmOtTs6vr3gP4d
         6/8JRX4DhCbK0QTpvvozeZeSZLeeNMScwAu0RFrgeQYeE2FCj2IzHqLB+fLWGzQc8s
         fiIaYfuFSZYCmpjs93txP00QOurdhoJUslwmC0ho=
Date:   Thu, 29 Jul 2021 08:44:48 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] usb: fixes for v5.14-rc4
Message-ID: <YQJOYIEfqXnEBS5Q@kroah.com>
References: <20210729063702.GA28130@nchen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729063702.GA28130@nchen>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 29, 2021 at 02:37:02PM +0800, Peter Chen wrote:
> The following changes since commit ff1176468d368232b684f75e82563369208bc371:
> 
>   Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.14-rc4
> 

Pulled and pushed out, thanks.

greg k-h
