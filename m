Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80060162EC8
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 19:40:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgBRSk1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 13:40:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:60164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726548AbgBRSk0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Feb 2020 13:40:26 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BAD4E24654;
        Tue, 18 Feb 2020 18:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582051226;
        bh=QN8PvGUmdnqwqUO1DNccUDIaJziDm03uGotO+WGlbV0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ty7m6i5u/BkSWuFB0dlC1gd+6AcTgjrmAz5gZQEN7xWkDQFurltJCpHnIzIVtkWW1
         RAZKHKAwN7ot6Mblf98rmTw8ezTh22FQDEAFKRsi1BgNhhnKsuJHRNSzDzBM5RzaAj
         2n5d+gLqHxDRr29Ce2o65vOi+PW9xRpKJOGQyajA=
Date:   Tue, 18 Feb 2020 19:40:24 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 fix for v5.6-rc3
Message-ID: <20200218184024.GA2667292@kroah.com>
References: <20200218122900.GC2667@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200218122900.GC2667@lahna.fi.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 18, 2020 at 02:29:00PM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:
> 
>   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-fix-for-v5.6-rc3

Pulled and pushed out, thanks.

greg k-h
