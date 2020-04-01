Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ACBE19A660
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 09:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732025AbgDAHiK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Apr 2020 03:38:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:57566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731968AbgDAHiJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Apr 2020 03:38:09 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 921DA2078B;
        Wed,  1 Apr 2020 07:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585726689;
        bh=z0JdJZOZSxdnr3voe8jzcJ4xgAr5ra1NQ0R36Zt8HnA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=syEnZiazXhPzFRTst7UHEAfNC9nfae+Rlpuw7KRmbUD7bAOZnDXbZX+ztCQI1N4Lu
         14dUG7DFptY3SXyrURQYmWVay0NWbbM5GR6As7w4UXHSd5wZiLnpqh+Oe+NWxqZ1d8
         k7Ht1z/Ef4uKkEKxmf1Y7ugSEjycyMjCTHiD7RZI=
Date:   Wed, 1 Apr 2020 09:38:06 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/7] Universal Serial Bus: Removing Acronyms
Message-ID: <20200401073806.GA2019004@kroah.com>
References: <20200401073249.340400-1-balbi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401073249.340400-1-balbi@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 01, 2020 at 10:32:42AM +0300, Felipe Balbi wrote:
>  764 files changed, 86304 insertions(+), 86304 deletions(-)

Ah, a nice tiny patchset, I'll try to sneak this in during the merge
window now :)

nice job...

greg "I know what day this is..." k-h
