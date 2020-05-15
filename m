Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB6A1D5AB5
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 22:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbgEOUb5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 16:31:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25784 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726179AbgEOUb5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 May 2020 16:31:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589574716;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HDLwpmUVQX+kl1vnZkZEJyyTX65SwDMx+M1Xd73pLfM=;
        b=JH8y2CsBAqVisiVKCmKcirQe9p7mccG0yvzb/NoYYhOuaGwLDoMTt1J2RfJ0L6UG0acKN/
        o4nEDIaGih56ILrnEu8Ddq+uVDYbeTSnL4erjKYAcS8pDFUC2YXTD45YKnys2Xs4qHzNx/
        1Ugl1sl1iwGxwSVo83uiFFUjE1/D9kc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-ZhmxP6SSPZK_knqjQUAxzQ-1; Fri, 15 May 2020 16:31:54 -0400
X-MC-Unique: ZhmxP6SSPZK_knqjQUAxzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7403BFCA;
        Fri, 15 May 2020 20:31:52 +0000 (UTC)
Received: from suzdal.zaitcev.lan (ovpn-113-95.phx2.redhat.com [10.3.113.95])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B592D99D8;
        Fri, 15 May 2020 20:31:49 +0000 (UTC)
Date:   Fri, 15 May 2020 15:31:49 -0500
From:   Pete Zaitcev <zaitcev@redhat.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>, zaitcev@redhat.com
Subject: Re: [PATCH] usblp: poison URBs upon disconnect
Message-ID: <20200515153149.19f5b4ee@suzdal.zaitcev.lan>
In-Reply-To: <20200507085806.5793-1-oneukum@suse.com>
References: <20200507085806.5793-1-oneukum@suse.com>
Organization: Red Hat, Inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu,  7 May 2020 10:58:06 +0200
Oliver Neukum <oneukum@suse.com> wrote:

> syzkaller reported an URB that should have been killed to be active.
> We do not understand it, but this should fix the issue if it is real.

> @@ -1375,9 +1376,11 @@ static void usblp_disconnect(struct usb_interface *intf)
>  
>  	usblp_unlink_urbs(usblp);
>  	mutex_unlock(&usblp->mut);
> +	usb_poison_anchored_urbs(&usblp->urbs);
>  
>  	if (!usblp->used)
>  		usblp_cleanup(usblp);
>  	mutex_unlock(&usblp_mutex);
>  }

Sorry, it took me this long to think about it. I am against the duplication
of effort between usblp_unlink_urbs, which is exactly usb_kill_anchored_urbs,
and usb_poison_anchored_urbs. If you think that poisoning may help against
what the bot identified, we may try this instead:

diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
index 0d8e3f3804a3..eae5eaf5d4f1 100644
--- a/drivers/usb/class/usblp.c
+++ b/drivers/usb/class/usblp.c
@@ -1373,7 +1373,7 @@ static void usblp_disconnect(struct usb_interface *intf)
        wake_up(&usblp->rwait);
        usb_set_intfdata(intf, NULL);
 
-       usblp_unlink_urbs(usblp);
+       usb_poison_anchored_urbs(&usblp->urbs);
        mutex_unlock(&usblp->mut);
 
        if (!usblp->used)

I'm still concerned that we didn't identify the scenario tht led to bot's
findings.

The usblp->present was supposed to play a role of the poison pill, at the
driver level. The difference with poisoning the anchor is that ->present
is protected by the most outlying mutex, and therefore cannot be meaninfully
checked in URB callbacks. But the anchor's poison flag is protected by a
spinlock, so callbacks check it. But what does it matter for us? This driver
does not re-submit URBs from callbacks.

So, I'm suspicious of attempts to hit at the problem in the dark and hope
for a miracle.

-- Pete

