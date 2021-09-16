Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C61D740DE38
	for <lists+linux-usb@lfdr.de>; Thu, 16 Sep 2021 17:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239958AbhIPPh4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Sep 2021 11:37:56 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:46079 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239383AbhIPPhy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Sep 2021 11:37:54 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 5656D5C01BC;
        Thu, 16 Sep 2021 11:36:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 16 Sep 2021 11:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=fuwPpKvNrIJbLZMeCzwGqqtf/8R
        8cW3M1HLE1J9gAO4=; b=lj1j1Mx0RqABBogl4HyTzY0DfNUGzwT9Ro+NuENyyc1
        ou4quLsDn1QzIw8LXP1JL04nlzkIAX2AhdTWPRxunHoVsxhbRyLbs6w2a85Qvdnz
        3QG7gIcjzjjAIzM8IqiMVOtFV3xqpTKi0bbGpvLL7DdgVUFYpTGTqihbMju89dt1
        Q7DgtRSwq0NtIBsAmHufuGQVoUYouJdlml249F1oqjaazxEcAfL0CdknvpHTyXBE
        0EgXkyYZ2QKPTt0GEOYV368bEgDN1MffNogc9A4mpBkvCMumQL1dzkak+J2eTI/1
        5zIPEDuCr0QOu+oar+HNbU6ewtg7d4K6AP2TcvIoxbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=fuwPpK
        vNrIJbLZMeCzwGqqtf/8R8cW3M1HLE1J9gAO4=; b=o/IWsc4sU86jaEIbwJNX+o
        mtI1sPyJCebwR4WNugPq5HatlRkPtVjctpcP8tya7zorw6HxjZs3HzoFG8zV1eSy
        T1svXw3XrexcJvFWWb6uh7ZqCsKgHr9XhJ+aCisb0+dkRmXTuy3VyglDnZWG1OKr
        BGKt2sq4SR1FxRmMWiDWJ0ChHiqFcE65fFmztqxC1qOvSr4ubx20BFo8JQD2qEb3
        JNcmfeu/5X/OHlmEFqXS/ikXIZ+DZIncD0spSAxmvbLw4qPWvwVZGHAhorWhsOgb
        28nopMV2NRkp4axxstOdyUyqT9ndyJAJqiD8mM1FqTxsMNJ821SL6zWbhSsij9sg
        ==
X-ME-Sender: <xms:gWRDYZfyTxWxAnSOgpThtcZWJoH7OQT-YJKYv24fgWD3w74QDwEjdA>
    <xme:gWRDYXMQKMR-W4OkCc0ho6GIX4z18hyvFuH73cuK2nkmtjDb0m-XYXCnWBzpcdYnU
    romdN3N8WYTfw>
X-ME-Received: <xmr:gWRDYSirOl90h44CkaKb1nDoS9OY8AZekqpx3AcXYtR_ersTSvQebjOUkTkOUf8z4HC2fMB9Vm9FDtDDy0VtUnedYCFR_fGY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepveeuheejgfffgfeivddukedvkedtleelleeghfeljeeiue
    eggeevueduudekvdetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:gWRDYS88hP-0Z9T3leTjN-AiP9JaMOD1xe4my1157O6E7-0lhgEmMA>
    <xmx:gWRDYVue9xKS9NASKD7XplLrNfxU-qzrFi_pWH54sqtc6t_2rGFzDw>
    <xmx:gWRDYRHLfvLKQ_rI7VBJ1H-nQALjgLVJth_YvT04hpRNZiprA_HAgA>
    <xmx:gWRDYe77N2JtdlKurl19fZOUeUAq0Br_N99YlMr3c9CTdeYbfMqlDg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 11:36:32 -0400 (EDT)
Date:   Thu, 16 Sep 2021 17:36:30 +0200
From:   Greg KH <greg@kroah.com>
To:     Andreas Bauer <andreas.bauer.nexus@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget/legacy/ether: assume saner default power mode
Message-ID: <YUNkfp1kxOtfU4pX@kroah.com>
References: <YUNbDyoTPa+5J9Od@ws2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUNbDyoTPa+5J9Od@ws2>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 16, 2021 at 09:56:15PM +0700, Andreas Bauer wrote:
> 
> I propose the included patch to the OTG USB ethernet gadget code:
> 
>   Report default of bus powered and 500mA bMaxPower consumption.
> 
> Reason:
> 
>   The USB spec requires all devices consuming more than 100mA from
>   the bus to report in this manner. Devices such as Rpi Zero can operate
>   in this mode and will then falsly report being self-powered when they
>   are not.
> 
>   The more sane default is to report being 500mA bus-powered than being
>   self-powered
> 
> This patch was born from an issue within the Raspberry Pi Zero ecosystem,
> therefore I would invite comment regarding other usage of this OTG code.
> 
> Best regards,
> 
> Andreas
> 
> $ diff -u linux-5.14.2/drivers/usb/gadget/legacy/ether.c.orig linux-5.14.2/drivers/usb/gadget/legacy/ether.c
> --- linux-5.14.2/drivers/usb/gadget/legacy/ether.c.orig	2021-09-08 13:52:41.000000000 +0700
> +++ linux-5.14.2/drivers/usb/gadget/legacy/ether.c	2021-09-16 21:25:06.782958554 +0700
> @@ -296,7 +296,8 @@
>  	/* .label = f(hardware) */
>  	.bConfigurationValue	= 1,
>  	/* .iConfiguration = DYNAMIC */
> -	.bmAttributes		= USB_CONFIG_ATT_SELFPOWER,
> +	.bmAttributes		= 0,   /* bus powered implied */
> +	.bMaxPower		= 250, /* 500mA in 2mA units */
>  };
>  
>  /*-------------------------------------------------------------------------*/

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

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/SubmittingPatches and resend it after
  adding that line.  Note, the line needs to be in the body of the
  email, before the patch, not at the bottom of the patch or in the
  email signature.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
