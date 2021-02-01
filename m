Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D58330A1D7
	for <lists+linux-usb@lfdr.de>; Mon,  1 Feb 2021 07:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231752AbhBAGFP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 01:05:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231792AbhBAGBA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Feb 2021 01:01:00 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 672B1C06174A
        for <linux-usb@vger.kernel.org>; Sun, 31 Jan 2021 22:00:20 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id r77so15179300qka.12
        for <linux-usb@vger.kernel.org>; Sun, 31 Jan 2021 22:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gww9ka74u4kvqObGYvnFu8233+bsNdvejBWZvAY2OVk=;
        b=SMSTTSFo3W4aFKjztck/kug4TrYzVMCYewfsVTp80GF4qyGb9t47aJ1MnmDg2QGezN
         qf1Ckv0SxOseL7AnGW9UrfWsLIInME9T0nI/1l9GipMUIkgmnZY52CjiAqbL13/+NulD
         8nxeIQHDCJ1dwrjpmJ2wjzoxJKXY48AOFSaSIyGQ2gVtrf4YS82x8whNjrNq80bEfWpZ
         3O5MKetMAgCj6Oup5gQK/cyUZqvCqkqq5L+vUBasRAZkRRfBWGzGN9g8orukuzF07hcf
         AmGCJ4JbXsAsCDl4DkyQf1IEgJGbpTBH0MMKP3ir5Ln+Q1HuiibuGasE0VMWUSRCet7d
         L4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gww9ka74u4kvqObGYvnFu8233+bsNdvejBWZvAY2OVk=;
        b=tFhlNrEuosVZO5R/8MKtH798ksNh5YxK2ZWbsjvV/OBxIwPG8DJymuvhNUViTFmeke
         QeXY0IHqAoehh8tMIyi/9atizuLdmkurxmRhnaDOqSaAU/TTcLKKvzXo7gW44NcMLNbI
         AmzeirdnxZGr8bJ6vW3IyxjL3B1OmfilBTfAeXWxHYAkPcw8rK18iJHdP6aINbs2S3aM
         zsdjVwYFjwO+2nSIWoYyjsNxiNhsmqLNtjdyk/2RApWTrkcD10+b/qM9hCmo8+0ay1nu
         ErosfE35NkCGK+S2qVlnDkzP3uIZA3t/PUwMaMBCO9k1gB8tb1lgUBFkR69+FshnWR/j
         Tl1Q==
X-Gm-Message-State: AOAM530YPZ+l1G3FHyD2P+bDnALzGzeDXLDoUUPhOst+JVx65jU25Xg9
        neIxQcpdYgRqu6/iXGUBQ7e/9/1HYF72lntvwvnvlQ==
X-Google-Smtp-Source: ABdhPJw9tFahQET678D6nIg2wA5kAwzyhktFWiBuuAl6OA5T+sax5vsdIdzr+CoceWE770pe376rCA1DZVovhRQTg4c=
X-Received: by 2002:a37:cd5:: with SMTP id 204mr14265264qkm.410.1612159219027;
 Sun, 31 Jan 2021 22:00:19 -0800 (PST)
MIME-Version: 1.0
References: <20210131151832.215931-1-kyletso@google.com> <20210131151832.215931-2-kyletso@google.com>
 <8737f4b9-0202-aaf8-f461-93e82624ef0d@roeck-us.net>
In-Reply-To: <8737f4b9-0202-aaf8-f461-93e82624ef0d@roeck-us.net>
From:   Kyle Tso <kyletso@google.com>
Date:   Mon, 1 Feb 2021 14:00:02 +0800
Message-ID: <CAGZ6i=0VxkrDFSnUythLziVpRGK9DF96ihAOnCwWtE5TQ8So2g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: typec: Determine common SVDM Versions
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 1, 2021 at 12:21 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 1/31/21 7:18 AM, Kyle Tso wrote:
> > Changes since v1:
> > - removed the "local" variables (svdm_version) in tcpm.c and
> >   (altmodes/ucsi)/displayport.c
> > - added a member "svdm_version" in struct typec_capabilities indicating
> >   the default SVDM version of the port
> > - added a member "common_svdm_ver" in struct typec_port indicating the
> >   common SVDM version between the port and the partner
>
> I personally find the "common" in the variable and function names unnecessary.
> I would prefer using something like svdm_version instead of common_svdm_ver.
>
The reason for the common_ prefix is just for the readability.
That's totally fine with me to remove the prefix.
Will fix this in the next version.


> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > index 0afd8ef692e8..403a483645dd 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -1470,11 +1470,13 @@ static void tcpm_register_partner_altmodes(struct tcpm_port *port)
> >  }
> >
> >  #define supports_modal(port) PD_IDH_MODAL_SUPP((port)->partner_ident.id_header)
> > +#define common_svdm_ver(typec)       (typec_get_common_svdm_version(typec))
>
> I think that is unnecessary and confusing. We now have typec_get_common_svdm_version()
> as well as common_svdm_ver() and COMMON_SVDM_VER() macros. I would suggest to just use
> the function name (and maybe drop the 'common_' prefix from it).
>
will fix this in the next version.


> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > index ca3f4194ad90..b8d693cc7b77 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -764,6 +764,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
> >
> >       if (con->status.change & UCSI_CONSTAT_CONNECT_CHANGE) {
> >               typec_set_pwr_role(con->port, role);
> > +             typec_set_common_svdm_version(con->port, con->typec_cap.svdm_version);
> >
>
> I am a bit concerned that svdm_version is added to typec_capabilities but not
> consistently used by all drivers registering with typec. I am not sure I
> understand if and how the value in typec_capabilities is used by the typec core.
>
I am not sure about it as well :p
From my POV, that is just the same nature as the "pd_revision" is in
typec_capabilities which means the capabilities the port has
regardless of the port partners.
The port needs to reset the operating mode to it's designed SVDM
version upon detach. I think typec_capabilities is a good place to
store this information.
What do you think?

BTW, the reset value of the variable "negotiated_rev" in tcpm/tcpm.c
looks weird to me.
It is reset to "PD_MAX_REV" in SNK_STARTUP and SRC_STARTUP.
However, the tcpm.c might not always support the max revision of PD.
IMO, the pd_revision in typec_capabilities is a better choice compared
to PD_MAX_REV.

> > diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> > index 54475323f83b..df0cb1e595a1 100644
> > --- a/include/linux/usb/typec.h
> > +++ b/include/linux/usb/typec.h
> > @@ -206,12 +206,19 @@ struct typec_operations {
> >                            enum typec_port_type type);
> >  };
> >
> > +enum usb_pd_svdm_ver {
> > +     SVDM_VER_1_0 = 0,
> > +     SVDM_VER_2_0 = 1,
> > +     SVDM_VER_MAX = SVDM_VER_2_0,
> > +};
> > +
> >  /*
> >   * struct typec_capability - USB Type-C Port Capabilities
> >   * @type: Supported power role of the port
> >   * @data: Supported data role of the port
> >   * @revision: USB Type-C Specification release. Binary coded decimal
> >   * @pd_revision: USB Power Delivery Specification revision if supported
> > + * @svdm_version: USB PD Structured VDM version if supported
> >   * @prefer_role: Initial role preference (DRP ports).
> >   * @accessory: Supported Accessory Modes
> >   * @fwnode: Optional fwnode of the port
> > @@ -225,6 +232,7 @@ struct typec_capability {
> >       enum typec_port_data    data;
> >       u16                     revision; /* 0120H = "1.2" */
> >       u16                     pd_revision; /* 0300H = "3.0" */
> > +     enum usb_pd_svdm_ver    svdm_version;
> >       int                     prefer_role;
> >       enum typec_accessory    accessory[TYPEC_MAX_ACCESSORY];
> >       unsigned int            orientation_aware:1;
> > @@ -275,4 +283,6 @@ int typec_find_orientation(const char *name);
> >  int typec_find_port_power_role(const char *name);
> >  int typec_find_power_role(const char *name);
> >  int typec_find_port_data_role(const char *name);
> > +void typec_set_common_svdm_version(struct typec_port *port, enum usb_pd_svdm_ver);
> > +enum usb_pd_svdm_ver typec_get_common_svdm_version(struct typec_port *port);
> >  #endif /* __LINUX_USB_TYPEC_H */
> >
>

Thanks,
Kyle
