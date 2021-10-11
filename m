Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64DE142893B
	for <lists+linux-usb@lfdr.de>; Mon, 11 Oct 2021 10:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235335AbhJKI5X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Oct 2021 04:57:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:58534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235339AbhJKI5W (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Oct 2021 04:57:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9EB4B60F38;
        Mon, 11 Oct 2021 08:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633942522;
        bh=zRrAnylO0tyT8/HnoXO4076BWvnLEWdLzr3F0zsk/uM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Sd2JvhCCWW0MQi4tldkT/C8sK5yZKeBYy2gTDcHZJnRUCAmvkNjdqgPPCUojSBKf4
         vt4iyxw+4Hm/MRHN1XvcfCqgEUsQbTADXMlAX753W56vRA/Vagj0NObJv+BvaEI7j9
         H7fASs3TDHbLamNbZCpUTr0SeK+jsLJiTi+2IQ+EFg1i2Bz9xX1DfKDi1F1QWzR5rb
         U8mqgvOqTZlV6esN+0FS0EhARUpSu35OtKuGxkmqmGghagPGLi6Z3+hsCfpSfdCkPd
         V+XUQi295G/SIwYk57cllion+PgzzLguEOPMcVJEfhFhrNRMqn8wSHhR4+wimCwyKA
         tqQJKMO2npysA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mZr5W-0002Qk-4K; Mon, 11 Oct 2021 10:55:14 +0200
Date:   Mon, 11 Oct 2021 10:55:14 +0200
From:   Johan Hovold <johan@kernel.org>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 214131] ch341 communication problem
Message-ID: <YWP78iMxELn4YGrl@hovoldconsulting.com>
References: <bug-214131-208809@https.bugzilla.kernel.org/>
 <bug-214131-208809-sY7jhlxx7J@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bug-214131-208809-sY7jhlxx7J@https.bugzilla.kernel.org/>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 04, 2021 at 09:21:09AM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:

> --- Comment #9 from Bogusław Brandys (brandys@o2.pl) ---
> 5.4.0-88-generic #99-Ubuntu SMP Thu Sep 23 17:29:00 UTC 2021 x86_64 x86_64
> x86_64 GNU/Linux
> 
> Ubuntu 20.04.3 LTS
> 
> problem with ch341 driver re-appeared while in 5.4.0.-86 is working fine.

This issue has been fixed in mainline (and stable), but we have no idea
what Ubuntu puts in their kernels. Please report it them. 

Johan
