Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2904CCEE
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 13:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731687AbfFTLb0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 07:31:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:52410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726491AbfFTLb0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Jun 2019 07:31:26 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A6302083B;
        Thu, 20 Jun 2019 11:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561030285;
        bh=rwuwnxD5XeUr8SSjESiGHwacIBAnUSNKa0RY9y3M1jw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sJrc6xhb9okR58grn2UK4TuJ+tYSzuMVa+Pf725VWMKwKqt5WQ01CqxAMqwrTUjYt
         S6YXbmZDtv283qj6snKSZ1dbLFqX3f02fqEzgt25bnrEtLHLPHMh7zqprp9rrNyzPI
         imOlf5Yc0MHd0KKRuZcknWCt65rhPMlXgVeRe9Io=
Date:   Thu, 20 Jun 2019 13:31:23 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB: fixes for v5.2-rc5
Message-ID: <20190620113123.GA2275@kroah.com>
References: <87h88kbowy.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h88kbowy.fsf@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 20, 2019 at 12:13:01PM +0300, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> Just one pending fix this time.
> 
> Let me know if you need anything to be changed
> 
> cheers
> 
> 
> The following changes since commit 9e0babf2c06c73cda2c0cd37a1653d823adb40ec:
> 
>   Linux 5.2-rc5 (2019-06-16 08:49:45 -1000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/fixes-for-v5.2-rc5

Pulled and pushed out, thanks.

greg k-h
