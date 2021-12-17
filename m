Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78A5E478DD6
	for <lists+linux-usb@lfdr.de>; Fri, 17 Dec 2021 15:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235801AbhLQOdD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Dec 2021 09:33:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbhLQOdC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Dec 2021 09:33:02 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A4ADC061574
        for <linux-usb@vger.kernel.org>; Fri, 17 Dec 2021 06:33:02 -0800 (PST)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1myEI7-00059p-Gn; Fri, 17 Dec 2021 15:32:59 +0100
Message-ID: <1d90a23b-fe2f-6892-1641-7a13e38a00dc@leemhuis.info>
Date:   Fri, 17 Dec 2021 15:32:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] usb: typec: ucsi: Only check the contract if there is a
 connection
Content-Language: en-BS
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <20211217140327.31921-1-heikki.krogerus@linux.intel.com>
From:   Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20211217140327.31921-1-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1639751582;c85fdf9e;
X-HE-SMSGID: 1myEI7-00059p-Gn
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Lo! Thx for working out a fix this quickly!

I'm just the regression tracker, but I think there are a few minor
details to improve here.

On 17.12.21 15:03, Heikki Krogerus wrote:
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
> Fixes: 6cbe4b2d5a3f ("usb: typec: ucsi: Check the partner alt modes always if there is PD contract")
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=215117
BugLink? Is that a tag we really use? Then I'm unaware of it. Greg is
the expert and can likely clarify, but that line afaik needs to replaced
by this:

Link: https://bugzilla.kernel.org/show_bug.cgi?id=215117
Link:
https://lore.kernel.org/linux-usb/bug-215117-208809@https.bugzilla.kernel.org%2F/

Normally the last line would need a 's!linux-usb!r!', but seems the
kernel.org redirector doesn't work well in this particular case, so I
guess it's better this way than not at all :-/

The second line will also make the regression tracking bot automatically
close the issue (but I fear it might also fail due to the slash at the
end of the message-id :-/)

I think this line should be there as well:

Reported-by: Chris Hixon <linux-kernel-bugs@hixontech.com>

But according to Documentation/process/5.Posting.rst you first need to
ask Chris if he's okay with that.

Ciao, Thorsten

#regzbot ^backmonitor:
https://lore.kernel.org/linux-usb/bug-215117-208809@https.bugzilla.kernel.org%2F/


> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
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
> 
