Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA9171D724E
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2020 09:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727832AbgERHx2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 May 2020 03:53:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:53030 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726489AbgERHx2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 May 2020 03:53:28 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 496FFAE39;
        Mon, 18 May 2020 07:53:29 +0000 (UTC)
Message-ID: <1589788405.6470.6.camel@suse.com>
Subject: Re: [PATCH] usblp: poison URBs upon disconnect
From:   Oliver Neukum <oneukum@suse.com>
To:     Pete Zaitcev <zaitcev@redhat.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>
Date:   Mon, 18 May 2020 09:53:25 +0200
In-Reply-To: <20200515153149.19f5b4ee@suzdal.zaitcev.lan>
References: <20200507085806.5793-1-oneukum@suse.com>
         <20200515153149.19f5b4ee@suzdal.zaitcev.lan>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Freitag, den 15.05.2020, 15:31 -0500 schrieb Pete Zaitcev:
> 
> and usb_poison_anchored_urbs. If you think that poisoning may help against
> what the bot identified, we may try this instead:

Sure. Would you send in a patch?

> I'm still concerned that we didn't identify the scenario tht led to bot's
> findings.

So am I. Yet as far as I can tell the code of usblp is correct. Even
worse, it is casting doubt on our testing framework.

> The usblp->present was supposed to play a role of the poison pill, at the
> driver level. The difference with poisoning the anchor is that ->present
> is protected by the most outlying mutex, and therefore cannot be meaninfully
> checked in URB callbacks. But the anchor's poison flag is protected by a
> spinlock, so callbacks check it. But what does it matter for us? This driver
> does not re-submit URBs from callbacks.

It also makes resubmission impossible. In fact, considering that, we
might better poison before we go for usblp->present.

> So, I'm suspicious of attempts to hit at the problem in the dark and hope
> for a miracle.

Right. The only thing worse would be doing nothing. At the risk of
repeating myself, usblp looks correct to me.

	Regards
		Oliver

