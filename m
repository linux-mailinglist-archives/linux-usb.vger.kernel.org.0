Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 858991346BA
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2020 16:52:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729000AbgAHPwk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jan 2020 10:52:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:51322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727090AbgAHPwk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jan 2020 10:52:40 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 65F2020705;
        Wed,  8 Jan 2020 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578498759;
        bh=z0DAOmoarMdPo1RhK4cV3iolw4ZJhiyYFlwy/zmFmE4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VeOFB9TGGdNZcB+3fkzLZQ8LtWanmHUMZwkLwxzcBm231R7EHIqlFvp67KrezxXr8
         r+ZfNJs5qlZ/r136/kgRw9vX6ac0pvdGbhyZcqrA14vfD39LMe9iWyGdeabU9nPeM4
         tHoSqz67KHn9dUGdxKRyLKa4R1tJgeig4qXsAKWg=
Date:   Wed, 8 Jan 2020 16:52:37 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: typec: ucsi: Actually enable all the interface
 notifications
Message-ID: <20200108155237.GA2451129@kroah.com>
References: <20200108131347.43217-1-heikki.krogerus@linux.intel.com>
 <20200108131347.43217-3-heikki.krogerus@linux.intel.com>
 <20200108152942.GE7440@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108152942.GE7440@kuha.fi.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 08, 2020 at 05:29:42PM +0200, Heikki Krogerus wrote:
> Hi Greg,
> 
> On Wed, Jan 08, 2020 at 04:13:47PM +0300, Heikki Krogerus wrote:
> > The notification mask was not updated properly before all
> > the notifications were enabled in ucsi_init().
> > 
> > Fixes: 71a1fa0df2a3 ("usb: typec: ucsi: Store the notification mask")
> 
> That commit (71a1fa0df2a3) is still in your usb-next branch, so this
> patch should also go only to your usb-next.
> 
> Sorry about the mix-up.

No problem, I'll split the two patches between my two branches, thanks
for the heads-up.

greg k-h
