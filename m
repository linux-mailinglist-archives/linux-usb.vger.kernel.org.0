Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4390829E918
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 11:37:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgJ2KhE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 06:37:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgJ2KhD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Oct 2020 06:37:03 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9809BC0613CF
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2020 03:37:03 -0700 (PDT)
Date:   Thu, 29 Oct 2020 11:37:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1603967822;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=u3GTyajpBBEJlEmBdB6WdJK5zew+lgsjJh0K4C2FH4Y=;
        b=oOetuc+274dVqN2qUDPlpe6iBfVlQxTdnhx43C04aTkeKGNehp9gDR9Rm0aJaMllR9yIIy
        sy6FlFw1j0CwzmDcLjKO5ghs7kTFopHoVFHuoVJp70qqwNTrpEqAbQ1MdpOmfEPb2Z0Viz
        aA0PVI6uWzu1IqmmkVWkCavFAn6wxiQOrVhgN70moaYFbZg0VjuKkrYHLG1IO+5rGSXQKU
        S5YBraVbQayEnRUw50D86/Dyo5xWEL5mDA2wwwfqOyA5/KpdNOReD0IcexRrWzVibMnFQo
        DVW3kZ+v/mz0DHUw7qgBQL1xBHHpMz3OuF+i65QdTYGdSdPZoJEdIu2YR130zA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1603967822;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=u3GTyajpBBEJlEmBdB6WdJK5zew+lgsjJh0K4C2FH4Y=;
        b=L8NbxkGMmafQ/nxFeEemGXrV74UnIV6fuAOt8zS8777WRjkUTo5ZfiRJbtWX7ytbS209oW
        enK23voCh3TagPBg==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Mike Galbraith <efault@gmx.de>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>, Li Jun <jun.li@nxp.com>
Subject: Re: [PATCH 3/3] xhci: Don't create stream debugfs files with
 spinlock held.
Message-ID: <20201029103700.eqvumc7wgqjwrbvw@linutronix.de>
References: <20201028203124.375344-1-mathias.nyman@linux.intel.com>
 <20201028203124.375344-4-mathias.nyman@linux.intel.com>
 <1cbb8b7defb1db1d4747995c11ebebb3dd9a66ec.camel@gmx.de>
 <30dd5079-375d-a2a3-cab3-1b2740661ea8@linux.intel.com>
 <20201029094236.fkgzl5mbdp672lbe@linutronix.de>
 <127927cb3ae3178de36653a47f99f7466ee33b20.camel@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <127927cb3ae3178de36653a47f99f7466ee33b20.camel@gmx.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020-10-29 11:23:25 [+0100], Mike Galbraith wrote:
> Below, the aforementioned 5.10-rt splat in case that helps.
> 
> [  155.051826]        CPU0                    CPU1
> [  155.051826]        ----                    ----
> [  155.051826]   lock(&xhci->lock);
> [  155.051827]                                lock((softirq_ctrl.lock).lock);
> [  155.051828]                                lock(&xhci->lock);
> [  155.051828]   lock((lock).lock);
> [  155.051829]

no, that is yet again different. Based on these lines the reason is most
likely the same as in net/TCP you reported a few releases ago (RT
specific).
I need to consult core & locking overlords to figure out how we deal
with this in future since is seems this cases pop up in packs.

If you have more lockdep reports with softirq_ctrl.lock involved, please
throw them at me.

Sebastian
