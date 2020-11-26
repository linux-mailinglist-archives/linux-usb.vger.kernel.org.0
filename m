Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD65B2C51BD
	for <lists+linux-usb@lfdr.de>; Thu, 26 Nov 2020 11:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387540AbgKZKAi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Nov 2020 05:00:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbgKZKAh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Nov 2020 05:00:37 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ADD6C0613D4
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2020 02:00:37 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id f5so888105plj.13
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2020 02:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+nUNtPubCcHf6hJrGDaArMT7ryRMJgIfCCncpUvJDcs=;
        b=YvUdmHPAqDw+HUmZqUiMDrx8o+fMBN22sMBbIv/syKNmwCamGO+7Zia51eYdgC+qf4
         iD6dAyMvXd6yF9PTVSr2I0sat5CPYI671qGBUvoQOExeteydRCQzvVPb0xj4wFXw9IzL
         RN2X6NMlDykn3TSpfRcFv2b9sVFYAzYi8DqbOBtlWy14t9l9wdUp+g++HYK0n5dDmRci
         G16tI03+UXCnRMkHthbqHrTJ7oFfJTGtmwkwfBd3Bg4vIiloYxAJzI2IokhsA2yRuedC
         s+8uA86j3rz2OVmfcvIrZaImB3qVHjTrIUOAVuZ2Q6rJ5IVqLnpQ8ynHeof3hKS8CtDV
         9xKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+nUNtPubCcHf6hJrGDaArMT7ryRMJgIfCCncpUvJDcs=;
        b=M+OWi2V00RbzcukfKJJxEUMLu8cpfNmSCBe+h5JsJ1JdNxATRec1F5+y9URKE99hKE
         8XKS6tEHiYM00cj8KyQR7z8MuTcGnt3XPaH204QhPqvtSPs+q4BA/YdqBkirfzVfI/EW
         /hvSEitzlmoDsxkgnwU8g/uEerk5RUQ+ta/WIJYt0XhYE9ueJMj1eSHn01zJvrG8UwTM
         NWbncakbodWRpJ4awvi6xNq1H351tctmORqL6qWpLzGTeazw4Pl5p3n1S/yyRykItCZ/
         4h57RYxHepCFzH6YYWNO5J1UZZf8kPut3ZLDcKNK+SPCzKCXvRBZYit4l44hFPnOnjdG
         Z9Rw==
X-Gm-Message-State: AOAM531gVz2yZShnCGfl9DF6WfO1saNIdf3Z7oPjn0Jo271zHBsPqZl1
        r8KVExsZ4zMLOMEILFtgzng2LKJtp4cY9w==
X-Google-Smtp-Source: ABdhPJy9a1UehzZS5Jg8/ADBP+mTsEb8CPLX+DbMXLPYY596X8O/5AhHTQiPTXpjdzDvsMsEAvjAUw==
X-Received: by 2002:a17:902:6b84:b029:d8:d13d:14e with SMTP id p4-20020a1709026b84b02900d8d13d014emr2111521plk.29.1606384837130;
        Thu, 26 Nov 2020 02:00:37 -0800 (PST)
Received: from localhost ([209.9.72.214])
        by smtp.gmail.com with ESMTPSA id l20sm5531774pjq.33.2020.11.26.02.00.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 02:00:36 -0800 (PST)
Message-ID: <5fbf7cc4.1c69fb81.1cad6.e568@mx.google.com>
X-Google-Original-Message-ID: <20201126100033.GB27775@93896073@qq.com>
Date:   Thu, 26 Nov 2020 18:00:33 +0800
From:   lijiazi <jqqlijiazi@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        lijiazi <lijiazi@xiaomi.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: add sanity check for opmode
References: <1795c4568c3d7cfdd6b89258473a5e10bfc821f6.1606357163.git.lijiazi@xiaomi.com>
 <X79mPTrr4rakUV8S@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X79mPTrr4rakUV8S@kroah.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 26, 2020 at 09:24:29AM +0100, Greg Kroah-Hartman wrote:
> On Thu, Nov 26, 2020 at 01:10:55PM +0800, lijiazi wrote:
> > If usb drivers set a invalid value, for example, a negative
> > value. then a userspace task
> > cat sys/class/typec/port0/power_operation_mode, will cause a
> > panic issue:
> > [154325.262827] Unable to handle kernel paging request at virtual
> > address ffffff980aad8b68
> > [154325.262838] Mem abort info:
> > [154325.262843]   ESR = 0x96000005
> > [154325.262849]   Exception class = DABT (current EL), IL = 32 bits
> > [154325.262855]   SET = 0, FnV = 0
> > [154325.262860]   EA = 0, S1PTW = 0
> > [154325.262865] Data abort info:
> > [154325.262870]   ISV = 0, ISS = 0x00000005
> > [154325.262875]   CM = 0, WnR = 0
> > [154325.262880] swapper pgtable: 4k pages, 39-bit VAs, pgdp =
> > 000000001cae9c14
> > [154325.262884] [ffffff980aad8b68] pgd=0000000000000000,
> > pud=0000000000000000
> > [154325.262891] Internal error: Oops: 96000005 [#1] PREEMPT SMP
> > [154325.262896] Modules linked in: rmnet_perf(O) rmnet_shs(O)
> > wlan(O) sla(O) exfat(O) machine_dlkm(O) tfa98xx_dlkm(O)
> > cs35l41_dlkm(O) wcd938x_slave_dlkm(O) wcd938x_dlkm(O)
> > wcd9xxx_dlkm(O) mbhc_dlkm(O) tx_macro_dlkm(O) rx_macro_dlkm(O)
> > va_macro_dlkm(O) wsa_macro_dlkm(O) swr_ctrl_dlkm(O)
> > bolero_cdc_dlkm(O) wsa881x_dlkm(O) wcd_core_dlkm(O) stub_dlkm(O)
> > hdmi_dlkm(O) swr_dlkm(O) pinctrl_lpi_dlkm(O) pinctrl_wcd_dlkm(O)
> > usf_dlkm(O) native_dlkm(O) platform_dlkm(O) q6_dlkm(O)
> > adsp_loader_dlkm(O) apr_dlkm(O) snd_event_dlkm(O)
> > q6_notifier_dlkm(O) q6_pdr_dlkm(O) [last unloaded: rmnet_perf]
> > [154325.262939] Process usb@1.2-service (pid: 2501, stack limit
> > 		= 0x00000000cb0343ac)
> > [154325.262946] CPU: 5 PID: 2501 Comm: usb@1.2-service Tainted:
> > G S      W  O      4.19.113-perf-g0307705d321bc #1
> > [154325.262950] Hardware name: Qualcomm Technologies, Inc.
> > xiaomi cas (DT)
> > [154325.262955] pstate: 80400005 (Nzcv daif +PAN -UAO)
> > [154325.262967] pc : power_operation_mode_show+0x34/0x58
> > [154325.262971] lr : power_operation_mode_show+0x34/0x58
> > [154325.262974] sp : ffffffc1376bf990
> > [154325.262977] x29: ffffffc1376bf990 x28: ffffffc195aede58
> > [154325.262981] x27: ffffffc195aede48 x26: ffffff9008c55638
> > [154325.262986] x25: ffffffc05a44b300 x24: 0000000000001000
> > [154325.262990] x23: ffffffc19a340018 x22: ffffffc19a340018
> > [154325.262994] x21: ffffff900bb10038 x20: ffffff980aad8b68
> > [154325.262998] x19: ffffffc05a44b300 x18: 0000000000000000
> > [154325.263002] x17: 0000000000000000 x16: 0000000000000000
> > [154325.263006] x15: 0000000000000000 x14: 00000000080a38f8
> > [154325.263010] x13: ffffff880b489860 x12: 0000000000000000
> > [154325.263014] x11: 0000000000000000 x10: 1ffffff30155b16d
> > [154325.263018] x9 : 0000000000000000 x8 : 0000000000000007
> > [154325.263022] x7 : 0000000000000000 x6 : 000000000000003f
> > [154325.263026] x5 : 0000000000000040 x4 : 0000000000000000
> > [154325.263030] x3 : 0000000000000004 x2 : ffffffc05a44b300
> > [154325.263034] x1 : ffffff900bb10038 x0 : ffffff980aad8b68
> > [154325.263039]
> > [154325.263039] SP: 0xffffffc1376bf910:
> > [154325.263043] f910  00001000 00000000 5a44b300 ffffffc0
> > 08c55638 ffffff90 95aede48 ffffffc1
> > [154325.263052] f930  95aede58 ffffffc1 376bf990 ffffffc1
> > 09024b5c ffffff90 376bf990 ffffffc1
> > [154325.263060] f950  09024b5c ffffff90 80400005 00000000
> > 376bf9c0 ffffffc1 083cdf64 ffffff90
> > [154325.263067] f970  ffffffff 0000007f 376bfd80 ffffffc1
> > 376bf990 ffffffc1 09024b5c ffffff90
> > [154325.263075] f990  376bf9b0 ffffffc1 08c55678 ffffff90
> > 0bb10048 ffffff90 5a44b300 ffffffc0
> > [154325.263082] f9b0  376bf9e0 ffffffc1 085075e0 ffffff90
> > 0a5d43f8 ffffff90 9a9d9f00 ffffffc1
> > [154325.263090] f9d0  95aede48 ffffffc1 95aede58 ffffffc1
> > 376bfa30 ffffffc1 08506248 ffffff90
> > [154325.263097] f9f0  95aede40 ffffffc1 00000000 00000000
> > 00000001 00000000 9a9d9f00 ffffffc1
> > [154325.263106] Call trace:
> > [154325.263111]  power_operation_mode_show+0x34/0x58
> > [154325.263116]  dev_attr_show+0x40/0x80
> > [154325.263123]  sysfs_kf_seq_show+0x110/0x1c0
> > [154325.263127]  kernfs_seq_show+0x80/0x98
> > [154325.263133]  seq_read+0x2d8/0x778
> > [154325.263136]  kernfs_fop_read+0xa4/0x2a8
> > [154325.263142]  __vfs_read+0xd4/0x2e8
> > [154325.263145]  vfs_read+0xe0/0x1b0
> > [154325.263149]  ksys_read+0xdc/0x170
> > [154325.263153]  __arm64_sys_read+0x44/0x58
> > [154325.263158]  el0_svc_common+0xd8/0x1d0
> > [154325.263162]  el0_svc_handler+0x90/0xb8
> > [154325.263166]  el0_svc+0x8/0xc
> > 
> > Signed-off-by: lijiazi <lijiazi@xiaomi.com>
> 
> I need a name here that you sign legal documents with.  If this is
> "ligiazi", that's fine, but at least capitalize it?
>

My Name is Jiazi Li.

> > ---
> >  drivers/usb/typec/class.c | 2 ++
> >  include/linux/usb/typec.h | 1 +
> >  2 files changed, 3 insertions(+)
> > 
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index cb1362187..bcc8f79 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -1564,6 +1564,8 @@ void typec_set_pwr_opmode(struct typec_port *port,
> >  {
> >  	struct device *partner_dev;
> >  
> > +	if (opmode >= TYPEC_PWR_MODE_MAX)
> > +		return;
> 
> Shouldn't we report the error somehow to userspace so they know they
> have a broken device that needs to be fixed?
>

This typec_set_pwr_opmode function has no return value, so just return.

> >  	if (port->pwr_opmode == opmode)
> >  		return;
> >  
> > diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> > index 5447532..e21c791 100644
> > --- a/include/linux/usb/typec.h
> > +++ b/include/linux/usb/typec.h
> > @@ -56,6 +56,7 @@ enum typec_pwr_opmode {
> >  	TYPEC_PWR_MODE_1_5A,
> >  	TYPEC_PWR_MODE_3_0A,
> >  	TYPEC_PWR_MODE_PD,
> > +	TYPEC_PWR_MODE_MAX,
> 
> If these are specific values that a device uses, then please set them to
> the specific values and don't just rely on the compiler to set the
> correctly.
>

This invalid value is generated by a faulty usb driver logic, so it
could be any vaule.  

> thanks,
> 
> greg k-h
