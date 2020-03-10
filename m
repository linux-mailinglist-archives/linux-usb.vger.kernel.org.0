Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECDA21803C5
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2020 17:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgCJQnW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Mar 2020 12:43:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:49932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726269AbgCJQnW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Mar 2020 12:43:22 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 53B82222C3;
        Tue, 10 Mar 2020 16:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583858601;
        bh=QN+Nn0wub5z5OGxzCDr6NiKq7YjEHc+iEzQADjt+X9g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kNRXpKcZk+HVaMZCPjeK5UaI6fv7iW6hjzQ6KG3ZvT/tmSBK+CZEgB/4QQwNBfLEt
         CIqBLG1mHTjtHe2x8ZR90JsxIb2ituYmOWJUK/fkDmyUy0DetNIjfa59V9+BfpHA4f
         ovpNHlyKDUOIeOFWfglhlYq4lVkW/EpvH8DfP438=
Date:   Tue, 10 Mar 2020 17:43:19 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 fix for v5.6-rc6
Message-ID: <20200310164319.GB3430367@kroah.com>
References: <20200310143258.GX2540@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310143258.GX2540@lahna.fi.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 10, 2020 at 04:32:58PM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 98d54f81e36ba3bf92172791eba5ca5bd813989b:
> 
>   Linux 5.6-rc4 (2020-03-01 16:38:46 -0600)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-fix-for-v5.6-rc6

Pulled and pushed out, thanks.

greg k-h
