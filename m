Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C50B1E1F8D
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2020 12:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731824AbgEZKVK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 May 2020 06:21:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:47986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726944AbgEZKUs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 May 2020 06:20:48 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 07094207CB;
        Tue, 26 May 2020 10:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590488448;
        bh=+sS0x47VC8tc/gMC26iNWscSpkNh5zLw45Bbs8WET18=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cO8HxD7NBhSqgNJvr5CcgjXdPVhvI1i5O3ygQwcDRi69UlzBZsyKwkUCcNyc/GNbG
         6/+OPA9BnHRtOq+Rb6byTcxdFptDCw/uuHVxY8xw2B2x/cU7dwmSLDzXiX9dxJ1RNy
         m4BT5NhFXQzABaTbxKs4Ju+9q/LmTATOft7wNTEM=
Date:   Tue, 26 May 2020 12:20:38 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v5.8 merge window
Message-ID: <20200526102038.GA2760432@kroah.com>
References: <20200526091323.GH247495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526091323.GH247495@lahna.fi.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 26, 2020 at 12:13:23PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:
> 
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.8

Pulled and pushed out, thanks,

greg k-h
