Return-Path: <linux-usb+bounces-35083-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FaqKLQzu2kVgwIAu9opvQ
	(envelope-from <linux-usb+bounces-35083-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 00:22:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9072C3CD7
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 00:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24F7C30DACCE
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 23:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A21B330D24;
	Wed, 18 Mar 2026 23:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H2DHbpJg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772D62E7179
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 23:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773876114; cv=pass; b=MoUtkcZIr8L08cwHU3r22IPxSSnvIv/zIl8Y9NutxtkdS2YvV9Uqio3e83SpYS1WWATYEk8u32sjTIQNFnQDqz0JOVT0IvznJgSRWQrCjofE5OOZJ7Homki/54s3pShNiL6wDbWTPdk+0EeMqQ8EbudNWYSER8O1dpZD+a0weys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773876114; c=relaxed/simple;
	bh=sWPkuLJXrcBX9S3aX4yM+gQyI9/bx+U9y1A0D2W1Bz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZbobhVUHr0paDgwYj+k7MfjSTzcWl+w4EPcRhunA46jjjg40B0rMlX0Hbh9yBbXMr9zqCrk2dENEk6xjcZMuTgFeps8Beeghwpn9t4D9gvg1M2XsNnDws6P0SMscsXVsnUeXM5umDVTspSEjxWWKCkxhenhEeK9BSsexlEBKzP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H2DHbpJg; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5091ed02c54so139461cf.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 16:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773876111; cv=none;
        d=google.com; s=arc-20240605;
        b=PsttOvjunX/LnjR/SJHjvBmoUb9HUkBjOdIyiw35lxsJjgp9op6P2Q4JBaK6upWqO7
         Tx1zD1MiBibZCWZnZ9Eo3ytvKOIpfQFzuH6pUthvnHXBffClnIXovJcRRpfcv87E63Bs
         +vUH09IN5eTGMSW0dT3gcv4i1kCJUSbNcJn2UKt7Zhgqd+Vg7lr5UusGLvYX28pZ8MHM
         Vw+ipeDPguLo27D2Oe6b91CuOzfeMmBDLSiKXmC/Kz+3BFkoMjaXo8r8AZchKsnnLVdK
         vBh85z4VGcRjVRIUfdHlzpmPk5nncOhuGuEffE9XHlexEGvAx1gdqBp+bzl/UhZzfeop
         ORCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m9rV6JpeFuPhu2T+JRvifOR+f3O83Iw8gXacOywKROQ=;
        fh=0YKmFXV/YUe/CqdVjBrPEsz3H9vIvJMENN0wJIITWjw=;
        b=eBKcdGL8+F4HVLEAY8j57Q5RcoTQiGwQ/ULcp7T5HMtTptJzFEDCveh2ls1A3uAHwf
         2Wp9ChFGJ2m6N1lA52yzNQCnyF8Rd4U2H2xVXn3WUUU/9awUKpqOs8yFGUK4Dp6IzY77
         ojH2yfdAVbl22WHUPR47nSkX/8PmcUVw9dskgPMlhwj98lSsDsDjxcW52OJtvBP7q6f6
         l9D1R5ihJbYTIpmHTe0avLa0/+D6s0RHbYOnwpqOznYbvsLz2MSMz9RtdSh1SW5P5Avw
         OY5NxwWrx6/qkI4VJFtxjvHzC77Ycqh+MCn8TpkNaNSpi16TMGUdx7NG8/cd940/zGiZ
         KE+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773876111; x=1774480911; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9rV6JpeFuPhu2T+JRvifOR+f3O83Iw8gXacOywKROQ=;
        b=H2DHbpJguw8NvIiLyeFMFnAd8A9NJl4xFdl7DohesIVytl9S61tLC/Ee1OvtUa//OV
         7d+7iaX26PR4bl/G/I9P6eVamYnoeStGJjlaCyyJaQ3hXl08BKpmG7UvDMsM82V5vNVu
         Ygeu0wFdZnhixWUrrsHKKlq3EApgNj6eQv/GS0FaHybmS9MHegGMJB9xTo0f+Wr6z6/7
         j+aD1DYTrzC6C3KgLDG1B9aZCmFBSWRMVerYj5SsXmy0CLN5aV8CUppXrVmq605TgHIc
         BtJ0x5GcwDiz9+C14QYEI2Opj/lE/LrtA5T41pgiS2tCSob4AE8BYTiBB7JfYobMrjQE
         2X+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773876111; x=1774480911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m9rV6JpeFuPhu2T+JRvifOR+f3O83Iw8gXacOywKROQ=;
        b=QemkjhEwBJ04z02VD4QgF/u+RBqN37Lv/3RYF+QTgHB2+6/qcRZm8Js2XSpyKsISNr
         lmcoKUulcMyR4Lzzi7nlYhhlyh7agDpjQL58r1H5RndOE0k1kFgVvsFn68Ffe/8gsGv0
         LOPGTNzx6kgPpE2rWJL7qLV6AWhHKI5JX9zTuAtt57ZzJ65IyGLnw4snTJRdDRTtF52h
         IJic3M2FPPjT6IwpR2Glp5cVYM6J/0B79pbfF1dtmDwFikoffF8SfivHauMj3GCKK7Cz
         eldjPU3QQ1VThHs/+eEpNsTAWRogFP6T0YaKqWBjFDWrcByTKcCS+cg9zDqrf2v5H3G0
         fcCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVULK+7IyuODO6z4rGjmS+xhJKnURbyvpwuay+6t6ghAEGQngLK4ZCZJLJ7xsdsCdJ8bN05OmVZtz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEsMCy4wVhBYi2UMCfXvOWn679CHi5fic3x+2GR8cwwSiLk6/v
	qinI3UEf9YLbw3JOp3SDCeDNowDxoKGkQLzcG6s4/Cj6Dt3TMMtYgsMbSvjuro73zwvXedKsmdn
	a3GG6E+qSrnGk8AHTccZsZ9CN4i1X8LcuHNcKdw/V
X-Gm-Gg: ATEYQzxAjj+qOv7GDYc0Rx+MTzvpIBgmJRN2ufbQ9t6yCd1JFr3CNozwXYtFfyM38dd
	l8oUkKtmg5p9TQsHVTx4KHfmjZ+OC440v0BDlqHYWTukwgFm/sqEZx6XtAEIsCkzPazIxd6bqLl
	Mandrdbir0xcs2KWOsi94WpH2iaxsBYaAvR3V0zZEZt3yu10vMyKsJkLnryClLLOzgs+rGN4RZW
	QY7K0HiBLKkLcyhzglJqETQy+3+IExatefPNZNSDQRR8rse90gymrQm6qbeXSDriUDrNBTfjLjt
	Os3EVRjOElla
X-Received: by 2002:a05:622a:58c:b0:509:45f:fdd2 with SMTP id
 d75a77b69052e-50b2747cab0mr3002981cf.15.1773876111071; Wed, 18 Mar 2026
 16:21:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309022205.28136-1-guanyulin@google.com> <20260309022205.28136-2-guanyulin@google.com>
 <505ab422-f933-4674-8f93-8744d0e67c6d@oss.qualcomm.com>
In-Reply-To: <505ab422-f933-4674-8f93-8744d0e67c6d@oss.qualcomm.com>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Wed, 18 Mar 2026 19:21:00 -0400
X-Gm-Features: AaiRm539Hmpj3e5uW-24en7eVbe4K9Ue0STys9HF6sxG6gvj_pbB9iJ_D2yzCoI
Message-ID: <CAOuDEK3b4BtHVYhLH_NkE1fP1-9ncqvAq6VedBzWLm=D_YDHQg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] usb: offload: move device locking to callers in offload.c
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com, perex@perex.cz, 
	tiwai@suse.com, quic_wcheng@quicinc.com, broonie@kernel.org, arnd@arndb.de, 
	christophe.jaillet@wanadoo.fr, xiaopei01@kylinos.cn, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, stable@vger.kernel.org, 
	Hailong Liu <hailong.liu@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35083-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,intel.com,perex.cz,suse.com,quicinc.com,kernel.org,arndb.de,wanadoo.fr,kylinos.cn,vger.kernel.org,oppo.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guanyulin@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.976];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0C9072C3CD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 4:17=E2=80=AFPM Wesley Cheng
<wesley.cheng@oss.qualcomm.com> wrote:
>
> On 3/8/2026 7:22 PM, Guan-Yu Lin wrote:
> >
> > @@ -27,31 +28,25 @@ int usb_offload_get(struct usb_device *udev)
> >   {
> >       int ret;
> >
> > -     usb_lock_device(udev);
> > -     if (udev->state =3D=3D USB_STATE_NOTATTACHED) {
> > -             usb_unlock_device(udev);
> > +     device_lock_assert(&udev->dev);
> > +
> > +     if (udev->state =3D=3D USB_STATE_NOTATTACHED)
> >               return -ENODEV;
> > -     }

Could be removed. Since the udev is in USB_STATE_NOTATTACHED. I expect
the data structure being cleaned afterwards, so actually counter value
might not be important at this moment.

> >
> >       if (udev->state =3D=3D USB_STATE_SUSPENDED ||
> > -                udev->offload_at_suspend) {
> > -             usb_unlock_device(udev);
> > +         udev->offload_at_suspend)
> >               return -EBUSY;
> > -     }
> >

This check is still required. Because the suspend/resume process
depends on the counter value, we can't modify the counter value while
the device is suspended. If we do so, we will have an unbalanced
suspend resume operation.

However, we might only need to check for udev->offload_at_suspend (if
we ensure the device is active when we want to incremant the counter):
1. If the offload_usage_count is 0, we won't decrement counts at this momen=
t.
2. If the offload_usage_count is not 0, the offload_at_suspend flag
will be true anyway.

>
> Do we really need to be explicitly checking for the usb device state befo=
re
> we touch the offload_usage count?  In the end, its a reference count that
> determines how many consumers are active for a specific interrupter, so m=
y
> question revolves around if we need to have such strict checks.
>

Please find the explanation for each check above.

> >       /*
> >        * offload_usage could only be modified when the device is active=
, since
> >        * it will alter the suspend flow of the device.
> >        */
> >       ret =3D usb_autoresume_device(udev);
> > -     if (ret < 0) {
> > -             usb_unlock_device(udev);
> > +     if (ret < 0)
> >               return ret;
> > -     }
> >
>
> IMO this should be handled already by the class driver, and if not, what =
is
> the harm?
>

We can only increment the usage count when the device is active. For
counter decrement, the device could be in any state.

My initial design is to resume the device and then modify the usage
count. Another option is to check only whether the USB device is
active via pm_runtime_get_if_active, and leave the device-resuming
effort to the class driver. Do you think this is the better approach?

> >       udev->offload_usage++;
> >       usb_autosuspend_device(udev);
> > -     usb_unlock_device(udev);
> >
> >       return ret;
> >   }
> > @@ -64,6 +59,7 @@ EXPORT_SYMBOL_GPL(usb_offload_get);
> >    * The inverse operation of usb_offload_get, which drops the offload_=
usage of
> >    * a USB device. This information allows the USB driver to adjust its=
 power
> >    * management policy based on offload activity.
> > + * The caller must hold @udev's device lock.
> >    *
> >    * Return: 0 on success. A negative error code otherwise.
> >    */
> > @@ -71,33 +67,27 @@ int usb_offload_put(struct usb_device *udev)
> >   {
> >       int ret;
> >
> > -     usb_lock_device(udev);
> > -     if (udev->state =3D=3D USB_STATE_NOTATTACHED) {
> > -             usb_unlock_device(udev);
> > +     device_lock_assert(&udev->dev);
> > +
> > +     if (udev->state =3D=3D USB_STATE_NOTATTACHED)
> >               return -ENODEV;
> > -     }
> >
> >       if (udev->state =3D=3D USB_STATE_SUSPENDED ||
> > -                udev->offload_at_suspend) {
> > -             usb_unlock_device(udev);
> > +         udev->offload_at_suspend)
> >               return -EBUSY;
> > -     }
> >
>
> During your testing, did you ever run into any unbalanced counter issues
> due to the above early exit conditions?
>
> I guess these are all just questions to see if we can remove the need to
> lock the udev mutex, and move to a local mutex for the offload framework.
> That would address the locking concerns being brought up by Greg, etc...
>
> Thanks
> Wesley Cheng
>

While developing the initial patch set, I did encounter the counter imbalan=
ce.

Following the discussion, we could move the device resume effort to
the class driver. This way we only need to check if the device is
active before manipulating the offload usage counter, which doesn't
require a device lock. Is there any concern with this approach?

Regards,
Guan-Yu

