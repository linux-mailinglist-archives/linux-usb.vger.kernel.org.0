Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0FC316999
	for <lists+linux-usb@lfdr.de>; Wed, 10 Feb 2021 16:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbhBJO73 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Feb 2021 09:59:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:43002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231822AbhBJO7X (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Feb 2021 09:59:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDD5064E7C;
        Wed, 10 Feb 2021 14:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612969122;
        bh=mY0WsY8fpEq1ndGykFzFn2IDDdLARQy0kR0xvDlWxRw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s2eYfX/TNucA6E2Bu27bvG/486vt/Z+xyHnVJO34zBuscEtTZodB5sJavFAFw/Vdl
         EqOteyU0465bTKdSY29PFilMRD5bXt+CHi1BuOCiM/yZyVoftb9jemcO18hgMaqFy6
         3BW3ukdVhinVO4WcrnCMSccfliq3BybFwkIzdwbk=
Date:   Wed, 10 Feb 2021 15:58:30 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial updates for 5.12-rc1
Message-ID: <YCP0lhv2hIINVC1T@kroah.com>
References: <YCPzc8F35NMwRKQu@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCPzc8F35NMwRKQu@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 10, 2021 at 03:53:39PM +0100, Johan Hovold wrote:
> Hi Greg,
> 
> Here are the USB-serial updates for 5.12-rc1.
> 
> Note that the new MaxLinear/Exar driver can also be used (with fewer features)
> in ACM-mode so this pull-request includes a commit to prevent cdc-acm from
> binding when the new driver is enabled.
> 
> Johan
> 
> 
> The following changes since commit 7c53f6b671f4aba70ff15e1b05148b10d58c2837:
> 
>   Linux 5.11-rc3 (2021-01-10 14:34:50 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.12-rc1

Pulled and pushed out, thanks.

greg k-h
