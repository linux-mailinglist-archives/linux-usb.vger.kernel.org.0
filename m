Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8677E26B6D1
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 02:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727150AbgIPAMC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Sep 2020 20:12:02 -0400
Received: from forward4-smtp.messagingengine.com ([66.111.4.238]:36407 "EHLO
        forward4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726847AbgIOO0a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Sep 2020 10:26:30 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailforward.nyi.internal (Postfix) with ESMTP id 1FE201940B9D;
        Tue, 15 Sep 2020 10:01:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 15 Sep 2020 10:01:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Tj1t3x
        ABHZjsC2NjqJwZYpMhXu3dpb7qewiHFHSRUdc=; b=J0GR7UMVLfoLYUWKI+xxmz
        fCPrr0ZNYS9aVHuzp7DoFy2XsMNfiBoD8RNdWPVQQu5rl+DelMBPZQsLrNsHvUq4
        yu8nzbWi7qGAakcgJeHSwEhFHIhfgEy8x0BGCNAtQP+Aoe49zkZ0rc1SXA7Tfh2h
        C/NE+zKeFLH+TyGMV58+7mPWyqo1BmhMsUkWPzlu0cKloB3eh+yPHBFWhU849tYC
        xLl9wNIHohfE09fZmchBRk9jUETgYIzSpm1Cth6dSrIo9maShjUZ4Ruad2H9Gz7R
        B3ncBRqar3R8DB3X8ZwAyvfhSP8BchCgimGU3qyETGZ2pkZmvWW+2CNSLVl4S+pA
        ==
X-ME-Sender: <xms:HclgX9ltR_85DNvwb-Fa2CzmFuKCyoVl8CWMPdcLIoBC8SqSJ8iwlA>
    <xme:HclgX43XHJiQ0-miLzuPzvRat_N8jXpU3vlh-BKs6e8C9DFeN0RZLojbIBD8Z9Hz6
    LopKkazpPysKg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtddtgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvghfmjfeslhhinhhugihfohhunhgurghtihhonhdrohhrgheqnecuggftrf
    grthhtvghrnheptedvleegfffguddtledvvddtteffjeetgfevveeugefgleelhfevveef
    udeuuddvnecukfhppeekfedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:HclgXzrNTKEpyDtPFHNSH_BcTBJ_qP4tQSGiIw_3KYwjOZBOiisymw>
    <xmx:HclgX9npcHAvNopZ_XnVgm1FnKnO-sWmX_6bvZLPQI8N9XuceX_TUA>
    <xmx:HclgX71LfFAwsVhlfbAVJJC_0TeRlUPHEy_-wuKFdAuZpJkmiohoRQ>
    <xmx:HslgXwiPva-ZQuxM2p6GcMcdZqRulYohXcKnMd6sVXdk_nutAEWnIQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 33E7C306468F;
        Tue, 15 Sep 2020 10:01:01 -0400 (EDT)
Date:   Tue, 15 Sep 2020 16:00:58 +0200
From:   Greg KH <gregKH@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] UAS: fix disconnect by unplugging a hub
Message-ID: <20200915140058.GA914700@kroah.com>
References: <20200915134501.13947-1-oneukum@suse.com>
 <20200915134501.13947-3-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915134501.13947-3-oneukum@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 15, 2020 at 03:45:01PM +0200, Oliver Neukum wrote:
> The SCSI layer can go into an ugly loop if you ignore that a device
> is gone. You need to report an error in the command rather than
> in the return value of the queue method.
> We need to specifically check for ENODEV..
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/storage/uas.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)

Should this one go to the stable kernels?

thanks,

greg k-h
