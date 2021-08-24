Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 859A73F5F34
	for <lists+linux-usb@lfdr.de>; Tue, 24 Aug 2021 15:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237524AbhHXNdj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 09:33:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:58576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237539AbhHXNdi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Aug 2021 09:33:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B372E61248;
        Tue, 24 Aug 2021 13:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1629811974;
        bh=T15lDwR5Qve0kAiIkxlOApQzgsfxjPP6hSaFhzJ9Yk0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b7No88y+AtIV1TRkOT0opnmypuMUdAIKougJXvMy2LXduslmX2r9MVBR/iS9Put8l
         hVV/lmatVlsdPr/VnExtZJnDL4Q5+g1KvzaYJYJ2SYnjMdC5Cqsf+i0VRkHohMKz1e
         3Fy56KmjZw1KvHyuY/k2HqPRMATOAE9ILzjXP93o=
Date:   Tue, 24 Aug 2021 15:32:41 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v5.15 merge window
Message-ID: <YST0+QvaJZcqd4Kt@kroah.com>
References: <YSTSiJa0omQE/4lI@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSTSiJa0omQE/4lI@lahna>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 24, 2021 at 02:05:44PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit c500bee1c5b2f1d59b1081ac879d73268ab0ff17:
> 
>   Linux 5.14-rc4 (2021-08-01 17:04:17 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.15-rc1

Pulled and pushed out, thanks.

greg k-h
