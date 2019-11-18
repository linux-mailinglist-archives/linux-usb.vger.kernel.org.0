Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC159100B9E
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 19:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbfKRSlI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 13:41:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:39254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726511AbfKRSlI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Nov 2019 13:41:08 -0500
Received: from gmail.com (unknown [104.132.1.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 24E68222C2;
        Mon, 18 Nov 2019 18:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574102468;
        bh=Mct1VVDRI0012sGC6htfkjO5+eLT/HkJSgveq7NFgmI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dK4oBAKOP3MDLr/W9kpOzrn7OSaLkzIgwGN3gwTkKiqza8Q+Ka8p6CeeWvbJ4iEYw
         BgRQ50ZP/tJA9peIdgwXRmt8dFT6XJcj8wN0DArYB9eoaiDL918s5mOPnIfLGJyXBU
         xSL6a6e+euAqZ40onmA07OVKtxDFrUs1vO6kxdWU=
Date:   Mon, 18 Nov 2019 10:41:06 -0800
From:   Eric Biggers <ebiggers@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: refresh of list of open USB issues syzkaller has found
Message-ID: <20191118184106.GC184560@gmail.com>
References: <1574102041.2698.9.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574102041.2698.9.camel@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 18, 2019 at 07:34:01PM +0100, Oliver Neukum wrote:
> Hi Eric,
> 
> a while ago you posted a list of such issues. May I request
> that you resend it at the current state of affairs? I am losing track.
> 
> 	Regards
> 		Oliver
> 

There's a backlog of bugs I'll need to categorize first, since I haven't had
time for syzbot stuff within the past month.  I'll try to get to it soon though.

Thanks for fixing so many USB bugs!

- Eric
