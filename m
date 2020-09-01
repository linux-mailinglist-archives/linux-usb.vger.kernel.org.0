Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB3CB258991
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 09:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbgIAHsg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 03:48:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:35574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726078AbgIAHsg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 03:48:36 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6D9F32068E;
        Tue,  1 Sep 2020 07:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598946516;
        bh=S+cnDQDUBEE6f1rAocaColK88rzxrNkJdb72+E1S8Y8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OcVjY2UFvO4yP8KTI0KlcYn+gKm2PmUHI1iksgPLeiAtJQuZp0K16jAupVKaNmVKC
         9uKzCWOOeMHYlN/nN4eeLw+3+nVowvuu+LL0VEoj/lx+WqOu87BUZ7fdB30aZDPwXT
         /ynFEPXVpt6hpNiS+ekjn+/GGgmY6rV8A90CI4fM=
Date:   Tue, 1 Sep 2020 09:49:04 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 fixes for v5.9-rc4
Message-ID: <20200901074904.GA110073@kroah.com>
References: <20200901073706.GS1375436@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901073706.GS1375436@lahna.fi.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 01, 2020 at 10:37:06AM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:
> 
>   Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.9-rc4

Pulled and pushed out, thanks!

greg k-h
