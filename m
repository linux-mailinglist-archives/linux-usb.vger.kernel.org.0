Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5D9D70F0F
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2019 04:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbfGWCS3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jul 2019 22:18:29 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:37826 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbfGWCS3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Jul 2019 22:18:29 -0400
Received: by mail-oi1-f196.google.com with SMTP id t76so31172713oih.4
        for <linux-usb@vger.kernel.org>; Mon, 22 Jul 2019 19:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8VzuaoL4UUsnGPEo4s9RGomaigRxwkldcpErml69yGk=;
        b=gagUAyU1mx2zor+hvWSlOUeCZtNC70k4noC5RC7JH0U/MHKIDP1mVXCnnXVwZcPfBs
         b6y3ua6EE8xH21MYtJ1b7mjE3+VL7cqFNuIghjodfulFyyPvQhK9wJts49kgPe68m+FK
         Y8ecm7d1StYAbyE86K9usz7rRCbXSsxF8URstQMYBttKtM3f48F3YkYBgjGHB3VLsoGh
         UitF734/UYL/3TNYcuh3rRe3zyeu8ULJKcWqxsTOVz5rUI5POarveW6WxmWG3n9omBI6
         pAQ535qD8hcQ/4+vBAEvO3ocm+Wv5W9NEmsDstEPHQtD9jZUqbhLNZK+jMz8TryOAxO7
         ZyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8VzuaoL4UUsnGPEo4s9RGomaigRxwkldcpErml69yGk=;
        b=lL6D2ttmdOkPMhG7wh3gxyhiUrtGJiHwqSK5LdHw+lvvtxmuBAlAM/SctTTphSDMp8
         +oq1TU8/+Xk0dEKX2TByzmeimK8uGs6TV/LUljASd05ZgOE05UoIc5NpTY0V+ED6OgQp
         yV2LRoxL4drogH/gTiS6Cl1jpFZZSmu1j+7SSQu0SMVjRa/GDz8q32FOWFNciP/TPn7W
         2pT9AthcwP0OtQ00cBLqUBgHDKuSmBVFcTG4mD4vy+kIub0Wf9sS8U1irdA3FbRb+aP9
         KKCqNPGYpOkHbsD86Xi+C85YAsmGhi+GmBk/bNh52WQ08q/WitffJ+HTvKLHBsjHFU0i
         njQw==
X-Gm-Message-State: APjAAAXimi1ItXFTMLciz1AabG7vrUgv/Mecmfa/IyHAgMwaFe5TB9D7
        e9nuMKbZXgnqjT/CYZgSZrqdjIB9m9xdgQpyqa0SHg==
X-Google-Smtp-Source: APXvYqxfp7xrunOz23WFfZMUtwNBBRc1Dd9s+QJ32TaskmRgS1I4gspAGt1H37vkYzS87UBuHyOA1Ql68ECVDXEDz4U=
X-Received: by 2002:aca:6056:: with SMTP id u83mr34538460oib.27.1563848307190;
 Mon, 22 Jul 2019 19:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563809035.git.mirq-linux@rere.qmqm.pl> <0dd7dc4d5135b838d8f0fe98d0a689163cc9dda8.1563809035.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <0dd7dc4d5135b838d8f0fe98d0a689163cc9dda8.1563809035.git.mirq-linux@rere.qmqm.pl>
From:   Baolin Wang <baolin.wang@linaro.org>
Date:   Tue, 23 Jul 2019 10:18:15 +0800
Message-ID: <CAMz4kuKELL_7sk8QBNnpfYGx=j5Fdr+ev0893e1HFY0ATFJZUQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] usb: gadget: u_serial: reimplement console support
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     USB <linux-usb@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ladislav Michl <ladis@linux-mips.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michal,

On Mon, 22 Jul 2019 at 23:26, Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qm=
qm.pl> wrote:
>
> Rewrite console support to fix a few shortcomings of the old code
> preventing its use with multiple ports. This removes some duplicated
> code and replaces a custom kthread with simpler workqueue item.

Could you elaborate on why changing kthread to a workqueue? The
purpose of using kthread here is considering that the kthead has a
better scheduler response than pooled kworker.

>
> Only port ttyGS0 gets to be a console for now.
>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Tested-by: Ladislav Michl <ladis@linux-mips.org>
>
> ---
>   v5: no changes
>   v4: cosmetic change to __gs_console_push()
>   v3: no changes
>   v2: no changes
>
> ---
>  drivers/usb/gadget/function/u_serial.c | 351 ++++++++++++-------------
>  1 file changed, 164 insertions(+), 187 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/=
function/u_serial.c
> index bb1e2e1d0076..94f6999e8262 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -82,14 +82,12 @@
>  #define GS_CONSOLE_BUF_SIZE    8192
>
>  /* console info */
> -struct gscons_info {
> -       struct gs_port          *port;
> -       struct task_struct      *console_thread;
> -       struct kfifo            con_buf;
> -       /* protect the buf and busy flag */
> -       spinlock_t              con_lock;
> -       int                     req_busy;
> -       struct usb_request      *console_req;
> +struct gs_console {
> +       struct console          console;
> +       struct work_struct      work;
> +       spinlock_t              lock;
> +       struct usb_request      *req;
> +       struct kfifo            buf;
>  };
>
>  /*
> @@ -101,6 +99,9 @@ struct gs_port {
>         spinlock_t              port_lock;      /* guard port_* access */
>
>         struct gserial          *port_usb;
> +#ifdef CONFIG_U_SERIAL_CONSOLE
> +       struct gs_console       *console;
> +#endif
>
>         bool                    openclose;      /* open/close in progress=
 */
>         u8                      port_num;
> @@ -889,36 +890,9 @@ static struct tty_driver *gs_tty_driver;
>
>  #ifdef CONFIG_U_SERIAL_CONSOLE
>
> -static struct gscons_info gscons_info;
> -static struct console gserial_cons;
> -
> -static struct usb_request *gs_request_new(struct usb_ep *ep)
> +static void gs_console_complete_out(struct usb_ep *ep, struct usb_reques=
t *req)
>  {
> -       struct usb_request *req =3D usb_ep_alloc_request(ep, GFP_ATOMIC);
> -       if (!req)
> -               return NULL;
> -
> -       req->buf =3D kmalloc(ep->maxpacket, GFP_ATOMIC);
> -       if (!req->buf) {
> -               usb_ep_free_request(ep, req);
> -               return NULL;
> -       }
> -
> -       return req;
> -}
> -
> -static void gs_request_free(struct usb_request *req, struct usb_ep *ep)
> -{
> -       if (!req)
> -               return;
> -
> -       kfree(req->buf);
> -       usb_ep_free_request(ep, req);
> -}
> -
> -static void gs_complete_out(struct usb_ep *ep, struct usb_request *req)
> -{
> -       struct gscons_info *info =3D &gscons_info;
> +       struct gs_console *cons =3D req->context;
>
>         switch (req->status) {
>         default:
> @@ -927,12 +901,12 @@ static void gs_complete_out(struct usb_ep *ep, stru=
ct usb_request *req)
>                 /* fall through */
>         case 0:
>                 /* normal completion */
> -               spin_lock(&info->con_lock);
> -               info->req_busy =3D 0;
> -               spin_unlock(&info->con_lock);
> -
> -               wake_up_process(info->console_thread);
> +               spin_lock(&cons->lock);
> +               req->length =3D 0;
> +               schedule_work(&cons->work);
> +               spin_unlock(&cons->lock);
>                 break;
> +       case -ECONNRESET:
>         case -ESHUTDOWN:
>                 /* disconnect */
>                 pr_vdebug("%s: %s shutdown\n", __func__, ep->name);
> @@ -940,190 +914,190 @@ static void gs_complete_out(struct usb_ep *ep, st=
ruct usb_request *req)
>         }
>  }
>
> -static int gs_console_connect(int port_num)
> +static void __gs_console_push(struct gs_console *cons)
>  {
> -       struct gscons_info *info =3D &gscons_info;
> -       struct gs_port *port;
> +       struct usb_request *req =3D cons->req;
>         struct usb_ep *ep;
> +       size_t size;
>
> -       if (port_num !=3D gserial_cons.index) {
> -               pr_err("%s: port num [%d] is not support console\n",
> -                      __func__, port_num);
> -               return -ENXIO;
> -       }
> +       if (!req)
> +               return; /* disconnected */
>
> -       port =3D ports[port_num].port;
> -       ep =3D port->port_usb->in;
> -       if (!info->console_req) {
> -               info->console_req =3D gs_request_new(ep);
> -               if (!info->console_req)
> -                       return -ENOMEM;
> -               info->console_req->complete =3D gs_complete_out;
> -       }
> +       if (req->length)
> +               return; /* busy */
>
> -       info->port =3D port;
> -       spin_lock(&info->con_lock);
> -       info->req_busy =3D 0;
> -       spin_unlock(&info->con_lock);
> -       pr_vdebug("port[%d] console connect!\n", port_num);
> -       return 0;
> -}
> -
> -static void gs_console_disconnect(struct usb_ep *ep)
> -{
> -       struct gscons_info *info =3D &gscons_info;
> -       struct usb_request *req =3D info->console_req;
> -
> -       gs_request_free(req, ep);
> -       info->console_req =3D NULL;
> -}
> -
> -static int gs_console_thread(void *data)
> -{
> -       struct gscons_info *info =3D &gscons_info;
> -       struct gs_port *port;
> -       struct usb_request *req;
> -       struct usb_ep *ep;
> -       int xfer, ret, count, size;
> +       ep =3D cons->console.data;
> +       size =3D kfifo_out(&cons->buf, req->buf, ep->maxpacket);
> +       if (!size)
> +               return;
>
> -       do {
> -               port =3D info->port;
> -               set_current_state(TASK_INTERRUPTIBLE);
> -               if (!port || !port->port_usb
> -                   || !port->port_usb->in || !info->console_req)
> -                       goto sched;
> -
> -               req =3D info->console_req;
> -               ep =3D port->port_usb->in;
> -
> -               spin_lock_irq(&info->con_lock);
> -               count =3D kfifo_len(&info->con_buf);
> -               size =3D ep->maxpacket;
> -
> -               if (count > 0 && !info->req_busy) {
> -                       set_current_state(TASK_RUNNING);
> -                       if (count < size)
> -                               size =3D count;
> -
> -                       xfer =3D kfifo_out(&info->con_buf, req->buf, size=
);
> -                       req->length =3D xfer;
> -
> -                       spin_unlock(&info->con_lock);
> -                       ret =3D usb_ep_queue(ep, req, GFP_ATOMIC);
> -                       spin_lock(&info->con_lock);
> -                       if (ret < 0)
> -                               info->req_busy =3D 0;
> -                       else
> -                               info->req_busy =3D 1;
> -
> -                       spin_unlock_irq(&info->con_lock);
> -               } else {
> -                       spin_unlock_irq(&info->con_lock);
> -sched:
> -                       if (kthread_should_stop()) {
> -                               set_current_state(TASK_RUNNING);
> -                               break;
> -                       }
> -                       schedule();
> -               }
> -       } while (1);
> -
> -       return 0;
> +       req->length =3D size;
> +       if (usb_ep_queue(ep, req, GFP_ATOMIC))
> +               req->length =3D 0;
>  }
>
> -static int gs_console_setup(struct console *co, char *options)
> +static void gs_console_work(struct work_struct *work)
>  {
> -       struct gscons_info *info =3D &gscons_info;
> -       int status;
> -
> -       info->port =3D NULL;
> -       info->console_req =3D NULL;
> -       info->req_busy =3D 0;
> -       spin_lock_init(&info->con_lock);
> +       struct gs_console *cons =3D container_of(work, struct gs_console,=
 work);
>
> -       status =3D kfifo_alloc(&info->con_buf, GS_CONSOLE_BUF_SIZE, GFP_K=
ERNEL);
> -       if (status) {
> -               pr_err("%s: allocate console buffer failed\n", __func__);
> -               return status;
> -       }
> +       spin_lock_irq(&cons->lock);
>
> -       info->console_thread =3D kthread_create(gs_console_thread,
> -                                             co, "gs_console");
> -       if (IS_ERR(info->console_thread)) {
> -               pr_err("%s: cannot create console thread\n", __func__);
> -               kfifo_free(&info->con_buf);
> -               return PTR_ERR(info->console_thread);
> -       }
> -       wake_up_process(info->console_thread);
> +       __gs_console_push(cons);
>
> -       return 0;
> +       spin_unlock_irq(&cons->lock);
>  }
>
>  static void gs_console_write(struct console *co,
>                              const char *buf, unsigned count)
>  {
> -       struct gscons_info *info =3D &gscons_info;
> +       struct gs_console *cons =3D container_of(co, struct gs_console, c=
onsole);
>         unsigned long flags;
>
> -       spin_lock_irqsave(&info->con_lock, flags);
> -       kfifo_in(&info->con_buf, buf, count);
> -       spin_unlock_irqrestore(&info->con_lock, flags);
> +       spin_lock_irqsave(&cons->lock, flags);
>
> -       wake_up_process(info->console_thread);
> +       kfifo_in(&cons->buf, buf, count);
> +
> +       if (cons->req && !cons->req->length)
> +               schedule_work(&cons->work);
> +
> +       spin_unlock_irqrestore(&cons->lock, flags);
>  }
>
>  static struct tty_driver *gs_console_device(struct console *co, int *ind=
ex)
>  {
> -       struct tty_driver **p =3D (struct tty_driver **)co->data;
> -
> -       if (!*p)
> -               return NULL;
> -
>         *index =3D co->index;
> -       return *p;
> +       return gs_tty_driver;
>  }
>
> -static struct console gserial_cons =3D {
> -       .name =3D         "ttyGS",
> -       .write =3D        gs_console_write,
> -       .device =3D       gs_console_device,
> -       .setup =3D        gs_console_setup,
> -       .flags =3D        CON_PRINTBUFFER,
> -       .index =3D        -1,
> -       .data =3D         &gs_tty_driver,
> -};
> -
> -static void gserial_console_init(void)
> +static int gs_console_connect(struct gs_port *port)
>  {
> -       register_console(&gserial_cons);
> +       struct gs_console *cons =3D port->console;
> +       struct usb_request *req;
> +       struct usb_ep *ep;
> +
> +       if (!cons)
> +               return 0;
> +
> +       ep =3D port->port_usb->in;
> +       req =3D gs_alloc_req(ep, ep->maxpacket, GFP_ATOMIC);
> +       if (!req)
> +               return -ENOMEM;
> +       req->complete =3D gs_console_complete_out;
> +       req->context =3D cons;
> +       req->length =3D 0;
> +
> +       spin_lock(&cons->lock);
> +       cons->req =3D req;
> +       cons->console.data =3D ep;
> +       spin_unlock(&cons->lock);
> +
> +       pr_debug("ttyGS%d: console connected!\n", port->port_num);
> +
> +       schedule_work(&cons->work);
> +
> +       return 0;
> +}
> +
> +static void gs_console_disconnect(struct gs_port *port)
> +{
> +       struct gs_console *cons =3D port->console;
> +       struct usb_request *req;
> +       struct usb_ep *ep;
> +
> +       if (!cons)
> +               return;
> +
> +       spin_lock(&cons->lock);
> +
> +       req =3D cons->req;
> +       ep =3D cons->console.data;
> +       cons->req =3D NULL;
> +
> +       spin_unlock(&cons->lock);
> +
> +       if (!req)
> +               return;
> +
> +       usb_ep_dequeue(ep, req);
> +       gs_free_req(ep, req);
>  }
>
> -static void gserial_console_exit(void)
> +static int gs_console_init(struct gs_port *port)
>  {
> -       struct gscons_info *info =3D &gscons_info;
> +       struct gs_console *cons;
> +       int err;
> +
> +       if (port->console)
> +               return 0;
> +
> +       cons =3D kzalloc(sizeof(*port->console), GFP_KERNEL);
> +       if (!cons)
> +               return -ENOMEM;
> +
> +       strcpy(cons->console.name, "ttyGS");
> +       cons->console.write =3D gs_console_write;
> +       cons->console.device =3D gs_console_device;
> +       cons->console.flags =3D CON_PRINTBUFFER;
> +       cons->console.index =3D port->port_num;
> +
> +       INIT_WORK(&cons->work, gs_console_work);
> +       spin_lock_init(&cons->lock);
> +
> +       err =3D kfifo_alloc(&cons->buf, GS_CONSOLE_BUF_SIZE, GFP_KERNEL);
> +       if (err) {
> +               pr_err("ttyGS%d: allocate console buffer failed\n", port-=
>port_num);
> +               kfree(cons);
> +               return err;
> +       }
> +
> +       port->console =3D cons;
> +       register_console(&cons->console);
> +
> +       spin_lock_irq(&port->port_lock);
> +       if (port->port_usb)
> +               gs_console_connect(port);
> +       spin_unlock_irq(&port->port_lock);
> +
> +       return 0;
> +}
> +
> +static void gs_console_exit(struct gs_port *port)
> +{
> +       struct gs_console *cons =3D port->console;
> +
> +       if (!cons)
> +               return;
> +
> +       unregister_console(&cons->console);
> +
> +       spin_lock_irq(&port->port_lock);
> +       if (cons->req)
> +               gs_console_disconnect(port);
> +       spin_unlock_irq(&port->port_lock);
>
> -       unregister_console(&gserial_cons);
> -       if (!IS_ERR_OR_NULL(info->console_thread))
> -               kthread_stop(info->console_thread);
> -       kfifo_free(&info->con_buf);
> +       cancel_work_sync(&cons->work);
> +       kfifo_free(&cons->buf);
> +       kfree(cons);
> +       port->console =3D NULL;
>  }
>
>  #else
>
> -static int gs_console_connect(int port_num)
> +static int gs_console_connect(struct gs_port *port)
>  {
>         return 0;
>  }
>
> -static void gs_console_disconnect(struct usb_ep *ep)
> +static void gs_console_disconnect(struct gs_port *port)
>  {
>  }
>
> -static void gserial_console_init(void)
> +static int gs_console_init(struct gs_port *port)
>  {
> +       return -ENOSYS;
>  }
>
> -static void gserial_console_exit(void)
> +static void gs_console_exit(struct gs_port *port)
>  {
>  }
>
> @@ -1197,18 +1171,19 @@ void gserial_free_line(unsigned char port_num)
>                 return;
>         }
>         port =3D ports[port_num].port;
> +       gs_console_exit(port);
>         ports[port_num].port =3D NULL;
>         mutex_unlock(&ports[port_num].lock);
>
>         gserial_free_port(port);
>         tty_unregister_device(gs_tty_driver, port_num);
> -       gserial_console_exit();
>  }
>  EXPORT_SYMBOL_GPL(gserial_free_line);
>
>  int gserial_alloc_line(unsigned char *line_num)
>  {
>         struct usb_cdc_line_coding      coding;
> +       struct gs_port                  *port;
>         struct device                   *tty_dev;
>         int                             ret;
>         int                             port_num;
> @@ -1231,23 +1206,24 @@ int gserial_alloc_line(unsigned char *line_num)
>
>         /* ... and sysfs class devices, so mdev/udev make /dev/ttyGS* */
>
> -       tty_dev =3D tty_port_register_device(&ports[port_num].port->port,
> +       port =3D ports[port_num].port;
> +       tty_dev =3D tty_port_register_device(&port->port,
>                         gs_tty_driver, port_num, NULL);
>         if (IS_ERR(tty_dev)) {
> -               struct gs_port  *port;
>                 pr_err("%s: failed to register tty for port %d, err %ld\n=
",
>                                 __func__, port_num, PTR_ERR(tty_dev));
>
>                 ret =3D PTR_ERR(tty_dev);
>                 mutex_lock(&ports[port_num].lock);
> -               port =3D ports[port_num].port;
>                 ports[port_num].port =3D NULL;
>                 mutex_unlock(&ports[port_num].lock);
>                 gserial_free_port(port);
>                 goto err;
>         }
>         *line_num =3D port_num;
> -       gserial_console_init();
> +
> +       if (!port_num)
> +               gs_console_init(port);
>  err:
>         return ret;
>  }
> @@ -1329,7 +1305,7 @@ int gserial_connect(struct gserial *gser, u8 port_n=
um)
>                         gser->disconnect(gser);
>         }
>
> -       status =3D gs_console_connect(port_num);
> +       status =3D gs_console_connect(port);
>         spin_unlock_irqrestore(&port->port_lock, flags);
>
>         return status;
> @@ -1361,6 +1337,8 @@ void gserial_disconnect(struct gserial *gser)
>         /* tell the TTY glue not to do I/O here any more */
>         spin_lock_irqsave(&port->port_lock, flags);
>
> +       gs_console_disconnect(port);
> +
>         /* REVISIT as above: how best to track this? */
>         port->port_line_coding =3D gser->port_line_coding;
>
> @@ -1388,7 +1366,6 @@ void gserial_disconnect(struct gserial *gser)
>         port->read_allocated =3D port->read_started =3D
>                 port->write_allocated =3D port->write_started =3D 0;
>
> -       gs_console_disconnect(gser->in);
>         spin_unlock_irqrestore(&port->port_lock, flags);
>  }
>  EXPORT_SYMBOL_GPL(gserial_disconnect);
> --
> 2.20.1
>


--=20
Baolin Wang
Best Regards
