Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 182F647C1AA
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 15:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235608AbhLUOjH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 09:39:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbhLUOjG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Dec 2021 09:39:06 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70358C061574
        for <linux-usb@vger.kernel.org>; Tue, 21 Dec 2021 06:39:06 -0800 (PST)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1mzgIC-0001af-Q4; Tue, 21 Dec 2021 15:39:04 +0100
Message-ID: <2723c9a3-a932-3634-422b-3fbd93550bf8@leemhuis.info>
Date:   Tue, 21 Dec 2021 15:39:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] usb: typec: ucsi: Only check the contract if there is
 a connection
Content-Language: en-BS
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Chris Hixon <linux-kernel-bugs@hixontech.com>
References: <20211221140352.45501-1-heikki.krogerus@linux.intel.com>
From:   Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20211221140352.45501-1-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1640097546;b4d43ba0;
X-HE-SMSGID: 1mzgIC-0001af-Q4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21.12.21 15:03, Heikki Krogerus wrote:
> The driver must make sure there is an actual connection
> before checking details about the USB Power Delivery
> contract. Those details are not valid unless there is a
> connection.
> 
> This fixes NULL pointer dereference that is caused by an
> attempt to register bogus partner alternate mode that the
> firmware on some platform may report before the actual
> connection.
> 
> Reported-by: Chris Hixon <linux-kernel-bugs@hixontech.com>
> Fixes: 6cbe4b2d5a3f ("usb: typec: ucsi: Check the partner alt modes always if there is PD contract")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=215117
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
> 
> Hi,
> 
> Instead of using the "BugLink" tag, I'm now using "Link" tag with the
> link to the bug as requested.

Thx!

> There was a request to have also another Link tag pointing to some
> other discussion on the mailing list, but I failed to understand what
> was the point with that - I also didn't find any commits where
> something like that had been used before.

There are quite a few commits that use more that two "Link" tags, as
they should point to "related discussions or any other background
information behind the change" that "can be found on the web" (Quotes
from Documentation/process/submitting-patches.rst) -- hence there is no
limit. That being said:

> I may be mistaken here, but I got the impression that you create the
> mailing list discussion

You are mistaken: I created it because the bugzilla ticket was ignored
in bugzilla for weeks and might have forgotten otherwise -- no wonder,
was bugzilla.kernel.org is not the official place to report USB bugs
according to the MAINTAINERS file.

> just so you can have the extra Link tag
> pointing to it, and that Link tag you want only because you have made
> your scripts rely on it.

They rely on it as almost all subsystems expect bug to be reported by
mail, as they are instructed by
Documentation/admin-guide/reporting-issues.rst

> The extra email thread in any case does not seem to contain any real
> additional information that the bug report does not have, so the extra
> Link tag pointing to it does not provide any real value on top of the
> link to bug itself.

In this case that's true, as I have to tell regzbot about the fix then
manually (the plan it to make regzbot also detect links to
bugzilla.kernel.org, but I fear I have no time to work on that in the
next few weeks :-/ ). But in similar cases it's different, as there the
developers continued discussing the issue by mail -- then it's
definitely worth linking there as well.

Thx.

Ciao, Thorsten

> --
>  drivers/usb/typec/ucsi/ucsi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 9d6b7e02d6efb..f0c2fa19f3e0f 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1164,7 +1164,9 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>  		ret = 0;
>  	}
>  
> -	if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) == UCSI_CONSTAT_PWR_OPMODE_PD) {
> +	if (con->partner &&
> +	    UCSI_CONSTAT_PWR_OPMODE(con->status.flags) ==
> +	    UCSI_CONSTAT_PWR_OPMODE_PD) {
>  		ucsi_get_src_pdos(con);
>  		ucsi_check_altmodes(con);
>  	}
