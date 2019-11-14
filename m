Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD53AFCC0F
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2019 18:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbfKNRob (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Nov 2019 12:44:31 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39249 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725976AbfKNRob (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Nov 2019 12:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573753469;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mElC2wMWvpZ/ebCnHCi+azeZiEHn3eN8az1ylqCemTk=;
        b=YU2rT5KxEqAoJDKaXCGhRJYGIZCiZwlRALQLX1zIEDj9qVAvFlm6FdedUPzRhbppsPhEAb
        C44BkPBwIoFufVhS7l1xXkRJDhG3S+x+ds6SXdFlanmp0OGtXOrGgDSYZVcrENEgye7zbT
        jfcI244ElPiDkIOm8WktcY0UW5v8c9w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-23hJsFRUPt2tbpfgeW0fVA-1; Thu, 14 Nov 2019 12:44:28 -0500
Received: by mail-wr1-f72.google.com with SMTP id q12so4875271wrr.3
        for <linux-usb@vger.kernel.org>; Thu, 14 Nov 2019 09:44:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pGpx6ApOBqN/9ZwcFfhaznrATPIvDpbhKiXPORI3lUk=;
        b=tGxDE9eQiZ80ADu7kdgSShrGuk5zFUM9vwD4kqnDKLyIv09PdWvBRin0i9+MEHCSp8
         9qYez5l0YqXZM3ESvpt39vwypGkny4+iOE9aHIv8oS+d+tX+L0SU2xCUByAeqxgU8FEs
         WrodtdspS0+BNRh4qdMihsfiUQ1k5gGN6JnhhWy/xPEZlbD9waiSyn96tqJRilZ/IU8H
         KD7Ot9GqZZZiJQvq+WvsbTLAuAEPVRm1w4Myzm8A9YxCOf1gXGtPHxdNDg/ejcJilFSB
         MPDOSdu5/GWqbOHqzJI/MHyzUovdPlTlFh/UC0x2f2tYvD0k+1SGTJY3oEx2J/6GHKUJ
         z00Q==
X-Gm-Message-State: APjAAAUecW4K3shw5X9cIUZbBXVxDdF+6PLguvBCIKqUMwyM4nrNvg/L
        67xuERt5frm94rvrWVA2Mzjq1RRNoHQndMP1zQ1/6bk3cUYaTChD3Fy0O8p0JM8+SXfeZCpadGJ
        PEdZoYKeBxnuf5yi5MgpK
X-Received: by 2002:a5d:5092:: with SMTP id a18mr8620650wrt.297.1573753466345;
        Thu, 14 Nov 2019 09:44:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqzkYx3m1oMO/b5OMWmiaBE14JLETLAQqmlDvtr3w1IO8ru+d4LtpgyJbdnruB4lHt47Hxnw7w==
X-Received: by 2002:a5d:5092:: with SMTP id a18mr8620628wrt.297.1573753466051;
        Thu, 14 Nov 2019 09:44:26 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id u16sm8358858wrr.65.2019.11.14.09.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2019 09:44:25 -0800 (PST)
Subject: Re: [PATCH resend] usb: typec: tcpm: Remove tcpc_config configuration
 mechanism
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
References: <20191114111840.40876-1-hdegoede@redhat.com>
 <20191114173738.GA29006@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <15340d44-f116-19d9-2d56-1246235536d8@redhat.com>
Date:   Thu, 14 Nov 2019 18:44:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191114173738.GA29006@roeck-us.net>
Content-Language: en-US
X-MC-Unique: 23hJsFRUPt2tbpfgeW0fVA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 14-11-2019 18:37, Guenter Roeck wrote:
> On Thu, Nov 14, 2019 at 12:18:40PM +0100, Hans de Goede wrote:
>> All configuration can and should be done through fwnodes instead of
>> through the tcpc_config struct and there are no existing users left of
>> struct tcpc_config, so lets remove it.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>=20
> This is an exact match with
> https://lore.kernel.org/linux-usb/20191018195719.94634-1-hdegoede@redhat.=
com/
> as far as I can see. Any readon for dropping my Reviewed-by: tag ?
> Just wondering.

Yes you are right this is an exact match as I mentioned in the discussion o=
f
"[PATCH 2/3] usb: typec: tcpm: Add support for configuring DP altmode throu=
gh device-properties"
the purpose of this resend is to get this patch merged as a
standalone patch as it is a standalone patch which happens to be
be a pre-req of the rest of the series. But since the rest needs
more work, it seems like a good idea to get this one upstream
by itself first.

No reason, I did not much drop it, as that I forgot to add it to my
local branch, which is why it is missing from the resend, sorry.

Regards,

Hans



>> ---
>>   drivers/usb/typec/tcpm/tcpm.c | 90 ++---------------------------------
>>   include/linux/usb/tcpm.h      | 41 ----------------
>>   2 files changed, 3 insertions(+), 128 deletions(-)
>>
>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm=
.c
>> index 5f61d9977a15..c5fa18759f8e 100644
>> --- a/drivers/usb/typec/tcpm/tcpm.c
>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>> @@ -380,9 +380,6 @@ static enum tcpm_state tcpm_default_state(struct tcp=
m_port *port)
>>   =09=09=09return SNK_UNATTACHED;
>>   =09=09else if (port->try_role =3D=3D TYPEC_SOURCE)
>>   =09=09=09return SRC_UNATTACHED;
>> -=09=09else if (port->tcpc->config &&
>> -=09=09=09 port->tcpc->config->default_role =3D=3D TYPEC_SINK)
>> -=09=09=09return SNK_UNATTACHED;
>>   =09=09/* Fall through to return SRC_UNATTACHED */
>>   =09} else if (port->port_type =3D=3D TYPEC_PORT_SNK) {
>>   =09=09return SNK_UNATTACHED;
>> @@ -4131,7 +4128,7 @@ static int tcpm_try_role(const struct typec_capabi=
lity *cap, int role)
>>   =09mutex_lock(&port->lock);
>>   =09if (tcpc->try_role)
>>   =09=09ret =3D tcpc->try_role(tcpc, role);
>> -=09if (!ret && (!tcpc->config || !tcpc->config->try_role_hw))
>> +=09if (!ret)
>>   =09=09port->try_role =3D role;
>>   =09port->try_src_count =3D 0;
>>   =09port->try_snk_count =3D 0;
>> @@ -4368,34 +4365,6 @@ void tcpm_tcpc_reset(struct tcpm_port *port)
>>   }
>>   EXPORT_SYMBOL_GPL(tcpm_tcpc_reset);
>>  =20
>> -static int tcpm_copy_pdos(u32 *dest_pdo, const u32 *src_pdo,
>> -=09=09=09  unsigned int nr_pdo)
>> -{
>> -=09unsigned int i;
>> -
>> -=09if (nr_pdo > PDO_MAX_OBJECTS)
>> -=09=09nr_pdo =3D PDO_MAX_OBJECTS;
>> -
>> -=09for (i =3D 0; i < nr_pdo; i++)
>> -=09=09dest_pdo[i] =3D src_pdo[i];
>> -
>> -=09return nr_pdo;
>> -}
>> -
>> -static int tcpm_copy_vdos(u32 *dest_vdo, const u32 *src_vdo,
>> -=09=09=09  unsigned int nr_vdo)
>> -{
>> -=09unsigned int i;
>> -
>> -=09if (nr_vdo > VDO_MAX_OBJECTS)
>> -=09=09nr_vdo =3D VDO_MAX_OBJECTS;
>> -
>> -=09for (i =3D 0; i < nr_vdo; i++)
>> -=09=09dest_vdo[i] =3D src_vdo[i];
>> -
>> -=09return nr_vdo;
>> -}
>> -
>>   static int tcpm_fw_get_caps(struct tcpm_port *port,
>>   =09=09=09    struct fwnode_handle *fwnode)
>>   {
>> @@ -4698,35 +4667,10 @@ static int devm_tcpm_psy_register(struct tcpm_po=
rt *port)
>>   =09return PTR_ERR_OR_ZERO(port->psy);
>>   }
>>  =20
>> -static int tcpm_copy_caps(struct tcpm_port *port,
>> -=09=09=09  const struct tcpc_config *tcfg)
>> -{
>> -=09if (tcpm_validate_caps(port, tcfg->src_pdo, tcfg->nr_src_pdo) ||
>> -=09    tcpm_validate_caps(port, tcfg->snk_pdo, tcfg->nr_snk_pdo))
>> -=09=09return -EINVAL;
>> -
>> -=09port->nr_src_pdo =3D tcpm_copy_pdos(port->src_pdo, tcfg->src_pdo,
>> -=09=09=09=09=09  tcfg->nr_src_pdo);
>> -=09port->nr_snk_pdo =3D tcpm_copy_pdos(port->snk_pdo, tcfg->snk_pdo,
>> -=09=09=09=09=09  tcfg->nr_snk_pdo);
>> -
>> -=09port->nr_snk_vdo =3D tcpm_copy_vdos(port->snk_vdo, tcfg->snk_vdo,
>> -=09=09=09=09=09  tcfg->nr_snk_vdo);
>> -
>> -=09port->operating_snk_mw =3D tcfg->operating_snk_mw;
>> -
>> -=09port->typec_caps.prefer_role =3D tcfg->default_role;
>> -=09port->typec_caps.type =3D tcfg->type;
>> -=09port->typec_caps.data =3D tcfg->data;
>> -=09port->self_powered =3D tcfg->self_powered;
>> -
>> -=09return 0;
>> -}
>> -
>>   struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_d=
ev *tcpc)
>>   {
>>   =09struct tcpm_port *port;
>> -=09int i, err;
>> +=09int err;
>>  =20
>>   =09if (!dev || !tcpc ||
>>   =09    !tcpc->get_vbus || !tcpc->set_cc || !tcpc->get_cc ||
>> @@ -4759,15 +4703,10 @@ struct tcpm_port *tcpm_register_port(struct devi=
ce *dev, struct tcpc_dev *tcpc)
>>   =09tcpm_debugfs_init(port);
>>  =20
>>   =09err =3D tcpm_fw_get_caps(port, tcpc->fwnode);
>> -=09if ((err < 0) && tcpc->config)
>> -=09=09err =3D tcpm_copy_caps(port, tcpc->config);
>>   =09if (err < 0)
>>   =09=09goto out_destroy_wq;
>>  =20
>> -=09if (!tcpc->config || !tcpc->config->try_role_hw)
>> -=09=09port->try_role =3D port->typec_caps.prefer_role;
>> -=09else
>> -=09=09port->try_role =3D TYPEC_NO_PREFERRED_ROLE;
>> +=09port->try_role =3D port->typec_caps.prefer_role;
>>  =20
>>   =09port->typec_caps.fwnode =3D tcpc->fwnode;
>>   =09port->typec_caps.revision =3D 0x0120;=09/* Type-C spec release 1.2 =
*/
>> @@ -4797,29 +4736,6 @@ struct tcpm_port *tcpm_register_port(struct devic=
e *dev, struct tcpc_dev *tcpc)
>>   =09=09goto out_role_sw_put;
>>   =09}
>>  =20
>> -=09if (tcpc->config && tcpc->config->alt_modes) {
>> -=09=09const struct typec_altmode_desc *paltmode =3D tcpc->config->alt_m=
odes;
>> -
>> -=09=09i =3D 0;
>> -=09=09while (paltmode->svid && i < ARRAY_SIZE(port->port_altmode)) {
>> -=09=09=09struct typec_altmode *alt;
>> -
>> -=09=09=09alt =3D typec_port_register_altmode(port->typec_port,
>> -=09=09=09=09=09=09=09  paltmode);
>> -=09=09=09if (IS_ERR(alt)) {
>> -=09=09=09=09tcpm_log(port,
>> -=09=09=09=09=09 "%s: failed to register port alternate mode 0x%x",
>> -=09=09=09=09=09 dev_name(dev), paltmode->svid);
>> -=09=09=09=09break;
>> -=09=09=09}
>> -=09=09=09typec_altmode_set_drvdata(alt, port);
>> -=09=09=09alt->ops =3D &tcpm_altmode_ops;
>> -=09=09=09port->port_altmode[i] =3D alt;
>> -=09=09=09i++;
>> -=09=09=09paltmode++;
>> -=09=09}
>> -=09}
>> -
>>   =09mutex_lock(&port->lock);
>>   =09tcpm_init(port);
>>   =09mutex_unlock(&port->lock);
>> diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
>> index f516955a0cf4..e7979c01c351 100644
>> --- a/include/linux/usb/tcpm.h
>> +++ b/include/linux/usb/tcpm.h
>> @@ -46,45 +46,6 @@ enum tcpm_transmit_type {
>>   =09TCPC_TX_BIST_MODE_2 =3D 7
>>   };
>>  =20
>> -/**
>> - * struct tcpc_config - Port configuration
>> - * @src_pdo:=09PDO parameters sent to port partner as response to
>> - *=09=09PD_CTRL_GET_SOURCE_CAP message
>> - * @nr_src_pdo:=09Number of entries in @src_pdo
>> - * @snk_pdo:=09PDO parameters sent to partner as response to
>> - *=09=09PD_CTRL_GET_SINK_CAP message
>> - * @nr_snk_pdo:=09Number of entries in @snk_pdo
>> - * @operating_snk_mw:
>> - *=09=09Required operating sink power in mW
>> - * @type:=09Port type (TYPEC_PORT_DFP, TYPEC_PORT_UFP, or
>> - *=09=09TYPEC_PORT_DRP)
>> - * @default_role:
>> - *=09=09Default port role (TYPEC_SINK or TYPEC_SOURCE).
>> - *=09=09Set to TYPEC_NO_PREFERRED_ROLE if no default role.
>> - * @try_role_hw:True if try.{Src,Snk} is implemented in hardware
>> - * @alt_modes:=09List of supported alternate modes
>> - */
>> -struct tcpc_config {
>> -=09const u32 *src_pdo;
>> -=09unsigned int nr_src_pdo;
>> -
>> -=09const u32 *snk_pdo;
>> -=09unsigned int nr_snk_pdo;
>> -
>> -=09const u32 *snk_vdo;
>> -=09unsigned int nr_snk_vdo;
>> -
>> -=09unsigned int operating_snk_mw;
>> -
>> -=09enum typec_port_type type;
>> -=09enum typec_port_data data;
>> -=09enum typec_role default_role;
>> -=09bool try_role_hw;=09/* try.{src,snk} implemented in hardware */
>> -=09bool self_powered;=09/* port belongs to a self powered device */
>> -
>> -=09const struct typec_altmode_desc *alt_modes;
>> -};
>> -
>>   /* Mux state attributes */
>>   #define TCPC_MUX_USB_ENABLED=09=09BIT(0)=09/* USB enabled */
>>   #define TCPC_MUX_DP_ENABLED=09=09BIT(1)=09/* DP enabled */
>> @@ -92,7 +53,6 @@ struct tcpc_config {
>>  =20
>>   /**
>>    * struct tcpc_dev - Port configuration and callback functions
>> - * @config:=09Pointer to port configuration
>>    * @fwnode:=09Pointer to port fwnode
>>    * @get_vbus:=09Called to read current VBUS state
>>    * @get_current_limit:
>> @@ -121,7 +81,6 @@ struct tcpc_config {
>>    * @mux:=09Pointer to multiplexer data
>>    */
>>   struct tcpc_dev {
>> -=09const struct tcpc_config *config;
>>   =09struct fwnode_handle *fwnode;
>>  =20
>>   =09int (*init)(struct tcpc_dev *dev);
>> --=20
>> 2.23.0
>>
>=20

