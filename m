Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9247432E4A8
	for <lists+linux-usb@lfdr.de>; Fri,  5 Mar 2021 10:22:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbhCEJWU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Mar 2021 04:22:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:36064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229464AbhCEJVp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Mar 2021 04:21:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 014CF64F6A;
        Fri,  5 Mar 2021 09:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614936105;
        bh=SD0WhBOHeRbSh9fu6BV2L24sLHa9PlGGrZOuf4HAoG8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kis0HK/210ovcAnII2ewuEMSkN9flm3yp7bT0ox91y26o0DzV/K/mBkOIoAK3aR5Z
         uHxyGhL3LDfjPJ3IwKq4oavf79Gd6Kw7q/svUytjWQp5fvb6iYki0/1yyaReslFE0q
         YE5GJ4B5Bq0DufdDk33+tQyxz8hha6/WYHtLxeRKyCQmh1OBxIZRb0p+W5nWRPeNGa
         jY8VNxNTkogYE3kT0s8GorEZZYG6k/m/MLSyhGIrSginpAtNd0L/t0UT0ted+wXJzl
         u4DUGts5u2mKOzfbV0glqsPVwtq6fzowL8tyfGqkc4OK96LenuYmtCL9fHZgP3yYlU
         FMa+yLUv4RVwQ==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lI6el-0007nB-Gv; Fri, 05 Mar 2021 10:21:59 +0100
Date:   Fri, 5 Mar 2021 10:21:59 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Niv Sardi <xaiki@evilgiggle.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] USB: serial: ch341: add new Product ID
Message-ID: <YEH4N14ChlHizUiD@hovoldconsulting.com>
References: <20210301201612.10867-1-xaiki@evilgiggle.com>
 <20210301201612.10867-2-xaiki@evilgiggle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301201612.10867-2-xaiki@evilgiggle.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 01, 2021 at 05:16:12PM -0300, Niv Sardi wrote:
> Add PID for CH340 that's found on cheap programmers.
> 
> The driver works flawlessly as soon as the new PID (0x9986) is added to it.
> These look like ANU232MI but ship with a ch341 inside. They have no special
> identifiers (mine only has the string "DB9D20130716" printed on the PCB and
> nothing identifiable on the packaging. The merchant i bought it from 
> doesn't sell these anymore).
> 
> the lsusb -v output is:
> Bus 001 Device 009: ID 9986:7523  

> Signed-off-by: Niv Sardi <xaiki@evilgiggle.com>

Thanks for the update. Now applied and tagged for stable.

Johan
