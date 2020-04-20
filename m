Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29BBA1B0770
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2020 13:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725896AbgDTLbJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Apr 2020 07:31:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:42846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725550AbgDTLbI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Apr 2020 07:31:08 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2AF8A206D4;
        Mon, 20 Apr 2020 11:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587382268;
        bh=MiPGi8x6gWcH2yP0JRVYh+SSTCw+J+u9dpgjEbguIVk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T/gFi+XJv4zZjrSneSqrLxvoUl4+ObQhc62wBDfmWMTF8vuifBlqL4pGJ8UkjIfpP
         f5Nb8BMYBwPZRugxDU8Smg4DonEu9jcpr35bQgRtU/064NiQUlJfrH4bw/4EoFWUwj
         utFBxxR/f3HqdPANHVWW8Qm08gr2FpDHNHnB7VVI=
Date:   Mon, 20 Apr 2020 13:30:53 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB fixes for v5.7-rc2
Message-ID: <20200420113053.GB3863657@kroah.com>
References: <87eesjdibn.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eesjdibn.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Apr 19, 2020 at 10:51:24AM +0300, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> here's the first pull request for the current -rc cycle. Patches have
> been in next for a few days without any new reports.
> 
> Let me know if you want anything to be changed.
> 
> Cheers
> 
> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:
> 
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/fixes-for-v5.7-rc2

Pulled and pushed out, thanks.

greg k-h
