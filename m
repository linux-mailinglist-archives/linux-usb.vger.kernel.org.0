Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A49CA39511D
	for <lists+linux-usb@lfdr.de>; Sun, 30 May 2021 15:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbhE3N4f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 May 2021 09:56:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:46382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229500AbhE3N4f (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 30 May 2021 09:56:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28F4A60FDA;
        Sun, 30 May 2021 13:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622382897;
        bh=0fR15eSAt1EyMJhDsX8VIpO9ToE5TUrUibfLKUacJWc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O1IHriL2vccelXNLSXV9bnVl2eH6FlN9ouZgEgTHG+YPNBtDgSM20+CmQb1WY9yNF
         IcU3qNwUQ9YXiLgdZXp1HynRBer+SeW1RGuODCh7p4Afqu2j8OTYFR5/yaOjkTEObf
         vcYHi0/rnn1uYL09abbgbEXoMDDlw055inCjebA1jVFJ/XhO90di1y1vF3AMyYLooR
         PJeLuYX2X84cgvlTQJuikxWMpSY4LfeIXuFto71l44KCSntysK2zIQslXXPdI1vUg0
         /L23y/tlJaJM8x/EZAljAPWeSvhomuHf8/1GHUShYRZHiBd8RKfwUXfxkrwwR5Xu2F
         dWR2EXzNSnQAQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lnLu2-0008UK-CV; Sun, 30 May 2021 15:54:54 +0200
Date:   Sun, 30 May 2021 15:54:54 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Eero Lehtinen <debiangamer2@gmail.com>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH] media: rtl28xxu: add type-detection instrumentation
Message-ID: <YLOZLvWESErIePs3@hovoldconsulting.com>
References: <CAHS3B0EzL7zeKGjm=kvEq7VgDc-7hZNgOm-z5zPgFwVg0uQe-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHS3B0EzL7zeKGjm=kvEq7VgDc-7hZNgOm-z5zPgFwVg0uQe-Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, May 30, 2021 at 03:23:36PM +0300, Eero Lehtinen wrote:
> Hi,
> 
> I tested Johans latest patch and my dvb-t stick can find the channel
> list but not to tune to them. It uses the mxl5005s driver again with
> repeating mxl5005s I2C write failed messages:
> 
> [   23.276076] mxl5005s I2C reset failed
> [   23.296082] mxl5005s I2C write failed
> [   23.316041] mxl5005s I2C write failed
> [   23.336061] mxl5005s I2C write failed
> [   23.336100] usb 1-1: Frontend requested software zigzag, but didn't
> set the frequency step size
> [   23.356096] mxl5005s I2C reset failed
> [   23.376226] mxl5005s I2C write failed
> [   23.396084] mxl5005s I2C write failed
> [   23.416082] mxl5005s I2C write failed

It was just an instrumentation patch to gather more information. Can you
post the logs from when probing/using the device with that patch in
place?

Specifically, look for the "rtl28xxu_identify_state" entries, but please
include the full log in case there are more hints in there.

Also, please keep me and Alan on CC (along with the list) so that we get
your replies directly. The list can be a bit slow at forwarding at
times.

Johan
