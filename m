Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84D59178CFF
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2020 10:01:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387398AbgCDJB1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Mar 2020 04:01:27 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:48307 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728387AbgCDJB1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Mar 2020 04:01:27 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 7AC8C37D;
        Wed,  4 Mar 2020 04:01:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 04 Mar 2020 04:01:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=7HYZBF3dnJeAmCYfyptewgSm8Yb
        Wu7Y2F+flq1v4eRA=; b=mmeiLrD67Lnn7QzZi3w6iagtqFwHcT0i7AcEnJVf9Jx
        m3Xza1DrOOWx91JtSRZQaEZ8uXiKAafwqC/fwAIFMF8M9pw0bznbyxLk2SgMMkG2
        /U34y0Wpgshog8mfy+Nf+moO4xaJ7XLLWAk8GO3kneFMSjVdt6T+tUuIAyD2UNtH
        gwjgp0aMy3VJS8NfL65egXjFgr49jfUXstI4mR85J3N277ysoIdTP20MUO3FpldE
        w2J07kOOzJmS00zyxdu7ch2LMg3kKdjZCn+YzDEowalhHg0JpSDJbx3uePsXdOqp
        bYZUh5kx/qoTf05i4EgMyBeRxDQNslO/ge4iyUhCSLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7HYZBF
        3dnJeAmCYfyptewgSm8YbWu7Y2F+flq1v4eRA=; b=llyjKAsAqc0VvqjlXSNCJ/
        UoD32k4kbs/ISoIHxpCl00KYhXuSteHeenOT1aLW3j7LyWebjxP26gPANmQpOQKO
        2Ht/SPOpdwOuYVDYkc0OH5Z8I28o/F4xTT8jT6yA1NIs09PY8G1Xc8liEKaBpV6u
        laqgvconMUVL4RTf+vs0B0Wi0rWdrBK1JBqof05nwsRAlkPXg35EeLLp6eddcwFM
        HwGXhJ7sfip1hdAcbwuE/GaSwWHzXBMh6kN32xaWuCBRbuTsIQ3eH/4PAANW3So4
        gh4+0AQdm1remwsPgHZRIl9JcqIkcFhO+sCPwieYZ3kHLuKM6I2yhkuFgNYjAeAg
        ==
X-ME-Sender: <xms:ZW5fXqDrMlX1vTacvtT0lHhabg7T1UZ8Qos34HxfQoEHwtWzhPCRrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddtjedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuffhomhgrihhnpehgihhthhhusg
    drtghomhenucfkphepkeefrdekiedrkeelrddutdejnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:ZW5fXpP6bmyEKu5jAhtiM-OrKZtr9w0fovArXPYSd-onyBFMJ7-72Q>
    <xmx:ZW5fXlelVZWHWhrdnqjZJq10uJ_v3vsIjFZsqAaaZJMjy3v6gMJTfQ>
    <xmx:ZW5fXsi86pjhaMyKE8rFX4d0wMA3cMbDlkaID9LblnoOxcrrXlJ8IQ>
    <xmx:Zm5fXvro550b_4TP1nc0iG74WKV76axdq9qNaM_ru0Mezon1WLIClQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 44B7B3061363;
        Wed,  4 Mar 2020 04:01:25 -0500 (EST)
Date:   Wed, 4 Mar 2020 10:01:20 +0100
From:   Greg KH <greg@kroah.com>
To:     Anthony Mallet <anthony.mallet@laas.fr>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: usb cdc-acm TIOCSSERIAL may wrongly report EPERM
Message-ID: <20200304090120.GA1429273@kroah.com>
References: <24140.5498.228141.264272@beetle.laas.fr>
 <1582106185.9787.9.camel@suse.com>
 <24141.6739.313167.448875@beetle.laas.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24141.6739.313167.448875@beetle.laas.fr>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 19, 2020 at 12:21:55PM +0100, Anthony Mallet wrote:
> On Wednesday 19 Feb 2020, at 10:56, Oliver Neukum wrote:
> > thank you for the detailed report about an unusual bug. Could you
> > test the attached patch?
> 
> I did not actually run it yet, but at first sight it seems that it will
> mishandle the ASYNC_CLOSING_WAIT_NONE case.
> 
> I attach patch 0002 which should handle all cases. I also inverted the
> logic of the CAP_SYS_ADMIN test, so that the delays are changed only
> if the rounded values (in 1/100th of seconds) are actually changed.
> 
> While I was there, I checked what other drivers do (it seems that many
> have the same issue). Something I also noticed is that the units are
> also maybe mishandled: internally the values seem to be in 'jiffies',
> not in msecs. See for instance:
> https://github.com/torvalds/linux/blob/701a9c8092ddf299d7f90ab2d66b19b4526d1186/drivers/tty/serial/serial_core.c#L780
> 
> So I added patch 0001 that uses the jiffies conversion functions. If
> you prefer to discuss this in a separate thread please tell me, I will
> redo just patch 0002 without this change.
> 
> 
> > I have taken the liberty of presuming to add your 'Reported-and-tested-by'.
> 
> Yes, no problem. Thank you.
> I hope my patches follow the required format, I'm not sure about all
> the details.


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

- Your patch was attached, please place it inline so that it can be
  applied directly from the email message itself.

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/SubmittingPatches and resend it after
  adding that line.  Note, the line needs to be in the body of the
  email, before the patch, not at the bottom of the patch or in the
  email signature.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
