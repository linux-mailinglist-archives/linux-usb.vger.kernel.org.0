Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDA133759
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2019 19:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbfFCRzo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jun 2019 13:55:44 -0400
Received: from mx.zatta.me ([185.52.2.58]:35036 "EHLO mx.zatta.me"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726684AbfFCRzo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 Jun 2019 13:55:44 -0400
Date:   Mon, 3 Jun 2019 19:55:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zatta.me;
        s=myselector; t=1559584541;
        bh=UIjllppwvmwk86elfF5VfgZ783/JqdERKo53IHc7TVg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=LMFz8A8l3dk16KSdAlSLj6+razFVg64xvfzb7idFUtdhgld5YyCZn/z0R1zVWrWqW
         AwcMjskgzDG2bO6nE4bswzgSmEdf7b/J/9kXMl/lUDntcKRSw9qtj4XjdUJW//nWqp
         G45+hskxGGZ90/wyJSXkw58MNnIAOVcknbsqBMUMkwz+gkLjLrLjpkn7AAGVDkaTtH
         WIkQdx/yGCQ6fd8WanFHTbbeT6UQwXOkd73aVB4EmLI4i5+C6okO/EUBTleWM0gq8A
         uOaCSRpODOUw0lXG5EXovVEgI6nu8yApAN5Dx2b62pw3f88szwV2PkC1l4KGcVWdJE
         F0eViBLtOqZ1Q==
From:   Marco Zatta <marco@zatta.me>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] Fix chipmunk-like voice when using Logitech C270 for
 recording audio.
Message-ID: <20190603175540.GA4368@jimmy.localdomain>
References: <20190601075257.GA24550@jimmy.localdomain>
 <1559555890.25071.5.camel@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559555890.25071.5.camel@suse.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 03, 2019 at 11:58:10AM +0200, Oliver Neukum wrote:
> Are you sure only the C270 is affected?
> 
> 	Regards
> 		Oliver
> 
Hello Oliver,

No, unfortunately I am not sure but I am missing the hardware to
properly test. I am quite sure that it fixes the problem in the C270
though :)
Thanks for that, since you were the author of the first commit.

Bests,
Marco
