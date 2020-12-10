Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 541742D5719
	for <lists+linux-usb@lfdr.de>; Thu, 10 Dec 2020 10:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbgLJJ0d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Dec 2020 04:26:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:38570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727287AbgLJJ0d (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Dec 2020 04:26:33 -0500
Date:   Thu, 10 Dec 2020 10:27:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607592352;
        bh=m8mIhjbEFu0q428PtIPSuJ+C1AuPiN8P/N7WwGh85Mc=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y9R1ALiGzx3TmmtoA/Qe9QkUW7tymiVLZiPLg6dnteu5LZs6riwbSGU4OCTcf35YG
         xagfsoYhdyfYVCHlrcHQ8pq8jCdmz/niCXwYdaey7ocnG4unL4v8Njp2z1acg/1zHa
         TL7baWk0MY7DKk7ol+FiOMWUVONUp7lh19RL0LsU=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [GIT PULL] usb: changes for v5.11-rc1
Message-ID: <X9Hp6/9j/UCNxZKk@kroah.com>
References: <DBBPR04MB79797539F005D75D9717E0D28BCB0@DBBPR04MB7979.eurprd04.prod.outlook.com>
 <X9Hpn6mJhrjGUp7b@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X9Hpn6mJhrjGUp7b@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 10, 2020 at 10:25:51AM +0100, Greg Kroah-Hartman wrote:
> On Thu, Dec 10, 2020 at 01:12:21AM +0000, Peter Chen wrote:
> > The following changes since commit b65054597872ce3aefbc6a666385eabdf9e288da:
> > 
> >   Linux 5.10-rc6 (2020-11-29 15:50:50 -0800)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.11-rc1
> 
> Pulled and pushed out, thanks.

Oops, no, it fails my push tests with the following error:
Commit: 107000a83af0 ("usb: cdns3: fix NULL pointer dereference on no platform data")
	Fixes tag: Fixes: a284b7fd1b8f ("usb: cdns3: add quirk for enable runtime pm by default")
	Has these problem(s):
	        - Target SHA1 does not exist

Can you fix that up please?

thanks,

greg k-h
