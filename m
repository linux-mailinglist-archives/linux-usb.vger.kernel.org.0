Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 883D495CB0
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 12:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729371AbfHTK4C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Aug 2019 06:56:02 -0400
Received: from canardo.mork.no ([148.122.252.1]:35603 "EHLO canardo.mork.no"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728842AbfHTK4C (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Aug 2019 06:56:02 -0400
X-Greylist: delayed 672 seconds by postgrey-1.27 at vger.kernel.org; Tue, 20 Aug 2019 06:56:01 EDT
Received: from miraculix.mork.no ([IPv6:2a02:2121:301:f490:2886:93ff:fe90:318c])
        (authenticated bits=0)
        by canardo.mork.no (8.15.2/8.15.2) with ESMTPSA id x7KAiK4W027402
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Tue, 20 Aug 2019 12:44:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1566297861; bh=PKHoQYdYJSlHKWqXKdhNXaNoLYkSuGseQ9wWCdHkZjQ=;
        h=From:To:Cc:Subject:References:Date:Message-ID:From;
        b=BeOpmh6ut4WWkb+ZU6qulgDH5ux9A2boHUvsS2V50kT11I49sMoBAzeq4XQOIlNQS
         xZBih+zxxKAkD5X2Nzb7v+fCeTieBXuZJwJZtvkNgRchy9l7Z7vG3tNvu2fLdhco5c
         QBmQFSzISIl5TkXQqBbLFzXnInMCg9ZXb1Kr/Zss=
Received: from bjorn by miraculix.mork.no with local (Exim 4.92)
        (envelope-from <bjorn@mork.no>)
        id 1i01ci-00084b-J1; Tue, 20 Aug 2019 12:44:20 +0200
From:   =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     syzbot <syzbot+d232cca6ec42c2edb3fc@syzkaller.appspotmail.com>,
        gustavo@embeddedor.com, andreyknvl@google.com,
        syzkaller-bugs@googlegroups.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re: WARNING in wdm_write/usb_submit_urb
Organization: m
References: <000000000000719222059081d6f2@google.com>
        <1566297095.11678.11.camel@suse.com>
Date:   Tue, 20 Aug 2019 12:44:20 +0200
In-Reply-To: <1566297095.11678.11.camel@suse.com> (Oliver Neukum's message of
        "Tue, 20 Aug 2019 12:31:35 +0200")
Message-ID: <87sgpw5d6j.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.101.2 at canardo
X-Virus-Status: Clean
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Oliver Neukum <oneukum@suse.com> writes:

> diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
> index 1656f5155ab8..a341081a5f47 100644
> --- a/drivers/usb/class/cdc-wdm.c
> +++ b/drivers/usb/class/cdc-wdm.c
> @@ -588,14 +588,24 @@ static int wdm_flush(struct file *file, fl_owner_t =
id)
>  {
>  	struct wdm_device *desc =3D file->private_data;
>=20=20
> -	wait_event(desc->wait, !test_bit(WDM_IN_USE, &desc->flags));
> +	wait_event(desc->wait,
> +			/*
> +			 * needs both flags. We cannot do with one
> +			 * because resetting it would cause a race
> +			 * with write() yet we need to signal
> +			 * a disconnect
> +			 */
> +			!test_bit(WDM_IN_USE, &desc->flags) &&
> +			!test_bit(WDM_DISCONNECTING, &desc->flags));


Makes sense.  But isn't the WDM_DISCONNECTING test inverted?

>  	/* cannot dereference desc->intf if WDM_DISCONNECTING */
>  	if (desc->werr < 0 && !test_bit(WDM_DISCONNECTING, &desc->flags))
>  		dev_err(&desc->intf->dev, "Error in flush path: %d\n",
>  			desc->werr);
>=20=20
> -	return usb_translate_errors(desc->werr);
> +	return test_bit(WDM_DISCONNECTING, &desc->flags) ?=20
> +			-ENODEV :=20
> +			usb_translate_errors(desc->werr);
>  }

Minor detail, but there's an awful lot of test_bit(WDM_DISCONNECTING)
here.  How about

  if (test_bit(WDM_DISCONNECTING, &desc->flags))
    return -ENODEV;
  if (desc->werr < 0)
    dev_err(&desc->intf->dev, "Error in flush path: %d\n", desc->werr);
  return usb_translate_errors(desc->werr);



>  static __poll_t wdm_poll(struct file *file, struct poll_table_struct *wa=
it)
> @@ -975,8 +985,6 @@ static void wdm_disconnect(struct usb_interface *intf)
>  	spin_lock_irqsave(&desc->iuspin, flags);
>  	set_bit(WDM_DISCONNECTING, &desc->flags);
>  	set_bit(WDM_READ, &desc->flags);
> -	/* to terminate pending flushes */
> -	clear_bit(WDM_IN_USE, &desc->flags);
>  	spin_unlock_irqrestore(&desc->iuspin, flags);
>  	wake_up_all(&desc->wait);
>  	mutex_lock(&desc->rlock);


Yes, this looks much better.=20


Bj=C3=B8rn
