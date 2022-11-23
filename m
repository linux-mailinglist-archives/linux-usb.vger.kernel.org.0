Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C760A636C73
	for <lists+linux-usb@lfdr.de>; Wed, 23 Nov 2022 22:37:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238590AbiKWVhC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Nov 2022 16:37:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236761AbiKWVhA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Nov 2022 16:37:00 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 246FBAF080
        for <linux-usb@vger.kernel.org>; Wed, 23 Nov 2022 13:36:59 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id n7so3765623wrr.13
        for <linux-usb@vger.kernel.org>; Wed, 23 Nov 2022 13:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tcx1M2ln6C03CDrE4R32wXvKJlSJYxLrWbY3gEveVVg=;
        b=WFLwmXxwxWO/UWFMOHR1wt+Gjn4aSlP38qFF233VV1iineFesHmWquc/neaH3fOLsw
         QfYjLc5nC1fr+le8d0QbeAqMw6BayGAmOTnHFQb1pHpqZJlN2qa87hIgbVBCRjzH2Jc5
         /J60Yl/q9hcw7Cdo8vq4x5YMcCMSdTZebkjcj0db7uUiIpU/o1VnF2eXMk3JUMdbRnVE
         z6qILFqzPJnueSBUrAo4yfaOK3dYMWHFsKKNyc7YhiNWwgarnn1rXZvz3mLGRtcCvlUZ
         n8GaMGIUBeexlqy0zHFN8riLOwVYYYDaRGbiuYxYZ+DrOsF3JDvr66ZZr8/Ba7wISYqP
         HUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tcx1M2ln6C03CDrE4R32wXvKJlSJYxLrWbY3gEveVVg=;
        b=TI9WpJGYTTccpLCmSBGxdS2BAwJqrlq5C5vdAxUwPwVq5xbLkzomtcEfQdJLYk5n/S
         0YAmf7Uba0qsdtR2vr13BwHDJkuQnP3yBhruPpot4SOm670jDJobtXq6Fm/wFmXuCd/B
         VLHtBc6TpJii4Vw54u7MTsf0xLZP3WQ18xjvULhOljlHE6mFpjDczi46HMPdbRUkghtG
         u8xjcwQLXtCi7To+yEWo2jZ7V3gbqFwP1VenHj8QxRqvy6niN3lsJ16Jbds21wSjF26d
         AdThqZam2zWpCgbpQlPLhfUPROlQSDg4TykReIFK9BUHntRZVgxNUkgZgFeCkvNU2RXl
         0YCg==
X-Gm-Message-State: ANoB5plS6JG+oRfulI6ZCbQLqb2XQGosZI9rhzHn1zVrT6G6pcEfNTW/
        EKvbzJni70moZRGSjDrMT1MzzYFmGI9hMFrMjsR0rg==
X-Google-Smtp-Source: AA0mqf4VQBNjKLHuWtf4tzGFn3kGXhDRIGaove/c5NIeFooVGvh9+RLavQgMeVMCmCvx2NUTI5SvTW1GQ+ajd9/xRJ0=
X-Received: by 2002:a05:6000:128c:b0:236:e512:1a9e with SMTP id
 f12-20020a056000128c00b00236e5121a9emr9450830wrx.416.1669239417450; Wed, 23
 Nov 2022 13:36:57 -0800 (PST)
MIME-Version: 1.0
References: <20221122082523.133974-1-haozhe.chang@mediatek.com>
In-Reply-To: <20221122082523.133974-1-haozhe.chang@mediatek.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 23 Nov 2022 22:36:20 +0100
Message-ID: <CAMZdPi_1tRDTVtfjfKXcwx==Bg-ieDSnB5nj2E9LbkKEtxv++g@mail.gmail.com>
Subject: Re: [PATCH v4] wwan: core: Support slicing in port TX flow of WWAN subsystem
To:     haozhe.chang@mediatek.com
Cc:     M Chetan Kumar <m.chetan.kumar@intel.com>,
        Intel Corporation <linuxwwan@intel.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
        Liu Haijun <haijun.liu@mediatek.com>,
        Ricardo Martinez <ricardo.martinez@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Oliver Neukum <oneukum@suse.com>,
        Shang XiaoJing <shangxiaojing@huawei.com>,
        "open list:INTEL WWAN IOSM DRIVER" <netdev@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:REMOTE PROCESSOR MESSAGING (RPMSG) WWAN CONTROL..." 
        <linux-remoteproc@vger.kernel.org>,
        "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, lambert.wang@mediatek.com,
        xiayu.zhang@mediatek.com, hua.yang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 22 Nov 2022 at 09:25, <haozhe.chang@mediatek.com> wrote:
>
> From: haozhe chang <haozhe.chang@mediatek.com>
>
> wwan_port_fops_write inputs the SKB parameter to the TX callback of
> the WWAN device driver. However, the WWAN device (e.g., t7xx) may
> have an MTU less than the size of SKB, causing the TX buffer to be
> sliced and copied once more in the WWAN device driver.
>
> This patch implements the slicing in the WWAN subsystem and gives
> the WWAN devices driver the option to slice(by frag_len) or not. By
> doing so, the additional memory copy is reduced.
>
> Meanwhile, this patch gives WWAN devices driver the option to reserve
> headroom in fragments for the device-specific metadata.
>
> Signed-off-by: haozhe chang <haozhe.chang@mediatek.com>
>
> ---
> Changes in v2
>   -send fragments to device driver by skb frag_list.
>
> Changes in v3
>   -move frag_len and headroom_len setting to wwan_create_port.
>
> Changes in v4
>   -change unreadable parameters to macro definition.
> ---
>  drivers/net/wwan/iosm/iosm_ipc_port.c  |  3 +-
>  drivers/net/wwan/mhi_wwan_ctrl.c       |  3 +-
>  drivers/net/wwan/rpmsg_wwan_ctrl.c     |  3 +-
>  drivers/net/wwan/t7xx/t7xx_port_wwan.c | 34 +++++++--------
>  drivers/net/wwan/wwan_core.c           | 59 ++++++++++++++++++++------
>  drivers/net/wwan/wwan_hwsim.c          |  1 +
>  drivers/usb/class/cdc-wdm.c            |  3 +-
>  include/linux/wwan.h                   | 15 +++++++
>  8 files changed, 86 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/net/wwan/iosm/iosm_ipc_port.c b/drivers/net/wwan/iosm/iosm_ipc_port.c
> index b6d81c627277..7798348f61d0 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_port.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_port.c
> @@ -63,7 +63,8 @@ struct iosm_cdev *ipc_port_init(struct iosm_imem *ipc_imem,
>         ipc_port->ipc_imem = ipc_imem;
>
>         ipc_port->iosm_port = wwan_create_port(ipc_port->dev, port_type,
> -                                              &ipc_wwan_ctrl_ops, ipc_port);
> +                                              &ipc_wwan_ctrl_ops, WWAN_NO_FRAGMENT,
> +                                              WWAN_NO_HEADROOM, ipc_port);
>
>         return ipc_port;
>  }
> diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan_ctrl.c
> index f7ca52353f40..c397aa53db5d 100644
> --- a/drivers/net/wwan/mhi_wwan_ctrl.c
> +++ b/drivers/net/wwan/mhi_wwan_ctrl.c
> @@ -237,7 +237,8 @@ static int mhi_wwan_ctrl_probe(struct mhi_device *mhi_dev,
>
>         /* Register as a wwan port, id->driver_data contains wwan port type */
>         port = wwan_create_port(&cntrl->mhi_dev->dev, id->driver_data,
> -                               &wwan_pops, mhiwwan);
> +                               &wwan_pops, WWAN_NO_FRAGMENT, WWAN_NO_HEADROOM,
> +                               mhiwwan);
>         if (IS_ERR(port)) {
>                 kfree(mhiwwan);
>                 return PTR_ERR(port);
> diff --git a/drivers/net/wwan/rpmsg_wwan_ctrl.c b/drivers/net/wwan/rpmsg_wwan_ctrl.c
> index 31c24420ab2e..fc6c228b7e1c 100644
> --- a/drivers/net/wwan/rpmsg_wwan_ctrl.c
> +++ b/drivers/net/wwan/rpmsg_wwan_ctrl.c
> @@ -129,7 +129,8 @@ static int rpmsg_wwan_ctrl_probe(struct rpmsg_device *rpdev)
>
>         /* Register as a wwan port, id.driver_data contains wwan port type */
>         port = wwan_create_port(parent, rpdev->id.driver_data,
> -                               &rpmsg_wwan_pops, rpwwan);
> +                               &rpmsg_wwan_pops, WWAN_NO_FRAGMENT,
> +                               WWAN_NO_HEADROOM, rpwwan);
>         if (IS_ERR(port))
>                 return PTR_ERR(port);
>
> diff --git a/drivers/net/wwan/t7xx/t7xx_port_wwan.c b/drivers/net/wwan/t7xx/t7xx_port_wwan.c
> index 33931bfd78fd..b75bb272f861 100644
> --- a/drivers/net/wwan/t7xx/t7xx_port_wwan.c
> +++ b/drivers/net/wwan/t7xx/t7xx_port_wwan.c
> @@ -54,13 +54,13 @@ static void t7xx_port_ctrl_stop(struct wwan_port *port)
>  static int t7xx_port_ctrl_tx(struct wwan_port *port, struct sk_buff *skb)
>  {
>         struct t7xx_port *port_private = wwan_port_get_drvdata(port);
> -       size_t len, offset, chunk_len = 0, txq_mtu = CLDMA_MTU;
>         const struct t7xx_port_conf *port_conf;
> +       struct sk_buff *cur = skb, *cloned;
>         struct t7xx_fsm_ctl *ctl;
>         enum md_state md_state;
> +       int cnt = 0, ret;
>
> -       len = skb->len;
> -       if (!len || !port_private->chan_enable)
> +       if (!port_private->chan_enable)
>                 return -EINVAL;
>
>         port_conf = port_private->port_conf;
> @@ -72,23 +72,21 @@ static int t7xx_port_ctrl_tx(struct wwan_port *port, struct sk_buff *skb)
>                 return -ENODEV;
>         }
>
> -       for (offset = 0; offset < len; offset += chunk_len) {
> -               struct sk_buff *skb_ccci;
> -               int ret;
> -
> -               chunk_len = min(len - offset, txq_mtu - sizeof(struct ccci_header));
> -               skb_ccci = t7xx_port_alloc_skb(chunk_len);
> -               if (!skb_ccci)
> -                       return -ENOMEM;
> -
> -               skb_put_data(skb_ccci, skb->data + offset, chunk_len);
> -               ret = t7xx_port_send_skb(port_private, skb_ccci, 0, 0);
> +       while (cur) {
> +               cloned = skb_clone(cur, GFP_KERNEL);
> +               cloned->len = skb_headlen(cur);
> +               ret = t7xx_port_send_skb(port_private, cloned, 0, 0);
>                 if (ret) {
> -                       dev_kfree_skb_any(skb_ccci);
> +                       dev_kfree_skb(cloned);
>                         dev_err(port_private->dev, "Write error on %s port, %d\n",
>                                 port_conf->name, ret);
> -                       return ret;
> +                       return cnt ? cnt + ret : ret;
>                 }
> +               cnt += cur->len;
> +               if (cur == skb)
> +                       cur = skb_shinfo(skb)->frag_list;
> +               else
> +                       cur = cur->next;
>         }
>
>         dev_kfree_skb(skb);
> @@ -154,13 +152,15 @@ static int t7xx_port_wwan_disable_chl(struct t7xx_port *port)
>  static void t7xx_port_wwan_md_state_notify(struct t7xx_port *port, unsigned int state)
>  {
>         const struct t7xx_port_conf *port_conf = port->port_conf;
> +       unsigned int header_len = sizeof(struct ccci_header);
>
>         if (state != MD_STATE_READY)
>                 return;
>
>         if (!port->wwan_port) {
>                 port->wwan_port = wwan_create_port(port->dev, port_conf->port_type,
> -                                                  &wwan_ops, port);
> +                                                  &wwan_ops, CLDMA_MTU - header_len,
> +                                                  header_len, port);
>                 if (IS_ERR(port->wwan_port))
>                         dev_err(port->dev, "Unable to create WWWAN port %s", port_conf->name);
>         }
> diff --git a/drivers/net/wwan/wwan_core.c b/drivers/net/wwan/wwan_core.c
> index 62e9f7d6c9fe..8d35513bcd4c 100644
> --- a/drivers/net/wwan/wwan_core.c
> +++ b/drivers/net/wwan/wwan_core.c
> @@ -67,6 +67,8 @@ struct wwan_device {
>   * @rxq: Buffer inbound queue
>   * @waitqueue: The waitqueue for port fops (read/write/poll)
>   * @data_lock: Port specific data access serialization
> + * @headroom_len: SKB reserved headroom size
> + * @frag_len: Length to fragment packet
>   * @at_data: AT port specific data
>   */
>  struct wwan_port {
> @@ -79,6 +81,8 @@ struct wwan_port {
>         struct sk_buff_head rxq;
>         wait_queue_head_t waitqueue;
>         struct mutex data_lock; /* Port specific data access serialization */
> +       size_t headroom_len;
> +       size_t frag_len;
>         union {
>                 struct {
>                         struct ktermios termios;
> @@ -422,6 +426,8 @@ static int __wwan_port_dev_assign_name(struct wwan_port *port, const char *fmt)
>  struct wwan_port *wwan_create_port(struct device *parent,
>                                    enum wwan_port_type type,
>                                    const struct wwan_port_ops *ops,
> +                                  size_t frag_len,
> +                                  unsigned int headroom_len,
>                                    void *drvdata)
>  {
>         struct wwan_device *wwandev;
> @@ -455,6 +461,8 @@ struct wwan_port *wwan_create_port(struct device *parent,
>
>         port->type = type;
>         port->ops = ops;
> +       port->frag_len = frag_len ? frag_len : SIZE_MAX;
> +       port->headroom_len = headroom_len;
>         mutex_init(&port->ops_lock);
>         skb_queue_head_init(&port->rxq);
>         init_waitqueue_head(&port->waitqueue);
> @@ -698,30 +706,53 @@ static ssize_t wwan_port_fops_read(struct file *filp, char __user *buf,
>  static ssize_t wwan_port_fops_write(struct file *filp, const char __user *buf,
>                                     size_t count, loff_t *offp)
>  {
> +       struct sk_buff *skb, *head = NULL, *tail = NULL;
>         struct wwan_port *port = filp->private_data;
> -       struct sk_buff *skb;
> +       size_t frag_len, remain = count;
>         int ret;
>
>         ret = wwan_wait_tx(port, !!(filp->f_flags & O_NONBLOCK));
>         if (ret)
>                 return ret;
>
> -       skb = alloc_skb(count, GFP_KERNEL);
> -       if (!skb)
> -               return -ENOMEM;
> +       do {
> +               frag_len = min(remain, port->frag_len);
> +               skb = alloc_skb(frag_len + port->headroom_len, GFP_KERNEL);
> +               if (!skb) {
> +                       ret = -ENOMEM;
> +                       goto freeskb;
> +               }
> +               skb_reserve(skb, port->headroom_len);
> +
> +               if (!head) {
> +                       head = skb;
> +               } else if (!tail) {
> +                       skb_shinfo(head)->frag_list = skb;
> +                       tail = skb;
> +               } else {
> +                       tail->next = skb;
> +                       tail = skb;
> +               }
>
> -       if (copy_from_user(skb_put(skb, count), buf, count)) {
> -               kfree_skb(skb);
> -               return -EFAULT;
> -       }
> +               if (copy_from_user(skb_put(skb, frag_len), buf + count - remain, frag_len)) {
> +                       ret = -EFAULT;
> +                       goto freeskb;
> +               }
>
> -       ret = wwan_port_op_tx(port, skb, !!(filp->f_flags & O_NONBLOCK));
> -       if (ret) {
> -               kfree_skb(skb);
> -               return ret;
> -       }
> +               if (skb != head) {
> +                       head->data_len += skb->len;
> +                       head->len += skb->len;
> +                       head->truesize += skb->truesize;
> +               }
> +       } while (remain -= frag_len);
> +
> +       ret = wwan_port_op_tx(port, head, !!(filp->f_flags & O_NONBLOCK));
> +       if (!ret)
> +               return count;
>
> -       return count;
> +freeskb:
> +       kfree_skb(head);
> +       return ret;
>  }
>
>  static __poll_t wwan_port_fops_poll(struct file *filp, poll_table *wait)
> diff --git a/drivers/net/wwan/wwan_hwsim.c b/drivers/net/wwan/wwan_hwsim.c
> index ff09a8cedf93..7fb54cb51628 100644
> --- a/drivers/net/wwan/wwan_hwsim.c
> +++ b/drivers/net/wwan/wwan_hwsim.c
> @@ -205,6 +205,7 @@ static struct wwan_hwsim_port *wwan_hwsim_port_new(struct wwan_hwsim_dev *dev)
>
>         port->wwan = wwan_create_port(&dev->dev, WWAN_PORT_AT,
>                                       &wwan_hwsim_port_ops,
> +                                     WWAN_NO_FRAGMENT, WWAN_NO_HEADROOM,
>                                       port);
>         if (IS_ERR(port->wwan)) {
>                 err = PTR_ERR(port->wwan);
> diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
> index 1f0951be15ab..e0f0bc878bbd 100644
> --- a/drivers/usb/class/cdc-wdm.c
> +++ b/drivers/usb/class/cdc-wdm.c
> @@ -929,7 +929,8 @@ static void wdm_wwan_init(struct wdm_device *desc)
>                 return;
>         }
>
> -       port = wwan_create_port(&intf->dev, desc->wwanp_type, &wdm_wwan_port_ops, desc);
> +       port = wwan_create_port(&intf->dev, desc->wwanp_type, &wdm_wwan_port_ops,
> +                               WWAN_NO_FRAGMENT, WWAN_NO_HEADROOM, desc);
>         if (IS_ERR(port)) {
>                 dev_err(&intf->dev, "%s: Unable to create WWAN port\n",
>                         dev_name(intf->usb_dev));
> diff --git a/include/linux/wwan.h b/include/linux/wwan.h
> index 5ce2acf444fb..37f25ebb9733 100644
> --- a/include/linux/wwan.h
> +++ b/include/linux/wwan.h
> @@ -62,11 +62,24 @@ struct wwan_port_ops {
>                             poll_table *wait);
>  };
>
> +/*
> + * Used to indicate that the WWAN core should not fragment tx packages.
> + */
> +#define WWAN_NO_FRAGMENT       0
> +
> +/*
> + * Used to indicate that the WWAN core should not reserve headroom in SKB.
> + */
> +#define WWAN_NO_HEADROOM       0

It could be a bit misleading here; these values are only used as
'control ports' parameters, and not for the 'regular' WWAN network
payload. Make this more clear in the above comments/def-names.

Regards,
Loic





> +
>  /**
>   * wwan_create_port - Add a new WWAN port
>   * @parent: Device to use as parent and shared by all WWAN ports
>   * @type: WWAN port type
>   * @ops: WWAN port operations
> + * @frag_len: TX fragments length, if 0 is set,
> + *            the WWAN core don't fragment the user package.
> + * @headroom_len: TX fragments reserved headroom length
>   * @drvdata: Pointer to caller driver data
>   *
>   * Allocate and register a new WWAN port. The port will be automatically exposed
> @@ -84,6 +97,8 @@ struct wwan_port_ops {
>  struct wwan_port *wwan_create_port(struct device *parent,
>                                    enum wwan_port_type type,
>                                    const struct wwan_port_ops *ops,
> +                                  size_t frag_len,
> +                                  unsigned int headroom_len,
>                                    void *drvdata);
>
>  /**
> --
> 2.17.0
>
