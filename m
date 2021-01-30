Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE2330950D
	for <lists+linux-usb@lfdr.de>; Sat, 30 Jan 2021 13:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbhA3MHv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 30 Jan 2021 07:07:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:59982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229636AbhA3MHt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 30 Jan 2021 07:07:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C075564E02;
        Sat, 30 Jan 2021 12:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612008429;
        bh=2PqeHQ/ex4/wF52yZ75ykHZ7/wU76S0g+zwZjDQV6c4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Mt2XJhoZZ6qAnxvlSCTo32vrTwbl0fu1LY9qya9s+rs1zur4HhxlVyhbOQBz8bN0/
         taE1O8aYC5ZqDIBnLE1OUEci9xsGrKoUIVvSbqSVf8mjIEOctB5zkMfTFpPRbpqB7I
         EnU5ORS4WI68jr84DFxFXZOV4dlmxLNOZrCyyGUM=
Date:   Sat, 30 Jan 2021 13:07:06 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 5.11-rc6
Message-ID: <YBVL6kbRJe+dZolj@kroah.com>
References: <YBVEs0w9H5xcvtC4@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBVEs0w9H5xcvtC4@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jan 30, 2021 at 12:36:19PM +0100, Johan Hovold wrote:
> Hi Greg,
> 
> Here are some new device-ids for -rc6 that I had meant to send you yesterday.
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
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.11-rc6

Pulled and pushed out, thanks!

greg k-h
