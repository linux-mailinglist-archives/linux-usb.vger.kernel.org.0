Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D10321D665A
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2020 08:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbgEQG0z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 17 May 2020 02:26:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:34846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726982AbgEQG0y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 17 May 2020 02:26:54 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CA29D2067D;
        Sun, 17 May 2020 06:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589696814;
        bh=iuUSguxhGnoO6RWWu+dvVIu5jqRGmIPIpvrCg9Wdr2s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=itYrxkWhNY1OHFhJUiyrPGYJDaUHvo1Ahis0sknJojiKb2uuHvMJqNi06RoE8dYvX
         iRY+8OqEL/T7RcFVlWtslpvGjYGpFhsWJCGmtjRwnXA95gRjweq0enqfCTPTuXuWjX
         5kRTc8zfGIs8QLktkN0QF7gFu5xHiisi+bJZMswg=
Date:   Sun, 17 May 2020 08:26:51 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Kyungtae Kim <kt0755@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        syzkaller <syzkaller@googlegroups.com>,
        Dave Tian <dave.jing.tian@gmail.com>
Subject: Re: KASAN: use-after-free Read in f_hidg_poll
Message-ID: <20200517062651.GA3024451@kroah.com>
References: <20200517010233.GA35431@pizza01>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200517010233.GA35431@pizza01>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, May 17, 2020 at 01:02:40AM +0000, Kyungtae Kim wrote:
> We report a bug (in linux-5.6.11) found by FuzzUSB (a modified version
> of syzkaller)
> 
> kernel config: https://kt0755.github.io/etc/config_v5.6.11
> 
> This bug happened when accessing a f_hidg instance deallocated.
> Specifically, f_hidg_poll() tries to access hidg (at line 424), 
> but memory error occurs because hidg has been freed 
> by configfs_unlink() in another thread (PID: 3190).
> 
> To fix, we check if either hidg is still in use when deallocating
> or it is still vaild after poll_wait()  in f_hidg_poll().

Great, can you send a patch for this to resolve the issue?

thanks,

gre gk-h
