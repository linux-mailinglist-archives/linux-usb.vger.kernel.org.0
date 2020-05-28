Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6CB1E65C9
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 17:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404202AbgE1PSY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 11:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404149AbgE1PSU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 May 2020 11:18:20 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71063C08C5C6
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2020 08:18:20 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id j21so13596758pgb.7
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2020 08:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=23D9cpM8DSIhJTp/YZTLReI+uSkAJfEqRl9eeax8hTM=;
        b=phXkg+oSX5HX8pG/j4JZ8Bu+IJssk9L0NUx+Lk7Qv9gwFEkO//wpKHIZBjBF8CZ20F
         PKAGInYZ9ReqrckgniWqLeF4MvyD/FqQP2v/O2hTcDjHZHVeR3Wy2HB2+aoMbdB+6SII
         Enud0cPbHr+XHGYK/6blBRlwoTPyrNN2Xtle+qx+KotavXFp7kqaVFZa5t+nEBt+e1OQ
         ON8HrOsATzG3TWam4UEM1Ysf6FXXaspqw4xDAKyjFdmm4m3KW8qQwNPl3e0m/JLrOabm
         /AsBKH/02wM8Bab/oLr/6YJbFeMUSGUJHdbcxqZkNmsdYApDnSlDw0bDa4zF2nlCf2PW
         8dAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=23D9cpM8DSIhJTp/YZTLReI+uSkAJfEqRl9eeax8hTM=;
        b=X95wMFz+AJeAA4TmW3HEH36POexF0StlYSrOp9Rgz3xjPZmF/FBS8BkXBebr/2ry+T
         l8GgNKE4dmh37Sc8RK3KAqHFk8oNbFVDLl+cXSDdYHQKppj28PXNZFDPyBif2ZzGBrCM
         igvK5PGdUmtR4B3YKt0NXph7QypDV/fYFpPFC6H63Lm4LFG9/HNF1Nsmxhnkbn0G9d8e
         zISBEHK6h/RgG7k66yE+JmF7cc2boM+RmkUvyGJUpIYhJuPjC5GdxoW+JauEn6VNsmUn
         S22g6yo2UIy6BDylMG4LMfd2tg2wulyvPIBhh3JsljtnRlTTrrIvMuNL7sQsunVl3Zhw
         CYgA==
X-Gm-Message-State: AOAM5331LcmUxAuhfU98rls3w7c1p3Ig2Y7EJ2bcS4efd05g0DfpZD6a
        d7pylsEJrxAtYoGZRDY/ZrqpQbylFvYD2K2DCJtRcQ==
X-Google-Smtp-Source: ABdhPJxY9yVGqtwg0NipBOLcWaFfMPHfyPQwx7KQxwqBk8JornAhlDYvLADdyZD4qOEB2Kwb8neH47pwXEmKH/uwqnM=
X-Received: by 2002:a62:8647:: with SMTP id x68mr3597957pfd.178.1590679099199;
 Thu, 28 May 2020 08:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200520233129.3704-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20200521073323.GA2579717@kroah.com> <177cc23a-60a7-f5cd-09d6-57608727ea27@i-love.sakura.ne.jp>
 <1590090636.6470.12.camel@suse.com> <a72cbcc6-df68-2043-1580-a8b4e4053079@i-love.sakura.ne.jp>
 <1590134662.19681.12.camel@suse.com> <03894591-a1ac-496a-a35f-55953e5bcc06@i-love.sakura.ne.jp>
 <1590408381.2838.4.camel@suse.com> <4a686d9a-d09f-44f3-553c-bcf0bd8a8ea1@i-love.sakura.ne.jp>
 <082ae642-0703-6c26-39f6-d725e395ef9a@i-love.sakura.ne.jp>
In-Reply-To: <082ae642-0703-6c26-39f6-d725e395ef9a@i-love.sakura.ne.jp>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 28 May 2020 17:18:08 +0200
Message-ID: <CAAeHK+ww0YLUKGjQF5KfzoUUsdfLJdv5guUXRq4q46VfPiQubQ@mail.gmail.com>
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing WDM_IN_USE bit.
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Oliver Neukum <oneukum@suse.com>, Greg KH <greg@kroah.com>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        USB list <linux-usb@vger.kernel.org>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 27, 2020 at 6:47 AM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> On 2020/05/25 22:32, Tetsuo Handa wrote:
> > On 2020/05/25 21:06, Oliver Neukum wrote:
> >> Am Freitag, den 22.05.2020, 17:26 +0900 schrieb Tetsuo Handa:
> >>> On 2020/05/22 17:04, Oliver Neukum wrote:
> >>>> May I ask you to redo the patch with comments added stating
> >>>> that the wake up is done for the sake of wdm_flush(), change
> >>>> the description and add the link to syzkaller?
> >>>
> >>> You can take over this patch. syzbot tried this patch on 2020/02/11 01:23 at
> >>> https://syzkaller.appspot.com/bug?id=e7b761593b23eb50855b9ea31e3be5472b711186 ,
> >>> but this patch did not solve the problem syzbot has found. Thus, I don't add
> >>> a link to syzkaller...
> >>
> >> Hi,
> >>
> >> this is odd. I looked at the driver and it looks to me like
> >> pre/post_reset() is the only other place that touches WDM_IN_USE.
> >> And it does so correctly. Any idea what could be wrong?
> >
> > I haven't understood the root cause of this problem. You were in the thread at
> > https://groups.google.com/forum/#!msg/syzkaller-bugs/q3QMjt_t83c/GqP58GaTAQAJ .
> > My patch was made from that thread (which simply makes sure to call wake_up_all()
> > when clearing WDM_IN_USE bit) apart from the root cause of this problem.
> >
>
> I might have found what is wrong.
>
> My understanding is that a process using /dev/raw-gadget is responsible for
> reacting to every USB request. I don't know whether /dev/raw-gadget already
> provides callback for aborting the in-flight USB requests (in order to resume
> wdm_flush()) when /dev/raw-gadget is closed (due to explicit close() syscall or
> implicit exit_files() from do_exit() upon SIGKILL). I assume /dev/raw-gadget
> already provides such callback in the following paragraphs.

raw-gadget should kill all unfishished USB requests when the file is closed.

>
> Since the reproducer is opening both /dev/raw-gadget (which is char-10-62) and
> /dev/cdc-wdm0 (which is char-180-0), it seems that the kernel is falling into
> deadlock condition due to the need to close both files when the reproducer is
> killed. My guess is that since that process is stuck at wdm_flush() (due to
> explicit close() syscall or implicit exit_files() from do_exit() upon SIGKILL),
> that process cannot react to USB requests which are needed for resuming wdm_flush().
> Unexpectedly blocking a process which is responsible for reacting to USB requests
> will look as if it is a broken hardware.

Hm, so wdm_flush() is unable to finish unless an expected USB request
is received from the device? This is a bug in the wdm driver then.
Should we use wait_event_interruptible() instead of wait_event() in
wdm_flush()?

>
> A debug printk() patch (shown below) says that the desc->command urb issued by
> wdm_write() never gets wdm_out_callback(). I guess that it is an evidence of
> such dependency exists, and I think that a process had better avoid opening both
> /dev/raw-gadget and /dev/cdc-wdm0 at the same time.
>
> ----------------------------------------
> diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
> index 5b0bd8581fe6..e352b54dbbf2 100644
> --- a/arch/x86/kernel/unwind_orc.c
> +++ b/arch/x86/kernel/unwind_orc.c
> @@ -320,12 +320,19 @@ EXPORT_SYMBOL_GPL(unwind_get_return_address);
>
>  unsigned long *unwind_get_return_address_ptr(struct unwind_state *state)
>  {
> +       struct task_struct *task = state->task;
> +
>         if (unwind_done(state))
>                 return NULL;
>
>         if (state->regs)
>                 return &state->regs->ip;
>
> +       if (task != current && state->sp == task->thread.sp) {
> +               struct inactive_task_frame *frame = (void *)task->thread.sp;
> +               return &frame->ret_addr;
> +       }
> +
>         if (state->sp)
>                 return (unsigned long *)state->sp - 1;
>
> diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
> index e3db6fbeadef..5d28a1a2521d 100644
> --- a/drivers/usb/class/cdc-wdm.c
> +++ b/drivers/usb/class/cdc-wdm.c
> @@ -150,8 +150,9 @@ static void wdm_out_callback(struct urb *urb)
>         spin_unlock_irqrestore(&desc->iuspin, flags);
>         kfree(desc->outbuf);
>         desc->outbuf = NULL;
> +       printk("%s : clear WDM_IN_USE %px\n", __func__, desc);
>         clear_bit(WDM_IN_USE, &desc->flags);
> -       wake_up(&desc->wait);
> +       wake_up_all(&desc->wait);
>  }
>
>  static void wdm_in_callback(struct urb *urb)
> @@ -417,17 +418,21 @@ static ssize_t wdm_write
>         req->wValue = 0;
>         req->wIndex = desc->inum; /* already converted */
>         req->wLength = cpu_to_le16(count);
> +       printk("%s : set WDM_IN_USE %px %px\n", __func__, desc, desc->command);
>         set_bit(WDM_IN_USE, &desc->flags);
>         desc->outbuf = buf;
>
>         rv = usb_submit_urb(desc->command, GFP_KERNEL);
>         if (rv < 0) {
>                 desc->outbuf = NULL;
> +               printk("%s : clear WDM_IN_USE %px\n", __func__, desc);
>                 clear_bit(WDM_IN_USE, &desc->flags);
>                 dev_err(&desc->intf->dev, "Tx URB error: %d\n", rv);
>                 rv = usb_translate_errors(rv);
> +               wake_up_all(&desc->wait);
>                 goto out_free_mem_pm;
>         } else {
> +               printk("%s : waiting for wdm_out_callback %px\n", __func__, desc);
>                 dev_dbg(&desc->intf->dev, "Tx URB has been submitted index=%d\n",
>                         le16_to_cpu(req->wIndex));
>         }
> @@ -587,6 +592,7 @@ static int wdm_flush(struct file *file, fl_owner_t id)
>  {
>         struct wdm_device *desc = file->private_data;
>
> +       printk("%s : start wait_event %px\n", __func__, desc);
>         wait_event(desc->wait,
>                         /*
>                          * needs both flags. We cannot do with one
> @@ -596,6 +602,7 @@ static int wdm_flush(struct file *file, fl_owner_t id)
>                          */
>                         !test_bit(WDM_IN_USE, &desc->flags) ||
>                         test_bit(WDM_DISCONNECTING, &desc->flags));
> +       printk("%s : end wait_event %px\n", __func__, desc);
>
>         /* cannot dereference desc->intf if WDM_DISCONNECTING */
>         if (test_bit(WDM_DISCONNECTING, &desc->flags))
> @@ -642,6 +649,7 @@ static int wdm_open(struct inode *inode, struct file *file)
>
>         mutex_lock(&wdm_mutex);
>         desc = wdm_find_device_by_minor(minor);
> +       printk("%s : start %px\n", __func__, desc);
>         if (!desc)
>                 goto out;
>
> @@ -676,6 +684,7 @@ static int wdm_open(struct inode *inode, struct file *file)
>                 desc->manage_power(intf, 1);
>         usb_autopm_put_interface(desc->intf);
>  out:
> +       printk("%s : done %px\n", __func__, desc);
>         mutex_unlock(&wdm_mutex);
>         return rv;
>  }
> @@ -685,6 +694,7 @@ static int wdm_release(struct inode *inode, struct file *file)
>         struct wdm_device *desc = file->private_data;
>
>         mutex_lock(&wdm_mutex);
> +       printk("%s : start %px\n", __func__, desc);
>
>         /* using write lock to protect desc->count */
>         mutex_lock(&desc->wlock);
> @@ -694,6 +704,7 @@ static int wdm_release(struct inode *inode, struct file *file)
>         if (!desc->count) {
>                 if (!test_bit(WDM_DISCONNECTING, &desc->flags)) {
>                         dev_dbg(&desc->intf->dev, "wdm_release: cleanup\n");
> +                       printk("%s : kill_urbs() %px\n", __func__, desc);
>                         kill_urbs(desc);
>                         spin_lock_irq(&desc->iuspin);
>                         desc->resp_count = 0;
> @@ -705,6 +716,7 @@ static int wdm_release(struct inode *inode, struct file *file)
>                         cleanup(desc);
>                 }
>         }
> +       printk("%s : done %px\n", __func__, desc);
>         mutex_unlock(&wdm_mutex);
>         return 0;
>  }
> @@ -832,6 +844,7 @@ static int wdm_create(struct usb_interface *intf, struct usb_endpoint_descriptor
>         desc->command = usb_alloc_urb(0, GFP_KERNEL);
>         if (!desc->command)
>                 goto err;
> +       desc->command->trace_me = true;
>
>         desc->ubuf = kmalloc(desc->wMaxCommand, GFP_KERNEL);
>         if (!desc->ubuf)
> @@ -979,15 +992,18 @@ static void wdm_disconnect(struct usb_interface *intf)
>         usb_deregister_dev(intf, &wdm_class);
>         desc = wdm_find_device(intf);
>         mutex_lock(&wdm_mutex);
> +       printk("%s : start %px\n", __func__, desc);
>
>         /* the spinlock makes sure no new urbs are generated in the callbacks */
>         spin_lock_irqsave(&desc->iuspin, flags);
> +       printk("%s : set WDM_DISCONNECTING %px\n", __func__, desc);
>         set_bit(WDM_DISCONNECTING, &desc->flags);
>         set_bit(WDM_READ, &desc->flags);
>         spin_unlock_irqrestore(&desc->iuspin, flags);
>         wake_up_all(&desc->wait);
>         mutex_lock(&desc->rlock);
>         mutex_lock(&desc->wlock);
> +       printk("%s : kill_urbs() %px\n", __func__, desc);
>         kill_urbs(desc);
>         cancel_work_sync(&desc->rxwork);
>         cancel_work_sync(&desc->service_outs_intr);
> @@ -1003,6 +1019,7 @@ static void wdm_disconnect(struct usb_interface *intf)
>                 cleanup(desc);
>         else
>                 dev_dbg(&intf->dev, "%d open files - postponing cleanup\n", desc->count);
> +       printk("%s : done %px\n", __func__, desc);
>         mutex_unlock(&wdm_mutex);
>  }
>
> @@ -1031,6 +1048,7 @@ static int wdm_suspend(struct usb_interface *intf, pm_message_t message)
>                 set_bit(WDM_SUSPENDING, &desc->flags);
>                 spin_unlock_irq(&desc->iuspin);
>                 /* callback submits work - order is essential */
> +               printk("%s : kill_urbs() %px\n", __func__, desc);
>                 kill_urbs(desc);
>                 cancel_work_sync(&desc->rxwork);
>                 cancel_work_sync(&desc->service_outs_intr);
> @@ -1082,15 +1100,19 @@ static int wdm_pre_reset(struct usb_interface *intf)
>          * must be done before recovery lest a spontaneous
>          * message from the device is lost
>          */
> +       printk("%s : start\n", __func__);
>         spin_lock_irq(&desc->iuspin);
> +       printk("%s : set WDM_RESETTING %px\n", __func__, desc);
>         set_bit(WDM_RESETTING, &desc->flags);   /* inform read/write */
>         set_bit(WDM_READ, &desc->flags);        /* unblock read */
> +       printk("%s : clear WDM_IN_USE %px\n", __func__, desc);
>         clear_bit(WDM_IN_USE, &desc->flags);    /* unblock write */
>         desc->rerr = -EINTR;
>         spin_unlock_irq(&desc->iuspin);
>         wake_up_all(&desc->wait);
>         mutex_lock(&desc->rlock);
>         mutex_lock(&desc->wlock);
> +       printk("%s : kill_urbs() %px\n", __func__, desc);
>         kill_urbs(desc);
>         cancel_work_sync(&desc->rxwork);
>         cancel_work_sync(&desc->service_outs_intr);
> @@ -1103,10 +1125,12 @@ static int wdm_post_reset(struct usb_interface *intf)
>         int rv;
>
>         clear_bit(WDM_OVERFLOW, &desc->flags);
> +       printk("%s : clear WDM_RESETTING %px\n", __func__, desc);
>         clear_bit(WDM_RESETTING, &desc->flags);
>         rv = recover_from_urb_loss(desc);
>         mutex_unlock(&desc->wlock);
>         mutex_unlock(&desc->rlock);
> +       printk("%s : done\n", __func__);
>         return rv;
>  }
>
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index aa45840d8273..ab3d3b65a6cf 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -1521,6 +1521,8 @@ int usb_hcd_submit_urb (struct urb *urb, gfp_t mem_flags)
>         int                     status;
>         struct usb_hcd          *hcd = bus_to_hcd(urb->dev->bus);
>
> +       if (urb->trace_me)
> +               printk("%s : start %px\n", __func__, urb);
>         /* increment urb's reference count as part of giving it to the HCD
>          * (which will control it).  HCD guarantees that it either returns
>          * an error or calls giveback(), but not both.
> @@ -1550,6 +1552,8 @@ int usb_hcd_submit_urb (struct urb *urb, gfp_t mem_flags)
>         }
>
>         if (unlikely(status)) {
> +               if (urb->trace_me)
> +                       printk("%s : error %px %d\n", __func__, urb, status);
>                 usbmon_urb_submit_error(&hcd->self, urb, status);
>                 urb->hcpriv = NULL;
>                 INIT_LIST_HEAD(&urb->urb_list);
> @@ -1559,6 +1563,8 @@ int usb_hcd_submit_urb (struct urb *urb, gfp_t mem_flags)
>                         wake_up(&usb_kill_urb_queue);
>                 usb_put_urb(urb);
>         }
> +       if (urb->trace_me)
> +               printk("%s : end %px %d\n", __func__, urb, status);
>         return status;
>  }
>
> @@ -1582,6 +1588,8 @@ static int unlink1(struct usb_hcd *hcd, struct urb *urb, int status)
>                  * Such failures should be harmless. */
>                 value = hcd->driver->urb_dequeue(hcd, urb, status);
>         }
> +       if (urb->trace_me)
> +               printk("%s : %px %d\n", __func__, urb, value);
>         return value;
>  }
>
> @@ -1645,6 +1653,8 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
>
>         /* pass ownership to the completion handler */
>         urb->status = status;
> +       if (urb->trace_me)
> +               printk("%s : complete %px %d\n", __func__, urb, status);
>         urb->complete(urb);
>
>         usb_anchor_resume_wakeups(anchor);
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
> index e01e366d89cd..9adcc978804e 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -33,6 +33,10 @@ MODULE_DESCRIPTION(DRIVER_DESC);
>  MODULE_AUTHOR("Andrey Konovalov");
>  MODULE_LICENSE("GPL");
>
> +#undef dev_dbg
> +#define dev_dbg(dev, fmt, ...)                                         \
> +       dev_printk(KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
> +
>  /*----------------------------------------------------------------------*/
>
>  #define RAW_EVENT_QUEUE_SIZE   16
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 9f3c721c70dc..0843e07f6cc2 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -1589,6 +1589,7 @@ struct urb {
>         int error_count;                /* (return) number of ISO errors */
>         void *context;                  /* (in) context for completion */
>         usb_complete_t complete;        /* (in) completion routine */
> +       bool trace_me;
>         struct usb_iso_packet_descriptor iso_frame_desc[];
>                                         /* (in) ISO ONLY */
>  };
> ----------------------------------------
>
> ----------------------------------------
> [   25.056066][   T12] usb 5-1: New USB device found, idVendor=2400, idProduct=4200, bcdDevice=42.ef
> [   25.056724][ T1175] udc-core: couldn't find an available UDC or it's busy
> [   25.056730][ T1175] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.057711][ T1176] udc-core: couldn't find an available UDC or it's busy
> [   25.057719][ T1176] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.058090][ T1171] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.058104][ T1178] udc-core: couldn't find an available UDC or it's busy
> [   25.058233][ T1177] udc-core: couldn't find an available UDC or it's busy
> [   25.058238][ T1177] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.058685][ T1179] udc-core: couldn't find an available UDC or it's busy
> [   25.058692][ T1179] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.060237][   T12] usb 5-1: New USB device strings: Mfr=0, Product=0, SerialNumber=2
> [   25.060250][ T1180] udc-core: couldn't find an available UDC or it's busy
> [   25.060255][ T1180] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.060737][ T1181] udc-core: couldn't find an available UDC or it's busy
> [   25.060741][ T1181] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.060836][ T1182] udc-core: couldn't find an available UDC or it's busy
> [   25.060840][ T1182] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.061235][ T1183] udc-core: couldn't find an available UDC or it's busy
> [   25.061241][ T1183] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.062374][ T1178] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.064298][   T12] usb 5-1: SerialNumber: syz
> [   25.065151][ T1185] udc-core: couldn't find an available UDC or it's busy
> [   25.065161][ T1184] udc-core: couldn't find an available UDC or it's busy
> [   25.065168][ T1184] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.065191][ T1186] udc-core: couldn't find an available UDC or it's busy
> [   25.065195][ T1186] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.065451][ T1187] udc-core: couldn't find an available UDC or it's busy
> [   25.065457][ T1187] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.068979][ T1189] udc-core: couldn't find an available UDC or it's busy
> [   25.070166][ T1185] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.072145][ T1191] udc-core: couldn't find an available UDC or it's busy
> [   25.072151][ T1191] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.072166][ T1190] udc-core: couldn't find an available UDC or it's busy
> [   25.072174][ T1190] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.072254][ T1189] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.073991][ T1193] udc-core: couldn't find an available UDC or it's busy
> [   25.073997][ T1193] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.074002][ T1192] udc-core: couldn't find an available UDC or it's busy
> [   25.074006][ T1192] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.087896][ T1196] udc-core: couldn't find an available UDC or it's busy
> [   25.087933][ T1195] udc-core: couldn't find an available UDC or it's busy
> [   25.087941][ T1195] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.088229][ T1197] udc-core: couldn't find an available UDC or it's busy
> [   25.088235][ T1197] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.088239][ T1194] udc-core: couldn't find an available UDC or it's busy
> [   25.088244][ T1194] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.090788][ T1198] udc-core: couldn't find an available UDC or it's busy
> [   25.092032][ T1196] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.093018][ T1199] udc-core: couldn't find an available UDC or it's busy
> [   25.093023][ T1200] udc-core: couldn't find an available UDC or it's busy
> [   25.093027][ T1200] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.093886][ T1198] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.094586][ T1201] udc-core: couldn't find an available UDC or it's busy
> [   25.095028][ T1202] udc-core: couldn't find an available UDC or it's busy
> [   25.095032][ T1202] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.095403][ T1204] udc-core: couldn't find an available UDC or it's busy
> [   25.095409][ T1204] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.095411][ T1203] udc-core: couldn't find an available UDC or it's busy
> [   25.095416][ T1203] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.095896][ T1199] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.099620][ T1205] udc-core: couldn't find an available UDC or it's busy
> [   25.100765][ T1201] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.102512][ T1205] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.104434][ T1207] udc-core: couldn't find an available UDC or it's busy
> [   25.104439][ T1207] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.104483][ T1206] udc-core: couldn't find an available UDC or it's busy
> [   25.104489][ T1206] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.104516][ T1208] udc-core: couldn't find an available UDC or it's busy
> [   25.104521][ T1208] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.122543][   T12] hub 5-1:118.0: bad descriptor, ignoring hub
> [   25.122597][ T1210] udc-core: couldn't find an available UDC or it's busy
> [   25.122604][ T1210] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.122976][ T1211] udc-core: couldn't find an available UDC or it's busy
> [   25.122983][ T1211] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.123591][ T1212] udc-core: couldn't find an available UDC or it's busy
> [   25.123596][ T1212] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.123654][ T1209] udc-core: couldn't find an available UDC or it's busy
> [   25.123659][ T1209] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.124649][ T1213] udc-core: couldn't find an available UDC or it's busy
> [   25.124809][ T1214] udc-core: couldn't find an available UDC or it's busy
> [   25.124814][ T1214] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.125168][ T1215] udc-core: couldn't find an available UDC or it's busy
> [   25.125174][ T1215] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.126547][   T12] hub: probe of 5-1:118.0 failed with error -5
> [   25.128767][ T1213] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.129656][ T1216] udc-core: couldn't find an available UDC or it's busy
> [   25.129662][ T1216] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.129678][ T1217] udc-core: couldn't find an available UDC or it's busy
> [   25.129684][ T1217] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.129968][ T1218] udc-core: couldn't find an available UDC or it's busy
> [   25.129973][ T1218] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.132093][   T12] cdc_wdm 5-1:118.0: cdc-wdm0: USB WDM device
> [   25.132549][ T1219] udc-core: couldn't find an available UDC or it's busy
> [   25.132554][ T1219] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.133379][ T1222] udc-core: couldn't find an available UDC or it's busy
> [   25.133385][ T1222] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.133552][ T1223] udc-core: couldn't find an available UDC or it's busy
> [   25.133708][ T1221] udc-core: couldn't find an available UDC or it's busy
> [   25.133713][ T1221] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.135592][ T1224] udc-core: couldn't find an available UDC or it's busy
> [   25.135598][ T1224] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.136158][   T12] wdm_suspend : kill_urbs() ffff88822dffd000
> [   25.136578][ T1225] udc-core: couldn't find an available UDC or it's busy
> [   25.136583][ T1225] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.136638][ T1226] udc-core: couldn't find an available UDC or it's busy
> [   25.136642][ T1226] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.136928][ T1227] udc-core: couldn't find an available UDC or it's busy
> [   25.136933][ T1227] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.138275][ T1228] udc-core: couldn't find an available UDC or it's busy
> [   25.138281][ T1228] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.138293][ T1223] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.138821][ T1229] udc-core: couldn't find an available UDC or it's busy
> [   25.138948][ T1230] udc-core: couldn't find an available UDC or it's busy
> [   25.138952][ T1230] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.139091][ T1231] udc-core: couldn't find an available UDC or it's busy
> [   25.139096][ T1231] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.141700][ T1232] udc-core: couldn't find an available UDC or it's busy
> [   25.142014][ T1233] udc-core: couldn't find an available UDC or it's busy
> [   25.142020][ T1233] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.142097][ T1233] wdm_open : start ffff88822dffd000
> [   25.142251][ T1234] udc-core: couldn't find an available UDC or it's busy
> [   25.142258][ T1234] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.142285][ T1235] udc-core: couldn't find an available UDC or it's busy
> [   25.142289][ T1235] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.142372][ T1229] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.144150][ T1232] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
> [   25.319563][ T1233] wdm_open : done ffff88822dffd000
> [   25.732316][ T1235] wdm_open : start ffff88822dffd000
> [   25.732389][ T1233] wdm_write : set WDM_IN_USE ffff88822dffd000 ffff888234392f00
> [   25.736342][ T1233] usb_hcd_submit_urb : start ffff888234392f00
> [   25.738112][ T1233] usb_hcd_submit_urb : end ffff888234392f00 0
> [   25.739989][ T1233] wdm_write : waiting for wdm_out_callback ffff88822dffd000
> [   25.742837][ T1233] wdm_flush : start wait_event ffff88822dffd000
> [   25.742948][ T1235] wdm_open : done ffff88822dffd000
> [   25.747707][ T1234] wdm_open : start ffff88822dffd000
> [   30.141494][ T1234] wdm_open : done ffff88822dffd000
> [   30.141711][ T1235] wdm_flush : start wait_event ffff88822dffd000
> [   30.143693][ T1232] wdm_open : start ffff88822dffd000
> [   30.143916][ T1234] wdm_flush : start wait_event ffff88822dffd000
> [   30.151409][ T1232] wdm_open : done ffff88822dffd000
> [   30.153610][  T841] wdm_open : start ffff88822dffd000
> [   30.153788][ T1232] wdm_flush : start wait_event ffff88822dffd000
> [   30.155816][  T841] wdm_open : done ffff88822dffd000
> [   30.159953][ T1229] wdm_open : start ffff88822dffd000
> [   30.160146][  T841] wdm_flush : start wait_event ffff88822dffd000
> [   30.162005][ T1229] wdm_open : done ffff88822dffd000
> [   30.165691][ T1229] wdm_flush : start wait_event ffff88822dffd000
> [   63.298753][    C3] random: crng init done
> [   63.299926][    C3] random: 7 urandom warning(s) missed due to ratelimiting
> [  168.509958][   T52] INFO: task a.out:1233 blocked for more than 141 seconds.
> [  168.516579][   T52]       Not tainted 5.7.0-rc5+ #13
> [  168.520995][   T52] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [  168.528400][   T52] a.out           D13024  1233    838 0x00000004
> [  168.532156][   T52] Call Trace:
> [  168.533970][   T52]  __schedule+0x363/0x840
> [  168.535991][   T52]  ? wdm_suspend+0x160/0x160
> [  168.538199][   T52]  schedule+0x5a/0xd0
> [  168.539782][   T52]  wdm_flush+0x124/0x190
> [  168.541542][   T52]  ? remove_wait_queue+0x60/0x60
> [  168.543503][   T52]  filp_close+0x3d/0xa0
> [  168.544874][   T52]  __close_fd+0x8f/0x110
> [  168.546267][   T52]  __x64_sys_close+0x2a/0x60
> [  168.547843][   T52]  do_syscall_64+0x58/0x270
> [  168.549214][   T52]  entry_SYSCALL_64_after_hwframe+0x49/0xb3
> [  168.550889][   T52] RIP: 0033:0x7f54551f4f30
> [  168.552150][   T52] Code: Bad RIP value.
> [  168.553323][   T52] RSP: 002b:00007ffe39c17878 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
> [  168.555439][   T52] RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 00007f54551f4f30
> [  168.558429][   T52] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000004
> [  168.561016][   T52] RBP: 0000000000000000 R08: 000000000000000f R09: 00007ffe39c178ae
> [  168.563155][   T52] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
> [  168.565136][   T52] R13: 0000000000005fb3 R14: 0000000000000000 R15: 0000000000000000
> [  168.567108][   T52]
> [  168.567108][   T52] Showing all locks held in the system:
> [  168.569123][   T52] 1 lock held by khungtaskd/52:
> [  168.570400][   T52]  #0: ffffffff83a6baa0 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0xe/0x1b0
> [  168.573387][   T52] 1 lock held by in:imklog/465:
> [  168.574597][   T52]  #0: ffff88822d28fcf0 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0x55/0x60
> [  168.576825][   T52]
> [  168.577408][   T52] =============================================
> [  168.577408][   T52]
> [  168.579559][   T52] NMI backtrace for cpu 1
> [  168.580819][   T52] CPU: 1 PID: 52 Comm: khungtaskd Not tainted 5.7.0-rc5+ #13
> [  168.582916][   T52] Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 07/29/2019
> [  168.585746][   T52] Call Trace:
> [  168.586565][   T52]  dump_stack+0x97/0xde
> [  168.588235][   T52]  ? irq_force_complete_move+0x61/0x80
> [  168.590020][   T52]  nmi_cpu_backtrace+0xe2/0xf0
> [  168.591382][   T52]  ? lapic_can_unplug_cpu+0x90/0x90
> [  168.592679][   T52]  nmi_trigger_cpumask_backtrace+0x124/0x170
> [  168.594338][   T52]  watchdog+0x4e4/0x950
> [  168.595543][   T52]  ? hungtask_pm_notify+0x70/0x70
> [  168.596790][   T52]  kthread+0x128/0x170
> [  168.597801][   T52]  ? kthread_create_worker_on_cpu+0x90/0x90
> [  168.599257][   T52]  ret_from_fork+0x24/0x30
> [  168.600448][   T52] Sending NMI from CPU 1 to CPUs 0,2-7:
> [  168.602261][    C2] NMI backtrace for cpu 2 skipped: idling at default_idle+0x25/0x180
> [  168.602268][    C4] NMI backtrace for cpu 4 skipped: idling at default_idle+0x25/0x180
> [  168.602272][    C0] NMI backtrace for cpu 0 skipped: idling at default_idle+0x25/0x180
> [  168.602277][    C3] NMI backtrace for cpu 3 skipped: idling at default_idle+0x25/0x180
> [  168.602294][    C7] NMI backtrace for cpu 7 skipped: idling at default_idle+0x25/0x180
> [  168.602299][    C6] NMI backtrace for cpu 6 skipped: idling at default_idle+0x25/0x180
> [  168.602308][    C5] NMI backtrace for cpu 5 skipped: idling at default_idle+0x25/0x180
> [  168.603243][   T52] Kernel panic - not syncing: hung_task: blocked tasks
> [  168.623795][   T52] CPU: 1 PID: 52 Comm: khungtaskd Not tainted 5.7.0-rc5+ #13
> [  168.625777][   T52] Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 07/29/2019
> [  168.629089][   T52] Call Trace:
> [  168.630281][   T52]  dump_stack+0x97/0xde
> [  168.631495][   T52]  panic+0x135/0x3d5
> [  168.632577][   T52]  ? watchdog+0x4e4/0x950
> [  168.633730][   T52]  watchdog+0x4f0/0x950
> [  168.634829][   T52]  ? hungtask_pm_notify+0x70/0x70
> [  168.636160][   T52]  kthread+0x128/0x170
> [  168.637238][   T52]  ? kthread_create_worker_on_cpu+0x90/0x90
> [  168.638792][   T52]  ret_from_fork+0x24/0x30
> [  168.640142][   T52] Kernel Offset: disabled
> [  168.663256][   T52] Rebooting in 86400 seconds..
> ----------------------------------------
