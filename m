Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7838EC05
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 14:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731422AbfHOMyp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 08:54:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:40484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731873AbfHOMyo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Aug 2019 08:54:44 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5435D206C1;
        Thu, 15 Aug 2019 12:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565873683;
        bh=iq6cZLfUblvlcRTPag+v+Ha/84avgncn2W0y6wqfXUI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=swHphStd17ZxU2Hd/SeqLfpLU79qhWhcI2wXFsHDF7NSzXRtNe1DXno2Gp424+/p6
         n+Rc9jhGRE1Dx8/cNrMoX0WjYAJ838D3RtvU8rZzOKD2W9/rcOKjCsh0tlILhg+6xz
         ss5huONKC87A0JhuxJO7aZlAup9R6ioX4ws/27bs=
Date:   Thu, 15 Aug 2019 14:54:41 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: fusb302: Call fusb302_debugfs_init earlier
Message-ID: <20190815125441.GB24270@kroah.com>
References: <20190813101524.80673-1-hdegoede@redhat.com>
 <20190813105216.GD4691@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190813105216.GD4691@kuha.fi.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 13, 2019 at 01:52:16PM +0300, Heikki Krogerus wrote:
> Hi Hans,
>=20
> On Tue, Aug 13, 2019 at 12:15:24PM +0200, Hans de Goede wrote:
> > tcpm_register_port() will call some of the fusb302 code's callbacks
> > wich in turn will call fusb302_log(). So we need to call
> > fusb302_debugfs_init() before we call tcpm_register_port().
> >=20
> > This fixes the following warning, which was caused by the logbuffer_lock
> > not yet being initialized (which is done by fusb302_debugfs_init):
> >=20
> >  DEBUG_LOCKS_WARN_ON(lock->magic !=3D lock)
> >  WARNING: CPU: 0 PID: 1306 at kernel/locking/mutex.c:912 __mutex_lock+0=
x978/0x9a0
> >  Modules linked in: fusb302(+) tcpm pi3usb30532 typec bq24190_charger s=
nd_soc_sst_cht_bsw_rt5645 mei_hdcp dwc3 intel_rapl_msr udc_core ulpi gpio_k=
eys intel_powerclamp coretemp kvm_intel brcmfmac kvm brcmutil joydev cfg802=
11 wdat_wdt irqbypass pcspkr intel_cstate extcon_intel_cht_wc i2c_cht_wc(E)=
 snd_intel_sst_acpi snd_intel_sst_core snd_soc_rt5645 snd_soc_sst_atom_hifi=
2_platform snd_soc_acpi_intel_match snd_soc_rl6231 snd_soc_acpi intel_xhci_=
usb_role_switch roles hci_uart snd_soc_core btqca mei_txe btrtl processor_t=
hermal_device mei snd_hdmi_lpe_audio lpc_ich snd_compress btbcm intel_rapl_=
common ac97_bus dwc3_pci snd_pcm_dmaengine intel_soc_dts_iosf btintel snd_s=
eq bluetooth snd_seq_device snd_pcm intel_cht_int33fe_musb snd_timer intel_=
cht_int33fe_typec intel_hid intel_cht_int33fe_common sparse_keymap snd ecdh=
_generic goodix rfkill soundcore ecc spi_pxa2xx_platform max17042_battery d=
w_dmac int3406_thermal dptf_power acpi_pad soc_button_array int3400_thermal=
 int3403_thermal
> >   gpd_pocket_fan intel_int0002_vgpio int340x_thermal_zone acpi_thermal_=
rel dm_crypt mmc_block i915 crct10dif_pclmul crc32_pclmul crc32c_intel ghas=
h_clmulni_intel i2c_algo_bit drm_kms_helper drm video sdhci_acpi sdhci mmc_=
core pwm_lpss_platform pwm_lpss i2c_dev
> >  CPU: 0 PID: 1306 Comm: systemd-udevd Tainted: G            E     5.3.0=
-rc4+ #83
> >  Hardware name: Default string Default string/Default string, BIOS 5.11=
 06/28/2017
> >  RIP: 0010:__mutex_lock+0x978/0x9a0
> >  Code: c0 0f 84 26 f7 ff ff 44 8b 05 24 25 c8 00 45 85 c0 0f 85 16 f7 f=
f ff 48 c7 c6 da 55 2f ae 48 c7 c7 98 8c 2d ae e8 a0 f9 5c ff <0f> 0b e9 fc=
 f6 ff ff 4c 89 f0 4d 89 fe 49 89 c7 e9 cf fa ff ff e8
> >  RSP: 0018:ffffb7a8c0523800 EFLAGS: 00010286
> >  RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> >  RDX: 0000000000000002 RSI: 0000000000000001 RDI: 0000000000000246
> >  RBP: ffffb7a8c05238c0 R08: 0000000000000000 R09: 0000000000000000
> >  R10: ffffb7a8c0523648 R11: 0000000000000030 R12: 0000000000000000
> >  R13: ffffb7a8c0523990 R14: ffff9bf22f70c028 R15: ffff9bf22f70c360
> >  FS:  00007f39ca234940(0000) GS:ffff9bf237400000(0000) knlGS:0000000000=
000000
> >  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >  CR2: 00007f1f108481a0 CR3: 0000000271f28000 CR4: 00000000001006f0
> >  Call Trace:
> >   ? find_held_lock+0x39/0x90
> >   ? _fusb302_log+0x81/0x1d0 [fusb302]
> >   ? vsnprintf+0x3aa/0x4f0
> >   ? _fusb302_log+0x81/0x1d0 [fusb302]
> >   _fusb302_log+0x81/0x1d0 [fusb302]
> >  ...
> >=20
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> >  drivers/usb/typec/tcpm/fusb302.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/=
fusb302.c
> > index ccfc7e91e7a3..04c76b9d0065 100644
> > --- a/drivers/usb/typec/tcpm/fusb302.c
> > +++ b/drivers/usb/typec/tcpm/fusb302.c
> > @@ -1759,6 +1759,7 @@ static int fusb302_probe(struct i2c_client *clien=
t,
> >  	INIT_WORK(&chip->irq_work, fusb302_irq_work);
> >  	INIT_DELAYED_WORK(&chip->bc_lvl_handler, fusb302_bc_lvl_handler_work);
> >  	init_tcpc_dev(&chip->tcpc_dev);
> > +	fusb302_debugfs_init(chip);
> > =20
> >  	if (client->irq) {
> >  		chip->gpio_int_n_irq =3D client->irq;
> > @@ -1784,7 +1785,6 @@ static int fusb302_probe(struct i2c_client *clien=
t,
> >  		goto tcpm_unregister_port;
> >  	}
> >  	enable_irq_wake(chip->gpio_int_n_irq);
> > -	fusb302_debugfs_init(chip);
> >  	i2c_set_clientdata(client, chip);
>=20
> That leaves the rootdir variable pointing to something again for
> example if a failure happens (like -EPROBE_AGAIN) during probe (the
> "fusb302" directory is removed, but the rootdir static variable still
> points to something).
>=20
> Let's just create that rootdir directory during driver init. I don't
> really understand why should we only create it when/if the first
> instance of fusb302 is registered. I think something like this would
> work:
>=20
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fu=
sb302.c
> index c524088246ee..7a950a6e5f0d 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -212,9 +212,6 @@ static struct dentry *rootdir;
>  static void fusb302_debugfs_init(struct fusb302_chip *chip)
>  {
>         mutex_init(&chip->logbuffer_lock);
> -       if (!rootdir)
> -               rootdir =3D debugfs_create_dir("fusb302", NULL);
> -
>         chip->dentry =3D debugfs_create_file(dev_name(chip->dev),
>                                            S_IFREG | 0444, rootdir,
>                                            chip, &fusb302_debug_fops);
> @@ -223,7 +220,6 @@ static void fusb302_debugfs_init(struct fusb302_chip =
*chip)
>  static void fusb302_debugfs_exit(struct fusb302_chip *chip)
>  {
>         debugfs_remove(chip->dentry);
> -       debugfs_remove(rootdir);
>  }
> =20
>  #else
> @@ -1863,7 +1859,24 @@ static struct i2c_driver fusb302_driver =3D {
>         .remove =3D fusb302_remove,
>         .id_table =3D fusb302_i2c_device_id,
>  };
> -module_i2c_driver(fusb302_driver);
> +
> +static int __init fusb302_init(void)
> +{
> +       rootdir =3D debugfs_create_dir("fusb302", NULL);
> +       if (IS_ERR(rootdir))
> +               return PTR_ERR(rootdir);

As Guenter points out, don't check this, just call it anb move on.

But are you _SURE_ you want this to be the name, at the root of debugfs?
Why not put it under the usb debugfs directory?

thanks,

greg k-h
