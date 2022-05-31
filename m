Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AACF53900A
	for <lists+linux-usb@lfdr.de>; Tue, 31 May 2022 13:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343940AbiEaLsA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 May 2022 07:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242016AbiEaLsA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 May 2022 07:48:00 -0400
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A0B19809E
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 04:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=ITNfxWo3ySDbZME5MEwhIBenY4Ldrk/bO/lD6cNLlQk=; b=Fs5bv
        hRsx7WqOY9PQLAzpu9wy+TDDBkDuklqZWtj8/WC5un6DI8Qd2/QRLaFynriyxom9GTynitKcBsKvt
        lw4SQOil7Krd2Gp23mQI6cyhxO9R/iSxMgPT9jiTBf+H/oOC1qmru7KRhGRh6v66pZwQN5k2XsA6P
        wDtD5i2mRYtHRH+KH/9mnRNrU27RcoSh1wyfzjE3hvNFEC8dyftBVIpIDdXm/shV1u8R7SpgTMVEU
        TmWcuf7RdbMaSdy/Dbv7oyV74bnXJbtAbc3SgVjJU6QvHNeRJH3ygX0W1EwJmUEYa2qaBF2RjxPoD
        cR66bnmcsGALWqfNHRV//HsDmZFDA==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1nw0Lo-00076X-TE; Tue, 31 May 2022 12:47:52 +0100
Date:   Tue, 31 May 2022 12:47:51 +0100
From:   John Keeping <john@metanate.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Michael Wu <michael@allwinnertech.com>
Subject: Re: [PATCH v1 2/2] usb: gadget: ffs: change ep->ep safe in
 ffs_epfile_io()
Message-ID: <YpYAZ5Q0kYcHdq9T@donbot>
References: <1653989775-14267-1-git-send-email-quic_linyyuan@quicinc.com>
 <1653989775-14267-3-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1653989775-14267-3-git-send-email-quic_linyyuan@quicinc.com>
X-Authenticated: YES
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 31, 2022 at 05:36:15PM +0800, Linyu Yuan wrote:
> In ffs_epfile_io(), when read/write data in blocking mode, it will wait
> the completion in interruptible mode, if task receive a signal, it will
> terminate the wait, at same time, if function unbind occurs,
> ffs_func_unbind() will kfree all eps, ffs_epfile_io() still try to
> dequeue request by dereferencing ep which may become invalid.
> 
> Fix it by add ep spinlock and will not dereference ep if it is not valid.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>

Reviewed-by: John Keeping <john@metanate.com>

> ---
>  drivers/usb/gadget/function/f_fs.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index dcba835..b6c9b44 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -1077,6 +1077,11 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
>  		spin_unlock_irq(&epfile->ffs->eps_lock);
>  
>  		if (wait_for_completion_interruptible(&io_data->done)) {
> +			spin_lock_irq(&epfile->ffs->eps_lock);
> +			if (epfile->ep != ep) {
> +				ret = -ESHUTDOWN;
> +				goto error_lock;
> +			}
>  			/*
>  			 * To avoid race condition with ffs_epfile_io_complete,
>  			 * dequeue the request first then check
> @@ -1084,6 +1089,7 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
>  			 * condition with req->complete callback.
>  			 */
>  			usb_ep_dequeue(ep->ep, req);
> +			spin_unlock_irq(&epfile->ffs->eps_lock);
>  			wait_for_completion(&io_data->done);
>  			interrupted = true;
>  		}
> -- 
> 2.7.4
> 
