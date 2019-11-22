Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4E6107A6D
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2019 23:13:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbfKVWNZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Nov 2019 17:13:25 -0500
Received: from mail-il1-f200.google.com ([209.85.166.200]:52072 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726887AbfKVWNZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Nov 2019 17:13:25 -0500
Received: by mail-il1-f200.google.com with SMTP id x2so7273523ilk.18
        for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2019 14:13:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:cc;
        bh=WTLZqtqfoN0AmabcgLeW8pAz7p65L6LdXI/HHqQhgkA=;
        b=jHk7dhzkgcpiOxvrcJuD1NZO/U6QokXyJr7RTnvb/bDDV2zmavuxW70PYGYLL/u1kb
         OYu/0pmorMzL4T8v/BmQMCcDxHekOj7ZB8oPVH382wiUrVWL8Y6BG2w6KOkA9/vRHHet
         QbPsO6DL17XOEjJ+0DEZowPFzcJU7afojSOkksSFwvrniHrGfDP9/GsoYvAjrqoA8fhN
         tvXDo5x3GhSqL4l/97tn+I+md2kNAzE113QxnmQEqesGpOgGvROTfQu9uTDuazPHIKvR
         X/PFz5tX+WZ6NUFm2pPrKv6t3JlQ9DnH+5+BrFUz+N4QvQiyVYlpHY30a6eyTLt6nzLW
         FuUQ==
X-Gm-Message-State: APjAAAW94zjEZYiy3gL0bOnggwu07kCfy8OLkThbwcvFZ/QEmdu9jjbE
        pqVPPLpXWE89Nu8pm5oP58EYHQBc67CJQA0d39or4IKnfacC
X-Google-Smtp-Source: APXvYqw3FjkUoue1G/FkUXlf6zNVDpp+pCA+okAW2RjsLWgXj3bTqBh1EyLeiMnNelvMSWTsowFF0AYfCdPDaxl3R0+63Ko15FXG
MIME-Version: 1.0
X-Received: by 2002:a92:9a17:: with SMTP id t23mr19431650ili.40.1574460802802;
 Fri, 22 Nov 2019 14:13:22 -0800 (PST)
Date:   Fri, 22 Nov 2019 14:13:22 -0800
In-Reply-To: <Pine.LNX.4.44L0.1911221700420.1511-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000dd2ff40597f6b812@google.com>
Subject: Re: Re: possible deadlock in mon_bin_vma_fault
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

> On Fri, 22 Nov 2019, Pete Zaitcev wrote:

>> > It would be more elegant to do the rp->mmap_active test before calling
>> > kcalloc and mon_alloc_buf.  But of course that's a pretty minor thing.

>> Indeed it feels wrong that so much work gets discarded. However, memory
>> allocations can block, right? In the same time, our main objective here  
>> is
>> to make sure that when a page fault happens, we fill in the page that VMA
>> is intended to refer, and not one that was re-allocated. Therefore, I'm
>> trying to avoid a situation where:

>> 1. thread A checks mmap_active, finds it at zero and proceeds into the
>> reallocation ioctl
>> 2. thread A sleeps in get_free_page()
>> 3. thread B runs mmap() and succeeds
>> 4. thread A obtains its pages and proceeds to substitute the buffer
>> 5. thread B (or any other) pagefaults and ends with the new, unexpected  
>> page

>> The code is not pretty, but I don't see an alternative. Heck, I would
>> love you to find more races if you can.

> The alternative is to have the routines for mmap() hold fetch_lock
> instead of b_lock.  mmap() is allowed to sleep, so that would be okay.
> Then you would also hold fetch_lock while checking mmap_active and
> doing the memory allocations.  That would prevent any races -- in your
> example above, thread A would acquire fetch_lock in step 1, so thread B
> would block in step 3 until step 4 was finished.  Hence B would end up
> mapping the correct pages.

> In practice, I don't see this being a routine problem.  How often do
> multiple threads independently try to mmap the same usbmon buffer?

> Still, let's see syzbot reacts to your current patch.  The line below
> is how you ask syzbot to test a candidate patch.

> Alan Stern

> #syz test: linux-4.19.y f6e27dbb1afa

"linux-4.19.y" does not look like a valid git repo address.


> commit 5252eb4c8297fedbf1c5f1e67da44efe00e6ef6b
> Author: Pete Zaitcev <zaitcev@kotori.zaitcev.us>
> Date:   Thu Nov 21 17:24:00 2019 -0600

>      usb: Fix a deadlock in usbmon between mmap and read

>      Signed-off-by: Pete Zaitcev <zaitcev@redhat.com>
>      Reported-by: syzbot+56f9673bb4cdcbeb0e92@syzkaller.appspotmail.com

> diff --git a/drivers/usb/mon/mon_bin.c b/drivers/usb/mon/mon_bin.c
> index ac2b4fcc265f..f48a23adbc35 100644
> --- a/drivers/usb/mon/mon_bin.c
> +++ b/drivers/usb/mon/mon_bin.c
> @@ -1039,12 +1039,18 @@ static long mon_bin_ioctl(struct file *file,  
> unsigned int cmd, unsigned long arg

>   		mutex_lock(&rp->fetch_lock);
>   		spin_lock_irqsave(&rp->b_lock, flags);
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
>   		spin_unlock_irqrestore(&rp->b_lock, flags);
>   		mutex_unlock(&rp->fetch_lock);
>   		}
> @@ -1216,13 +1222,21 @@ mon_bin_poll(struct file *file, struct  
> poll_table_struct *wait)
>   static void mon_bin_vma_open(struct vm_area_struct *vma)
>   {
>   	struct mon_reader_bin *rp = vma->vm_private_data;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&rp->b_lock, flags);
>   	rp->mmap_active++;
> +	spin_unlock_irqrestore(&rp->b_lock, flags);
>   }

>   static void mon_bin_vma_close(struct vm_area_struct *vma)
>   {
> +	unsigned long flags;
> +
>   	struct mon_reader_bin *rp = vma->vm_private_data;
> +	spin_lock_irqsave(&rp->b_lock, flags);
>   	rp->mmap_active--;
> +	spin_unlock_irqrestore(&rp->b_lock, flags);
>   }

>   /*
> @@ -1234,16 +1248,12 @@ static vm_fault_t mon_bin_vma_fault(struct  
> vm_fault *vmf)
>   	unsigned long offset, chunk_idx;
>   	struct page *pageptr;

> -	mutex_lock(&rp->fetch_lock);
>   	offset = vmf->pgoff << PAGE_SHIFT;
> -	if (offset >= rp->b_size) {
> -		mutex_unlock(&rp->fetch_lock);
> +	if (offset >= rp->b_size)
>   		return VM_FAULT_SIGBUS;
> -	}
>   	chunk_idx = offset / CHUNK_SIZE;
>   	pageptr = rp->b_vec[chunk_idx].pg;
>   	get_page(pageptr);
> -	mutex_unlock(&rp->fetch_lock);
>   	vmf->page = pageptr;
>   	return 0;
>   }



