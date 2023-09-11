Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8EB579B6DD
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 02:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350417AbjIKViK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:38:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237240AbjIKMRM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 08:17:12 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D7ECCEB
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 05:17:07 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27D2C433CA;
        Mon, 11 Sep 2023 12:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694434626;
        bh=cp6gHIYpNXT6sU53jX7esw9WStY6pbDhAD+NoHu474o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R6jODca6XIiReLppXUVfNijVNcPboWbMIV6A7UYwQPX9g7zs8KIr1zKQF5nPRg4Yc
         QTPXys4XQ6htvQyCYmOcFJkaIh0EMaW7mje6Bc4KbiycCxoYVKdlX/HAVlxyl19/VK
         uGEfnaU27CR3z5faMonbZkhKxZGJDgKfh3Rqk11NcJoC26OyMSEDV++4P3f+qy9+tL
         VDzKCgsgRII7Ht5zxdTb678mHPN6IJ+9IbsJw5X5M12Ruw4Yhp583NIqKKkFSFJjc1
         dAtwB+VHxOb5RSUwMO2pyjJVMYMesMfSddUZSUFOy3nZu5MUkgLJoGadqro/QmUTB6
         xDNHQRyt3L3DQ==
Date:   Mon, 11 Sep 2023 20:16:59 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     "tomer.maimon@nuvoton.com" <tomer.maimon@nuvoton.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Advise for adding Nuvoton BMC Synopsys USB 2.0 device
 controllers to Linux kernel USB Chipidea driver
Message-ID: <20230911121659.GA1146957@nchen-desktop>
References: <TY0PR03MB627615C146DF1CCED0BCAA2C84EEA@TY0PR03MB6276.apcprd03.prod.outlook.com>
 <20230908102618.GA1134975@nchen-desktop>
 <TY0PR03MB62768499A37E53AEB9E1306284F3A@TY0PR03MB6276.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <TY0PR03MB62768499A37E53AEB9E1306284F3A@TY0PR03MB6276.apcprd03.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23-09-10 12:47:06, tomer.maimon@nuvoton.com wrote:
> Hi Peter,
>=20
>=20
>=20
> Thanks for your prompt response.
>=20
>=20
>=20
> Unfortunately soft connect didn't solve the problem, because the vbus_act=
ive is not active
>=20
> And this is why the ci_hdrc_gadget_connect<https://elixir.bootlin.com/lin=
ux/v6.5.2/C/ident/ci_hdrc_gadget_connect>(gadget<https://elixir.bootlin.com=
/linux/v6.5.2/C/ident/gadget>, 1) is not called.
>=20
> https://elixir.bootlin.com/linux/v6.5.2/source/drivers/usb/chipidea/udc.c=
#L1950
>=20

Please use plain text for upstream email.

So, for your soc, the usb role is device-only, and there is no otgsc
register. You may try to introduce a flag like
CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS, and using it at ci_handle_vbus_change
for (!ci->is_otg condition), when both conditions are satisfied, call=20
usb_gadget_vbus_connect(&ci->gadget);

Thanks,
Peter

>=20
>=20
> In the log below we added debug print of the vbus_active status:
>=20
> # insmod usb_f_mass_storage.ko
>=20
> # insmod g_mass_storage.ko file=3D/tmp/backing_file removable=3D1
>=20
> Mass Storage Function, version: 2009/09/11
>=20
> LUN: removable file: (no medium)
>=20
> LUN: removable file: /tmp/backing_file
>=20
> Number of LUNs=3D1
>=20
> g_mass_storage gadget: Mass Storage Gadget, version: 2009/09/11
>=20
> g_mass_storage gadget: userspace failed to provide iSerialNumber
>=20
> g_mass_storage gadget: g_mass_storage ready
>=20
>         usb_gadget_udc_start
>=20
> ci_udc_start
>=20
> ci_udc_start ci->vbus_active 0
>=20
> # cd /sys/class/udc/ci_hdrc.0/
>=20
> # echo connect > soft_connect
>=20
> udc ci_hdrc.0: UDC had already started
>=20
> # echo disconnect > soft_connect
>=20
> ci_udc_stop ci->vbus_active 0
>=20
> # echo connect > soft_connect
>=20
>         usb_gadget_udc_start
>=20
> ci_udc_start
>=20
> ci_udc_start ci->vbus_active 0
>=20
>=20
>=20
> How can I active the vbus_active parameter?
>=20
>=20
>=20
> Thanks,
>=20
>=20
>=20
> Tomer
>=20
>=20
>=20
> -----Original Message-----
> From: Peter Chen <peter.chen@kernel.org>
> Sent: Friday, 8 September 2023 13:26
> To: IS20 Tomer Maimon <tomer.maimon@nuvoton.com>
> Cc: linux-usb@vger.kernel.org
> Subject: Re: Advise for adding Nuvoton BMC Synopsys USB 2.0 device contro=
llers to Linux kernel USB Chipidea driver
>=20
>=20
>=20
> CAUTION - External Email: Do not click links or open attachments unless y=
ou acknowledge the sender and content.
>=20
>=20
>=20
>=20
>=20
> On 23-09-07 14:33:29, tomer.maimon@nuvoton.com<mailto:tomer.maimon@nuvoto=
n.com> wrote:
>=20
> > Hi Peter
>=20
> >
>=20
> > My name is Tomer I am working in Nuvoton system in the Linux kernel, ou=
r project developing BMC SoC for servers.
>=20
> > In Nuvoton BMC (NPCM) there are ten identical Synopsys USB 2.0 device c=
ontrollers called NPCM UDC.
>=20
> >
>=20
> > Lately we started to work with USB Chipidea driver to add NPCM UDC as w=
ell.
>=20
> > The NPCM BMC using only the UDC and not the USB host.
>=20
> >
>=20
> > Using the default compatible<https://apc01.safelinks.protection.outlook=
=2Ecom/?url=3Dhttps%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.15.130%2FC%2Fid=
ent%2Fcompatible&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C3cc95393cba4=
4903d9fa08dbb0561155%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C638297655=
985252717%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DPLwJbYcd%2Fs2F2x7yXL7wp3g=
4AxDJ8JyJIZ2TTBGFGWw%3D&reserved=3D0<https://elixir.bootlin.com/linux/v5.15=
=2E130/C/ident/compatible>> =3D "chipidea,usb2<https://apc01.safelinks.prot=
ection.outlook.com/?url=3Dhttps%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.15.=
130%2FB%2Fident%2Fchipidea%252Cusb2&data=3D05%7C01%7Ctomer.maimon%40nuvoton=
=2Ecom%7C3cc95393cba44903d9fa08dbb0561155%7Ca3f24931d4034b4a94f17d83ac638e0=
7%7C0%7C0%7C638297655985408934%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi=
LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DuZQe=
mtQLmMuVP8ifpczSYtHw2Z4drLLn%2Fm2ObnpJW0Q%3D&reserved=3D0<https://elixir.bo=
otlin.com/linux/v5.15.130/B/ident/chipidea%2Cusb2>>" didn't work for us sin=
ce:
>=20
> >
>=20
> > 1.       The USB_MODE should be set at boot or after reset since the re=
set The USB_MODE is incorrect (0x15002)
>=20
> >
>=20
> > [cid:image002.jpg@01D9E1B1.691030B0]
>=20
> >
>=20
> >
>=20
> > It solved by setting USB_MODE during NPCM reset
>=20
> > ci_hdrc_npcm_notify_event, now using unique npcm-udc compatible :)
>=20
> >
>=20
> >
>=20
> >
>=20
> > 2.      vbus_active parameter don't change, stay 0.
>=20
> >
>=20
> > The Device Control Capability Parameters Register (DCCPARAMS) is a
>=20
> > read only register that indicate the module is only DC (Device
>=20
> > Capable)
>=20
> >
>=20
> > This is why the driver didn't indicate the driver is OTG
>=20
> >
>=20
> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Feli=
x<https://elix/>
>=20
> > ir.bootlin.com%2Flinux%2Fv6.5.2%2Fsource%2Fdrivers%2Fusb%2Fchipidea%2F
>=20
> > core.c%23L948&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C3cc95393cba4
>=20
> > 4903d9fa08dbb0561155%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C6382
>=20
> > 97655985408934%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l
>=20
> > uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D%2B5yqPLl4FS
>=20
> > YUF2Wr0fnNEGgHETE7FTmmSxVm8HCAaQ4%3D&reserved=3D0
>=20
> >
>=20
> >
>=20
> > ci<https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fe
>=20
> > lixir.bootlin.com%2Flinux%2Fv6.5.2%2FC%2Fident%2Fci&data=3D05%7C01%7Ctom
>=20
> > er.maimon%40nuvoton.com%7C3cc95393cba44903d9fa08dbb0561155%7Ca3f24931d
>=20
> > 4034b4a94f17d83ac638e07%7C0%7C0%7C638297655985408934%7CUnknown%7CTWFpb
>=20
> > GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
>=20
> > %3D%7C3000%7C%7C%7C&sdata=3D0l4NnlxNNGGLe%2BEG%2FXU%2B2bdMB5R%2FY%2BD3Xv
>=20
> > ndUiAWUyE%3D&reserved=3D0>->is_otg<https://apc01.safelinks.protection.ou
>=20
> > tlook.com/?url=3Dhttps%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.5.2%2FC%2
>=20
> > Fident%2Fis_otg&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C3cc95393cb
>=20
> > a44903d9fa08dbb0561155%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C63
>=20
> > 8297655985408934%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV
>=20
> > 2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DrQIdSi2Uu%
>=20
> > 2Bss84SiVOlWQkdrPXPVgJvDqPheYtPcolM%3D&reserved=3D0> =3D
>=20
> > (hw_read<https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%
>=20
> > 2F%2Felixir.bootlin.com%2Flinux%2Fv6.5.2%2FC%2Fident%2Fhw_read&data=3D05
>=20
> > %7C01%7Ctomer.maimon%40nuvoton.com%7C3cc95393cba44903d9fa08dbb0561155%
>=20
> > 7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C638297655985408934%7CUnkn
>=20
> > own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi
>=20
> > LCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DHO%2F6v4XA2bQgU9jCrya2Y%2Fv8P5%2B
>=20
> > 3m%2Bn8ekJhtZLrq5A%3D&reserved=3D0>(ci<https://apc01.safelinks.protectio
>=20
> > n.outlook.com/?url=3Dhttps%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.5.2%2
>=20
> > FC%2Fident%2Fci&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C3cc95393cb
>=20
> > a44903d9fa08dbb0561155%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C63
>=20
> > 8297655985408934%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV
>=20
> > 2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D0l4NnlxNNG
>=20
> > GLe%2BEG%2FXU%2B2bdMB5R%2FY%2BD3XvndUiAWUyE%3D&reserved=3D0>,
>=20
> > CAP_DCCPARAMS<https://apc01.safelinks.protection.outlook.com/?url=3Dhttp
>=20
> > s%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.5.2%2FC%2Fident%2FCAP_DCCPAR
>=20
> > AMS&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C3cc95393cba44903d9fa08
>=20
> > dbb0561155%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C63829765598540
>=20
> > 8934%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT
>=20
> > iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DXmsVmw0t55YR0wcrcTngkN
>=20
> > 6vyBCj5sR5GYT2I8lIq2A%3D&reserved=3D0>,
>=20
> >
>=20
> >
>=20
> > DCCPARAMS_DC<https://apc01.safelinks.protection.outlook.com/?url=3Dhttps
>=20
> > %3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.5.2%2FC%2Fident%2FDCCPARAMS_D
>=20
> > C&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C3cc95393cba44903d9fa08db
>=20
> > b0561155%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C6382976559854089
>=20
> > 34%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI
>=20
> > 6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Do9trybo5aT%2BF%2Bai6eHeH
>=20
> > %2BeQTaY5l5Jzy53u8TlLg%2Fps%3D&reserved=3D0> |
>=20
> > DCCPARAMS_HC<https://apc01.safelinks.protection.outlook.com/?url=3Dhttps
>=20
> > %3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.5.2%2FC%2Fident%2FDCCPARAMS_H
>=20
> > C&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C3cc95393cba44903d9fa08db
>=20
> > b0561155%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C6382976559854089
>=20
> > 34%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI
>=20
> > 6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D5Zb%2BmrV2lcQwXlz93pJtzF
>=20
> > eRNBxqiHEgD4ywW1ed4D4%3D&reserved=3D0>)
>=20
> >
>=20
> >                                   =3D=3D
>=20
> > (DCCPARAMS_DC<https://apc01.safelinks.protection.outlook.com/?url=3Dhttp
>=20
> > s%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.5.2%2FC%2Fident%2FDCCPARAMS_
>=20
> > DC&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C3cc95393cba44903d9fa08d
>=20
> > bb0561155%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C638297655985408
>=20
> > 934%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi
>=20
> > I6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Do9trybo5aT%2BF%2Bai6eHe
>=20
> > H%2BeQTaY5l5Jzy53u8TlLg%2Fps%3D&reserved=3D0> |
>=20
> > DCCPARAMS_HC<https://apc01.safelinks.protection.outlook.com/?url=3Dhttps
>=20
> > %3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.5.2%2FC%2Fident%2FDCCPARAMS_H
>=20
> > C&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C3cc95393cba44903d9fa08db
>=20
> > b0561155%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C6382976559854089
>=20
> > 34%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI
>=20
> > 6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D5Zb%2BmrV2lcQwXlz93pJtzF
>=20
> > eRNBxqiHEgD4ywW1ed4D4%3D&reserved=3D0>));
>=20
> >
>=20
> > Why otg is set only when DC and HC is set?
>=20
> >
>=20
> > By enabling ci<https://apc01.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.5.2%2FC%2Fident%2Fci&data=3D05%=
7C01%7Ctomer.maimon%40nuvoton.com%7C3cc95393cba44903d9fa08dbb0561155%7Ca3f2=
4931d4034b4a94f17d83ac638e07%7C0%7C0%7C638297655985408934%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C3000%7C%7C%7C&sdata=3D0l4NnlxNNGGLe%2BEG%2FXU%2B2bdMB5R%2FY%2BD3XvndUiAWUy=
E%3D&reserved=3D0<https://elixir.bootlin.com/linux/v6.5.2/C/ident/ci>>->is_=
otg<https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Feli=
xir.bootlin.com%2Flinux%2Fv6.5.2%2FC%2Fident%2Fis_otg&data=3D05%7C01%7Ctome=
r.maimon%40nuvoton.com%7C3cc95393cba44903d9fa08dbb0561155%7Ca3f24931d4034b4=
a94f17d83ac638e07%7C0%7C0%7C638297655985408934%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C=
%7C&sdata=3DrQIdSi2Uu%2Bss84SiVOlWQkdrPXPVgJvDqPheYtPcolM%3D&reserved=3D0<h=
ttps://elixir.bootlin.com/linux/v6.5.2/C/ident/is_otg>> =3D true we see we =
need to set the extcon in the device tree, why we need extcon to handle the=
 vbus? Can the vbus be permanent?
>=20
> >
>=20
> >
>=20
> >
>=20
> > Even after setting extcon vbus to dummy GPIO we succeed to modify the v=
bus_active parameter to is_active but it didn't worked in the end because i=
t a dummy GPIO that not related to the USB vbus.
>=20
> >
>=20
> >
>=20
> >
>=20
> > BTW,
>=20
> >
>=20
> > If we adding ci->vbus_active =3D true at probe stage the UDC Chipidea d=
river works fine.
>=20
> >
>=20
> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Feli=
x<https://elix/>
>=20
> > ir.bootlin.com%2Flinux%2Fv6.5.2%2Fsource%2Fdrivers%2Fusb%2Fchipidea%2F
>=20
> > core.c%23L1123&data=3D05%7C01%7Ctomer.maimon%40nuvoton.com%7C3cc95393cba
>=20
> > 44903d9fa08dbb0561155%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C638
>=20
> > 297655985408934%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2
>=20
> > luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DO2JoKArqqY6
>=20
> > IaAvYAEFXrVhuPdsArba3MczPKSJsaIc%3D&reserved=3D0
>=20
> >
>=20
> >
>=20
> >
>=20
> > Appreciate if you could you advise how should we overcome this issue
>=20
>=20
>=20
> After loading the gadget driver, try to force "connect" udc using /sys en=
try. See the below code at file: drivers/usb/gadget/udc/core.c
>=20
>=20
>=20
> static ssize_t soft_connect_store(struct device *dev,
>=20
>                 struct device_attribute *attr, const char *buf, size_t n)
>=20
>=20
>=20
>=20
>=20
> Your issue is probably due to the UDC don't know it is connected, so DP i=
s not pulled up.
>=20
>=20
>=20
> --
>=20
>=20
>=20
> Thanks,
>=20
> Peter Chen
>=20
> ________________________________
> The privileged confidential information contained in this email is intend=
ed for use only by the addressees as indicated by the original sender of th=
is email. If you are not the addressee indicated in this email or are not r=
esponsible for delivery of the email to such a person, please kindly reply =
to the sender indicating this fact and delete all copies of it from your co=
mputer and network server immediately. Your cooperation is highly appreciat=
ed. It is advised that any unauthorized use of confidential information of =
Nuvoton is strictly prohibited; and any information in this email irrelevan=
t to the official business of Nuvoton shall be deemed as neither given nor =
endorsed by Nuvoton.

--=20

Thanks,
Peter Chen
