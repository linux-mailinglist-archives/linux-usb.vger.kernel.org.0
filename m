Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B86A26BF75
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 10:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbgIPIhU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 04:37:20 -0400
Received: from forward3-smtp.messagingengine.com ([66.111.4.237]:57989 "EHLO
        forward3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726571AbgIPIhT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Sep 2020 04:37:19 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailforward.nyi.internal (Postfix) with ESMTP id C56C31941E7E;
        Wed, 16 Sep 2020 04:37:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 16 Sep 2020 04:37:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=aLsPB3
        oIyB61RlTNMZtc9Pv0eK/BIL9eShZUMmzt6/E=; b=mfcNZbiCCGj7uysE3oYrU/
        mWN4aHnwgMitBkRc5qRRkhwDu1Iw8xBbuSit93HCOqFJ8jGTnMsF7MePX/0BHW3n
        8fwG2s6TCJ8ZxCG4dFo1lgwondlNUzQdLn5KGn3M6UduZv/uyiZQmdX+lSHryTtE
        jIYmJwTej6MnK4ZR+JUgn/3EIJjeTPh7VZ6NLKxCrOewhmWlytgICtgtwvnAgrVZ
        /BuQj8oXNlKXjT2rIH/uSjFRsLwsk61z1i5tsCrkMcm6YsiH+DViVWLit2zMfcZv
        +2JLmcEqueLmeU5tN8Ow69o7HXDivw5Lm0QkFllDMsGGpIuUL/5idBnULT5I38vQ
        ==
X-ME-Sender: <xms:vM5hX0nJFXbMaMC8EvUB3XggMjbAb7RvQn6o2OktQWgyTR-bSRPspQ>
    <xme:vM5hXz1mYP_fsCdPLbXLgB0wXNfzRZ0Fk3yugi8QL2DNki6_NexyWkoCAngosRjRN
    4BZ9g7L8vKwag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtddvgddtiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvghfmjfeslhhinhhugihfohhunhgurghtihhonhdrohhrgheqnecuggftrf
    grthhtvghrnheptedvleegfffguddtledvvddtteffjeetgfevveeugefgleelhfevveef
    udeuuddvnecukfhppeekfedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:vM5hXyqugnUkIGlxXsDnfOe9L0EPplS3Igdgtmt2Sy6ZfT58QDI-yg>
    <xmx:vM5hXwlQubDkdQf5yXA6q6phX6NyrBl24IfPIv_Jyz-iUZGnIa-NCg>
    <xmx:vM5hXy3uXo8jfmf9vOw-FbQsalD5nU7hyV9eo0fLVTAu9Lc6n9VEiA>
    <xmx:vM5hX7hDguR5UIkO0EXKVbm917A6qLgDUu8-dSJnCbZAOH95c8cGMQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2D6C33064674;
        Wed, 16 Sep 2020 04:37:16 -0400 (EDT)
Date:   Wed, 16 Sep 2020 10:37:51 +0200
From:   Greg KH <gregKH@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] UAS: fix disconnect by unplugging a hub
Message-ID: <20200916083751.GB676008@kroah.com>
References: <20200915134501.13947-1-oneukum@suse.com>
 <20200915134501.13947-3-oneukum@suse.com>
 <20200915140058.GA914700@kroah.com>
 <1600243885.2424.10.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600243885.2424.10.camel@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 16, 2020 at 10:11:25AM +0200, Oliver Neukum wrote:
> Am Dienstag, den 15.09.2020, 16:00 +0200 schrieb Greg KH:
> > On Tue, Sep 15, 2020 at 03:45:01PM +0200, Oliver Neukum wrote:
> > > The SCSI layer can go into an ugly loop if you ignore that a device
> > > is gone. You need to report an error in the command rather than
> > > in the return value of the queue method.
> > > We need to specifically check for ENODEV..
> > > 
> > > Signed-off-by: Oliver Neukum <oneukum@suse.com>
> > > ---
> > >  drivers/usb/storage/uas.c | 14 ++++++++++++--
> > >  1 file changed, 12 insertions(+), 2 deletions(-)
> > 
> > Should this one go to the stable kernels?
> 
> Hi,
> 
> in theory yes, but it depends on the previous patch.
> Should I submit a separate patch?

Reordering these would be best, thanks!

greg k-h
