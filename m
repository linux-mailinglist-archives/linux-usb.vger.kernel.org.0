Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF3FE211C9F
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 09:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgGBHYb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 03:24:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:40764 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726630AbgGBHYb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Jul 2020 03:24:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 9901FADD9;
        Thu,  2 Jul 2020 07:24:29 +0000 (UTC)
Message-ID: <1593674666.3609.3.camel@suse.com>
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing
 WDM_IN_USE bit.
From:   Oliver Neukum <oneukum@suse.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Andrey Konovalov <andreyknvl@google.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        USB list <linux-usb@vger.kernel.org>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Date:   Thu, 02 Jul 2020 09:24:26 +0200
In-Reply-To: <b347b882-a986-24c6-2b37-0b1a092931b9@i-love.sakura.ne.jp>
References: <1590408381.2838.4.camel@suse.com>
         <4a686d9a-d09f-44f3-553c-bcf0bd8a8ea1@i-love.sakura.ne.jp>
         <082ae642-0703-6c26-39f6-d725e395ef9a@i-love.sakura.ne.jp>
         <CAAeHK+ww0YLUKGjQF5KfzoUUsdfLJdv5guUXRq4q46VfPiQubQ@mail.gmail.com>
         <27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp>
         <CAAeHK+ww0u0G94z_Y7VXLCVTQVZ9thO0q69n+Fj3jKT6MtpPng@mail.gmail.com>
         <20200528194057.GA21709@rowland.harvard.edu>
         <CAAeHK+ySAnU03cvg1=+yHh0YK1UFO4mrv-N9FcDDMt_0AfGZSQ@mail.gmail.com>
         <20200528205807.GB21709@rowland.harvard.edu>
         <1590852311.14886.3.camel@suse.com>
         <20200530154728.GB29298@rowland.harvard.edu>
         <0c43caf8-1135-1d38-cb57-9c0f84c4394d@i-love.sakura.ne.jp>
         <254939d4-f3a1-8c7e-94e5-9862c02774fa@i-love.sakura.ne.jp>
         <CAAeHK+w+wBNksK_wpczad3AU4oLQRsjL_5G8p1R55Zh_FLhprg@mail.gmail.com>
         <c85331fc-874c-6e46-a77f-0ef1dc075308@i-love.sakura.ne.jp>
         <b347b882-a986-24c6-2b37-0b1a092931b9@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 02.07.2020, 14:44 +0900 schrieb Tetsuo Handa:

>  
>  	usb_autopm_put_interface(desc->intf)
>  	mutex_unlock(&desc->wlock);
> +	if (rv >= 0 &&
> +	    /*
> +	     * needs both flags. We cannot do with one
> +	     * because resetting it would cause a race
> +	     * with write() yet we need to signal
> +	     * a disconnect
> +	     */
> +	    wait_event_killable_timeout(desc->wait,
> +					!test_bit(WDM_IN_USE, &desc->flags) ||
> +					test_bit(WDM_DISCONNECTING, &desc->flags), 30 * HZ) == 0) {
> +		if (mutex_lock_killable(&desc->wlock) == 0) {
> +			if (!test_bit(WDM_DISCONNECTING, &desc->flags))
> +				dev_err(&desc->intf->dev,
> +					"Tx URB not responding index=%d\n",
> +					le16_to_cpu(req->wIndex));
> +			mutex_unlock(&desc->wlock);
> +		}
> +	}

Hi,

I am afraid this would

1. serialize the driver, harming performance
2. introduce a race with every timer a task is running

	Regards
		Oliver

