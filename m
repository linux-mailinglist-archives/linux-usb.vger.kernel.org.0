Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60705276BC
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2019 09:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbfEWHNn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 May 2019 03:13:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:33418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726070AbfEWHNn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 May 2019 03:13:43 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6C1CC204FD;
        Thu, 23 May 2019 07:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558595621;
        bh=5s3Xnoi8n/YoIdp6sApXC2R3J9NzVS5UQdxLrJ0OI4I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IYU0ChHRfzuUxiWBzETtWpW3ZEZBJb/AGSmLczUVPgkqB99i/0vj8Hh+Y4zwKjduv
         4AnjDm2L44Cpvwajy4K1bjzbWjUZMIm9/Ia17HOFtUeUgy6pYO75yQNcF1ukm+yGim
         UBx66S39/ltNq3Rw9gr+IytevBSu7fODqd0h8z2g=
Date:   Thu, 23 May 2019 09:13:39 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Shuah Khan <skhan@linuxfoundation.org>,
        kbuild test robot <lkp@intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [usb:usb-linus] BUILD REGRESSION
 c1a145a3ed9a40f3b6145feb97789e8eb49c5566
Message-ID: <20190523071339.GE24064@kroah.com>
References: <5ce58da9.6t2VRua3tVrRG+g+%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ce58da9.6t2VRua3tVrRG+g+%lkp@intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 23, 2019 at 01:58:01AM +0800, kbuild test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
> branch HEAD: c1a145a3ed9a40f3b6145feb97789e8eb49c5566  xhci: Use %zu for printing size_t type
> 
> Regressions in current branch:
> 
> drivers/usb/usbip/stub_dev.c:399:9: sparse: sparse: context imbalance in 'stub_probe' - different lock contexts for basic block
> drivers/usb/usbip/stub_dev.c:418:13: sparse: sparse: context imbalance in 'stub_disconnect' - different lock contexts for basic block
> drivers/usb/usbip/stub_dev.c:464:1-10: second lock on line 476
> 
> Error ids grouped by kconfigs:
> 
> recent_errors
> ├── i386-allmodconfig
> │   └── drivers-usb-usbip-stub_dev.c:second-lock-on-line
> ├── x86_64-allmodconfig
> │   ├── drivers-usb-usbip-stub_dev.c:sparse:sparse:context-imbalance-in-stub_disconnect-different-lock-contexts-for-basic-block
> │   └── drivers-usb-usbip-stub_dev.c:sparse:sparse:context-imbalance-in-stub_probe-different-lock-contexts-for-basic-block
> └── x86_64-allyesconfig
>     └── drivers-usb-usbip-stub_dev.c:second-lock-on-line


Shuah, I just got this new report from 0-day about your commit
0c9e8b3cad65 ("usbip: usbip_host: fix BUG: sleeping function called from
invalid context") that got added to my tree recently.  Can you look into
this to see if it is a real error caused by this commit, or just
something that has always been there?

thanks,

greg k-h
