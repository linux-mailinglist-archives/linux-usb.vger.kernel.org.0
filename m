Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C6C41704A
	for <lists+linux-usb@lfdr.de>; Fri, 24 Sep 2021 12:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240310AbhIXK1j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Sep 2021 06:27:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:35936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240018AbhIXK1j (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 Sep 2021 06:27:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5FA7E610CB;
        Fri, 24 Sep 2021 10:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632479166;
        bh=o7LPPH2dHm5+0FRX2K9yG4n5MY/jsr0G1zqge5H9GV4=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=aF9SGLmtwPpIEFk8LThK3OM3RHhAKnQIiUKd5g0GviwUW573q0ev1h13JiqnvQXm3
         xZdEwqtfSlbFF1TJnxwSaaQUnaEqRofnm4DLOX1swRybiBRPzrB2jMUS61OwbTGrZB
         pCPqw2mIHUNP2Ih3xF00sgz+Xg2IM3Uvk9/RIVKkRyL095aM7acZEScsKpKSrsXKVA
         YNQv8amygNHzZMeC1xXgqsYAxdrMTEb59F47gB3e63Bs/6z7QKkRzJWltdtM4lFZmB
         V42G7SVmQnKBd+NxKQoMoxbN5Dvl+HVmSCw1tJ8/0zJMkfLRMpkBO2kqjH98WBBaBk
         hB8ld3++mOPqA==
References: <20210924083852.6029-1-yangzhiwei@uniontech.com>
User-agent: mu4e 1.6.6; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Zhiwei Yang <yangzhiwei@uniontech.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: phy: tahvo:remove unnecessary debug log
Date:   Fri, 24 Sep 2021 13:23:55 +0300
In-reply-to: <20210924083852.6029-1-yangzhiwei@uniontech.com>
Message-ID: <87fstuqngk.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Zhiwei Yang <yangzhiwei@uniontech.com> writes:

> Remove the debug info which should be instead with ftrace

why?

> Signed-off-by: Zhiwei Yang <yangzhiwei@uniontech.com>
> ---
>  drivers/usb/phy/phy-tahvo.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/usb/phy/phy-tahvo.c b/drivers/usb/phy/phy-tahvo.c
> index 5dc600fadc5f..468151496d23 100644
> --- a/drivers/usb/phy/phy-tahvo.c
> +++ b/drivers/usb/phy/phy-tahvo.c
> @@ -194,8 +194,6 @@ static int tahvo_usb_set_host(struct usb_otg *otg, struct usb_bus *host)
>  	struct tahvo_usb *tu = container_of(otg->usb_phy, struct tahvo_usb,
>  					    phy);
>  
> -	dev_dbg(&tu->pt_dev->dev, "%s %p\n", __func__, host);
> -
>  	mutex_lock(&tu->serialize);
>  
>  	if (host == NULL) {
> @@ -224,8 +222,6 @@ static int tahvo_usb_set_peripheral(struct usb_otg *otg,
>  	struct tahvo_usb *tu = container_of(otg->usb_phy, struct tahvo_usb,
>  					    phy);
>  
> -	dev_dbg(&tu->pt_dev->dev, "%s %p\n", __func__, gadget);

is this causing any problems? What sort of problems? Why should we take
this patch?

-- 
balbi
