Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0552224911A
	for <lists+linux-usb@lfdr.de>; Wed, 19 Aug 2020 00:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgHRWk3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 18:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727098AbgHRWkZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 18:40:25 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2972C061389
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 15:40:24 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id t10so23963881ejs.8
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 15:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rvTyXfKQHvF1rAa0aIO+a3yZRMMY5fVxsmOfoWaMmWE=;
        b=bXnt++2FsjIkwULs3rYhBCfwmUhetGlWy6/aCC592AX3hgGxW/DKZgDB53PwuAFnIT
         WtS2FUIznwOhjL6g26KEOM7WIL47w91qIpnqBt5ZjoL7Wc9Rlwi5O3gZyxhTzL/+pC4v
         ZL14DvdAkDWZkoxuYk99dYIOWa+qAy03q2YehSS7cxR8zINC7vbPR1jtNcW6d45FlwJQ
         wQAEojxwtZbJ2IxP/9P2oez1pRWwtrvNGrbsLAcIp3R9N01pQKIRvMz/sPzDrEXLbhC6
         ZMgnV2JsBSNk8dnLHM/ajx0ph4LhW+daNL+WkXjP7dkvNGDNqZNfN5/50g/YkQMS+pFy
         5vHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rvTyXfKQHvF1rAa0aIO+a3yZRMMY5fVxsmOfoWaMmWE=;
        b=kdegBALPKrihCjoTkctMtLkA4L79qB2B//UUPNe0dQsL39rPrjJT2Z1cbElRkptGwB
         FN/yWPq3l3otIdPnxqv/tY5W7M11glJhVS9rjqraXrnByCvr2h24+KLOMgz7ITjEcoeh
         fOToE/e2XZGlk+6WcfJlB5qf3ybT4CIdVxY0ZfRIkVUlCsG8sZVB2tgvS6UuRHOVXwPe
         kD8/Sxf2SgHoKwqGMTeDs2IODCcWmKJLixl7mJhZ9FVzrqudeEpyUGRGLbnDeRSsAJBO
         tt48RJ+YFA/A1WKDjlnCtDtw9VmC298r7EQJN+sTu9QnmpxGwpq9tQaKk3tJNc/n5ACL
         nT8A==
X-Gm-Message-State: AOAM5304JWRwsnX6bcHckYDulRB718gVeTveVRxiqeXyYAURYi6AUc9j
        hb6GQqB55Icb+GlgVLiua7qcsv/PWUGtX3U4xdw=
X-Google-Smtp-Source: ABdhPJwusCIsUxn6O3e5SGyxv8o+tSb0UkHQfL4D9ccHr33W1hJWNdlGkcZvSwrD8c+snK55gArttflLgO21XKksOfA=
X-Received: by 2002:a17:906:600f:: with SMTP id o15mr21747175ejj.529.1597790422236;
 Tue, 18 Aug 2020 15:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200818165848.4117493-1-lorenzo@google.com> <20200818165848.4117493-3-lorenzo@google.com>
In-Reply-To: <20200818165848.4117493-3-lorenzo@google.com>
From:   =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Date:   Tue, 18 Aug 2020 15:40:11 -0700
Message-ID: <CAHo-Oozepnrdw1ng1XvFURYZPc9L7FkmiMDJMsZ76PEyuDt8jw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] usb: gadget: f_ncm: allow using NCM in SuperSpeed
 Plus gadgets.
To:     Lorenzo Colitti <lorenzo@google.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I'm very confused by the location of the MaxBurst parameter.
All the dongles I've looked at seem to place MaxBurst just after MaxPacketSize,
and not in a separate descriptor (and don't place burst on the
status/config channel).

wMaxPacketSize     0x0400  1x 1024 bytes
bInterval               0
bMaxBurst               3

What does "lsusb -d ... -v" show from the host side?

Maybe things are pretty misconfigured?  Or maybe the dongles don't
match the spec...

On Tue, Aug 18, 2020 at 9:59 AM Lorenzo Colitti <lorenzo@google.com> wrote:
>
> Currently, using f_ncm in a SuperSpeed Plus gadget results in
> an oops in config_ep_by_speed because ncm_set_alt passes in NULL
> ssp_descriptors. Fix this by defining new descriptors for
> SuperSpeed Plus. (We cannot re-use the existing definitions for
> the SuperSpeed descriptors, even though they are mostly the same,
> because they are not fixed initializers).
>
> Tested: enabled f_ncm on a dwc3 gadget and 10Gbps link, ran iperf
> Signed-off-by: Lorenzo Colitti <lorenzo@google.com>
> ---
>  drivers/usb/gadget/function/f_ncm.c | 76 ++++++++++++++++++++++++++++-
>  1 file changed, 75 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
> index 57ccf30c6c..01242454d5 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -400,6 +400,75 @@ static struct usb_descriptor_header *ncm_ss_function[] = {
>         NULL,
>  };
>
> +/* super speed plus support: */
> +
> +static struct usb_endpoint_descriptor ssp_ncm_notify_desc = {
> +       .bLength =              USB_DT_ENDPOINT_SIZE,
> +       .bDescriptorType =      USB_DT_ENDPOINT,
> +
> +       .bEndpointAddress =     USB_DIR_IN,
> +       .bmAttributes =         USB_ENDPOINT_XFER_INT,
> +       .wMaxPacketSize =       cpu_to_le16(NCM_STATUS_BYTECOUNT),
> +       .bInterval =            USB_MS_TO_HS_INTERVAL(NCM_STATUS_INTERVAL_MS)
> +};
> +
> +static struct usb_ss_ep_comp_descriptor ssp_ncm_notify_comp_desc = {
> +       .bLength =              sizeof(ssp_ncm_notify_comp_desc),
> +       .bDescriptorType =      USB_DT_SS_ENDPOINT_COMP,
> +
> +       /* the following 3 values can be tweaked if necessary */
> +       .bMaxBurst =            15,
> +       /* .bmAttributes =      0, */
> +       .wBytesPerInterval =    cpu_to_le16(NCM_STATUS_BYTECOUNT),
> +};
> +
> +static struct usb_endpoint_descriptor ssp_ncm_in_desc = {
> +       .bLength =              USB_DT_ENDPOINT_SIZE,
> +       .bDescriptorType =      USB_DT_ENDPOINT,
> +
> +       .bEndpointAddress =     USB_DIR_IN,
> +       .bmAttributes =         USB_ENDPOINT_XFER_BULK,
> +       .wMaxPacketSize =       cpu_to_le16(1024),
> +};
> +
> +static struct usb_endpoint_descriptor ssp_ncm_out_desc = {
> +       .bLength =              USB_DT_ENDPOINT_SIZE,
> +       .bDescriptorType =      USB_DT_ENDPOINT,
> +
> +       .bEndpointAddress =     USB_DIR_OUT,
> +       .bmAttributes =         USB_ENDPOINT_XFER_BULK,
> +       .wMaxPacketSize =       cpu_to_le16(1024),
> +};
> +
> +static struct usb_ss_ep_comp_descriptor ssp_ncm_bulk_comp_desc = {
> +       .bLength =              sizeof(ssp_ncm_bulk_comp_desc),
> +       .bDescriptorType =      USB_DT_SS_ENDPOINT_COMP,
> +
> +       /* the following 2 values can be tweaked if necessary */
> +       .bMaxBurst =            15,
> +       /* .bmAttributes =      0, */
> +};
> +
> +static struct usb_descriptor_header *ncm_ssp_function[] = {
> +       (struct usb_descriptor_header *) &ncm_iad_desc,
> +       /* CDC NCM control descriptors */
> +       (struct usb_descriptor_header *) &ncm_control_intf,
> +       (struct usb_descriptor_header *) &ncm_header_desc,
> +       (struct usb_descriptor_header *) &ncm_union_desc,
> +       (struct usb_descriptor_header *) &ecm_desc,
> +       (struct usb_descriptor_header *) &ncm_desc,
> +       (struct usb_descriptor_header *) &ssp_ncm_notify_desc,
> +       (struct usb_descriptor_header *) &ssp_ncm_notify_comp_desc,
> +       /* data interface, altsettings 0 and 1 */
> +       (struct usb_descriptor_header *) &ncm_data_nop_intf,
> +       (struct usb_descriptor_header *) &ncm_data_intf,
> +       (struct usb_descriptor_header *) &ssp_ncm_in_desc,
> +       (struct usb_descriptor_header *) &ssp_ncm_bulk_comp_desc,
> +       (struct usb_descriptor_header *) &ssp_ncm_out_desc,
> +       (struct usb_descriptor_header *) &ssp_ncm_bulk_comp_desc,
> +       NULL,
> +};
> +
>  /* string descriptors: */
>
>  #define STRING_CTRL_IDX        0
> @@ -1502,8 +1571,13 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
>         ss_ncm_notify_desc.bEndpointAddress =
>                 fs_ncm_notify_desc.bEndpointAddress;
>
> +       ssp_ncm_in_desc.bEndpointAddress = fs_ncm_in_desc.bEndpointAddress;
> +       ssp_ncm_out_desc.bEndpointAddress = fs_ncm_out_desc.bEndpointAddress;
> +       ssp_ncm_notify_desc.bEndpointAddress =
> +               fs_ncm_notify_desc.bEndpointAddress;
> +
>         status = usb_assign_descriptors(f, ncm_fs_function, ncm_hs_function,
> -                       ncm_ss_function, NULL);
> +                       ncm_ss_function, ncm_ssp_function);
>         if (status)
>                 goto fail;
>
> --
> 2.28.0.220.ged08abb693-goog
>
