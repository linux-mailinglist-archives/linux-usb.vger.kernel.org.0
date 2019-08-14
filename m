Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A73948C75E
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2019 04:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729071AbfHNCXK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Aug 2019 22:23:10 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:49010 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729402AbfHNCR2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Aug 2019 22:17:28 -0400
X-UUID: 7e9b24d5eba7454fb16cf7e62e168035-20190814
X-UUID: 7e9b24d5eba7454fb16cf7e62e168035-20190814
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1520065974; Wed, 14 Aug 2019 10:17:17 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 14 Aug
 2019 10:17:16 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 14 Aug 2019 10:17:15 +0800
Message-ID: <1565749034.7317.6.camel@mhfsdcap03>
Subject: Re: [PATCH] usb: typec: fusb302: Call fusb302_debugfs_init earlier
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>, <linux-usb@vger.kernel.org>
Date:   Wed, 14 Aug 2019 10:17:14 +0800
In-Reply-To: <20190813105216.GD4691@kuha.fi.intel.com>
References: <20190813101524.80673-1-hdegoede@redhat.com>
         <20190813105216.GD4691@kuha.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: C0FF6637EE612D25A2E6319B23D1D5B7CAEC3F6C1561D584136B6593BD3ADAD42000:8
X-MTK:  N
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2019-08-13 at 13:52 +0300, Heikki Krogerus wrote:
> Hi Hans,
> 
> On Tue, Aug 13, 2019 at 12:15:24PM +0200, Hans de Goede wrote:
> > tcpm_register_port() will call some of the fusb302 code's callbacks
> > wich in turn will call fusb302_log(). So we need to call
> > fusb302_debugfs_init() before we call tcpm_register_port().
<...>
> > 
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> >  drivers/usb/typec/tcpm/fusb302.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> > index ccfc7e91e7a3..04c76b9d0065 100644
> > --- a/drivers/usb/typec/tcpm/fusb302.c
> > +++ b/drivers/usb/typec/tcpm/fusb302.c
> > @@ -1759,6 +1759,7 @@ static int fusb302_probe(struct i2c_client *client,
> >  	INIT_WORK(&chip->irq_work, fusb302_irq_work);
> >  	INIT_DELAYED_WORK(&chip->bc_lvl_handler, fusb302_bc_lvl_handler_work);
> >  	init_tcpc_dev(&chip->tcpc_dev);
> > +	fusb302_debugfs_init(chip);
> >  
> >  	if (client->irq) {
> >  		chip->gpio_int_n_irq = client->irq;
> > @@ -1784,7 +1785,6 @@ static int fusb302_probe(struct i2c_client *client,
> >  		goto tcpm_unregister_port;
> >  	}
> >  	enable_irq_wake(chip->gpio_int_n_irq);
> > -	fusb302_debugfs_init(chip);
> >  	i2c_set_clientdata(client, chip);
> 
> That leaves the rootdir variable pointing to something again for
> example if a failure happens (like -EPROBE_AGAIN) during probe (the
> "fusb302" directory is removed, but the rootdir static variable still
> points to something).
> 
> Let's just create that rootdir directory during driver init. I don't
> really understand why should we only create it when/if the first
> instance of fusb302 is registered. I think something like this would
> work:
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index c524088246ee..7a950a6e5f0d 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -212,9 +212,6 @@ static struct dentry *rootdir;
>  static void fusb302_debugfs_init(struct fusb302_chip *chip)
>  {
>         mutex_init(&chip->logbuffer_lock);
> -       if (!rootdir)
> -               rootdir = debugfs_create_dir("fusb302", NULL);
> -
>         chip->dentry = debugfs_create_file(dev_name(chip->dev),
>                                            S_IFREG | 0444, rootdir,
>                                            chip, &fusb302_debug_fops);
> @@ -223,7 +220,6 @@ static void fusb302_debugfs_init(struct fusb302_chip *chip)
>  static void fusb302_debugfs_exit(struct fusb302_chip *chip)
>  {
>         debugfs_remove(chip->dentry);
> -       debugfs_remove(rootdir);
>  }
>  
>  #else
> @@ -1863,7 +1859,24 @@ static struct i2c_driver fusb302_driver = {
>         .remove = fusb302_remove,
>         .id_table = fusb302_i2c_device_id,
>  };
> -module_i2c_driver(fusb302_driver);
> +
> +static int __init fusb302_init(void)
> +{
> +       rootdir = debugfs_create_dir("fusb302", NULL);
> +       if (IS_ERR(rootdir))
> +               return PTR_ERR(rootdir);
This doesn't support multi-instance?

> +
> +       return i2c_add_driver(&fusb302_driver);
> +}
> +
> +static void __exit fusb302_exit(void)
> +{
> +       i2c_del_driver(&fusb302_driver);
> +       debugfs_remove(rootdir);
> +}
> +
> +module_init(fusb302_init);
> +module_exit(fusb302_exit);
>  
>  MODULE_AUTHOR("Yueyao Zhu <yueyao.zhu@gmail.com>");
>  MODULE_DESCRIPTION("Fairchild FUSB302 Type-C Chip Driver");
> 
> 
> If it's OK, could you include that into this patch?
> 
> thanks,
> 


