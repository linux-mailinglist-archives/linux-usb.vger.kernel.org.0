Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0F5910AAD7
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2019 07:55:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbfK0GzX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Nov 2019 01:55:23 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:36229 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726281AbfK0GzX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Nov 2019 01:55:23 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id F1887948;
        Wed, 27 Nov 2019 01:55:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 27 Nov 2019 01:55:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=Fnh93xvY+sEJGHFFgEbHiCaLzHu
        JgzCqGygPt0+g9mM=; b=FnSFx+OQMsKAkyuj/1hUwacpAKWmzJsasgMXSjA1j7s
        Z5W8BXfOmk1/sharZBsrUIG/kaywz2KfpQm7oNv0dorz/sWrgb7zCmaIMpmwkxP1
        EBa+DxfxDaYlRdq2U8nxxiS2h5zmw5EYd9yvCwze5J6QWPEEku3WgPTZLZqXXTim
        qHTSmDFTcUU1YTAM2ZokPNV2lX2t9oljkoa9N4N885NgeK3LQfobzh02sA0jH5b4
        CdLoVCmAa8mxlRWCGeoLaEMH/IdP7tjAK+VwGKO+hMnQT+i9N2r89gQpTGk3AE9I
        80ICzP/qUc0lP7UYv5ZEmXBCxuCWQD6DqFE2Ka+1Dgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Fnh93x
        vY+sEJGHFFgEbHiCaLzHuJgzCqGygPt0+g9mM=; b=UBSnBLKPHWBXWfuks7VVAb
        vzNHqyArUbW1kP6FjEVQ37kY1tn3GWsmk9D1XMwDI1k9u/7yBXWFXa4rBys+gsHg
        7bRc+GIulKCE+atwe5xArTp5iJcmF2eMsxjkY5hr/kcqddDX1UkKvM51bgEyaM4G
        pLBLJEEL7oN5E7/y7Uwxe7NXFTL+nIMwwSPsKfcvCSfd26iZYRynZ68azi8hKYaY
        vctYjTbF9hspifkcPN/z/mCoWmX0dWwuXKsSvL6EfApnWK0pdR5QRc8FcYsVwlBD
        yDT/mI6CEcoFiEsbnxPwNrIwhuyLa+pqRnOaAgqL2qTPf/OTwUKXTJdq0NxXj1Fg
        ==
X-ME-Sender: <xms:2R3eXYy107v5IV81lmjoPLB-fNyDpP3VXrBxDud3nfp4M56oe6xUUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeigedguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrd
    dutdejnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhen
    ucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:2R3eXdE4bOa6yvixgo7DaCzppSrkU_QpScbr2W7znHTNbp8ktqF9NA>
    <xmx:2R3eXY43FJwwuiAfOq67q878OLYabvkc5s2s2f2aChVD4MMQ4-8B0g>
    <xmx:2R3eXcVn9mqDP0spojIO9Q0FC1TAJ8OMDBnPtfNVo_9tfMOVnc7FDg>
    <xmx:2R3eXS3T7jtAzweItfe5_4NG7bil58hD7uAxCXKgFWor74XCR-6VwA>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id F360C306005C;
        Wed, 27 Nov 2019 01:55:20 -0500 (EST)
Date:   Wed, 27 Nov 2019 07:55:19 +0100
From:   Greg KH <greg@kroah.com>
To:     Pete Zaitcev <zaitcev@redhat.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: mon: Fix a deadlock in usbmon between mmap and read
Message-ID: <20191127065519.GA1724976@kroah.com>
References: <20191126004407.4b72ef7f@suzdal.zaitcev.lan>
 <Pine.LNX.4.44L0.1911261018110.1508-100000@iolanthe.rowland.org>
 <20191126223509.69fb61ed@suzdal.zaitcev.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191126223509.69fb61ed@suzdal.zaitcev.lan>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 26, 2019 at 10:35:09PM -0600, Pete Zaitcev wrote:
> On Tue, 26 Nov 2019 10:20:14 -0500 (EST)
> Alan Stern <stern@rowland.harvard.edu> wrote:
> 
> > > Signed-off-by: Pete Zaitcev <zaitcev@redhat.com>
> > > Reported-by: syzbot+56f9673bb4cdcbeb0e92@syzkaller.appspotmail.com  
> > 
> > Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
> 
> Thanks.
> 
> > Fixes: 46eb14a6e158 ("USB: fix usbmon BUG trigger")
> 
> Indeed... Either I didn't think that one through, or the copy_to_user
> used not to take the mmap_sem.
> 
> > CC: <stable@vger.kernel.org>
> 
> Do we really need this? The problem was in the code for more than 10 years.
> It's not like anyone is exploiting systems because of it.

Well now we all have a simple reproducer for it, so yes, it should be
backported.  I'm doing that for all of the syzbot stuff.

> If we do need it, I should cc: the submission to the same place too, right?

Nope, the tag is just fine, that's all that is needed.  I'll add the
above to the patch when applying it to my trees.

thanks,

greg k-h
