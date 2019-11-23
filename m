Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83616107F9B
	for <lists+linux-usb@lfdr.de>; Sat, 23 Nov 2019 18:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbfKWRSS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Nov 2019 12:18:18 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69]:44042 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbfKWRSR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 23 Nov 2019 12:18:17 -0500
Received: by mail-io1-f69.google.com with SMTP id t16so2407222iog.11
        for <linux-usb@vger.kernel.org>; Sat, 23 Nov 2019 09:18:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:cc;
        bh=r3IKtlP9avY/gx1gskcMuHnqiMKCHHlRn82dSbOu4hA=;
        b=fBKVkKFOrkVEkq3fzDhZizXtnGDJWd2gRTdE91J+iRCWdIuSksYBXu93QtDI+KbAdj
         LL9oZelAElI8xmqa4yALt3lxlYoWzeBX7Owvp0wPsR7s54iTVM4HWZFPDicYt74z7xiB
         UkctPfDcFt/yhSR5lfc4LQLhM23B3P6p8TDwYTDcETzSQg8XUIWYf9swJ8QZTtpafUBg
         gXaNoKdHMsTXGJs820yp0GndYWU+Upz+tdk97uVbfxYUs4aFKZodUuAaA+w+rMo7htzg
         DB64BLnB3kKdCF+5GNbR73/8xldMgK9cpRPHXyrKR8gj9woSzUZy6tbIS5sgpw6OTb9x
         BbcQ==
X-Gm-Message-State: APjAAAWuIY0LBrAEzEY59rpcUySvBONxYn6foKqtA8Oilw3BoNdKujh9
        zgQ90Xkr+x8DFnWvgN1ohfKwYN/q0TGUzjMRCXF6rlNPa6xp
X-Google-Smtp-Source: APXvYqxKG6BQk5546U13VbdXiwmuIiKKVcHpO+QvqQB5cly4fHYZAEK8+MO2Fm6dOElx8oaeK3bsu08R73Qga2nwAuVaP2NI5bDM
MIME-Version: 1.0
X-Received: by 2002:a6b:f703:: with SMTP id k3mr17592308iog.95.1574529495615;
 Sat, 23 Nov 2019 09:18:15 -0800 (PST)
Date:   Sat, 23 Nov 2019 09:18:15 -0800
In-Reply-To: <Pine.LNX.4.44L0.1911231212330.22374-100000@netrider.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000046a8b6059806b796@google.com>
Subject: Re: Re: Re: possible deadlock in mon_bin_vma_fault
From:   syzbot <syzbot+56f9673bb4cdcbeb0e92@syzkaller.appspotmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     arnd@arndb.de, gregkh@linuxfoundation.org, jrdr.linux@gmail.com,
        keescook@chromium.org, kstewart@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com,
        tglx@linutronix.de, viro@zeniv.linux.org.uk, zaitcev@redhat.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> On Fri, 22 Nov 2019, syzbot wrote:

>> > #syz test: linux-4.19.y f6e27dbb1afa

>> "linux-4.19.y" does not look like a valid git repo address.

> Let's try again.  The "git tree" value in the original bug report was
> "upstream", so I'll use that even though it doesn't look like a valid
> git repo address either.

> Alan Stern

> #syz test: upstream f6e27dbb1afa

"upstream" does not look like a valid git repo address.


> commit 5252eb4c8297fedbf1c5f1e67da44efe00e6ef6b
> Author: Pete Zaitcev <zaitcev@kotori.zaitcev.us>
> Date:   Thu Nov 21 17:24:00 2019 -0600

>       usb: Fix a deadlock in usbmon between mmap and read

>       Signed-off-by: Pete Zaitcev <zaitcev@redhat.com>
>       Reported-by: syzbot+56f9673bb4cdcbeb0e92@syzkaller.appspotmail.com

> diff --git a/drivers/usb/mon/mon_bin.c b/drivers/usb/mon/mon_bin.c
> index ac2b4fcc265f..f48a23adbc35 100644
> --- a/drivers/usb/mon/mon_bin.c
> +++ b/drivers/usb/mon/mon_bin.c
> @@ -1039,12 +1039,18 @@ static long mon_bin_ioctl(struct file *file,  
> unsigned int cmd, unsigned long arg

>    		mutex_lock(&rp->fetch_lock);
>    		spin_lock_irqsave(&rp->b_lock, flags);
> -		mon_free_buff(rp->b_vec, rp->b_size/CHUNK_SIZE);
> -		kfree(rp->b_vec);
> -		rp->b_vec  = vec;
> -		rp->b_size = size;
> -		rp->b_read = rp->b_in = rp->b_out = rp->b_cnt = 0;
> -		rp->cnt_lost = 0;
> +		if (rp->mmap_active) {
> +			mon_free_buff(vec, size/CHUNK_SIZE);
> +			kfree(vec);
> +			ret = -EBUSY;
> +		} else {
> +			mon_free_buff(rp->b_vec, rp->b_size/CHUNK_SIZE);
> +			kfree(rp->b_vec);
> +			rp->b_vec  = vec;
> +			rp->b_size = size;
> +			rp->b_read = rp->b_in = rp->b_out = rp->b_cnt = 0;
> +			rp->cnt_lost = 0;
> +		}
>    		spin_unlock_irqrestore(&rp->b_lock, flags);
>    		mutex_unlock(&rp->fetch_lock);
>    		}
> @@ -1216,13 +1222,21 @@ mon_bin_poll(struct file *file, struct  
> poll_table_struct *wait)
>    static void mon_bin_vma_open(struct vm_area_struct *vma)
>    {
>    	struct mon_reader_bin *rp = vma->vm_private_data;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&rp->b_lock, flags);
>    	rp->mmap_active++;
> +	spin_unlock_irqrestore(&rp->b_lock, flags);
>    }

>    static void mon_bin_vma_close(struct vm_area_struct *vma)
>    {
> +	unsigned long flags;
> +
>    	struct mon_reader_bin *rp = vma->vm_private_data;
> +	spin_lock_irqsave(&rp->b_lock, flags);
>    	rp->mmap_active--;
> +	spin_unlock_irqrestore(&rp->b_lock, flags);
>    }

>    /*
> @@ -1234,16 +1248,12 @@ static vm_fault_t mon_bin_vma_fault(struct  
> vm_fault *vmf)
>    	unsigned long offset, chunk_idx;
>    	struct page *pageptr;

> -	mutex_lock(&rp->fetch_lock);
>    	offset = vmf->pgoff << PAGE_SHIFT;
> -	if (offset >= rp->b_size) {
> -		mutex_unlock(&rp->fetch_lock);
> +	if (offset >= rp->b_size)
>    		return VM_FAULT_SIGBUS;
> -	}
>    	chunk_idx = offset / CHUNK_SIZE;
>    	pageptr = rp->b_vec[chunk_idx].pg;
>    	get_page(pageptr);
> -	mutex_unlock(&rp->fetch_lock);
>    	vmf->page = pageptr;
>    	return 0;
>    }


