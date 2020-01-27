Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB3F149F2B
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2020 08:18:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgA0HSB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jan 2020 02:18:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:60244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725775AbgA0HSB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Jan 2020 02:18:01 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5EEB2214AF;
        Mon, 27 Jan 2020 07:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580109480;
        bh=s2Rk+2y+6lqG/vQH37ccQZj5U2rayUFsZ89P3cfYaXU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KZTIb29b2fCQLTNTSXKg0Bp3Jnt7VQdIE/iSTZi+pCUkpI9arlpOnM3dOSeZbmIGq
         9zOxoO/TI4Xa+ogIcQfvUfgFbfbd1/K5MaYt2WAFMmowtjr7VjlMzx3wvziuLS6mwv
         8Z/8R/9kJ6T7itijO5nJGH6409qDQeisYr65axtg=
Date:   Mon, 27 Jan 2020 08:17:58 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        Thierry Reding <treding@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] usb: chipidea: tegra: fix hardlock with invalid dr mode
Message-ID: <20200127071758.GD279449@kroah.com>
References: <20200127023548.27107-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200127023548.27107-1-pgwipeout@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 26, 2020 at 09:35:48PM -0500, Peter Geis wrote:
> The ci_hdrc_tegra driver does not currently support dual role mode, but
> it does not explicitly prevent its use.
> Certain devices support dual role mode, but not automatic role switch.
> This can cause the device to lock up during initialization of the
> driver.
> 
> Detect this state by checking for the extcon phandle when dual role mode
> is set to otg.
> If it doesn't exist request the driver to only enable manual role
> switching.
> 
> Fixes: dfebb5f ("usb: chipidea: Add support for Tegra20/30/114/124")

Please use 12 digits for kernel sha1 values, this should be:
Fixes: dfebb5f43a78 ("usb: chipidea: Add support for Tegra20/30/114/124")

As proof of the need of this, just using the values you gave here causes
git to complain:

$ git show dfebb5f
error: short SHA1 dfebb5f is ambiguous
hint: The candidates are:
hint:   dfebb5f43a78 commit 2017-08-16 - usb: chipidea: Add support for Tegra20/30/114/124
hint:   dfebb5fec744 tree
fatal: ambiguous argument 'dfebb5f': unknown revision or path not in the working tree.

thanks,

greg k-h
