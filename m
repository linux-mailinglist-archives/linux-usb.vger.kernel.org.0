Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E79F552ABF
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jun 2022 08:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344735AbiFUGFX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jun 2022 02:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiFUGFV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jun 2022 02:05:21 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A83F15A1F
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 23:05:19 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id D6D195C012F;
        Tue, 21 Jun 2022 02:05:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 21 Jun 2022 02:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1655791516; x=1655877916; bh=uKsnxMpC9I
        Jx8Fc74z4UIjRHYVGEr2uxol7xWinvRJ0=; b=TszKcsbXUZbkkMNDOE5XpIdXbo
        K0rrN3w2Ykfu4L2zRdO7p74JktWopmnoI78O2lZKn1axTzUamAFqBeXdspoJZYci
        MoW1VNkEiKhnmGYaFcoQhjgQG6gCC0b5+SAZ+/cl9VNOGakyhQQgSA5znyyQNAy0
        ie7vBVzHEqO8KFqtFyuAds2xhsEQfiIYTMN/PuIyujAyXP5TOcmec/MujEH1NQO1
        /dJLoHUFnCgcW+XCZxFTuzfBfhSvf9zDEXzfZLBwmU7gRNILYZABa+eadURk43Q7
        RMxEFhiE8eeVxW6jS3W2yvO/OuRdNV0JCi40/izaTYpHYu6hWoGWXJFtzbAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1655791516; x=1655877916; bh=uKsnxMpC9IJx8Fc74z4UIjRHYVGE
        r2uxol7xWinvRJ0=; b=jWOp//hOa040IbSeVOR/8aNFfgg1OfWfTpWHIxgKmp26
        sxU4T2KYFcAsLtGVxPAv0CAnEEwku0xgEV6fwXNUKtdMjfO0eL/7znHwJQyyDRzt
        /st9Y5WLz24RnUCG3WV6yyuTQUGetSqP1aMnCX1kYL5uzMFePnoHY6Zy0pHZ38i0
        NoIGCfzS8wuzijd5GPa8oBi+51xjAT2PMbIKQ0p1k+KsaP1MJ5GZMsNUSZjTW3nn
        zOjGXG/9W6C9sGhc41Aw6pEFNSrtJm/7i79yY9iwrRkakfDGN6QWdyvmYTTn//ld
        RVbBqbQ12xv4WCuHkgR7njYrWRZylK3QRMRn/yXA9A==
X-ME-Sender: <xms:nF-xYlu6JOaEsW_mCvc4hKTxh1BhpAiWQ-mqRMpz7tloPJba9ExWxQ>
    <xme:nF-xYuc26_quc5_u6AwMbuVFnvOzB9TK6fw0UEXVElcMeO6Go6EV2Qks9QB7LvbvY
    8bfnzvEggTCrw>
X-ME-Received: <xmr:nF-xYoxCzg8q8aw3CMesURaVIERNOz9hFBTA8zjzcgNk4spWv4GZRtYIHtBgHLYYVVpZP0Q3_db5wI4FfmetS4VXV3zhHh4V>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefvddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesth
    dtredttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtgho
    mheqnecuggftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejke
    ejuefhtdeufefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:nF-xYsOJjxB3z1PFCvqE7FScNXNI06lhZQGzsJPY7SwH0Htik91u4g>
    <xmx:nF-xYl-e6ljPcItgzBsaZfWUsFkkmjkDBu-mQuU36-hYqzegtHC1nA>
    <xmx:nF-xYsVkqYiuaxl-gr-ImkWV2KCfhvi3-D5r8U9KVT8TKYYd-Fovew>
    <xmx:nF-xYhbsLqOYXnC02txqXnIsXfHbisQIWgQVNVbdgBkdonrfn9dUbA>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jun 2022 02:05:15 -0400 (EDT)
Date:   Tue, 21 Jun 2022 08:05:12 +0200
From:   Greg KH <greg@kroah.com>
To:     Hyunwoo Kim <imv4bel@gmail.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: host: ehci-q: Fix
 ehci_submit_single_step_set_feature annotation typo
Message-ID: <YrFfmEeaxbbhxK0p@kroah.com>
References: <20220620213621.GA694104@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620213621.GA694104@ubuntu>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 20, 2022 at 02:36:21PM -0700, Hyunwoo Kim wrote:
> Dear all,
> this is Hyunwoo Kim.
> 
> I found the "argument" typo.
> 
> Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> ---
>  drivers/usb/host/ehci-q.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-q.c b/drivers/usb/host/ehci-q.c
> index 1163af6fad77..807e64991e3e 100644
> --- a/drivers/usb/host/ehci-q.c
> +++ b/drivers/usb/host/ehci-q.c
> @@ -1162,7 +1162,7 @@ submit_async (
>   * This is done in two parts: first SETUP req for GetDesc is sent then
>   * 15 seconds later, the IN stage for GetDesc starts to req data from dev
>   *
> - * is_setup : i/p arguement decides which of the two stage needs to be
> + * is_setup : i/p argument decides which of the two stage needs to be
>   * performed; TRUE - SETUP and FALSE - IN+STATUS
>   * Returns 0 if success
>   */
> -- 
> 2.25.1
> 
> Regards,
> Hyunwoo Kim.

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
