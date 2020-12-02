Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77A382CB2FC
	for <lists+linux-usb@lfdr.de>; Wed,  2 Dec 2020 03:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727963AbgLBC4d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Dec 2020 21:56:33 -0500
Received: from a2.mail.mailgun.net ([198.61.254.61]:15410 "EHLO
        a2.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727746AbgLBC4c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Dec 2020 21:56:32 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606877772; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=E0hWXaFCBMy4dUWssM34EP0Ge9+sL3sdeZsbZNYq+zo=; b=XBYmRe3RfRoka0mrdwb7kF5/OylBfRNczzjSIhraCGe6/z9wlVKMO4Sn69v+3nOT60irw0Tf
 +8IX/WKUHjTZjqHm70mJK/ZTDXmprNRuS9t/XijjwPZESE+sCK+x22HUBApMhAgGnPFXrQ55
 9dPLDhANdzXXthfxnv3nQo4P9E0=
X-Mailgun-Sending-Ip: 198.61.254.61
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fc70231f4482b01c4b59d29 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Dec 2020 02:55:45
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EAC0DC43463; Wed,  2 Dec 2020 02:55:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 65B4EC433ED;
        Wed,  2 Dec 2020 02:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 65B4EC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Tue, 1 Dec 2020 18:55:38 -0800
From:   Jack Pham <jackp@codeaurora.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: f_fs: Use local copy of descriptors for
 userspace copy
Message-ID: <20201202025538.GA20623@jackp-linux.qualcomm.com>
References: <20201130203453.28154-1-jackp@codeaurora.org>
 <20201201084245.GC11393@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201084245.GC11393@b29397-desktop>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

(removed Vamsi as he has moved on from USB and his email address is
bouncing)

Hi Peter,

On Tue, Dec 01, 2020 at 08:43:14AM +0000, Peter Chen wrote:
> On 20-11-30 12:34:53, Jack Pham wrote:
> > From: Vamsi Krishna Samavedam <vskrishn@codeaurora.org>
> > 
> > The function may be unbound causing the ffs_ep and its descriptors
> > to be freed while userspace is in the middle of an ioctl requesting
> > the same descriptors. Avoid dangling pointer reference by first
> > making a local copy of desctiptors before releasing the spinlock.
> > 
> > Fixes: c559a3534109 ("usb: gadget: f_fs: add ioctl returning ep descriptor")
> > Signed-off-by: Vamsi Krishna Samavedam <vskrishn@codeaurora.org>
> > Signed-off-by: Jack Pham <jackp@codeaurora.org>
> > ---
> >  drivers/usb/gadget/function/f_fs.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > index 046f770a76da..c727cb5de871 100644
> > --- a/drivers/usb/gadget/function/f_fs.c
> > +++ b/drivers/usb/gadget/function/f_fs.c
> > @@ -1324,7 +1324,7 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
> >  	case FUNCTIONFS_ENDPOINT_DESC:
> >  	{
> >  		int desc_idx;
> > -		struct usb_endpoint_descriptor *desc;
> > +		struct usb_endpoint_descriptor desc1, *desc;
> >  
> >  		switch (epfile->ffs->gadget->speed) {
> >  		case USB_SPEED_SUPER:
> > @@ -1336,10 +1336,12 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
> >  		default:
> >  			desc_idx = 0;
> >  		}
> > +
> >  		desc = epfile->ep->descs[desc_idx];
> > +		memcpy(&desc1, desc, desc->bLength);
> >  
> >  		spin_unlock_irq(&epfile->ffs->eps_lock);
> > -		ret = copy_to_user((void __user *)value, desc, desc->bLength);
> > +		ret = copy_to_user((void __user *)value, &desc1, desc1.bLength);
> >  		if (ret)
> >  			ret = -EFAULT;
> >  		return ret;
> > -- 
> 
> Do you have any backtrace to show the problems? I see ffs->ref will be
> increased at .open, and the .unbind should not free memory if ffs->ref
> is still two.

kfree(func->eps) is getting called directly from ffs_func_unbind()
which can happen when configfs.c does purge_configs_funcs().
ffs_func_unbind() does not check for ffs->refs count here, so it looks
like it can proceed to free it as soon as it releases the eps_lock,
while the ioctl happens in parallel and then accesses the now stale
pointer after acquiring & releasing the same eps_lock.

But I think I see what you're getting at--would you suggest that we
avoid freeing func->eps and tie its lifetime to ffs->refs? I agree in
principle but it also looks a bit tricky as there seem to be several
reference counters being used in this driver [ffs->refs (refcount_t);
ffs->opened (atomic_t); ffs_opts->refcnt (unsigned)] that I have a
little trouble figuring out which one to use. Appreciate any pointers
if you have any.

Here is a quite old backtrace from an internal bug report which was on
our downstream 4.14 kernel, but I think the issue can still happen on
current mainline. Also I believe we saw this with ADB but the current
AOSP version of ADB no longer uses the FUNCTIONFS_ENDPOINT_DESC ioctl()
so it may not happen with this function. However there are other Android
functions that use FFS (MTP, Fastboot) which still do use this ioctl so
I believe it still has the potential to occur if ffs_func_unbind() races
with ffs_epfile_ioctl().

init: processing action (sys.usb.config=none && sys.usb.configfs=1) from (/vendor/etc/init/hw/init.msm.usb.configfs.rc:30)
android_work: sent uevent USB_STATE=DISCONNECTED
Unable to handle kernel paging request at virtual address ffffffefa007fa57
Mem abort info:
  Exception class = DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 7
Data abort info:
  ISV = 0, ISS = 0x00000007
  CM = 0, WnR = 0
swapper pgtable: 4k pages, 39-bit VAs, pgd = ffffff956e787000
[ffffffefa007fa57] *pgd=00000001bd6e1003, *pud=00000001bd6e1003, *pmd=00000001bd5e0003, *pte=00e800016007f712
Internal error: Oops: 96000007 [#1] PREEMPT SMP
init: Command 'rm /config/usb_gadget/g1/configs/b.1/f1' action=sys.usb.config=none && sys.usb.configfs=1 (/vendor/etc/init/hw/init.msm.usb.configfs.rc:31) took 77ms and succeeded
init: processing action (sys.usb.config=none && sys.usb.configfs=1) from (/init.usb.configfs.rc:1)
init: Command 'write /config/usb_gadget/g1/UDC none' action=sys.usb.config=none && sys.usb.configfs=1 (/init.usb.configfs.rc:2) took 0ms and failed: Unable to write to file '/config/usb_gadget/g1/UDC': Unable to write file contents: No such device
Modules linked in: wlan(O) machine_dlkm(O) wcd934x_dlkm(O) mbhc_dlkm(O) wcd9360_dlkm(O) swr_ctrl_dlkm(O) wcd9xxx_dlkm(O) wsa881x_dlkm(O) wcd_core_dlkm(O) stub_dlkm(O) wcd_spi_dlkm(O) hdmi_dlkm(O) swr_dlkm(O) pinctrl_wcd_dlkm(O) usf_dlkm(O) native_dlkm(O) platform_dlkm(O) q6_dlkm(O) adsp_loader_dlkm(O) apr_dlkm(O) q6_notifier_dlkm(O) q6_pdr_dlkm(O) wglink_dlkm(O) msm_11ad_proxy
CPU: 6 PID: 13186 Comm: ->transport Tainted: G S      W  O    4.14.83+ #1
Hardware name: Qualcomm Technologies, Inc. SM8150 V2 PM8150 QRD DVT (DT)
task: ffffffef8f491200 task.stack: ffffff800d298000
pc : ffs_epfile_ioctl+0x1c4/0x364
lr : ffs_epfile_ioctl+0x1c4/0x364
sp : ffffff800d29bd40 pstate : 80400145
x29: ffffff800d29bdc0 x28: ffffffef8f491200 
x27: ffffff956cb01000 x26: 000000000000001d 
x25: ffffffefa007f8b0 x24: ffffffef499698f0 
x23: ffffffefd448c280 x22: ffffffefae6df940 
x21: ffffffefa007fa57 x20: 00000079a8101318 
x19: ffffffef49969958 x18: 00000895b16f2301 
x17: ffffffeffcf624f8 x16: 0000000000004e20 
x15: 0000000000000001 x14: ffffffeffcf61af8 
x13: 0000000000000008 x12: 00000002dfc5023a 
x11: 00000002dfc5023a x10: 0000000000000015 
x9 : 0000000000000000 x8 : 0000000000000008 
x7 : 6320383030303030 x6 : ffffffeff16037b8 
x5 : ffffffef9bc0a380 x4 : 0000000001312d00 
x3 : ffffff800d29bb18 x2 : ffffff956ba8ebd0 
x1 : ffffff956caf1f4c x0 : ffffff956caf1f4c 

PC: 0xffffff956c38a818:
a818  f9402308 910043e1 9103a100 97de046c 17ffffc2 f9402300 f8448408 b9404908
a838  71000d1f 1a9f17e9 7100151f 321f03e8 9a890108 8b080f28 f9400915 941db318
a858  394002b3 320003e2 aa1503e0 aa1303e1 97e32f88 90005d80 52801061 9134bc00
a878  97e2556a d5384108 aa1403ea f9402109 ab13014a 9a8983e9 da9f314a fa09015f

LR: 0xffffff956c38a818:
a818  f9402308 910043e1 9103a100 97de046c 17ffffc2 f9402300 f8448408 b9404908
a838  71000d1f 1a9f17e9 7100151f 321f03e8 9a890108 8b080f28 f9400915 941db318
a858  394002b3 320003e2 aa1503e0 aa1303e1 97e32f88 90005d80 52801061 9134bc00
a878  97e2556a d5384108 aa1403ea f9402109 ab13014a 9a8983e9 da9f314a fa09015f

SP: 0xffffff800d29bd00:
bd00  6c38a858 ffffff95 80400145 00000000 0d29bd30 ffffff80 6caf7504 ffffff95
bd20  ffffffff 0000007f 49969958 ffffffef 0d29bdc0 ffffff80 6c38a858 ffffff95
bd40  00000003 00000000 6baea5a0 ffffff95 00000001 00000000 0d29bdd0 ffffff80
bd60  dd4ad288 ffffffef 94706900 cd6f8d01 8f491200 ffffffef 94706900 cd6f8d01

Process ->transport (pid: 13186, stack limit = 0xffffff800d298000)
Call trace:
 ffs_epfile_ioctl+0x1c4/0x364
 vfs_ioctl+0x3c/0x5c
 do_vfs_ioctl+0x670/0x928
 SyS_ioctl+0x90/0x9c
 el0_svc_naked+0x34/0x38
Code: 9a890108 8b080f28 f9400915 941db318 (394002b3) 
---[ end trace 198e86364be2f515 ]---
Kernel panic - not syncing: Fatal exception
SMP: stopping secondary CPUs
 
Thanks,
Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
