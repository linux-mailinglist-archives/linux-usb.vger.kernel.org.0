Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7527188D77
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2020 19:53:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgCQSxB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Mar 2020 14:53:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:58534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726388AbgCQSxA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 17 Mar 2020 14:53:00 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 095AD20724;
        Tue, 17 Mar 2020 18:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584471180;
        bh=tlt64e3hqCs1XenxP9LdS1iW84lSBO9Hl6+u0rVFhuQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ddTTY+EOKN+afxIM7J611i075vFqVSxAPWNl/IGjiovefZWiN7DGzI5bZFad4xyG0
         VmAQyONi23SGog/JuZIh2v/LIf7d6YwG4ZRLb1vSSaIJRlrRujCJEoZ+ToSVrl/lzH
         /LBVT1awOqLNozWtgnPZUO5hh31Qq1hwO9PMFm18=
Date:   Tue, 17 Mar 2020 19:52:52 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v5.7 merge window
Message-ID: <20200317185252.GA1480055@kroah.com>
References: <20200317083930.GB2601@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317083930.GB2601@lahna.fi.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 17, 2020 at 10:39:30AM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:
> 
>   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.7

Pulled and pushed out, thanks.

greg k-h
