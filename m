Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B69039FCD2
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jun 2021 18:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232982AbhFHQwC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Jun 2021 12:52:02 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:23007 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232933AbhFHQwB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Jun 2021 12:52:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623171008; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=EPeBBDVg4zoe90Bs4rHzNFvF0gnJwZnIY9ZIr01e01g=; b=Tp7P5xRlfh6PHvnu6NLQB+AguUTSVbVbf/iRh/Ff+Al54w2NnmKk+gnVr+QFcc5kOoudfBpK
 DxAhjHRyXgIw1pbK09oSFXjD5/pAmfE8hTuUo4QPoTDWPY201T+CkjLtD4hc4r5IHDTMUNHX
 vVvxK3qRZl9yUqJ/Lz6BWQw9+ug=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60bf9fbfabfd22a3dcde93ff (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 08 Jun 2021 16:50:07
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8E85CC433F1; Tue,  8 Jun 2021 16:50:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9C4A1C4338A;
        Tue,  8 Jun 2021 16:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9C4A1C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Tue, 8 Jun 2021 09:50:01 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/1] usb: dwc3: core: fix kernel panic when do reboot
Message-ID: <20210608164933.GA2601@jackp-linux.qualcomm.com>
References: <20210608105656.10795-1-peter.chen@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608105656.10795-1-peter.chen@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

On Tue, Jun 08, 2021 at 06:56:56PM +0800, Peter Chen wrote:
> When do system reboot, it calls dwc3_shutdown and the whole debugfs
> for dwc3 has removed first, when the gadget tries to do deinit, and
> remove debugfs for its endpoints, it meets NULL pointer dereference
> issue when call debugfs_lookup. Fix it by removing the whole dwc3
> debugfs later than dwc3_drd_exit.

Ouch, thanks for catching this! I think in your previous reply[1] you
did warn about the debugfs_remove_recursive() getting called twice, but
it seems here the issue is due to the debugfs_lookup() getting called on
a stale dwc->root pointer after it was already removed.

Fortunately this is slightly mitigated due to the recent revert commit
8f11fe7e4068[2]. So at least we might avoid the problem on the shutdown
path since remove won't get called. However it can still trigger if
dwc3_remove() is called in another way (driver unbind, module removal).

[1] https://lore.kernel.org/linux-usb/20210601070744.GA9087@nchen/
[2] https://lore.kernel.org/r/20210603151742.298243-1-alexandru.elisei@arm.com

> [ 2924.958838] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000002
> ....
> [ 2925.030994] pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=--)
> [ 2925.037005] pc : inode_permission+0x2c/0x198
> [ 2925.041281] lr : lookup_one_len_common+0xb0/0xf8
> [ 2925.045903] sp : ffff80001276ba70
> [ 2925.049218] x29: ffff80001276ba70 x28: ffff0000c01f0000 x27: 0000000000000000
> [ 2925.056364] x26: ffff800011791e70 x25: 0000000000000008 x24: dead000000000100
> [ 2925.063510] x23: dead000000000122 x22: 0000000000000000 x21: 0000000000000001
> [ 2925.070652] x20: ffff8000122c6188 x19: 0000000000000000 x18: 0000000000000000
> [ 2925.077797] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000004
> [ 2925.084943] x14: ffffffffffffffff x13: 0000000000000000 x12: 0000000000000030
> [ 2925.092087] x11: 0101010101010101 x10: 7f7f7f7f7f7f7f7f x9 : ffff8000102b2420
> [ 2925.099232] x8 : 7f7f7f7f7f7f7f7f x7 : feff73746e2f6f64 x6 : 0000000000008080
> [ 2925.106378] x5 : 61c8864680b583eb x4 : 209e6ec2d263dbb7 x3 : 000074756f307065
> [ 2925.113523] x2 : 0000000000000001 x1 : 0000000000000000 x0 : ffff8000122c6188
> [ 2925.120671] Call trace:
> [ 2925.123119]  inode_permission+0x2c/0x198
> [ 2925.127042]  lookup_one_len_common+0xb0/0xf8
> [ 2925.131315]  lookup_one_len_unlocked+0x34/0xb0
> [ 2925.135764]  lookup_positive_unlocked+0x14/0x50
> [ 2925.140296]  debugfs_lookup+0x68/0xa0
> [ 2925.143964]  dwc3_gadget_free_endpoints+0x84/0xb0
> [ 2925.148675]  dwc3_gadget_exit+0x28/0x78
> [ 2925.152518]  dwc3_drd_exit+0x100/0x1f8
> [ 2925.156267]  dwc3_remove+0x11c/0x120
> [ 2925.159851]  dwc3_shutdown+0x14/0x20
> [ 2925.163432]  platform_shutdown+0x28/0x38
> [ 2925.167360]  device_shutdown+0x15c/0x378
> [ 2925.171291]  kernel_restart_prepare+0x3c/0x48
> [ 2925.175650]  kernel_restart+0x1c/0x68
> [ 2925.179316]  __do_sys_reboot+0x218/0x240
> [ 2925.183247]  __arm64_sys_reboot+0x28/0x30
> [ 2925.187262]  invoke_syscall+0x48/0x100
> [ 2925.191017]  el0_svc_common.constprop.0+0x48/0xc8
> [ 2925.195726]  do_el0_svc+0x28/0x88
> [ 2925.199045]  el0_svc+0x20/0x30
> [ 2925.202104]  el0_sync_handler+0xa8/0xb0
> [ 2925.205942]  el0_sync+0x148/0x180
> [ 2925.209270] Code: a9025bf5 2a0203f5 121f0056 370802b5 (79400660)
> [ 2925.215372] ---[ end trace 124254d8e485a58b ]---
> [ 2925.220012] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [ 2925.227676] Kernel Offset: disabled
> [ 2925.231164] CPU features: 0x00001001,20000846
> [ 2925.235521] Memory Limit: none
> [ 2925.238580] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
> 
> Cc: Jack Pham <jackp@codeaurora.org>
> Fixes: 5ff90af9da8f ("usb: dwc3: debugfs: Add and remove endpoint dirs dynamically")
> Signed-off-by: Peter Chen <peter.chen@kernel.org>

You can also add

Tested-by: Jack Pham <jackp@codeaurora.org>

Thanks again and sorry for the regression!
Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
