Return-Path: <linux-usb+bounces-1320-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EB27BEFAA
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 02:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77B401C20A11
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 00:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D4337E;
	Tue, 10 Oct 2023 00:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q1L2Ew8S"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A094717E
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 00:20:48 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC889F
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 17:20:46 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so26096a12.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Oct 2023 17:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696897245; x=1697502045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDqndGGh7MZCzNbyA7vFVrmWG4+Liupi5noCib/AUdM=;
        b=q1L2Ew8S8aTwsyoTDNwzGp7wlHxHuUCJWhRTVNlUVtfKSf5A6U2wBHGK5uqPVyFYpc
         iIRQ7vrgC5ZyMr/I4vLf037s4/1/7DiBN4AGlgEwP1vMR48pCLpvW+YEXvFUsSs5UFJJ
         p4DNjfPrDKR/qwH4EPBgNn1i1dmobJtCIr62k81YCNTL8ZLBFe27VbvI3Cq2pU7y4oT1
         BCOsb0FR55NAGG3Fo5tw+hPJUFe36uEY34hQA0ud4rHdtIrQEdil3ZKbTd1C8Qtk6x4+
         7u0ZZYe/A3fV8uyD/BMNHHrOpxNjAEJia0TwmoQZazl7SL6qFzyEQMFCoPg73ZSMuJR8
         KWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696897245; x=1697502045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDqndGGh7MZCzNbyA7vFVrmWG4+Liupi5noCib/AUdM=;
        b=trFsT8nkeCY9fNsLmKFtqIVkjtsPkfgqiEvmHMd1alIQifSbXrhM3VOqa0LxsBjZBk
         V5D/GVYnL6tNfIoSclPG7dZTVOGim1yJuik//f1rxTl9g6S5qybTXTAXNrP46AFmzY41
         tsl+ymvLkFPI1mwbY68pNTqQsPEpWzZ96ensGZ1g7m7EFgeXy2KmR0deNLBNfKSTSL7s
         aDOPedIw+XFCl0VegBfv4oyFcTHEayzhEhmNb9ZjpSt4EJZlaKGIHFU5YcBPTVK829oE
         mn5y4Xq7964C2U+QaCadXH/BQ1re/6ZMpkFY734F1VMqz9O/9KlaqbVM0xeiTzEcEaEE
         3Bvg==
X-Gm-Message-State: AOJu0Yx6Q5NQQFiIWRFG2flBKSk7RdAoOlDqRpA1ZJ4WSY7eLxXV4b9L
	US9G0WN9hlHj7Fa3nx723r8mVjWouZSdsaRa5OL2FQ==
X-Google-Smtp-Source: AGHT+IHMom+4+aNMUFMmbGY4dzliPWWRICuPlJXq1EOZgJ0XfRXIEacSjT2d6E3A20S7XXi0YTe0vZdG4Vabkelkdo4=
X-Received: by 2002:a50:c051:0:b0:538:1d3a:d704 with SMTP id
 u17-20020a50c051000000b005381d3ad704mr466255edd.1.1696897244899; Mon, 09 Oct
 2023 17:20:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009142005.21338-1-quic_kriskura@quicinc.com>
 <20231009142005.21338-2-quic_kriskura@quicinc.com> <CANP3RGfEk2DqZ3biyN78ycQYbDxCEG+H1me2vnEYuwXkNdXnTA@mail.gmail.com>
In-Reply-To: <CANP3RGfEk2DqZ3biyN78ycQYbDxCEG+H1me2vnEYuwXkNdXnTA@mail.gmail.com>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Mon, 9 Oct 2023 17:20:33 -0700
Message-ID: <CANP3RGcCpNOuVpdV9n0AFxZo-wsfwi8OfYgBk1WHNHaEd-4V-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: gadget: ncm: Add support to update
 wMaxSegmentSize via configfs
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, onathan Corbet <corbet@lwn.net>, 
	Linyu Yuan <quic_linyyuan@quicinc.com>, linux-usb@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_ppratap@quicinc.com, quic_wcheng@quicinc.com, quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 9, 2023 at 5:17=E2=80=AFPM Maciej =C5=BBenczykowski <maze@googl=
e.com> wrote:
>
> On Mon, Oct 9, 2023 at 7:20=E2=80=AFAM Krishna Kurapati
> <quic_kriskura@quicinc.com> wrote:
> >
> > Currently the NCM driver restricts wMaxSegmentSize that indicates
> > the datagram size coming from network layer to 1514. However the
> > spec doesn't have any limitation. For P2P connections over NCM,
> > increasing MTU helps increasing throughput.
> >
> > Add support to configure this value before configfs symlink is
> > created. Also since the NTB Out/In buffer sizes are fixed at 16384
> > bytes, limit the segment size to an upper cap of 15014. Set the
> > default MTU size for the ncm interface during function bind before
> > network interface is registered allowing MTU to be set in parity
> > with wMaxSegmentSize.
> >
> > Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> > ---
> >  drivers/usb/gadget/function/f_ncm.c | 51 +++++++++++++++++++++++++++++
> >  drivers/usb/gadget/function/u_ncm.h |  2 ++
> >  2 files changed, 53 insertions(+)
> >
> > diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/f=
unction/f_ncm.c
> > index feccf4c8cc4f..eab297b22200 100644
> > --- a/drivers/usb/gadget/function/f_ncm.c
> > +++ b/drivers/usb/gadget/function/f_ncm.c
> > @@ -103,6 +103,8 @@ static inline struct f_ncm *func_to_ncm(struct usb_=
function *f)
> >  /* Delay for the transmit to wait before sending an unfilled NTB frame=
. */
> >  #define TX_TIMEOUT_NSECS       300000
> >
> > +#define MAX_DATAGRAM_SIZE      15014
> > +
> >  #define FORMATS_SUPPORTED      (USB_CDC_NCM_NTB16_SUPPORTED |  \
> >                                  USB_CDC_NCM_NTB32_SUPPORTED)
> >
> > @@ -1408,6 +1410,7 @@ static int ncm_bind(struct usb_configuration *c, =
struct usb_function *f)
> >         ncm_opts =3D container_of(f->fi, struct f_ncm_opts, func_inst);
> >
> >         if (cdev->use_os_string) {
> > +               ncm_opts->net->mtu =3D (ncm_opts->max_segment_size - ET=
H_HLEN);
> >                 f->os_desc_table =3D kzalloc(sizeof(*f->os_desc_table),
> >                                            GFP_KERNEL);
> >                 if (!f->os_desc_table)
> > @@ -1469,6 +1472,8 @@ static int ncm_bind(struct usb_configuration *c, =
struct usb_function *f)
> >
> >         status =3D -ENODEV;
> >
> > +       ecm_desc.wMaxSegmentSize =3D ncm_opts->max_segment_size;
>
> I think you need byte swap here.
>
> > +
> >         /* allocate instance-specific endpoints */
> >         ep =3D usb_ep_autoconfig(cdev->gadget, &fs_ncm_in_desc);
> >         if (!ep)
> > @@ -1569,11 +1574,56 @@ USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT(ncm);
> >  /* f_ncm_opts_ifname */
> >  USB_ETHERNET_CONFIGFS_ITEM_ATTR_IFNAME(ncm);
> >
> > +static ssize_t ncm_opts_max_segment_size_show(struct config_item *item=
,
> > +                                             char *page)
> > +{
> > +       struct f_ncm_opts *opts =3D to_f_ncm_opts(item);
> > +       u32 segment_size;
> > +
> > +       mutex_lock(&opts->lock);
> > +       segment_size =3D opts->max_segment_size;
> > +       mutex_unlock(&opts->lock);
> > +
> > +       return sprintf(page, "%u\n", segment_size);
> > +}
> > +
> > +static ssize_t ncm_opts_max_segment_size_store(struct config_item *ite=
m,
> > +                                              const char *page, size_t=
 len)
> > +{
> > +       struct f_ncm_opts *opts =3D to_f_ncm_opts(item);
> > +       int ret;
> > +       u32 segment_size;
> > +
> > +       mutex_lock(&opts->lock);
> > +       if (opts->refcnt) {
> > +               ret =3D -EBUSY;
> > +               goto out;
> > +       }
> > +
> > +       ret =3D kstrtou32(page, 0, &segment_size);
> > +       if (ret)
> > +               goto out;
> > +
> > +       if (segment_size > MAX_DATAGRAM_SIZE) {
> > +               ret =3D -EINVAL;
> > +               goto out;
> > +       }
> > +
> > +       opts->max_segment_size =3D segment_size;
> > +       ret =3D len;
> > +out:
> > +       mutex_unlock(&opts->lock);
> > +       return ret;
> > +}
> > +
> > +CONFIGFS_ATTR(ncm_opts_, max_segment_size);
> > +
> >  static struct configfs_attribute *ncm_attrs[] =3D {
> >         &ncm_opts_attr_dev_addr,
> >         &ncm_opts_attr_host_addr,
> >         &ncm_opts_attr_qmult,
> >         &ncm_opts_attr_ifname,
> > +       &ncm_opts_attr_max_segment_size,
> >         NULL,
> >  };
> >
> > @@ -1616,6 +1666,7 @@ static struct usb_function_instance *ncm_alloc_in=
st(void)
> >                 kfree(opts);
> >                 return ERR_CAST(net);
> >         }
> > +       opts->max_segment_size =3D cpu_to_le16(ETH_FRAME_LEN);
>
> and not here.  ie. max_segment_size should be native endian
>
> >         INIT_LIST_HEAD(&opts->ncm_os_desc.ext_prop);
> >
> >         descs[0] =3D &opts->ncm_os_desc;
> > diff --git a/drivers/usb/gadget/function/u_ncm.h b/drivers/usb/gadget/f=
unction/u_ncm.h
> > index 5408854d8407..d3403cf13f17 100644
> > --- a/drivers/usb/gadget/function/u_ncm.h
> > +++ b/drivers/usb/gadget/function/u_ncm.h
> > @@ -31,6 +31,8 @@ struct f_ncm_opts {
> >          */
> >         struct mutex                    lock;
> >         int                             refcnt;
> > +
> > +       u32                             max_segment_size;
> >  };
> >
> >  #endif /* U_NCM_H */
> > --
> > 2.42.0
> >
>
> That said, I don't really follow what this is doing...

Also

static struct usb_cdc_ether_desc ecm_desc =3D {
...
.wMaxSegmentSize =3D cpu_to_le16(ETH_FRAME_LEN),

^ I think this should be deleted now, right?  since it's always overwritten=
?
And if it isn't always overwritten, that would be a bug I think, cause
what happens if you bring up 2 ncm devices and only change the setting
on the 1st?

