Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C805A279726
	for <lists+linux-usb@lfdr.de>; Sat, 26 Sep 2020 07:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbgIZFpS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Sep 2020 01:45:18 -0400
Received: from wforward5-smtp.messagingengine.com ([64.147.123.35]:34263 "EHLO
        wforward5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726210AbgIZFpS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Sep 2020 01:45:18 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailforward.west.internal (Postfix) with ESMTP id 30EE15D4;
        Sat, 26 Sep 2020 01:45:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sat, 26 Sep 2020 01:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Sr+ind
        KzHp6oYp2oxR/q1hpzMJDeXc7R8/i9/pLsMVM=; b=f71Ds7bsfxNlm4ozsAgdcj
        loUpJjof6QwhQckaDdSqp19BCy/nHOttZ7cTHDIn1zAqmv1436eoBhcVnB0thy7+
        I5MiBQ3g7j5PFsj/+Iw4QGihhf5XFPUq+HqnRdB0qouAP5ly5Yf26XdlOF9g3l2h
        urFjMSHtnOTSxrFLv1oyIIlhIoWn24Yo+hVAWY0pbjtLsMNoc4QkQT00fypzOZmx
        o5nmGQBLO0gGmeGqN0D+HnxSOCMS9g9d/AX5ZxHWOetYNkpZ6ZqaivXULsmEy+Sl
        5AWgp+AAXrLgjdoH5xObzLuBeNae9ikO3MGCFTpntJQrHlzQpPqam/u3/dwEi+wg
        ==
X-ME-Sender: <xms:bNVuXyx4wB22saaHj1u1PnyEv1hZWb0K27fNR3W2oevqUFlc1UmSuQ>
    <xme:bNVuX-TOcM9pdg99xUOE-NoMNha97aMvT8gMJ-VuJ6CPMfDPzAtMfCJpgCEozevux
    cKhS3W1PnMU1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddugdelvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvghfmjfeslhhinhhugihfohhunhgurghtihhonhdrohhrgheqnecuggftrf
    grthhtvghrnheptedvleegfffguddtledvvddtteffjeetgfevveeugefgleelhfevveef
    udeuuddvnecukfhppeekfedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:bNVuX0VHeRY7H9agjrvTFLEaGK5UbgocFEHLMXaZEsZlW4FVnP2ZgQ>
    <xmx:bNVuX4jCKlaynFLRNM2QAW2TtOhewib-trng4Wdpk3ESpl4WsTpBtg>
    <xmx:bNVuX0DInpy68YSRvF_goYkJjhbCyLfN5b9aLIreryOzmlk7-6kV4w>
    <xmx:bNVuX96WVFux643c3OSPQCJVqGIK5Gqq61GlKLfluQu7jpk46DIABWA4BXc>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 29F5D3064680;
        Sat, 26 Sep 2020 01:45:16 -0400 (EDT)
Date:   Sat, 26 Sep 2020 07:45:14 +0200
From:   Greg KH <gregKH@linuxfoundation.org>
To:     Petko Manolov <petkan@nucleusys.com>
Cc:     oneukum@suse.com, linux-usb@vger.kernel.org,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: Re: [PATCH 1/2] net: pegasus: convert control messages to the new
 send/recv scheme.
Message-ID: <20200926054514.GD631346@kroah.com>
References: <20200923134348.23862-9-oneukum@suse.com>
 <20200925093124.22483-1-petkan@nucleusys.com>
 <20200925093124.22483-2-petkan@nucleusys.com>
 <20200925143730.GA3111407@kroah.com>
 <20200925160537.GA2128@carbon.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925160537.GA2128@carbon.lan>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 25, 2020 at 07:05:37PM +0300, Petko Manolov wrote:
> On 20-09-25 16:37:30, Greg KH wrote:
> > On Fri, Sep 25, 2020 at 12:31:23PM +0300, Petko Manolov wrote:
> > > From: Petko Manolov <petko.manolov@konsulko.com>
> > > 
> > > Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> > 
> > I really do not like to take patches without any changelog text at all
> > :(
> > 
> > Can you fix this up?
> 
> I am sorry about this.  Hope v2 is better.

Better, but still a bit more work is needed :)

thanks,

greg k-h
