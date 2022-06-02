Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D82D953B76F
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jun 2022 12:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233969AbiFBKjx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jun 2022 06:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233961AbiFBKjw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jun 2022 06:39:52 -0400
Received: from out28-170.mail.aliyun.com (out28-170.mail.aliyun.com [115.124.28.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C952B12E8
        for <linux-usb@vger.kernel.org>; Thu,  2 Jun 2022 03:39:44 -0700 (PDT)
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.108735|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0278941-0.000402114-0.971704;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047199;MF=michael@allwinnertech.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.NxwOw2L_1654166370;
Received: from 192.168.220.136(mailfrom:michael@allwinnertech.com fp:SMTPD_---.NxwOw2L_1654166370)
          by smtp.aliyun-inc.com(33.37.88.87);
          Thu, 02 Jun 2022 18:39:41 +0800
Message-ID: <0732d4f3-5359-0d9d-94b9-66a7403dc7d8@allwinnertech.com>
Date:   Thu, 2 Jun 2022 18:39:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 2/2] usb: gadget: f_fs: change ep->ep safe in
 ffs_epfile_io()
Content-Language: en-US
To:     Linyu Yuan <quic_linyyuan@quicinc.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, John Keeping <john@metanate.com>
References: <1654056916-2062-1-git-send-email-quic_linyyuan@quicinc.com>
 <1654056916-2062-3-git-send-email-quic_linyyuan@quicinc.com>
From:   Michael Wu <michael@allwinnertech.com>
In-Reply-To: <1654056916-2062-3-git-send-email-quic_linyyuan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 6/1/2022 12:15 PM, Linyu Yuan wrote:
> In ffs_epfile_io(), when read/write data in blocking mode, it will wait
> the completion in interruptible mode, if task receive a signal, it will
> terminate the wait, at same time, if function unbind occurs,
> ffs_func_unbind() will kfree all eps, ffs_epfile_io() still try to
> dequeue request by dereferencing ep which may become invalid.
> 
> Fix it by add ep spinlock and will not dereference ep if it is not valid.
> 
> Reported-by: Michael Wu <michael@allwinnertech.com>
> Reviewed-by: John Keeping <john@metanate.com>
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v2: add Reviewed-by from John keeping
> v3: add Reported-by from Michael Wu
> 
>   drivers/usb/gadget/function/f_fs.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index d4d8940..9bf9287 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -1077,6 +1077,11 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
>   		spin_unlock_irq(&epfile->ffs->eps_lock);
>   
>   		if (wait_for_completion_interruptible(&io_data->done)) {
> +			spin_lock_irq(&epfile->ffs->eps_lock);
> +			if (epfile->ep != ep) {
> +				ret = -ESHUTDOWN;
> +				goto error_lock;
> +			}
>   			/*
>   			 * To avoid race condition with ffs_epfile_io_complete,
>   			 * dequeue the request first then check
> @@ -1084,6 +1089,7 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
>   			 * condition with req->complete callback.
>   			 */
>   			usb_ep_dequeue(ep->ep, req);
> +			spin_unlock_irq(&epfile->ffs->eps_lock);
>   			wait_for_completion(&io_data->done);
>   			interrupted = io_data->status < 0;
>   		}

Tested-by: Michael Wu <michael@allwinnertech.com>

I've tested Linyu's patches [PATCH v3 1/2] [PATCH v3 2/2]. I believe it 
fixes the bug I reported.

What's more, John's solution [1] also works in my tests. It looks 
simpler. I'm not sure if it's as complete as Linyu's solution.


[1] https://lore.kernel.org/linux-usb/YpUJkxWBNuZiW7Xk@donbot/


-- 
Regards,
Michael Wu
