Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56D192756F3
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 13:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgIWLQA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 07:16:00 -0400
Received: from wforward2-smtp.messagingengine.com ([64.147.123.31]:38749 "EHLO
        wforward2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726332AbgIWLQA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Sep 2020 07:16:00 -0400
X-Greylist: delayed 533 seconds by postgrey-1.27 at vger.kernel.org; Wed, 23 Sep 2020 07:16:00 EDT
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailforward.west.internal (Postfix) with ESMTP id 9C4ED79A;
        Wed, 23 Sep 2020 07:07:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 23 Sep 2020 07:07:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=QJ4ejx
        JDqTxfbZVhW/Ptcn86q4+/VCpzl8dvQmkfoPA=; b=UluWS7fR1nsZFnhj8ZknxE
        H6rDZGUM2C9dznipmxyfBNRysg6dLM1UdB2S/PwNU3SKIfbmHLBYcw86j8DBSGg4
        4KHT3CPUS8cyoALIMj6MW60k4IUpSHzytnOrxEJDZFY8p2IVIOt89A2IHpsJ0OhT
        btz8wJ4DXA5o+KIy6MgbXdk1y29QhRhivrb6kpUXpGeEFqKdLEfVv2To/LFE0Xg1
        t2rjr49VFs2LqFc79GHbOiBCmCu8qQ92JcprdCwYVZ0CRlSf4EmofrfJkspfYGjF
        X5W4yamvJZkLk/Xz+fc59DqExYTeJeil/4MnAElXUsY14hHZYntMeaD48HTzv32Q
        ==
X-ME-Sender: <xms:WixrX22aIolg5gxWFay2Mt31wdBiyixzS4Jqomxda9t1fXmERUJykQ>
    <xme:WixrX5HK66Tn7ldvXZqEQhZaqXu9as4nlv3T64ptmGFVcsy5BtbpVlnxQm3Pu_Yxw
    TYEi27HDh37vg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeigdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvghfmjfeslhhinhhugihfohhunhgurghtihhonhdrohhrgheqnecuggftrf
    grthhtvghrnheptedvleegfffguddtledvvddtteffjeetgfevveeugefgleelhfevveef
    udeuuddvnecukfhppeekfedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:WixrX-7db4OlIcUizbD72b8e0DABmVR25uHN227V5X7XIRdTDa1npg>
    <xmx:WixrX32-ULh-uNap3ZHtqmgNUKAxARtkyPungkt4BS3zgfEmiMrFww>
    <xmx:WixrX5EtBUODl5cvmh2gq5t_fQdeUlAH3K7OEvtP6MR0U0UU3RIwuA>
    <xmx:WixrX3M8IC-AR0nmj5H0SjPSBIBUm0b9yDUXeb_CxZ8QAPWatfsj7OMNby4>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9A83B328005D;
        Wed, 23 Sep 2020 07:07:05 -0400 (EDT)
Date:   Wed, 23 Sep 2020 13:07:24 +0200
From:   Greg KH <gregKH@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Himadri Pandya <himadrispandya@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org
Subject: Re: usb_control_msg_send() and usb_control_msg_recv() are highly
 problematic
Message-ID: <20200923110724.GA3692555@kroah.com>
References: <1600858740.26851.16.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600858740.26851.16.camel@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 23, 2020 at 12:59:00PM +0200, Oliver Neukum wrote:
> Hi,
> 
> you probably do not want to hear this. I was out of comission
> for the last week weeks and I should have looked at this more closely.
> 
> You may notice that usb_control_msg() for times immemorial has been
> using GFP_NOIO internally. This is because control messages are needed
> in a lot of contexts such as SCSI error handling and runtime PM
> that require GFP_NOIO. IIRC at that time we found ourselves unable to
> go through all those call chains, so we pulled the nuclear option
> and slapped a blanket GFP_NOIO on the function.
> 
> Today I got a patch that outright deleted a memory allocation with
> GFP_NOIO, so I looked into this. We are making the same mistake
> we couldn't fix in the past.
> I am afraid the API has to be changed to include memory flags.
> And we should do this now while the damage is still within limits.
> I am preparing patches.

How about we always use GPF_NOIO for the calls?  That should be fine and
make it easier, right?

thanks,

greg k-h
