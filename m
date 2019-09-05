Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29A39A9C84
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2019 10:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732051AbfIEIC6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Sep 2019 04:02:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:58190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732004AbfIEIC6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Sep 2019 04:02:58 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 108FE20644;
        Thu,  5 Sep 2019 08:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567670577;
        bh=loPApMHtsr7YLOScnae9H3FtiFSGX7MM7Bu5yWr/ni0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OahMX4ik2o/hW9HzBhS80eUze+MBCW4mSu64K81DjAD3Qq/TvtVvSa9ozRxOgm0fK
         wYAaLevovujg6W5azTqN3mNDopQZLRrS37vvI8l7HruXWYqFk5TfjCMntB8WZqIOug
         sw31PeCWmkUR2DOIqwfkmhY89DDDc7Ucl13C5G9U=
Date:   Thu, 5 Sep 2019 10:02:50 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [GIT PULL] usb: chipidea: changes for v5.4-rc1
Message-ID: <20190905080250.GA10642@kroah.com>
References: <20190905023123.GA13573@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190905023123.GA13573@b29397-desktop>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 05, 2019 at 02:31:14AM +0000, Peter Chen wrote:
> The following changes since commit cdfee5623290bc893f595636b44fa28e8207c5b3:
> 
>   driver core: initialize a default DMA mask for platform device (2019-08-22 09:41:55 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-ci-v5.4-rc1

Pulled and pushed out, thanks.

greg k-h
