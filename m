Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9531EC0AA
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jun 2020 19:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgFBRFJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jun 2020 13:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbgFBRFI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jun 2020 13:05:08 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A30C05BD1E
        for <linux-usb@vger.kernel.org>; Tue,  2 Jun 2020 10:05:08 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id e4so13504255ljn.4
        for <linux-usb@vger.kernel.org>; Tue, 02 Jun 2020 10:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=xr0KJ1LOxzfJlehZwrrqgeIk6Abq/2mU4Zl87SrA1cI=;
        b=LDAKp9vhQe3ZNU7VEuHjMwkf4iC+jtAPX8xhazR4XNm5tmlBLRkQlw/qXxKkbywxkg
         dxYxB7lsAf8exqRbQ44Y+Y3JAXkTTqyND7vbuok0Fv7SxyGkdf8JbuxaK9eTN8rWiDG8
         dvL/VK0gomEyf7yRoVTmUGx9d/8ZwBKoI52eMnMfxE0+mdTz3Si0RY0MwDDVIED3Z42g
         aEvqt60zKl65HqWC0SkjX2O9jHiG2opIzaJWwCF0iKR3OZr6Ga1KmN0Smb6H5S8lOR2s
         tnMSMOQZTUltnxnxizI2IBb+nReFTTYmeZgVj69GvKSfju5nG2zuj2K2ZfHduRnmjmqE
         izqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=xr0KJ1LOxzfJlehZwrrqgeIk6Abq/2mU4Zl87SrA1cI=;
        b=UbwaffRtzPZvauYlviSxTSEuGRXirodhoDDqEw+pWNU5sHAT/VGrbq6g9QaechXgTO
         rLQBx1hV6CH21/Px0Zq+IQDRoYme8NjcoCoGnIvqz9OJaBL4UNMVKBV3KBRQVcPWLor5
         PQBLbVBxCiuuuv2B9zl8RmrLuNsWG0fnY/ToByxx4TzAqB+YYbiS9kEDHulh59r6fz4k
         YJDsVjYcuFaTCyvhlSy1RTk6EQ6Ogxdr4S2fiAEa6jLcZh2lilT5b+0U8E8G6JtKDRF3
         KaKaa3Z9Hrx6lVn0io/pdrckX+GZ7FtKCR9clS68ZDEewZ0/cSrpt1xITs0MZ8vrUmUp
         pODg==
X-Gm-Message-State: AOAM532o7/eE+/Kbmtx2/mXbrpUfN37ckx6cEMk+R2T1FYBCNt1HZmDa
        +BYmVOY+njfma0rjDZ2IdmU=
X-Google-Smtp-Source: ABdhPJxNHyQjmI/LJSQg6lvSBBSDxNVj5yJzsGkMsK8yXfT4ejqn6HtbEGXsHvM2qwH00hejEO/Qmw==
X-Received: by 2002:a2e:8002:: with SMTP id j2mr71676ljg.158.1591117506331;
        Tue, 02 Jun 2020 10:05:06 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id i24sm654592ljg.82.2020.06.02.10.05.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 10:05:05 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
        dri-devel@lists.freedesktop.org
Cc:     linux-usb@vger.kernel.org, sam@ravnborg.org,
        Noralf =?utf-8?Q?Tr=C3=B8?= =?utf-8?Q?nnes?= 
        <noralf@tronnes.org>
Subject: Re: [PATCH v3 6/6] usb: gadget: function: Add Generic USB Display support
In-Reply-To: <20200529175643.46094-7-noralf@tronnes.org>
References: <20200529175643.46094-1-noralf@tronnes.org> <20200529175643.46094-7-noralf@tronnes.org>
Date:   Tue, 02 Jun 2020 20:05:01 +0300
Message-ID: <87k10p1jr6.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

I missed this completely until now.
Noralf Tr=C3=B8nnes <noralf@tronnes.org> writes:
> This adds the gadget side support for the Generic USB Display. It presents
> a DRM display device as a USB Display configured through configfs.
>
> The display is implemented as a vendor type USB interface with one bulk
> out endpoint. The protocol is implemented using control requests.
> lz4 compressed framebuffer data/pixels are sent over the bulk endpoint.
>
> The DRM part of the gadget is placed in the DRM subsystem since it reaches
> into the DRM internals.

First and foremost, could this be done in userspace using the raw gadget
or f_fs?

> diff --git a/drivers/usb/gadget/function/f_gud_drm.c b/drivers/usb/gadget=
/function/f_gud_drm.c
> new file mode 100644
> index 000000000000..9a2d6bb9739f
> --- /dev/null
> +++ b/drivers/usb/gadget/function/f_gud_drm.c
> @@ -0,0 +1,678 @@
> +struct f_gud_drm {
> +	struct usb_function func;
> +	struct work_struct worker;

why do you need a worker?

> +	size_t max_buffer_size;
> +	void *ctrl_req_buf;
> +
> +	u8 interface_id;
> +	struct usb_request *ctrl_req;
> +
> +	struct usb_ep *bulk_ep;
> +	struct usb_request *bulk_req;

single request? Don't you want to amortize the latency of
queue->complete by using a series of requests?

> +	struct gud_drm_gadget *gdg;
> +
> +	spinlock_t lock; /* Protects the following members: */
> +	bool ctrl_pending;
> +	bool status_pending;
> +	bool bulk_pending;
> +	bool disable_pending;

could this be a single u32 with #define'd flags? That would be atomic,
right?

> +	u8 errno;

a global per-function error? Why?

> +	u16 request;
> +	u16 value;

also why? Looks odd

> +};
> +
> +static inline struct f_gud_drm *func_to_f_gud_drm(struct usb_function *f)

let the compiler inline for you

> +{
> +	return container_of(f, struct f_gud_drm, func);

could be a macro, but okay.

> +static inline struct f_gud_drm_opts *fi_to_f_gud_drm_opts(const struct u=
sb_function_instance *fi)

ditto

> +{
> +	return container_of(fi, struct f_gud_drm_opts, func_inst);

ditto

> +}
> +
> +static inline struct f_gud_drm_opts *ci_to_f_gud_drm_opts(struct config_=
item *item)

ditto

> +{
> +	return container_of(to_config_group(item), struct f_gud_drm_opts,
> +			    func_inst.group);

ditto

> +}
> +
> +#define F_MUD_DEFINE_BULK_ENDPOINT_DESCRIPTOR(name, addr, size)	\
> +	static struct usb_endpoint_descriptor name =3D {		\

const? Also, please check all the others

> +static void f_gud_drm_bulk_complete(struct usb_ep *ep, struct usb_reques=
t *req)
> +{
> +	struct f_gud_drm *fgd =3D req->context;
> +	unsigned long flags;
> +
> +	if (req->status || req->actual !=3D req->length)
> +		return;

so, if we complete with an erroneous status or a short packet, you'll
ignore it?

> +	spin_lock_irqsave(&fgd->lock, flags);
> +	fgd->bulk_pending =3D true;
> +	spin_unlock_irqrestore(&fgd->lock, flags);
> +
> +	queue_work(system_long_wq, &fgd->worker);

Do you need to offset this to a worker?

> +static int f_gud_drm_ctrl_req_set_buffer(struct f_gud_drm *fgd, void *bu=
f, size_t len)
> +{
> +	int ret;
> +
> +	if (len !=3D sizeof(struct gud_drm_req_set_buffer))
> +		return -EINVAL;
> +
> +	ret =3D gud_drm_gadget_set_buffer(fgd->gdg, buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret > fgd->max_buffer_size)
> +		return -EOVERFLOW;
> +
> +	fgd->bulk_req->length =3D ret;
> +
> +	return usb_ep_queue(fgd->bulk_ep, fgd->bulk_req, GFP_KERNEL);
> +}
> +
> +static void f_gud_drm_worker(struct work_struct *work)
> +{
> +	struct f_gud_drm *fgd =3D container_of(work, struct f_gud_drm, worker);
> +	bool ctrl_pending, bulk_pending, disable_pending;
> +	struct gud_drm_gadget *gdg =3D fgd->gdg;
> +	unsigned long flags;
> +	u16 request, value;
> +	int ret;
> +
> +	spin_lock_irqsave(&fgd->lock, flags);
> +	request =3D fgd->request;
> +	value =3D fgd->value;
> +	ctrl_pending =3D fgd->ctrl_pending;
> +	bulk_pending =3D fgd->bulk_pending;
> +	disable_pending =3D fgd->disable_pending;
> +	spin_unlock_irqrestore(&fgd->lock, flags);
> +
> +	pr_debug("%s: bulk_pending=3D%u ctrl_pending=3D%u disable_pending=3D%u\=
n",
> +		 __func__, bulk_pending, ctrl_pending, disable_pending);

could we use dev_dbg() at least?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl7Whr0ACgkQzL64meEa
mQZd7w/9HCSsPuAvqfSdZKyVKaqGvaImX0XpTnsEJ3coCppYA8tScqVEgYD+RCyp
tMwMnbm8lZ5PqMtQBuAeDXS1Ej7N78VVkQVRk4q124TE/FAvMtfDZsaC5dctvmuy
PJthbxS0OMc30PPV2LQfKFMM0Ch+9nmBN/o6DLBU+YIkMDaVjMDV9O9BvikmSmPw
Nmeal21+WDjFolUGCLy88i+NrIG8ySinLJG+GmvsG6DItOpv87UBT3sIsBfDvmWL
cg1QzXs+Mcrpn/IexESVuDUG/xRQDLYz1HC8MPhxDWcIgK9XPNULS9JcGWPzcThX
jPL3SsYg81njzMaXlA7j/fD/Ww1vEJHsgroO6oxGAuoxPvrcKj3Z5Kae24bhieBX
X8qRqUaNSAGVKgnF8eHv9GlJqxMKGypzojIJkwU6BZPQlvS99v3s68xrx5OIkCWg
Lui6lKQ4QtQC0KgUzdbSgT0nQUA+A/n7cDbgzVDTEm0BlVcoFNolrWj1pCU2I/qD
75ZGIzAliaImGeNxjGRrZ/8SRlz2zCuRuh7k0CyykNhaX9tKyonqmFOzcOOdtJOJ
/UK/HpSTuXBKlm28FEmlN4znoXvTzc0ZAIEOqp4aozYn+ShspnsPYjERJuxyGcNk
NHvpVowz+qTNbgnnMUqtJHqv3X03FX3pMfnqpAsWULH1NS5ZcZM=
=tTwq
-----END PGP SIGNATURE-----
--=-=-=--
