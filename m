Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 285C3377163
	for <lists+linux-usb@lfdr.de>; Sat,  8 May 2021 13:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbhEHLTE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 May 2021 07:19:04 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:60419 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230234AbhEHLTE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 May 2021 07:19:04 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 095835C00DC;
        Sat,  8 May 2021 07:18:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 08 May 2021 07:18:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=PnPilUIeKY1bK1Cl+7p4wjy3qwF
        596IUuFTHCuzIuKE=; b=UArHAlAG/XshTVfs5MWvf+P1ipyxQgCkvsOa4N1xNea
        /8U09QpY2gKcVz+OWezMbUgj6x6b0Q2UECMYagtBrk6U5XguC2drMCVo8mxdR5fJ
        x1VGMJkg5GjzkQbpjBDocmWOABAq3PQnfzclhkQTSZrRV9amU/HDeVsVLPDOnd12
        JIUbMqQgjndUVgAvd1jhXXXf+StCRbT/0mWf0PnXjLV1ZRWm5bNLMXw9pDmkM8Nm
        aawyTdlLLu304Dux7QqVCKt+J3IBTD5MF0+BLdQqiS6/x4m0hSdgmsxT75/1Yf+i
        js1kSdAM6kMEb8lawD75q8qgaysj4wi6bDzkTMv5oSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=PnPilU
        IeKY1bK1Cl+7p4wjy3qwF596IUuFTHCuzIuKE=; b=cNZEPzDrDLd2cGwe1vHHFQ
        ycFHsWuDKgCEFNudDYfv/D+/f9LPQLEy0GKfNImjU9W/6VJTv67xpI4INJnl5WGE
        zfK3bnwbo5rFkS3jBcDTQyOfImWTcEAzLaEcyZGYGwzHapUTKwvJmu4FKKYVhht2
        oMwSFZYzif7lRIK2ZngBc6rpAYCCKmQmOIQSwS1Qh0cZNbH9fpsTpJiQqOoOH6y9
        5CXDd1rd3Gk2bg8Pj9Vynj/szQeIY+lc+S1TNrJkoOa7Muiq1NlE2iO/6mvm1JeT
        zT1rGoSRUlIgxH7MxL50FCKy7Qi//wgueqIkvHEpy6q9XN0Nm6bcgLrW2I0AVLsA
        ==
X-ME-Sender: <xms:anOWYPwXiiesgHksBjcNYHxDYcWx6ciK7hgadyNZe_DXICclGU5sdA>
    <xme:anOWYHS6ntPUBNrqajaoQQI_yGHB7dOP-GW6HffFy7OWtMaGrpO-Rva450Q_aay9j
    0hxPtN6SNXQgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeggedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtro
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepvdehfeekhedtgfefudethfeiieeffefgudehjedvvddtte
    evffeiudegveelveeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgs
    rdgtohhmnecukfhppeekfedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:anOWYJXzaShkQIDUq6uUkL0H8qy4WLR1Mk_OeUT2TmCEkKXQLCOLeA>
    <xmx:anOWYJgANG40ZAG6D5dcw49Dipf5j-1gjUn1SlPCqAwj4kCuP0kXLA>
    <xmx:anOWYBCVED0LQhIOnfhds5FOrpGAAecS6M43hDw3DDFdmNx6EYY2rQ>
    <xmx:a3OWYO6GYRoO88BYOmZoImIS1FDgtPbAJ0jbWbB5zKho159qNxKs9A>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Sat,  8 May 2021 07:18:02 -0400 (EDT)
Date:   Sat, 8 May 2021 13:18:00 +0200
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 212995] New: A possible divide by zero in qh_urb_transaction
Message-ID: <YJZzaGrRbGYLuWRj@kroah.com>
References: <bug-212995-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-212995-208809@https.bugzilla.kernel.org/>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 08, 2021 at 11:14:25AM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=212995
> 
>             Bug ID: 212995
>            Summary: A possible divide by zero in qh_urb_transaction
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.12.2
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: yguoaz@gmail.com
>         Regression: No
> 
> In the file drivers/usb/host/ehci-q.c, the function qh_urb_transaction has the
> following code (link to the code location:
> https://github.com/torvalds/linux/blob/dd860052c99b1e088352bdd4fb7aef46f8d2ef47/drivers/usb/host/ehci-q.c#L715):
> 
> maxpacket = usb_maxpacket(urb->dev, urb->pipe, !is_input);
> ...
> if (usb_pipeout(urb->pipe) && (urb->transfer_flags & URB_ZERO_PACKET)
>                            && !(urb->transfer_buffer_length % maxpacket))
> 
> However, the function usb_maxpacket may retun 0, leading to a possible divide
> zero problem in the remainder operation:

Please feel free to submit a patch to the developers, but first see how
it could be possible for usb_maxpacket to ever return 0 for this.  Are
you sure it's not already sanitized by the time it gets here?

thanks,

greg k-h
