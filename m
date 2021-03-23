Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A35F2345D1F
	for <lists+linux-usb@lfdr.de>; Tue, 23 Mar 2021 12:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbhCWLj4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Mar 2021 07:39:56 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:55561 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229452AbhCWLj1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Mar 2021 07:39:27 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 50AB21297;
        Tue, 23 Mar 2021 07:39:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 23 Mar 2021 07:39:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=1Guh2pLIQP+46ALvaCkNwEat7D0
        46/JwejDUMNxmN5U=; b=XoghNVCnlbTtNdYA9RsBEUIelGDL65exceD/js3rVJ/
        G9FYMom/78bX3LLsvTKpDapWmwnweKwl9eTo6mbnPrOG2q7D/NSVLQWGuq4wLGvz
        QobgF0pfLmC/rqdR/CVIGwLDLZeEF0dMN+wj0xEZSiEqxas87JYdWaMcORmv/FzJ
        jAEyZ68GyyY5zpEL/WrkuZi9jMmpyu3c7eO+pjXAmX54dliIVZ42z3qU/a9Vo0PG
        xpJ1hyyZB0s4to9CrvUQ+YVp0vLnUuXJzjom/4ETwtke3bJuEmul0uPXhBiRfYj2
        rlOkDi3UeqvIkx36t8w3g2+xt6HUobqXcET0x6YawCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1Guh2p
        LIQP+46ALvaCkNwEat7D046/JwejDUMNxmN5U=; b=Y5lN1h5Y6kxSnke2a0Jemq
        iQ8xvAv/w4QsmfYbakg0+kGtB3BFU+0GROhFD5wQxs77xDzK1CV+QMtelI0fzyTo
        BesS2lZUM4L5W5OanzxasiEYhpltiJHIoMMrgMRb44ME5VyyJvHrz/Q3fnuc/8nU
        ma+bg2VodISYH3qc2QxOKIEoZgVh2D2weU6QBB5Y/Qg1UfMPJKSuc68NYEXJm70t
        kextuwep67vvJ1klh+nt3bQX93SaVieG9AzAoqzr/12qGH9/xojBQj7rdZ9cb97H
        5VvktazkYNZAvtymfPuzxfUtG2VQYjY/uebZ1L9w39APMdohx4p1JO60cu91uu4g
        ==
X-ME-Sender: <xms:bdNZYI9hPke-ThSZHP1xUErU5F2xfAxi3ssZkrr3zDcRbbgJnOxSqw>
    <xme:bdNZYAsgAJuPiLwX9L4GT2KtzI2zckc3k7aTkVyYgXZbV84YH2mIVEKBJ4ugcs7s5
    25_0o--T0wOzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegiedgfeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtro
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepveehgfejiedtffefhfdvgeelieegjeegieffkeeiffejfe
    elhfeigeethfdujeeunecukfhppeekfedrkeeirdejgedrieegnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtoh
    hm
X-ME-Proxy: <xmx:bdNZYODeWyfEk9KDSmcAbawk3LzBv1yHJCfQ5fYy5mWWaEZotE1mEQ>
    <xmx:bdNZYIeRvkdnhjFXYHfS3ldwa5tjZt0BSyGfDGiStPH_lU4my1BZTw>
    <xmx:bdNZYNMEmzkuGzNHlzyFcXVnrGy2oj2L_I40EAFQtSHbPMVPA4sgbw>
    <xmx:bdNZYGa5RDH5qQXHKmDTCs059e6t8WgeWSSxnKq_jpKbJQ_ekR1hPQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id C61BE108005C;
        Tue, 23 Mar 2021 07:39:24 -0400 (EDT)
Date:   Tue, 23 Mar 2021 12:39:22 +0100
From:   Greg KH <greg@kroah.com>
To:     Jay Fang <f.fangjian@huawei.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        tangzihao1@hisilicon.com, huangdaode@huawei.com
Subject: Re: [PATCH] USB: gadget: f_fs: Use memdup_user() as a cleanup
Message-ID: <YFnTahyNTSQhdclP@kroah.com>
References: <1616145346-1410-1-git-send-email-f.fangjian@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616145346-1410-1-git-send-email-f.fangjian@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 19, 2021 at 05:15:46PM +0800, Jay Fang wrote:
> From: Zihao Tang <tangzihao1@hisilicon.com>
> 
> Fix coccicheck warning which recommends to use memdup_user():
> 
> drivers/usb/gadget/function/f_fs.c:3829:8-15: WARNING opportunity for memdup_user
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>
> Signed-off-by: Jay Fang <f.fangjian@huawei.com>
> ---
>  drivers/usb/gadget/function/f_fs.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 801a8b6..2f904f0 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -3826,14 +3826,7 @@ static char *ffs_prepare_buffer(const char __user *buf, size_t len)
>  	if (!len)
>  		return NULL;
>  
> -	data = kmalloc(len, GFP_KERNEL);
> -	if (!data)
> -		return ERR_PTR(-ENOMEM);
> -
> -	if (copy_from_user(data, buf, len)) {
> -		kfree(data);
> -		return ERR_PTR(-EFAULT);
> -	}
> +	data = memdup_user(buf, len);

You forgot the error checking :(

