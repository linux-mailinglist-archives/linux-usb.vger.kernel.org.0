Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2108CD06
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2019 09:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727229AbfHNHhf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Aug 2019 03:37:35 -0400
Received: from mga07.intel.com ([134.134.136.100]:8951 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726373AbfHNHhf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 14 Aug 2019 03:37:35 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Aug 2019 00:37:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,384,1559545200"; 
   d="scan'208";a="194442084"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 14 Aug 2019 00:37:31 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 14 Aug 2019 10:37:30 +0300
Date:   Wed, 14 Aug 2019 10:37:30 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: fusb302: Call fusb302_debugfs_init earlier
Message-ID: <20190814073730.GA4140@kuha.fi.intel.com>
References: <20190813101524.80673-1-hdegoede@redhat.com>
 <20190813105216.GD4691@kuha.fi.intel.com>
 <1565749034.7317.6.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565749034.7317.6.camel@mhfsdcap03>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 14, 2019 at 10:17:14AM +0800, Chunfeng Yun wrote:
> On Tue, 2019-08-13 at 13:52 +0300, Heikki Krogerus wrote:
> > Hi Hans,
> > 
> > On Tue, Aug 13, 2019 at 12:15:24PM +0200, Hans de Goede wrote:
> > > tcpm_register_port() will call some of the fusb302 code's callbacks
> > > wich in turn will call fusb302_log(). So we need to call
> > > fusb302_debugfs_init() before we call tcpm_register_port().
> <...>
> > > 
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > ---
> > >  drivers/usb/typec/tcpm/fusb302.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> > > index ccfc7e91e7a3..04c76b9d0065 100644
> > > --- a/drivers/usb/typec/tcpm/fusb302.c
> > > +++ b/drivers/usb/typec/tcpm/fusb302.c
> > > @@ -1759,6 +1759,7 @@ static int fusb302_probe(struct i2c_client *client,
> > >  	INIT_WORK(&chip->irq_work, fusb302_irq_work);
> > >  	INIT_DELAYED_WORK(&chip->bc_lvl_handler, fusb302_bc_lvl_handler_work);
> > >  	init_tcpc_dev(&chip->tcpc_dev);
> > > +	fusb302_debugfs_init(chip);
> > >  
> > >  	if (client->irq) {
> > >  		chip->gpio_int_n_irq = client->irq;
> > > @@ -1784,7 +1785,6 @@ static int fusb302_probe(struct i2c_client *client,
> > >  		goto tcpm_unregister_port;
> > >  	}
> > >  	enable_irq_wake(chip->gpio_int_n_irq);
> > > -	fusb302_debugfs_init(chip);
> > >  	i2c_set_clientdata(client, chip);
> > 
> > That leaves the rootdir variable pointing to something again for
> > example if a failure happens (like -EPROBE_AGAIN) during probe (the
> > "fusb302" directory is removed, but the rootdir static variable still
> > points to something).
> > 
> > Let's just create that rootdir directory during driver init. I don't
> > really understand why should we only create it when/if the first
> > instance of fusb302 is registered. I think something like this would
> > work:
> > 
> > diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> > index c524088246ee..7a950a6e5f0d 100644
> > --- a/drivers/usb/typec/tcpm/fusb302.c
> > +++ b/drivers/usb/typec/tcpm/fusb302.c
> > @@ -212,9 +212,6 @@ static struct dentry *rootdir;
> >  static void fusb302_debugfs_init(struct fusb302_chip *chip)
> >  {
> >         mutex_init(&chip->logbuffer_lock);
> > -       if (!rootdir)
> > -               rootdir = debugfs_create_dir("fusb302", NULL);
> > -
> >         chip->dentry = debugfs_create_file(dev_name(chip->dev),
> >                                            S_IFREG | 0444, rootdir,
> >                                            chip, &fusb302_debug_fops);
> > @@ -223,7 +220,6 @@ static void fusb302_debugfs_init(struct fusb302_chip *chip)
> >  static void fusb302_debugfs_exit(struct fusb302_chip *chip)
> >  {
> >         debugfs_remove(chip->dentry);
> > -       debugfs_remove(rootdir);
> >  }
> >  
> >  #else
> > @@ -1863,7 +1859,24 @@ static struct i2c_driver fusb302_driver = {
> >         .remove = fusb302_remove,
> >         .id_table = fusb302_i2c_device_id,
> >  };
> > -module_i2c_driver(fusb302_driver);
> > +
> > +static int __init fusb302_init(void)
> > +{
> > +       rootdir = debugfs_create_dir("fusb302", NULL);
> > +       if (IS_ERR(rootdir))
> > +               return PTR_ERR(rootdir);
> This doesn't support multi-instance?

Yes it does. That only creates the root directory "fusb302". For every
instance of fusb302 on the system that is registered and probed by the
driver, you will still have a separate file added to that directory,
just like before.

The only difference is that now we don't wait for the first instance
of fusb302 to be registered before we create that "fusb302" directory.
Instead, the directory is simply created the moment the driver is
loaded. On a system that does not have fusb302 controllers, the
directory will now stay empty, but that is not a problem.


thanks,

-- 
heikki
