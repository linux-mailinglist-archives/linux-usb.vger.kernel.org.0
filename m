Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF6CA713B2
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2019 10:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733101AbfGWIPe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jul 2019 04:15:34 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:53004 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733098AbfGWIPe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Jul 2019 04:15:34 -0400
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
        (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
        id S23991521AbfGWIPaQ69QI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Jul 2019 10:15:30 +0200
Date:   Tue, 23 Jul 2019 10:15:29 +0200
From:   Ladislav Michl <ladis@linux-mips.org>
To:     Baolin Wang <baolin.wang@linaro.org>
Cc:     =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>,
        USB <linux-usb@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 2/6] usb: gadget: u_serial: reimplement console support
Message-ID: <20190723081529.GB20201@lenoch>
References: <cover.1563809035.git.mirq-linux@rere.qmqm.pl>
 <0dd7dc4d5135b838d8f0fe98d0a689163cc9dda8.1563809035.git.mirq-linux@rere.qmqm.pl>
 <CAMz4kuKELL_7sk8QBNnpfYGx=j5Fdr+ev0893e1HFY0ATFJZUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMz4kuKELL_7sk8QBNnpfYGx=j5Fdr+ev0893e1HFY0ATFJZUQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 23, 2019 at 10:18:15AM +0800, Baolin Wang wrote:
> Hi Michal,
> 
> On Mon, 22 Jul 2019 at 23:26, Micha� Miros�aw <mirq-linux@rere.qmqm.pl> wrote:
> >
> > Rewrite console support to fix a few shortcomings of the old code
> > preventing its use with multiple ports. This removes some duplicated
> > code and replaces a custom kthread with simpler workqueue item.
> 
> Could you elaborate on why changing kthread to a workqueue? The
> purpose of using kthread here is considering that the kthead has a
> better scheduler response than pooled kworker.

...which is not that relevant there. Current kthead implementation
is buggy, see this series for what needs to be done to fix it:
https://marc.info/?l=linux-usb&m=156305214227371&w=2
and as Micha�'s fix is superior to fixing kthread I'm voting for his
solution. Only one of my patches is still needed and I'll resend
once this fix hits -next.

> >
> > Only port ttyGS0 gets to be a console for now.
> >
> > Signed-off-by: Micha� Miros�aw <mirq-linux@rere.qmqm.pl>
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Tested-by: Ladislav Michl <ladis@linux-mips.org>
> >
> > ---
> >   v5: no changes
> >   v4: cosmetic change to __gs_console_push()
> >   v3: no changes
> >   v2: no changes
> >
> > ---
> >  drivers/usb/gadget/function/u_serial.c | 351 ++++++++++++-------------
> >  1 file changed, 164 insertions(+), 187 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
> > index bb1e2e1d0076..94f6999e8262 100644
> > --- a/drivers/usb/gadget/function/u_serial.c
> > +++ b/drivers/usb/gadget/function/u_serial.c
> > @@ -82,14 +82,12 @@
> >  #define GS_CONSOLE_BUF_SIZE    8192
> >
> >  /* console info */
> > -struct gscons_info {
> > -       struct gs_port          *port;
> > -       struct task_struct      *console_thread;
> > -       struct kfifo            con_buf;
> > -       /* protect the buf and busy flag */
> > -       spinlock_t              con_lock;
> > -       int                     req_busy;
> > -       struct usb_request      *console_req;
> > +struct gs_console {
> > +       struct console          console;
> > +       struct work_struct      work;
> > +       spinlock_t              lock;
> > +       struct usb_request      *req;
> > +       struct kfifo            buf;
> >  };
> >
> >  /*
> > @@ -101,6 +99,9 @@ struct gs_port {
> >         spinlock_t              port_lock;      /* guard port_* access */
> >
> >         struct gserial          *port_usb;
> > +#ifdef CONFIG_U_SERIAL_CONSOLE
> > +       struct gs_console       *console;
> > +#endif
> >
> >         bool                    openclose;      /* open/close in progress */
> >         u8                      port_num;
> > @@ -889,36 +890,9 @@ static struct tty_driver *gs_tty_driver;
> >
> >  #ifdef CONFIG_U_SERIAL_CONSOLE
> >
> > -static struct gscons_info gscons_info;
> > -static struct console gserial_cons;
> > -
> > -static struct usb_request *gs_request_new(struct usb_ep *ep)
> > +static void gs_console_complete_out(struct usb_ep *ep, struct usb_request *req)
> >  {
> > -       struct usb_request *req = usb_ep_alloc_request(ep, GFP_ATOMIC);
> > -       if (!req)
> > -               return NULL;
> > -
> > -       req->buf = kmalloc(ep->maxpacket, GFP_ATOMIC);
> > -       if (!req->buf) {
> > -               usb_ep_free_request(ep, req);
> > -               return NULL;
> > -       }
> > -
> > -       return req;
> > -}
> > -
> > -static void gs_request_free(struct usb_request *req, struct usb_ep *ep)
> > -{
> > -       if (!req)
> > -               return;
> > -
> > -       kfree(req->buf);
> > -       usb_ep_free_request(ep, req);
> > -}
> > -
> > -static void gs_complete_out(struct usb_ep *ep, struct usb_request *req)
> > -{
> > -       struct gscons_info *info = &gscons_info;
> > +       struct gs_console *cons = req->context;
> >
> >         switch (req->status) {
> >         default:
> > @@ -927,12 +901,12 @@ static void gs_complete_out(struct usb_ep *ep, struct usb_request *req)
> >                 /* fall through */
> >         case 0:
> >                 /* normal completion */
> > -               spin_lock(&info->con_lock);
> > -               info->req_busy = 0;
> > -               spin_unlock(&info->con_lock);
> > -
> > -               wake_up_process(info->console_thread);
> > +               spin_lock(&cons->lock);
> > +               req->length = 0;
> > +               schedule_work(&cons->work);
> > +               spin_unlock(&cons->lock);
> >                 break;
> > +       case -ECONNRESET:
> >         case -ESHUTDOWN:
> >                 /* disconnect */
> >                 pr_vdebug("%s: %s shutdown\n", __func__, ep->name);
> > @@ -940,190 +914,190 @@ static void gs_complete_out(struct usb_ep *ep, struct usb_request *req)
> >         }
> >  }
> >
> > -static int gs_console_connect(int port_num)
> > +static void __gs_console_push(struct gs_console *cons)
> >  {
> > -       struct gscons_info *info = &gscons_info;
> > -       struct gs_port *port;
> > +       struct usb_request *req = cons->req;
> >         struct usb_ep *ep;
> > +       size_t size;
> >
> > -       if (port_num != gserial_cons.index) {
> > -               pr_err("%s: port num [%d] is not support console\n",
> > -                      __func__, port_num);
> > -               return -ENXIO;
> > -       }
> > +       if (!req)
> > +               return; /* disconnected */
> >
> > -       port = ports[port_num].port;
> > -       ep = port->port_usb->in;
> > -       if (!info->console_req) {
> > -               info->console_req = gs_request_new(ep);
> > -               if (!info->console_req)
> > -                       return -ENOMEM;
> > -               info->console_req->complete = gs_complete_out;
> > -       }
> > +       if (req->length)
> > +               return; /* busy */
> >
> > -       info->port = port;
> > -       spin_lock(&info->con_lock);
> > -       info->req_busy = 0;
> > -       spin_unlock(&info->con_lock);
> > -       pr_vdebug("port[%d] console connect!\n", port_num);
> > -       return 0;
> > -}
> > -
> > -static void gs_console_disconnect(struct usb_ep *ep)
> > -{
> > -       struct gscons_info *info = &gscons_info;
> > -       struct usb_request *req = info->console_req;
> > -
> > -       gs_request_free(req, ep);
> > -       info->console_req = NULL;
> > -}
> > -
> > -static int gs_console_thread(void *data)
> > -{
> > -       struct gscons_info *info = &gscons_info;
> > -       struct gs_port *port;
> > -       struct usb_request *req;
> > -       struct usb_ep *ep;
> > -       int xfer, ret, count, size;
> > +       ep = cons->console.data;
> > +       size = kfifo_out(&cons->buf, req->buf, ep->maxpacket);
> > +       if (!size)
> > +               return;
> >
> > -       do {
> > -               port = info->port;
> > -               set_current_state(TASK_INTERRUPTIBLE);
> > -               if (!port || !port->port_usb
> > -                   || !port->port_usb->in || !info->console_req)
> > -                       goto sched;
> > -
> > -               req = info->console_req;
> > -               ep = port->port_usb->in;
> > -
> > -               spin_lock_irq(&info->con_lock);
> > -               count = kfifo_len(&info->con_buf);
> > -               size = ep->maxpacket;
> > -
> > -               if (count > 0 && !info->req_busy) {
> > -                       set_current_state(TASK_RUNNING);
> > -                       if (count < size)
> > -                               size = count;
> > -
> > -                       xfer = kfifo_out(&info->con_buf, req->buf, size);
> > -                       req->length = xfer;
> > -
> > -                       spin_unlock(&info->con_lock);
> > -                       ret = usb_ep_queue(ep, req, GFP_ATOMIC);
> > -                       spin_lock(&info->con_lock);
> > -                       if (ret < 0)
> > -                               info->req_busy = 0;
> > -                       else
> > -                               info->req_busy = 1;
> > -
> > -                       spin_unlock_irq(&info->con_lock);
> > -               } else {
> > -                       spin_unlock_irq(&info->con_lock);
> > -sched:
> > -                       if (kthread_should_stop()) {
> > -                               set_current_state(TASK_RUNNING);
> > -                               break;
> > -                       }
> > -                       schedule();
> > -               }
> > -       } while (1);
> > -
> > -       return 0;
> > +       req->length = size;
> > +       if (usb_ep_queue(ep, req, GFP_ATOMIC))
> > +               req->length = 0;
> >  }
> >
> > -static int gs_console_setup(struct console *co, char *options)
> > +static void gs_console_work(struct work_struct *work)
> >  {
> > -       struct gscons_info *info = &gscons_info;
> > -       int status;
> > -
> > -       info->port = NULL;
> > -       info->console_req = NULL;
> > -       info->req_busy = 0;
> > -       spin_lock_init(&info->con_lock);
> > +       struct gs_console *cons = container_of(work, struct gs_console, work);
> >
> > -       status = kfifo_alloc(&info->con_buf, GS_CONSOLE_BUF_SIZE, GFP_KERNEL);
> > -       if (status) {
> > -               pr_err("%s: allocate console buffer failed\n", __func__);
> > -               return status;
> > -       }
> > +       spin_lock_irq(&cons->lock);
> >
> > -       info->console_thread = kthread_create(gs_console_thread,
> > -                                             co, "gs_console");
> > -       if (IS_ERR(info->console_thread)) {
> > -               pr_err("%s: cannot create console thread\n", __func__);
> > -               kfifo_free(&info->con_buf);
> > -               return PTR_ERR(info->console_thread);
> > -       }
> > -       wake_up_process(info->console_thread);
> > +       __gs_console_push(cons);
> >
> > -       return 0;
> > +       spin_unlock_irq(&cons->lock);
> >  }
> >
> >  static void gs_console_write(struct console *co,
> >                              const char *buf, unsigned count)
> >  {
> > -       struct gscons_info *info = &gscons_info;
> > +       struct gs_console *cons = container_of(co, struct gs_console, console);
> >         unsigned long flags;
> >
> > -       spin_lock_irqsave(&info->con_lock, flags);
> > -       kfifo_in(&info->con_buf, buf, count);
> > -       spin_unlock_irqrestore(&info->con_lock, flags);
> > +       spin_lock_irqsave(&cons->lock, flags);
> >
> > -       wake_up_process(info->console_thread);
> > +       kfifo_in(&cons->buf, buf, count);
> > +
> > +       if (cons->req && !cons->req->length)
> > +               schedule_work(&cons->work);
> > +
> > +       spin_unlock_irqrestore(&cons->lock, flags);
> >  }
> >
> >  static struct tty_driver *gs_console_device(struct console *co, int *index)
> >  {
> > -       struct tty_driver **p = (struct tty_driver **)co->data;
> > -
> > -       if (!*p)
> > -               return NULL;
> > -
> >         *index = co->index;
> > -       return *p;
> > +       return gs_tty_driver;
> >  }
> >
> > -static struct console gserial_cons = {
> > -       .name =         "ttyGS",
> > -       .write =        gs_console_write,
> > -       .device =       gs_console_device,
> > -       .setup =        gs_console_setup,
> > -       .flags =        CON_PRINTBUFFER,
> > -       .index =        -1,
> > -       .data =         &gs_tty_driver,
> > -};
> > -
> > -static void gserial_console_init(void)
> > +static int gs_console_connect(struct gs_port *port)
> >  {
> > -       register_console(&gserial_cons);
> > +       struct gs_console *cons = port->console;
> > +       struct usb_request *req;
> > +       struct usb_ep *ep;
> > +
> > +       if (!cons)
> > +               return 0;
> > +
> > +       ep = port->port_usb->in;
> > +       req = gs_alloc_req(ep, ep->maxpacket, GFP_ATOMIC);
> > +       if (!req)
> > +               return -ENOMEM;
> > +       req->complete = gs_console_complete_out;
> > +       req->context = cons;
> > +       req->length = 0;
> > +
> > +       spin_lock(&cons->lock);
> > +       cons->req = req;
> > +       cons->console.data = ep;
> > +       spin_unlock(&cons->lock);
> > +
> > +       pr_debug("ttyGS%d: console connected!\n", port->port_num);
> > +
> > +       schedule_work(&cons->work);
> > +
> > +       return 0;
> > +}
> > +
> > +static void gs_console_disconnect(struct gs_port *port)
> > +{
> > +       struct gs_console *cons = port->console;
> > +       struct usb_request *req;
> > +       struct usb_ep *ep;
> > +
> > +       if (!cons)
> > +               return;
> > +
> > +       spin_lock(&cons->lock);
> > +
> > +       req = cons->req;
> > +       ep = cons->console.data;
> > +       cons->req = NULL;
> > +
> > +       spin_unlock(&cons->lock);
> > +
> > +       if (!req)
> > +               return;
> > +
> > +       usb_ep_dequeue(ep, req);
> > +       gs_free_req(ep, req);
> >  }
> >
> > -static void gserial_console_exit(void)
> > +static int gs_console_init(struct gs_port *port)
> >  {
> > -       struct gscons_info *info = &gscons_info;
> > +       struct gs_console *cons;
> > +       int err;
> > +
> > +       if (port->console)
> > +               return 0;
> > +
> > +       cons = kzalloc(sizeof(*port->console), GFP_KERNEL);
> > +       if (!cons)
> > +               return -ENOMEM;
> > +
> > +       strcpy(cons->console.name, "ttyGS");
> > +       cons->console.write = gs_console_write;
> > +       cons->console.device = gs_console_device;
> > +       cons->console.flags = CON_PRINTBUFFER;
> > +       cons->console.index = port->port_num;
> > +
> > +       INIT_WORK(&cons->work, gs_console_work);
> > +       spin_lock_init(&cons->lock);
> > +
> > +       err = kfifo_alloc(&cons->buf, GS_CONSOLE_BUF_SIZE, GFP_KERNEL);
> > +       if (err) {
> > +               pr_err("ttyGS%d: allocate console buffer failed\n", port->port_num);
> > +               kfree(cons);
> > +               return err;
> > +       }
> > +
> > +       port->console = cons;
> > +       register_console(&cons->console);
> > +
> > +       spin_lock_irq(&port->port_lock);
> > +       if (port->port_usb)
> > +               gs_console_connect(port);
> > +       spin_unlock_irq(&port->port_lock);
> > +
> > +       return 0;
> > +}
> > +
> > +static void gs_console_exit(struct gs_port *port)
> > +{
> > +       struct gs_console *cons = port->console;
> > +
> > +       if (!cons)
> > +               return;
> > +
> > +       unregister_console(&cons->console);
> > +
> > +       spin_lock_irq(&port->port_lock);
> > +       if (cons->req)
> > +               gs_console_disconnect(port);
> > +       spin_unlock_irq(&port->port_lock);
> >
> > -       unregister_console(&gserial_cons);
> > -       if (!IS_ERR_OR_NULL(info->console_thread))
> > -               kthread_stop(info->console_thread);
> > -       kfifo_free(&info->con_buf);
> > +       cancel_work_sync(&cons->work);
> > +       kfifo_free(&cons->buf);
> > +       kfree(cons);
> > +       port->console = NULL;
> >  }
> >
> >  #else
> >
> > -static int gs_console_connect(int port_num)
> > +static int gs_console_connect(struct gs_port *port)
> >  {
> >         return 0;
> >  }
> >
> > -static void gs_console_disconnect(struct usb_ep *ep)
> > +static void gs_console_disconnect(struct gs_port *port)
> >  {
> >  }
> >
> > -static void gserial_console_init(void)
> > +static int gs_console_init(struct gs_port *port)
> >  {
> > +       return -ENOSYS;
> >  }
> >
> > -static void gserial_console_exit(void)
> > +static void gs_console_exit(struct gs_port *port)
> >  {
> >  }
> >
> > @@ -1197,18 +1171,19 @@ void gserial_free_line(unsigned char port_num)
> >                 return;
> >         }
> >         port = ports[port_num].port;
> > +       gs_console_exit(port);
> >         ports[port_num].port = NULL;
> >         mutex_unlock(&ports[port_num].lock);
> >
> >         gserial_free_port(port);
> >         tty_unregister_device(gs_tty_driver, port_num);
> > -       gserial_console_exit();
> >  }
> >  EXPORT_SYMBOL_GPL(gserial_free_line);
> >
> >  int gserial_alloc_line(unsigned char *line_num)
> >  {
> >         struct usb_cdc_line_coding      coding;
> > +       struct gs_port                  *port;
> >         struct device                   *tty_dev;
> >         int                             ret;
> >         int                             port_num;
> > @@ -1231,23 +1206,24 @@ int gserial_alloc_line(unsigned char *line_num)
> >
> >         /* ... and sysfs class devices, so mdev/udev make /dev/ttyGS* */
> >
> > -       tty_dev = tty_port_register_device(&ports[port_num].port->port,
> > +       port = ports[port_num].port;
> > +       tty_dev = tty_port_register_device(&port->port,
> >                         gs_tty_driver, port_num, NULL);
> >         if (IS_ERR(tty_dev)) {
> > -               struct gs_port  *port;
> >                 pr_err("%s: failed to register tty for port %d, err %ld\n",
> >                                 __func__, port_num, PTR_ERR(tty_dev));
> >
> >                 ret = PTR_ERR(tty_dev);
> >                 mutex_lock(&ports[port_num].lock);
> > -               port = ports[port_num].port;
> >                 ports[port_num].port = NULL;
> >                 mutex_unlock(&ports[port_num].lock);
> >                 gserial_free_port(port);
> >                 goto err;
> >         }
> >         *line_num = port_num;
> > -       gserial_console_init();
> > +
> > +       if (!port_num)
> > +               gs_console_init(port);
> >  err:
> >         return ret;
> >  }
> > @@ -1329,7 +1305,7 @@ int gserial_connect(struct gserial *gser, u8 port_num)
> >                         gser->disconnect(gser);
> >         }
> >
> > -       status = gs_console_connect(port_num);
> > +       status = gs_console_connect(port);
> >         spin_unlock_irqrestore(&port->port_lock, flags);
> >
> >         return status;
> > @@ -1361,6 +1337,8 @@ void gserial_disconnect(struct gserial *gser)
> >         /* tell the TTY glue not to do I/O here any more */
> >         spin_lock_irqsave(&port->port_lock, flags);
> >
> > +       gs_console_disconnect(port);
> > +
> >         /* REVISIT as above: how best to track this? */
> >         port->port_line_coding = gser->port_line_coding;
> >
> > @@ -1388,7 +1366,6 @@ void gserial_disconnect(struct gserial *gser)
> >         port->read_allocated = port->read_started =
> >                 port->write_allocated = port->write_started = 0;
> >
> > -       gs_console_disconnect(gser->in);
> >         spin_unlock_irqrestore(&port->port_lock, flags);
> >  }
> >  EXPORT_SYMBOL_GPL(gserial_disconnect);
> > --
> > 2.20.1
> >
> 
> 
> -- 
> Baolin Wang
> Best Regards
