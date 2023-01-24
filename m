Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAFDE6795CB
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jan 2023 11:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233652AbjAXKxf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Jan 2023 05:53:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233605AbjAXKxe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Jan 2023 05:53:34 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E370AEFB5
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 02:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=e/bpsoqeHZ/s06n74HGf7fiNqPP0IXdFuUfXiai3+5M=; b=Hn4Xa
        DfqDxY0paiqo5FNxwQfRcHqSLSTAh0jxgJK9x0t6DF9oP8pRevlevx83ZI3KgA6DV/qiJx6Ym7bwp
        b2Zf5pQn2DLoeYqyo+PwKLrWJDxbQIBtozXAYdUOuFfxGwjGIR/Bpt1EnV1ueLpP5v6gTQ+OhLdu8
        Iq73OHJGa/SNKckP6JrNQY4sFBmEil/TMNJzfU+Subt1PUUmOQf0YT2irlAl5101vUm6nkQm3RIBq
        d2X1Kuqi6kaWj7U0sLFLv1g/TjFzLXpX34+vAdGDfrAJIP9jzgjzKvUDW7HESAYEFbej3u9u4u+gF
        0JqoSp0kUHyMD3h/fuawaK2B1F0kA==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <john@metanate.com>)
        id 1pKGvi-0008W4-3D;
        Tue, 24 Jan 2023 10:53:30 +0000
Date:   Tue, 24 Jan 2023 10:53:28 +0000
From:   John Keeping <john@metanate.com>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Dan Carpenter <error27@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Pratham Pratap <quic_ppratap@quicinc.com>
Subject: Re: [PATCH] usb: gadget: f_fs: Fix unbalanced spinlock in
  __ffs_ep0_queue_wait
Message-ID: <Y8+4qAqyKp64iqzQ@donbot>
References: <20230124091149.18647-1-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124091149.18647-1-quic_ugoswami@quicinc.com>
X-Authenticated: YES
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 24, 2023 at 02:41:49PM +0530, Udipto Goswami wrote:
> __ffs_ep0_queue_wait executes holding the spinlock of &ffs->ev.waitq.lock
> and unlocks it after the assignments to usb_request are done.
> However in the code if the request is already NULL we bail out returning
> -EINVAL but never unlocked the spinlock.
> 
> Fix this by adding spin_unlock_irq &ffs->ev.waitq.lock before returning.
> 
> Fixes: 6a19da111057("usb: gadget: f_fs: Prevent race during ffs_ep0_queue_wait")
> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>

Reviewed-by: John Keeping <john@metanate.com>

> ---
>  drivers/usb/gadget/function/f_fs.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 523a961b910b..8ad354741380 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -279,8 +279,10 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
>  	struct usb_request *req = ffs->ep0req;
>  	int ret;
>  
> -	if (!req)
> +	if (!req) {
> +		spin_unlock_irq(&ffs->ev.waitq.lock);
>  		return -EINVAL;
> +	}
>  
>  	req->zero     = len < le16_to_cpu(ffs->ev.setup.wLength);
>  
> -- 
> 2.17.1
> 
