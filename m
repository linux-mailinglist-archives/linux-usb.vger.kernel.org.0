Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA881C76EF
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2020 18:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729596AbgEFQrn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 May 2020 12:47:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48187 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729414AbgEFQrm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 May 2020 12:47:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588783661;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D5gcsjRW/Y6Yf/Wf7cSY/UTAOCmTv3dfJwfJ5p0w6mY=;
        b=B8fciWGUOdN2+QVTJ124sWohqq+89V+uUVQSCCEWcSCYj2eB59EQBRY4T0ivCbf2Q95+Mm
        tJ0xOCN1gfqIV1SGLBk7Co3SnPVw1Uno8/WVs9pzDIpL2Y1StxcHGWtu5o5Vrasv3O2ENb
        oNMzG1qDCh4D8OaBYZCfiX5OWqmulEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-SSyRdXdjPeWrRvNKHd7Qyg-1; Wed, 06 May 2020 12:47:35 -0400
X-MC-Unique: SSyRdXdjPeWrRvNKHd7Qyg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B72F107ACF8;
        Wed,  6 May 2020 16:47:33 +0000 (UTC)
Received: from suzdal.zaitcev.lan (ovpn-113-96.phx2.redhat.com [10.3.113.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C39B96298F;
        Wed,  6 May 2020 16:47:32 +0000 (UTC)
Date:   Wed, 6 May 2020 11:47:32 -0500
From:   Pete Zaitcev <zaitcev@redhat.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        syzbot <syzbot+be5b5f86a162a6c281e6@syzkaller.appspotmail.com>,
        andreyknvl@google.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, zaitcev@redhat.com
Subject: Re: KASAN: use-after-free Read in usblp_bulk_read
Message-ID: <20200506114732.5f81c8c5@suzdal.zaitcev.lan>
In-Reply-To: <1588756482.13662.20.camel@suse.com>
References: <Pine.LNX.4.44L0.2004301103500.27217-100000@netrider.rowland.org>
        <1588756482.13662.20.camel@suse.com>
Organization: Red Hat, Inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 06 May 2020 11:14:42 +0200
Oliver Neukum <oneukum@suse.com> wrote:

> Very well. We are not going to find it without exceptional luck. Yet
> there may be a real issue, too. We simply do not know. How about the
> attached patch?

>  	usblp_unlink_urbs(usblp);
>  	mutex_unlock(&usblp->mut);
> +	usb_poison_anchored_urbs(&usblp->urbs);
>  
>  	if (!usblp->used)
>  		usblp_cleanup(usblp);

This can't be right. Our URBs are freed by the callback, and this
technique is not compatible with poisoning, at least with how the
usb/core.c implements it. The usb_poison_urb() waits for URB
to complete, and if the callback frees it, it's a problem.

-- Pete

