Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6BF295285
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 20:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504535AbgJUSzx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 14:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502103AbgJUSzx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Oct 2020 14:55:53 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DDC1C0613CE;
        Wed, 21 Oct 2020 11:55:52 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id 19so2010959pge.12;
        Wed, 21 Oct 2020 11:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WW7iWK1mlanA/nSOOT/laE4c8UqUVBDo2FGMaghCg/4=;
        b=sTEZBt9tGIOG/Nuun3tgfo/KUlyS1kyoB1q3nuPxu5T8yXpqY1G7JVrOepVlxBDtyo
         jovHngyGv27U7YjVzQMyxZ0E0DkN6uBI/i/3Pa5RtEZBKwXuUyNwXdhMGjfMtJT70rHZ
         rjES27oogFMBpIS934QfLJx46legarVobWfiV4YmwLxmKjFZJu/lklEntASLcPSr6X+R
         ZkW/k3gIDlq084Ue906EAZuga6z9O5VYpoYT1S14ecGa9guD9/758RYjeSJ3hrb7FQKm
         GfdiqxzE1hUBQZRrclvMhdFzecDPJyGIFsTnICcjxuYAsJfGljzv+xtOA6QqqBwY0iPF
         OW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WW7iWK1mlanA/nSOOT/laE4c8UqUVBDo2FGMaghCg/4=;
        b=ondik1d737WZCQEgbSjOwUhZcbN8dt5dwbZY1kfi6csbPj+oyM2rMAMDbInucpBVan
         462v2Na9IVDryyh27FlwMWBvrAbPlMGY3XYKswk/qcWiWz590N3MgSXRocbDXRiKAcFX
         x6vnm5FSjMA+o99kL/1jAI4r5UtdYh1z4MxRC7tRBlLtRHoftBROZlM1Q7Qh4oM1kQAJ
         J+5uU+ovhtgcxI4LtMsHOuNIbai0Zq1Q5KrQWEtFtz9bgc/OsyjlEvmGHylTs4ZtIcuS
         4BNBH+prYVSCgA0bx9ZVLm7tMYUibA6kJ00BLrQPl+0WlRgDxIH7YRHDmDJ/nQeMFau0
         +f7w==
X-Gm-Message-State: AOAM531+fs6VyKyscrZ5B0I0UNdQSmV678baZQliiAVB0J0FkibdREEN
        MNth6AtGxg/U09VOJHXVtdk=
X-Google-Smtp-Source: ABdhPJwxhL70vJ8ULdsfPNdjemzacc1H0DV5sjzUmA3E4qYSeYxKBEh/jL7f3oDJzlkSdh88PNHjcQ==
X-Received: by 2002:a05:6a00:22c8:b029:156:e7e:dcb3 with SMTP id f8-20020a056a0022c8b02901560e7edcb3mr4973953pfj.44.1603306551430;
        Wed, 21 Oct 2020 11:55:51 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id f5sm3120187pgi.86.2020.10.21.11.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 11:55:50 -0700 (PDT)
Date:   Wed, 21 Oct 2020 11:55:47 -0700
From:   "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
To:     Jun Li <jun.li@nxp.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "prabhakar.mahadev-lad.rj@bp.renesas.com" 
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH v4 2/4] device property: Add fwnode_is_compatible() and
 device_is_compatible() helpers
Message-ID: <20201021185547.GC444962@dtor-ws>
References: <1603098195-9923-1-git-send-email-jun.li@nxp.com>
 <1603098195-9923-2-git-send-email-jun.li@nxp.com>
 <20201019122516.GN4077@smile.fi.intel.com>
 <VE1PR04MB652805416A0A85E45FFD106E891F0@VE1PR04MB6528.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VE1PR04MB652805416A0A85E45FFD106E891F0@VE1PR04MB6528.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 20, 2020 at 11:13:47AM +0000, Jun Li wrote:
> 
> 
> > -----Original Message-----
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Monday, October 19, 2020 8:25 PM
> > To: Jun Li <jun.li@nxp.com>
> > Cc: heikki.krogerus@linux.intel.com; robh+dt@kernel.org;
> > rafael@kernel.org; gregkh@linuxfoundation.org; hdegoede@redhat.com;
> > lee.jones@linaro.org; mika.westerberg@linux.intel.com;
> > dmitry.torokhov@gmail.com; prabhakar.mahadev-lad.rj@bp.renesas.com;
> > laurent.pinchart+renesas@ideasonboard.com; linux-usb@vger.kernel.org;
> > devicetree@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Peter Chen
> > <peter.chen@nxp.com>
> > Subject: Re: [PATCH v4 2/4] device property: Add fwnode_is_compatible() and
> > device_is_compatible() helpers
> > 
> > On Mon, Oct 19, 2020 at 05:03:13PM +0800, Li Jun wrote:
> > > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > >
> > > Since there are also some ACPI platforms where the "compatible"
> > > property is used, introducing a generic helper function
> > > fwnode_is_compatible() that can be used with DT, ACPI and swnodes, and
> > > a wrapper function
> > > device_is_compatible() with it.
> > >
> > > The function calls of_device_is_comaptible() with OF nodes, and with
> > > ACPI and swnodes it matches the given string against the "compatible"
> > > string property array.
> > 
> > ...
> > 
> > > + * Match the compatible strings of @fwnode against @compat. Returns
> > > + positive
> > > + * value on match, and 0 when no matching compatible string is found.
> > 
> > Please move Returns... to a separate paragraph.
> 
> OK, will change.
> 
> > 
> > Btw, this is not true...
> > 
> > > +int fwnode_is_compatible(struct fwnode_handle *fwnode, const char
> > > +*compat) {
> > > +	int ret;
> > > +
> > > +	if (is_of_node(fwnode))
> > > +		return of_device_is_compatible(to_of_node(fwnode), compat);
> > > +
> > > +	ret = fwnode_property_match_string(fwnode, "compatible", compat);
> > > +
> > 
> > > +	return ret < 0 ? 0 : 1;
> > 
> > ...and this is at least strange after all.
> 
> of_device_is_compatible() will return positive value on match, and 0
> when no matching,
> fwnode_property_match_string() will return 0 if the property was found
> (success); and negative error code on failure. so the return conversion
> of fwnode_property_match_string () should work here.

Yes, but please make the function return bool instead of int.
of_device_is_compatible() returns "score", so it is int, but here we
only want yes/no.

So

	return fwnode_property_match_string(...) == 0;

Thanks.

-- 
Dmitry
