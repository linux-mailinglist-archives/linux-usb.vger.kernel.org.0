Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750D02D5842
	for <lists+linux-usb@lfdr.de>; Thu, 10 Dec 2020 11:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732060AbgLJKbM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Dec 2020 05:31:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:53730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727325AbgLJKbM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Dec 2020 05:31:12 -0500
Date:   Thu, 10 Dec 2020 11:31:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607596231;
        bh=5NR1iHtyrsbb2djIe+Xog0TajjTfaOsHYmpgA+glXCM=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=FVrj/ub6IHQhrCEVa69C2Noca/kg/HsC+Axq+/N9Rr0DNlpas3x551PRJNUl/MHS8
         i9YWVXV2HM6t/Z+YlaJD6Ex0Zbg3ie8X22pfzhTuRWS3cIhxxHHRAoYJWW3N8EmJP4
         wiECzh26fxJ6WGMERc46dRAmlFhZyX9xs1huvccs=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [GIT PULL] usb: changes for v5.11-rc1
Message-ID: <X9H5EoMhLSSP6v6/@kroah.com>
References: <DBBPR04MB79797539F005D75D9717E0D28BCB0@DBBPR04MB7979.eurprd04.prod.outlook.com>
 <X9Hpn6mJhrjGUp7b@kroah.com>
 <X9Hp6/9j/UCNxZKk@kroah.com>
 <20201210095432.GC2388@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210095432.GC2388@b29397-desktop>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 10, 2020 at 09:55:02AM +0000, Peter Chen wrote:
> On 20-12-10 10:27:07, Greg Kroah-Hartman wrote:
> > On Thu, Dec 10, 2020 at 10:25:51AM +0100, Greg Kroah-Hartman wrote:
> > > On Thu, Dec 10, 2020 at 01:12:21AM +0000, Peter Chen wrote:
> > > > The following changes since commit b65054597872ce3aefbc6a666385eabdf9e288da:
> > > > 
> > > >   Linux 5.10-rc6 (2020-11-29 15:50:50 -0800)
> > > > 
> > > > are available in the Git repository at:
> > > > 
> > > >   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.11-rc1
> > > 
> > > Pulled and pushed out, thanks.
> > 
> > Oops, no, it fails my push tests with the following error:
> > Commit: 107000a83af0 ("usb: cdns3: fix NULL pointer dereference on no platform data")
> > 	Fixes tag: Fixes: a284b7fd1b8f ("usb: cdns3: add quirk for enable runtime pm by default")
> > 	Has these problem(s):
> > 	        - Target SHA1 does not exist
> > 
> > Can you fix that up please?
> > 
> 
> Sorry.
> 
> Force pushed, please re-pull.

That worked, thanks!  Pushed out.

greg k-h
