Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7F68C9AB2
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 11:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729235AbfJCJZX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Oct 2019 05:25:23 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:56890 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729133AbfJCJZX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Oct 2019 05:25:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570094721;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wJTm8qjekjGG4PrnF39LqJE2BWesr9XqmlyPrS5rEd0=;
        b=UevZiprx+FZWQpj7lN9Y9rXJLdIo3OD9qNkGJ7KlE0UCB8mN7Jj48AGjS5+sm+NcYM9cm+
        ODWFy0FhPA3wlEk2ChQD3gn0r55VUgH7CopIqjRwn+byH6+qrmD4O97LT5eCjVG6r+EN7R
        caYoHZQcQezsFeREjFFxVc++s0juDUY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-S_mC1arhMRmu_l6RmC-p_Q-1; Thu, 03 Oct 2019 05:25:19 -0400
Received: by mail-ed1-f72.google.com with SMTP id y66so1209884ede.16
        for <linux-usb@vger.kernel.org>; Thu, 03 Oct 2019 02:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cspO/1Bz1DeOPFHQg8Glup0zEPBRBEmpHq6m1779G1Y=;
        b=b/4AgOoDSBE5z9FRLhlMELk3ZLsC5KXXrfCNLw2lFYzILWLjg8aLpbLDB7VrWE8T01
         zVEwtQ05FI9m8+e6FX5cYYJyiNaLWkQIcpLlSnYVPfONFmuBfYAZxu5bl62hEzODUPGA
         lOtILGQ4h4/EEI58Wo7GYOpbrKogrRpPp3ukMk4pnkAiM83swfMbIRrslvK+rZBAeqVR
         TFiJsoPmPKKYOG5TwrhqlN/ylPEs0pJ8pxZb5osomZn7NoYfVBg59yz4ae8KH+oaTg7I
         HTZPlB8hKEzQ08bitJ8Yp0X9icaL80NIxOhArRjc5XCA2VX5OnXt5zkLvzsUptGJ9tqk
         NnXA==
X-Gm-Message-State: APjAAAUzsSXCNCzu05D/AEiyTQq+ja+U8YcnsToyR4CMI3dg+pgnIRD3
        z89MPKUG6kpgFTGs3Asa8X+qCPTyJDXELmucjxVGiPYTOFISk0YxxRcvAXQTXkzahrF4YH1mSK2
        LKFhFWHltiR5rLWbcx+qB
X-Received: by 2002:a17:906:4a11:: with SMTP id w17mr6603196eju.21.1570094718204;
        Thu, 03 Oct 2019 02:25:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyF0XjeBA/u82PuUYlN7Lwy0E1mH4R9bAy0WzuLvek8alGmoNwjlnGXS9ppktVor4dlw7Szcw==
X-Received: by 2002:a17:906:4a11:: with SMTP id w17mr6603171eju.21.1570094717966;
        Thu, 03 Oct 2019 02:25:17 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id 36sm366170edz.92.2019.10.03.02.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2019 02:25:17 -0700 (PDT)
Subject: Re: [RFC][PATCH 2/3] usb: roles: Add usb role switch notifier.
To:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>
Cc:     Yu Chen <chenyu56@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
References: <20191002231617.3670-1-john.stultz@linaro.org>
 <20191002231617.3670-3-john.stultz@linaro.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2e369349-41f6-bd15-2829-fa886f209b39@redhat.com>
Date:   Thu, 3 Oct 2019 11:25:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191002231617.3670-3-john.stultz@linaro.org>
Content-Language: en-US
X-MC-Unique: S_mC1arhMRmu_l6RmC-p_Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi John,

On 03-10-2019 01:16, John Stultz wrote:
> From: Yu Chen <chenyu56@huawei.com>
>=20
> This patch adds notifier for drivers want to be informed of the usb role
> switch.

I do not see any patches in this series actually using this new
notifier.

Maybe it is best to drop this patch until we actually have in-kernel
users of this new API show up ?

Regards,

Hans


>=20
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Cc: Yu Chen <chenyu56@huawei.com>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: Jun Li <lijun.kernel@gmail.com>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: linux-usb@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Yu Chen <chenyu56@huawei.com>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>   drivers/usb/roles/class.c | 35 ++++++++++++++++++++++++++++++++++-
>   include/linux/usb/role.h  | 16 ++++++++++++++++
>   2 files changed, 50 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> index 94b4e7db2b94..418e762d5d72 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -20,6 +20,7 @@ struct usb_role_switch {
>   =09struct device dev;
>   =09struct mutex lock; /* device lock*/
>   =09enum usb_role role;
> +=09struct blocking_notifier_head nh;
>  =20
>   =09/* From descriptor */
>   =09struct device *usb2_port;
> @@ -49,8 +50,10 @@ int usb_role_switch_set_role(struct usb_role_switch *s=
w, enum usb_role role)
>   =09mutex_lock(&sw->lock);
>  =20
>   =09ret =3D sw->set(sw->dev.parent, role);
> -=09if (!ret)
> +=09if (!ret) {
>   =09=09sw->role =3D role;
> +=09=09blocking_notifier_call_chain(&sw->nh, role, NULL);
> +=09}
>  =20
>   =09mutex_unlock(&sw->lock);
>  =20
> @@ -58,6 +61,35 @@ int usb_role_switch_set_role(struct usb_role_switch *s=
w, enum usb_role role)
>   }
>   EXPORT_SYMBOL_GPL(usb_role_switch_set_role);
>  =20
> +int usb_role_switch_register_notifier(struct usb_role_switch *sw,
> +=09=09=09=09      struct notifier_block *nb)
> +{
> +=09int ret =3D blocking_notifier_chain_register(&sw->nh, nb);
> +=09enum usb_role role;
> +
> +=09if (ret)
> +=09=09return ret;
> +
> +=09/* Initialize the notifier that was just registered */
> +=09mutex_lock(&sw->lock);
> +=09if (sw->get)
> +=09=09role =3D sw->get(sw->dev.parent);
> +=09else
> +=09=09role =3D sw->role;
> +=09blocking_notifier_call_chain(&sw->nh, role, NULL);
> +=09mutex_unlock(&sw->lock);
> +
> +=09return 0;
> +}
> +EXPORT_SYMBOL_GPL(usb_role_switch_register_notifier);
> +
> +int usb_role_switch_unregister_notifier(struct usb_role_switch *sw,
> +=09=09=09=09=09struct notifier_block *nb)
> +{
> +=09return blocking_notifier_chain_unregister(&sw->nh, nb);
> +}
> +EXPORT_SYMBOL_GPL(usb_role_switch_unregister_notifier);
> +
>   /**
>    * usb_role_switch_get_role - Get the USB role for a switch
>    * @sw: USB role switch
> @@ -296,6 +328,7 @@ usb_role_switch_register(struct device *parent,
>   =09=09return ERR_PTR(-ENOMEM);
>  =20
>   =09mutex_init(&sw->lock);
> +=09BLOCKING_INIT_NOTIFIER_HEAD(&sw->nh);
>  =20
>   =09sw->allow_userspace_control =3D desc->allow_userspace_control;
>   =09sw->usb2_port =3D desc->usb2_port;
> diff --git a/include/linux/usb/role.h b/include/linux/usb/role.h
> index 2d77f97df72d..8dbf7940b7da 100644
> --- a/include/linux/usb/role.h
> +++ b/include/linux/usb/role.h
> @@ -54,6 +54,10 @@ struct usb_role_switch *
>   usb_role_switch_register(struct device *parent,
>   =09=09=09 const struct usb_role_switch_desc *desc);
>   void usb_role_switch_unregister(struct usb_role_switch *sw);
> +int usb_role_switch_register_notifier(struct usb_role_switch *sw,
> +=09=09=09=09      struct notifier_block *nb);
> +int usb_role_switch_unregister_notifier(struct usb_role_switch *sw,
> +=09=09=09=09=09struct notifier_block *nb);
>   #else
>   static inline int usb_role_switch_set_role(struct usb_role_switch *sw,
>   =09=09enum usb_role role)
> @@ -87,6 +91,18 @@ usb_role_switch_register(struct device *parent,
>   }
>  =20
>   static inline void usb_role_switch_unregister(struct usb_role_switch *s=
w) { }
> +
> +static int usb_role_switch_register_notifier(struct usb_role_switch *sw,
> +=09=09=09=09=09     struct notifier_block *nb)
> +{
> +=09return -ENODEV;
> +}
> +
> +static int usb_role_switch_unregister_notifier(struct usb_role_switch *s=
w,
> +=09=09=09=09=09       struct notifier_block *nb)
> +{
> +=09return -ENODEV;
> +}
>   #endif
>  =20
>   #endif /* __LINUX_USB_ROLE_H */
>=20

