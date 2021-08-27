Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C3D33F95E1
	for <lists+linux-usb@lfdr.de>; Fri, 27 Aug 2021 10:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233149AbhH0IV3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Aug 2021 04:21:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:41982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232127AbhH0IVV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Aug 2021 04:21:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE9F160F4F;
        Fri, 27 Aug 2021 08:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630052432;
        bh=ginYnesuiXbw9fWkzEuHhsrBXTtP/DBfnve1+vcEO8s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZhSKVEfD4lAKC7B0rFULM9SflAsvxIhGl0H00nbVv8quJdcb6iP4FQ31vA9dgY7rr
         vglps7EubIJEL1NLI9S/aJf4yJRrHm58R/0wvSlbg5MEvogI3sd3NWuOONKmb9OWAB
         G3/5D6cGp/vSWC8H8BVlfHfACzL4pukxC6XCZ2K0=
Date:   Fri, 27 Aug 2021 10:20:24 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] usb: changes for v5.15-rc1
Message-ID: <YSigSLD9PxpqkcRd@kroah.com>
References: <20210826224713.GA4335@Peter>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826224713.GA4335@Peter>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 27, 2021 at 06:47:13AM +0800, Peter Chen wrote:
> 
> The following changes since commit e4788edc730a0d2b26e1ae1f08fbb3f635b92dbb:
> 
>   USB: EHCI: Add alias for Broadcom INSNREG (2021-08-18 22:28:28 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.15-rc1

Pulled and pushed out, thanks.

greg k-h
