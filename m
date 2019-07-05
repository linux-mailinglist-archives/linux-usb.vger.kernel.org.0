Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DBA6605F5
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2019 14:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbfGEMei (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jul 2019 08:34:38 -0400
Received: from gate.crashing.org ([63.228.1.57]:40715 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727341AbfGEMei (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jul 2019 08:34:38 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x65CYRje024361;
        Fri, 5 Jul 2019 07:34:28 -0500
Message-ID: <5341a521672649389e67256fcba9236d673bfb5b.camel@kernel.crashing.org>
Subject: Re: [PATCH V3] usb: gadget: storage: Remove warning message
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     EJ Hsu <ejh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        WK Tsai <wtsai@nvidia.com>
Date:   Fri, 05 Jul 2019 22:34:27 +1000
In-Reply-To: <BN7PR12MB2644CE5F029CD6A5DE353D88CFF50@BN7PR12MB2644.namprd12.prod.outlook.com>
References: <BN7PR12MB26449A2DC32EC2767CBF6687CFFA0@BN7PR12MB2644.namprd12.prod.outlook.com>
         <Pine.LNX.4.44L0.1907041204570.18767-100000@netrider.rowland.org>
         <BN7PR12MB2644CE5F029CD6A5DE353D88CFF50@BN7PR12MB2644.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-07-05 at 10:49 +0000, EJ Hsu wrote:
> The change for my previous patch is as follows, and it works well on my local test.
> 
> Thanks,
> EJ
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index 982c3e8..b5f1e1e 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -2306,7 +2306,6 @@ static void handle_exception(struct fsg_common *common)
>         enum fsg_state          old_state;
>         struct fsg_lun          *curlun;
>         unsigned int            exception_req_tag;
> -       struct fsg_dev          *fsg;
> 
>         /*
>          * Clear the existing signals.  Anything but SIGUSR1 is converted
> @@ -2413,15 +2412,9 @@ static void handle_exception(struct fsg_common *common)
>                 break;
> 
>         case FSG_STATE_CONFIG_CHANGE:
> -               fsg = common->new_fsg;
> -               /*
> -                * Add a check here to double confirm if a disconnect event
> -                * occurs and common->new_fsg has been cleared.
> -                */
> -               if (fsg) {
> -                       do_set_interface(common, fsg);
> +               do_set_interface(common, common->new_fsg);
> +               if (common->new_fsg)
>                         usb_composite_setup_continue(common->cdev);
> -               }
>                 break;
> 
>         case FSG_STATE_DISCONNECT:
> diff --git a/drivers/usb/gadget/function/storage_common.h b/drivers/usb/gadget/function/storage_common.h
> index 12687f7..fc13921 100644
> --- a/drivers/usb/gadget/function/storage_common.h
> +++ b/drivers/usb/gadget/function/storage_common.h
> @@ -160,8 +160,8 @@ enum fsg_state {
>         FSG_STATE_NORMAL,
>         FSG_STATE_ABORT_BULK_OUT,
>         FSG_STATE_PROTOCOL_RESET,
> -       FSG_STATE_CONFIG_CHANGE,
>         FSG_STATE_DISCONNECT,
> +       FSG_STATE_CONFIG_CHANGE,
>         FSG_STATE_EXIT,
>         FSG_STATE_TERMINATED
>  };

Is this patch against some other patch ? Please send the whole thing so
people don't have to go digging in archives to figure what the code
looks like. The above by itself doesn't make sense and can't be
reviewed.

However, I have a strong suspicion that if you still need to test
new_fsg before calling usb_composite_setup_continue(). Then you haven't
fixed the bug that I describe.

Cheers,
Ben.


