Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53264334A40
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 23:00:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232254AbhCJV60 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 16:58:26 -0500
Received: from netrider.rowland.org ([192.131.102.5]:45995 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232058AbhCJV57 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 16:57:59 -0500
Received: (qmail 237011 invoked by uid 1000); 10 Mar 2021 16:57:58 -0500
Date:   Wed, 10 Mar 2021 16:57:58 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     SIMON BABY <simonkbaby@gmail.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Query on USB error
Message-ID: <20210310215758.GB236329@rowland.harvard.edu>
References: <CAEFUPH13WXt=Usq-87Jj3_0u9gC0_AyFmnAzeM1eNFbXhJNgEQ@mail.gmail.com>
 <20210310182742.GA228576@rowland.harvard.edu>
 <CAEFUPH35OY-BkkXcW3+_JJN0EvDhFYEphJtvTNiyhySLZG20xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEFUPH35OY-BkkXcW3+_JJN0EvDhFYEphJtvTNiyhySLZG20xw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 10, 2021 at 01:26:28PM -0800, SIMON BABY wrote:
> 😀 my system is now running with 2.6.32.46. I see that the issue get fixed
> between 2.6.32.36 and 2.6.32.46 . But I am eager to know if any specific
> fix went on . Sorry for that

There were a bunch of commits between 2.6.32.36 and 2.6.32.46 which 
might have been responsible:

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/usb/host?h=v2.6.32.46&id=a572af6883a6af871d9f20894f6b51a2749f3c22
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/usb/host?h=v2.6.32.46&id=a53267c74ab2d639ac419133cfa8b5e0f49ff8ed
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/usb/host?h=v2.6.32.46&id=6691c4c32de7046a36cd94b2f904507dcfb86de7
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/usb/host?h=v2.6.32.46&id=108786ae74b65d83e4cd9d43bb53cfa75048572f
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/usb/host?h=v2.6.32.46&id=38e6bb765aaa79257f99b7a9b8ba6d3d034d73c5

Just are just the obvious candidates.  It may have been something else.

Alan Stern
